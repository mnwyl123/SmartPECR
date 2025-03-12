package com.dcits.supervise.pecr.generateReport.impl;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

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
import com.dcits.supervise.pecr.util.PecrConstantUtil;
import com.dcits.supervise.pecr.util.SplitListUtil;

/**
 * 个人证件整合信息记录 生成报文
 * 
 * @author munan
 *
 */ 
public class GenerateInCtfItgInfRp extends AbstractGenerateReport {

	private final static Logger logger = Logger.getLogger(GenerateInCtfItgInfRp.class);

	private static String fileName;
	
	public Properties properties;

	public ReportMessageManager reportMessageService;

	private String table_name = "";

	private String PACKET_KEY = "";

	public GenerateInCtfItgInfRp(Properties properties, ReportMessageManager reportMessageService) {
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
		//ExecutorService fiExecutorService = new ThreadPoolExecutor(Integer.parseInt(properties.getProperty("threadNum")), Integer.parseInt(properties.getProperty("threadNum")), 0L, TimeUnit.MILLISECONDS, new ArrayBlockingQueue<>(1000000));
		Properties properties2 = PropertiesLoaderUtils.loadAllProperties("serverThread.properties");
		//properties2 = PropertiesLoaderUtils.loadAllProperties("serverThread.properties");
		int i2 = Integer.parseInt(properties2.get("threadNum").toString());
		//韦宗英  add 11
		int fileForNum = Integer.parseInt(properties2.get("fileForNum").toString());
		
		ExecutorService fiExecutorService = new ThreadPoolExecutor(i2, i2, 0L, TimeUnit.MILLISECONDS,
				new ArrayBlockingQueue<>(500));
		Map<String, Object> reportMap = new HashMap<>();
		logger.info("XML格式BODY内容生成执行开始");
		/**
		 * 1:查询条数，拆分10000条数据为一次生成报文的内容 2：for循环(拆分的次数){ （1）生成一个stringBuffer
		 * （2）组装插入生成报文管理表的数据 }，
		 */
		List<Map<String, StringBuffer>> sbList = new ArrayList<>();
		// 最大每页数据条数
		int pageSize = Integer.parseInt(properties.getProperty("saveMaxDataNumb"))+1;
		/***** 记录数 *****/
		Map<String, Object> reportCount = new HashMap<>();
		table_name = "I_IN_CTF_ITG_INF";
		PACKET_KEY = "PAL_IN_CTF_ITG_INF_ID";
		// 穆楠 获得生成报文名所需的区构码
		Map<String, Object> ccrcOrgCode = new HashMap<>();
		String CCRC_ORG_CODE = "";
		ccrcOrgCode.put("company", needReportDetail.getCompany());
		CCRC_ORG_CODE = reportMessageService.getCcrcOrgCode(ccrcOrgCode);
		// 获取要生成的报文总条数
		reportCount.put("table_name", table_name);
		reportCount.put("rpt_date", needReportDetail.getRptDate());
		int count = reportMessageService.getReportCount(reportCount);
		if (count == 0) {
			logger.info("没有符合条件的数据");
			reportMap.put("error", "没有符合条件的数据");
			return reportMap;
		}

		// 1........... add
		needReportDetail.setRownum(pageSize);
		List<ReportAndBackMessageEnt> listRpMEnt = new ArrayList<ReportAndBackMessageEnt>();
		
		//韦宗英 add 33
		int forNum = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		//韦宗英  add   3千为一个文件
		int num = forNum/fileForNum+(forNum%fileForNum == 0 ? 0 : 1);
		//韦宗英  forTop 1
		int[] numTotal = new int[num];
		if(num !=1){
			
			for(int i = 0;i<(forNum/fileForNum);i++){
				numTotal[i]=fileForNum*(pageSize-1);
			}
			if((forNum%fileForNum == 0 ? 0 : 1)==1){      
				numTotal[forNum/fileForNum]=count-(forNum/fileForNum)*((pageSize-1)*fileForNum);
			}
		}else{
			numTotal[0] = count;
		}
		int forTop = 0;
		int numAdd = 1;
		int numAdd2 = 0;
		int toalNum=0;
		
		Map<String, List<String>> rpmap = new HashMap<>();
		for (int f = 0; f < count / pageSize + (count % pageSize == 0 ? 0 : 1); f++) {
			List<Map<String, Object>> list = null;
			// 更新状态为“生成中”
			needReportDetail.setBusinessState(PecrConstantUtil.BUSINESS_STATUS_90);
			updateBusinessState(needReportDetail);

			reportCount.clear();
			reportCount.put("RptDate", needReportDetail.getRptDate());
			reportCount.put("pageSize", pageSize);
			reportCount.put("pk", needReportDetail.getSpecialObj());
			list = reportMessageService.queryInCtfItgRpData(reportCount);
			// List<Map<String, Object>> list =
			// reportMessageService.queryInCtfItgRpData(needReportDetail.getRptDate());
			// if(list.size()==0){
			// logger.info("没有符合条件的数据");
			// reportMap.put("error", "没有符合条件的数据");
			// return reportMap;
			// }
			// table_name = "pecr_indv_in_ctf_itg_inf";
			// PACKET_KEY = "PAL_IN_CTF_ITG_INF_ID";
			// // 更新状态为“生成中”
			// needReportDetail.setBusinessState(PecrConstantUtil.BUSINESS_STATUS_90);
			// updateBusinessState(needReportDetail);
			// //通过限定每页数据的条数将获取的数据分段
			// List<List<Map<String, Object>>> lists =
			// SplitListUtil.splitListMap(list, pageSize);
			// List<ReportAndBackMessageEnt> listRpMEnt = new
			// ArrayList<ReportAndBackMessageEnt>();
			// // 存放报文名和对应数据ID的map
			// Map<String, List<String>> rpmap = new HashMap<>();
			// for (List<Map<String, Object>> list2 : lists) {
			// buffer内容，文件名
			Map<String, StringBuffer> tempSb = new HashMap<>(5);
			List<String> pdaid = new ArrayList<>();
			for (Map<String, Object> entity : list) {
				pdaid.add(entity.get("PAL_IN_CTF_ITG_INF_ID").toString());
			}
			// 开始生成xml格式的报文内容
			StringBuffer sbf = new StringBuffer();
			// 一个报文一个报文头
			// sbf.append(XML_HEAD);
			// sbf.append(System.getProperty("line.separator"));
			if(f%fileForNum == 0){
				sbf.append(generateRpHead(PecrConstantUtil.IN_CTF_ITG_INF, String.valueOf(numTotal[forTop++]), "  "+CCRC_ORG_CODE));
				sbf.append("\r\n");
			}
			//sbf.append(System.getProperty("line.separator"));
			for (Map<String, Object> Entity : list) {
				Document document = DocumentHelper.createDocument();
				Element root = document.addElement("Document");
				Element InCtfItgInf = root.addElement("InCtfItgInf");
				writeInCtfItgInf(InCtfItgInf, Entity);
				// 每条记录需要换行System.getProperty("line.separator") 当前系统换行标识符
				sbf.append(document.getRootElement().asXML());
				sbf.append("\r\n");
				//sbf.append(System.getProperty("line.separator"));
			}
			if(f%fileForNum == 0){
				/**
				 * 1:组织报文头等相关信息插入报文
				 */
				/**
				 * 2:组织相关报文信息插入数据库中（全部生成报文后） 3:更新数据字段(全部前边操作完后，利用rptDate整体全部更新数据)
				 * 假设每for循环一个报文插入一个报文信息，那么会一直拥有报文信息表的锁，这样会阻塞其他进程访问。
				 * (否则在Transactional的代码中，只有执行完了才会提交事务，在这个期间会持续拥有已获取表锁的锁，阻塞其他进程写入已锁的表)
				 */
				// 报文名称
				logger.info("开始获取流水号");
				reportName = generateRpName(PecrConstantUtil.IN_CTF_ITG_INF,
						CreateSerialNumber.getInstance().getSerialNumb(PecrConstantUtil.IN_CTF_ITG_INF), "0"+CCRC_ORG_CODE);
				if (reportName == null || reportName == "") {
					logger.info("获取流水号异常");
					reportMap.put("error", "获取流水号异常");
					return reportMap;
				}
				//获取根路径
				String saveCreateReportPath = properties.getProperty("saveCreateReportPath");
				//把数据写入文件
				this.writeTOFile(sbf, saveCreateReportPath, reportName);
				
			}else{
				//把数据追加写入文件
				this.writeTOFile(sbf);
			}
			
			
			
			
			/*
			 * 源代码
			 * listRpMEnt.add(AbstractGenerateReport.generateRpMessage(rabme,
			 * PecrConstantUtil.IN_CTF_ITG_INF, reportName,
			 * Float.intBitsToFloat(list.size()),
			 * properties.getProperty("saveCreateReportPath")));
			 */
			
			rpmap.put(reportName, pdaid);
			// 4 复制
			// 生成报文
			//generateFile(sbf, reportName);
			logger.info("已完成为每条记录插入报文名称");
			
			
			logger.info("开始为每条记录插入报文名称");
			insertReportNameForData(rpmap);
			rpmap.clear();
			logger.info("开始更新数据信息");
			//needReportDetail.setBusinessState(PecrConstantUtil.BUSINESS_STATUS_50);
			//updateBusinessState(needReportDetail);
			logger.info("更新数据信息完成");
			
			// 韦宗英 add 总数追加  66 
			toalNum +=list.size();
			
			//韦宗英  update  生成一条报文并且开线程处理预处理  77
			if((f+1)%fileForNum == 0||f==(forNum-1)){
				if(numAdd2!=0||f==(forNum-1)){
					logger.info("写入报文执行完成");
					// 组织插入对象
					ReportAndBackMessageEnt rabme = new ReportAndBackMessageEnt();

					// 韦宗英
					listRpMEnt.add(AbstractGenerateReport.generateRpMessage(needReportDetail.getRptDate().get(0).toString(),
							rabme, PecrConstantUtil.IN_CTF_ITG_INF, reportName, Float.valueOf(toalNum),
							properties.getProperty("saveCreateReportPath"), name,needReportDetail.getCompany().toString()));
					//韦宗英 add  88
					toalNum = 0;
					logger.info("开始插入报文信息");
					insertReportMessage(listRpMEnt);
					listRpMEnt.clear();
					logger.info("插入报文信息完成");
					// 将报内容和文件名插入map中
					// tempSb.put(PecrConstantUtil.MESSAGE_BUFFER, sbf);
					tempSb.put(PecrConstantUtil.MESSAGE_NAME, new StringBuffer(reportName));
					sbList.add(tempSb);
					reportMap.put(PecrConstantUtil.MESSAGE_BUFFER, sbList);
					
					logger.info(
							"====================================================预处理开始===========================================================");
					// 对生成的报文进行预处理
					fiExecutorService.execute(()->{
		            	try {
		            		logger.info("开始校验.......................................wzy"+new Date().toString());
//							checkReport((String) tempSb.get(PecrConstantUtil.MESSAGE_NAME).toString(),reportFeedBackMessageService, reportMessageService);
							logger.info("校验结束...................个人证件整合信息....................wzy"+new Date().toString());
						} catch (Exception e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
		            });
				}
			}
			
			//韦宗英  add  99
			numAdd2++;
		}
		
		// reportMap.put(PecrConstantUtil.INSERT_REPORT_MESSAGE, listRpMEnt);
		// reportMap.put(PecrConstantUtil.INSERT_REPORT_NAME, rpmap);
		logger.info("XML格式BODY内容生成执行完成          wzy   个人证件整合信息");
		return reportMap;
	}

	@Transactional
	@Override
	public void updateBusinessState(NeedReportDetail needReportDetail) throws Exception {
		if (needReportDetail.getBusinessState() != null && needReportDetail.getBusinessState() != "") {
			Map<String, Object> conditionMap = new HashMap<>();
			conditionMap.put("RptDate", needReportDetail.getRptDate());
			conditionMap.put("pk", needReportDetail.getSpecialObj());
			//conditionMap.put("rownum", needReportDetail.getRownum());
			switch (needReportDetail.getBusinessState()) {
			case PecrConstantUtil.BUSINESS_STATUS_20:
				conditionMap.put("BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_20);
				conditionMap.put("OLD_BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_90);
				reportMessageService.updateInCtfItgRpDataStatus(conditionMap);
				break;
			case PecrConstantUtil.BUSINESS_STATUS_90:
				conditionMap.put("BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_90);
				conditionMap.put("OLD_BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_30);
				reportMessageService.updateInCtfItgRpDataStatus(conditionMap);
				break;
			case PecrConstantUtil.BUSINESS_STATUS_50:
				conditionMap.put("BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_50);
				conditionMap.put("OLD_BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_90);
				reportMessageService.updateInCtfItgRpDataStatus(conditionMap);
				break;
			default:
				break;
			}
		}
	}

	public void writeInCtfItgInf(Element InCtfItgInf, Map<String, Object> InCtfItgInfM) {
		/*** 个人证件整合信息记录 --- ***/
		InCtfItgInf.addElement("InfRecType")
				.setText(InCtfItgInfM.get("INF_REC_TYPE") != null ? InCtfItgInfM.get("INF_REC_TYPE").toString() : "");
		InCtfItgInf.addElement("Name")
				.setText(InCtfItgInfM.get("NAME") != null ? InCtfItgInfM.get("NAME").toString() : "");
		InCtfItgInf.addElement("IDType")
				.setText(InCtfItgInfM.get("ID_TYPE") != null ? InCtfItgInfM.get("ID_TYPE").toString() : "");
		InCtfItgInf.addElement("IDNum")
				.setText(InCtfItgInfM.get("ID_NUM") != null ? InCtfItgInfM.get("ID_NUM").toString() : "");
		InCtfItgInf.addElement("OthName")
				.setText(InCtfItgInfM.get("OTH_NAME") != null ? InCtfItgInfM.get("OTH_NAME").toString() : "");
		InCtfItgInf.addElement("OthIDType")
				.setText(InCtfItgInfM.get("OTH_ID_TYPE") != null ? InCtfItgInfM.get("OTH_ID_TYPE").toString() : "");
		InCtfItgInf.addElement("OthIDNum")
				.setText(InCtfItgInfM.get("OTH_ID_NUM") != null ? InCtfItgInfM.get("OTH_ID_NUM").toString() : "");
		InCtfItgInf.addElement("OthAssFlg")
				.setText(InCtfItgInfM.get("OTH_ASS_FLG") != null ? InCtfItgInfM.get("OTH_ASS_FLG").toString() : "");
		InCtfItgInf.addElement("InfSurcCode")
				.setText(InCtfItgInfM.get("INF_SURC_CODE") != null ? InCtfItgInfM.get("INF_SURC_CODE").toString() : "");
		InCtfItgInf.addElement("RptDate")
				.setText(InCtfItgInfM.get("RPT_DATE") != null ? InCtfItgInfM.get("RPT_DATE").toString() : "");
	}

	@Transactional
	@Override
	public void insertReportNameForData(Map<String, List<String>> map) throws Exception {
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
	
	//韦宗英 add 写文件
	public static void writeTOFile(StringBuffer content,String filePath,String filaName){
		BufferedWriter bw = null;
		FileWriter fw = null;
		try {
			fileName = createFilePath(filePath,filaName);
			File file = new File(createFilePath(filePath,filaName));
			if (!file.getParentFile().exists()){
				if (!file.getParentFile().mkdirs()){
					logger.info("创建文件所在目录失败！");
				}
			}
			if (!file.exists()){
				if (!file.createNewFile()){
					logger.info("创建文件失败！");
				}
			}
			fw = new FileWriter(file,true);
			bw = new BufferedWriter(fw);
			bw.write(content.toString());
			bw.flush();
//					bw.write(System.getProperty("line.separator"));
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if(bw != null) {
				try {
					bw.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if(fw != null) {
				try {
					fw.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	//韦宗英 add 追加写文件
	public static void writeTOFile(StringBuffer content){
		BufferedWriter bw = null;
		FileWriter fw = null;
		try {
			File file = new File(fileName);
			fw = new FileWriter(file,true);
			bw = new BufferedWriter(fw);
			bw.write(content.toString());
			bw.flush();
//						bw.write(System.getProperty("line.separator"));
		} catch (IOException e) {
			e.printStackTrace();
		}finally {
			if(bw != null) {
				try {
					bw.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if(fw != null) {
				try {
					fw.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		} 
	}
	
	//韦宗英  add
	public static String createFilePath(String filePath,String filaName){
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");  
		String dates = formatter.format(date).toString();
		return filePath+File.separator+dates+File.separator+filaName;
	}

}
