package com.dcits.supervise.pecr.generateReport.impl;

import com.dcits.common.ChangeUtils;
import com.dcits.supervise.pecr.feedbackreport.service.ReportFeedBackMessageService;
import com.dcits.supervise.pecr.generateReport.entity.NeedReportDetail;
import com.dcits.supervise.pecr.generateReport.entity.ReportAndBackMessageEnt;
import com.dcits.supervise.pecr.generateReport.service.ReportMessageManager;
import com.dcits.supervise.pecr.util.CreateSerialNumber;
import com.dcits.supervise.pecr.util.FileUtil;
import com.dcits.supervise.pecr.util.PecrConstantUtil;
import org.apache.log4j.Logger;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.transaction.annotation.Transactional;
import java.util.*;

/**
 * 企业利润及利润分配表信息记录生成报文
 * 
 * @author munan
 *
 */
public class GenerateEntIncomeSPARp extends AbstractGenerateReport {

	private final static Logger logger = Logger.getLogger(GenerateEntIncomeSPARp.class);
	
	public Properties properties;

	public ReportMessageManager reportMessageService;

	private static String TABLE_NAME = "E_INCOME_STATEMENT";

	private static String PACKET_KEY = "EIA_INCOME_STATEMENT_PROFIT_ID";
	
	private int count =0;
	
	private String CCRC_ORG_CODE = "";

