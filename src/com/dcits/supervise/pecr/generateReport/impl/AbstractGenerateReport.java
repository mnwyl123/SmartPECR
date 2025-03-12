package com.dcits.supervise.pecr.generateReport.impl;

import com.dcits.supervise.pecr.feedbackreport.service.ReportFeedBackMessageService;
import com.dcits.supervise.pecr.generateReport.ThreadExcute.PreprocessingExcute;
import com.dcits.supervise.pecr.generateReport.entity.NeedReportDetail;
import com.dcits.supervise.pecr.generateReport.entity.ReportAndBackMessageEnt;
import com.dcits.supervise.pecr.generateReport.interfaces.IReport;
import com.dcits.supervise.pecr.generateReport.service.ReportMessageManager;
import com.dcits.supervise.pecr.util.DealWithFile;
import com.dcits.supervise.pecr.util.FileWriterTXT;
import com.dcits.supervise.pecr.util.PecrConstantUtil;
import com.dcits.supervise.pecr.util.StringDateUtil;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.LinkedBlockingDeque;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/**
 * 生成报文实体抽象方法类
 *
 * @author munan
 */
public abstract class AbstractGenerateReport implements IReport {

	
    private final static Logger logger = Logger.getLogger(AbstractGenerateReport.class);
    
    public Properties properties;
    
    private ReportMessageManager reportMessageService;
    
    //进行预处理的线程池
    ThreadPoolExecutor fiExecutorService = new ThreadPoolExecutor(1, 2, 0L, TimeUnit.SECONDS, new LinkedBlockingDeque<>(300));

    /**
     * 生成报文
     */
    @Override
    public String generateReport(NeedReportDetail needReportDetail,ReportFeedBackMessageService reportFeedBackMessageService,String name,String spFlag) {
        //20210225,为解析bad文件插入反馈错误信息表中的法人做准备
    	String company = needReportDetail.getCompany().get(0);
    	Map<String, Object> map = new HashMap<String, Object>();
        this.properties = getProperties();
        logger.info("开始生成报文");
        try {
        	//生成报文具体内容
            map = generateBody(needReportDetail,name,reportFeedBackMessageService);
            logger.info("XML格式BODY内容生成执行完成,Map:"+map.toString());
            if (map.get("resultCode") != null && "ERROR".equals(map.get("resultCode").toString())) {
            	String msg = map.get("resultMsg").toString();
            	needReportDetail.setBusinessState(PecrConstantUtil.BUSINESS_STATUS_30);
            	//防止执行方法 generateBody时给其属性已赋值
            	needReportDetail.setRownum(0);
                updateBusinessState(needReportDetail);
                throw new Exception(msg);
            }
            if(map.get("resultCode") != null && "SUCCESS".equals(map.get("resultCode").toString())){
            	logger.info("====================================================预处理开始===========================================================");
				logger.info("开启线程......................................." + new Date().toString());
				//获取预处理所需参数
				List<Map<String, StringBuffer>> sbList = (List<Map<String, StringBuffer>>) map.get(PecrConstantUtil.MESSAGE_BUFFER);
				reportMessageService = (ReportMessageManager) map.get("reportMessageService");
				
				if(sbList != null && sbList.size() > 0 && reportMessageService != null){
					for(Map<String, StringBuffer> tempSb : sbList){
						String fileName = tempSb.get(PecrConstantUtil.MESSAGE_NAME).toString();
						PreprocessingExcute preprocessingExcute = new PreprocessingExcute(fileName, company, reportFeedBackMessageService, reportMessageService,properties,spFlag);
						fiExecutorService.execute(preprocessingExcute);
					}
				}
            }
        } catch (Exception e) {
            try {
                needReportDetail.setBusinessState(PecrConstantUtil.BUSINESS_STATUS_30);
                needReportDetail.setRownum(0);
                updateBusinessState(needReportDetail);
            } catch (Exception e1) {
            	logger.error("异常处理修改基础表数据状态为30：审核通过失败。", e1);
            }
            logger.error("生成报文出错，请联系管理员", e);
        }
        return "";
    }

    /**
     * 生成报文具体内容
     *
     * @return
     * @throws Exception
     */
    public abstract Map<String, Object> generateBody(NeedReportDetail needReportDetail,String name,ReportFeedBackMessageService reportFeedBackMessageService) throws Exception;

