package com.dcits.supervise.pecr.generateReport.impl;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import org.apache.log4j.Logger;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.transaction.annotation.Transactional;
import com.dcits.supervise.pecr.feedbackreport.service.ReportFeedBackMessageService;
import com.dcits.supervise.pecr.generateReport.entity.NeedReportDetail;
import com.dcits.supervise.pecr.generateReport.entity.ReportAndBackMessageEnt;
import com.dcits.supervise.pecr.generateReport.service.ReportMessageManager;
import com.dcits.supervise.pecr.util.CreateSerialNumber;
import com.dcits.supervise.pecr.util.FileUtil;
import com.dcits.supervise.pecr.util.PecrConstantUtil;


/**
 * 个人担保账户信息生成报文模块
 * 
 * @author munan
 *
 */
public class GenerateInSecAcctInfRp extends AbstractGenerateReport {

	private final static Logger logger = Logger.getLogger(GenerateInSecAcctInfRp.class);

	public Properties properties;
	
	private String reportFilePath;

	public ReportMessageManager reportMessageService;
	
	private static String table_name = "I_GUAR_ACCT_BS";

	private static String PACKET_KEY = "PDA_GUAR_ACCT_BS_SGMT_ID";
	
	private int count =0;
	
	private String CCRC_ORG_CODE = "";

	public GenerateInSecAcctInfRp(Properties properties, ReportMessageManager reportMessageService) {
		this.properties = properties;
		this.reportMessageService = reportMessageService;
	}

	@Override
	public Properties getProperties() {
		return this.properties;
	}

