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
 * 家族关系信息生成报文类
 * 
 * @author munan
 *
 */
public class GenerateInFALMmbsInfRp extends AbstractGenerateReport {

	private final static Logger logger = Logger.getLogger(GenerateInFALMmbsInfRp.class);

	public Properties properties;
	
	public ReportMessageManager reportMessageService;

	private String TABLE_NAME = "I_IN_FAL_MMBS_INF";

	private String PACKET_KEY = "PAJ_IN_FAL_MMBS_INF_ID";
	
	private int count = 0;

	private String CCRC_ORG_CODE = "";

	public GenerateInFALMmbsInfRp(Properties properties, ReportMessageManager reportMessageService) {
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
		reportCount.put("INF_REC_TYPE", PecrConstantUtil.IN_FAL_MMBS_INF);
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
			reportCount.put("INF_REC_TYPE", PecrConstantUtil.IN_FAL_MMBS_INF);
			//获取组织个人基本信息报文的数据
			list = reportMessageService.queryInFalMmbRpData(reportCount);

			// 存放报文名和对应数据ID的map
			List<String> paaid = new ArrayList<String>();
			List<Map<String,String>> pkColnumList = new ArrayList<Map<String,String>>();
			//这里斗胆利用了List集合的有序性
			for (int i = 0; i < list.size(); i++) {
				Map<String, Object> indvBsSgmtReportEntity = list.get(i);
				String pk = indvBsSgmtReportEntity.get("PAJ_IN_FAL_MMBS_INF_ID").toString();
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
			// 一个报文一个报文头；对于其他信息（除基本信息外的），填写空值（即，两个空格）
			if(f%fileForNum == 0){
				sbf.append(generateRpHead(PecrConstantUtil.IN_FAL_MMBS_INF, numTotal[forTop++], "  "+CCRC_ORG_CODE));
				sbf.append("\r\n");
			}
			
			for (Map<String, Object> Entity : list) {
				Document document = DocumentHelper.createDocument();
				Element root = document.addElement("Document");
				Element InFalMmbsInf = root.addElement("InFalMmbsInf");
				writeInFalmmbsInf(InFalMmbsInf, Entity);
				sbf.append(document.getRootElement().asXML());
				sbf.append("\r\n");
			}
			//韦宗英 add 生成新的报文  55 
			if(f%fileForNum == 0){
				// 报文名称
				logger.info("开始获取流水号");
				Map<String,Object> serialNumMap = new HashMap<String,Object>();
				serialNumMap.put("inRefType", PecrConstantUtil.IN_FAL_MMBS_INF);
				serialNumMap.put("company", company);
				CreateSerialNumber instance = CreateSerialNumber.getInstance();
				instance.setReportMessageManager(reportMessageService);
				String reportNum = instance.getSerialNumb(serialNumMap);
				reportName = generateRpName(PecrConstantUtil.IN_FAL_MMBS_INF,reportNum, "0"+CCRC_ORG_CODE);
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
				rabme =  AbstractGenerateReport.generateRpMessage(rpt_date, rabme, PecrConstantUtil.IN_FAL_MMBS_INF, reportName, 
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
		logger.info("XML格式BODY内容生成执行完成 -----------家庭关联关系生成完毕");
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
				reportMessageService.updateInFalMmbRpDataStatus(conditionMap);
				break;
			case PecrConstantUtil.BUSINESS_STATUS_90:
				conditionMap.put("BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_90);
				conditionMap.put("OLD_BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_85);
				reportMessageService.updateInFalMmbRpDataStatus(conditionMap);
				break;
			case PecrConstantUtil.BUSINESS_STATUS_50:
				conditionMap.put("BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_50);
				conditionMap.put("OLD_BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_90);
				reportMessageService.updateInFalMmbRpDataStatus(conditionMap);
				break;
			default:
				break;
			}
		}
	}

	public void writeInFalmmbsInf(Element InFalMmbsInf, Map<String, Object> Familyrelation) {
		/*** 家族关系信息记录 --- ***/
		InFalMmbsInf.addElement("InfRecType").setText(
				Familyrelation.get("INF_REC_TYPE") != null ? Familyrelation.get("INF_REC_TYPE").toString() : "");
		InFalMmbsInf.addElement("Name")
				.setText(Familyrelation.get("NAME") != null ? Familyrelation.get("NAME").toString() : "");
		InFalMmbsInf.addElement("IDType")
				.setText(Familyrelation.get("ID_TYPE") != null ? Familyrelation.get("ID_TYPE").toString() : "");
		InFalMmbsInf.addElement("IDNum")
				.setText(Familyrelation.get("ID_NUM") != null ? Familyrelation.get("ID_NUM").toString() : "");
		InFalMmbsInf.addElement("FamMemName").setText(
				Familyrelation.get("FAM_MEM_NAME") != null ? Familyrelation.get("FAM_MEM_NAME").toString() : "");
		InFalMmbsInf.addElement("FamMemCertType").setText(Familyrelation.get("FAM_MEM_CERT_TYPE") != null
				? Familyrelation.get("FAM_MEM_CERT_TYPE").toString() : "");
		InFalMmbsInf.addElement("FamMemCertNum").setText(Familyrelation.get("FAM_MEM_CERT_NUM") != null
				? Familyrelation.get("FAM_MEM_CERT_NUM").toString() : "");
		InFalMmbsInf.addElement("FamRel")
				.setText(Familyrelation.get("FAM_REL") != null ? Familyrelation.get("FAM_REL").toString() : "");
		InFalMmbsInf.addElement("FamRelaAssFlag").setText(Familyrelation.get("FAM_RELA_ASS_FLAG") != null
				? Familyrelation.get("FAM_RELA_ASS_FLAG").toString() : "");
		InFalMmbsInf.addElement("InfSurcCode").setText(
				Familyrelation.get("INF_SURC_CODE") != null ? Familyrelation.get("INF_SURC_CODE").toString() : "");
		InFalMmbsInf.addElement("RptDate")
				.setText(Familyrelation.get("RPT_DATE") != null ? Familyrelation.get("RPT_DATE").toString() : "");
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
		
	}

}
