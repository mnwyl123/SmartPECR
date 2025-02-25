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
 * 企业现金流量表信息记录生成报文
 * 
 * @author munan
 *
 */
public class GenerateEntCashFlowsRp extends AbstractGenerateReport {

	private final static Logger logger = Logger.getLogger(GenerateEntCashFlowsRp.class);

	public Properties properties;

	public ReportMessageManager reportMessageService;

	private static String TABLE_NAME = "E_CASH_FLOWS_BS";

	private static String PACKET_KEY = "EJA_CASH_FLOWS_BS_SGMT_ID";
	
	private int count =0;
	
	private String CCRC_ORG_CODE = "";

	public GenerateEntCashFlowsRp(Properties properties, ReportMessageManager reportMessageService) {
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
		//没有后缀
		String reportName = "";
		String reportFilePath = "";
		//返回结果集合
		Map<String, Object> reportMap = new HashMap<>();
		reportMap.put("resultCode", "SUCCESS");
		reportMap.put("resultMsg", "生成报文文件成功");
		Properties properties2 =  PropertiesLoaderUtils.loadAllProperties("serverThread.properties");
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
		reportCount.put("table_name", TABLE_NAME);
		reportCount.put("rpt_date", needReportDetail.getRptDate());
		reportCount.put("company", needReportDetail.getCompany());
		//信息记录类型
		reportCount.put("INF_REC_TYPE",PecrConstantUtil.ENT_CASH_FLOWS);
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
		int toalNum = 0;
		Map<String, Object> rpmap = new HashMap<>();
		//每次查询1000条数据，进行相关报文的组装拼接然后写入报文文件中
		for (int f = 0; f < forNum; f++) {
			List<Map<String, Object>> list = null;
			// 更新状态为“生成中”
			logger.info("开始更改状态为生成中");
			needReportDetail.setBusinessState(PecrConstantUtil.BUSINESS_STATUS_90);
			updateBusinessState(needReportDetail);
			logger.info("更改状态完成");
			
			reportCount.clear();
			reportCount.put("RptDate", needReportDetail.getRptDate());
			//+1,是因为mapper文件中使用的是<号
			reportCount.put("pageSize", pageSize+1);
			reportCount.put("pk", needReportDetail.getSpecialObj());
			reportCount.put("company", needReportDetail.getCompany());
			reportCount.put("INF_REC_TYPE",PecrConstantUtil.ENT_CASH_FLOWS);
			//获取组装企业资产负债所要的数据信息
			list = reportMessageService.queryEntCashFlowsRpData(reportCount);
			// 存放报文名和对应数据ID的map
			List<String> paaid = new ArrayList<>();
			List<Map<String,String>> pkColnumList = new ArrayList<Map<String,String>>();
			//这里斗胆利用了List集合的有序性
			for(int i=0;i<list.size();i++){
				Map<String, Object> entCashFlowsEntity = list.get(i);
				String pk = entCashFlowsEntity.get("EJA_CASH_FLOWS_BS_SGMT_ID").toString();
				paaid.add(pk);
				//代表每一个主键在报文文件中的行数（报文头不算）
				String colnum = String.valueOf(((i+1)+(f*pageSize)) % (pageSize*fileForNum));
				Map<String,String> mapTmp = new HashMap<String,String>();
				mapTmp.put("pk", pk);
				mapTmp.put("colnum", colnum);
				pkColnumList.add(mapTmp);
			}
			
			// 开始生成xml格式的报文内容
			StringBuffer sbf = new StringBuffer();
			//一个报文一个报文头；对于其他信息（除基本信息外的），填写空值（即，两个空格）
			if(f%fileForNum == 0){
				String headStr = generateRpHead(PecrConstantUtil.ENT_CASH_FLOWS, numTotal[forTop++], "  "+CCRC_ORG_CODE);
				sbf.append(headStr);
				sbf.append("\r\n");
			}
			for (Map<String, Object> entEntity : list) {
				Document document = DocumentHelper.createDocument();
				Element root = document.addElement("Document");
				Element InCtrctInf = root.addElement("CashFlows");
				/*** 企业现金流量表 --- 基础段 ****/
				Element CashFlowsBsSgmt = InCtrctInf.addElement("CashFlowsBsSgmt");
				writeCashFlowsBsSgmt(CashFlowsBsSgmt, entEntity);
				if (entEntity.get("EJB_CASH_FLOWS2002_SGMT_ID") != null
						&& entEntity.get("EJB_CASH_FLOWS2002_SGMT_ID").toString() != "") {
					/*** 企业现金流量表 --- -2002版段-- ****/
					Element CashFlows2002Sgmt = InCtrctInf.addElement("CashFlows2002Sgmt");
					writeCashFlows2002Sgmt(CashFlows2002Sgmt, entEntity);
				} else {
					/*** 企业现金流量表 --- -2007版段-- ****/
					if (entEntity.get("EJC_CASH_FLOWS2007_SGMT_ID") != null
							&& !entEntity.get("EJC_CASH_FLOWS2007_SGMT_ID").toString().equals("")) {
						Element CashFlows2007Sgmt = InCtrctInf.addElement("CashFlows2007Sgmt");
						writeCashFlows2007Sgmt(CashFlows2007Sgmt, entEntity);
					}
				}
				
				sbf.append(document.getRootElement().asXML());
				sbf.append("\r\n");
			}
			
			if(f%fileForNum == 0){
				// 报文名称
				logger.info("开始获取流水号");
				Map<String,Object> serialNumMap = new HashMap<String,Object>();
				serialNumMap.put("inRefType", PecrConstantUtil.ENT_CASH_FLOWS);
				serialNumMap.put("company", company);
				CreateSerialNumber instance = CreateSerialNumber.getInstance();
				instance.setReportMessageManager(reportMessageService);
				String reportNum = instance.getSerialNumb(serialNumMap);
				reportName = generateRpName(PecrConstantUtil.ENT_CASH_FLOWS,reportNum, "0"+CCRC_ORG_CODE);
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

			//开始为每条记录插入报文名称
			logger.info("开始为每条记录插入报文名称以及在报文中的行数");
			insertReportNameAndColnumForData(rpmap);
			rpmap.clear();
			logger.info("已完成为每条记录插入报文名称以及在报文中的行数");
			
			logger.info("开始更新数据信息");
			//needReportDetail.setBusinessState(PecrConstantUtil.BUSINESS_STATUS_50);
			//updateBusinessState(needReportDetail);
			logger.info("更新数据信息完成");
			
			toalNum +=list.size();
			//韦宗英  update  生成一条报文并且开线程处理预处理  77
			if((f+1)%fileForNum == 0||f==(forNum-1)){
				logger.info("写入报文执行完成");
				// 组织插入对象
				ReportAndBackMessageEnt rabme = new ReportAndBackMessageEnt();
				String rpt_date = needReportDetail.getRptDate().get(0).toString();
				rabme = AbstractGenerateReport.generateRpMessage(rpt_date, rabme, PecrConstantUtil.ENT_CASH_FLOWS,reportName, 
						Float.valueOf(toalNum), saveCreateReportPath, name,company);
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
		logger.info("XML格式BODY内容生成执行完成--------------企业现金流量信息生成完毕");
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
				reportMessageService.updateEntCashFlowsRpDataStatus(conditionMap);
				break;
			case PecrConstantUtil.BUSINESS_STATUS_90:
				conditionMap.put("BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_90);
				conditionMap.put("OLD_BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_85);
				reportMessageService.updateEntCashFlowsRpDataStatus(conditionMap);
				break;
			case PecrConstantUtil.BUSINESS_STATUS_50:
				conditionMap.put("BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_50);
				conditionMap.put("OLD_BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_90);
				reportMessageService.updateEntCashFlowsRpDataStatus(conditionMap);
				break;
			default:
				break;
			}
		}
	}

	// 企业授信基础

	public void writeCashFlowsBsSgmt(Element CashFlowsBsSgmt, Map<String, Object> entEntity) {
		CashFlowsBsSgmt.addElement("InfRecType")
				.setText(entEntity.get("INF_REC_TYPE") != null ? entEntity.get("INF_REC_TYPE").toString() : "");
		CashFlowsBsSgmt.addElement("EntName")
				.setText(entEntity.get("ENT_NAME") != null ? entEntity.get("ENT_NAME").toString() : "");
		CashFlowsBsSgmt.addElement("EntCertType")
				.setText(entEntity.get("ENT_CERT_TYPE") != null ? entEntity.get("ENT_CERT_TYPE").toString() : "");
		CashFlowsBsSgmt.addElement("EntCertNum")
				.setText(entEntity.get("ENT_CERT_NUM") != null ? entEntity.get("ENT_CERT_NUM").toString() : "");
		CashFlowsBsSgmt.addElement("RptDate")
				.setText(entEntity.get("RPT_DATE") != null ? entEntity.get("RPT_DATE").toString() : "");
		CashFlowsBsSgmt.addElement("SheetYear")
				.setText(entEntity.get("SHEET_YEAR") != null ? entEntity.get("SHEET_YEAR").toString() : "");
		CashFlowsBsSgmt.addElement("SheetType")
				.setText(entEntity.get("SHEET_TYPE") != null ? entEntity.get("SHEET_TYPE").toString() : "");
		CashFlowsBsSgmt.addElement("SheetTypeDivide").setText(
				entEntity.get("SHEET_TYPE_DIVIDE") != null ? entEntity.get("SHEET_TYPE_DIVIDE").toString() : "");
		CashFlowsBsSgmt.addElement("AuditFirmName")
				.setText(entEntity.get("AUDIT_FIRM_NAME") != null ? entEntity.get("AUDIT_FIRM_NAME").toString() : "");
		CashFlowsBsSgmt.addElement("AuditorName")
				.setText(entEntity.get("AUDITOR_NAME") != null ? entEntity.get("AUDITOR_NAME").toString() : "");
		CashFlowsBsSgmt.addElement("AuditTime")
				.setText(entEntity.get("AUDIT_TIME") != null ? entEntity.get("AUDIT_TIME").toString() : "");
		CashFlowsBsSgmt.addElement("Cimoc")
				.setText(entEntity.get("CIMOC") != null ? entEntity.get("CIMOC").toString() : "");
		CashFlowsBsSgmt.addElement("RptDateCode")
				.setText(entEntity.get("RPT_DATE_CODE") != null ? entEntity.get("RPT_DATE_CODE").toString() : "");
	}

	public void writeCashFlows2002Sgmt(Element CashFlows2002Sgmt, Map<String, Object> entEntity) {
		CashFlows2002Sgmt.addElement("CashReceivedFromSalesOfGoodsOrRendingOfServices")
				.setText(entEntity.get("CASH_RECEIVED_FROM_SALES_OF_GO") != null
						? ChangeUtils.stringToFStr(entEntity.get("CASH_RECEIVED_FROM_SALES_OF_GO").toString()) : "");
		CashFlows2002Sgmt.addElement("TaxRefunds")
				.setText(entEntity.get("TAX_REFUNDS") != null ? ChangeUtils.stringToFStr(entEntity.get("TAX_REFUNDS").toString()) : "");
		CashFlows2002Sgmt.addElement("OtherCashReceivedRelatingToOperatingActivities")
				.setText(entEntity.get("OTHER_CASH_RECEIVED_RELATING_T") != null
						? ChangeUtils.stringToFStr(entEntity.get("OTHER_CASH_RECEIVED_RELATING_T").toString()) : "");
		CashFlows2002Sgmt.addElement("TotalCashInflowsFromOperatingActivities")
				.setText(entEntity.get("TOTAL_CASH_INFLOWS_FROM_OPERAT") != null
						? ChangeUtils.stringToFStr(entEntity.get("TOTAL_CASH_INFLOWS_FROM_OPERAT").toString()) : "");
		CashFlows2002Sgmt.addElement("CashPaidForGoodsAndServices")
				.setText(entEntity.get("CASH_PAID_FOR_GOODS_AND_SERVIC") != null
						? ChangeUtils.stringToFStr(entEntity.get("CASH_PAID_FOR_GOODS_AND_SERVIC").toString()) : "");
		CashFlows2002Sgmt.addElement("CashPaidToAndOnBehalfOfEmployees")
				.setText(entEntity.get("CASH_PAID_TO_AND_ON_BEHALF_OF_") != null
						? ChangeUtils.stringToFStr(entEntity.get("CASH_PAID_TO_AND_ON_BEHALF_OF_").toString()) : "");
		CashFlows2002Sgmt.addElement("PaymentsOfAllTypesOfTaxes")
				.setText(entEntity.get("PAYMENTS_OF_ALL_TYPES_OF_TAXES")!=null
						? ChangeUtils.stringToFStr(entEntity.get("PAYMENTS_OF_ALL_TYPES_OF_TAXES").toString()):"");
		CashFlows2002Sgmt.addElement("OtherCashPaymentsFromOperatingActivities")
				.setText(entEntity.get("OTHER_CASH_PAYMENTS_FROM_OPERA")!=null
						? ChangeUtils.stringToFStr(entEntity.get("OTHER_CASH_PAYMENTS_FROM_OPERA").toString()):"");
		CashFlows2002Sgmt.addElement("TotalCashOutflowsFromOperatingActivities")
				.setText(entEntity.get("TOTAL_CASH_OUTFLOWS_FROM_OPERA") != null
						? ChangeUtils.stringToFStr(entEntity.get("TOTAL_CASH_OUTFLOWS_FROM_OPERA").toString()) : "");
		CashFlows2002Sgmt.addElement("NetCashFlowsFromOperatingActivities")
				.setText(entEntity.get("NET_CASH_FLOWS_FROM_OPERATING") != null
						? ChangeUtils.stringToFStr(entEntity.get("NET_CASH_FLOWS_FROM_OPERATING").toString()) : "");
		CashFlows2002Sgmt.addElement("CashReceivedFromReturnOfInvestment")
				.setText(entEntity.get("CASH_RECEIVED_FROM_RETURN_O_07") != null
						? ChangeUtils.stringToFStr(entEntity.get("CASH_RECEIVED_FROM_RETURN_O_07").toString()) : "");
		CashFlows2002Sgmt.addElement("CashReceivedFromOnvestments")
				.setText(entEntity.get("CASH_RECEIVED_FROM_ONVESTMENTS") != null
						? ChangeUtils.stringToFStr(entEntity.get("CASH_RECEIVED_FROM_ONVESTMENTS").toString()) : "");
		CashFlows2002Sgmt.addElement("NetCashReceivedFromDisposalOfFixedAssetsIntangibleAssetsAndOtherLongTermAssets")
				.setText(entEntity.get("NET_CASH_RECEIVED_FROM_DISPOSA") != null
						? ChangeUtils.stringToFStr(entEntity.get("NET_CASH_RECEIVED_FROM_DISPOSA").toString()) : "");
		CashFlows2002Sgmt.addElement("CashReceivedRelatingToOtherInvestingActivities")
				.setText(entEntity.get("CASH_RECEIVED_RELATING_TO_OTHE") != null
						? ChangeUtils.stringToFStr(entEntity.get("CASH_RECEIVED_RELATING_TO_OTHE").toString()) : "");
		CashFlows2002Sgmt.addElement("TotalCashInflowsFromInvestingActivities")
				.setText(entEntity.get("TOTAL_CASH_INFLOWS_FROM_INVEST") != null
						? ChangeUtils.stringToFStr(entEntity.get("TOTAL_CASH_INFLOWS_FROM_INVEST").toString()) : "");
		CashFlows2002Sgmt.addElement("CashPaidToAcquireFixedAssetsIntangibleAssetsAndOtherLongTermAssents")
				.setText(entEntity.get("CASH_PAID_TO_ACQUIRE_FIXED_ASS") != null
						? ChangeUtils.stringToFStr(entEntity.get("CASH_PAID_TO_ACQUIRE_FIXED_ASS").toString()) : "");
		CashFlows2002Sgmt.addElement("CashPaymentsForInvestments")
				.setText(entEntity.get("CASH_PAYMENTS_FOR_INVESTMENTS") != null
						? ChangeUtils.stringToFStr(entEntity.get("CASH_PAYMENTS_FOR_INVESTMENTS").toString()) : "");
		CashFlows2002Sgmt.addElement("CashPaymentsRelatedToOtherInvestingActivities")
				.setText(entEntity.get("CASH_PAYMENTS_RELATED_TO_OTH_T") != null
						? ChangeUtils.stringToFStr(entEntity.get("CASH_PAYMENTS_RELATED_TO_OTH_T").toString()) : "");
		CashFlows2002Sgmt.addElement("TotalCashOutflowsFromInvestingActivities")
				.setText(entEntity.get("TOTAL_CASH_OUTFLOWS_FROM_INVES") != null
						? ChangeUtils.stringToFStr(entEntity.get("TOTAL_CASH_OUTFLOWS_FROM_INVES").toString()) : "");
		CashFlows2002Sgmt.addElement("NetCashFlowsFromInvestingActivities")
				.setText(entEntity.get("NET_CASH_FLOWS_FROM_INVESTING_") != null
						? ChangeUtils.stringToFStr(entEntity.get("NET_CASH_FLOWS_FROM_INVESTING_").toString()) : "");
		CashFlows2002Sgmt.addElement("CashReceivedFromInvestors")
				.setText(entEntity.get("CASH_RECEIVED_FROM_INVESTORS") != null
						? ChangeUtils.stringToFStr(entEntity.get("CASH_RECEIVED_FROM_INVESTORS").toString()) : "");
		CashFlows2002Sgmt.addElement("CashFromBorrowings").setText(entEntity.get("CASH_FROM_BORROWINGS") != null
				? ChangeUtils.stringToFStr(entEntity.get("CASH_FROM_BORROWINGS").toString()) : "");
		CashFlows2002Sgmt.addElement("OtherCashReceivedRelatingToFinancingActivities")
				.setText(entEntity.get("OTHER_CASH_RECEIVED_RELATING_C") != null
						? ChangeUtils.stringToFStr(entEntity.get("OTHER_CASH_RECEIVED_RELATING_C").toString()) : "");
		CashFlows2002Sgmt.addElement("TotalCashInflowsFromFinancingActivities")
				.setText(entEntity.get("TOTAL_CASH_INFLOWS_FROM_FINANC") != null
						? ChangeUtils.stringToFStr(entEntity.get("TOTAL_CASH_INFLOWS_FROM_FINANC").toString()) : "");
		CashFlows2002Sgmt.addElement("CashRepaymentsForDebts")
				.setText(entEntity.get("CASH_REPAYMENTS_FOR_DEBTS") != null
						? ChangeUtils.stringToFStr(entEntity.get("CASH_REPAYMENTS_FOR_DEBTS").toString()) : "");
		CashFlows2002Sgmt.addElement("CashPaymentsForDistributionOfDividendsOrProfitAndInterestExpenses")
				.setText(entEntity.get("CASH_PAYMENTS_FOR_DISTRIBUTION") != null
						? ChangeUtils.stringToFStr(entEntity.get("CASH_PAYMENTS_FOR_DISTRIBUTION").toString()) : "");
		CashFlows2002Sgmt.addElement("CashPaymentsRelatedToOtherFinancingActivities")
				.setText(entEntity.get("CASH_PAYMENTS_RELATED_TO_OTH_C") != null
						? ChangeUtils.stringToFStr(entEntity.get("CASH_PAYMENTS_RELATED_TO_OTH_C").toString()) : "");
		CashFlows2002Sgmt.addElement("TotalCashOutflowsFromFinancingActivities")
				.setText(entEntity.get("TOTAL_CASH_OUTFLOWS_FROM_FINAN") != null
						? ChangeUtils.stringToFStr(entEntity.get("TOTAL_CASH_OUTFLOWS_FROM_FINAN").toString()) : "");
		CashFlows2002Sgmt.addElement("NetCashFlowsFromFinancingActivities")
				.setText(entEntity.get("NET_CASH_FLOWS_FROM_FINANCING_") != null
						? ChangeUtils.stringToFStr(entEntity.get("NET_CASH_FLOWS_FROM_FINANCING_").toString()) : "");
		CashFlows2002Sgmt.addElement("EffectOfExchangRateChangesOnCash")
				.setText(entEntity.get("EFFECT_OF_EXCHANG_RATE_CHANGES") != null
						? ChangeUtils.stringToFStr(entEntity.get("EFFECT_OF_EXCHANG_RATE_CHANGES").toString()) : "");
		CashFlows2002Sgmt.addElement("NetIncreaseInCashAndCashEquivalents")
				.setText(entEntity.get("NET_INCREASEIN_CASH_AND_CASH_E") != null
						? ChangeUtils.stringToFStr(entEntity.get("NET_INCREASEIN_CASH_AND_CASH_E").toString()) : "");
		CashFlows2002Sgmt.addElement("NetProfit")
				.setText(entEntity.get("NET_PROFIT") != null ? ChangeUtils.stringToFStr(entEntity.get("NET_PROFIT").toString()) : "");
		CashFlows2002Sgmt.addElement("ProvisionForAssets").setText(entEntity.get("PROVISION_FOR_ASSETS") != null
				? ChangeUtils.stringToFStr(entEntity.get("PROVISION_FOR_ASSETS").toString()) : "");
		CashFlows2002Sgmt.addElement("DepreciationOfFixedAssets")
				.setText(entEntity.get("DEPRECIATION_OF_FIXED_ASSETS") != null
						? ChangeUtils.stringToFStr(entEntity.get("DEPRECIATION_OF_FIXED_ASSETS").toString()) : "");
		CashFlows2002Sgmt.addElement("AmortisationOfIntangibleAssets")
				.setText(entEntity.get("AMORTISATION_OF_INTANGIBLE_ASS") != null
						? ChangeUtils.stringToFStr(entEntity.get("AMORTISATION_OF_INTANGIBLE_ASS").toString()) : "");
		CashFlows2002Sgmt.addElement("LongTermDeferredExpensesAmortization")
				.setText(entEntity.get("LONG_TERM_DEFERRED_EXPENSES_AM") != null
						? ChangeUtils.stringToFStr(entEntity.get("LONG_TERM_DEFERRED_EXPENSES_AM").toString()) : "");
		CashFlows2002Sgmt.addElement("DecreaseOfDefferedExpenses")
				.setText(entEntity.get("DECREASE_OF_DEFFERED_EXPENSES") != null
						? ChangeUtils.stringToFStr(entEntity.get("DECREASE_OF_DEFFERED_EXPENSES").toString()) : "");
		CashFlows2002Sgmt.addElement("AdditionOfAccuedExpense")
				.setText(entEntity.get("ADDITION_OF_ACCUED_EXPENSE") != null
						? ChangeUtils.stringToFStr(entEntity.get("ADDITION_OF_ACCUED_EXPENSE").toString()) : "");
		CashFlows2002Sgmt.addElement("LossesOnDisposalOfFixedAssetsIntangibleAssetsAndOtherLongTermAssets")
				.setText(entEntity.get("LOSSES_ON_DISPOSAL_OF_FIXED_AS") != null
						? ChangeUtils.stringToFStr(entEntity.get("LOSSES_ON_DISPOSAL_OF_FIXED_AS").toString()) : "");
		CashFlows2002Sgmt.addElement("LossesOnScrappingOfFixedAssets")
				.setText(entEntity.get("LOSSES_ON_SCRAPPING_OF_FIXED_A") != null
						? ChangeUtils.stringToFStr(entEntity.get("LOSSES_ON_SCRAPPING_OF_FIXED_A").toString()) : "");
		CashFlows2002Sgmt.addElement("FinanceExpense")
				.setText(entEntity.get("FINANCE_EXPENSE") != null ? ChangeUtils.stringToFStr(entEntity.get("FINANCE_EXPENSE").toString()) : "");
		CashFlows2002Sgmt.addElement("LossesArsingFromInvestment")
				.setText(entEntity.get("LOSSES_ARSING_FROM_INVESTMENT") != null
						? ChangeUtils.stringToFStr(entEntity.get("LOSSES_ARSING_FROM_INVESTMENT").toString()) : "");
		CashFlows2002Sgmt.addElement("DeferredTaxCredit").setText(
				entEntity.get("DEFERRED_TAX_CREDIT") != null ? ChangeUtils.stringToFStr(entEntity.get("DEFERRED_TAX_CREDIT").toString()) : "");
		CashFlows2002Sgmt.addElement("DecreaseInInventories").setText(entEntity.get("DECREASE_IN_INVENTORIES") != null
				? ChangeUtils.stringToFStr(entEntity.get("DECREASE_IN_INVENTORIES").toString()) : "");
		CashFlows2002Sgmt.addElement("DecreaseInOperatingReceivables")
				.setText(entEntity.get("DECREASEIN_OPERATING_RECEIVABL") != null
						? ChangeUtils.stringToFStr(entEntity.get("DECREASEIN_OPERATING_RECEIVABL").toString()) : "");
		CashFlows2002Sgmt.addElement("IncreaseInOperatingReceivables")
				.setText(entEntity.get("INCREASEIN_OPERATING_RECEIVABL") != null
						? ChangeUtils.stringToFStr(entEntity.get("INCREASEIN_OPERATING_RECEIVABL").toString()) : "");
		CashFlows2002Sgmt.addElement("Others")
				.setText(entEntity.get("OTHERS") != null ? ChangeUtils.stringToFStr(entEntity.get("OTHERS").toString()) : "");
		CashFlows2002Sgmt.addElement("NetCashFlowsFromOperatingActivitiesMi")
				.setText(entEntity.get("NET_CASH_FLOWS_FROM_OPERATING2") != null
						? ChangeUtils.stringToFStr(entEntity.get("NET_CASH_FLOWS_FROM_OPERATING2").toString()) : "");
		CashFlows2002Sgmt.addElement("DebtsTransferToCapital")
				.setText(entEntity.get("DEBTS_TRANSFER_TO_CAPITAL") != null
						? ChangeUtils.stringToFStr(entEntity.get("DEBTS_TRANSFER_TO_CAPITAL").toString()) : "");
		CashFlows2002Sgmt.addElement("OneYearDueConvertibleBonds")
				.setText(entEntity.get("ONE_YEAR_DUE_CONVERTIBLE_BONDS") != null
						? ChangeUtils.stringToFStr(entEntity.get("ONE_YEAR_DUE_CONVERTIBLE_BONDS").toString()) : "");
		CashFlows2002Sgmt.addElement("FinancingRentToTheFixedAsset")
				.setText(entEntity.get("FINANCING_RENT_TO_THE_FIXED_AS") != null
						? ChangeUtils.stringToFStr(entEntity.get("FINANCING_RENT_TO_THE_FIXED_AS").toString()) : "");
		CashFlows2002Sgmt.addElement("NonCashOthers")
				.setText(entEntity.get("NON_CASH_OTHERS") != null ? ChangeUtils.stringToFStr(entEntity.get("NON_CASH_OTHERS").toString()) : "");
		CashFlows2002Sgmt.addElement("CashAtTheEndOfPeriod").setText(entEntity.get("CASH_AT_THE_END_OF_PERIOD") != null
				? ChangeUtils.stringToFStr(entEntity.get("CASH_AT_THE_END_OF_PERIOD").toString()) : "");
		CashFlows2002Sgmt.addElement("CashAtTheBeginningOfThePeriod")
				.setText(entEntity.get("CASH_AT_THE_BEGINNING_OF_THE_P") != null
						? ChangeUtils.stringToFStr(entEntity.get("CASH_AT_THE_BEGINNING_OF_THE_P").toString()) : "");
		CashFlows2002Sgmt.addElement("CashEquivalentsAtTheEndOfThePeriod")
				.setText(entEntity.get("CASH_EQUIVALENTS_AT_THE_END_OF") != null
						? ChangeUtils.stringToFStr(entEntity.get("CASH_EQUIVALENTS_AT_THE_END_OF").toString()) : "");
		CashFlows2002Sgmt.addElement("CashRquivalentsAtTheBeginningOfThePeriod")
				.setText(entEntity.get("CASH_RQUIVALENTS_AT_THE_BEGINN") != null
						? ChangeUtils.stringToFStr(entEntity.get("CASH_RQUIVALENTS_AT_THE_BEGINN").toString()) : "");
		CashFlows2002Sgmt.addElement("NetIncreaseInCashAndCashEquivalentsMi")
				.setText(entEntity.get("NET_INCREASE_IN_CASH_AND_CASH_") != null
						? ChangeUtils.stringToFStr(entEntity.get("NET_INCREASE_IN_CASH_AND_CASH_").toString()) : "");
	}

	public void writeCashFlows2007Sgmt(Element CashFlows2007Sgmt, Map<String, Object> entEntity) {
		CashFlows2007Sgmt.addElement("CashReceivedFromSalesOfGoodsOrRendingOfServices")
				.setText(entEntity.get("CASH_RECEIVED_FROM_SALES_OF_07") != null
						? ChangeUtils.stringToFStr(entEntity.get("CASH_RECEIVED_FROM_SALES_OF_07").toString()) : "");
		CashFlows2007Sgmt.addElement("TaxRefunds")
				.setText(entEntity.get("TAX_REFUNDS_07") != null 
						? ChangeUtils.stringToFStr(entEntity.get("TAX_REFUNDS_07").toString()) : "");
		CashFlows2007Sgmt.addElement("OtherCashReceivedRelatingToOperatingActivities")
				.setText(entEntity.get("OTHER_CASH_RECEIVED_RELATING_J") != null
						? ChangeUtils.stringToFStr(entEntity.get("OTHER_CASH_RECEIVED_RELATING_J").toString()) : "");
		CashFlows2007Sgmt.addElement("TotalCashInflowsFromOperatingActivities")
				.setText(entEntity.get("TOTAL_CASH_INFLOWS_FROM_OPE_07") != null
						? ChangeUtils.stringToFStr(entEntity.get("TOTAL_CASH_INFLOWS_FROM_OPE_07").toString()) : "");
		CashFlows2007Sgmt.addElement("CashPaidForGoodsAndServices")
				.setText(entEntity.get("CASH_PAID_FOR_GOODS_AND_SER_07") != null
						? ChangeUtils.stringToFStr(entEntity.get("CASH_PAID_FOR_GOODS_AND_SER_07").toString()) : "");
		CashFlows2007Sgmt.addElement("CashPaidToAndOnBehalfOfEmployees")
				.setText(entEntity.get("CASH_PAID_TO_AND_ON_BEHA_LF_OF") != null
						? ChangeUtils.stringToFStr(entEntity.get("CASH_PAID_TO_AND_ON_BEHA_LF_OF").toString()) : "");
		CashFlows2007Sgmt.addElement("PaymentsOfAllTypesOfTaxes")
				.setText(entEntity.get("PAYMENTS_OF_ALL_TYPES_OF_TA_07") != null
						? ChangeUtils.stringToFStr(entEntity.get("PAYMENTS_OF_ALL_TYPES_OF_TA_07").toString()) : "");
		CashFlows2007Sgmt.addElement("OtherCashPaymentsFromOperatingActivities")
				.setText(entEntity.get("OTHER_CASH_PAYMENTS_FROM_OP_07") != null
						? ChangeUtils.stringToFStr(entEntity.get("OTHER_CASH_PAYMENTS_FROM_OP_07").toString()) : "");
		CashFlows2007Sgmt.addElement("TotalCashOutflowsFromOperatingActivities")
				.setText(entEntity.get("TOTAL_CASH_OUTFLOWS_FROM_OP_07") != null
						? ChangeUtils.stringToFStr(entEntity.get("TOTAL_CASH_OUTFLOWS_FROM_OP_07").toString()) : "");
		CashFlows2007Sgmt.addElement("NetCashFlowsFromOperatingActivities")
				.setText(entEntity.get("NET_CASH_FLOWS_FROM_OPERAT_07") != null
						? ChangeUtils.stringToFStr(entEntity.get("NET_CASH_FLOWS_FROM_OPERAT_07").toString()) : "");
		CashFlows2007Sgmt.addElement("CashReceivedFromReturnOfInvestment")
				.setText(entEntity.get("CASH_RECEIVED_FROM_RETURN_OF_I") != null
						? ChangeUtils.stringToFStr(entEntity.get("CASH_RECEIVED_FROM_RETURN_OF_I").toString()) : "");
		CashFlows2007Sgmt.addElement("CashReceivedFromOnvestments")
				.setText(entEntity.get("CASH_RECEIVED_FROM_ONVESTME_07") != null
						? ChangeUtils.stringToFStr(entEntity.get("CASH_RECEIVED_FROM_ONVESTME_07").toString()) : "");
		CashFlows2007Sgmt.addElement("NetCashReceivedFromDisposalOfFixedAssetsIntangibleAssetsAndOtherLongTermAssets")
				.setText(entEntity.get("NET_CASH_RECEIVED_FROM_DISP_07") != null
						? ChangeUtils.stringToFStr(entEntity.get("NET_CASH_RECEIVED_FROM_DISP_07").toString()) : "");
		CashFlows2007Sgmt.addElement("NetCashInflowsOfDisposalOfSubsidiariesAndOtherBusinessEntities")
				.setText(entEntity.get("NET_CASH_INFLOWS_OF_DISPOSAL_O") != null
						? ChangeUtils.stringToFStr(entEntity.get("NET_CASH_INFLOWS_OF_DISPOSAL_O").toString()) : "");
		CashFlows2007Sgmt.addElement("CashReceivedRelatingToOtherInvestingActivities")
				.setText(entEntity.get("CASH_RECEIVED_RELATING_TO_O_07") != null
						? ChangeUtils.stringToFStr(entEntity.get("CASH_RECEIVED_RELATING_TO_O_07").toString()) : "");
		CashFlows2007Sgmt.addElement("TotalCashInflowsFromInvestingActivities")
				.setText(entEntity.get("TOTAL_CASH_INFLOWS_FROM_INV_07") != null
						? ChangeUtils.stringToFStr(entEntity.get("TOTAL_CASH_INFLOWS_FROM_INV_07").toString()) : "");
		CashFlows2007Sgmt.addElement("CashPaidToAcquireFixedAssetsIntangibleAssetsAndOtherLongTermAssents")
				.setText(entEntity.get("CASH_PAID_TO_ACQUIRE_FIXED_07") != null
						? ChangeUtils.stringToFStr(entEntity.get("CASH_PAID_TO_ACQUIRE_FIXED_07").toString()) : "");
		CashFlows2007Sgmt.addElement("CashPaymentsForInvestments")
				.setText(entEntity.get("CASH_PAYMENTS_FOR_INVESTME_07") != null
						? ChangeUtils.stringToFStr(entEntity.get("CASH_PAYMENTS_FOR_INVESTME_07").toString()) : "");
		CashFlows2007Sgmt.addElement("NetCashOutflowsOfProcurementOfSubsidiariesAndOtherBusinessUnits")
				.setText(entEntity.get("NET_CASH_OUTFLOWS_OF_PROCUREME") != null
						? ChangeUtils.stringToFStr(entEntity.get("NET_CASH_OUTFLOWS_OF_PROCUREME").toString()) : "");
		CashFlows2007Sgmt.addElement("CashPaymentsRelatedToOtherInvestingActivities")
				.setText(entEntity.get("CASH_PAYMENTS_RELATED_TO_OT_07") != null
						? ChangeUtils.stringToFStr(entEntity.get("CASH_PAYMENTS_RELATED_TO_OT_07").toString()) : "");
		CashFlows2007Sgmt.addElement("SubTotalOfCashOutflows")
				.setText(entEntity.get("SUB_TOTAL_OF_CASH_OUTFLOWS") != null
						? ChangeUtils.stringToFStr(entEntity.get("SUB_TOTAL_OF_CASH_OUTFLOWS").toString()) : "");
		CashFlows2007Sgmt.addElement("NetCashFlowsFromInvestingActivities")
				.setText(entEntity.get("NET_CASH_FLOWS_FROM_INVESTI_07") != null
						? ChangeUtils.stringToFStr(entEntity.get("NET_CASH_FLOWS_FROM_INVESTI_07").toString()) : "");
		CashFlows2007Sgmt.addElement("CashReceivedFromInvestors")
				.setText(entEntity.get("CASH_RECEIVED_FROM_INVEST_07") != null
						? ChangeUtils.stringToFStr(entEntity.get("CASH_RECEIVED_FROM_INVEST_07").toString()) : "");
		CashFlows2007Sgmt.addElement("CashFromBorrowings")
				.setText(entEntity.get("CASH_FROM_BORROWINGS_07") != null
						? ChangeUtils.stringToFStr(entEntity.get("CASH_FROM_BORROWINGS_07").toString()) : "");
		CashFlows2007Sgmt.addElement("OtherCashReceivedRelatingToFinancingActivities")
				.setText(entEntity.get("OTHER_CASH_RECEIVED_RELATIN_07") != null
						? ChangeUtils.stringToFStr(entEntity.get("OTHER_CASH_RECEIVED_RELATIN_07").toString()) : "");
		CashFlows2007Sgmt.addElement("TotalCashInflowsFromFinancingActivities")
				.setText(entEntity.get("TOTAL_CASH_INFLOWS_FROM_FIN_07") != null
						? ChangeUtils.stringToFStr(entEntity.get("TOTAL_CASH_INFLOWS_FROM_FIN_07").toString()) : "");
		CashFlows2007Sgmt.addElement("CashRepaymentsForDebts")
				.setText(entEntity.get("CASH_REPAYMENTS_FOR_DEBTS_07") != null
						? ChangeUtils.stringToFStr(entEntity.get("CASH_REPAYMENTS_FOR_DEBTS_07").toString()) : "");
		CashFlows2007Sgmt.addElement("CashPaymentsForDistributionOfDividendsOrProfitAndInterestExpenses")
				.setText(entEntity.get("CASH_PAYMENTS_FOR_DISTRIBUT_07") != null
						? ChangeUtils.stringToFStr(entEntity.get("CASH_PAYMENTS_FOR_DISTRIBUT_07").toString()) : "");
		CashFlows2007Sgmt.addElement("CashPaymentsRelatedToOtherFinancingActivities")
				.setText(entEntity.get("CASH_PAYMENTS_RELATED_TO_OT_07") != null
						? ChangeUtils.stringToFStr(entEntity.get("CASH_PAYMENTS_RELATED_TO_OT_07").toString()) : "");
		CashFlows2007Sgmt.addElement("TotalCashOutflowsFromFinancingActivities")
				.setText(entEntity.get("TOTAL_CASH_OUTFLOWS_FROM_FI_07") != null
						? ChangeUtils.stringToFStr(entEntity.get("TOTAL_CASH_OUTFLOWS_FROM_FI_07").toString()) : "");
		CashFlows2007Sgmt.addElement("NetCashFlowsFromFinancingActivities")
				.setText(entEntity.get("NET_CASH_FLOWS_FROM_FINANCI_07") != null
						? ChangeUtils.stringToFStr(entEntity.get("NET_CASH_FLOWS_FROM_FINANCI_07").toString()) : "");
		CashFlows2007Sgmt.addElement("EffectOfExchangRateChangesOnCash")
				.setText(entEntity.get("EFFECT_OF_EXCHANG_RATE_CHAN_07") != null
						? ChangeUtils.stringToFStr(entEntity.get("EFFECT_OF_EXCHANG_RATE_CHAN_07").toString()) : "");
		CashFlows2007Sgmt.addElement("NetIncreaseInCashAndCashEquivalents")
				.setText(entEntity.get("NETINCREASEIN_CASH_AND_CASH_EQ") != null
						? ChangeUtils.stringToFStr(entEntity.get("NETINCREASEIN_CASH_AND_CASH_EQ").toString()) : "");
		CashFlows2007Sgmt.addElement("InitialCashAndCashEquivalentsBalance")
				.setText(entEntity.get("INITIAL_CASH_AND_CASH_EQUIVALE") != null
						? ChangeUtils.stringToFStr(entEntity.get("INITIAL_CASH_AND_CASH_EQUIVALE").toString()) : "");
		CashFlows2007Sgmt.addElement("TheFinalCashAndCashEquivalentsBalance")
				.setText(entEntity.get("THE_FINAL_CASH_AND_CASH_EQUIVA") != null
						? ChangeUtils.stringToFStr(entEntity.get("THE_FINAL_CASH_AND_CASH_EQUIVA").toString()) : "");
		CashFlows2007Sgmt.addElement("NetProfit")
				.setText(entEntity.get("NET_PROFIT_07") != null 
						? ChangeUtils.stringToFStr(entEntity.get("NET_PROFIT_07").toString()) : "");
		CashFlows2007Sgmt.addElement("ProvisionForAssetImpairment")
				.setText(entEntity.get("PROVISION_FOR_ASSET_IMPAIRMENT") != null
						? ChangeUtils.stringToFStr(entEntity.get("PROVISION_FOR_ASSET_IMPAIRMENT").toString()) : "");
		CashFlows2007Sgmt.addElement("DepreciationOfFixedAssets")
				.setText(entEntity.get("DEPRECIATION_OF_FIXED_ASS_07") != null
						? ChangeUtils.stringToFStr(entEntity.get("DEPRECIATION_OF_FIXED_ASS_07").toString()) : "");
		CashFlows2007Sgmt.addElement("AmortisationOfIntangibleAssets")
				.setText(entEntity.get("AMORTISATION_OF_INTANGIBLE_07") != null
						? ChangeUtils.stringToFStr(entEntity.get("AMORTISATION_OF_INTANGIBLE_07").toString()) : "");
		CashFlows2007Sgmt.addElement("AmortisationOfLongTermDefferedExpenses")
				.setText(entEntity.get("AMORTISATION_OF_LONG_TERM_DEFF") != null
						? ChangeUtils.stringToFStr(entEntity.get("AMORTISATION_OF_LONG_TERM_DEFF").toString()) : "");
		CashFlows2007Sgmt.addElement("DecreaseOfDefferedExpenses")
				.setText(entEntity.get("DECREASE_OF_DEFFERED_EXPEN_07") != null
						? ChangeUtils.stringToFStr(entEntity.get("DECREASE_OF_DEFFERED_EXPEN_07").toString()) : "");
		CashFlows2007Sgmt.addElement("AdditionOfAccuedExpense")
				.setText(entEntity.get("ADDITION_OF_ACCUED_EXPE_07") != null
						? ChangeUtils.stringToFStr(entEntity.get("ADDITION_OF_ACCUED_EXPE_07").toString()) : "");
		CashFlows2007Sgmt.addElement("LossesOnDisposalOfFixedAssetsIntangibleAssetsAndOtherLongTermAssets")
				.setText(entEntity.get("LOSSES_ON_DISPOSAL_OF_FIXED_07") != null
						? ChangeUtils.stringToFStr(entEntity.get("LOSSES_ON_DISPOSAL_OF_FIXED_07").toString()) : "");
		CashFlows2007Sgmt.addElement("LossesOnScrappingOfFixedAssets")
				.setText(entEntity.get("LOSSES_ON_SCRAPPING_OF_FIXE_07") != null
						? ChangeUtils.stringToFStr(entEntity.get("LOSSES_ON_SCRAPPING_OF_FIXE_07").toString()) : "");
		CashFlows2007Sgmt.addElement("ProfitOrLossFromChangesInFairValue")
				.setText(entEntity.get("PROFIT_OR_LOSS_FROM_CHANGES_IN") != null
						? ChangeUtils.stringToFStr(entEntity.get("PROFIT_OR_LOSS_FROM_CHANGES_IN").toString()) : "");
		CashFlows2007Sgmt.addElement("FinanceExpense")
				.setText(entEntity.get("FINANCE_EXPENSE_07") != null 
						? ChangeUtils.stringToFStr(entEntity.get("FINANCE_EXPENSE_07").toString()) : "");
		CashFlows2007Sgmt.addElement("LossesArsingFromInvestment")
				.setText(entEntity.get("LOSSES_ARSING_FROM_INVESTM_07") != null
						? ChangeUtils.stringToFStr(entEntity.get("LOSSES_ARSING_FROM_INVESTM_07").toString()) : "");
		CashFlows2007Sgmt.addElement("DeferredIncomeTaxAssets")
				.setText(entEntity.get("DEFERRED_INCOME_TAX_ASSETS") != null
						? ChangeUtils.stringToFStr(entEntity.get("DEFERRED_INCOME_TAX_ASSETS").toString()) : "");
		CashFlows2007Sgmt.addElement("DeferredIncomeTaxLiabilities")
				.setText(entEntity.get("DEFERRED_INCOME_TAX_LIABILITIE") != null
						? ChangeUtils.stringToFStr(entEntity.get("DEFERRED_INCOME_TAX_LIABILITIE").toString()) : "");
		CashFlows2007Sgmt.addElement("DecreaseInInventories")
				.setText(entEntity.get("DECREASEIN_INVENTORIES") != null
						? ChangeUtils.stringToFStr(entEntity.get("DECREASEIN_INVENTORIES").toString()) : "");
		CashFlows2007Sgmt.addElement("DecreaseInOperatingReceivables")
				.setText(entEntity.get("DECREASEIN_OPERATING_RECEIV_07") != null
						? ChangeUtils.stringToFStr(entEntity.get("DECREASEIN_OPERATING_RECEIV_07").toString()) : "");
		CashFlows2007Sgmt.addElement("IncreaseInOperatingReceivables")
				.setText(entEntity.get("INCREASE_IN_OPERATING_RECEIVAB") != null
						? ChangeUtils.stringToFStr(entEntity.get("INCREASE_IN_OPERATING_RECEIVAB").toString()) : "");
		CashFlows2007Sgmt.addElement("Others")
				.setText(entEntity.get("OTHERS_07") != null 
						? ChangeUtils.stringToFStr(entEntity.get("OTHERS_07").toString()) : "");
		CashFlows2007Sgmt.addElement("NetCashFlowsFromOperatingActivitiesMi")
				.setText(entEntity.get("NET_CASH_FLOWS_FROM_OPERATI_07") != null
						? ChangeUtils.stringToFStr(entEntity.get("NET_CASH_FLOWS_FROM_OPERATI_07").toString()) : "");
		CashFlows2007Sgmt.addElement("DebtsTransferToCapital")
				.setText(entEntity.get("DEBTS_TRANSFER_TO_CAPITAL_07") != null
						? ChangeUtils.stringToFStr(entEntity.get("DEBTS_TRANSFER_TO_CAPITAL_07").toString()) : "");
		CashFlows2007Sgmt.addElement("OneYearDueConvertibleBonds")
				.setText(entEntity.get("ONE_YEAR_DUE_CONVERTIBLE_BO_07") != null
						? ChangeUtils.stringToFStr(entEntity.get("ONE_YEAR_DUE_CONVERTIBLE_BO_07").toString()) : "");
		CashFlows2007Sgmt.addElement("FinancingRentToTheFixedAsset")
				.setText(entEntity.get("FINANCING_RENT_TO_THE_FIXED_07") != null
						? ChangeUtils.stringToFStr(entEntity.get("FINANCING_RENT_TO_THE_FIXED_07").toString()) : "");
		CashFlows2007Sgmt.addElement("NonCashOthers")
				.setText(entEntity.get("NON_CASH_OTHERS_07") != null 
						? ChangeUtils.stringToFStr(entEntity.get("NON_CASH_OTHERS_07").toString()) : "");
		CashFlows2007Sgmt.addElement("CashAtTheEndOfPeriod")
				.setText(entEntity.get("CASH_AT_THE_END_OF_PERIOD_07") != null
						? ChangeUtils.stringToFStr(entEntity.get("CASH_AT_THE_END_OF_PERIOD_07").toString()) : "");
		CashFlows2007Sgmt.addElement("CashAtTheBeginningOfThePeriod")
				.setText(entEntity.get("CASH_AT_THE_BEGINNING_OF_TH_07") != null
						? ChangeUtils.stringToFStr(entEntity.get("CASH_AT_THE_BEGINNING_OF_TH_07").toString()) : "");
		CashFlows2007Sgmt.addElement("CashEquivalentsAtTheEndOfThePeriod")
				.setText(entEntity.get("CASH_EQUIVALENTS_AT_THE_END_07") != null
						? ChangeUtils.stringToFStr(entEntity.get("CASH_EQUIVALENTS_AT_THE_END_07").toString()) : "");
		CashFlows2007Sgmt.addElement("CashEquivalentsAtTheBeginningOfThePeriod")
				.setText(entEntity.get("CASH_EQUIVALENTS_AT_THE_BEGINN") != null
						? ChangeUtils.stringToFStr(entEntity.get("CASH_EQUIVALENTS_AT_THE_BEGINN").toString()) : "");
		CashFlows2007Sgmt.addElement("NetIncreaseInCashAndCashEquivalentsMi")
				.setText(entEntity.get("NETINCREASEIN_CASH_AND_CASH_E2") != null
						? ChangeUtils.stringToFStr(entEntity.get("NETINCREASEIN_CASH_AND_CASH_E2").toString()) : "");
	}

	@Transactional
	@Override
	public void insertReportNameAndColnumForData(Map<String, Object> map) throws Exception {
		Map<String, Object> conditionMap = new HashMap<>();
		conditionMap.put("table_name", TABLE_NAME);
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