    /**
     * 获取子类Properties对象
     *
     * @return
     */
    public abstract Properties getProperties();

    /**
     * 生成文件
     */
    public void generateFile(StringBuffer sbff, String name) throws Exception {
        String saveCreateReportPath = properties.getProperty("saveCreateReportPath");
        FileWriterTXT.writeTOFile(sbff, saveCreateReportPath, name);
        
    }
    /**
     * 报文预处理
     * name：报文名（带后缀）
     */
     public void  checkReport(String name,ReportFeedBackMessageService reportFeedBackMessageService,ReportMessageManager reportMessageService,String company) throws Exception  {
    	String saveCreateReportPath = properties.getProperty("saveCreateReportPath");
    	String feedbackDir = properties.getProperty("saveBackReportPath");
    	String dateString = StringDateUtil.getDateString("yyyy-MM-dd");
        String savePath = saveCreateReportPath + File.separator + dateString;
    	//韦宗英 
        String txtName = name;
        
        //以下为预处理操作 status:待定校验成功的状态是否为 SUCCESS。之前的判断逻辑已被推翻
        logger.info("预处理开始.......................................wzy"+new Date().toString());
        String status =  DealWithFile.verifyFile(savePath, txtName,feedbackDir,reportFeedBackMessageService,reportMessageService,company);
        logger.info("预处理结束.......................................wzy"+new Date().toString());
        if(status != null && "SUCCESS".equals(status)) {
	        //以下操作为进行压缩加密
	        //压缩
	        ArrayList<String> compressErrorMessage = DealWithFile.messageCompress(savePath, txtName);
	        if (compressErrorMessage != null && compressErrorMessage.size() == 0) {
	        	//加密
	        	ArrayList<String> encryptErrorMessage = DealWithFile.messageEncrypt(savePath, txtName);
	        	//加密失败
	        	if (encryptErrorMessage.size() != 0) {
	                logger.error("加密失败，具体信息为： " + encryptErrorMessage.toString());
	            }
	        }else{
	        	logger.error("压缩失败，具体信息为： " + compressErrorMessage == null?"":compressErrorMessage.toString());
	        }
	     }else{
	    	logger.error("预处理失败！");
	     }
    }

     /**
     * 生成报文头
     *
     * @param infType 类型
     */
    public String generateRpHead(String infType, String numb, String modoleType) {
        String recordNumb = String.format("%07d", numb);
        /*穆楠*/
        String modoleTypeTrue = modoleType.substring(0, 2);
        String CCRC_ORG_CODE = modoleType.substring(2);
        
        StringBuffer sbHead = new StringBuffer();
        sbHead.append("A");
        sbHead.append("050");//文件头长度
        sbHead.append(infType);
        sbHead.append("2.0.0");
        sbHead.append(modoleTypeTrue);//信息记录模板类型
        sbHead.append(CCRC_ORG_CODE);//数据提供机构区段码
        sbHead.append(StringDateUtil.getWorkDate());
        sbHead.append("0");//预留位
        sbHead.append(recordNumb);
        return sbHead.toString();
    }
    
    
    public String generateRpHead(String infType, int numb, String modoleType) {
        String recordNumb = String.format("%07d", numb);
        /*穆楠*/
        String modoleTypeTrue = modoleType.substring(0, 2);
        String CCRC_ORG_CODE = modoleType.substring(2);
        
        StringBuffer sbHead = new StringBuffer();
        sbHead.append("A");
        sbHead.append("050");//文件头长度
        sbHead.append(infType);
        sbHead.append("2.0.0");
        sbHead.append(modoleTypeTrue);//信息记录模板类型
        sbHead.append(CCRC_ORG_CODE);//数据提供机构区段码
        sbHead.append(StringDateUtil.getWorkDate());
        sbHead.append("0");//预留位
        sbHead.append(recordNumb);
        return sbHead.toString();
    }
    
