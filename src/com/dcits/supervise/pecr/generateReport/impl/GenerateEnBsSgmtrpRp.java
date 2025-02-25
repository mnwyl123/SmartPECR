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

import com.dcits.common.ChangeUtils;
import com.dcits.supervise.pecr.feedbackreport.service.ReportFeedBackMessageService;
import com.dcits.supervise.pecr.generateReport.entity.NeedReportDetail;
import com.dcits.supervise.pecr.generateReport.entity.ReportAndBackMessageEnt;
import com.dcits.supervise.pecr.generateReport.service.ReportMessageManager;
import com.dcits.supervise.pecr.util.CreateSerialNumber;
import com.dcits.supervise.pecr.util.FileUtil;
import com.dcits.supervise.pecr.util.PecrConstantUtil;

/**
 * 企业基本信息生成报文模块
 * 
 * @author munan
 *
 */
public class GenerateEnBsSgmtrpRp extends AbstractGenerateReport {

	private final static Logger logger = Logger.getLogger(GenerateEnBsSgmtrpRp.class);

	public Properties properties;
	
	public ReportMessageManager reportMessageService;

	private String table_name = "E_BS";

	private String PACKET_KEY = "EAA_BS_SGMT_ID";
	
	private int count =0;
	
	private String CCRC_ORG_CODE = "";

	public GenerateEnBsSgmtrpRp(Properties properties, ReportMessageManager reportMessageService) {
		this.properties = properties;
		this.reportMessageService = reportMessageService;
	}

	@Override
	public Properties getProperties() {
		return this.properties;
	}