	@Override
	public Map<String, Object> generateBody(NeedReportDetail needReportDetail, String name,
			ReportFeedBackMessageService reportFeedBackMessageService) throws Exception {
		String reportName = "";
		//返回结果集合
		Map<String, Object> reportMap = new HashMap<>();
		reportMap.put("resultCode", "SUCCESS");
		reportMap.put("resultMsg", "生成报文文件成功");
		Properties properties2 = PropertiesLoaderUtils.loadAllProperties("serverThread.properties");
		//properties2 = PropertiesLoaderUtils.loadAllProperties("serverThread.properties");
		//获取根路径
		String saveCreateReportPath = properties.getProperty("saveCreateReportPath");
		//循环几次生成一个文件
		int fileForNum = Integer.parseInt(properties2.get("fileForNum").toString());
		
		logger.info("XML格式BODY内容生成执行开始");
		/**
		 * 1:查询条数，拆分10000条数据为一次生成报文的内容 2：for循环(拆分的次数){ （1）生成一个stringBuffer
		 * （2）组装插入生成报文管理表的数据 }，
		 */
		List<Map<String, StringBuffer>> sbList = new ArrayList<>();
		Map<String, Object> reportCount = new HashMap<>();
		// 最大每页数据条数
		int pageSize = Integer.parseInt(properties.getProperty("saveMaxDataNumb"));
		// 获取要生成的报文总条数
		reportCount.put("table_name", table_name);
		reportCount.put("rpt_date", needReportDetail.getRptDate());
		reportCount.put("company", needReportDetail.getCompany());
		//信息记录类型
		reportCount.put("INF_REC_TYPE", PecrConstantUtil.IN_SEC_ACCT_INF);
		count = reportMessageService.getReportCount(reportCount);
		if (count == 0) {
			logger.info("没有符合条件的数据");
			reportMap.put("resultCode", "ERROR");
			reportMap.put("resultMsg", "没有符合条件的数据");
			return reportMap;
		}
		//20210330,新增全部修改数据状态30-->85
		reportMessageService.updateReportDataStatus(reportCount);
		
		//获取生成报文所需要的区构码
		String company = needReportDetail.getCompany().get(0);
		List<Map<String, Object>> orgLists = reportMessageService.get14OrgCode(company);
		if(orgLists != null && orgLists.size()>0){
			CCRC_ORG_CODE = orgLists.get(0).get("ORG_CODE_FOURTEEN").toString();
		}else{
			logger.info("---------------------------获取生成报文名所需的区构码失败：FAILED----------------------------------");
		}
		needReportDetail.setRownum(pageSize+1);
		// 通过限定每页数据的条数将获取的数据分段
		List<ReportAndBackMessageEnt> listRpMEnt = new ArrayList<ReportAndBackMessageEnt>();
		//获取本次生成报文，以pageSize为批量操作量级需要进行多少次循环。
		int forNum = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		
		//总的循环数除以设置的标准循环次数，该变量表示本次报文生成的数据量需要几个文件
		int num = forNum/fileForNum+(forNum%fileForNum == 0 ? 0 : 1);
		
		//numTotal：代表本次报文生成涉及的数据量需要生成几个报文文件，数组中每一项代表一个报文文件以及报文文件的数据量。
		int[] numTotal = new int[num];
		if(num !=1){
			for(int i = 0;i<num;i++){
				if(i == num-1){
					numTotal[i]=count-(i*pageSize*fileForNum);
				}else{
					numTotal[i]=fileForNum*(pageSize);
				}
			}
		}else{
			numTotal[0] = count;
		}
		//控制数组numTotal中的序号
		int forTop = 0;
		int toalNum=0;
		
		Map<String, Object> rpmap = new HashMap<String, Object>();
		//每次查询1000条数据，进行相关报文的组装拼接然后写入报文文件中
		for (int f = 0; f <forNum; f++) {
			List<Map<String, Object>> list = null;
			// 更新状态为“生成中”
			logger.info("开始更改状态为生成中");
			needReportDetail.setBusinessState(PecrConstantUtil.BUSINESS_STATUS_90);
			updateBusinessState(needReportDetail);
			logger.info("更改状态完成");
			
			reportCount.clear();
			reportCount.put("rpt_date", needReportDetail.getRptDate());
			//+1,是因为mapper文件中使用的是<号
			reportCount.put("pageSize", pageSize+1);
			reportCount.put("pk", needReportDetail.getSpecialObj());
			reportCount.put("company", needReportDetail.getCompany());
			reportCount.put("INF_REC_TYPE", PecrConstantUtil.IN_SEC_ACCT_INF);
			//获取组织个人担保账户报文的信息
			list = reportMessageService.dataGuarAcctBsSgmtlist(reportCount);
			
			// 存放报文名和对应数据ID的map
			List<String> pdaid = new ArrayList<String>();
			List<Map<String,String>> pkColnumList = new ArrayList<Map<String,String>>();
			//利用List集合的有序性
			for(int i=0;i< list.size();i++){
				Map<String, Object> guarAcctBsMap =list.get(i);
				String pk = guarAcctBsMap.get("PDA_GUAR_ACCT_BS_SGMT_ID").toString();
				//代表每一个主键在报文文件中的行数（报文头不算）
				String colnum = String.valueOf(((i+1)+(f*pageSize)) % (pageSize*fileForNum));
				pdaid.add(pk);
				Map<String,String> mapTmp = new HashMap<String,String>();
				mapTmp.put("pk", pk);
				mapTmp.put("colnum", colnum);
				pkColnumList.add(mapTmp);
			}
			
			// 获取相关还款责任人段数据（通过order by 字段PDA_GUAR_ACCT_BS_SGMT_ID
			// 将相同的连续放在一起，其外获取每一种相同PDA_GUAR_ACCT_BS_SGMT_ID的条数也返回到当前数据中 ）
			// 依据返回结果，将相同PDA_GUAR_ACCT_BS_SGMT_ID的数据放入一个list中，在将PDA_GUAR_ACCT_BS_SGMT_ID的值作为key形成一个map，方便其他标识段的生成和减少频繁数据库的访问
			List<Map<String, Object>> rltlist = reportMessageService.getRLTRepymtRpMsgByFactor(pdaid);
			//放置相关还款责任人信息
			Map<String, List<Map<String, Object>>> rltmap = new HashMap<String, List<Map<String, Object>>>();
			if(rltlist!=null){
				for (int i = 0; i < rltlist.size();) {
					int tempNum = Integer.parseInt((rltlist.get(i).get("NUM")).toString());
					String tempName = rltlist.get(i).get("PDA_GUAR_ACCT_BS_SGMT_ID").toString();
					//每个PDA_GUAR_ACCT_BS_SGMT_ID或者说是一个客户对应的相关还款责任人
					List<Map<String, Object>> s = new ArrayList<Map<String, Object>>();
					for (int j = i; j < (i + tempNum);) {
						s.add(rltlist.get(j));
						j++;
					}
					i = i + tempNum;
					rltmap.put(tempName, s);
				}
			}
			
			//获取抵质押物信息段
		    // 将相同的连续放在一起，其外获取每一种相同PDA_GUAR_ACCT_BS_SGMT_ID的条数也返回到当前数据中 ）
			// 依据返回结果，将相同PDA_GUAR_ACCT_BS_SGMT_ID的数据放入一个list中，在将PDA_GUAR_ACCT_BS_SGMT_ID的值作为key形成一个map，方便其他标识段的生成和减少频繁数据库的访问
			/*List<Map<String, Object>> mcclist = reportMessageService.getGuarMccRpMsgByFactor(pdaid);
			//放置抵质押物信息
			Map<String, List<Map<String, Object>>> mccmap = new HashMap<String, List<Map<String, Object>>>();
			if(mcclist!=null){
				for (int i = 0; i < mcclist.size();) {
					int tempNum = Integer.parseInt((mcclist.get(i).get("NUM")).toString());
					String tempName = mcclist.get(i).get("PDA_GUAR_ACCT_BS_SGMT_ID").toString();
					//每个PDA_GUAR_ACCT_BS_SGMT_ID或者说是一个客户对应的抵质押物信息
					List<Map<String, Object>> s = new ArrayList<Map<String, Object>>();
					for (int j = i; j < (i + tempNum);) {
						s.add(mcclist.get(j));
						j++;
					}
					i = i + tempNum;
					mccmap.put(tempName, s);
				}
			}*/
			// 开始生成xml格式的报文内容
			StringBuffer sbf = new StringBuffer();
			
			// 一个报文一个报文头 韦宗英 update 44
			if(f%fileForNum == 0){
				String headStr = generateRpHead(PecrConstantUtil.IN_SEC_ACCT_INF, numTotal[forTop++], "  "+CCRC_ORG_CODE);
				sbf.append(headStr);
				sbf.append("\r\n");
			}
			//sbf.append(System.getProperty("line.separator"));
			for (Map<String, Object> indvEntity : list) {
				Document document = DocumentHelper.createDocument();
				Element root = document.addElement("Document");
				Element InSecAcctInf = root.addElement("InSecAcctInf");
				/*** 个人担保基本信息 --- 基础段 ****/
				Element GuarAcctBsSgmt = InSecAcctInf.addElement("GuarAcctBsSgmt");
				writeGuarAcctBsSgmt(GuarAcctBsSgmt, indvEntity);
				/*** 个人担保基本信息 --- 基本信息段 ****/
				if (indvEntity.get("BUSI_LINES") != null && !indvEntity.get("BUSI_LINES").toString().equals("")) {
					Element GuarAcctBsInfSgmt = InSecAcctInf.addElement("GuarAcctBsInfSgmt");
					writeGuarAcctBsInfSgmt(GuarAcctBsInfSgmt, indvEntity);
				}
				/*** 个人担保在保责任信息 --- --- ****/
				if(indvEntity.get("RPT_DATE_CODE")!=null && !"50".equals(indvEntity.get("RPT_DATE_CODE").toString())){
					Element GuarRltRepymtInfSgmt = InSecAcctInf.addElement("GuarRltRepymtInfSgmt");
					writeRltRepymtInfSgmt(GuarRltRepymtInfSgmt, indvEntity);
				}
				/*** 个人担保还款人信息 --- --- ****/
				if (rltmap.get(indvEntity.get("PDA_GUAR_ACCT_BS_SGMT_ID").toString()) != null) {
					Element RltRepymtInfSgmt = InSecAcctInf.addElement("RltRepymtInfSgmt");
					writeRltSgmt(RltRepymtInfSgmt, rltmap.get(indvEntity.get("PDA_GUAR_ACCT_BS_SGMT_ID").toString()));
				}
				/*** 个人担保抵质押信息 --- --- ****/
				// 抵质押物信息段作为担保账户的预留信息段，暂时不需要报送。
					/*if (mccmap.get(indvEntity.get("PDA_GUAR_ACCT_BS_SGMT_ID").toString()) != null) {
						Element GuarMotgaCltalCtrctInfSgmt = InSecAcctInf.addElement("GuarMotgaCltalCtrctInfSgmt");
						writeMccSgmt(GuarMotgaCltalCtrctInfSgmt,
								mccmap.get(indvEntity.get("PDA_GUAR_ACCT_BS_SGMT_ID").toString()));
					}*/
				// 每条记录需要换行System.getProperty("line.separator") 当前系统换行标识符
				sbf.append(document.getRootElement().asXML());
				sbf.append("\r\n");
			}
			//韦宗英 add 生成新的报文  55 
			if(f%fileForNum == 0){
				// 报文名称
				logger.info("开始获取流水号");
				Map<String,Object> serialNumMap = new HashMap<String,Object>();
				serialNumMap.put("inRefType", PecrConstantUtil.IN_SEC_ACCT_INF);
				serialNumMap.put("company", company);
				CreateSerialNumber instance = CreateSerialNumber.getInstance();
				instance.setReportMessageManager(reportMessageService);
				String reportNum = instance.getSerialNumb(serialNumMap);
				reportName = generateRpName(PecrConstantUtil.IN_SEC_ACCT_INF,reportNum, "0"+CCRC_ORG_CODE);
				if (reportName == null || reportName == "") {
					logger.info("获取流水号异常");
					reportMap.put("resultCode", "ERROR");
					reportMap.put("resultMsg", "获取流水号异常");
					return reportMap;
				}
				//把数据写入文件
				reportFilePath = FileUtil.writeTOFile(sbf, saveCreateReportPath, reportName+".txt");
				
			}else{
				//把数据追加写入文件
				FileUtil.writeTOFile(sbf,reportFilePath);
			}
			
			
			
			rpmap.put(reportName, pkColnumList);
			logger.info("开始为每条记录插入报文名称以及在报文中的行数");
			//开始为每条记录插入报文名称
			insertReportNameAndColnumForData(rpmap);
			rpmap.clear();
			logger.info("已完成为每条记录插入报文名称以及在报文中的行数");
			//把状态从90转换为50
			logger.info("开始更新数据信息");
			//needReportDetail.setBusinessState(PecrConstantUtil.BUSINESS_STATUS_50);
			//updateBusinessState(needReportDetail);
			logger.info("更新数据信息完成");
			
			//总数追加  
			toalNum +=list.size();
			
			//韦宗英    生成一条报文并且开线程处理预处理
			// (f+1)%fileForNum == 0 之所以这么写是因为 f 是从 0 开始的 ；f==(forNum-1) 代表最后一个循环
			if((f+1)%fileForNum == 0||f==(forNum-1)){
					logger.info("写入报文执行完成");
					// 组织插入对象
					ReportAndBackMessageEnt rabme = new ReportAndBackMessageEnt();
					String rpt_date = needReportDetail.getRptDate().get(0).toString();
					rabme = AbstractGenerateReport.generateRpMessage(rpt_date,rabme, PecrConstantUtil.IN_SEC_ACCT_INF, reportName, Float.valueOf(toalNum),
							saveCreateReportPath, name,company);
					listRpMEnt.add(rabme);
					toalNum = 0;
					logger.info("开始插入报文信息");
					insertReportMessage(listRpMEnt);
					listRpMEnt.clear();
					logger.info("插入报文信息完成");

					// 将报内容和文件名插入map中
					// tempSb.put(PecrConstantUtil.MESSAGE_BUFFER, sbf);
					Map<String, StringBuffer> tempSb = new HashMap<>(5);
					tempSb.put(PecrConstantUtil.MESSAGE_NAME, new StringBuffer(reportName+".txt"));
					sbList.add(tempSb);
			}
		}
		//组装返回信息以及异步线程校验所需要的参数
		reportMap.put(PecrConstantUtil.MESSAGE_BUFFER, sbList);
		reportMap.put("reportMessageService", reportMessageService);
		logger.info("XML格式BODY内容生成执行完成-----------wzy  个人担保信息生成完毕");
		return reportMap;
	}

