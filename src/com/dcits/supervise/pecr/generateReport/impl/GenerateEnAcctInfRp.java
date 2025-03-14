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
 * 企业借贷账户交易生成报文模块
 * 
 * @author munan
 *
 */
public class GenerateEnAcctInfRp extends AbstractGenerateReport {

	private final static Logger logger = Logger.getLogger(GenerateEnAcctInfRp.class);

	public Properties properties;

	public ReportMessageManager reportMessageService;

	private String table_name = "E_ACCT_BS";

	private String PACKET_KEY = "EDA_ACCT_BS_SGMT_ID";
	
	private int count = 0;
	
	private String CCRC_ORG_CODE = "";

	public GenerateEnAcctInfRp(Properties properties, ReportMessageManager reportMessageService) {
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
		
		//没有带后缀
		String reportName = "";
		String reportFilePath = "";
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
		 * 1:查询条数，拆分1000000条数据为一次生成报文的内容 2：for循环(拆分的次数){ （1）生成一个stringBuffer
		 * （2）组装插入生成报文管理表的数据 }，
		 */
		List<Map<String, StringBuffer>> sbList = new ArrayList<>();
		Map<String, Object> reportCount = new HashMap<>();
		int pageSize = Integer.parseInt(properties.getProperty("saveMaxDataNumb"));
		
		// 获取要生成的报文总条数
		reportCount.put("table_name", table_name);
		reportCount.put("rpt_date", needReportDetail.getRptDate());
		reportCount.put("company", needReportDetail.getCompany());
		//信息记录类型
		reportCount.put("INF_REC_TYPE", PecrConstantUtil.ENT_ACCT_BS_SGMT);
		count = reportMessageService.getReportCount(reportCount);
		if (count == 0) {
			logger.info("没有符合条件的数据");
			reportMap.put("resultCode", "ERROR");
			reportMap.put("resultMsg", "没有符合条件的数据");
			return reportMap;
		}
		//20210330,新增全部修改数据状态30-->85
		reportMessageService.updateReportDataStatus(reportCount);
		
		//获得生成报文名所需的区构码
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
		for (int f = 0; f < forNum; f++) {
			//List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

			// 更新状态为“生成中”
			needReportDetail.setBusinessState(PecrConstantUtil.BUSINESS_STATUS_90);
			updateBusinessState(needReportDetail);
			logger.info("更改状态完成");
			
			reportCount.clear();
			reportCount.put("rpt_date", needReportDetail.getRptDate());
			//+1,是因为mapper文件中使用的是<号
			reportCount.put("pageSize", pageSize+1);
			reportCount.put("pk", needReportDetail.getSpecialObj());
			reportCount.put("company", needReportDetail.getCompany());
			reportCount.put("INF_REC_TYPE", PecrConstantUtil.ENT_ACCT_BS_SGMT);
			List<Map<String, Object>> list = reportMessageService.getEnAcctInfByFactor(reportCount);


			// 存放报文名和对应数据ID的map
			List<String> paaid = new ArrayList<String>();
			List<Map<String,String>> pkColnumList = new ArrayList<Map<String,String>>();
			//这里斗胆利用了List集合的有序性
			for (int i = 0; i < list.size(); i++) {
				Map<String, Object> indvBsSgmtReportEntity = list.get(i);
				String pk = indvBsSgmtReportEntity.get(PACKET_KEY).toString();
				//代表每一个主键在报文文件中的行数（报文头不算）
				String colnum = String.valueOf(((i+1)+(f*pageSize)) % (pageSize*fileForNum));
				paaid.add(pk);
				Map<String,String> mapTmp = new HashMap<String,String>();
				mapTmp.put("pk", pk);
				mapTmp.put("colnum", colnum);
				pkColnumList.add(mapTmp);
			}
			
			// 获取其他标识字段数据（通过order by 字段PDA_GUAR_ACCT_BS_SGMT_ID
			// 将相同的连续放在一起，其外获取每一种相同PDA_GUAR_ACCT_BS_SGMT_ID的条数也返回到当前数据中 ）
			// 依据返回结果，将相同PDA_GUAR_ACCT_BS_SGMT_ID的数据放入一个list中，在将PDA_GUAR_ACCT_BS_SGMT_ID的值作为key形成一个map，方便其他标识段的生成和减少频繁数据库的访问
			// 相关还款责任人
			List<Map<String, Object>> rltlist = reportMessageService.getRltRepymtInfSgmtByFactor(paaid);
			Map<String, List<Map<String, Object>>> rltmap = new HashMap<String, List<Map<String, Object>>>();
			for (int i = 0; i < rltlist.size();) {
				int tempNum = Integer.parseInt((rltlist.get(i).get("NUM")).toString());
				String tempName = rltlist.get(i).get("EDA_ACCT_BS_SGMT_ID").toString();
				List<Map<String, Object>> s = new ArrayList<Map<String, Object>>();
				for (int j = i; j < (i + tempNum);) {
					s.add(rltlist.get(j));
					j++;
				}
				i = i + tempNum;
				rltmap.put(tempName, s);
			}
			// 抵质押物信息段
			List<Map<String, Object>> mcclist = reportMessageService.getMotgaCltalCtrctInfSgmtByFactor(paaid);
			Map<String, List<Map<String, Object>>> mccmap = new HashMap<String, List<Map<String, Object>>>();
			for (int i = 0; i < mcclist.size();) {
				int tempNum = Integer.parseInt((mcclist.get(i).get("NUM")).toString());
				String tempName = mcclist.get(i).get("EDA_ACCT_BS_SGMT_ID").toString();
				List<Map<String, Object>> s = new ArrayList<Map<String, Object>>();
				for (int j = i; j < (i + tempNum);) {
					s.add(mcclist.get(j));
					j++;
				}
				i = i + tempNum;
				mccmap.put(tempName, s);
			}
			// 特定交易说明段
			List<Map<String, Object>> mshlist = reportMessageService.getAcctSpecTrstDspnSgmtByFactor(paaid);
			Map<String, List<Map<String, Object>>> mshmap = new HashMap<String, List<Map<String, Object>>>();
			for (int i = 0; i < mshlist.size();) {
				int tempNum = Integer.parseInt((mshlist.get(i).get("NUM")).toString());
				String tempName = mshlist.get(i).get("EDA_ACCT_BS_SGMT_ID").toString();
				List<Map<String, Object>> s = new ArrayList<Map<String, Object>>();
				for (int j = i; j < (i + tempNum);) {
					s.add(mshlist.get(j));
					j++;
				}
				i = i + tempNum;
				mshmap.put(tempName, s);
			}
			
			// 开始生成xml格式的报文内容
			StringBuffer sbf = new StringBuffer();
			// 一个报文一个报文头；对于其他信息（除基本信息外的），填写空值（即，两个空格）
			if(f%fileForNum == 0){
				sbf.append(generateRpHead(PecrConstantUtil.ENT_ACCT_BS_SGMT, numTotal[forTop++], "  "+CCRC_ORG_CODE));
				sbf.append("\r\n");
			}
			
			for (Map<String, Object> entEntity : list) {
				Document document = DocumentHelper.createDocument();
				Element root = document.addElement("Document");
				Element EnAcctInf = root.addElement("EnAcctInf");
				/*** 企业借贷账户交易 --- 基础段 ****/
				Element AcctBsSgmt = EnAcctInf.addElement("AcctBsSgmt");
				writeAcctBsSgmt(AcctBsSgmt, entEntity);
				/*** 企业借贷账户交易基本信息段 ****/
				if (entEntity.get("BUSI_LINES") != null && !entEntity.get("BUSI_LINES").toString().equals("")) {
					Element AcctBsInfSgmt = EnAcctInf.addElement("AcctBsInfSgmt");
					writeAcctBsInfSgmt(AcctBsInfSgmt, entEntity);
				}
				/*** 企业借贷账户交易相关还款责任人段 ****/
				if (entEntity.get("ACCT_TYPE") != null 
						&& (!(entEntity.get("ACCT_TYPE").toString().equals("C1")
								&& entEntity.get("RPT_DATE_CODE").toString().equals("20"))
						|| !(entEntity.get("ACCT_TYPE").toString().equals("C1")
								&& entEntity.get("RPT_DATE_CODE").toString().equals("33"))
						|| !(entEntity.get("ACCT_TYPE").toString().equals("C1")
								&& entEntity.get("RPT_DATE_CODE").toString().equals("41"))
						|| !(entEntity.get("ACCT_TYPE").toString().equals("C1")
								&& entEntity.get("RPT_DATE_CODE").toString().equals("49")))) {
					if (rltmap.get(entEntity.get("EDA_ACCT_BS_SGMT_ID").toString()) != null) {
						Element RltRepymtInfSgmt = EnAcctInf.addElement("RltRepymtInfSgmt");
						writeRltRepymtInfSgmt(RltRepymtInfSgmt,
								rltmap.get(entEntity.get("EDA_ACCT_BS_SGMT_ID").toString()));
					}
				}
				/*** 企业借贷账户交易抵质押物信息段 ****/
				//D2和C1账户均不适用
				if (entEntity.get("ACCT_TYPE") != null 
						&& !entEntity.get("ACCT_TYPE").toString().equals("D2")
						&& !entEntity.get("ACCT_TYPE").toString().equals("C1")) {
					if (mccmap.get(entEntity.get("EDA_ACCT_BS_SGMT_ID").toString()) != null) {
						Element MotgaCltalCtrctInfSgmt = EnAcctInf.addElement("MotgaCltalCtrctInfSgmt");
						writeMotgaCltalCtrctInfSgmt(MotgaCltalCtrctInfSgmt,
								mccmap.get(entEntity.get("EDA_ACCT_BS_SGMT_ID").toString()));
					}
				}
				/*** 企业借贷账户交易授信额度信息段 ****/
				//分次放款标志+账户类型+报告时点说明代码
				//D1账户且不是一次性放款的时候才会存在授信额度；R1和R4肯定会存在授信额度信息段
				if ((entEntity.get("ACCT_TYPE") != null && entEntity.get("ACCT_TYPE").toString().equals("D1")
						&& entEntity.get("FLAG") != null && !entEntity.get("FLAG").toString().equals("0"))
						|| entEntity.get("ACCT_TYPE").toString().equals("R1")
						|| entEntity.get("ACCT_TYPE").toString().equals("R4")) {
					if (entEntity.get("MCC") != null && !entEntity.get("MCC").toString().equals("")) {
						Element AcctCredSgmt = EnAcctInf.addElement("AcctCredSgmt");
						writeAcctCredSgmt(AcctCredSgmt, entEntity);
					}
				}
				/*** 企业借贷账户交易初始债权说明段 ****/
				if (entEntity.get("ACCT_TYPE") != null 
						&& entEntity.get("ACCT_TYPE").toString().equals("C1")
						&& entEntity.get("RPT_DATE_CODE") != null 
						&& entEntity.get("RPT_DATE_CODE").toString().equals("10")) {
					if (entEntity.get("INIT_CRED_NAME") != null
							&& !entEntity.get("INIT_CRED_NAME").toString().equals("")) {
						Element OrigCreditorInfSgmt = EnAcctInf.addElement("OrigCreditorInfSgmt");
						writeOrigCreditorInfSgmt(OrigCreditorInfSgmt, entEntity);
					}
				}
				/*** 企业借贷账户交易还款表现信息段 ****/
				Element ActLbltyInfSgmt = EnAcctInf.addElement("ActLbltyInfSgmt");
				writeActLbltyInfSgmt(ActLbltyInfSgmt, entEntity);
				/*** 企业借贷账户交易特定交易说明段 ****/
				if (entEntity.get("ACCT_TYPE") != null 
						&& !"D2".equals(entEntity.get("ACCT_TYPE").toString())
						&& mshmap.get(entEntity.get("EDA_ACCT_BS_SGMT_ID").toString()) != null) {
					Element AcctSpecTrstDspnSgmt = EnAcctInf.addElement("AcctSpecTrstDspnSgmt");
					writeAcctSpecTrstDspnSgmt(AcctSpecTrstDspnSgmt,
							mshmap.get(entEntity.get("EDA_ACCT_BS_SGMT_ID").toString()));
				}

				sbf.append(document.getRootElement().asXML());
				sbf.append("\r\n");
			}
			
			//组织报文名并插入报文内容
			if(f%fileForNum == 0){
				logger.info("开始获取流水号");
				Map<String,Object> serialNumMap = new HashMap<String,Object>();
				serialNumMap.put("inRefType", PecrConstantUtil.ENT_ACCT_BS_SGMT);
				serialNumMap.put("company", company);
				CreateSerialNumber instance = CreateSerialNumber.getInstance();
				instance.setReportMessageManager(reportMessageService);
				String reportNum = instance.getSerialNumb(serialNumMap);
				reportName = generateRpName(PecrConstantUtil.ENT_ACCT_BS_SGMT,reportNum, "0"+CCRC_ORG_CODE);
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
			
			//把报文id放到map
			rpmap.put(reportName, pkColnumList);

			logger.info("开始为每条记录插入报文名称以及在报文中的行数");
			insertReportNameAndColnumForData(rpmap);
			rpmap.clear();
			logger.info("已完成为每条记录插入报文名称以及在报文中的行数");
			
			logger.info("开始更新数据信息");
			//needReportDetail.setBusinessState(PecrConstantUtil.BUSINESS_STATUS_50);
			//updateBusinessState(needReportDetail);
			logger.info("更新数据信息完成");
			
			// 韦宗英 add 总数追加  66 
			toalNum +=list.size();
			
			// (f+1)%fileForNum == 0 之所以这么写是因为 f 是从 0 开始的 ；f==(forNum-1) 代表最后一个循环
			if((f+1)%fileForNum == 0||f==(forNum-1)){
				logger.info("写入报文执行完成");
				// 组织插入对象
				ReportAndBackMessageEnt rabme = new ReportAndBackMessageEnt();
				String rpt_date = needReportDetail.getRptDate().get(0).toString();
				rabme =  AbstractGenerateReport.generateRpMessage(rpt_date, rabme, PecrConstantUtil.ENT_ACCT_BS_SGMT, reportName, 
						Float.valueOf(toalNum), saveCreateReportPath, name,company);
				listRpMEnt.add(rabme);
				
				toalNum = 0;
				
				logger.info("开始插入报文信息");
				insertReportMessage(listRpMEnt);
				listRpMEnt.clear();
				logger.info("插入报文信息完成");
				//将reportName插入tempSb中以便匿名内部类中可以使用
				// buffer内容，文件名
				Map<String, StringBuffer> tempSb = new HashMap<>(5);
				tempSb.put(PecrConstantUtil.MESSAGE_NAME, new StringBuffer(reportName+".txt"));
				sbList.add(tempSb);
			}
		}
		
		//组装返回信息以及异步线程校验所需要的参数
		reportMap.put(PecrConstantUtil.MESSAGE_BUFFER, sbList);
		reportMap.put("reportMessageService", reportMessageService);
		logger.info("XML格式BODY内容生成执行完成 -----------wzy  个人借贷生成完毕");
		return reportMap;
	}

	@Transactional
	@Override
	public void updateBusinessState(NeedReportDetail needReportDetail) throws Exception {
		if (needReportDetail.getBusinessState() != null && needReportDetail.getBusinessState() != "") {
			Map<String, Object> conditionMap = new HashMap<>();
			conditionMap.put("RptDate", needReportDetail.getRptDate());
			conditionMap.put("pk", needReportDetail.getSpecialObj());
			conditionMap.put("company", needReportDetail.getCompany());
			//conditionMap.put("rownum", needReportDetail.getRownum());
			conditionMap.put("INF_REC_TYPE", needReportDetail.getInfRecType());
			switch (needReportDetail.getBusinessState()) {
			case PecrConstantUtil.BUSINESS_STATUS_30:
				conditionMap.put("BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_30);
				conditionMap.put("OLD_BUSINESS_STATES", "");
				reportMessageService.updateEnAcctInfDataStatus(conditionMap);
				break;
			case PecrConstantUtil.BUSINESS_STATUS_90:
				conditionMap.put("BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_90);
				conditionMap.put("OLD_BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_85);
				reportMessageService.updateEnAcctInfDataStatus(conditionMap);
				break;
			case PecrConstantUtil.BUSINESS_STATUS_50:
				conditionMap.put("BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_50);
				conditionMap.put("OLD_BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_90);
				reportMessageService.updateEnAcctInfDataStatus(conditionMap);
				break;
			default:
				break;
			}
		}
	}

	public static void writeAcctBsSgmt(Element AcctBsSgmt, Map<String, Object> entEntity) {
		/*** 基础段 --- ***/
		AcctBsSgmt.addElement("InfRecType")
				.setText(entEntity.get("INF_REC_TYPE") != null ? entEntity.get("INF_REC_TYPE").toString() : "");
		AcctBsSgmt.addElement("AcctType")
				.setText(entEntity.get("ACCT_TYPE") != null ? entEntity.get("ACCT_TYPE").toString() : "");
		AcctBsSgmt.addElement("AcctCode")
				.setText(entEntity.get("ACCT_CODE") != null ? entEntity.get("ACCT_CODE").toString() : "");
		AcctBsSgmt.addElement("RptDate")
				.setText(entEntity.get("RPT_DATE") != null ? entEntity.get("RPT_DATE").toString() : "");
		AcctBsSgmt.addElement("RptDateCode")
				.setText(entEntity.get("RPT_DATE_CODE") != null ? entEntity.get("RPT_DATE_CODE").toString() : "");
		AcctBsSgmt.addElement("Name").setText(entEntity.get("NAME") != null ? entEntity.get("NAME").toString() : "");
		AcctBsSgmt.addElement("IDType")
				.setText(entEntity.get("ID_TYPE") != null ? entEntity.get("ID_TYPE").toString() : "");
		AcctBsSgmt.addElement("IDNum")
				.setText(entEntity.get("ID_NUM") != null ? entEntity.get("ID_NUM").toString() : "");
		AcctBsSgmt.addElement("MngmtOrgCode")
				.setText(entEntity.get("MNGMT_ORG_CODE") != null ? entEntity.get("MNGMT_ORG_CODE").toString() : "");
	}

	/**
	 * 企业借贷账户交易基本信息段
	 * @param AcctBsInfSgmt
	 * @param entEntity
	 */
	public static void writeAcctBsInfSgmt(Element AcctBsInfSgmt, Map<String, Object> entEntity) {
		/*** 基本概况信息段 --- ***/
		AcctBsInfSgmt.addElement("BusiLines")
				.setText(entEntity.get("BUSI_LINES") != null ? entEntity.get("BUSI_LINES").toString() : "");
		AcctBsInfSgmt.addElement("BusiDtlLines")
				.setText(entEntity.get("BUSI_DTL_LINES") != null ? entEntity.get("BUSI_DTL_LINES").toString() : "");
		AcctBsInfSgmt.addElement("OpenDate")
				.setText(entEntity.get("OPEN_DATE") != null ? entEntity.get("OPEN_DATE").toString() : "");
		AcctBsInfSgmt.addElement("Cy").setText(entEntity.get("CY") != null ? entEntity.get("CY").toString() : "");

		if (entEntity.get("ACCT_TYPE") != null && "R1".equals(entEntity.get("ACCT_TYPE").toString())) {
			AcctBsInfSgmt.addElement("AcctCredLine")
				.setText(entEntity.get("ACCT_CRED_LINE") != null ? entEntity.get("ACCT_CRED_LINE").toString() : "");
		}

		if (entEntity.get("ACCT_TYPE") != null && !"R1".equals(entEntity.get("ACCT_TYPE").toString())) {
			AcctBsInfSgmt.addElement("LoanAmt")
				.setText(entEntity.get("LOAN_AMT") != null ? entEntity.get("LOAN_AMT").toString() : "");
		}
		
		if (entEntity.get("ACCT_TYPE") != null && "D1".equals(entEntity.get("ACCT_TYPE").toString())) {
			AcctBsInfSgmt.addElement("Flag")
				.setText(entEntity.get("FLAG") != null ? entEntity.get("FLAG").toString() : "");
		}
		
		if (entEntity.get("ACCT_TYPE") != null && !"C1".equals(entEntity.get("ACCT_TYPE").toString())) {
			AcctBsInfSgmt.addElement("DueDate")
				.setText(entEntity.get("DUE_DATE") != null ? entEntity.get("DUE_DATE").toString() : "");
		}
		
		if (entEntity.get("ACCT_TYPE") != null 
				&& !"D2".equals(entEntity.get("ACCT_TYPE").toString())
				&& !"C1".equals(entEntity.get("ACCT_TYPE").toString())) {
			AcctBsInfSgmt.addElement("RepayMode")
				.setText(entEntity.get("REPAY_MODE") != null ? entEntity.get("REPAY_MODE").toString() : "");
			AcctBsInfSgmt.addElement("RepayFreqcy")
				.setText(entEntity.get("REPAY_FREQCY") != null ? entEntity.get("REPAY_FREQCY").toString() : "");
		}
		if (entEntity.get("ACCT_TYPE") != null && !"C1".equals(entEntity.get("ACCT_TYPE").toString())) {
			AcctBsInfSgmt.addElement("ApplyBusiDist")
				.setText(entEntity.get("APPLY_BUSI_DIST") != null ? entEntity.get("APPLY_BUSI_DIST").toString() : "");
			AcctBsInfSgmt.addElement("GuarMode")
				.setText(entEntity.get("GUAR_MODE") != null ? entEntity.get("GUAR_MODE").toString() : "");
			AcctBsInfSgmt.addElement("OthRepyGuarWay")
				.setText(entEntity.get("OTH_REPY_GUAR_WAY") != null ? entEntity.get("OTH_REPY_GUAR_WAY").toString() : "");
		}
		if (entEntity.get("ACCT_TYPE") != null && "D1".equals(entEntity.get("ACCT_TYPE").toString())
				|| "R4".equals(entEntity.get("ACCT_TYPE").toString())) {
			AcctBsInfSgmt.addElement("LoanTimeLimCat")
				.setText(entEntity.get("LOAN_TIME_LIM_CAT") != null ? entEntity.get("LOAN_TIME_LIM_CAT").toString() : "");
		}
		if (entEntity.get("ACCT_TYPE") != null && !"C1".equals(entEntity.get("ACCT_TYPE").toString())) {
			AcctBsInfSgmt.addElement("LoaFrm")
				.setText(entEntity.get("LOA_FRM") != null ? entEntity.get("LOA_FRM").toString() : "");
		}
		if (entEntity.get("ACCT_TYPE") != null && !"C1".equals(entEntity.get("ACCT_TYPE").toString())
				&& !"D2".equals(entEntity.get("ACCT_TYPE").toString())) {
			AcctBsInfSgmt.addElement("ActInvest")
				.setText(entEntity.get("ACT_INVEST") != null ? entEntity.get("ACT_INVEST").toString() : "");
		}
		if (entEntity.get("ACCT_TYPE") != null && !"C1".equals(entEntity.get("ACCT_TYPE").toString())) {
			AcctBsInfSgmt.addElement("FundSou")
				.setText(entEntity.get("FUND_SOU") != null ?entEntity.get("FUND_SOU").toString() : "");
		}
		if (entEntity.get("ACCT_TYPE") != null && !"C1".equals(entEntity.get("ACCT_TYPE").toString())
				&& !"D2".equals(entEntity.get("ACCT_TYPE").toString())) {
			AcctBsInfSgmt.addElement("AssetTrandFlag")
				.setText(entEntity.get("ASSET_TRAND_FLAG") != null ? entEntity.get("ASSET_TRAND_FLAG").toString() : "");
		}

	}

	/**
	 * 企业借贷账户交易相关还款责任人段
	 * @param RltRepymtInfSgmt
	 * @param borrower
	 */
	public static void writeRltRepymtInfSgmt(Element RltRepymtInfSgmt, List<Map<String, Object>> borrower) {
		RltRepymtInfSgmt.addElement("RltRepymtNm").setText(String.valueOf(borrower.size()));
		for (Map<String, Object> map : borrower) {
			if (map.get("ARLP_ID_TYPE")!= null
					&& !map.get("ARLP_ID_TYPE").toString().toString().equals("")) {
				Element RltRepymtInf = RltRepymtInfSgmt.addElement("RltRepymtInf");
				RltRepymtInf.addElement("ArlpIDType")
						.setText(map.get("ARLP_ID_TYPE") != null ? map.get("ARLP_ID_TYPE").toString() : "");
				RltRepymtInf.addElement("ArlpName")
						.setText(map.get("ARLP_NAME") != null ? map.get("ARLP_NAME").toString() : "");
				RltRepymtInf.addElement("ArlpCertType").setText(
						map.get("ARLP_CERT_TYPE") != null ? map.get("ARLP_CERT_TYPE").toString() : "");
				RltRepymtInf.addElement("ArlpCertNum").setText(
						map.get("ARLP_CERT_NUM") != null ? map.get("ARLP_CERT_NUM").toString() : "");
				RltRepymtInf.addElement("ArlpType")
						.setText(map.get("ARLP_TYPE") != null ? map.get("ARLP_TYPE").toString() : "");
				RltRepymtInf.addElement("ArlpAmt")
						.setText(map.get("ARLP_AMT") != null ? map.get("ARLP_AMT").toString() : "");
				RltRepymtInf.addElement("WartySign")
						.setText(map.get("WARTY_SIGN") != null ? map.get("WARTY_SIGN").toString() : "");
				RltRepymtInf.addElement("MaxGuarMcc")
						.setText(map.get("MAX_GUAR_MCC") != null ? map.get("MAX_GUAR_MCC").toString() : "");
			}
		}
	}

	/**
	 * 企业借贷账户交易抵质押物信息段 
	 * @param MotgaCltalCtrctInfSgmt
	 * @param borrower
	 */
	public static void writeMotgaCltalCtrctInfSgmt(Element MotgaCltalCtrctInfSgmt, List<Map<String, Object>> borrower) {
		MotgaCltalCtrctInfSgmt.addElement("CcNm").setText(String.valueOf(borrower.size()));
		for (Map<String, Object> map : borrower) {
			if (map.get("CCC") != null && !map.get("CCC").toString().equals("")) {
				Element CccInf = MotgaCltalCtrctInfSgmt.addElement("CccInf");
				CccInf.addElement("Ccc").setText(map.get("CCC") != null ? map.get("CCC").toString() : "");
			}
		}
	}

	/**
	 * 企业借贷账户交易授信额度信息段
	 * @param AcctCredSgmt
	 * @param entEntity
	 */
	public static void writeAcctCredSgmt(Element AcctCredSgmt, Map<String, Object> entEntity) {
		AcctCredSgmt.addElement("Mcc").setText(entEntity.get("MCC") != null ? entEntity.get("MCC").toString() : "");
	}

	/**
	 * 企业借贷账户交易初始债权说明段
	 * @param OrigCreditorInfSgmt
	 * @param entEntity
	 */
	public static void writeOrigCreditorInfSgmt(Element OrigCreditorInfSgmt, Map<String, Object> entEntity) {
		OrigCreditorInfSgmt.addElement("InitCredName")
				.setText(entEntity.get("INIT_CRED_NAME") != null ? entEntity.get("INIT_CRED_NAME").toString() : "");
		OrigCreditorInfSgmt.addElement("InitCedOrgCode").setText(
				entEntity.get("INIT_CED_ORG_CODE") != null ? entEntity.get("INIT_CED_ORG_CODE").toString() : "");
		OrigCreditorInfSgmt.addElement("OrigDbtCate")
				.setText(entEntity.get("ORIG_DBT_CATE") != null ? entEntity.get("ORIG_DBT_CATE").toString() : "");
		OrigCreditorInfSgmt.addElement("InitRpySts")
				.setText(entEntity.get("INIT_RPY_STS") != null ? entEntity.get("INIT_RPY_STS").toString() : "");
	}

	/**
	 * 企业借贷账户交易还款表现信息段
	 * @param ActLbltyInfSgmt
	 * @param entEntity
	 */
	public static void writeActLbltyInfSgmt(Element ActLbltyInfSgmt, Map<String, Object> entEntity) {
		ActLbltyInfSgmt.addElement("AcctStatus")
				.setText(entEntity.get("ACCT_STATUS") != null ? entEntity.get("ACCT_STATUS").toString() : "");
		ActLbltyInfSgmt.addElement("AcctBal")
				.setText(entEntity.get("ACCT_BAL") != null ? entEntity.get("ACCT_BAL").toString() : "");
		ActLbltyInfSgmt.addElement("BalChgDate")
				.setText(entEntity.get("BAL_CHG_DATE") != null ? entEntity.get("BAL_CHG_DATE").toString() : "");
		ActLbltyInfSgmt.addElement("FiveCate")
				.setText(entEntity.get("FIVE_CATE") != null ? entEntity.get("FIVE_CATE").toString() : "");
		ActLbltyInfSgmt.addElement("FiveCateAdjDate").setText(
				entEntity.get("FIVE_CATE_ADJ_DATE") != null ? entEntity.get("FIVE_CATE_ADJ_DATE").toString() : "");
		
		if (entEntity.get("ACCT_TYPE") != null && "R1".equals(entEntity.get("ACCT_TYPE").toString())) {
			ActLbltyInfSgmt.addElement("PymtPrd")
				.setText(entEntity.get("PYMT_PRD") != null ? entEntity.get("PYMT_PRD").toString() : "");
		}
		if (entEntity.get("ACCT_TYPE") != null && !"C1".equals(entEntity.get("ACCT_TYPE").toString())) {
			ActLbltyInfSgmt.addElement("TotOverd")
				.setText(entEntity.get("TOT_OVERD") != null ? entEntity.get("TOT_OVERD").toString() : "");
			ActLbltyInfSgmt.addElement("OverdPrinc")
				.setText(entEntity.get("OVERD_PRINC") != null ? entEntity.get("OVERD_PRINC").toString() : "");
			ActLbltyInfSgmt.addElement("OverdDy")
				.setText(entEntity.get("OVERD_DY") != null ? entEntity.get("OVERD_DY").toString() : "");
		}
		ActLbltyInfSgmt.addElement("LatRpyDate")
				.setText(entEntity.get("LAT_RPY_DATE") != null ? entEntity.get("LAT_RPY_DATE").toString() : "");
		ActLbltyInfSgmt.addElement("LatRpyAmt")
				.setText(entEntity.get("LAT_RPY_AMT") != null ? entEntity.get("LAT_RPY_AMT").toString() : "");
		ActLbltyInfSgmt.addElement("LatRpyPrincAmt").setText(
				entEntity.get("LAT_RPY_PRINC_AMT") != null ? entEntity.get("LAT_RPY_PRINC_AMT").toString() : "");
		ActLbltyInfSgmt.addElement("RpmtType")
				.setText(entEntity.get("RPMT_TYPE") != null ? entEntity.get("RPMT_TYPE").toString() : "");

		if (entEntity.get("ACCT_TYPE") != null && !"C1".equals(entEntity.get("ACCT_TYPE").toString())) {
			ActLbltyInfSgmt.addElement("LatAgrrRpyDate")
				.setText(entEntity.get("LAT_AGRR_RPY_DATE") != null ? entEntity.get("LAT_AGRR_RPY_DATE").toString() : "");
			ActLbltyInfSgmt.addElement("LatAgrrRpyAmt")
				.setText(entEntity.get("LAT_AGRR_RPY_AMT") != null ? entEntity.get("LAT_AGRR_RPY_AMT").toString() : "");
			ActLbltyInfSgmt.addElement("NxtAgrrRpyDate")
				.setText(entEntity.get("NXT_AGRR_RPY_DATE") != null ? entEntity.get("NXT_AGRR_RPY_DATE").toString() : "");
		}
		ActLbltyInfSgmt.addElement("CloseDate")
				.setText(entEntity.get("CLOSE_DATE") != null ? entEntity.get("CLOSE_DATE").toString() : "");
	}

	/**
	 * 企业借贷账户交易特定交易说明段
	 * @param AcctSpecTrstDspnSgmt
	 * @param borrower
	 */
	public static void writeAcctSpecTrstDspnSgmt(Element AcctSpecTrstDspnSgmt, List<Map<String, Object>> borrower) {
		AcctSpecTrstDspnSgmt.addElement("CagOfTrdNm").setText(String.valueOf(borrower.size()));
		for (Map<String, Object> map : borrower) {
			Element CagOfTrdInf = AcctSpecTrstDspnSgmt.addElement("CagOfTrdInf");
			CagOfTrdInf.addElement("ChanTranType")
					.setText(map.get("CHAN_TRAN_TYPE")!= null ? map.get("CHAN_TRAN_TYPE").toString() : "");
			CagOfTrdInf.addElement("TranDate")
					.setText(map.get("TRAN_DATE")!= null ? map.get("TRAN_DATE").toString() : "");
			CagOfTrdInf.addElement("TranAmt")
					.setText(map.get("TRAN_AMT")!= null ? map.get("TRAN_AMT").toString() : "");
			CagOfTrdInf.addElement("DueTranMon")
					.setText(map.get("DUE_TRAN_MON") != null ? map.get("DUE_TRAN_MON").toString() : "");
			CagOfTrdInf.addElement("DetInfo")
					.setText(map.get("DET_INFO")!= null ? map.get("DET_INFO").toString() : "");
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
		// TODO Auto-generated method stub
		
	}

}