	@Override
	public Map<String, Object> generateBody(NeedReportDetail needReportDetail,String name,ReportFeedBackMessageService reportFeedBackMessageService) throws Exception {
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
		reportCount.put("INF_REC_TYPE", PecrConstantUtil.ENT_BS_SGMT);
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
			//List<Map<String, Object>>  list = new ArrayList<Map<String, Object>>();
			
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
			reportCount.put("INF_REC_TYPE", PecrConstantUtil.ENT_BS_SGMT);
			//获取组织企业基本信息报文的数据
			List<Map<String, Object>>  list = reportMessageService.queryEntBsSgmtRpData(reportCount);
		    
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
			
			//根据发文获取相关子表信息的数据：其他标识信息段、主要组成人员段、注册资本及主要出资人段、企业实际控制人段。提示根据更新日期做好排序，后续使用直接去集合中第一个。
			//其他标识端
			//List<Map<String, Object>> rltlist = new ArrayList<Map<String, Object>>();
			List<Map<String, Object>> rltlist = reportMessageService.getIDSgmtByFactor(paaid);
			Map<String, List<Map<String, Object>>> rltmap = new HashMap<String, List<Map<String, Object>>>();
			for (int i = 0; i < rltlist.size();) {
				int tempNum = Integer.parseInt((rltlist.get(i).get("NUM")).toString());
				String tempName = rltlist.get(i).get("EAA_BS_SGMT_ID").toString();
				List<Map<String, Object>> tempList = new ArrayList<Map<String, Object>>();
				for (int j = i; j < (i + tempNum);) {
					tempList.add(rltlist.get(j));
					j++;
				}
				i = i + tempNum;
				rltmap.put(tempName, tempList);
			}
			//主要组成人员段
			//List<Map<String, Object>> mcclist = new ArrayList<Map<String, Object>>();
			List<Map<String, Object>> mcclist = reportMessageService.getMnMmbInfSgmtByFactor(paaid);
			Map<String, List<Map<String, Object>>> mccmap = new HashMap<String, List<Map<String, Object>>>();
			for (int i = 0; i < mcclist.size();) {
				int tempNum = Integer.parseInt((mcclist.get(i).get("NUM")).toString());
				String tempName = mcclist.get(i).get("EAA_BS_SGMT_ID").toString();
				List<Map<String, Object>> tempList = new ArrayList<Map<String, Object>>();
				for (int j = i; j < (i + tempNum);) {
					tempList.add(mcclist.get(j));
					j++;
				}
				i = i + tempNum;
				mccmap.put(tempName, tempList);
			}
			//注册资本及主要出资人段
			//List<Map<String, Object>> mshlist = new ArrayList<Map<String, Object>>();
			List<Map<String, Object>> mshlist = reportMessageService.getMnShaHodInfSgmtByFactor(paaid);
			Map<String, List<Map<String, Object>>> mshmap = new HashMap<String, List<Map<String, Object>>>();
			for (int i = 0; i < mshlist.size();) {
				int tempNum = Integer.parseInt((mshlist.get(i).get("NUM")).toString());
				String tempName = mshlist.get(i).get("EAA_BS_SGMT_ID").toString();
				List<Map<String, Object>> s = new ArrayList<Map<String, Object>>();
				for (int j = i; j < (i + tempNum);) {
					s.add(mshlist.get(j));
					j++;
				}
				i = i + tempNum;
				mshmap.put(tempName, s);
			}
			//企业实际控制人段
			//List<Map<String, Object>> acilistList<Map<String, Object>> acilist = new ArrayList<Map<String, Object>>();
			List<Map<String, Object>> acilist = reportMessageService.getActuCotrlInfSgmtByFactor(paaid);
			Map<String, List<Map<String, Object>>> acimap = new HashMap<String, List<Map<String, Object>>>();
			for (int i = 0; i < acilist.size();) {
				int tempNum = Integer.parseInt((acilist.get(i).get("NUM")).toString());
				String tempName = acilist.get(i).get("EAA_BS_SGMT_ID").toString();
				List<Map<String, Object>> s = new ArrayList<Map<String, Object>>();
				for (int j = i; j < (i + tempNum);) {
					s.add(acilist.get(j));
					j++;
				}
				i = i + tempNum;
				acimap.put(tempName, s);
			}
		
			// 开始生成xml格式的报文内容
			StringBuffer sbf = new StringBuffer();
			// 一个报文一个报文头；对于其他信息（除基本信息外的），填写空值（即，两个空格）
			if(f%fileForNum == 0){
				sbf.append(generateRpHead(PecrConstantUtil.ENT_BS_SGMT, numTotal[forTop++], "10"+CCRC_ORG_CODE));
				sbf.append("\r\n");
			}
			for (Map<String, Object> indvEntity : list) {
				Document document = DocumentHelper.createDocument();
				Element root = document.addElement("Document");
				Element InSecAcctInf = root.addElement("EnBasInf");
				//企业基本信息 --- 基础段
				Element GuarBsSgmt = InSecAcctInf.addElement("BsSgmt");
				writeGuarBsSgmt(GuarBsSgmt, indvEntity);
				//企业基本信息 ---其他标识信息段
				if (rltmap.get(indvEntity.get("EAA_BS_SGMT_ID").toString()) != null) {
					Element IDSgmt = InSecAcctInf.addElement("IDSgmt");
					writeIDSgmt(IDSgmt, rltmap.get(indvEntity.get("EAA_BS_SGMT_ID").toString()));
				}
				// 企业基本信息 --- 基本概况信息段
				if(indvEntity.get("NATIONALITY") != null && ! indvEntity.get("NATIONALITY").toString().equals("")){
					Element FcsInfSgmt = InSecAcctInf.addElement("FcsInfSgmt");
					writeGuarFcsInfSgmt(FcsInfSgmt, indvEntity);
				}
				
				/*** 企业基本信息主要组成人员段 ****/
				if (mccmap.get(indvEntity.get("EAA_BS_SGMT_ID").toString()) != null) {
					Element MnMmbInfSgmt = InSecAcctInf.addElement("MnMmbInfSgmt");
					writeMnMmbInfSgmt(MnMmbInfSgmt, mccmap.get(indvEntity.get("EAA_BS_SGMT_ID").toString()));
				}
				/*** 企业基本信息注册资本及主要出资人段 ****/
				if (mshmap.get(indvEntity.get("EAA_BS_SGMT_ID").toString()) != null) {
					Element MnShaHodInfSgmt = InSecAcctInf.addElement("MnShaHodInfSgmt");
					writeMnShaHodInfSgmt(MnShaHodInfSgmt, mshmap.get(indvEntity.get("EAA_BS_SGMT_ID").toString()));
				}
				/*** 企业基本信息实际控制人段 ****/
				if (acimap.get(indvEntity.get("EAA_BS_SGMT_ID").toString()) != null) {
					Element ActuCotrlInfSgmt = InSecAcctInf.addElement("ActuCotrlInfSgmt");
					writeActuCotrlInfSgmt(ActuCotrlInfSgmt, acimap.get(indvEntity.get("EAA_BS_SGMT_ID").toString()));
				}
				/*** 上级机构段 --- --- ****/
				if(indvEntity.get("SUP_ORG_TYPE") != null && ! indvEntity.get("SUP_ORG_TYPE").toString().equals("")){
					Element SpvsgAthrtyInfSgmt = InSecAcctInf.addElement("SpvsgAthrtyInfSgmt");
					writeSpvsgAthrtyInfSgmt(SpvsgAthrtyInfSgmt, indvEntity);
				}
				/**** 记录联系方式段 ***/
				if(indvEntity.get("COTA_INFO_UP_DATE") != null && ! indvEntity.get("COTA_INFO_UP_DATE").toString().equals("")){
					Element CotaInfSgmt = InSecAcctInf.addElement("CotaInfSgmt");
					writeCotaInfSgmtSgmt(CotaInfSgmt, indvEntity);
				}
				sbf.append(document.getRootElement().asXML());
				sbf.append("\r\n");
			}
		
			//组织报文名并插入报文内容
			if(f%fileForNum == 0){
				logger.info("开始获取流水号");
				Map<String,Object> serialNumMap = new HashMap<String,Object>();
				serialNumMap.put("inRefType", PecrConstantUtil.ENT_BS_SGMT);
				serialNumMap.put("company", company);
				CreateSerialNumber instance = CreateSerialNumber.getInstance();
				instance.setReportMessageManager(reportMessageService);
				String reportNum = instance.getSerialNumb(serialNumMap);
				reportName = generateRpName(PecrConstantUtil.ENT_BS_SGMT,reportNum, "0"+CCRC_ORG_CODE);
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
				rabme =  AbstractGenerateReport.generateRpMessage(rpt_date, rabme, PecrConstantUtil.ENT_BS_SGMT, reportName, 
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
		logger.info("XML格式BODY内容生成执行完成 -----------企业基本信息生成完毕");
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
				reportMessageService.updateGuarEntBsSgmtDataStatus(conditionMap);
				break;
			case PecrConstantUtil.BUSINESS_STATUS_90:
				conditionMap.put("BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_90);
				conditionMap.put("OLD_BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_85);
				reportMessageService.updateGuarEntBsSgmtDataStatus(conditionMap);
				break;
			case PecrConstantUtil.BUSINESS_STATUS_50:
				conditionMap.put("BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_50);
				conditionMap.put("OLD_BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_90);
				reportMessageService.updateGuarEntBsSgmtDataStatus(conditionMap);
				break;
			default:
				break;
			}
		}
	}

	public void writeGuarBsSgmt(Element GuarBsSgmt, Map<String, Object> indvEntity) {
		/*** 企业基本信息基础段 --- ***/
		GuarBsSgmt.addElement("InfRecType")
				.setText(indvEntity.get("INF_REC_TYPE") != null ? indvEntity.get("INF_REC_TYPE").toString() : "");
		GuarBsSgmt.addElement("EntName")
				.setText(indvEntity.get("ENT_NAME") != null ? indvEntity.get("ENT_NAME").toString() : "");
		GuarBsSgmt.addElement("EntCertType")
				.setText(indvEntity.get("ENT_CERT_TYPE") != null ? indvEntity.get("ENT_CERT_TYPE").toString() : "");
		GuarBsSgmt.addElement("EntCertNum")
				.setText(indvEntity.get("ENT_CERT_NUM") != null ? indvEntity.get("ENT_CERT_NUM").toString() : "");
		GuarBsSgmt.addElement("InfSurcCode")
				.setText(indvEntity.get("INF_SURC_CODE") != null ? indvEntity.get("INF_SURC_CODE").toString() : "");
		GuarBsSgmt.addElement("RptDate")
				.setText(indvEntity.get("RPT_DATE") != null ? indvEntity.get("RPT_DATE").toString() : "");
		GuarBsSgmt.addElement("RptDateCode")
				.setText(indvEntity.get("RPT_DATE_CODE") != null ? indvEntity.get("RPT_DATE_CODE").toString() : "");
		GuarBsSgmt.addElement("Cimoc")
				.setText(indvEntity.get("CIMOC") != null ? indvEntity.get("CIMOC").toString() : "");
		GuarBsSgmt.addElement("CustomerType")
				.setText(indvEntity.get("CUSTOMER_TYPE") != null ? indvEntity.get("CUSTOMER_TYPE").toString() : "");
		GuarBsSgmt.addElement("EtpSts")
				.setText(indvEntity.get("ETP_STS") != null ? indvEntity.get("ETP_STS").toString() : "");
		GuarBsSgmt.addElement("OrgType")
				.setText(indvEntity.get("ORG_TYPE") != null ? indvEntity.get("ORG_TYPE").toString() : "");
	}

	public void writeIDSgmt(Element IDSgmt, List<Map<String, Object>> borrower) {
		// 还款人段
		IDSgmt.addElement("IDNm").setText(String.valueOf(borrower.size()));
		for (Map<String, Object> map : borrower) {
			Element RltRepymtInf = IDSgmt.addElement("IDRec");
			RltRepymtInf.addElement("OthEntCertType").setText(
					map.get("OTH_ENT_CERT_TYPE") != null ? map.get("OTH_ENT_CERT_TYPE").toString() : "");
			RltRepymtInf.addElement("OthEntCertNum").setText(
					map.get("OTH_ENT_CERT_NUM") != null ? map.get("OTH_ENT_CERT_NUM").toString() : "");
		}
		IDSgmt.addElement("IDInfoUpDate").setText(borrower.get(0).get("ID_INFO_UP_DATE") != null
				? borrower.get(0).get("ID_INFO_UP_DATE").toString() : "");
	}

	public void writeGuarFcsInfSgmt(Element FcsInfSgmt, Map<String, Object> indvEntity) {
		/*** 基本概况信息段 --- ***/
		FcsInfSgmt.addElement("Nationality")
				.setText(indvEntity.get("NATIONALITY") != null ? indvEntity.get("NATIONALITY").toString() : "");
		FcsInfSgmt.addElement("RegAdd")
				.setText(indvEntity.get("REG_ADD") != null ? indvEntity.get("REG_ADD").toString() : "");
		FcsInfSgmt.addElement("AdmDivOfReg")
				.setText(indvEntity.get("ADM_DIV_OF_REG") != null ? indvEntity.get("ADM_DIV_OF_REG").toString() : "");
		FcsInfSgmt.addElement("EstablishDate")
				.setText(indvEntity.get("ESTABLISH_DATE") != null ? indvEntity.get("ESTABLISH_DATE").toString() : "");
		FcsInfSgmt.addElement("BizEndDate")
				.setText(indvEntity.get("BIZ_END_DATE") != null ? indvEntity.get("BIZ_END_DATE").toString() : "");
		FcsInfSgmt.addElement("BizRange")
				.setText(indvEntity.get("BIZ_RANGE") != null ? indvEntity.get("BIZ_RANGE").toString() : "");
		FcsInfSgmt.addElement("EcoIndusCate")
				.setText(indvEntity.get("ECO_INDUS_CATE") != null ? indvEntity.get("ECO_INDUS_CATE").toString() : "");
		FcsInfSgmt.addElement("EcoType")
				.setText(indvEntity.get("ECO_TYPE") != null ? indvEntity.get("ECO_TYPE").toString() : "");
		FcsInfSgmt.addElement("EntScale")
				.setText(indvEntity.get("ENT_SCALE") != null ? indvEntity.get("ENT_SCALE").toString() : "");
		FcsInfSgmt.addElement("FcsInfoUpDate").setText(
				indvEntity.get("FCS_INFO_UP_DATE") != null ? indvEntity.get("FCS_INFO_UP_DATE").toString() : "");
	}
	//主要组成人员段
	public void writeMnMmbInfSgmt(Element MnMmbInfSgmt, List<Map<String, Object>> borrower) {
		MnMmbInfSgmt.addElement("MmbNm").setText(String.valueOf(borrower.size()));
		for (Map<String, Object> map : borrower) {
			Element MmbInf = MnMmbInfSgmt.addElement("MmbInf");
			MmbInf.addElement("MmbAlias")
					.setText(map.get("MMB_ALIAS") != null ? map.get("MMB_ALIAS").toString() : "");
			MmbInf.addElement("MmbIDType")
					.setText(map.get("MMB_ID_TYPE") != null ? map.get("MMB_ID_TYPE").toString() : "");
			MmbInf.addElement("MmbIDNum")
					.setText(map.get("MMB_ID_NUM") != null ? map.get("MMB_ID_NUM").toString() : "");
			MmbInf.addElement("MmbPstn")
					.setText(map.get("MMB_PSTN") != null ? map.get("MMB_PSTN").toString() : "");
		}
		MnMmbInfSgmt.addElement("MnMmbInfoUpDate").setText(borrower.get(0).get("MN_MMB_INFO_UPDATE") != null
				? borrower.get(0).get("MN_MMB_INFO_UPDATE").toString() : "");
	}

	public void writeMnShaHodInfSgmt(Element MnShaHodInfSgmt, List<Map<String, Object>> borrower) {
		MnShaHodInfSgmt.addElement("RegCapCurrency").setText(borrower.get(0).get("REG_CAP_CURRENCY") != null
				? borrower.get(0).get("REG_CAP_CURRENCY").toString() : "");
		MnShaHodInfSgmt.addElement("RegCap").setText(
				borrower.get(0).get("REG_CAP") != null ? borrower.get(0).get("REG_CAP").toString() : "");
		//xml标签不能这么直接取MnSharHodNm，因为可能没有主要出资人。所以需要先进行判断是否存在出资人相关信息
		if(borrower.get(0).get("SHAR_HOD_TYPE") != null && !"".equals(borrower.get(0).get("SHAR_HOD_TYPE").toString())){
			MnShaHodInfSgmt.addElement("MnSharHodNm").setText(String.valueOf(borrower.size()));
			for (Map<String, Object> map : borrower) {
				if(map.get("SHAR_HOD_TYPE")!= null && !map.get("SHAR_HOD_TYPE").toString().toString().equals("")){
					Element SharHodInf = MnShaHodInfSgmt.addElement("SharHodInf");
					SharHodInf.addElement("SharHodType")
							.setText(map.get("SHAR_HOD_TYPE") != null ? map.get("SHAR_HOD_TYPE").toString() : "");
					SharHodInf.addElement("SharHodCertType").setText(
							map.get("SHAR_HOD_CERT_TYPE") != null ? map.get("SHAR_HOD_CERT_TYPE").toString() : "");
					SharHodInf.addElement("SharHodName")
							.setText(map.get("SHAR_HOD_NAME") != null ? map.get("SHAR_HOD_NAME").toString() : "");
					SharHodInf.addElement("SharHodIDType").setText(
							map.get("SHAR_HOD_ID_TYPE") != null ? map.get("SHAR_HOD_ID_TYPE").toString() : "");
					SharHodInf.addElement("SharHodIDNum").setText(
							map.get("SHAR_HOD_ID_NUM") != null ? map.get("SHAR_HOD_ID_NUM").toString() : "");
					SharHodInf.addElement("InvRatio")
							.setText(map.get("INV_RATIO") != null ? ChangeUtils.stringToFStr(map.get("INV_RATIO").toString()): "");
				}	
			}
		}else{
			MnShaHodInfSgmt.addElement("MnSharHodNm").setText(String.valueOf(0));
		}
		MnShaHodInfSgmt.addElement("MnShaHodInfoUpDate")
				.setText(borrower.get(0).get("MN_SHA_HOD_INFO_UP_DATE").toString() != null
						? borrower.get(0).get("MN_SHA_HOD_INFO_UP_DATE").toString() : "");
	}

	public void writeActuCotrlInfSgmt(Element ActuCotrlInfSgmt, List<Map<String, Object>> borrower) {
		ActuCotrlInfSgmt.addElement("ActuCotrlNm").setText(String.valueOf(borrower.size()));
		for (Map<String, Object> map : borrower) {
			if(map.get("ACTU_COTRL_CERT_TYPE") != null && ! map.get("ACTU_COTRL_CERT_TYPE").toString().equals("")){
				Element ActuCotrlInf = ActuCotrlInfSgmt.addElement("ActuCotrlInf");
				ActuCotrlInf.addElement("ActuCotrlCertType").setText(map.get("ACTU_COTRL_CERT_TYPE") != null
						? map.get("ACTU_COTRL_CERT_TYPE").toString() : "");
				ActuCotrlInf.addElement("ActuCotrlName").setText(
						map.get("ACTU_COTRL_NAME") != null ? map.get("ACTU_COTRL_NAME").toString() : "");
				ActuCotrlInf.addElement("ActuCotrlIDType").setText(
						map.get("ACTU_COTRL_ID_TYPE") != null ? map.get("ACTU_COTRL_ID_TYPE").toString() : "");
				ActuCotrlInf.addElement("ActuCotrlIDNum").setText(
						map.get("ACTU_COTRL_ID_NUM") != null ? map.get("ACTU_COTRL_ID_NUM").toString() : "");
			}
			
		}
		ActuCotrlInfSgmt.addElement("ActuCotrlInfoUpDate")
				.setText(borrower.get(0).get("ACTU_COTRL_INFO_UPDATE").toString() != null
						? borrower.get(0).get("ACTU_COTRL_INFO_UPDATE").toString() : "");
	}

	public void writeSpvsgAthrtyInfSgmt(Element SpvsgAthrtyInfSgmt, Map<String, Object> indvEntity) {
		/*** 上级机构段 --- ***/
		SpvsgAthrtyInfSgmt.addElement("SupOrgType")
				.setText(indvEntity.get("SUP_ORG_TYPE") != null ? indvEntity.get("SUP_ORG_TYPE").toString() : "");
		SpvsgAthrtyInfSgmt.addElement("SupOrgName")
				.setText(indvEntity.get("SUP_ORG_NAME") != null ? indvEntity.get("SUP_ORG_NAME").toString() : "");
		SpvsgAthrtyInfSgmt.addElement("SupOrgCertType").setText(
				indvEntity.get("SUP_ORG_CERT_TYPE") != null ? indvEntity.get("SUP_ORG_CERT_TYPE").toString() : "");
		SpvsgAthrtyInfSgmt.addElement("SupOrgCertNum").setText(
				indvEntity.get("SUP_ORG_CERT_NUM") != null ? indvEntity.get("SUP_ORG_CERT_NUM").toString() : "");
		SpvsgAthrtyInfSgmt.addElement("SupOrgInfoUpDate").setText(indvEntity.get("SUP_ORG_INFO_UP_DATE") != null
				? indvEntity.get("SUP_ORG_INFO_UP_DATE").toString() : "");
	}

	public void writeCotaInfSgmtSgmt(Element CotaInfSgmt, Map<String, Object> indvEntity) {
		/*** 记录联系方式段 --- ***/
		CotaInfSgmt.addElement("ConAddDistrictCode").setText(indvEntity.get("CON_ADD_DISTRICT_CODE") != null
				? indvEntity.get("CON_ADD_DISTRICT_CODE").toString() : "");
		CotaInfSgmt.addElement("ConAdd")
				.setText(indvEntity.get("CON_ADD") != null ? indvEntity.get("CON_ADD").toString() : "");
		CotaInfSgmt.addElement("ConPhone")
				.setText(indvEntity.get("CON_PHONE") != null ? indvEntity.get("CON_PHONE").toString() : "");
		CotaInfSgmt.addElement("FinConPhone")
				.setText(indvEntity.get("FIN_CON_PHONE") != null ? indvEntity.get("FIN_CON_PHONE").toString() : "");
		CotaInfSgmt.addElement("CotaInfoUpDate").setText(
				indvEntity.get("COTA_INFO_UP_DATE") != null ? indvEntity.get("COTA_INFO_UP_DATE").toString() : "");
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
