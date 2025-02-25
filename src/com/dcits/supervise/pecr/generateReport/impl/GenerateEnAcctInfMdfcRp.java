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
import com.dcits.supervise.pecr.util.ReportType;

/**
 * 企业借贷账户更正生成报文模块
 * 
 * @author munan
 *
 */
public class GenerateEnAcctInfMdfcRp extends AbstractGenerateReport {

	private final static Logger logger = Logger.getLogger(GenerateEnAcctInfMdfcRp.class);

	public Properties properties;

	public ReportMessageManager reportMessageService;

	private String table_name = "";

	private String PACKET_KEY = "";
	
	private String CCRC_ORG_CODE = "";

	public GenerateEnAcctInfMdfcRp(Properties properties, ReportMessageManager reportMessageService) {
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
		String infRecType = needReportDetail.getInfRecType();
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
		int pageSize = Integer.parseInt(properties.getProperty("saveMaxDataNumb"));
		
		/***** 记录数 *****/
		PACKET_KEY = ReportType.getReportTypePrimaryKey(infRecType);
		table_name = ReportType.getReportTypeBaseTable(infRecType);
		reportCount.put("table_name", table_name);
		reportCount.put("rpt_date", needReportDetail.getRptDate());
		reportCount.put("company", needReportDetail.getCompany());
		//信息记录类型
		reportCount.put("INF_REC_TYPE", infRecType);
		int count = reportMessageService.getReportCount(reportCount);
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
		
		for (int f = 0; f < forNum ; f++) {
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
			reportCount.put("INF_REC_TYPE", infRecType);
			List<Map<String, Object>> list = reportMessageService.getEnAcctInfByFactor(reportCount);
			// 存放报文名和对应数据ID的map
			List<String> pdaid = new ArrayList<String>();
			List<Map<String,String>> pkColnumList = new ArrayList<Map<String,String>>();
			//这里斗胆利用了List集合的有序性
			for (int i = 0; i < list.size(); i++) {
				Map<String, Object> tempMap = list.get(i);
				String pk = tempMap.get(PACKET_KEY).toString();
				//代表每一个主键在报文文件中的行数（报文头不算）
				String colnum = String.valueOf(((i+1)+(f*pageSize)) % (pageSize*fileForNum));
				pdaid.add(pk);
				Map<String,String> mapTmp = new HashMap<String,String>();
				mapTmp.put("pk", pk);
				mapTmp.put("colnum", colnum);
				pkColnumList.add(mapTmp);
			}
			// 获取其他标识字段数据（通过order by 字段PDA_GUAR_ACCT_BS_SGMT_ID
			// 将相同的连续放在一起，其外获取每一种相同PDA_GUAR_ACCT_BS_SGMT_ID的条数也返回到当前数据中 ）
			// 依据返回结果，将相同PDA_GUAR_ACCT_BS_SGMT_ID的数据放入一个list中，在将PDA_GUAR_ACCT_BS_SGMT_ID的值作为key形成一个map，方便其他标识段的生成和减少频繁数据库的访问
			List<Map<String, Object>> rltlist = reportMessageService.getRltRepymtInfSgmtByFactor(pdaid);
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
			List<Map<String, Object>> mcclist = reportMessageService.getMotgaCltalCtrctInfSgmtByFactor(pdaid);
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
			List<Map<String, Object>> mshlist = reportMessageService.getAcctSpecTrstDspnSgmtByFactor(pdaid);
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
				mccmap.put(tempName, s);
			}
			// 开始生成xml格式的报文内容
			StringBuffer sbf = new StringBuffer();
			// 一个报文一个报文头
			if(f%fileForNum == 0){
				sbf.append(generateRpHead(infRecType, numTotal[forTop++], "  "+CCRC_ORG_CODE));
				sbf.append("\r\n");
			}
			
			for (Map<String, Object> indvEntity : list) {
				Document document = DocumentHelper.createDocument();
				Element root = document.addElement("Document");
				Element EnAcctInfMdfc = root.addElement("EnAcctInfMdfc");
				/*** 企业借贷账户更正段请求信息 --- 基础段 ****/
				Element BsSgmt = EnAcctInfMdfc.addElement("BsSgmt");
				writeBsSgmt(BsSgmt, indvEntity);
				/*** 企业借贷账户更正段请求信息 --- -变更段-- ****/
				Element MdfcSgmt = EnAcctInfMdfc.addElement("MdfcSgmt");
				switch (indvEntity.get("MDFC_SGMT_CODE").toString()) {
				case PecrConstantUtil.EN_ACCT_INF_MDFC_B:
					/*** 企业借贷账户交易 --- 基础段 ****/
					Element AcctBsSgmt = MdfcSgmt.addElement("AcctBsSgmt");
					writeAcctBsSgmt(AcctBsSgmt, indvEntity);
					break;
				case PecrConstantUtil.EN_ACCT_INF_MDFC_C:
					/*** 企业借贷账户交易基本信息段 ****/
					Element AcctBsInfSgmt = MdfcSgmt.addElement("AcctBsInfSgmt");
					GenerateEnAcctInfRp.writeAcctBsInfSgmt(AcctBsInfSgmt, indvEntity);
					break;
				case PecrConstantUtil.EN_ACCT_INF_MDFC_D:
					/*** 企业借贷账户交易相关还款责任人段 ****/
					if (rltmap.get(indvEntity.get("EDA_ACCT_BS_SGMT_ID").toString()) != null) {
						Element RltRepymtInfSgmt = MdfcSgmt.addElement("RltRepymtInfSgmt");
						GenerateEnAcctInfRp.writeRltRepymtInfSgmt(RltRepymtInfSgmt,
								rltmap.get(indvEntity.get("EDA_ACCT_BS_SGMT_ID").toString()));
					}
					break;
				case PecrConstantUtil.EN_ACCT_INF_MDFC_E:
					/*** 企业借贷账户交易抵质押物信息段 ****/
					if (mccmap.get(indvEntity.get("EDA_ACCT_BS_SGMT_ID").toString()) != null) {
						Element MotgaCltalCtrctInfSgmt = MdfcSgmt.addElement("MotgaCltalCtrctInfSgmt");
						GenerateEnAcctInfRp.writeMotgaCltalCtrctInfSgmt(MotgaCltalCtrctInfSgmt,
								mccmap.get(indvEntity.get("EDA_ACCT_BS_SGMT_ID").toString()));
					}
					break;
				case PecrConstantUtil.EN_ACCT_INF_MDFC_F:
					/*** 企业借贷账户交易授信额度信息段 ****/
					Element AcctCredSgmt = MdfcSgmt.addElement("AcctCredSgmt");
					GenerateEnAcctInfRp.writeAcctCredSgmt(AcctCredSgmt, indvEntity);
					break;
				case PecrConstantUtil.EN_ACCT_INF_MDFC_G:
					/*** 企业借贷账户交易初始债权说明段 ****/
					Element OrigCreditorInfSgmt = MdfcSgmt.addElement("OrigCreditorInfSgmt");
					GenerateEnAcctInfRp.writeOrigCreditorInfSgmt(OrigCreditorInfSgmt, indvEntity);
					break;
				case PecrConstantUtil.EN_ACCT_INF_MDFC_H:
					/*** 企业借贷账户交易还款表现信息段 ****/
					Element ActLbltyInfSgmt = MdfcSgmt.addElement("ActLbltyInfSgmt");
					GenerateEnAcctInfRp.writeActLbltyInfSgmt(ActLbltyInfSgmt, indvEntity);
					break;
				case PecrConstantUtil.EN_ACCT_INF_MDFC_I:
					/*** 企业借贷账户交易特定交易说明段 ****/
					if (mshmap.get(indvEntity.get("EDA_ACCT_BS_SGMT_ID").toString()) != null) {
						Element AcctSpecTrstDspnSgmt = MdfcSgmt.addElement("AcctSpecTrstDspnSgmt");
						GenerateEnAcctInfRp.writeAcctSpecTrstDspnSgmt(AcctSpecTrstDspnSgmt,
								mshmap.get(indvEntity.get("EDA_ACCT_BS_SGMT_ID").toString()));
					}
					break;
				default:
					break;
				}
				sbf.append(document.getRootElement().asXML());
				sbf.append("\r\n");
			}
			
			//组织报文名并插入报文内容
			if(f%fileForNum == 0){
				logger.info("开始获取流水号");
				Map<String,Object> serialNumMap = new HashMap<String,Object>();
				serialNumMap.put("inRefType", infRecType);
				serialNumMap.put("company", company);
				CreateSerialNumber instance = CreateSerialNumber.getInstance();
				instance.setReportMessageManager(reportMessageService);
				String reportNum = instance.getSerialNumb(serialNumMap);
				reportName = generateRpName(infRecType,reportNum, "0"+CCRC_ORG_CODE);
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
			
			toalNum +=list.size();
			
 			// (f+1)%fileForNum == 0 之所以这么写是因为 f 是从 0 开始的 ；f==(forNum-1) 代表最后一个循环
 			if((f+1)%fileForNum == 0||f==(forNum-1)){
 				logger.info("写入报文执行完成");
				// 组织插入对象
				ReportAndBackMessageEnt rabme = new ReportAndBackMessageEnt();
				String rpt_date = needReportDetail.getRptDate().get(0).toString();
				rabme =  AbstractGenerateReport.generateRpMessage(rpt_date, rabme, infRecType, reportName, 
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
		logger.info("XML格式BODY内容生成执行完成 -----------企业借贷交易按段更正报文生成完毕");
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

	public static void writeBsSgmt(Element BsSgmt, Map<String, Object> indvEntity) {
		BsSgmt.addElement("InfRecType")
				.setText(indvEntity.get("INF_REC_TYPE") != null ? indvEntity.get("INF_REC_TYPE").toString() : "");
		BsSgmt.addElement("ModRecCode")
				.setText(indvEntity.get("ACCT_CODE") != null ? indvEntity.get("ACCT_CODE").toString() : "");
		BsSgmt.addElement("RptDate")
				.setText(indvEntity.get("RPT_DATE") != null ? indvEntity.get("RPT_DATE").toString() : "");
		BsSgmt.addElement("AcctType")
				.setText(indvEntity.get("ACCT_TYPE") != null ? indvEntity.get("ACCT_TYPE").toString() : "");
		BsSgmt.addElement("MdfcSgmtCode")
				.setText(indvEntity.get("MDFC_SGMT_CODE") != null ? indvEntity.get("MDFC_SGMT_CODE").toString() : "");
	}
	
	public static void writeAcctBsSgmt(Element AcctBsSgmt, Map<String, Object> entEntity) {
		/*** 更正类基础段 --- ***/
		AcctBsSgmt.addElement("Name").setText(entEntity.get("NAME") != null ? entEntity.get("NAME").toString() : "");
		AcctBsSgmt.addElement("IDType")
				.setText(entEntity.get("ID_TYPE") != null ? entEntity.get("ID_TYPE").toString() : "");
		AcctBsSgmt.addElement("IDNum")
				.setText(entEntity.get("ID_NUM") != null ? entEntity.get("ID_NUM").toString() : "");
		AcctBsSgmt.addElement("MngmtOrgCode")
				.setText(entEntity.get("MNGMT_ORG_CODE") != null ? entEntity.get("MNGMT_ORG_CODE").toString() : "");
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
		
	}

}
