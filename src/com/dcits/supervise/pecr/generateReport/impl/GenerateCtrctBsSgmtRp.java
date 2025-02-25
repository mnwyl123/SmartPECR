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
 * 个人授信正常记录报文生成
 * 
 * @author munan
 *
 */
public class GenerateCtrctBsSgmtRp extends AbstractGenerateReport {

	private final static Logger logger = Logger.getLogger(GenerateCtrctBsSgmtRp.class);

	public Properties properties;
	private String reportFilePath;

	public ReportMessageManager reportMessageService;

	private static String table_name = "I_CTRCT_BS";

	private static String PACKET_KEY = "PCA_CTRCT_BS_SGMT_ID";
	
	private int count =0;
	
	private String CCRC_ORG_CODE = "";

	public GenerateCtrctBsSgmtRp(Properties properties, ReportMessageManager reportMessageService) {
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
		int pageSize = Integer.parseInt(properties.getProperty("saveMaxDataNumb"));
		// 获取要生成的报文总条数
		reportCount.put("table_name", table_name);
		reportCount.put("rpt_date", needReportDetail.getRptDate());
		reportCount.put("company", needReportDetail.getCompany());
		//信息记录类型
		reportCount.put("INF_REC_TYPE", PecrConstantUtil.CTRCT_BS_SGMT);
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
		for (int f = 0; f < forNum; f++) {
			List<Map<String, Object>> list = null;

			// 更新状态为“生成中”
			logger.info("开始更改状态为生成中");
			needReportDetail.setBusinessState(PecrConstantUtil.BUSINESS_STATUS_90);
			updateBusinessState(needReportDetail);
			logger.info("更改状态完成");

			reportCount.clear();
			reportCount.put("rpt_date", needReportDetail.getRptDate());
			reportCount.put("pageSize", pageSize+1);
			reportCount.put("pk", needReportDetail.getSpecialObj());
			reportCount.put("company", needReportDetail.getCompany());
			reportCount.put("INF_REC_TYPE", PecrConstantUtil.CTRCT_BS_SGMT);
			//获取组织个人授信协议信息报文所需要的数据
			list = reportMessageService.queryInCtrctInfRpData(reportCount);
			// 存放报文名和对应数据ID的map
			List<String> paaid = new ArrayList<>();
			List<Map<String,String>> pkColnumList = new ArrayList<Map<String,String>>();
			for (int i = 0; i < list.size(); i++) {
				Map<String, Object> ctrctBsSgmtMap = list.get(i);
				String pk = ctrctBsSgmtMap.get("PCA_CTRCT_BS_SGMT_ID").toString();
				//代表每一个主键在报文文件中的行数（报文头不算）
				String colnum = String.valueOf(((i+1)+(f*pageSize)) % (pageSize*fileForNum));
				paaid.add(pk);
				Map<String,String> mapTmp = new HashMap<String,String>();
				mapTmp.put("pk", pk);
				mapTmp.put("colnum", colnum);
				pkColnumList.add(mapTmp);
			}
			// 获取共同授信人的数据信息（通过order by 字段PCA_CTRCT_BS_SGMT_ID
			// 将相同的连续放在一起，其外获取每一种相同PCA_CTRCT_BS_SGMT_ID的条数也返回到当前数据中 ）
			// 依据返回结果，将相同PCA_CTRCT_BS_SGMT_ID的数据放入一个list中，在将PCA_CTRCT_BS_SGMT_ID的值作为key形成一个map，方便其他标识段的生成和减少频繁数据库的访问
			List<Map<String, Object>> relList = reportMessageService.getCtrctCertRelRpMsgByFactor(paaid);
			//放置共同授信人信息数据
			Map<String, List<Map<String, Object>>> map = new HashMap<String, List<Map<String, Object>>>();
			if(relList!=null){
				for (int i = 0; i < relList.size();) {
					int tempNum = Integer.parseInt((relList.get(i).get("NUM")).toString());
					String tempName = relList.get(i).get("PCA_CTRCT_BS_SGMT_ID").toString();
					List<Map<String, Object>> s = new ArrayList<Map<String, Object>>();
					for (int j = i; j < (i + tempNum);) {
						s.add(relList.get(j));
						j++;
					}
					i = i + tempNum;
					map.put(tempName, s);
				}
				
			}
			// 开始生成xml格式的报文内容
			StringBuffer sbf = new StringBuffer();
			//一个文件只能有一个报文头
			if(f%fileForNum == 0){
				String headStr=generateRpHead(PecrConstantUtil.CTRCT_BS_SGMT, numTotal[forTop++], "  "+CCRC_ORG_CODE);
				sbf.append(headStr);
				sbf.append("\r\n");
			}
			for (Map<String, Object> indvEntity : list) {
				Document document = DocumentHelper.createDocument();
				Element root = document.addElement("Document");
				Element InCtrctInf = root.addElement("InCtrctInf");
				/*** 个人授信信息 --- 基础段 ****/
				Element CtrctBsSgmt = InCtrctInf.addElement("CtrctBsSgmt");
				writeCtrctBsSgmt(CtrctBsSgmt, indvEntity);
				/*** 个人授信信息 --- -共同授信人段-- ****/
				if (map.get(indvEntity.get("PCA_CTRCT_BS_SGMT_ID").toString()) != null) {
					Element CtrctCertRelSgmt = InCtrctInf.addElement("CtrctCertRelSgmt");
					writeCtrctCertRelSgmt(CtrctCertRelSgmt, map.get(indvEntity.get("PCA_CTRCT_BS_SGMT_ID").toString()));
				}
				/*** 个人授信信息 --- -记录额度段-- ****/
				Element CreditLimSgmt = InCtrctInf.addElement("CreditLimSgmt");
				writeCreditLimSgmt(CreditLimSgmt, indvEntity);
				sbf.append(document.getRootElement().asXML());
				sbf.append("\r\n");
			}
			//韦宗英 add 生成新的报文  55 
			if(f%fileForNum == 0){
				// 报文名称
				logger.info("开始获取流水号");
				Map<String,Object> serialNumMap = new HashMap<String,Object>();
				serialNumMap.put("inRefType", PecrConstantUtil.CTRCT_BS_SGMT);
				serialNumMap.put("company", company);
				CreateSerialNumber instance = CreateSerialNumber.getInstance();
				instance.setReportMessageManager(reportMessageService);
				String reportNum = instance.getSerialNumb(serialNumMap);
				reportName = generateRpName(PecrConstantUtil.CTRCT_BS_SGMT,reportNum, "0"+CCRC_ORG_CODE);
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
			
			logger.info("开始更新数据信息");
			//needReportDetail.setBusinessState(PecrConstantUtil.BUSINESS_STATUS_50);
			//updateBusinessState(needReportDetail);
			logger.info("更新数据信息完成");
			
			// 韦宗英 add 总数追加  66 
			toalNum +=list.size();
		
			//韦宗英  update  生成一条报文并且开线程处理预处理  77
			if((f+1)%fileForNum == 0||f==(forNum-1)){
					logger.info("写入报文执行完成");
					// 组织插入对象
					ReportAndBackMessageEnt rabme = new ReportAndBackMessageEnt();
					String rpt_date = needReportDetail.getRptDate().get(0).toString();
					rabme =  AbstractGenerateReport.generateRpMessage(rpt_date, rabme, PecrConstantUtil.CTRCT_BS_SGMT, reportName, 
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
				logger.info("XML格式BODY内容生成执行完成--------------个人授信协议信息生成完毕");
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
				reportMessageService.updateInCtrctInfRpDataStatus(conditionMap);
				break;
			case PecrConstantUtil.BUSINESS_STATUS_90:
				conditionMap.put("BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_90);
				conditionMap.put("OLD_BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_85);
				reportMessageService.updateInCtrctInfRpDataStatus(conditionMap);
				break;
			case PecrConstantUtil.BUSINESS_STATUS_50:
				conditionMap.put("BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_50);
				conditionMap.put("OLD_BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_90);
				reportMessageService.updateInCtrctInfRpDataStatus(conditionMap);
				break;
			default:
				break;
			}
		}
	}

	// 个人授信基础
	public static void writeCtrctBsSgmt(Element CtrctBsSgmt, Map<String, Object> indvEntity) {
		CtrctBsSgmt.addElement("InfRecType")
				.setText(indvEntity.get("INF_REC_TYPE") != null ? indvEntity.get("INF_REC_TYPE").toString() : "");
		CtrctBsSgmt.addElement("ContractCode") 
				.setText(indvEntity.get("CONTRACT_CODE") != null ? indvEntity.get("CONTRACT_CODE").toString() : "");
		CtrctBsSgmt.addElement("RptDate")
				.setText(indvEntity.get("RPT_DATE") != null ? indvEntity.get("RPT_DATE").toString() : "");
		CtrctBsSgmt.addElement("RptDateCode")
				.setText(indvEntity.get("RPT_DATE_CODE") != null ? indvEntity.get("RPT_DATE_CODE").toString() : "");
		CtrctBsSgmt.addElement("Name").setText(indvEntity.get("NAME") != null ? indvEntity.get("NAME").toString() : "");
		CtrctBsSgmt.addElement("IDType")
				.setText(indvEntity.get("ID_TYPE") != null ? indvEntity.get("ID_TYPE").toString() : "");
		CtrctBsSgmt.addElement("IDNum")
				.setText(indvEntity.get("ID_NUM") != null ? indvEntity.get("ID_NUM").toString() : "");
		CtrctBsSgmt.addElement("MngmtOrgCode")
				.setText(indvEntity.get("MNGMT_ORG_CODE") != null ? indvEntity.get("MNGMT_ORG_CODE").toString() : "");
	}

	// 个人授信授信人
	public static void writeCtrctCertRelSgmt(Element CtrctCertRelSgmt, List<Map<String, Object>> borrower) {
		CtrctCertRelSgmt.addElement("BrerNm").setText(String.valueOf(borrower.size()));
		for (Map<String, Object> map : borrower) {
			Element CtrctCertRel = CtrctCertRelSgmt.addElement("CtrctCertRel");
			CtrctCertRel.addElement("BrerType")
					.setText(map.get("BRER_TYPE") != null ? map.get("BRER_TYPE").toString() : "");
			CtrctCertRel.addElement("CertRelName")
					.setText(map.get("CERT_REL_NAME") != null ? map.get("CERT_REL_NAME").toString() : "");
			CtrctCertRel.addElement("CertRelIDType").setText(
					map.get("CERT_REL_ID_TYPE") != null ? map.get("CERT_REL_ID_TYPE").toString() : "");
			CtrctCertRel.addElement("CertRelIDNum").setText(
					map.get("CERT_REL_ID_NUM") != null ? map.get("CERT_REL_ID_NUM").toString() : "");
		}
	}

	// 个人授信记录额度
	public static void writeCreditLimSgmt(Element CreditLimSgmt, Map<String, Object> indvEntity) {
		CreditLimSgmt.addElement("CreditLimType")
				.setText(indvEntity.get("CREDIT_LIM_TYPE") != null ? indvEntity.get("CREDIT_LIM_TYPE").toString() : "");
		CreditLimSgmt.addElement("LimLoopFlg")
				.setText(indvEntity.get("LIM_LOOP_FLG") != null ? indvEntity.get("LIM_LOOP_FLG").toString() : "");
		CreditLimSgmt.addElement("CreditLim")
				.setText(indvEntity.get("CREDIT_LIM") != null ? indvEntity.get("CREDIT_LIM").toString() : "");
		CreditLimSgmt.addElement("Cy")
				.setText(indvEntity.get("CY") != null ? indvEntity.get("CY").toString() : "");
		CreditLimSgmt.addElement("ConEffDate")
				.setText(indvEntity.get("CON_EFF_DATE") != null ? indvEntity.get("CON_EFF_DATE").toString() : "");
		CreditLimSgmt.addElement("ConExpDate")
				.setText(indvEntity.get("CON_EXP_DATE") != null ? indvEntity.get("CON_EXP_DATE").toString() : "");
		CreditLimSgmt.addElement("ConStatus")
				.setText(indvEntity.get("CON_STATUS") != null ? indvEntity.get("CON_STATUS").toString() : "");
		if (indvEntity.get("CREDIT_REST") != null && !indvEntity.get("CREDIT_REST").toString().equals("")) {
			CreditLimSgmt.addElement("CreditRest").setText(indvEntity.get("CREDIT_REST").toString());
		}
		if (indvEntity.get("CREDIT_REST_CODE") != null && !indvEntity.get("CREDIT_REST_CODE").toString().equals("")) {
			CreditLimSgmt.addElement("CreditRestCode").setText(indvEntity.get("CREDIT_REST_CODE").toString());
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
		// TODO Auto-generated method stub
		
	}	
}
