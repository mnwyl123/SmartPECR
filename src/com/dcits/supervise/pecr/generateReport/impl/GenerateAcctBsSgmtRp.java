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
 * 个人借贷信息报文生成
 * 
 * @author munan
 *
 */
public class GenerateAcctBsSgmtRp extends AbstractGenerateReport {

	private final static Logger logger = Logger.getLogger(GenerateAcctBsSgmtRp.class);

	public Properties properties;

	public ReportMessageManager reportMessageService;

	private String TABLE_NAME = "I_ACCT_BS";

	private String PACKET_KEY = "PBA_ACCT_BS_SGMT_ID";

	public GenerateAcctBsSgmtRp(Properties properties, ReportMessageManager reportMessageService) {
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
		reportCount.put("table_name", TABLE_NAME);
		reportCount.put("rpt_date", needReportDetail.getRptDate());
		reportCount.put("company", needReportDetail.getCompany());
		//信息记录类型
		reportCount.put("INF_REC_TYPE", PecrConstantUtil.ACCT_BS_SGMT);
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
		String CCRC_ORG_CODE = "";
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
			reportCount.put("INF_REC_TYPE", PecrConstantUtil.ACCT_BS_SGMT);
			//获取组织个人基本信息报文的数据
			List<Map<String, Object>> list = reportMessageService.queryAcctBsSgmtRpData(reportCount);
			
			// 存放报文名和对应数据ID的map
			List<String> paaid = new ArrayList<String>();
			List<Map<String,String>> pkColnumList = new ArrayList<Map<String,String>>();
			//这里斗胆利用了List集合的有序性
			for (int i = 0; i < list.size(); i++) {
				Map<String, Object> indvBsSgmtReportEntity = list.get(i);
				String pk = indvBsSgmtReportEntity.get("PBA_ACCT_BS_SGMT_ID").toString();
				//代表每一个主键在报文文件中的行数（报文头不算）
				//20210713,生成多个文件的时候 colnum 应该对每个文件的存储数量进行取余
				String colnum = String.valueOf(((i+1)+(f*pageSize)) % (pageSize*fileForNum));
				paaid.add(pk);
				Map<String,String> mapTmp = new HashMap<String,String>();
				mapTmp.put("pk", pk);
				mapTmp.put("colnum", colnum);
				pkColnumList.add(mapTmp);
			}
			
			
			// 获取其他标识字段数据（通过order by 字段paabssgmtid
			// 将相同的连续放在一起，其外获取每一种相同paabssgmtid的条数也返回到当前数据中 ）
			// 依据返回结果，将相同paabssgmtid的数据放入一个list中，在将paabssgmtid的值作为key形成一个map，方便其他标识段的生成和减少频繁数据库的访问
			//相关还款责任人信息段；抵质押物信息段；特殊交易说明段；均属于数量+子表字段
			List<Map<String, Object>> rltlist = reportMessageService.queryLoanRltSgmtRpMsgByFactor(paaid);
			Map<String, List<Map<String, Object>>> rltmap = new HashMap<String, List<Map<String, Object>>>();
			for (int i = 0; i < rltlist.size();) {
				int tempNum = Integer.parseInt((rltlist.get(i).get("NUM")).toString());
				String tempName = rltlist.get(i).get("PBA_ACCT_BS_SGMT_ID").toString();
				List<Map<String, Object>> s = new ArrayList<Map<String, Object>>();
				for (int j = i; j < (i + tempNum);) {
					s.add(rltlist.get(j));
					j++;
				}
				i = i + tempNum;
				rltmap.put(tempName, s);
			}
			List<Map<String, Object>> mcclist = reportMessageService.queryMccSgmtRpRpMsgByFactor(paaid);
			Map<String, List<Map<String, Object>>> mccmap = new HashMap<String, List<Map<String, Object>>>();
			for (int i = 0; i < mcclist.size();) {
				int tempNum = Integer.parseInt((mcclist.get(i).get("NUM")).toString());
				String tempName = mcclist.get(i).get("PBA_ACCT_BS_SGMT_ID").toString();
				List<Map<String, Object>> s = new ArrayList<Map<String, Object>>();
				for (int j = i; j < (i + tempNum);) {
					s.add(mcclist.get(j));
					j++;
				}
				i = i + tempNum;
				mccmap.put(tempName, s);
			}
			List<Map<String, Object>> speclist = reportMessageService.querySpecSgmtRpRpMsgByFactor(paaid);
			Map<String, List<Map<String, Object>>> specmap = new HashMap<String, List<Map<String, Object>>>();
			for (int i = 0; i < speclist.size();) {
				int tempNum = Integer.parseInt((speclist.get(i).get("NUM")).toString());
				String tempName = speclist.get(i).get("PBA_ACCT_BS_SGMT_ID").toString();
				List<Map<String, Object>> s = new ArrayList<Map<String, Object>>();
				for (int j = i; j < (i + tempNum);) {
					s.add(speclist.get(j));
					j++;
				}
				i = i + tempNum;
				specmap.put(tempName, s);
			}
			
			// 开始生成xml格式的报文内容
			StringBuffer sbf = new StringBuffer();
			// 一个报文一个报文头；对于其他信息（除基本信息外的），填写空值（即，两个空格）
			if(f%fileForNum == 0){
				sbf.append(generateRpHead(PecrConstantUtil.ACCT_BS_SGMT, numTotal[forTop++], "  "+CCRC_ORG_CODE));
				sbf.append("\r\n");
			}
			
			for (Map<String, Object> indvEntity : list) {
				Document document = DocumentHelper.createDocument();
				Element root = document.addElement("Document");
				Element InAcctInf = root.addElement("InAcctInf");
				/*** 个人借贷基本信息 --- 基础段 ****/
				Element AcctBsSgmt = InAcctInf.addElement("AcctBsSgmt");
				writeAcctBsSgmt(AcctBsSgmt, indvEntity);
				/*** 个人借贷基本信息 --- -基本信息记录-- ****/
				//报告时点说明代码和账户类型判断信息段是否不应该存在
				if ((indvEntity.get("RPT_DATE_CODE").toString().equals("40")
						&& indvEntity.get("ACCT_TYPE").toString().equals("R1"))
						|| (indvEntity.get("RPT_DATE_CODE").toString().equals("40")
								&& indvEntity.get("ACCT_TYPE").toString().equals("R2"))
						|| (indvEntity.get("RPT_DATE_CODE").toString().equals("40")
								&& indvEntity.get("ACCT_TYPE").toString().equals("R4"))
						|| (indvEntity.get("RPT_DATE_CODE").toString().equals("40")
								&& indvEntity.get("ACCT_TYPE").toString().equals("D1"))) {

				} else {
					if (indvEntity.get("BUSI_LINES") != null && !indvEntity.get("BUSI_LINES").toString().equals("")) {
						Element AcctBsInfSgmt = InAcctInf.addElement("AcctBsInfSgmt");
						writeAcctBsInfSgmt(AcctBsInfSgmt, indvEntity);
					}
				}

				/*** 个人借贷基本信息 --- -还款人段-- ****/
				if (rltmap.get(indvEntity.get("PBA_ACCT_BS_SGMT_ID").toString()) != null) {
					if ((indvEntity.get("RPT_DATE_CODE").toString().equals("40")
							&& indvEntity.get("ACCT_TYPE").toString().equals("R1"))
							|| (indvEntity.get("RPT_DATE_CODE").toString().equals("40")
									&& indvEntity.get("ACCT_TYPE").toString().equals("R2"))
							|| (indvEntity.get("RPT_DATE_CODE").toString().equals("40")
									&& indvEntity.get("ACCT_TYPE").toString().equals("R4"))
							|| (indvEntity.get("RPT_DATE_CODE").toString().equals("40")
									&& indvEntity.get("ACCT_TYPE").toString().equals("D1"))
							|| ((indvEntity.get("RPT_DATE_CODE").toString().equals("20") || "40".equals(indvEntity.get("RPT_DATE_CODE").toString()))
									&& indvEntity.get("ACCT_TYPE").toString().equals("C1"))) {

					} else {
						if (rltmap.get(indvEntity.get("PBA_ACCT_BS_SGMT_ID")) != null
								&& !"".equals(rltmap.get(indvEntity.get("PBA_ACCT_BS_SGMT_ID").toString()))) {
							Element RltRepymtInfSgm = InAcctInf.addElement("RltRepymtInfSgmt");
							writeRltSgmt(RltRepymtInfSgm, rltmap.get(indvEntity.get("PBA_ACCT_BS_SGMT_ID").toString()));
						}
					}

				}
				// 非C1账户才报送
				if (!indvEntity.get("ACCT_TYPE").toString().equals(PecrConstantUtil.ACCT_BS_SGMT_C1)) {
					/*** 个人借贷基本信息 --- -抵质押段-- ****/
					if (mccmap.get(indvEntity.get("PBA_ACCT_BS_SGMT_ID").toString()) != null) {
						if ((indvEntity.get("RPT_DATE_CODE").toString().equals("40")
								&& indvEntity.get("ACCT_TYPE").toString().equals("R1"))
								|| (indvEntity.get("RPT_DATE_CODE").toString().equals("40")
										&& indvEntity.get("ACCT_TYPE").toString().equals("R2"))
								|| (indvEntity.get("RPT_DATE_CODE").toString().equals("40")
										&& indvEntity.get("ACCT_TYPE").toString().equals("R4"))
								|| (indvEntity.get("RPT_DATE_CODE").toString().equals("40")
										&& indvEntity.get("ACCT_TYPE").toString().equals("D1"))) {
								
						} else {
							if (mccmap.get(indvEntity.get("PBA_ACCT_BS_SGMT_ID")) != null
									&& !"".equals(mccmap.get(indvEntity.get("PBA_ACCT_BS_SGMT_ID").toString()))) {
								Element MotgaCltalCtrctInfSgmt = InAcctInf.addElement("MotgaCltalCtrctInfSgmt");
								writeMccSgmt(MotgaCltalCtrctInfSgmt,
										mccmap.get(indvEntity.get("PBA_ACCT_BS_SGMT_ID").toString()));
							}
						}

					}
				/*** 个人借贷基本信息 --- -授信额度信息段-- ****/
					//此处没必要那么复杂，非要判断出什么情况下一定存在授信额度信息段。只需要排除一定不存在的即可
					if ((indvEntity.get("RPT_DATE_CODE").toString().equals("40")
							&& indvEntity.get("ACCT_TYPE").toString().equals("R1"))
							|| (indvEntity.get("RPT_DATE_CODE").toString().equals("40")
									&& indvEntity.get("ACCT_TYPE").toString().equals("R2"))
							|| (indvEntity.get("RPT_DATE_CODE").toString().equals("40")
									&& indvEntity.get("ACCT_TYPE").toString().equals("R4"))
							|| (indvEntity.get("RPT_DATE_CODE").toString().equals("40")
									&& indvEntity.get("ACCT_TYPE").toString().equals("D1"))){
						
					} else {
						if (indvEntity.get("MCC") != null && !indvEntity.get("MCC").toString().equals("")) {
							Element AcctCredSgmt = InAcctInf.addElement("AcctCredSgmt");
							writeAcctCredSgmt(AcctCredSgmt, indvEntity);
						}
					}
				}
				// C1账户才报送
				if (indvEntity.get("ACCT_TYPE").toString().equals(PecrConstantUtil.ACCT_BS_SGMT_C1)) {
					/*** 个人借贷基本信息 --- -初始债权信息段-- ****/
					// 李继坤
					if ((indvEntity.get("RPT_DATE_CODE").toString().equals("10"))) {
						Element OrigCreditorInfSgmt = InAcctInf.addElement("OrigCreditorInfSgmt");
						writeOrigCreditorInfSgmt(OrigCreditorInfSgmt, indvEntity);
					}
				}
				// 非C1账户才报送
				if (!indvEntity.get("ACCT_TYPE").toString().equals(PecrConstantUtil.ACCT_BS_SGMT_C1)) {

					/*** 个人借贷基本信息 --- -月度表现信息段--- ****/
					if ((indvEntity.get("RPT_DATE_CODE").toString().equals("40"))) {

					} else {
						Element AcctMthlyBlgInfSgmt = InAcctInf.addElement("AcctMthlyBlgInfSgmt");
						writeAcctMthlyBlgInfSgmt(AcctMthlyBlgInfSgmt, indvEntity);
					}

				}
				// R2账户才报送
				if (indvEntity.get("ACCT_TYPE").toString().equals(PecrConstantUtil.ACCT_BS_SGMT_R2)) {
					/*** 个人借贷基本信息 --- -大额段--- ****/
					if ((indvEntity.get("RPT_DATE_CODE").toString().equals("40"))) {

					} else {
						if (indvEntity.get("SPEC_LINE") != null && !indvEntity.get("SPEC_LINE").toString().equals("")) {
							Element SpecPrdSgmt = InAcctInf.addElement("SpecPrdSgmt");
							writeSpecPrdSgmt(SpecPrdSgmt, indvEntity);
						}

					}

				}
				/*** 个人借贷基本信息 --- -非月度段--- ****/
				if (indvEntity.get("ACCT_TYPE") != null && !indvEntity.get("ACCT_TYPE").toString().equals("R3")) {
					if ((indvEntity.get("RPT_DATE_CODE").toString().equals("10")
									&& indvEntity.get("ACCT_TYPE").toString().equals("C1"))
							|| (indvEntity.get("RPT_DATE_CODE").toString().equals("20")
									&& indvEntity.get("ACCT_TYPE").toString().equals("C1"))
							|| (indvEntity.get("RPT_DATE_CODE").toString().equals("40")
									&& indvEntity.get("ACCT_TYPE").toString().equals("C1"))
							|| (indvEntity.get("RPT_DATE_CODE").toString().equals("40")
									&& indvEntity.get("ACCT_TYPE").toString().equals("R4"))
							|| (indvEntity.get("RPT_DATE_CODE").toString().equals("40")
									&& indvEntity.get("ACCT_TYPE").toString().equals("R2"))
							|| (indvEntity.get("RPT_DATE_CODE").toString().equals("40")
									&& indvEntity.get("ACCT_TYPE").toString().equals("R1"))
							|| (indvEntity.get("RPT_DATE_CODE").toString().equals("40")
									&& indvEntity.get("ACCT_TYPE").toString().equals("D1"))) {
						Element AcctDbtInfSgmt = InAcctInf.addElement("AcctDbtInfSgmt");
						writeAcctDbtInfSgmt(AcctDbtInfSgmt, indvEntity);
					}
				}

				/*** 个人借贷基本信息 --- -特殊段-- ****/
				if (specmap != null) {
					if (specmap.get(indvEntity.get("PBA_ACCT_BS_SGMT_ID").toString()) != null) {
						if ((indvEntity.get("RPT_DATE_CODE").toString().equals("10")
										&& !indvEntity.get("ACCT_TYPE").toString().equals("C1"))
								|| (indvEntity.get("RPT_DATE_CODE").toString().equals("40")
										&& indvEntity.get("ACCT_TYPE").toString().equals("D1"))
								|| (indvEntity.get("RPT_DATE_CODE").toString().equals("40")
										&& indvEntity.get("ACCT_TYPE").toString().equals("R1"))
								|| (indvEntity.get("RPT_DATE_CODE").toString().equals("40")
										&& indvEntity.get("ACCT_TYPE").toString().equals("R2"))
								|| (indvEntity.get("RPT_DATE_CODE").toString().equals("40")
										&& indvEntity.get("ACCT_TYPE").toString().equals("R4"))) {
							
						} else {
							if (specmap.get(indvEntity.get("PBA_ACCT_BS_SGMT_ID")) != null
									&& !"".equals(specmap.get(indvEntity.get("PBA_ACCT_BS_SGMT_ID").toString()))) {
								Element AcctSpecTrstDspnSgmt = InAcctInf.addElement("AcctSpecTrstDspnSgmt");
								writeAcctSpecTrstDspnSgmt(AcctSpecTrstDspnSgmt,
										specmap.get(indvEntity.get("PBA_ACCT_BS_SGMT_ID").toString()));
							}
						}

					}
				}
				sbf.append(document.getRootElement().asXML());
				sbf.append("\r\n");
			}
			
			//组织报文名并插入报文内容
			if(f%fileForNum == 0){
				logger.info("开始获取流水号");
				Map<String,Object> serialNumMap = new HashMap<String,Object>();
				serialNumMap.put("inRefType", PecrConstantUtil.ACCT_BS_SGMT);
				serialNumMap.put("company", company);
				CreateSerialNumber instance = CreateSerialNumber.getInstance();
				instance.setReportMessageManager(reportMessageService);
				String reportNum = instance.getSerialNumb(serialNumMap);
				reportName = generateRpName(PecrConstantUtil.ACCT_BS_SGMT,reportNum, "0"+CCRC_ORG_CODE);
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
				rabme =  AbstractGenerateReport.generateRpMessage(rpt_date, rabme, PecrConstantUtil.ACCT_BS_SGMT, reportName, 
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
				reportMessageService.updateAcctBsSgmtRpDataStatus(conditionMap);
				break;
			case PecrConstantUtil.BUSINESS_STATUS_90:
				conditionMap.put("BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_90);
				conditionMap.put("OLD_BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_85);
				reportMessageService.updateAcctBsSgmtRpDataStatus(conditionMap);
				break;
			case PecrConstantUtil.BUSINESS_STATUS_50:
				conditionMap.put("BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_50);
				conditionMap.put("OLD_BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_90);
				reportMessageService.updateAcctBsSgmtRpDataStatus(conditionMap);
				break;
			default:
				break;
			}
		}
	}

	public static void writeAcctBsSgmt(Element AcctBsSgmt, Map<String, Object> indvEntity) {
		/*** 个人借贷基础信息记录 --- ***/
		AcctBsSgmt.addElement("InfRecType")
				.setText(indvEntity.get("INF_REC_TYPE") != null ? indvEntity.get("INF_REC_TYPE").toString() : "");
		AcctBsSgmt.addElement("AcctType")
				.setText(indvEntity.get("ACCT_TYPE") != null ? indvEntity.get("ACCT_TYPE").toString() : "");
		AcctBsSgmt.addElement("AcctCode")
				.setText(indvEntity.get("ACCT_CODE") != null ? indvEntity.get("ACCT_CODE").toString() : "");
		AcctBsSgmt.addElement("RptDate")
				.setText(indvEntity.get("RPT_DATE") != null ? indvEntity.get("RPT_DATE").toString() : "");
		AcctBsSgmt.addElement("RptDateCode")
				.setText(indvEntity.get("RPT_DATE_CODE") != null ? indvEntity.get("RPT_DATE_CODE").toString() : "");
		AcctBsSgmt.addElement("Name").setText(indvEntity.get("NAME") != null ? indvEntity.get("NAME").toString() : "");
		AcctBsSgmt.addElement("IDType")
				.setText(indvEntity.get("ID_TYPE") != null ? indvEntity.get("ID_TYPE").toString() : "");
		AcctBsSgmt.addElement("IDNum")
				.setText(indvEntity.get("ID_NUM") != null ? indvEntity.get("ID_NUM").toString() : "");
		AcctBsSgmt.addElement("MngmtOrgCode")
				.setText(indvEntity.get("MNGMT_ORG_CODE") != null ? indvEntity.get("MNGMT_ORG_CODE").toString() : "");
	}

	public static void writeAcctBsInfSgmt(Element AcctBsInfSgmt, Map<String, Object> indvEntity) {
		/*** 个人借贷基本信息记录 --- ***/
		AcctBsInfSgmt.addElement("BusiLines")
				.setText(indvEntity.get("BUSI_LINES") != null ? indvEntity.get("BUSI_LINES").toString() : "");
		AcctBsInfSgmt.addElement("BusiDtlLines")
				.setText(indvEntity.get("BUSI_DTL_LINES") != null ? indvEntity.get("BUSI_DTL_LINES").toString() : "");
		AcctBsInfSgmt.addElement("OpenDate")
				.setText(indvEntity.get("OPEN_DATE") != null ? indvEntity.get("OPEN_DATE").toString() : "");
		AcctBsInfSgmt.addElement("Cy").setText(indvEntity.get("CY") != null ? indvEntity.get("CY").toString() : "");
		
		if(indvEntity.get("ACCT_TYPE") != null && ("R1".equals(indvEntity.get("ACCT_TYPE").toString())
				|| "R2".equals(indvEntity.get("ACCT_TYPE").toString()) || "R3".equals(indvEntity.get("ACCT_TYPE").toString()))){
			AcctBsInfSgmt.addElement("AcctCredLine")
				.setText(indvEntity.get("ACCT_CRED_LINE") != null ? indvEntity.get("ACCT_CRED_LINE").toString() : "");
		}
		
		if(indvEntity.get("ACCT_TYPE") != null && ("D1".equals(indvEntity.get("ACCT_TYPE").toString())
				|| "R4".equals(indvEntity.get("ACCT_TYPE").toString()) || "C1".equals(indvEntity.get("ACCT_TYPE").toString()))){
			AcctBsInfSgmt.addElement("LoanAmt").setText(indvEntity.get("LOAN_AMT") != null ? indvEntity.get("LOAN_AMT").toString() : "");
		}

		if(indvEntity.get("ACCT_TYPE") != null && "D1".equals(indvEntity.get("ACCT_TYPE").toString())){
			AcctBsInfSgmt.addElement("Flag").setText(indvEntity.get("FLAG") != null ? indvEntity.get("FLAG").toString() : "");
		}

		if(indvEntity.get("ACCT_TYPE") != null && !"C1".equals(indvEntity.get("ACCT_TYPE").toString())){
			AcctBsInfSgmt.addElement("DueDate").setText(indvEntity.get("DUE_DATE") != null ? indvEntity.get("DUE_DATE").toString() : "");
		}

		if(indvEntity.get("ACCT_TYPE") != null && ("D1".equals(indvEntity.get("ACCT_TYPE").toString())
				|| "R1".equals(indvEntity.get("ACCT_TYPE").toString()) || "R4".equals(indvEntity.get("ACCT_TYPE").toString()))){
			AcctBsInfSgmt.addElement("RepayMode")
				.setText(indvEntity.get("REPAY_MODE") != null ? indvEntity.get("REPAY_MODE").toString() : "");
			AcctBsInfSgmt.addElement("RepayFreqcy")
				.setText(indvEntity.get("REPAY_FREQCY") != null ? indvEntity.get("REPAY_FREQCY").toString() : "");
		}

		if(indvEntity.get("ACCT_TYPE") != null && ("D1".equals(indvEntity.get("ACCT_TYPE").toString())
				|| "R4".equals(indvEntity.get("ACCT_TYPE").toString()))){
			AcctBsInfSgmt.addElement("RepayPrd").setText(indvEntity.get("REPAY_PRD") != null ? indvEntity.get("REPAY_PRD").toString() : "");
		}

		if(indvEntity.get("ACCT_TYPE") != null && !"C1".equals(indvEntity.get("ACCT_TYPE").toString())){
			AcctBsInfSgmt.addElement("ApplyBusiDist")
				.setText(indvEntity.get("APPLY_BUSI_DIST") != null ?indvEntity.get("APPLY_BUSI_DIST").toString() : "");
			AcctBsInfSgmt.addElement("GuarMode")
				.setText(indvEntity.get("GUAR_MODE") != null ? indvEntity.get("GUAR_MODE").toString() : "");
			AcctBsInfSgmt.addElement("OthRepyGuarWay")
				.setText(indvEntity.get("OTH_REPY_GUAR_WAY") != null ? indvEntity.get("OTH_REPY_GUAR_WAY").toString() : "");
			AcctBsInfSgmt.addElement("AssetTrandFlag")
			.setText(indvEntity.get("ASSET_TRAND_FLAG") != null ? indvEntity.get("ASSET_TRAND_FLAG").toString() : "");
			AcctBsInfSgmt.addElement("FundSou")
				.setText(indvEntity.get("FUND_SOU") != null ? indvEntity.get("FUND_SOU").toString() : "");
			AcctBsInfSgmt.addElement("LoanForm")
				.setText(indvEntity.get("LOAN_FORM") != null ? indvEntity.get("LOAN_FORM").toString() : "");
		}

		if(indvEntity.get("ACCT_TYPE") != null && ("R2".equals(indvEntity.get("ACCT_TYPE").toString())
				|| "R3".equals(indvEntity.get("ACCT_TYPE").toString()))){
			AcctBsInfSgmt.addElement("CreditID")
				.setText(indvEntity.get("CREDIT_ID") != null ? indvEntity.get("CREDIT_ID").toString() : "");
		}

		if (indvEntity.get("ACCT_TYPE") != null && "D1".equals(indvEntity.get("ACCT_TYPE").toString()) 
				&& indvEntity.get("BUSI_DTL_LINES") != null && "11".equals(indvEntity.get("BUSI_DTL_LINES").toString())) {
				AcctBsInfSgmt.addElement("LoanConCode")
					.setText(indvEntity.get("LOAN_CON_CODE") != null ? indvEntity.get("LOAN_CON_CODE").toString() : "");
				AcctBsInfSgmt.addElement("FirstHouLoanFlag")
					.setText(indvEntity.get("FIRST_HOU_LOAN_FLAG") != null ? indvEntity.get("FIRST_HOU_LOAN_FLAG").toString() : "");
		}

	}

	public static void writeAcctCredSgmt(Element AcctCredSgmt, Map<String, Object> indvEntity) {
		/*** 个人借贷授信额度信息记录 --- ***/
		AcctCredSgmt.addElement("Mcc").setText(indvEntity.get("MCC") != null ? indvEntity.get("MCC").toString() : "");
	}

	public static void writeOrigCreditorInfSgmt(Element OrigCreditorInfSgmt, Map<String, Object> indvEntity) {
		/*** 个人借贷初始债权信息记录 --- ***/
		OrigCreditorInfSgmt.addElement("InitCredName")
				.setText(indvEntity.get("INIT_CRED_NAME") != null ? indvEntity.get("INIT_CRED_NAME").toString() : "");
		OrigCreditorInfSgmt.addElement("InitCredOrgNm").setText(
				indvEntity.get("INIT_CRED_ORG_NM") != null ? indvEntity.get("INIT_CRED_ORG_NM").toString() : "");
		OrigCreditorInfSgmt.addElement("OrigDbtCate")
				.setText(indvEntity.get("ORIG_DBT_CATE") != null ? indvEntity.get("ORIG_DBT_CATE").toString() : "");
		OrigCreditorInfSgmt.addElement("InitRpySts")
				.setText(indvEntity.get("INIT_RPY_STS") != null ? indvEntity.get("INIT_RPY_STS").toString() : "");
	}

	public static void writeAcctMthlyBlgInfSgmt(Element AcctMthlyBlgInfSgmt, Map<String, Object> indvEntity) {
		/*** 个人借贷月度表现记录 --- ***/
		AcctMthlyBlgInfSgmt.addElement("Month")
				.setText(indvEntity.get("MONTH") != null ? indvEntity.get("MONTH").toString() : "");
		AcctMthlyBlgInfSgmt.addElement("SettDate")
				.setText(indvEntity.get("SETT_DATE") != null ? indvEntity.get("SETT_DATE").toString() : "");
		AcctMthlyBlgInfSgmt.addElement("AcctStatus")
				.setText(indvEntity.get("ACCT_STATUS") != null ? indvEntity.get("ACCT_STATUS").toString() : "");
		AcctMthlyBlgInfSgmt.addElement("AcctBal")
				.setText(indvEntity.get("ACCT_BAL") != null ? indvEntity.get("ACCT_BAL").toString() : "");
		
		if(indvEntity.get("ACCT_TYPE") != null && "R2".equals(indvEntity.get("ACCT_TYPE").toString())){
			AcctMthlyBlgInfSgmt.addElement("PridAcctBal")
			.setText(indvEntity.get("PRID_ACCT_BAL") != null ? indvEntity.get("PRID_ACCT_BAL").toString() : "");
			AcctMthlyBlgInfSgmt.addElement("UsedAmt")
			.setText(indvEntity.get("USED_AMT") != null ? indvEntity.get("USED_AMT").toString() : "");
			AcctMthlyBlgInfSgmt.addElement("NotIsuBal")
				.setText(indvEntity.get("NOT_ISU_BAL") != null ? indvEntity.get("NOT_ISU_BAL").toString() : "");
			
		}
		
		if(indvEntity.get("ACCT_TYPE") != null && !"R3".equals(indvEntity.get("ACCT_TYPE").toString())
				 && !"C1".equals(indvEntity.get("ACCT_TYPE").toString())){
			AcctMthlyBlgInfSgmt.addElement("RemRepPrd")
				.setText(indvEntity.get("REM_REP_PRD") != null ? indvEntity.get("REM_REP_PRD").toString() : "");
		}
		
		AcctMthlyBlgInfSgmt.addElement("FiveCate")
				.setText(indvEntity.get("FIVE_CATE") != null ? indvEntity.get("FIVE_CATE").toString() : "");
		AcctMthlyBlgInfSgmt.addElement("FiveCateAdjDate").setText(
				indvEntity.get("FIVE_CATE_ADJ_DATE") != null ? indvEntity.get("FIVE_CATE_ADJ_DATE").toString() : "");
		AcctMthlyBlgInfSgmt.addElement("RpyStatus")
				.setText(indvEntity.get("RPY_STATUS") != null ? indvEntity.get("RPY_STATUS").toString() : "");

		if(indvEntity.get("ACCT_TYPE") != null && "R2".equals(indvEntity.get("ACCT_TYPE").toString())){
			AcctMthlyBlgInfSgmt.addElement("RpyPrct")
				.setText(indvEntity.get("RPY_PRCT") != null ? indvEntity.get("RPY_PRCT").toString() : "");
		}
		
		if(indvEntity.get("ACCT_TYPE") != null && !"R3".equals(indvEntity.get("ACCT_TYPE").toString())
				 && !"C1".equals(indvEntity.get("ACCT_TYPE").toString())){
			AcctMthlyBlgInfSgmt.addElement("OverdPrd")
				.setText(indvEntity.get("OVERD_PRD") != null ? indvEntity.get("OVERD_PRD").toString() : "");
			AcctMthlyBlgInfSgmt.addElement("TotOverd")
				.setText(indvEntity.get("TOT_OVERD") != null ? indvEntity.get("TOT_OVERD").toString() : "");
		}
		
		if(indvEntity.get("ACCT_TYPE") != null && ("D1".equals(indvEntity.get("ACCT_TYPE").toString())
				 || "R1".equals(indvEntity.get("ACCT_TYPE").toString())
				 || "R4".equals(indvEntity.get("ACCT_TYPE").toString()))){
			AcctMthlyBlgInfSgmt.addElement("OverdPrinc")
				.setText(indvEntity.get("OVERD_PRINC") != null ? indvEntity.get("OVERD_PRINC").toString() : "");
			AcctMthlyBlgInfSgmt.addElement("Oved31_60Princ")
				.setText(indvEntity.get("OVED31_60_PRINC") != null ? indvEntity.get("OVED31_60_PRINC").toString() : "");
			AcctMthlyBlgInfSgmt.addElement("Oved61_90Princ")
				.setText(indvEntity.get("OVED61_90_PRINC") != null ? indvEntity.get("OVED61_90_PRINC").toString() : "");
			AcctMthlyBlgInfSgmt.addElement("Oved91_180Princ")
				.setText(indvEntity.get("OVED91_180_PRINC") != null ? indvEntity.get("OVED91_180_PRINC").toString() : "");
			AcctMthlyBlgInfSgmt.addElement("OvedPrinc180")
				.setText(indvEntity.get("OVED_PRINC180") != null ? indvEntity.get("OVED_PRINC180").toString() : "");
		}
		
		if(indvEntity.get("ACCT_TYPE") != null && "R3".equals(indvEntity.get("ACCT_TYPE").toString())){
			AcctMthlyBlgInfSgmt.addElement("OvedrawBaOve180")
				.setText(indvEntity.get("OVEDRAW_BA_OVE180") != null ? indvEntity.get("OVEDRAW_BA_OVE180").toString() : "");
		}
		
		if(indvEntity.get("ACCT_TYPE") != null && !"R3".equals(indvEntity.get("ACCT_TYPE").toString())
				 && !"C1".equals(indvEntity.get("ACCT_TYPE").toString())){
			AcctMthlyBlgInfSgmt.addElement("CurRpyAmt")
				.setText(indvEntity.get("CUR_RPY_AMT") != null ? indvEntity.get("CUR_RPY_AMT").toString() : "");
		}

		AcctMthlyBlgInfSgmt.addElement("ActRpyAmt")
				.setText(indvEntity.get("ACT_RPY_AMT") != null ? indvEntity.get("ACT_RPY_AMT").toString() : "");
		AcctMthlyBlgInfSgmt.addElement("LatRpyDate")
				.setText(indvEntity.get("LAT_RPY_DATE") != null ? indvEntity.get("LAT_RPY_DATE").toString() : "");
		AcctMthlyBlgInfSgmt.addElement("CloseDate")
				.setText(indvEntity.get("CLOSE_DATE") != null ? indvEntity.get("CLOSE_DATE").toString() : "");
	}

	public static void writeSpecPrdSgmt(Element SpecPrdSgmt, Map<String, Object> indvEntity) {
		/*** 个人借贷大额信息记录 --- ***/
		SpecPrdSgmt.addElement("SpecLine")
				.setText(indvEntity.get("SPEC_LINE") != null ? indvEntity.get("SPEC_LINE").toString() : "");
		SpecPrdSgmt.addElement("SpecEfctDate")
				.setText(indvEntity.get("SPEC_EFCT_DATE") != null ? indvEntity.get("SPEC_EFCT_DATE").toString() : "");
		SpecPrdSgmt.addElement("SpecEndDate")
				.setText(indvEntity.get("SPEC_END_DATE") != null ? indvEntity.get("SPEC_END_DATE").toString() : "");
		SpecPrdSgmt.addElement("UsedInstAmt")
				.setText(indvEntity.get("USED_INST_AMT") != null ? indvEntity.get("USED_INST_AMT").toString() : "");
	}

	public static void writeAcctDbtInfSgmt(Element AcctDbtInfSgmt, Map<String, Object> indvEntity) {
		/*** 个人借贷非月度信息记 --- ***/
		AcctDbtInfSgmt.addElement("AcctStatus").setText(
				indvEntity.get("NOMONTH_ACCT_STATUS") != null ? indvEntity.get("NOMONTH_ACCT_STATUS").toString() : "");
		AcctDbtInfSgmt.addElement("AcctBal").setText(
				indvEntity.get("NOMONTH_ACCT_BAL") != null ? indvEntity.get("NOMONTH_ACCT_BAL").toString() : "");
		
		if(indvEntity.get("ACCT_TYPE") != null && !"C1".equals(indvEntity.get("ACCT_TYPE").toString())){
			AcctDbtInfSgmt.addElement("FiveCate")
				.setText(indvEntity.get("NOMONTH_FIVE_CATE") != null ? indvEntity.get("NOMONTH_FIVE_CATE").toString() : "");
			AcctDbtInfSgmt.addElement("FiveCateAdjDate")
				.setText(indvEntity.get("NOMONTH_FIVE_CATE_ADJ_DATE") != null ? indvEntity.get("NOMONTH_FIVE_CATE_ADJ_DATE").toString() : "");
		}

		if(indvEntity.get("ACCT_TYPE") != null && !"C1".equals(indvEntity.get("ACCT_TYPE").toString())
				&& !"R3".equals(indvEntity.get("ACCT_TYPE").toString())){
			AcctDbtInfSgmt.addElement("RemRepPrd")
				.setText(indvEntity.get("NOMONTH_REM_REP_PRD") != null ? indvEntity.get("NOMONTH_REM_REP_PRD").toString() : "");
		}

		if(indvEntity.get("ACCT_TYPE") != null && !"C1".equals(indvEntity.get("ACCT_TYPE").toString())){
			AcctDbtInfSgmt.addElement("RpyStatus")
				.setText(indvEntity.get("NOMONTH_RPY_STATUS") != null ? indvEntity.get("NOMONTH_RPY_STATUS").toString() : "");
		}

		if(indvEntity.get("ACCT_TYPE") != null && !"C1".equals(indvEntity.get("ACCT_TYPE").toString())
				&& !"R3".equals(indvEntity.get("ACCT_TYPE").toString())){
			AcctDbtInfSgmt.addElement("OverdPrd")
				.setText(indvEntity.get("NOMONTH_OVERD_PRD") != null ? indvEntity.get("NOMONTH_OVERD_PRD").toString() : "");
			AcctDbtInfSgmt.addElement("TotOverd")
				.setText(indvEntity.get("NOMONTH_TOT_OVERD") != null ? indvEntity.get("NOMONTH_TOT_OVERD").toString() : "");
		}

		AcctDbtInfSgmt.addElement("LatRpyAmt").setText(
				indvEntity.get("NOMONTH_LAT_RPY_AMT") != null ? indvEntity.get("NOMONTH_LAT_RPY_AMT").toString() : "");
		AcctDbtInfSgmt.addElement("LatRpyDate").setText(
				indvEntity.get("NOMONTH_LAT_RPY_DATE") != null ? indvEntity.get("NOMONTH_LAT_RPY_DATE").toString() : "");
		AcctDbtInfSgmt.addElement("CloseDate").setText(
				indvEntity.get("NOMONTH_CLOSE_DATE") != null ? indvEntity.get("NOMONTH_CLOSE_DATE").toString() : "");
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
				RltRepymtInf.addElement("ArlpCertType")
						.setText(map.get("ARLP_CERT_TYPE") != null ? map.get("ARLP_CERT_TYPE").toString() : "");
				RltRepymtInf.addElement("ArlpCertNum")
						.setText(map.get("ARLP_CERT_NUM") != null ? map.get("ARLP_CERT_NUM").toString() : "");
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

	public static void writeMccSgmt(Element MotgaCltalCtrctInfSgmt, List<Map<String, Object>> borrower) {
		// 抵质押
		MotgaCltalCtrctInfSgmt.addElement("CcNm").setText(String.valueOf(borrower.size()));
		for (Map<String, Object> map : borrower) {
			if (map.get("CCC") != null && !map.get("CCC").toString().equals("")) {
				Element CccInf = MotgaCltalCtrctInfSgmt.addElement("CccInf");
				CccInf.addElement("Ccc").setText(map.get("CCC") != null ? map.get("CCC").toString() : "");
			}

		}
	}

	public static void writeAcctSpecTrstDspnSgmt(Element AcctSpecTrstDspnSgmt, List<Map<String, Object>> borrower) {
		// 特殊交易段
		AcctSpecTrstDspnSgmt.addElement("CagOfTrdNm").setText(String.valueOf(borrower.size()));
		for (Map<String, Object> map : borrower) {
			Element RltRepymtInf = AcctSpecTrstDspnSgmt.addElement("CagOfTrdInf");
			RltRepymtInf.addElement("ChanTranType")
					.setText(map.get("CHAN_TRAN_TYPE") != null ? map.get("CHAN_TRAN_TYPE").toString() : "");
			RltRepymtInf.addElement("TranDate")
					.setText(map.get("TRAN_DATE") != null ? map.get("TRAN_DATE").toString() : "");
			RltRepymtInf.addElement("TranAmt")
					.setText(map.get("TRAN_AMT") != null ? map.get("TRAN_AMT").toString() : "");
			RltRepymtInf.addElement("DueTranMon")
					.setText(map.get("DUE_TRAN_MON") != null ? map.get("DUE_TRAN_MON").toString() : "");
			RltRepymtInf.addElement("DetInfo")
					.setText(map.get("DET_INFO") != null ? map.get("DET_INFO").toString() : "");
		}
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
