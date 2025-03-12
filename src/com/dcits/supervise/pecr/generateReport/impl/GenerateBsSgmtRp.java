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
import com.dcits.supervise.pecr.generateReport.entity.IndvBsSgmtReportEntity;
import com.dcits.supervise.pecr.generateReport.entity.NeedReportDetail;
import com.dcits.supervise.pecr.generateReport.entity.ReportAndBackMessageEnt;
import com.dcits.supervise.pecr.generateReport.service.ReportMessageManager;
import com.dcits.supervise.pecr.util.CreateSerialNumber;
import com.dcits.supervise.pecr.util.FileUtil;
import com.dcits.supervise.pecr.util.PecrConstantUtil;

/**
 * 个人基本信息报文生成
 * 
 * @author munan
 *
 */
public class GenerateBsSgmtRp extends AbstractGenerateReport {

	private final static Logger logger = Logger.getLogger(GenerateBsSgmtRp.class);
	
	private String reportFilePath;

	public Properties properties;

	public ReportMessageManager reportMessageService;

	private static String TABLE_NAME = "I_BS";

	private static String PACKET_KEY = "PAA_BS_SGMT_ID";

	private int count = 0;

	private String CCRC_ORG_CODE = "";

	public GenerateBsSgmtRp(Properties properties, ReportMessageManager reportMessageService) {
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
		reportCount.put("INF_REC_TYPE", PecrConstantUtil.INDV_BS_SGMT);
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
			List<IndvBsSgmtReportEntity> list = null;

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
			reportCount.put("INF_REC_TYPE", PecrConstantUtil.INDV_BS_SGMT);
			//获取组织个人基本信息报文的数据
			list = reportMessageService.queryBsSgmtRpData(reportCount);
			
			// 存放报文名和对应数据ID的map
			List<String> paaid = new ArrayList<String>();
			List<Map<String,String>> pkColnumList = new ArrayList<Map<String,String>>();
			//这里斗胆利用了List集合的有序性
			for (int i = 0; i < list.size(); i++) {
				IndvBsSgmtReportEntity indvBsSgmtReportEntity = list.get(i);
				String pk = indvBsSgmtReportEntity.getPaaBsSmgtId();
				//代表每一个主键在报文文件中的行数（报文头不算）
				String colnum = String.valueOf(((i+1)+(f*pageSize)) % (pageSize*fileForNum));
				paaid.add(pk);
				Map<String,String> mapTmp = new HashMap<String,String>();
				mapTmp.put("pk", pk);
				mapTmp.put("colnum", colnum);
				pkColnumList.add(mapTmp);
			}
			// 获取其他标识字段数据
			//20201031:根据报文组成格式，个人基本信息其他信息表示段可能存在多个。
			//报送其他标识段时，其他标识段中应包含该客户的所有其他标识。 其他标识段是整体更新，即变化的标识与未变化的标识同时上报。
			//例如， 当新增一个标识，报送其他标识信息段时，其他标识段中除了新增的标识以外，还需要包含之前没发生变化的标识信息。
			//“姓名”、“证件类型”、“证件号码”三个数据项要一并出现，并且要和其他标识个数相对应。 
			//在获取信息更新日期时：多条记录存在的情况下需要进行比较获取最新日期。
			List<Map<String, Object>> idlist = reportMessageService.queryBsIDSgmtRpData(paaid);
			//放置其他表示段信息数据
			Map<String, List<Map<String, Object>>> map = new HashMap<String, List<Map<String, Object>>>();
			if(idlist != null){
				for (int i = 0; i < idlist.size();) {
					int tempNum = Integer.parseInt((idlist.get(i).get("NUM")).toString());
					String tempName = idlist.get(i).get("PAA_BS_SGMT_ID").toString();
					//每个PAA_BS_SGMT_ID或者说是一个客户对应的其他证件信息
					List<Map<String, Object>> s = new ArrayList<Map<String, Object>>();
					for (int j = i; j < (i + tempNum);) {
						s.add(idlist.get(j));
						j++;
					}
					i = i + tempNum;
					map.put(tempName, s);
				}
			}
			// 开始生成xml格式的报文内容
			StringBuffer sbf = new StringBuffer();
			
			// 一个报文一个报文头 韦宗英 update 44
			if(f%fileForNum == 0){
				String headStr = generateRpHead(PecrConstantUtil.INDV_BS_SGMT, numTotal[forTop++], "10" + CCRC_ORG_CODE);
				sbf.append(headStr);
				sbf.append("\r\n");
			}
			
			for (IndvBsSgmtReportEntity indvEntity : list) {
				Document document = DocumentHelper.createDocument();
				Element root = document.addElement("Document");
				Element InBasInf = root.addElement("InBasInf");
				/*** 个人基本信息 --- 基础段 ****/
				Element BsSgmt = InBasInf.addElement("BsSgmt");
				writeBsSgmt(BsSgmt, indvEntity);

				/*** 个人基本信息 --- -其他标识段-- ****/
				if (map.get(indvEntity.getPaaBsSmgtId()) != null) {
					Element IDSgmt = InBasInf.addElement("IDSgmt");
					writeIDSgmt(IDSgmt, map.get(indvEntity.getPaaBsSmgtId()));
				}

				/*** 个人基本信息 --- -基本概况段-- ****/
				if (indvEntity.getSex() != null && !indvEntity.getSex().toString().equals("")) {
					Element FcsInfSgmt = InBasInf.addElement("FcsInfSgmt");
					writeFcsInfSgmt(FcsInfSgmt, indvEntity);
				}

				/*** 个人基本信息 --- -婚姻信息段-- ****/
				if (indvEntity.getMariStatus() != null && !indvEntity.getMariStatus().toString().equals("")) {
					Element SpsInfSgmt = InBasInf.addElement("SpsInfSgmt");
					writeSpsInfSgmt(SpsInfSgmt, indvEntity);
				}

				/*** 个人基本信息 --- -教育信息段-- ****/
				if (indvEntity.getEduLevel() != null && !indvEntity.getEduLevel().toString().equals("")) {
					Element EduInfSgmt = InBasInf.addElement("EduInfSgmt");
					writeEduInfSgmt(EduInfSgmt, indvEntity);
				}

				/*** 个人基本信息 --- -职业信息段--- ****/
				if (indvEntity.getEmpStatus() != null && !indvEntity.getEmpStatus().toString().equals("")) {
					Element OctpnInfSgmt = InBasInf.addElement("OctpnInfSgmt");
					writeOctpnInfSgmt(OctpnInfSgmt, indvEntity);
				}

				/*** 个人基本信息 --- -居住地址段--- ****/
				if (indvEntity.getResiStatus() != null && !indvEntity.getResiStatus().toString().equals("")) {
					Element RedncInfSgmt = InBasInf.addElement("RedncInfSgmt");
					writeRedncInfSgmt(RedncInfSgmt, indvEntity);
				}

				/*** 个人基本信息 --- -通讯地址段--- ****/
				if (indvEntity.getMailAddr() != null && !indvEntity.getMailAddr().toString().equals("")) {
					Element MlgInfSgmt = InBasInf.addElement("MlgInfSgmt");
					writeMlgInfSgmt(MlgInfSgmt, indvEntity);
				}

				/*** 个人基本信息 --- -收入信息段--- ****/
				/*if (indvEntity.getAnnlInc()!= null && !indvEntity.getAnnlInc().toString().equals("")) {
					// 穆楠 收入信息段作为预留信息段，暂不需要报送。
					Element IncInfSgmt = InBasInf.addElement("IncInfSgmt");
					writeIncInfSgmt(IncInfSgmt, indvEntity);
				}*/
				// 每条记录需要换行System.getProperty("line.separator") 当前系统换行标识符
				sbf.append(document.getRootElement().asXML());
				sbf.append("\r\n");
			}
			
			//组织报文名并插入报文内容
			if(f%fileForNum == 0){
				logger.info("开始获取流水号");
				Map<String,Object> serialNumMap = new HashMap<String,Object>();
				serialNumMap.put("inRefType", PecrConstantUtil.INDV_BS_SGMT);
				serialNumMap.put("company", company);
				CreateSerialNumber instance = CreateSerialNumber.getInstance();
				instance.setReportMessageManager(reportMessageService);
				String reportNum = instance.getSerialNumb(serialNumMap);
				reportName = generateRpName(PecrConstantUtil.INDV_BS_SGMT,reportNum, "0"+CCRC_ORG_CODE);
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
			//开始为每条记录插入报文名称
			insertReportNameAndColnumForData(rpmap);
			rpmap.clear();
			logger.info("已完成为每条记录插入报文名称以及在报文中的行数");
			
			//把90状态更新为50
			//此处弃用，把修改状态和插入报文信息放在一起进行修改
			logger.info("开始更新数据信息");
			//needReportDetail.setBusinessState(PecrConstantUtil.BUSINESS_STATUS_50);
			//updateBusinessState(needReportDetail);
			logger.info("更新数据信息完成");

			// 韦宗英  总数追加
			toalNum +=list.size();
			
			//韦宗英    生成一条报文并且开线程处理预处理
			// (f+1)%fileForNum == 0 之所以这么写是因为 f 是从 0 开始的 ；f==(forNum-1) 代表最后一个循环
			if((f+1)%fileForNum == 0||f==(forNum-1)){
				logger.info("写入报文执行完成");
				// 组织插入对象
				ReportAndBackMessageEnt rabme = new ReportAndBackMessageEnt();
				String rpt_date = needReportDetail.getRptDate().get(0).toString();
				rabme =  AbstractGenerateReport.generateRpMessage(rpt_date, rabme, PecrConstantUtil.INDV_BS_SGMT, reportName, 
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
		logger.info("XML格式BODY内容生成执行完成-----------wzy  个人基本信息生成完毕");
		return reportMap;
	}


	public void writeBsSgmt(Element BsSgmt, IndvBsSgmtReportEntity borrower) {
		BsSgmt.addElement("InfRecType")
				.setText(borrower.getInfRecType() != null ? borrower.getInfRecType().toString() : "");
		BsSgmt.addElement("Name").setText(borrower.getName() != null ? borrower.getName().toString() : "");
		BsSgmt.addElement("IDType").setText(borrower.getIDType() != null ? borrower.getIDType().toString() : "");
		BsSgmt.addElement("IDNum").setText(borrower.getIDNum() != null ? borrower.getIDNum().toString() : "");
		//String InfSurcCode = borrower.getInfSurcCode() + borrower.getInfSurcCode();
		String InfSurcCode = borrower.getInfSurcCode();
		BsSgmt.addElement("InfSurcCode").setText(InfSurcCode != null ? InfSurcCode.toString() : "");
		BsSgmt.addElement("RptDate").setText(borrower.getRptDate() != null ? borrower.getRptDate().toString() : "");
		BsSgmt.addElement("RptDateCode")
				.setText(borrower.getRptDateCode() != null ? borrower.getRptDateCode().toString() : "");
		BsSgmt.addElement("Cimoc").setText(borrower.getCimoc() != null ? borrower.getCimoc().toString() : "");
		BsSgmt.addElement("CustomerType")
				.setText(borrower.getCustomerType() != null ? borrower.getCustomerType().toString() : "");
	}

	public void writeIDSgmt(Element IDSgmt, List<Map<String, Object>> borrower) {
		// 现在没有相关字段信息 暂时保留
		IDSgmt.addElement("IDNm").setText(String.valueOf(borrower.size()));
		for (Map<String, Object> map : borrower) {
			Element IDRec = IDSgmt.addElement("IDRec");
			IDRec.addElement("Alias").setText(map.get("ALIAS").toString() != null ? map.get("ALIAS").toString() : "");
			IDRec.addElement("OthIDType")
					.setText(map.get("OTH_ID_TYPE").toString() != null ? map.get("OTH_ID_TYPE").toString() : "");
			IDRec.addElement("OthIDNum")
					.setText(map.get("OTH_ID_NUM").toString() != null ? map.get("OTH_ID_NUM").toString() : "");
		}
		IDSgmt.addElement("IDInfoUpDate").setText(borrower.get(0).get("ID_INFO_UP_DATE").toString() != null
				? borrower.get(0).get("ID_INFO_UP_DATE").toString() : "");
	}

	public void writeFcsInfSgmt(Element FcsInfSgmt, IndvBsSgmtReportEntity borrower) {
		FcsInfSgmt.addElement("Sex").setText(borrower.getSex() != null ? borrower.getSex().toString() : "");
		FcsInfSgmt.addElement("DOB").setText(borrower.getDOB() != null ? borrower.getDOB().toString() : "");
		FcsInfSgmt.addElement("Nation").setText(borrower.getNation() != null ? borrower.getNation().toString() : "");
		FcsInfSgmt.addElement("HouseAdd")
				.setText(borrower.getHouseAdd() != null ? borrower.getHouseAdd().toString() : "");
		FcsInfSgmt.addElement("HhDist").setText(borrower.getHhDist() != null ? borrower.getHhDist().toString() : "");
		FcsInfSgmt.addElement("CellPhone")
				.setText(borrower.getCellPhone() != null ? borrower.getCellPhone().toString() : "");
		FcsInfSgmt.addElement("Email").setText(borrower.getEmail() != null ? borrower.getEmail().toString() : "");
		FcsInfSgmt.addElement("FcsInfoUpDate")
				.setText(borrower.getFcsInfoUpDate() != null ? borrower.getFcsInfoUpDate().toString() : "");
	}

	public void writeSpsInfSgmt(Element SpsInfSgmt, IndvBsSgmtReportEntity borrower) {

		SpsInfSgmt.addElement("MariStatus")
				.setText(borrower.getMariStatus() != null ? borrower.getMariStatus().toString() : "");

		if(borrower.getMariStatus() != null 
				&& ("20".equals(borrower.getMariStatus().toString()) 
						 || "21".equals(borrower.getMariStatus().toString())
						 || "22".equals(borrower.getMariStatus().toString())
						 || "23".equals(borrower.getMariStatus().toString())
						)){
			SpsInfSgmt.addElement("SpoName").setText(borrower.getSpoName() != null ? borrower.getSpoName().toString() : "");
			SpsInfSgmt.addElement("SpoIDType").setText(borrower.getSpoIDType() != null ? borrower.getSpoIDType().toString() : "");
			SpsInfSgmt.addElement("SpoIDNum").setText(borrower.getSpoIDNum() != null ? borrower.getSpoIDNum().toString() : "");
			SpsInfSgmt.addElement("SpoTel").setText(borrower.getSpoTel() != null ? borrower.getSpoTel().toString() : "");
			SpsInfSgmt.addElement("SpsCmpyNm").setText(borrower.getSpsCmpyNm() != null ? borrower.getSpsCmpyNm().toString() : "");
		};

		SpsInfSgmt.addElement("SpsInfoUpDate")
				.setText(borrower.getSpsInfoUpDate() != null ? borrower.getSpsInfoUpDate().toString() : "");
	}

	public void writeEduInfSgmt(Element EduInfSgmt, IndvBsSgmtReportEntity borrower) {
		EduInfSgmt.addElement("EduLevel")
				.setText(borrower.getEduLevel() != null ? borrower.getEduLevel().toString() : "");
		EduInfSgmt.addElement("AcaDegree")
				.setText(borrower.getAcaDegree() != null ? borrower.getAcaDegree().toString() : "");
		EduInfSgmt.addElement("EduInfoUpDate")
				.setText(borrower.getEduInfoUpDate() != null ? borrower.getEduInfoUpDate().toString() : "");
	}

	// 就业信息段
	public void writeOctpnInfSgmt(Element OctpnInfSgmt, IndvBsSgmtReportEntity borrower) {
		OctpnInfSgmt.addElement("EmpStatus")
				.setText(borrower.getEmpStatus() != null ? borrower.getEmpStatus().toString() : "");
		
		if(borrower.getEmpStatus() != null 
				&& ("11".equals(borrower.getEmpStatus().toString()) 
						 || "13".equals(borrower.getEmpStatus().toString())
						 || "17".equals(borrower.getEmpStatus().toString())
						 || "21".equals(borrower.getEmpStatus().toString())
						 || "24".equals(borrower.getEmpStatus().toString())
						 || "91".equals(borrower.getEmpStatus().toString())
						)){
			OctpnInfSgmt.addElement("CpnName").setText(borrower.getCpnName() != null ? borrower.getCpnName().toString() : "");
			OctpnInfSgmt.addElement("CpnType").setText(borrower.getCpnType() != null ? borrower.getCpnType().toString() : "");
			OctpnInfSgmt.addElement("Industry").setText(borrower.getIndustry() != null ? borrower.getIndustry().toString() : "");
			OctpnInfSgmt.addElement("CpnAddr").setText(borrower.getCpnAddr() != null ? borrower.getCpnAddr().toString() : "");
			OctpnInfSgmt.addElement("CpnPc").setText(borrower.getCpnPc() != null ? borrower.getCpnPc().toString() : "");
			OctpnInfSgmt.addElement("CpnDist").setText(borrower.getCpnDist() != null ? borrower.getCpnDist().toString() : "");
			OctpnInfSgmt.addElement("CpnTEL").setText(borrower.getCpnTEL() != null ? borrower.getCpnTEL().toString() : "");
			OctpnInfSgmt.addElement("Occupation").setText(borrower.getOccupation() != null ? borrower.getOccupation().toString() : "");
			OctpnInfSgmt.addElement("Title").setText(borrower.getTitle() != null ? borrower.getTitle().toString() : "");
			OctpnInfSgmt.addElement("TechTitle").setText(borrower.getTechTitle() != null ? borrower.getTechTitle().toString() : "");
			OctpnInfSgmt.addElement("WorkStartDate").setText(borrower.getWorkStartDate() != null ? borrower.getWorkStartDate().toString() : "");
		}
		OctpnInfSgmt.addElement("OctpnInfoUpDate")
				.setText(borrower.getOctpnInfoUpDate() != null ? borrower.getOctpnInfoUpDate().toString() : "");
	}

	public void writeRedncInfSgmt(Element RedncInfSgmt, IndvBsSgmtReportEntity borrower) {
		RedncInfSgmt.addElement("ResiStatus")
				.setText(borrower.getResiStatus() != null ? borrower.getResiStatus().toString() : "");
		RedncInfSgmt.addElement("ResiAddr")
				.setText(borrower.getResiAddr() != null ? borrower.getResiAddr().toString() : "");
		RedncInfSgmt.addElement("ResiPc").setText(borrower.getResiPc() != null ? borrower.getResiPc().toString() : "");
		RedncInfSgmt.addElement("ResiDist")
				.setText(borrower.getResiDist() != null ? borrower.getResiDist().toString() : "");
		RedncInfSgmt.addElement("HomeTel")
				.setText(borrower.getHomeTel() != null ? borrower.getHomeTel().toString() : "");
		RedncInfSgmt.addElement("ResiInfoUpDate")
				.setText(borrower.getResiInfoUpDate() != null ? borrower.getResiInfoUpDate().toString() : "");
	}

	public void writeMlgInfSgmt(Element MlgInfSgmt, IndvBsSgmtReportEntity borrower) {
		MlgInfSgmt.addElement("MailAddr")
				.setText(borrower.getMailAddr() != null ? borrower.getMailAddr().toString() : "");
		MlgInfSgmt.addElement("MailPc").setText(borrower.getMailPc() != null ? borrower.getMailPc().toString() : "");
		MlgInfSgmt.addElement("MailDist")
				.setText(borrower.getMailDist() != null ? borrower.getMailDist().toString() : "");
		MlgInfSgmt.addElement("MlgInfoUpDate")
				.setText(borrower.getMlgInfoUpDate() != null ? borrower.getMlgInfoUpDate().toString() : "");
	}

	public void writeIncInfSgmt(Element IncInfSgmt, IndvBsSgmtReportEntity borrower) {
		IncInfSgmt.addElement("AnnlInc").setText(borrower.getAnnlInc() != null ? borrower.getAnnlInc().toString() : "");
		IncInfSgmt.addElement("TaxIncome")
				.setText(borrower.getTaxIncome() != null ? borrower.getTaxIncome().toString() : "");
		IncInfSgmt.addElement("IncInfoUpDate")
				.setText(borrower.getIncInfoUpDate() != null ? borrower.getIncInfoUpDate().toString() : "");
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
	
	
	@Transactional
    public void updateBusinessState(NeedReportDetail needReportDetail) throws Exception{
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
				reportMessageService.updateBsSgmtRpDataStatus(conditionMap);
				break;
			case PecrConstantUtil.BUSINESS_STATUS_90:
				conditionMap.put("BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_90);
				conditionMap.put("OLD_BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_85);
				reportMessageService.updateBsSgmtRpDataStatus(conditionMap);
				break;
			case PecrConstantUtil.BUSINESS_STATUS_50:
				conditionMap.put("BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_50);
				conditionMap.put("OLD_BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_90);
				reportMessageService.updateBsSgmtRpDataStatus(conditionMap);
				break;
			default:
				break;
			}
		}
    }

	@Override
	public void insertReportNameForData(Map<String, List<String>> map) throws Exception {
		
	}
}