	public GenerateEntIncomeSPARp(Properties properties, ReportMessageManager reportMessageService) {
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
		reportCount.put("table_name", TABLE_NAME);
		reportCount.put("rpt_date", needReportDetail.getRptDate());
		reportCount.put("company", needReportDetail.getCompany());
		//信息记录类型
		reportCount.put("INF_REC_TYPE",PecrConstantUtil.ENT_INCODE_STATE_PRO);
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
		//获取本次生成报文，以pageSize为批量操作量级需要进行多少次循环
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
			reportCount.put("INF_REC_TYPE",PecrConstantUtil.ENT_INCODE_STATE_PRO);
			list = reportMessageService.queryEntIncomeSPARpData(reportCount);
			
			// 存放报文名和对应数据ID的map
			List<String> paaid = new ArrayList<>();
			List<Map<String,String>> pkColnumList = new ArrayList<Map<String,String>>();
			for(int i=0;i<list.size();i++){
				Map<String, Object> entIncomeSPAEntity = list.get(i);
				String pk = entIncomeSPAEntity.get("EIA_INCOME_STATEMENT_PROFIT_ID").toString();
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
				String headStr = generateRpHead(PecrConstantUtil.ENT_INCODE_STATE_PRO, numTotal[forTop++], "  "+CCRC_ORG_CODE);
				sbf.append(headStr);
				sbf.append("\r\n");
			}
			for (Map<String, Object> indvEntity : list) {
				Document document = DocumentHelper.createDocument();
				Element root = document.addElement("Document");
				Element InCtrctInf = root.addElement("IncomeStatementProfitAppropriation");
				/*** 企业利润及利润分配表 --- 基础段 ****/
				Element IncomeSPABsSgmt = InCtrctInf.addElement("IncomeStatementProfitAppropriationBsSgmt");
				writeIncomeSPABsSgmt(IncomeSPABsSgmt, indvEntity);
				/*** 企业利润及利润分配表 --- -2002版段-- ****/
				if (indvEntity.get("EIB_INCOME_STATEMENT_PROFIT_ID") != null
						&& indvEntity.get("EIB_INCOME_STATEMENT_PROFIT_ID") != "") {
					Element IncomeSPA2002Sgmt = InCtrctInf.addElement("IncomeStatementProfitAppropriation2002Sgmt");
					writeIncomeSPA2002Sgmt(IncomeSPA2002Sgmt, indvEntity);
				}
				/*** 企业利润及利润分配表 --- -2007版段-- ****/
				if (indvEntity.get("EIC_INCOME_STATEMENT_PROFIT_ID") != null
						&& indvEntity.get("EIC_INCOME_STATEMENT_PROFIT_ID") != "") {
					Element IncomeSPA2007Sgmt = InCtrctInf.addElement("IncomeStatementProfitAppropriation2007Sgmt");
					writeIncomeSPA2007Sgmt(IncomeSPA2007Sgmt, indvEntity);
				}
				sbf.append(document.getRootElement().asXML());
				sbf.append("\r\n");
			}
			if(f%fileForNum == 0){
				// 报文名称
				logger.info("开始获取流水号");
				Map<String,Object> serialNumMap = new HashMap<String,Object>();
				serialNumMap.put("inRefType", PecrConstantUtil.ENT_INCODE_STATE_PRO);
				serialNumMap.put("company", company);
				CreateSerialNumber instance = CreateSerialNumber.getInstance();
				instance.setReportMessageManager(reportMessageService);
				String reportNum = instance.getSerialNumb(serialNumMap);
				reportName = generateRpName(PecrConstantUtil.ENT_INCODE_STATE_PRO,reportNum,"0"+CCRC_ORG_CODE);
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
			
			// 韦宗英 add 总数追加  66 
			toalNum +=list.size();
			
			//韦宗英  update  生成一条报文并且开线程处理预处理  77
			if((f+1)%fileForNum == 0||f==(forNum-1)){
				logger.info("写入报文执行完成");
				// 组织插入对象
				ReportAndBackMessageEnt rabme = new ReportAndBackMessageEnt();
				String rpt_date = needReportDetail.getRptDate().get(0).toString();
				rabme = AbstractGenerateReport.generateRpMessage(rpt_date, rabme, PecrConstantUtil.ENT_INCODE_STATE_PRO,reportName, 
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
		logger.info("XML格式BODY内容生成执行完成--------------企业利润及利润分配信息生成完毕");
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
				reportMessageService.updateEntIncomeSPARpDataStatus(conditionMap);
				break;
			case PecrConstantUtil.BUSINESS_STATUS_90:
				conditionMap.put("BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_90);
				conditionMap.put("OLD_BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_85);
				reportMessageService.updateEntIncomeSPARpDataStatus(conditionMap);
				break;
			case PecrConstantUtil.BUSINESS_STATUS_50:
				conditionMap.put("BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_50);
				conditionMap.put("OLD_BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_90);
				reportMessageService.updateEntIncomeSPARpDataStatus(conditionMap);
				break;
			default:
				break;
			}
		}
	}

	// 企业授信基础

	public void writeIncomeSPABsSgmt(Element IncomeSPABsSgmt, Map<String, Object> indvEntity) {
		IncomeSPABsSgmt.addElement("InfRecType")
				.setText(indvEntity.get("INF_REC_TYPE") != null ? indvEntity.get("INF_REC_TYPE").toString() : "");
		IncomeSPABsSgmt.addElement("EntName")
				.setText(indvEntity.get("ENT_NAME") != null ? indvEntity.get("ENT_NAME").toString() : "");
		IncomeSPABsSgmt.addElement("EntCertType")
				.setText(indvEntity.get("ENT_CERT_TYPE") != null ? indvEntity.get("ENT_CERT_TYPE").toString() : "");
		IncomeSPABsSgmt.addElement("EntCertNum")
				.setText(indvEntity.get("ENT_CERT_NUM") != null ? indvEntity.get("ENT_CERT_NUM").toString() : "");
		IncomeSPABsSgmt.addElement("RptDate")
				.setText(indvEntity.get("RPT_DATE") != null ? indvEntity.get("RPT_DATE").toString() : "");
		IncomeSPABsSgmt.addElement("SheetYear")
				.setText(indvEntity.get("SHEET_YEAR") != null ? indvEntity.get("SHEET_YEAR").toString() : "");
		IncomeSPABsSgmt.addElement("SheetType")
				.setText(indvEntity.get("SHEET_TYPE") != null ? indvEntity.get("SHEET_TYPE").toString() : "");
		IncomeSPABsSgmt.addElement("SheetTypeDivide").setText(
				indvEntity.get("SHEET_TYPE_DIVIDE") != null ? indvEntity.get("SHEET_TYPE_DIVIDE").toString() : "");
		IncomeSPABsSgmt.addElement("AuditFirmName")
				.setText(indvEntity.get("AUDIT_FIRM_NAME") != null ? indvEntity.get("AUDIT_FIRM_NAME").toString() : "");
		IncomeSPABsSgmt.addElement("AuditorName")
				.setText(indvEntity.get("AUDITOR_NAME") != null ? indvEntity.get("AUDITOR_NAME").toString() : "");
		IncomeSPABsSgmt.addElement("AuditTime")
				.setText(indvEntity.get("AUDIT_TIME") != null ? indvEntity.get("AUDIT_TIME").toString() : "");
		IncomeSPABsSgmt.addElement("Cimoc")
				.setText(indvEntity.get("CIMOC") != null ? indvEntity.get("CIMOC").toString() : "");
		IncomeSPABsSgmt.addElement("RptDateCode")
				.setText(indvEntity.get("RPT_DATE_CODE") != null ? indvEntity.get("RPT_DATE_CODE").toString() : "");
	}

	public void writeIncomeSPA2002Sgmt(Element IncomeSPA2002Sgmt, Map<String, Object> indvEntity) {
		IncomeSPA2002Sgmt.addElement("MainRevenuefRevenue").setText(indvEntity.get("MAIN_REVENUEF_REVENUE") != null
				? ChangeUtils.stringToFStr(indvEntity.get("MAIN_REVENUEF_REVENUE").toString()) : "");
		IncomeSPA2002Sgmt.addElement("SalesIncomeOfExportGoodsProducts")
				.setText(indvEntity.get("SALES_INCOME_OF_EXPORT_GOODS_P") != null
						? ChangeUtils.stringToFStr(indvEntity.get("SALES_INCOME_OF_EXPORT_GOODS_P").toString()) : "");
		IncomeSPA2002Sgmt.addElement("SalesIncomeOfImportGoodsProducts")
				.setText(indvEntity.get("SALES_INCOME_OF_IMPORT_GOODS_P") != null
						? ChangeUtils.stringToFStr(indvEntity.get("SALES_INCOME_OF_IMPORT_GOODS_P").toString()) : "");
		IncomeSPA2002Sgmt.addElement("DiscountAndAllowance").setText(indvEntity.get("DISCOUNT_AND_ALLOWANCE") != null
				? ChangeUtils.stringToFStr(indvEntity.get("DISCOUNT_AND_ALLOWANCE").toString()) : "");
		IncomeSPA2002Sgmt.addElement("NetAmountOfIncomeFromMainBusiness")
				.setText(indvEntity.get("NET_AMOUNT_OF_INCOME_FROM_MAIN") != null
						? ChangeUtils.stringToFStr(indvEntity.get("NET_AMOUNT_OF_INCOME_FROM_MAIN").toString()) : "");
		IncomeSPA2002Sgmt.addElement("MainOperatingCost").setText(
				indvEntity.get("MAIN_OPERATING_COST") != null ? ChangeUtils.stringToFStr(indvEntity.get("MAIN_OPERATING_COST").toString()) : "");
		IncomeSPA2002Sgmt.addElement("SalesIncomeOfExportProducts")
				.setText(indvEntity.get("SALES_INCOME_OF_EXPORT_PRODUCT") != null
						? ChangeUtils.stringToFStr(indvEntity.get("SALES_INCOME_OF_EXPORT_PRODUCT").toString()) : "");
		IncomeSPA2002Sgmt.addElement("PrincipleBusinessTaxAndExtraCharge")
				.setText(indvEntity.get("PRINCIPLE_BUSINESS_TAX_AND_EXT") != null
						? ChangeUtils.stringToFStr(indvEntity.get("PRINCIPLE_BUSINESS_TAX_AND_EXT").toString()) : "");
		IncomeSPA2002Sgmt.addElement("OperationExpense").setText(
				indvEntity.get("OPERATION_EXPENSE") != null ? ChangeUtils.stringToFStr(indvEntity.get("OPERATION_EXPENSE").toString()) : "");
		IncomeSPA2002Sgmt.addElement("OthersOperatingCost").setText(indvEntity.get("OTHERS_OPERATING_COST") != null
				? ChangeUtils.stringToFStr(indvEntity.get("OTHERS_OPERATING_COST").toString()) : "");
		IncomeSPA2002Sgmt.addElement("DeferredIncome")
				.setText(indvEntity.get("DEFERRED_INCOME") != null ? ChangeUtils.stringToFStr(indvEntity.get("DEFERRED_INCOME").toString()) : "");
		IncomeSPA2002Sgmt.addElement("IncomeFromSalesAgency").setText(indvEntity.get("INCOME_FROM_SALES_AGENCY") != null
				? ChangeUtils.stringToFStr(indvEntity.get("INCOME_FROM_SALES_AGENCY").toString()) : "");
		IncomeSPA2002Sgmt.addElement("OtherOperatingIncome").setText(indvEntity.get("OTHER_OPERATING_INCOME") != null
				? ChangeUtils.stringToFStr(indvEntity.get("OTHER_OPERATING_INCOME").toString()) : "");
		IncomeSPA2002Sgmt.addElement("PrincipleBusinessProfit")
				.setText(indvEntity.get("PRINCIPLE_BUSINESS_PROFIT") != null
						? ChangeUtils.stringToFStr(indvEntity.get("PRINCIPLE_BUSINESS_PROFIT").toString()) : "");
		IncomeSPA2002Sgmt.addElement("OtherBusinessProfit").setText(indvEntity.get("OTHER_BUSINESS_PROFIT") != null
				? ChangeUtils.stringToFStr(indvEntity.get("OTHER_BUSINESS_PROFIT").toString()) : "");
		IncomeSPA2002Sgmt.addElement("SellingExpenses").setText(
				indvEntity.get("SELLING_EXPENSES") != null ? ChangeUtils.stringToFStr(indvEntity.get("SELLING_EXPENSES").toString()) : "");
		IncomeSPA2002Sgmt.addElement("GeneralAndAdministrativeExpenses")
				.setText(indvEntity.get("GENERAL_AND_ADMINISTRATIVE_EXP") != null
						? ChangeUtils.stringToFStr(indvEntity.get("GENERAL_AND_ADMINISTRATIVE_EXP").toString()) : "");
		IncomeSPA2002Sgmt.addElement("FinancialExpenses").setText(
				indvEntity.get("FINANCIAL_EXPENSES") != null ? ChangeUtils.stringToFStr(indvEntity.get("FINANCIAL_EXPENSES").toString()) : "");
		IncomeSPA2002Sgmt.addElement("OthersExpenses")
				.setText(indvEntity.get("OTHERS_EXPENSES") != null ? ChangeUtils.stringToFStr(indvEntity.get("OTHERS_EXPENSES").toString()) : "");
		IncomeSPA2002Sgmt.addElement("OperatingProfits").setText(
				indvEntity.get("OPERATING_PROFITS") != null ? ChangeUtils.stringToFStr(indvEntity.get("OPERATING_PROFITS").toString()) : "");
		IncomeSPA2002Sgmt.addElement("InvestmentIncome").setText(
				indvEntity.get("INVESTMENT_INCOME") != null ? ChangeUtils.stringToFStr(indvEntity.get("INVESTMENT_INCOME").toString()) : "");
		IncomeSPA2002Sgmt.addElement("FuturesIncome")
				.setText(indvEntity.get("FUTURES_INCOME") != null ? ChangeUtils.stringToFStr(indvEntity.get("FUTURES_INCOME").toString()) : "");
		IncomeSPA2002Sgmt.addElement("AllowanceIncome").setText(
				indvEntity.get("ALLOWANCE_INCOME") != null ? ChangeUtils.stringToFStr(indvEntity.get("ALLOWANCE_INCOME").toString()) : "");
		IncomeSPA2002Sgmt.addElement("AllowanceIncomeBeforeAllowance")
				.setText(indvEntity.get("ALLOWANCE_INCOME_BEFORE_ALLOWA") != null
						? ChangeUtils.stringToFStr(indvEntity.get("ALLOWANCE_INCOME_BEFORE_ALLOWA").toString()) : "");
		IncomeSPA2002Sgmt.addElement("NonOperatingIncome").setText(indvEntity.get("NON_OPERATING_INCOME") != null
				? ChangeUtils.stringToFStr(indvEntity.get("NON_OPERATING_INCOME").toString()) : "");
		IncomeSPA2002Sgmt.addElement("NetGainOnDisposalOfFixedAssets")
				.setText(indvEntity.get("NET_GAIN_ON_DISPOSAL_OF_FIXED") != null
						? ChangeUtils.stringToFStr(indvEntity.get("NET_GAIN_ON_DISPOSAL_OF_FIXED").toString()) : "");
		IncomeSPA2002Sgmt.addElement("IncomeFromNonCurrencyTrade")
				.setText(indvEntity.get("INCOME_FROM_NON_CURRENCY_TRADE") != null
						? ChangeUtils.stringToFStr(indvEntity.get("INCOME_FROM_NON_CURRENCY_TRADE").toString()) : "");
		IncomeSPA2002Sgmt.addElement("IncomeFromSalesOfIntangibleAssets")
				.setText(indvEntity.get("INCOME_FROM_SALES_OF_INTANGIBL") != null
						? ChangeUtils.stringToFStr(indvEntity.get("INCOME_FROM_SALES_OF_INTANGIBL").toString()) : "");
		IncomeSPA2002Sgmt.addElement("IncomeFromPenalty").setText(
				indvEntity.get("INCOME_FROM_PENALTY") != null ? ChangeUtils.stringToFStr(indvEntity.get("INCOME_FROM_PENALTY").toString()) : "");
		IncomeSPA2002Sgmt.addElement("OthersIncome")
				.setText(indvEntity.get("OTHERS_INCOME") != null ? ChangeUtils.stringToFStr(indvEntity.get("OTHERS_INCOME").toString()) : "");
		IncomeSPA2002Sgmt.addElement("CalculatingFromTheContentSalaryBefore")
				.setText(indvEntity.get("CALCULATING_FROM_THE_CONTENT_S") != null
						? ChangeUtils.stringToFStr(indvEntity.get("CALCULATING_FROM_THE_CONTENT_S").toString()) : "");
		IncomeSPA2002Sgmt.addElement("NonOperatingExpenses").setText(indvEntity.get("NON_OPERATING_EXPENSES") != null
				? ChangeUtils.stringToFStr(indvEntity.get("NON_OPERATING_EXPENSES").toString()) : "");
		IncomeSPA2002Sgmt.addElement("LossFromDisposalOfFixedAssets")
				.setText(indvEntity.get("LOSS_FROM_DISPOSAL_OF_FIXED_AS") != null
						? ChangeUtils.stringToFStr(indvEntity.get("LOSS_FROM_DISPOSAL_OF_FIXED_AS").toString()) : "");
		IncomeSPA2002Sgmt.addElement("ExchangeOfNonMonetaryAssetsLoss")
				.setText(indvEntity.get("EXCHANGE_OF_NON_MONETARY_ASSET") != null
						? ChangeUtils.stringToFStr(indvEntity.get("EXCHANGE_OF_NON_MONETARY_ASSET").toString()) : "");
		IncomeSPA2002Sgmt.addElement("LossOfLawsuits").setText(
				indvEntity.get("LOSS_OF_LAWSUITS") != null ? ChangeUtils.stringToFStr(indvEntity.get("LOSS_OF_LAWSUITS").toString()) : "");
		IncomeSPA2002Sgmt.addElement("PaymentForDonation").setText(indvEntity.get("PAYMENT_FOR_DONATION") != null
				? ChangeUtils.stringToFStr(indvEntity.get("PAYMENT_FOR_DONATION").toString()) : "");
		IncomeSPA2002Sgmt.addElement("OtherPayments")
				.setText(indvEntity.get("OTHER_PAYMENTS") != null ? ChangeUtils.stringToFStr(indvEntity.get("OTHER_PAYMENTS").toString()) : "");
		IncomeSPA2002Sgmt.addElement("BalanceOfContentSalary")
				.setText(indvEntity.get("BALANCE_OF_CONTENT_SALARY") != null
						? ChangeUtils.stringToFStr(indvEntity.get("BALANCE_OF_CONTENT_SALARY").toString()) : "");
		IncomeSPA2002Sgmt.addElement("TotalProfit")
				.setText(indvEntity.get("TOTAL_PROFIT") != null ? ChangeUtils.stringToFStr(indvEntity.get("TOTAL_PROFIT").toString()) : "");
		IncomeSPA2002Sgmt.addElement("Incometax")
				.setText(indvEntity.get("INCOMETAX") != null ? ChangeUtils.stringToFStr(indvEntity.get("INCOMETAX").toString()) : "");
		IncomeSPA2002Sgmt.addElement("ImparimentLoss")
				.setText(indvEntity.get("IMPARIMENT_LOSS") != null ? ChangeUtils.stringToFStr(indvEntity.get("IMPARIMENT_LOSS").toString()) : "");
		IncomeSPA2002Sgmt.addElement("UnrealizedInvestmentLosses")
				.setText(indvEntity.get("UNREALIZEDINVESTMENT_LOSSES") != null
						? ChangeUtils.stringToFStr(indvEntity.get("UNREALIZEDINVESTMENT_LOSSES").toString()) : "");
		IncomeSPA2002Sgmt.addElement("NetProfit")
				.setText(indvEntity.get("NET_PROFIT") != null ? ChangeUtils.stringToFStr(indvEntity.get("NET_PROFIT").toString()) : "");
		IncomeSPA2002Sgmt.addElement("ProfitDistributionAtBeginningOfPeriod")
				.setText(indvEntity.get("PROFIT_DISTRIBUTION_AT_BEGINNI") != null
						? ChangeUtils.stringToFStr(indvEntity.get("PROFIT_DISTRIBUTION_AT_BEGINNI").toString()) : "");
		IncomeSPA2002Sgmt.addElement("CompensationOfSurplusReserve")
				.setText(indvEntity.get("COMPENSATION_OF_SURPLUS_RESERV") != null
						? ChangeUtils.stringToFStr(indvEntity.get("COMPENSATION_OF_SURPLUS_RESERV").toString()) : "");
		IncomeSPA2002Sgmt.addElement("OtherAdjustmentFactors")
				.setText(indvEntity.get("OTHER_ADJUSTMENT_FACTORS") != null
						? ChangeUtils.stringToFStr(indvEntity.get("OTHER_ADJUSTMENT_FACTORS").toString()) : "");
		IncomeSPA2002Sgmt.addElement("ProfitAvailableForDistribution")
				.setText(indvEntity.get("PROFIT_AVAILABLE_FOR_DISTRIBUT") != null
						? ChangeUtils.stringToFStr(indvEntity.get("PROFIT_AVAILABLE_FOR_DISTRIBUT").toString()) : "");
		IncomeSPA2002Sgmt.addElement("ProfitReservedForASingleItem")
				.setText(indvEntity.get("PROFIT_RESERVED_FOR_A_SINGLEIT") != null
						? ChangeUtils.stringToFStr(indvEntity.get("PROFIT_RESERVED_FOR_A_SINGLEIT").toString()) : "");
		IncomeSPA2002Sgmt.addElement("SupplementaryCurrentCapital")
				.setText(indvEntity.get("SUPPLEMENTARY_CURRENT_CAPITAL") != null
						? ChangeUtils.stringToFStr(indvEntity.get("SUPPLEMENTARY_CURRENT_CAPITAL").toString()) : "");
		IncomeSPA2002Sgmt.addElement("AppropriationOfStatutorySurplusReserves")
				.setText(indvEntity.get("APPROPRIATION_OF_STATUTORY_SUR") != null
						? ChangeUtils.stringToFStr(indvEntity.get("APPROPRIATION_OF_STATUTORY_SUR").toString()) : "");
		IncomeSPA2002Sgmt.addElement("AppropriationOfStatutoryWelfareFund")
				.setText(indvEntity.get("APPROPRIATION_OF_STATUTORY_WEL") != null
						? ChangeUtils.stringToFStr(indvEntity.get("APPROPRIATION_OF_STATUTORY_WEL").toString()) : "");
		IncomeSPA2002Sgmt.addElement("AppropriationOfStaffIncentiveAndWelfareFund")
				.setText(indvEntity.get("APPROPRIATION_OF_STAFFINCENTIV") != null
						? ChangeUtils.stringToFStr(indvEntity.get("APPROPRIATION_OF_STAFFINCENTIV").toString()) : "");
		IncomeSPA2002Sgmt.addElement("AppropriationOfReserveFund")
				.setText(indvEntity.get("APPROPRIATION_OF_RESERVE_FUND") != null
						? ChangeUtils.stringToFStr(indvEntity.get("APPROPRIATION_OF_RESERVE_FUND").toString()) : "");
		IncomeSPA2002Sgmt.addElement("AppropriationOfEnterpriseExpansionFund")
				.setText(indvEntity.get("APPROPRIATION_OF_ENTERPRISE_EX") != null
						? ChangeUtils.stringToFStr(indvEntity.get("APPROPRIATION_OF_ENTERPRISE_EX").toString()) : "");
		IncomeSPA2002Sgmt.addElement("ProfitsCapitalizadOnReturnOfInvestment")
				.setText(indvEntity.get("PROFITS_CAPITALIZAD_ON_RETURN") != null
						? ChangeUtils.stringToFStr(indvEntity.get("PROFITS_CAPITALIZAD_ON_RETURN").toString()) : "");
		IncomeSPA2002Sgmt.addElement("Others")
				.setText(indvEntity.get("OTHERS") != null ? ChangeUtils.stringToFStr(indvEntity.get("OTHERS").toString()) : "");
		IncomeSPA2002Sgmt.addElement("ProfitAvailableForOwnersDistribution")
				.setText(indvEntity.get("PROFIT_AVAILABLE_FOR_OWNERS_DI") != null
						? ChangeUtils.stringToFStr(indvEntity.get("PROFIT_AVAILABLE_FOR_OWNERS_DI").toString()) : "");
		IncomeSPA2002Sgmt.addElement("PreferredStockDividendsPayable")
				.setText(indvEntity.get("PREFERRED_STOCK_DIVIDENDS_PAYA") != null
						? ChangeUtils.stringToFStr(indvEntity.get("PREFERRED_STOCK_DIVIDENDS_PAYA").toString()) : "");
		IncomeSPA2002Sgmt.addElement("WithdrawalOtherCommonAccumulationFund")
				.setText(indvEntity.get("WITHDRAWAL_OTHER_COMMON_ACCUMU") != null
						? ChangeUtils.stringToFStr(indvEntity.get("WITHDRAWAL_OTHER_COMMON_ACCUMU").toString()) : "");
		IncomeSPA2002Sgmt.addElement("PayableDividendsOfCommonStock")
				.setText(indvEntity.get("PAYABLE_DIVIDENDS_OF_COMMON_ST") != null
						? ChangeUtils.stringToFStr(indvEntity.get("PAYABLE_DIVIDENDS_OF_COMMON_ST").toString()) : "");
		IncomeSPA2002Sgmt.addElement("TransferFromOrdinarySharesDividendToPaidInCapitalOrStock")
				.setText(indvEntity.get("TRANSFER_FROM_ORDINARY_SHARES") != null
						? ChangeUtils.stringToFStr(indvEntity.get("TRANSFER_FROM_ORDINARY_SHARES").toString()) : "");
		IncomeSPA2002Sgmt.addElement("OthersForOwners").setText(
				indvEntity.get("OTHERS_FOR_OWNERS") != null ? ChangeUtils.stringToFStr(indvEntity.get("OTHERS_FOR_OWNERS").toString()) : "");
		IncomeSPA2002Sgmt.addElement("UnappropriatedProfit").setText(indvEntity.get("UNAPPROPRIATED_PROFIT") != null
				? ChangeUtils.stringToFStr(indvEntity.get("UNAPPROPRIATED_PROFIT").toString()) : "");
		IncomeSPA2002Sgmt.addElement("LossCompensatedBeforeTheTax")
				.setText(indvEntity.get("LOSS_COMPENSATED_BEFORE_THE_TA") != null
						? ChangeUtils.stringToFStr(indvEntity.get("LOSS_COMPENSATED_BEFORE_THE_TA").toString()) : "");
	}

	public void writeIncomeSPA2007Sgmt(Element IncomeSPA2007Sgmt, Map<String, Object> indvEntity) {
		IncomeSPA2007Sgmt.addElement("RevenueOfSales").setText(
				indvEntity.get("REVENUE_OF_SALES") != null ? ChangeUtils.stringToFStr(indvEntity.get("REVENUE_OF_SALES").toString()) : "");
		IncomeSPA2007Sgmt.addElement("CostOfSales")
				.setText(indvEntity.get("COST_OF_SALES") != null ? ChangeUtils.stringToFStr(indvEntity.get("COST_OF_SALES").toString()) : "");
		IncomeSPA2007Sgmt.addElement("BusinessAndOtherTaxes").setText(indvEntity.get("BUSINESS_AND_OTHER_TAXES") != null
				? ChangeUtils.stringToFStr(indvEntity.get("BUSINESS_AND_OTHER_TAXES").toString()) : "");
		IncomeSPA2007Sgmt.addElement("SellingExpenses").setText(indvEntity.get("SELLING_EXPENSES_2007") != null
				? ChangeUtils.stringToFStr(indvEntity.get("SELLING_EXPENSES_2007").toString()) : "");
		IncomeSPA2007Sgmt.addElement("GeneralAndAdministrativeExpenses")
				.setText(indvEntity.get("GENERAL_AND_ADMINISTRATIVE_E7") != null
						? ChangeUtils.stringToFStr(indvEntity.get("GENERAL_AND_ADMINISTRATIVE_E7").toString()) : "");
		IncomeSPA2007Sgmt.addElement("FinancialExpense").setText(
				indvEntity.get("FINANCIAL_EXPENSE") != null ? ChangeUtils.stringToFStr(indvEntity.get("FINANCIAL_EXPENSE").toString()) : "");
		IncomeSPA2007Sgmt.addElement("ImpairmentLossOfAssets")
				.setText(indvEntity.get("IMPAIRMENT_LOSS_OF_ASSETS") != null
						? ChangeUtils.stringToFStr(indvEntity.get("IMPAIRMENT_LOSS_OF_ASSETS").toString()) : "");
		IncomeSPA2007Sgmt.addElement("ProfitOrLossArisingFromChangesInFairValue")
				.setText(indvEntity.get("PROFIT_OR_LOSS_ARISING_FROM_CH") != null
						? ChangeUtils.stringToFStr(indvEntity.get("PROFIT_OR_LOSS_ARISING_FROM_CH").toString()) : "");
		IncomeSPA2007Sgmt.addElement("InvestmentIncome").setText(indvEntity.get("INVESTMENT_INCOME_2007") != null
				? ChangeUtils.stringToFStr(indvEntity.get("INVESTMENT_INCOME_2007").toString()) : "");
		IncomeSPA2007Sgmt.addElement("InvestmentIncomeFromAffiliatedBusinessAndCooperativeEnterprise")
				.setText(indvEntity.get("INVESTMENT_INCOME_FROM_AFFILIA") != null
						? ChangeUtils.stringToFStr(indvEntity.get("INVESTMENT_INCOME_FROM_AFFILIA").toString()) : "");
		IncomeSPA2007Sgmt.addElement("OperatingProfits").setText(indvEntity.get("OPERATING_PROFITS_2007") != null
				? ChangeUtils.stringToFStr(indvEntity.get("OPERATING_PROFITS_2007").toString()) : "");
		IncomeSPA2007Sgmt.addElement("NonOperatingIncome").setText(indvEntity.get("NON_OPERATING_INCOME_2007") != null
				? ChangeUtils.stringToFStr(indvEntity.get("NON_OPERATING_INCOME_2007").toString()) : "");
		IncomeSPA2007Sgmt.addElement("NonOperatingExpenses")
				.setText(indvEntity.get("NON_OPERATING_EXPENSES_2007") != null
						? ChangeUtils.stringToFStr(indvEntity.get("NON_OPERATING_EXPENSES_2007").toString()) : "");
		IncomeSPA2007Sgmt.addElement("NonCurrentAssets").setText(
				indvEntity.get("NON_CURRENTASSETS") != null ? ChangeUtils.stringToFStr(indvEntity.get("NON_CURRENTASSETS").toString()) : "");
		IncomeSPA2007Sgmt.addElement("ProfitBeforeTax").setText(
				indvEntity.get("PROFIT_BEFORE_TAX") != null ? ChangeUtils.stringToFStr(indvEntity.get("PROFIT_BEFORE_TAX").toString()) : "");
		IncomeSPA2007Sgmt.addElement("IncomeTaxExpense").setText(
				indvEntity.get("INCOME_TAX_EXPENSE") != null ? ChangeUtils.stringToFStr(indvEntity.get("INCOME_TAX_EXPENSE").toString()) : "");
		IncomeSPA2007Sgmt.addElement("NetProfit")
				.setText(indvEntity.get("NET_PROFIT_2007") != null ? ChangeUtils.stringToFStr(indvEntity.get("NET_PROFIT_2007").toString()) : "");
		IncomeSPA2007Sgmt.addElement("BasicEarningsPerShare").setText(indvEntity.get("BASICEARNINGS_PER_SHARE") != null
				? ChangeUtils.stringToFStr(indvEntity.get("BASICEARNINGS_PER_SHARE").toString()) : "");
		IncomeSPA2007Sgmt.addElement("DilutedEarningsPerShare")
				.setText(indvEntity.get("DILUTED_EARNINGS_PER_SHARE") != null
						? ChangeUtils.stringToFStr(indvEntity.get("DILUTED_EARNINGS_PER_SHARE").toString()) : "");
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