    /**
     * 生成报文名称
     *
     * @param infType    类型
     * @param serialNumb 流水号
     */
    public String generateRpName(String infType, String serialNumb, String backIdentif) {
        if (serialNumb == null || serialNumb == "") {
            return null;
        }
        StringBuffer sbName = new StringBuffer();
        String backIdentiTrue = backIdentif.substring(0, 1);
        String CCRC_ORG_CODE = backIdentif.substring(1);
        sbName.append(CCRC_ORG_CODE);//数据提供机构区段码   14
        sbName.append(StringDateUtil.getDateString("yyyyMMdd"));  //8  2020........
        sbName.append(infType);      //3  110
        sbName.append("0");//预留位        //1
        sbName.append(serialNumb);  //
        sbName.append(backIdentiTrue);//反馈标识    //1
        return sbName.toString();
    }

    
    /** 
     * 组装报文表：report_message 内容
     */
    public static ReportAndBackMessageEnt generateRpMessage(String rpt_date,ReportAndBackMessageEnt rabme, String Report_message_type, String reportName, Float Record_num, String saveCreateReportPath,String name,String company) {
        rabme.setReport_message_file_name(reportName);
        rabme.setReport_message_type(Report_message_type);
        rabme.setReport_message_status(PecrConstantUtil.REPORT_STATUS_SEND_NO);
        rabme.setTxt_report_message_file_path(generateTxtEncRpName(reportName, saveCreateReportPath).get(0));
        rabme.setEnc_report_message_file_path(generateTxtEncRpName(reportName, saveCreateReportPath).get(1));
        rabme.setRecord_num(Record_num);
        rabme.setReport_time(rpt_date);
        rabme.setZip_report_message_file_path("");
        rabme.setAbnorm_reportmessage_filepath("");
        rabme.setCreate_success_time("");
        rabme.setOrg_code("");
        rabme.setDescription("");
        //操作人
        rabme.setOperator_user(name);
        rabme.setCompany(company);
        rabme.setCreate_time(StringDateUtil.getDateString("yyyy-MM-dd HH:mm:ss"));
        return rabme;
    }
    
    /**
     * 生成报文表内容
     */
    public static ReportAndBackMessageEnt generateRpMessage(ReportAndBackMessageEnt rabme, String Report_message_type, String reportName, Float Record_num, String saveCreateReportPath) {
        rabme.setReport_message_file_name(reportName);
        rabme.setReport_message_type(Report_message_type);
        rabme.setReport_message_status(PecrConstantUtil.REPORT_STATUS_SEND_NO);
        rabme.setTxt_report_message_file_path(generateTxtEncRpName(reportName, saveCreateReportPath).get(0));
        rabme.setEnc_report_message_file_path(generateTxtEncRpName(reportName, saveCreateReportPath).get(1));
        rabme.setRecord_num(Record_num);
        //rabme.setReport_time(rpt_date);
        rabme.setCreate_time(StringDateUtil.getDateString("YYYY-MM-dd"));
        return rabme;
    }

    /**
     * 生成TXT/ENC报文名称
     */
    public static List<String> generateTxtEncRpName(String reportName, String saveCreateReportPath) {
        List<String> list = new ArrayList<>();
        String reportNameTxt = reportName + ".txt";
        String reportNameEnc = reportName + ".enc";
        String reportNameTxtPath = FileWriterTXT.createFilePath(saveCreateReportPath, reportNameTxt);
        String reportNameEncPath = FileWriterTXT.createFilePath(saveCreateReportPath, reportNameEnc);
        list.add(reportNameTxtPath);
        list.add(reportNameEncPath);
        return list;
    }

    /**
     * 生成报文过程中修改数据状态
     * <p>
     * 数据校验成功：20
     * 50 ：已生成报文
     *
     * @throws Exception
     */
    @Transactional
    public abstract void updateBusinessState(NeedReportDetail needReportDetail) throws Exception;

    /**
     * 生成报文后向数据中插入报文名
     * 后续需要删除
     *
     * @param map value 为list的数据ID
     * @throws Exception
     */
    @Transactional
    public abstract void insertReportNameForData(Map<String, List<String>> map) throws Exception;
    
    /**
     * 生成报文后向数据中插入报文名
     * 后续需要改成抽象类 abstract
     *
     * @param map value 为list的数据ID
     * @throws Exception
     */
    @Transactional
    public void insertReportNameAndColnumForData(Map<String, Object> map) throws Exception{};

    /**
     * 插入报文信息
     */
    public abstract void insertReportMessage(List<ReportAndBackMessageEnt> list) throws Exception;
    
}
