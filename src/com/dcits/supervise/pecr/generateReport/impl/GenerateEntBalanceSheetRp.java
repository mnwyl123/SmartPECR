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
 * 企业资产负债表信息记录生成报文
 * 
 * @author munan
 *
 */
public class GenerateEntBalanceSheetRp extends AbstractGenerateReport {

	private final static Logger logger = Logger.getLogger(GenerateEntBalanceSheetRp.class);

	public Properties properties;

	public ReportMessageManager reportMessageService;

	private static  String TABLE_NAME = "E_BALANCE_SHEET_BS";

	private static String PACKET_KEY = "EHA_BALANCE_SHEET_BS_SGMT_ID";
	
	private int count =0;
	
	private String CCRC_ORG_CODE = "";

	public GenerateEntBalanceSheetRp(Properties properties, ReportMessageManager reportMessageService) {

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
		reportCount.put("INF_REC_TYPE",PecrConstantUtil.ENT_BALANCE_SHEET);
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
		int num = forNum / fileForNum + (forNum % fileForNum == 0 ? 0 : 1);
		//numTotal：代表本次报文生成涉及的数据量需要生成几个报文文件，数组中每一项代表一个报文文件以及报文文件的数据量。
		int[] numTotal = new int[num];
		if (num != 1) {
			for(int i = 0;i<num;i++){
				if(i == num-1){
					numTotal[i]=count-(i*pageSize*fileForNum);
				}else{
					numTotal[i]=fileForNum*(pageSize);
				}
			}
		} else {
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
			reportCount.put("INF_REC_TYPE",PecrConstantUtil.ENT_BALANCE_SHEET);
			//获取组装企业资产负债所要的数据信息
			list = reportMessageService.queryEntBalanceSheetRpData(reportCount);
			// 存放报文名和对应数据ID的map
			List<String> paaid = new ArrayList<>();
			List<Map<String,String>> pkColnumList = new ArrayList<Map<String,String>>();
			//这里斗胆利用了List集合的有序性
			for(int i=0;i<list.size();i++){
				Map<String, Object> entBalanceSheetEntity = list.get(i);
				String pk = entBalanceSheetEntity.get("EHA_BALANCE_SHEET_BS_SGMT_ID").toString();
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
			if (f % fileForNum == 0) {
				String headStr = generateRpHead(PecrConstantUtil.ENT_BALANCE_SHEET, numTotal[forTop++],"  " + CCRC_ORG_CODE);
				sbf.append(headStr);
				sbf.append("\r\n");
			}
			
			for (Map<String, Object> indvEntity : list) {
				Document document = DocumentHelper.createDocument();
				Element root = document.addElement("Document");
				Element InCtrctInf = root.addElement("BalanceSheet");
				/*** 企业资产负债表 --- 基础段 ****/
				Element BalanceSheetBsSgmt = InCtrctInf.addElement("BalanceSheetBsSgmt");
				writeBalanceSheetBsSgmt(BalanceSheetBsSgmt, indvEntity);
				if (indvEntity.get("EHB_BALANCE_SHEET2002_SGMT_ID") != null
						&& indvEntity.get("EHB_BALANCE_SHEET2002_SGMT_ID").toString() != "") {
					/*** 企业资产负债表 --- -2002版段-- ****/
					Element BalanceSheet2002Sgmt = InCtrctInf.addElement("BalanceSheet2002Sgmt");
					writeBalanceSheet2002Sgmt(BalanceSheet2002Sgmt, indvEntity);
				} else {
					/*** 企业资产负债表 --- -2007版段-- ****/
					if (indvEntity.get("EHC_BALANCE_SHEET2007_SGMT_ID") != null
							&& !indvEntity.get("EHC_BALANCE_SHEET2007_SGMT_ID").toString().equals("")) {
						Element BalanceSheet2007Sgmt = InCtrctInf.addElement("BalanceSheet2007Sgmt");
						writeBalanceSheet2007Sgmt(BalanceSheet2007Sgmt, indvEntity);
					}
				}
				sbf.append(document.getRootElement().asXML());
				sbf.append("\r\n");
			}
			if (f % fileForNum == 0) {
				// 报文名称
				logger.info("开始获取流水号");
				Map<String,Object> serialNumMap = new HashMap<String,Object>();
				serialNumMap.put("inRefType", PecrConstantUtil.ENT_BALANCE_SHEET);
				serialNumMap.put("company", company);
				CreateSerialNumber instance = CreateSerialNumber.getInstance();
				instance.setReportMessageManager(reportMessageService);
				String reportNum = instance.getSerialNumb(serialNumMap);
				reportName = generateRpName(PecrConstantUtil.ENT_BALANCE_SHEET,reportNum, "0" + CCRC_ORG_CODE);
				if (reportName == null || reportName == "") {
					logger.info("获取流水号异常");
					reportMap.put("resultCode", "ERROR");
					reportMap.put("resultMsg", "获取流水号异常");
					return reportMap;
				}
				//把数据写入文件
				reportFilePath = FileUtil.writeTOFile(sbf, saveCreateReportPath, reportName+".txt");

			} else {
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
			// 韦宗英 add 总数追加 66
			toalNum += list.size();

			// 韦宗英 update 生成一条报文并且开线程处理预处理 77
			if ((f + 1) % fileForNum == 0 || f == (forNum - 1)) {
				logger.info("写入报文执行完成");
				// 组织插入对象
				ReportAndBackMessageEnt rabme = new ReportAndBackMessageEnt();
				String rpt_date = needReportDetail.getRptDate().get(0).toString();
				rabme = AbstractGenerateReport.generateRpMessage(rpt_date, rabme, PecrConstantUtil.ENT_BALANCE_SHEET,reportName, 
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
		logger.info("XML格式BODY内容生成执行完成--------------企业资产负债信息生成完毕");
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
				conditionMap.put("OLD_BUSINESS_STATES","");
				reportMessageService.updateEntBalanceSheetRpDataStatus(conditionMap);
				break;
			case PecrConstantUtil.BUSINESS_STATUS_90:
				conditionMap.put("BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_90);
				conditionMap.put("OLD_BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_85);
				reportMessageService.updateEntBalanceSheetRpDataStatus(conditionMap);
				break;
			case PecrConstantUtil.BUSINESS_STATUS_50:
				conditionMap.put("BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_50);
				conditionMap.put("OLD_BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_90);
				reportMessageService.updateEntBalanceSheetRpDataStatus(conditionMap);
				break;
			default:
				break;
			}
		}
	}

	// 企业授信基础

	public void writeBalanceSheetBsSgmt(Element BalanceSheetBsSgmt, Map<String, Object> indvEntity) {
		BalanceSheetBsSgmt.addElement("InfRecType")
				.setText(indvEntity.get("INF_REC_TYPE") != null ? indvEntity.get("INF_REC_TYPE").toString() : "");
		BalanceSheetBsSgmt.addElement("EntName")
				.setText(indvEntity.get("ENT_NAME") != null ? indvEntity.get("ENT_NAME").toString() : "");
		BalanceSheetBsSgmt.addElement("EntCertType")
				.setText(indvEntity.get("ENT_CERT_TYPE") != null ? indvEntity.get("ENT_CERT_TYPE").toString() : "");
		BalanceSheetBsSgmt.addElement("EntCertNum")
				.setText(indvEntity.get("ENT_CERT_NUM") != null ? indvEntity.get("ENT_CERT_NUM").toString() : "");
		BalanceSheetBsSgmt.addElement("RptDate")
				.setText(indvEntity.get("RPT_DATE") != null ? indvEntity.get("RPT_DATE").toString() : "");
		BalanceSheetBsSgmt.addElement("SheetYear")
				.setText(indvEntity.get("SHEET_YEAR") != null ? indvEntity.get("SHEET_YEAR").toString() : "");
		BalanceSheetBsSgmt.addElement("SheetType")
				.setText(indvEntity.get("SHEET_TYPE") != null ? indvEntity.get("SHEET_TYPE").toString() : "");
		BalanceSheetBsSgmt.addElement("SheetTypeDivide").setText(
				indvEntity.get("SHEET_TYPE_DIVIDE") != null ? indvEntity.get("SHEET_TYPE_DIVIDE").toString() : "");
		BalanceSheetBsSgmt.addElement("AuditFirmName")
				.setText(indvEntity.get("AUDIT_FIRM_NAME") != null ? indvEntity.get("AUDIT_FIRM_NAME").toString() : "");
		BalanceSheetBsSgmt.addElement("AuditorName")
				.setText(indvEntity.get("AUDITOR_NAME") != null ? indvEntity.get("AUDITOR_NAME").toString() : "");
		BalanceSheetBsSgmt.addElement("AuditTime")
				.setText(indvEntity.get("AUDIT_TIME") != null ? indvEntity.get("AUDIT_TIME").toString() : "");
		BalanceSheetBsSgmt.addElement("Cimoc")
				.setText(indvEntity.get("CIMOC") != null ? indvEntity.get("CIMOC").toString() : "");
		BalanceSheetBsSgmt.addElement("RptDateCode")
				.setText(indvEntity.get("RPT_DATE_CODE") != null ? indvEntity.get("RPT_DATE_CODE").toString() : "");
	}

	public void writeBalanceSheet2002Sgmt(Element BalanceSheet2002Sgmt, Map<String, Object> indvEntity) {
		BalanceSheet2002Sgmt.addElement("CurrencyFunds").setText((indvEntity.get("CURRENCY_FUNDS_02") != null
				? ChangeUtils.stringToFStr(indvEntity.get("CURRENCY_FUNDS_02").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("ShortTermInvestments")
				.setText((indvEntity.get("SHORT_TERM_INVESTMENTS") != null
						? ChangeUtils.stringToFStr(indvEntity.get("SHORT_TERM_INVESTMENTS").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("NotesReceivable").setText((indvEntity.get("NOTES_RECEIVABLE_02") != null
				? ChangeUtils.stringToFStr(indvEntity.get("NOTES_RECEIVABLE_02").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("DividendsReceivable").setText((indvEntity.get("DIVIDENDS_RECEIVABLE_02") != null
				? ChangeUtils.stringToFStr(indvEntity.get("DIVIDENDS_RECEIVABLE_02").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("InterestReceivable").setText((indvEntity.get("INTEREST_RECEIVABLE_02") != null
				? ChangeUtils.stringToFStr(indvEntity.get("INTEREST_RECEIVABLE_02").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("AccountsReceivable").setText((indvEntity.get("ACCOUNTS_RECEIVABLE_02") != null
				? ChangeUtils.stringToFStr(indvEntity.get("ACCOUNTS_RECEIVABLE_02").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("OtherReceivables").setText((indvEntity.get("OTHER_RECEIVABLES_02") != null
				? ChangeUtils.stringToFStr(indvEntity.get("OTHER_RECEIVABLES_02").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("Prepayments").setText((indvEntity.get("PREPAYMENTS_02") != null
				? ChangeUtils.stringToFStr(indvEntity.get("PREPAYMENTS_02").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("FutureGuarantee").setText((indvEntity.get("FUTURE_GUARANTEE") != null
				? ChangeUtils.stringToFStr(indvEntity.get("FUTURE_GUARANTEE").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("AllowanceReceivable").setText((indvEntity.get("ALLOWANCE_RECEIVABLE") != null
				? ChangeUtils.stringToFStr(indvEntity.get("ALLOWANCE_RECEIVABLE").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("ExportDrawbackReceivable")
				.setText((indvEntity.get("EXPORT_DRAWBACK_RECEIVABLE") != null
						? ChangeUtils.stringToFStr(indvEntity.get("EXPORT_DRAWBACK_RECEIVABLE").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("Inventories").setText((indvEntity.get("INVENTORIES_02") != null
				? ChangeUtils.stringToFStr(indvEntity.get("INVENTORIES_02").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("RawMaterials").setText((indvEntity.get("RAW_MATERIALS") != null
				? ChangeUtils.stringToFStr(indvEntity.get("RAW_MATERIALS").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("FinishedProducts").setText((indvEntity.get("FINISHED_PRODUCTS") != null
				? ChangeUtils.stringToFStr(indvEntity.get("FINISHED_PRODUCTS").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("DeferredExpenses").setText((indvEntity.get("DEFERRED_EXPENSES") != null
				? ChangeUtils.stringToFStr(indvEntity.get("DEFERRED_EXPENSES").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("UnsettledGLOnCurrentAssets")
				.setText((indvEntity.get("UNSETTLED_GLON_CURRENT_ASSETS") != null
						? ChangeUtils.stringToFStr(indvEntity.get("UNSETTLED_GLON_CURRENT_ASSETS").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("LongTermDebentureInvestmentFallingDueInAYear")
				.setText((indvEntity.get("LONG_TERM_DEBENTURE_INVESTMENT") != null
						? ChangeUtils.stringToFStr(indvEntity.get("LONG_TERM_DEBENTURE_INVESTMENT").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("OtherCurrentAssets").setText((indvEntity.get("OTHER_CURRENT_ASSETS_02") != null
				? ChangeUtils.stringToFStr(indvEntity.get("OTHER_CURRENT_ASSETS_02").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("TotalCurrentAssets").setText((indvEntity.get("TOTAL_CURRENT_ASSETS_02") != null
				? ChangeUtils.stringToFStr(indvEntity.get("TOTAL_CURRENT_ASSETS_02").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("LongTermInvestment").setText((indvEntity.get("LONG_TERM_INVESTMENT") != null
				? ChangeUtils.stringToFStr(indvEntity.get("LONG_TERM_INVESTMENT").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("LongTermEquityInvestment")
				.setText((indvEntity.get("LONG_TERM_EQUITY_INVESTMENT_02") != null
						? ChangeUtils.stringToFStr(indvEntity.get("LONG_TERM_EQUITY_INVESTMENT_02").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("LongTermSecuritiesInvestment")
				.setText((indvEntity.get("LONG_TERM_SECURITIES_INVESTMEN") != null
						? ChangeUtils.stringToFStr(indvEntity.get("LONG_TERM_SECURITIES_INVESTMEN").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("IncorporatingPriceDifference")
				.setText((indvEntity.get("INCORPORATING_PRICE_DIFFERENCE") != null
						? ChangeUtils.stringToFStr(indvEntity.get("INCORPORATING_PRICE_DIFFERENCE").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("TotalLongTermInvestment")
				.setText((indvEntity.get("TOTAL_LONG_TERM_INVESTMENT") != null
						? ChangeUtils.stringToFStr(indvEntity.get("TOTAL_LONG_TERM_INVESTMENT").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("OriginalCostOfFixedAsset")
				.setText((indvEntity.get("ORIGINAL_COST_OF_FIXED_ASSET") != null
						? ChangeUtils.stringToFStr(indvEntity.get("ORIGINAL_COST_OF_FIXED_ASSET").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("FixedAssetAccumulatedDepreciation")
				.setText((indvEntity.get("FIXED_ASSET_ACCUMULATED_DEPREC") != null
						? ChangeUtils.stringToFStr(indvEntity.get("FIXED_ASSET_ACCUMULATED_DEPREC").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("FixedAssetsNetValue").setText((indvEntity.get("FIXED_ASSETS_NET_VALUE") != null
				? ChangeUtils.stringToFStr(indvEntity.get("FIXED_ASSETS_NET_VALUE").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("ProvisionForImpairmentOfFixedAssets")
				.setText((indvEntity.get("PROVISION_FORIMPAIRMENT_OF_FIX") != null
						? ChangeUtils.stringToFStr(indvEntity.get("PROVISION_FORIMPAIRMENT_OF_FIX").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("NetValueOfFixedAssets")
				.setText((indvEntity.get("NET_VALUE_OF_FIXED_ASSETS") != null
						? ChangeUtils.stringToFStr(indvEntity.get("NET_VALUE_OF_FIXED_ASSETS").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("FixedAssetsPendingForDisposal")
				.setText((indvEntity.get("FIXED_ASSETS_PENDING_02") != null
						? ChangeUtils.stringToFStr(indvEntity.get("FIXED_ASSETS_PENDING_02").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("ConstructionMaterials")
				.setText((indvEntity.get("CONSTRUCTION_MATERIALS_02") != null
						? ChangeUtils.stringToFStr(indvEntity.get("CONSTRUCTION_MATERIALS_02").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("ConstructionInProgress")
				.setText((indvEntity.get("CONSTRUCTIONIN_PROGRESS") != null
						? ChangeUtils.stringToFStr(indvEntity.get("CONSTRUCTIONIN_PROGRESS").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("UnsettledGLOnFixedAssets")
				.setText((indvEntity.get("UNSETTLED_GL_ON_FIXED_ASSETS") != null
						? ChangeUtils.stringToFStr(indvEntity.get("UNSETTLED_GL_ON_FIXED_ASSETS").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("TotalFixedAssets").setText((indvEntity.get("TOTAL_FIXED_ASSETS") != null
				? ChangeUtils.stringToFStr(indvEntity.get("TOTAL_FIXED_ASSETS").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("IntangibleAssets").setText((indvEntity.get("INTANGIBLE_ASSETS_02") != null
				? ChangeUtils.stringToFStr(indvEntity.get("INTANGIBLE_ASSETS_02").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("LandUseRights").setText((indvEntity.get("LAND_USE_RIGHTS") != null
				? ChangeUtils.stringToFStr(indvEntity.get("LAND_USE_RIGHTS").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("DeferredAssets").setText((indvEntity.get("DEFERRED_ASSETS") != null
				? ChangeUtils.stringToFStr(indvEntity.get("DEFERRED_ASSETS").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("IncludingFixedAssetsRepair")
				.setText((indvEntity.get("INCLUDING_FIXED_ASSETS_REPAIR") != null
						? ChangeUtils.stringToFStr(indvEntity.get("INCLUDING_FIXED_ASSETS_REPAIR").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("ImprovementExpenditureOfFixedAssets")
				.setText((indvEntity.get("IMPROVEMENT_EXPENDITURE_OF_FIX") != null
						? ChangeUtils.stringToFStr(indvEntity.get("IMPROVEMENT_EXPENDITURE_OF_FIX").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("OtherLongTermAssets").setText((indvEntity.get("OTHER_LONG_TERM_ASSETS") != null
				? ChangeUtils.stringToFStr(indvEntity.get("OTHER_LONG_TERM_ASSETS").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("AmongItSpeciallyApprovedReservingMaterials")
				.setText((indvEntity.get("AMONG_IT_SPECIALLY_APPROVED_RE") != null
						? ChangeUtils.stringToFStr(indvEntity.get("AMONG_IT_SPECIALLY_APPROVED_RE").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("TotalIntangibleAssetsAndOtherAssets")
				.setText((indvEntity.get("TOTALINTANGIBLE_ASSETS_AND_OTH") != null
						? ChangeUtils.stringToFStr(indvEntity.get("TOTALINTANGIBLE_ASSETS_AND_OTH").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("DeferredAssetsDebits")
				.setText((indvEntity.get("DEFERRED_ASSETS_DEBITS") != null
						? ChangeUtils.stringToFStr(indvEntity.get("DEFERRED_ASSETS_DEBITS").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("TotalAssets").setText((indvEntity.get("TOTAL_ASSETS_02") != null
				? ChangeUtils.stringToFStr(indvEntity.get("TOTAL_ASSETS_02").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("ShortTermBorrowings").setText((indvEntity.get("SHORT_TERM_BORROWINGS_02") != null
				? ChangeUtils.stringToFStr(indvEntity.get("SHORT_TERM_BORROWINGS_02").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("NotesPayable").setText((indvEntity.get("NOTES_PAYABLE_02") != null
				? ChangeUtils.stringToFStr(indvEntity.get("NOTES_PAYABLE_02").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("AccountsPayable").setText((indvEntity.get("ACCOUNTS_PAYABLE_02") != null
				? ChangeUtils.stringToFStr(indvEntity.get("ACCOUNTS_PAYABLE_02").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("ReceiptsInAdvance").setText((indvEntity.get("RECEIPTSIN_ADVANCE_02") != null
				? ChangeUtils.stringToFStr(indvEntity.get("RECEIPTSIN_ADVANCE_02").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("WagesOrSalariesPayables")
				.setText((indvEntity.get("WAGES_OR_SALARIES_PAYABLES") != null
						? ChangeUtils.stringToFStr(indvEntity.get("WAGES_OR_SALARIES_PAYABLES").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("EmployeeBenefits").setText((indvEntity.get("EMPLOYEE_BENEFITS") != null
				? ChangeUtils.stringToFStr(indvEntity.get("EMPLOYEE_BENEFITS").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("IncomePayable").setText((indvEntity.get("INCOME_PAYABLE") != null
				? ChangeUtils.stringToFStr(indvEntity.get("INCOME_PAYABLE").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("TaxesPayable").setText((indvEntity.get("TAXES_PAYABLE") != null
				? ChangeUtils.stringToFStr(indvEntity.get("TAXES_PAYABLE").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("OtherPayableToGovernment")
				.setText((indvEntity.get("OTHER_PAYABLE_TO_GOVERNMENT") != null
						? ChangeUtils.stringToFStr(indvEntity.get("OTHER_PAYABLE_TO_GOVERNMENT").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("OtherPayable").setText((indvEntity.get("OTHER_PAYABLE") != null
				? ChangeUtils.stringToFStr(indvEntity.get("OTHER_PAYABLE").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("ProvisionForExpenses")
				.setText((indvEntity.get("PROVISION_FOR_EXPENSES") != null
						? ChangeUtils.stringToFStr(indvEntity.get("PROVISION_FOR_EXPENSES").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("Provisions").setText((indvEntity.get("PROVISIONS_02") != null
				? ChangeUtils.stringToFStr(indvEntity.get("PROVISIONS_02").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("LongTermLiabilitiesDueWithinOneYear")
				.setText((indvEntity.get("LONG_TERM_LIABILITIES_DUE_WITH") != null
						? ChangeUtils.stringToFStr(indvEntity.get("LONG_TERM_LIABILITIES_DUE_WITH").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("OtherCurrentLiabilities")
				.setText((indvEntity.get("OTHER_CURRENT_LIABILITIES_02") != null
						? ChangeUtils.stringToFStr(indvEntity.get("OTHER_CURRENT_LIABILITIES_02").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("TotalCurrentLiabilities")
				.setText((indvEntity.get("TOTAL_CURRENT_LIABILITIES_02") != null
						? ChangeUtils.stringToFStr(indvEntity.get("TOTAL_CURRENT_LIABILITIES_02").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("LongTermBorrowings").setText((indvEntity.get("LONG_TERM_BORROWINGS_02") != null
				? ChangeUtils.stringToFStr(indvEntity.get("LONG_TERM_BORROWINGS_02").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("BondsPayable").setText((indvEntity.get("BONDS_PAYABLE") != null
				? ChangeUtils.stringToFStr(indvEntity.get("BONDS_PAYABLE").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("LongTermPayables").setText((indvEntity.get("LONG_TERM_PAYABLES_02") != null
				? ChangeUtils.stringToFStr(indvEntity.get("LONG_TERM_PAYABLES_02").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("GrantsPayable").setText((indvEntity.get("GRANTS_PAYABLE_02") != null
				? ChangeUtils.stringToFStr(indvEntity.get("GRANTS_PAYABLE_02").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("OtherLongTermLiabilities")
				.setText((indvEntity.get("OTHER_LONG_TERM_LIABILITIES") != null
						? ChangeUtils.stringToFStr(indvEntity.get("OTHER_LONG_TERM_LIABILITIES").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("SpecialReserveFund").setText((indvEntity.get("SPECIAL_RESERVE_FUND") != null
				? ChangeUtils.stringToFStr(indvEntity.get("SPECIAL_RESERVE_FUND").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("TotalLongTermLiabilities")
				.setText((indvEntity.get("TOTAL_LONG_TERM_LIABILITIES") != null
						? ChangeUtils.stringToFStr(indvEntity.get("TOTAL_LONG_TERM_LIABILITIES").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("DeferredTaxationCredit")
				.setText((indvEntity.get("DEFERRED_TAXATION_CREDIT") != null
						? ChangeUtils.stringToFStr(indvEntity.get("DEFERRED_TAXATION_CREDIT").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("TotalLiabilities").setText((indvEntity.get("TOTALLIABILITIES") != null
				? ChangeUtils.stringToFStr(indvEntity.get("TOTALLIABILITIES").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("MinorityInterest").setText((indvEntity.get("MINORITY_INTEREST") != null
				? ChangeUtils.stringToFStr(indvEntity.get("MINORITY_INTEREST").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("PaidInCapital").setText((indvEntity.get("PAIDIN_CAPITAL") != null
				? ChangeUtils.stringToFStr(indvEntity.get("PAIDIN_CAPITAL").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("NationalCapital").setText((indvEntity.get("NATIONAL_CAPITAL") != null
				? ChangeUtils.stringToFStr(indvEntity.get("NATIONAL_CAPITAL").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("CollectiveCapital").setText((indvEntity.get("COLLECTIVE_CAPITAL") != null
				? ChangeUtils.stringToFStr(indvEntity.get("COLLECTIVE_CAPITAL").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("LegalPersonsCapital").setText((indvEntity.get("LEGAL_PERSONS_CAPITAL") != null
				? ChangeUtils.stringToFStr(indvEntity.get("LEGAL_PERSONS_CAPITAL").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("StateOwnedLegalPersonsCapital")
				.setText((indvEntity.get("STATE_OWNED_LEGAL_PERSONS_CAPI") != null
						? ChangeUtils.stringToFStr(indvEntity.get("STATE_OWNED_LEGAL_PERSONS_CAPI").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("CollectiveLegalPersonsCapital")
				.setText((indvEntity.get("COLLECTIVE_LEGAL_PERSONS_CAPIT") != null
						? ChangeUtils.stringToFStr(indvEntity.get("COLLECTIVE_LEGAL_PERSONS_CAPIT").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("PersonalCapital").setText((indvEntity.get("PERSONAL_CAPITAL") != null
				? ChangeUtils.stringToFStr(indvEntity.get("PERSONAL_CAPITAL").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("ForeignBusinessmensCapital")
				.setText((indvEntity.get("FOREIGN_BUSINESSMENS_CAPITAL") != null
						? ChangeUtils.stringToFStr(indvEntity.get("FOREIGN_BUSINESSMENS_CAPITAL").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("CapitalrRserve").setText((indvEntity.get("CAPITALR_RSERVE_02") != null
				? ChangeUtils.stringToFStr(indvEntity.get("CAPITALR_RSERVE_02").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("SurplusReserve").setText((indvEntity.get("SURPLUS_RESERVE_02") != null
				? ChangeUtils.stringToFStr(indvEntity.get("SURPLUS_RESERVE_02").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("StatutorySurplusReserve")
				.setText((indvEntity.get("STATUTORY_SURPLUS_RESERVE") != null
						? ChangeUtils.stringToFStr(indvEntity.get("STATUTORY_SURPLUS_RESERVE").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("PublicWelfareFund").setText((indvEntity.get("PUBLIC_WELFARE_FUND") != null
				? ChangeUtils.stringToFStr(indvEntity.get("PUBLIC_WELFARE_FUND").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("SupplermentaryCurrentCapital")
				.setText((indvEntity.get("SUPPLERMENTARY_CURRENT_CAPITAL") != null
						? ChangeUtils.stringToFStr(indvEntity.get("SUPPLERMENTARY_CURRENT_CAPITAL").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("UnaffirmedInvestmentLoss")
				.setText((indvEntity.get("UNAFFIRMEDINVESTMENT_LOSS") != null
						? ChangeUtils.stringToFStr(indvEntity.get("UNAFFIRMEDINVESTMENT_LOSS").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("UnappropriatedProfit").setText((indvEntity.get("UNAPPROPRIATED_PROFIT_02") != null
				? ChangeUtils.stringToFStr(indvEntity.get("UNAPPROPRIATED_PROFIT_02").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("DifferenceOnTranslationOfForeignCurrencyFinancialStatements")
				.setText((indvEntity.get("DIFFERENCE_ON_TRANSLATION_OF_F") != null
						? ChangeUtils.stringToFStr(indvEntity.get("DIFFERENCE_ON_TRANSLATION_OF_F").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("TotalEquity").setText((indvEntity.get("TOTAL_EQUITY_02") != null
				? ChangeUtils.stringToFStr(indvEntity.get("TOTAL_EQUITY_02").toString()) : ""));
		BalanceSheet2002Sgmt.addElement("TotalEquityAndLiabilities")
				.setText((indvEntity.get("TOTAL_EQUITY_AND_LIABILITIE_02") != null
						? ChangeUtils.stringToFStr(indvEntity.get("TOTAL_EQUITY_AND_LIABILITIE_02").toString()) : ""));
	}

	public void writeBalanceSheet2007Sgmt(Element BalanceSheet2007Sgmt, Map<String, Object> indvEntity) {
		BalanceSheet2007Sgmt.addElement("CurrencyFunds").setText((indvEntity.get("CURRENCY_FUNDS_07") != null
				? ChangeUtils.stringToFStr(indvEntity.get("CURRENCY_FUNDS_07").toString()) : ""));
		BalanceSheet2007Sgmt.addElement("FinancialAssetsHeldForTrading")
				.setText((indvEntity.get("FINANCIAL_ASSETS_HELD_FOR_TRAD") != null
						? ChangeUtils.stringToFStr(indvEntity.get("FINANCIAL_ASSETS_HELD_FOR_TRAD").toString()) : ""));
		BalanceSheet2007Sgmt.addElement("NotesReceivable").setText((indvEntity.get("NOTES_RECEIVABLE_07") != null
				? ChangeUtils.stringToFStr(indvEntity.get("NOTES_RECEIVABLE_07").toString()) : ""));
		BalanceSheet2007Sgmt.addElement("AccountsReceivable").setText((indvEntity.get("ACCOUNTS_RECEIVABLE_07") != null
				? ChangeUtils.stringToFStr(indvEntity.get("ACCOUNTS_RECEIVABLE_07").toString()) : ""));
		BalanceSheet2007Sgmt.addElement("Prepayments").setText((indvEntity.get("PREPAYMENTS_07") != null
				? ChangeUtils.stringToFStr(indvEntity.get("PREPAYMENTS_07").toString()) : ""));
		BalanceSheet2007Sgmt.addElement("InterestReceivable").setText((indvEntity.get("INTEREST_RECEIVABLE_07") != null
				? ChangeUtils.stringToFStr(indvEntity.get("INTEREST_RECEIVABLE_07").toString()) : ""));
		BalanceSheet2007Sgmt.addElement("DividendsReceivable").setText((indvEntity.get("DIVIDENDS_RECEIVABLE_07") != null
				? ChangeUtils.stringToFStr(indvEntity.get("DIVIDENDS_RECEIVABLE_07").toString()) : ""));
		BalanceSheet2007Sgmt.addElement("OtherReceivables").setText((indvEntity.get("OTHER_RECEIVABLES_07") != null
				? ChangeUtils.stringToFStr(indvEntity.get("OTHER_RECEIVABLES_07").toString()) : ""));
		BalanceSheet2007Sgmt.addElement("Inventories").setText((indvEntity.get("INVENTORIES_07") != null
				? ChangeUtils.stringToFStr(indvEntity.get("INVENTORIES_07").toString()) : ""));
		BalanceSheet2007Sgmt.addElement("CurrentPortionOfNonCurrentAssets")
				.setText((indvEntity.get("CURRENT_PORTION_OF_NON_CURRENT") != null
						? ChangeUtils.stringToFStr(indvEntity.get("CURRENT_PORTION_OF_NON_CURRENT").toString()) : ""));
		BalanceSheet2007Sgmt.addElement("OtherCurrentAssets").setText((indvEntity.get("OTHER_CURRENT_ASSETS_07") != null
				? ChangeUtils.stringToFStr(indvEntity.get("OTHER_CURRENT_ASSETS_07").toString()) : ""));
		BalanceSheet2007Sgmt.addElement("TotalCurrentAssets").setText((indvEntity.get("TOTAL_CURRENT_ASSETS_07") != null
				? ChangeUtils.stringToFStr(indvEntity.get("TOTAL_CURRENT_ASSETS_07").toString()) : ""));
		BalanceSheet2007Sgmt.addElement("FinancialAssetsAvailableForSale")
				.setText((indvEntity.get("FINANCIAL_ASSETS_AVAILABLE_FOR") != null
						? ChangeUtils.stringToFStr(indvEntity.get("FINANCIAL_ASSETS_AVAILABLE_FOR").toString()) : ""));
		BalanceSheet2007Sgmt.addElement("HeldToMaturityInvestments")
				.setText((indvEntity.get("HELD_TO_MATURITY_INVESTMENTS") != null
						? ChangeUtils.stringToFStr(indvEntity.get("HELD_TO_MATURITY_INVESTMENTS").toString()) : ""));
		BalanceSheet2007Sgmt.addElement("LongTermEquityInvestment")
				.setText((indvEntity.get("LONG_TERM_EQUITY_INVESTMENT_07") != null
						? ChangeUtils.stringToFStr(indvEntity.get("LONG_TERM_EQUITY_INVESTMENT_07").toString()) : ""));
		BalanceSheet2007Sgmt.addElement("LongTermReceivables").setText((indvEntity.get("LONG_TERM_RECEIVABLES") != null
				? ChangeUtils.stringToFStr(indvEntity.get("LONG_TERM_RECEIVABLES").toString()) : ""));
		BalanceSheet2007Sgmt.addElement("InvestmentProperties").setText((indvEntity.get("INVESTMENT_PROPERTIES") != null
				? ChangeUtils.stringToFStr(indvEntity.get("INVESTMENT_PROPERTIES").toString()) : ""));
		BalanceSheet2007Sgmt.addElement("FixedAssets").setText((indvEntity.get("FIXED_ASSETS") != null
				? ChangeUtils.stringToFStr(indvEntity.get("FIXED_ASSETS").toString()) : ""));
		BalanceSheet2007Sgmt.addElement("ConstructionInProgress")
				.setText((indvEntity.get("CONSTRUCTION_IN_PROGRESS") != null
						? ChangeUtils.stringToFStr(indvEntity.get("CONSTRUCTION_IN_PROGRESS").toString()) : ""));
		BalanceSheet2007Sgmt.addElement("ConstructionMaterials")
				.setText((indvEntity.get("CONSTRUCTION_MATERIALS_07") != null
						? ChangeUtils.stringToFStr(indvEntity.get("CONSTRUCTION_MATERIALS_07").toString()) : ""));
		BalanceSheet2007Sgmt.addElement("FixedAssetsPendingForDisposal")
				.setText((indvEntity.get("FIXED_ASSETS_PENDING_07") != null
						? ChangeUtils.stringToFStr(indvEntity.get("FIXED_ASSETS_PENDING_07").toString()) : ""));
		BalanceSheet2007Sgmt.addElement("NonCurrentBiologicalAssets")
				.setText((indvEntity.get("NON_CURRENT_BIOLOGICAL_ASSETS") != null
						? ChangeUtils.stringToFStr(indvEntity.get("NON_CURRENT_BIOLOGICAL_ASSETS").toString()) : ""));
		BalanceSheet2007Sgmt.addElement("OilAndGasAssets").setText((indvEntity.get("OIL_AND_GAS_ASSETS") != null
				? ChangeUtils.stringToFStr(indvEntity.get("OIL_AND_GAS_ASSETS").toString()) : ""));
		BalanceSheet2007Sgmt.addElement("IntangibleAssets").setText((indvEntity.get("INTANGIBLE_ASSETS_07") != null
				? ChangeUtils.stringToFStr(indvEntity.get("INTANGIBLE_ASSETS_07").toString()) : ""));
		BalanceSheet2007Sgmt.addElement("DevelopmentDisbursements")
				.setText((indvEntity.get("DEVELOPMENT_DISBURSEMENTS") != null
						? ChangeUtils.stringToFStr(indvEntity.get("DEVELOPMENT_DISBURSEMENTS").toString()) : ""));
		BalanceSheet2007Sgmt.addElement("Goodwill").setText((indvEntity.get("GOOD_WILL") != null
				? ChangeUtils.stringToFStr(indvEntity.get("GOOD_WILL").toString()) : ""));
		BalanceSheet2007Sgmt.addElement("LongTermDeferredExpenses")
				.setText((indvEntity.get("LONG_TERM_DEFERRED_EXPENSES") != null
						? ChangeUtils.stringToFStr(indvEntity.get("LONG_TERM_DEFERRED_EXPENSES").toString()) : ""));
		BalanceSheet2007Sgmt.addElement("DeferredTaxAssets").setText((indvEntity.get("DEFERRED_TAX_ASSETS") != null
				? ChangeUtils.stringToFStr(indvEntity.get("DEFERRED_TAX_ASSETS").toString()) : ""));
		BalanceSheet2007Sgmt.addElement("OtherNonCurrentAssets")
				.setText((indvEntity.get("OTHER_NON_CURRENT_ASSETS") != null
						? ChangeUtils.stringToFStr(indvEntity.get("OTHER_NON_CURRENT_ASSETS").toString()) : ""));
		BalanceSheet2007Sgmt.addElement("TotalNonCurrentAssets")
				.setText((indvEntity.get("TOTAL_NON_CURRENT_ASSETS") != null
						? ChangeUtils.stringToFStr(indvEntity.get("TOTAL_NON_CURRENT_ASSETS").toString()) : ""));
		BalanceSheet2007Sgmt.addElement("TotalAssets").setText((indvEntity.get("TOTAL_ASSETS_07") != null
				? ChangeUtils.stringToFStr(indvEntity.get("TOTAL_ASSETS_07").toString()) : ""));
		BalanceSheet2007Sgmt.addElement("ShortTermBorrowings").setText((indvEntity.get("SHORT_TERM_BORROWINGS_07") != null
				? ChangeUtils.stringToFStr(indvEntity.get("SHORT_TERM_BORROWINGS_07").toString()) : ""));
		BalanceSheet2007Sgmt.addElement("FinancialLiabilitiesHeldForTrading")
				.setText((indvEntity.get("FINANCIAL_LIABILITIES_HELD_FOR") != null
						? ChangeUtils.stringToFStr(indvEntity.get("FINANCIAL_LIABILITIES_HELD_FOR").toString()) : ""));
		BalanceSheet2007Sgmt.addElement("NotesPayable").setText((indvEntity.get("NOTES_PAYABLE_07") != null
				? ChangeUtils.stringToFStr(indvEntity.get("NOTES_PAYABLE_07").toString()) : ""));
		BalanceSheet2007Sgmt.addElement("AccountsPayable").setText((indvEntity.get("ACCOUNTS_PAYABLE_07") != null
				? ChangeUtils.stringToFStr(indvEntity.get("ACCOUNTS_PAYABLE_07").toString()) : ""));
		BalanceSheet2007Sgmt.addElement("ReceiptsInAdvance").setText((indvEntity.get("RECEIPTSIN_ADVANCE_07") != null
				? ChangeUtils.stringToFStr(indvEntity.get("RECEIPTSIN_ADVANCE_07").toString()) : ""));
		BalanceSheet2007Sgmt.addElement("InterestPayable").setText((indvEntity.get("INTEREST_PAYABLE") != null
				? ChangeUtils.stringToFStr(indvEntity.get("INTEREST_PAYABLE").toString()) : ""));
		BalanceSheet2007Sgmt.addElement("EmployeeBenefitsPayable")
				.setText((indvEntity.get("EMPLOYEE_BENEFITS_PAYABLE") != null
						? ChangeUtils.stringToFStr(indvEntity.get("EMPLOYEE_BENEFITS_PAYABLE").toString()) : ""));
		BalanceSheet2007Sgmt.addElement("TaxsPayable").setText((indvEntity.get("TAXS_PAYABLE") != null
				? ChangeUtils.stringToFStr(indvEntity.get("TAXS_PAYABLE").toString()) : ""));
		BalanceSheet2007Sgmt.addElement("DividendsPayable").setText((indvEntity.get("DIVIDENDS_PAYABLE") != null
				? ChangeUtils.stringToFStr(indvEntity.get("DIVIDENDS_PAYABLE").toString()) : ""));
		BalanceSheet2007Sgmt.addElement("OtherPayables").setText((indvEntity.get("OTHER_PAYABLES") != null
				? ChangeUtils.stringToFStr(indvEntity.get("OTHER_PAYABLES").toString()) : ""));
		BalanceSheet2007Sgmt.addElement("CurrentPortionOfLongTermLiabilities")
				.setText((indvEntity.get("CURRENT_PORTION_OF_LONG_TERM_L") != null
						? ChangeUtils.stringToFStr(indvEntity.get("CURRENT_PORTION_OF_LONG_TERM_L").toString()) : ""));
		BalanceSheet2007Sgmt.addElement("OtherCurrentLiabilities")
				.setText((indvEntity.get("OTHER_CURRENT_LIABILITIES_07") != null
						? ChangeUtils.stringToFStr(indvEntity.get("OTHER_CURRENT_LIABILITIES_07").toString()) : ""));
		BalanceSheet2007Sgmt.addElement("TotalCurrentLiabilities")
				.setText((indvEntity.get("TOTAL_CURRENT_LIABILITIES_07") != null
						? ChangeUtils.stringToFStr(indvEntity.get("TOTAL_CURRENT_LIABILITIES_07").toString()) : ""));
		BalanceSheet2007Sgmt.addElement("LongTermBorrowings").setText((indvEntity.get("LONG_TERM_BORROWINGS_07") != null
				? ChangeUtils.stringToFStr(indvEntity.get("LONG_TERM_BORROWINGS_07").toString()) : ""));
		BalanceSheet2007Sgmt.addElement("BondsPayables").setText((indvEntity.get("BONDS_PAYABLES") != null
				? ChangeUtils.stringToFStr(indvEntity.get("BONDS_PAYABLES").toString()) : ""));
		BalanceSheet2007Sgmt.addElement("LongTermPayables").setText((indvEntity.get("LONG_TERM_PAYABLES_07") != null
				? ChangeUtils.stringToFStr(indvEntity.get("LONG_TERM_PAYABLES_07").toString()) : ""));
		BalanceSheet2007Sgmt.addElement("GrantsPayable").setText((indvEntity.get("GRANTS_PAYABLE_07") != null
				? ChangeUtils.stringToFStr(indvEntity.get("GRANTS_PAYABLE_07").toString()) : ""));
		BalanceSheet2007Sgmt.addElement("Provisions").setText((indvEntity.get("PROVISIONS_07") != null
				? ChangeUtils.stringToFStr(indvEntity.get("PROVISIONS_07").toString()) : ""));
		BalanceSheet2007Sgmt.addElement("DeferredTaxLiabilities")
				.setText((indvEntity.get("DEFERRED_TAX_LIABILITIES") != null
						? ChangeUtils.stringToFStr(indvEntity.get("DEFERRED_TAX_LIABILITIES").toString()) : ""));
		BalanceSheet2007Sgmt.addElement("OtherNonCurrentLiabilities")
				.setText((indvEntity.get("OTHER_NON_CURRENT_LIABILITIES") != null
						? ChangeUtils.stringToFStr(indvEntity.get("OTHER_NON_CURRENT_LIABILITIES").toString()) : ""));
		BalanceSheet2007Sgmt.addElement("TotalNonCurrentLiabilities")
				.setText((indvEntity.get("TOTAL_NON_CURRENT_LIABILITIES") != null
						? ChangeUtils.stringToFStr(indvEntity.get("TOTAL_NON_CURRENT_LIABILITIES").toString()) : ""));
		BalanceSheet2007Sgmt.addElement("TotalLiabilities").setText((indvEntity.get("TOTAL_LIABILITIES") != null
				? ChangeUtils.stringToFStr(indvEntity.get("TOTAL_LIABILITIES").toString()) : ""));
		BalanceSheet2007Sgmt.addElement("PaidInCapitalOrShareCapital")
				.setText((indvEntity.get("PAIDIN_CAPITAL_OR_SHARE_CAPITA") != null
						? ChangeUtils.stringToFStr(indvEntity.get("PAIDIN_CAPITAL_OR_SHARE_CAPITA").toString()) : ""));
		BalanceSheet2007Sgmt.addElement("CapitalrRserve").setText((indvEntity.get("CAPITALR_RSERVE_07") != null
				? ChangeUtils.stringToFStr(indvEntity.get("CAPITALR_RSERVE_07").toString()) : ""));
		BalanceSheet2007Sgmt.addElement("LessTreasuryStocks").setText((indvEntity.get("LESS_TREASURY_STOCKS") != null
				? ChangeUtils.stringToFStr(indvEntity.get("LESS_TREASURY_STOCKS").toString()) : ""));
		BalanceSheet2007Sgmt.addElement("SurplusReserve").setText((indvEntity.get("SURPLUS_RESERVE_07") != null
				? ChangeUtils.stringToFStr(indvEntity.get("SURPLUS_RESERVE_07").toString()) : ""));
		BalanceSheet2007Sgmt.addElement("UnappropriatedProfit").setText((indvEntity.get("UNAPPROPRIATED_PROFIT_07") != null
				? ChangeUtils.stringToFStr(indvEntity.get("UNAPPROPRIATED_PROFIT_07").toString()) : ""));
		BalanceSheet2007Sgmt.addElement("TotalEquity").setText((indvEntity.get("TOTAL_EQUITY_07") != null
				? ChangeUtils.stringToFStr(indvEntity.get("TOTAL_EQUITY_07").toString()) : ""));
		BalanceSheet2007Sgmt.addElement("TotalEquityAndLiabilities")
				.setText((indvEntity.get("TOTAL_EQUITY_AND_LIABILITIE_07") != null
						? ChangeUtils.stringToFStr(indvEntity.get("TOTAL_EQUITY_AND_LIABILITIE_07").toString()) : ""));
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
