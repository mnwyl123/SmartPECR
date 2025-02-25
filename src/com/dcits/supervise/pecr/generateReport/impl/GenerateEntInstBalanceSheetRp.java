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
 * 事业单位资产负债表生成报文
 * 
 * @author munan
 *
 */
public class GenerateEntInstBalanceSheetRp extends AbstractGenerateReport {

	private final static Logger logger = Logger.getLogger(GenerateEntInstBalanceSheetRp.class);

	public Properties properties;

	public ReportMessageManager reportMessageService;

	private static String TABLE_NAME = "E_INSTITU_BALANCE_BS";

	private static String PACKET_KEY = "EKA_INSTITUTION_BALANCE_SHT_ID";
	
	private int count =0;
	
	private String CCRC_ORG_CODE = "";

	public GenerateEntInstBalanceSheetRp(Properties properties, ReportMessageManager reportMessageService) {
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
		reportCount.put("INF_REC_TYPE",PecrConstantUtil.ENT_INST_BALANCE);
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
			reportCount.put("INF_REC_TYPE",PecrConstantUtil.ENT_INST_BALANCE);
			//获取组织事业单位资产负债报文所需要的数据
			list = reportMessageService.queryEntInstBalanceSheetRpData(reportCount);
			
			// 存放报文名和对应数据ID的map
			List<String> paaid = new ArrayList<>();
			List<Map<String,String>> pkColnumList = new ArrayList<Map<String,String>>();
			//这里斗胆利用了List集合的有序性
			for(int i=0;i<list.size();i++){
				Map<String, Object> entInstBalanceSheetEntity = list.get(i);
				String pk = entInstBalanceSheetEntity.get("EKA_INSTITUTION_BALANCE_SHT_ID").toString();
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
				String headStr = generateRpHead(PecrConstantUtil.ENT_INST_BALANCE, numTotal[forTop++], "  "+CCRC_ORG_CODE);
				sbf.append(headStr);
				sbf.append("\r\n");
			}
			
			for (Map<String, Object> indvEntity : list) {
				Document document = DocumentHelper.createDocument();
				Element root = document.addElement("Document");
				Element InCtrctInf = root.addElement("InstitutionBalanceSheet");
				/*** 事业单位资产负债表 --- 基础段 ****/
				Element InstBalanceSheetBsSgmt = InCtrctInf.addElement("InstitutionBalanceSheetBsSgmt");
				writeInstBalanceSheetBsSgmt(InstBalanceSheetBsSgmt, indvEntity);
				/*** 事业单位资产负债表 --- -报表段-- ****/
				Element InstBalanceSheetSgmt = InCtrctInf.addElement("InstitutionBalanceSheetSgmt");
				writeInstBalanceSheetSgmt(InstBalanceSheetSgmt, indvEntity);
				sbf.append(document.getRootElement().asXML());
				sbf.append("\r\n");
			}
			if(f%fileForNum == 0){
				// 报文名称
				logger.info("开始获取流水号");
				Map<String,Object> serialNumMap = new HashMap<String,Object>();
				serialNumMap.put("inRefType", PecrConstantUtil.ENT_INST_BALANCE);
				serialNumMap.put("company", company);
				CreateSerialNumber instance = CreateSerialNumber.getInstance();
				instance.setReportMessageManager(reportMessageService);
				String reportNum = instance.getSerialNumb(serialNumMap);
				reportName = generateRpName(PecrConstantUtil.ENT_INST_BALANCE, reportNum, "0"+CCRC_ORG_CODE);
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
				rabme = AbstractGenerateReport.generateRpMessage(rpt_date, rabme, PecrConstantUtil.ENT_INST_BALANCE,reportName, 
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
		logger.info("XML格式BODY内容生成执行完成--------------事业单位资产负债信息生成完毕");
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
				reportMessageService.updateEntInstBalanceSheetRpDataStatus(conditionMap);
				break;
			case PecrConstantUtil.BUSINESS_STATUS_90:
				conditionMap.put("BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_90);
				conditionMap.put("OLD_BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_85);
				reportMessageService.updateEntInstBalanceSheetRpDataStatus(conditionMap);
				break;
			case PecrConstantUtil.BUSINESS_STATUS_50:
				conditionMap.put("BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_50);
				conditionMap.put("OLD_BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_90);
				reportMessageService.updateEntInstBalanceSheetRpDataStatus(conditionMap);
				break;
			default:
				break;
			}
		}
	}

	// 企业授信基础

	public void writeInstBalanceSheetBsSgmt(Element InstBalanceSheetBsSgmt, Map<String, Object> indvEntity) {
		InstBalanceSheetBsSgmt.addElement("InfRecType")
				.setText(indvEntity.get("INF_REC_TYPE") != null ? indvEntity.get("INF_REC_TYPE").toString() : "");
		InstBalanceSheetBsSgmt.addElement("EntName")
				.setText(indvEntity.get("ENT_NAME") != null ? indvEntity.get("ENT_NAME").toString() : "");
		InstBalanceSheetBsSgmt.addElement("EntCertType")
				.setText(indvEntity.get("ENT_CERT_TYPE") != null ? indvEntity.get("ENT_CERT_TYPE").toString() : "");
		InstBalanceSheetBsSgmt.addElement("EntCertNum")
				.setText(indvEntity.get("ENT_CERT_NUM") != null ? indvEntity.get("ENT_CERT_NUM").toString() : "");
		InstBalanceSheetBsSgmt.addElement("RptDate")
				.setText(indvEntity.get("RPT_DATE") != null ? indvEntity.get("RPT_DATE").toString() : "");
		InstBalanceSheetBsSgmt.addElement("SheetYear")
				.setText(indvEntity.get("SHEET_YEAR") != null ? indvEntity.get("SHEET_YEAR").toString() : "");
		InstBalanceSheetBsSgmt.addElement("SheetType")
				.setText(indvEntity.get("SHEET_TYPE") != null ? indvEntity.get("SHEET_TYPE").toString() : "");
		InstBalanceSheetBsSgmt.addElement("SheetTypeDivide").setText(
				indvEntity.get("SHEET_TYPE_DIVIDE") != null ? indvEntity.get("SHEET_TYPE_DIVIDE").toString() : "");
		InstBalanceSheetBsSgmt.addElement("AuditFirmName")
				.setText(indvEntity.get("AUDIT_FIRM_NAME") != null ? indvEntity.get("AUDIT_FIRM_NAME").toString() : "");
		InstBalanceSheetBsSgmt.addElement("AuditorName")
				.setText(indvEntity.get("AUDITOR_NAME") != null ? indvEntity.get("AUDITOR_NAME").toString() : "");
		InstBalanceSheetBsSgmt.addElement("AuditTime")
				.setText(indvEntity.get("AUDIT_TIME") != null ? indvEntity.get("AUDIT_TIME").toString() : "");
		InstBalanceSheetBsSgmt.addElement("Cimoc")
				.setText(indvEntity.get("CIMOC") != null ? indvEntity.get("CIMOC").toString() : "");
		InstBalanceSheetBsSgmt.addElement("RptDateCode")
				.setText(indvEntity.get("RPT_DATE_CODE") != null ? indvEntity.get("RPT_DATE_CODE").toString() : "");
	}

	public void writeInstBalanceSheetSgmt(Element InstBalanceSheetSgmt, Map<String, Object> indvEntity) {
		InstBalanceSheetSgmt.addElement("CurrencyFunds")
				.setText((indvEntity.get("CURRENCY_FUNDS") != null ? ChangeUtils.stringToFStr(indvEntity.get("CURRENCY_FUNDS").toString()) : "")
						 );
		InstBalanceSheetSgmt.addElement("ShortTermInvestments")
				.setText((indvEntity.get("SHORT_TERM_INVESTMENTS") != null
						? ChangeUtils.stringToFStr(indvEntity.get("SHORT_TERM_INVESTMENTS").toString()) : "") );
		InstBalanceSheetSgmt.addElement("AmountOfFinancialReturn")
				.setText((indvEntity.get("AMOUNT_OF_FINANCIAL_RETURN") != null
						? ChangeUtils.stringToFStr(indvEntity.get("AMOUNT_OF_FINANCIAL_RETURN").toString()) : "") );
		InstBalanceSheetSgmt.addElement("NotesReceivable").setText(
				(indvEntity.get("NOTES_RECEIVABLE") != null ? ChangeUtils.stringToFStr(indvEntity.get("NOTES_RECEIVABLE").toString()) : "")
						 );
		InstBalanceSheetSgmt.addElement("AccountsReceivable").setText(
				(indvEntity.get("ACCOUNTS_RECEIVABLE") != null ? ChangeUtils.stringToFStr(indvEntity.get("ACCOUNTS_RECEIVABLE").toString()) : "")
						 );
		InstBalanceSheetSgmt.addElement("Prepayments")
				.setText((indvEntity.get("PREPAYMENTS") != null ? ChangeUtils.stringToFStr(indvEntity.get("PREPAYMENTS").toString()) : "")
						 );
		InstBalanceSheetSgmt.addElement("OtherReceivables").setText(
				(indvEntity.get("OTHER_RECEIVABLES") != null ? ChangeUtils.stringToFStr(indvEntity.get("OTHER_RECEIVABLES").toString()) : "")
						 );
		InstBalanceSheetSgmt.addElement("Inventories")
				.setText((indvEntity.get("INVENTORIES") != null ? ChangeUtils.stringToFStr(indvEntity.get("INVENTORIES").toString()) : "")
						 );
		InstBalanceSheetSgmt.addElement("OtherCurrentAssets").setText((indvEntity.get("OTHER_CURRENT_ASSETS") != null
				? ChangeUtils.stringToFStr(indvEntity.get("OTHER_CURRENT_ASSETS").toString()) : "") );
		InstBalanceSheetSgmt.addElement("TotalCurrentAssets").setText((indvEntity.get("TOTAL_CURRENT_ASSETS") != null
				? ChangeUtils.stringToFStr(indvEntity.get("TOTAL_CURRENT_ASSETS").toString()) : "") );
		InstBalanceSheetSgmt.addElement("LongTermInvestment").setText((indvEntity.get("LONG_TERM_INVESTMENT") != null
				? ChangeUtils.stringToFStr(indvEntity.get("LONG_TERM_INVESTMENT").toString()) : "") );
		InstBalanceSheetSgmt.addElement("FixedAssets")
				.setText((indvEntity.get("FIXED_ASSETS") != null ? ChangeUtils.stringToFStr(indvEntity.get("FIXED_ASSETS").toString()) : "")
						 );
		InstBalanceSheetSgmt.addElement("OriginalCostOfFixedAsset")
				.setText((indvEntity.get("ORIGINAL_COST_OF_FIXED_ASSET") != null
						? ChangeUtils.stringToFStr(indvEntity.get("ORIGINAL_COST_OF_FIXED_ASSET").toString()) : "") );
		InstBalanceSheetSgmt.addElement("FixedAssetAccumulatedDepreciation")
				.setText((indvEntity.get("FIXED_ASSET_ACCUMULATED_DEPREC") != null
						? ChangeUtils.stringToFStr(indvEntity.get("FIXED_ASSET_ACCUMULATED_DEPREC").toString()) : "") );
		InstBalanceSheetSgmt.addElement("ConstructionInProcess")
				.setText((indvEntity.get("CONSTRUCTION_IN_PROCESS") != null
						? ChangeUtils.stringToFStr(indvEntity.get("CONSTRUCTION_IN_PROCESS").toString()) : "") );
		InstBalanceSheetSgmt.addElement("IntangibleAssets").setText(
				(indvEntity.get("INTANGIBLE_ASSETS") != null ? ChangeUtils.stringToFStr(indvEntity.get("INTANGIBLE_ASSETS").toString()) : "")
						 );
		InstBalanceSheetSgmt.addElement("OriginalPriceOfIntangibleAssets")
				.setText((indvEntity.get("ORIGINAL_PRICE_OF_INTANGIBLE_A") != null
						? ChangeUtils.stringToFStr(indvEntity.get("ORIGINAL_PRICE_OF_INTANGIBLE_A").toString()) : "") );
		InstBalanceSheetSgmt.addElement("AccumulatedAmortization")
				.setText((indvEntity.get("ACCUMULATED_AMORTIZATION") != null
						? ChangeUtils.stringToFStr(indvEntity.get("ACCUMULATED_AMORTIZATION").toString()) : "") );
		InstBalanceSheetSgmt.addElement("AssetsToBeProcessedPendingTheProfit")
				.setText((indvEntity.get("ASSETS_TO_BE_PROCESSED_PENDING") != null
						? ChangeUtils.stringToFStr(indvEntity.get("ASSETS_TO_BE_PROCESSED_PENDING").toString()) : "") );
		InstBalanceSheetSgmt.addElement("TotalNonCurrentAssets")
				.setText((indvEntity.get("TOTAL_NON_CURRENT_ASSETS") != null
						? ChangeUtils.stringToFStr(indvEntity.get("TOTAL_NON_CURRENT_ASSETS").toString()) : "") );
		InstBalanceSheetSgmt.addElement("TotalAssets")
				.setText((indvEntity.get("TOTAL_ASSETS") != null ? ChangeUtils.stringToFStr(indvEntity.get("TOTAL_ASSETS").toString()) : "")
						 );
		InstBalanceSheetSgmt.addElement("ShortTermBorrowings").setText((indvEntity.get("SHORT_TERM_BORROWINGS") != null
				? ChangeUtils.stringToFStr(indvEntity.get("SHORT_TERM_BORROWINGS").toString()) : "") );
		InstBalanceSheetSgmt.addElement("TaxPayable")
				.setText((indvEntity.get("TAX_PAYABLE") != null ? ChangeUtils.stringToFStr(indvEntity.get("TAX_PAYABLE").toString()) : "")
						 );
		InstBalanceSheetSgmt.addElement("TreasuryPayable").setText(
				(indvEntity.get("TREASURY_PAYABLE") != null ? ChangeUtils.stringToFStr(indvEntity.get("TREASURY_PAYABLE").toString()) : "")
						 );
		InstBalanceSheetSgmt.addElement("PayableFinancialSpecialAccount")
				.setText((indvEntity.get("PAYABLE_FINANCIAL_SPECIAL_ACCO") != null
						? ChangeUtils.stringToFStr(indvEntity.get("PAYABLE_FINANCIAL_SPECIAL_ACCO").toString()) : "") );
		InstBalanceSheetSgmt.addElement("EmployeeBenefitsPayable")
				.setText((indvEntity.get("EMPLOYEE_BENEFITS_PAYABLE") != null
						? ChangeUtils.stringToFStr(indvEntity.get("EMPLOYEE_BENEFITS_PAYABLE").toString()) : "") );
		InstBalanceSheetSgmt.addElement("NotesPayable")
				.setText((indvEntity.get("NOTES_PAYABLE") != null ? ChangeUtils.stringToFStr(indvEntity.get("NOTES_PAYABLE").toString()) : "")
						 );
		InstBalanceSheetSgmt.addElement("AccountsPayable").setText(
				(indvEntity.get("ACCOUNTS_PAYABLE") != null ? ChangeUtils.stringToFStr(indvEntity.get("ACCOUNTS_PAYABLE").toString()) : "")
						 );
		InstBalanceSheetSgmt.addElement("ReceiptsInAdvance").setText(
				(indvEntity.get("RECEIPTS_IN_ADVANCE") != null ? ChangeUtils.stringToFStr(indvEntity.get("RECEIPTS_IN_ADVANCE").toString()) : "")
						 );
		InstBalanceSheetSgmt.addElement("OtherPayables")
				.setText((indvEntity.get("OTHER_PAYABLES") != null ? ChangeUtils.stringToFStr(indvEntity.get("OTHER_PAYABLES").toString()) : "")
						 );
		InstBalanceSheetSgmt.addElement("OtherCurrentLiabilities")
				.setText((indvEntity.get("OTHER_CURRENT_LIABILITIES") != null
						? ChangeUtils.stringToFStr(indvEntity.get("OTHER_CURRENT_LIABILITIES").toString()) : "") );
		InstBalanceSheetSgmt.addElement("TotalCurrentLiabilities")
				.setText((indvEntity.get("TOTAL_CURRENT_LIABILITIES") != null
						? ChangeUtils.stringToFStr(indvEntity.get("TOTAL_CURRENT_LIABILITIES").toString()) : "") );
		InstBalanceSheetSgmt.addElement("LongTermBorrowings").setText((indvEntity.get("LONG_TERM_BORROWINGS") != null
				? ChangeUtils.stringToFStr(indvEntity.get("LONG_TERM_BORROWINGS").toString()) : "") );
		InstBalanceSheetSgmt.addElement("LongTermPayables").setText(
				(indvEntity.get("LONG_TERM_PAYABLES") != null ? ChangeUtils.stringToFStr(indvEntity.get("LONG_TERM_PAYABLES").toString()) : "")
						 );
		InstBalanceSheetSgmt.addElement("TotalNonCurrentLiabilities")
				.setText((indvEntity.get("TOTAL_NON_CURRENT_LIABILITIES") != null
						? ChangeUtils.stringToFStr(indvEntity.get("TOTAL_NON_CURRENT_LIABILITIES").toString()) : "") );
		InstBalanceSheetSgmt.addElement("TotalLiabilities").setText(
				(indvEntity.get("TOTAL_LIABILITIES") != null ? ChangeUtils.stringToFStr(indvEntity.get("TOTAL_LIABILITIES").toString()) : "")
						 );
		InstBalanceSheetSgmt.addElement("EnterpriseFund")
				.setText((indvEntity.get("ENTERPRISE_FUND") != null ? ChangeUtils.stringToFStr(indvEntity.get("ENTERPRISE_FUND").toString()) : "")
						 );
		InstBalanceSheetSgmt.addElement("NonCurrentAssetsFund")
				.setText((indvEntity.get("NON_CURRENT_ASSETS_FUND") != null
						? ChangeUtils.stringToFStr(indvEntity.get("NON_CURRENT_ASSETS_FUND").toString()) : "") );
		InstBalanceSheetSgmt.addElement("SpecialPurposeFunds").setText((indvEntity.get("SPECIAL_PURPOSE_FUNDS") != null
				? ChangeUtils.stringToFStr(indvEntity.get("SPECIAL_PURPOSE_FUNDS").toString()) : "") );
		InstBalanceSheetSgmt.addElement("FinancialAidCarriedOver")
				.setText((indvEntity.get("FINANCIAL_AID_CARRIED_OVER") != null
						? ChangeUtils.stringToFStr(indvEntity.get("FINANCIAL_AID_CARRIED_OVER").toString()) : "") );
		InstBalanceSheetSgmt.addElement("FinancialAidBalance").setText((indvEntity.get("FINANCIAL_AID_BALANCE") != null
				? ChangeUtils.stringToFStr(indvEntity.get("FINANCIAL_AID_BALANCE").toString()) : "") );
		InstBalanceSheetSgmt.addElement("NonFinancialAidCarriedOver")
				.setText((indvEntity.get("NON_FINANCIAL_AID_CARRIED_OVER") != null
						? ChangeUtils.stringToFStr(indvEntity.get("NON_FINANCIAL_AID_CARRIED_OVER").toString()) : "") );
		InstBalanceSheetSgmt.addElement("NonFinancialAidBalance")
				.setText((indvEntity.get("NON_FINANCIAL_AID_BALANCE") != null
						? ChangeUtils.stringToFStr(indvEntity.get("NON_FINANCIAL_AID_BALANCE").toString()) : "") );
		InstBalanceSheetSgmt.addElement("UndertakingsBalance").setText((indvEntity.get("UNDERTAKINGS_BALANCE") != null
				? ChangeUtils.stringToFStr(indvEntity.get("UNDERTAKINGS_BALANCE").toString()) : "") );
		InstBalanceSheetSgmt.addElement("OperatingBalance").setText(
				(indvEntity.get("OPERATING_BALANCE") != null ? ChangeUtils.stringToFStr(indvEntity.get("OPERATING_BALANCE").toString()) : "")
						 );
		InstBalanceSheetSgmt.addElement("TotalNetAssets").setText(
				(indvEntity.get("TOTAL_NET_ASSETS") != null ? ChangeUtils.stringToFStr(indvEntity.get("TOTAL_NET_ASSETS").toString()) : "")
						 );
		InstBalanceSheetSgmt.addElement("TotalLiabilitiesAndNetAssets")
				.setText((indvEntity.get("TOTAL_LIABILITIES_AND_NET_ASSE") != null
						? ChangeUtils.stringToFStr(indvEntity.get("TOTAL_LIABILITIES_AND_NET_ASSE").toString()) : "") );
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