	@Transactional
	@Override
	public void updateBusinessState(NeedReportDetail needReportDetail) throws Exception {
		if (needReportDetail.getBusinessState() != null && needReportDetail.getBusinessState() != "") {
			Map<String, Object> conditionMap = new HashMap<>();
			conditionMap.put("RptDate", needReportDetail.getRptDate());
			conditionMap.put("pk", needReportDetail.getSpecialObj());
			//conditionMap.put("rownum", needReportDetail.getRownum());
			conditionMap.put("INF_REC_TYPE", needReportDetail.getInfRecType());
			switch (needReportDetail.getBusinessState()) {
			case PecrConstantUtil.BUSINESS_STATUS_30:
				conditionMap.put("BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_30);
				conditionMap.put("OLD_BUSINESS_STATES", "");
				reportMessageService.updateGuarAcctBsDataStatus(conditionMap);
				break;
			case PecrConstantUtil.BUSINESS_STATUS_90:
				conditionMap.put("BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_90);
				conditionMap.put("OLD_BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_85);
				reportMessageService.updateGuarAcctBsDataStatus(conditionMap);
				break;
			case PecrConstantUtil.BUSINESS_STATUS_50:
				conditionMap.put("BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_50);
				conditionMap.put("OLD_BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_90);
				reportMessageService.updateGuarAcctBsDataStatus(conditionMap);
				break;
			default:
				break;
			}
		}
	}

	public static void writeGuarAcctBsSgmt(Element GuarAcctBsSgmt, Map<String, Object> indvEntity) {
		/*** 个人担保基础信息记录 --- ***/
		GuarAcctBsSgmt.addElement("InfRecType")
				.setText(indvEntity.get("INF_REC_TYPE") != null ? indvEntity.get("INF_REC_TYPE").toString() : "");
		GuarAcctBsSgmt.addElement("AcctType")
				.setText(indvEntity.get("ACCT_TYPE") != null ? indvEntity.get("ACCT_TYPE").toString() : "");
		GuarAcctBsSgmt.addElement("AcctCode")
				.setText(indvEntity.get("ACCT_CODE") != null ? indvEntity.get("ACCT_CODE").toString() : "");
		GuarAcctBsSgmt.addElement("RptDate")
				.setText(indvEntity.get("RPT_DATE") != null ? indvEntity.get("RPT_DATE").toString() : "");
		GuarAcctBsSgmt.addElement("RptDateCode")
				.setText(indvEntity.get("RPT_DATE_CODE") != null ? indvEntity.get("RPT_DATE_CODE").toString() : "");
		GuarAcctBsSgmt.addElement("Name")
				.setText(indvEntity.get("NAME") != null ? indvEntity.get("NAME").toString() : "");
		GuarAcctBsSgmt.addElement("IDType")
				.setText(indvEntity.get("ID_TYPE") != null ? indvEntity.get("ID_TYPE").toString() : "");
		GuarAcctBsSgmt.addElement("IDNum")
				.setText(indvEntity.get("ID_NUM") != null ? indvEntity.get("ID_NUM").toString() : "");
		GuarAcctBsSgmt.addElement("MngmtOrgCode")
				.setText(indvEntity.get("MNGMT_ORG_CODE") != null ? indvEntity.get("MNGMT_ORG_CODE").toString() : "");
	}

	public static void writeGuarAcctBsInfSgmt(Element GuarAcctBsInfSgmt, Map<String, Object> indvEntity) {
		/*** 个人担保基本信息记录 --- ***/
		GuarAcctBsInfSgmt.addElement("BusiLines")
				.setText(indvEntity.get("BUSI_LINES") != null ? indvEntity.get("BUSI_LINES").toString() : "");
		GuarAcctBsInfSgmt.addElement("BusiDtilLines")
				.setText(indvEntity.get("BUSI_DTIL_LINES") != null ? indvEntity.get("BUSI_DTIL_LINES").toString() : "");
		GuarAcctBsInfSgmt.addElement("OpenDate")
				.setText(indvEntity.get("OPEN_DATE") != null ? indvEntity.get("OPEN_DATE").toString() : "");
		GuarAcctBsInfSgmt.addElement("AcctCredLine")
				.setText(indvEntity.get("ACCT_CRED_LINE") != null ? indvEntity.get("ACCT_CRED_LINE").toString() : "");
		GuarAcctBsInfSgmt.addElement("Cy").setText(indvEntity.get("CY") != null ? indvEntity.get("CY").toString() : "");
		GuarAcctBsInfSgmt.addElement("DueDate")
				.setText(indvEntity.get("DUE_DATE") != null ? indvEntity.get("DUE_DATE").toString() : "");
		GuarAcctBsInfSgmt.addElement("GuarMode")
				.setText(indvEntity.get("GUAR_MODE") != null ? indvEntity.get("GUAR_MODE").toString() : "");
		GuarAcctBsInfSgmt.addElement("OthRepyGuarWay").setText(
				indvEntity.get("OTH_REPY_GUAR_WAY") != null ? indvEntity.get("OTH_REPY_GUAR_WAY").toString() : "");
		GuarAcctBsInfSgmt.addElement("SecDep")
				.setText(indvEntity.get("SEC_DEP") != null ? indvEntity.get("SEC_DEP").toString() : "");
		GuarAcctBsInfSgmt.addElement("CtrctTxtCd")
				.setText(indvEntity.get("CTRCT_TXT_CD") != null ? indvEntity.get("CTRCT_TXT_CD").toString() : "");
	}

	public static void writeRltRepymtInfSgmt(Element GuarRltRepymtInfSgmt, Map<String, Object> indvEntity) {
		/*** 个人担保在保责任信息记录 --- ***/
		GuarRltRepymtInfSgmt.addElement("AcctStatus")
				.setText(indvEntity.get("ACCT_STATUS") != null ? indvEntity.get("ACCT_STATUS").toString() : "");
		GuarRltRepymtInfSgmt.addElement("LoanAmt")
				.setText(indvEntity.get("LOAN_AMT") != null ? indvEntity.get("LOAN_AMT").toString() : "");
		GuarRltRepymtInfSgmt.addElement("RepayPrd")
				.setText(indvEntity.get("REPAY_PRD") != null ? indvEntity.get("REPAY_PRD").toString() : "");
		GuarRltRepymtInfSgmt.addElement("FiveCate")
				.setText(indvEntity.get("FIVE_CATE") != null ? indvEntity.get("FIVE_CATE").toString() : "");
		GuarRltRepymtInfSgmt.addElement("FiveCateAdjDate").setText(
				indvEntity.get("FIVE_CATE_ADJ_DATE") != null ? indvEntity.get("FIVE_CATE_ADJ_DATE").toString() : "");
		GuarRltRepymtInfSgmt.addElement("RiEx")
				.setText(indvEntity.get("RI_EX") != null ? indvEntity.get("RI_EX").toString() : "");
		GuarRltRepymtInfSgmt.addElement("CompAdvFlag")
				.setText(indvEntity.get("COMP_ADV_FLAG") != null ? indvEntity.get("COMP_ADV_FLAG").toString() : "");
		GuarRltRepymtInfSgmt.addElement("CloseDate")
				.setText(indvEntity.get("CLOSE_DATE") != null ? indvEntity.get("CLOSE_DATE").toString() : "");
	}

	public static void writeRltSgmt(Element RltRepymtInfSgmt, List<Map<String, Object>> borrower) {
		// 还款人段
		RltRepymtInfSgmt.addElement("RltRepymtNm").setText(String.valueOf(borrower.size()));
		for (Map<String, Object> map : borrower) {
			if (map.get("INFO_ID_TYPE") != null && !map.get("INFO_ID_TYPE").toString().equals("")) {
				Element RltRepymtInf = RltRepymtInfSgmt.addElement("RltRepymtInf");
				RltRepymtInf.addElement("InfoIDType")
						.setText(map.get("INFO_ID_TYPE") != null ? map.get("INFO_ID_TYPE").toString() : "");
				RltRepymtInf.addElement("ArlpName")
						.setText(map.get("ARLP_NAME") != null ? map.get("ARLP_NAME").toString() : "");
				RltRepymtInf.addElement("ArlpCertType").setText(
						map.get("ARLP_CERT_TYPE") != null ? map.get("ARLP_CERT_TYPE").toString() : "");
				RltRepymtInf.addElement("ArlpCertNum").setText(
						map.get("ARLP_CERT_NUM") != null ? map.get("ARLP_CERT_NUM").toString() : "");
				RltRepymtInf.addElement("ArlpType")
						.setText(map.get("ARLP_TYPE")!= null ? map.get("ARLP_TYPE").toString() : "");
				RltRepymtInf.addElement("ArlpAmt")
						.setText(map.get("ARLP_AMT")!= null ? map.get("ARLP_AMT").toString() : "");
				RltRepymtInf.addElement("WartySign")
						.setText(map.get("WARTY_SIGN")!= null ? map.get("WARTY_SIGN").toString() : "");
				RltRepymtInf.addElement("MaxGuarMcc")
						.setText(map.get("MAX_GUAR_MCC")!= null ? map.get("MAX_GUAR_MCC").toString() : "");
				
			}
		}
	}

	public static void writeMccSgmt(Element GuarMotgaCltalCtrctInfSgmt, List<Map<String, Object>> borrower) {
		// 抵质押
		GuarMotgaCltalCtrctInfSgmt.addElement("CcNm").setText(String.valueOf(borrower.size()));
		for (Map<String, Object> map : borrower) {
			if (map.get("CCC")!= null && !map.get("CCC").toString().equals("")) {
				Element CccInf = GuarMotgaCltalCtrctInfSgmt.addElement("CccInf");
				CccInf.addElement("Ccc").setText(map.get("CCC")!= null ? map.get("CCC").toString() : "");
			}
		}
	}

	@Transactional
	@Override
	public void insertReportNameAndColnumForData(Map<String, Object> map) throws Exception {
		Map<String, Object> conditionMap = new HashMap<>();
		conditionMap.put("table_name", table_name);
		conditionMap.put("pk", PACKET_KEY);
		Iterator<String> iterator = map.keySet().iterator();
		while (iterator.hasNext()) {
			String str = iterator.next();
			conditionMap.put("report_name", str);
			//实际类型为List<Map<String,String>>
			conditionMap.put("data", map.get(str));
			reportMessageService.insertReportNameForData(conditionMap);
		}
	}

	@Override
	public void insertReportMessage(List<ReportAndBackMessageEnt> list) throws Exception {
		reportMessageService.insertReportMessage(list);
	}

	@Override
	public void insertReportNameForData(Map<String, List<String>> map) throws Exception {
		
	}
}
