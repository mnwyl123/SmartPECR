package com.dcits.supervise.pecr.generateReport.ThreadExcute;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import org.apache.log4j.Logger;

import com.dcits.supervise.pecr.feedbackreport.service.ReportFeedBackMessageService;
import com.dcits.supervise.pecr.generateReport.service.ReportMessageManager;
import com.dcits.supervise.pecr.util.DealWithFile;
import com.dcits.supervise.pecr.util.PecrConstantUtil;
import com.dcits.supervise.pecr.util.StringDateUtil;

public class PreprocessingExcute implements Runnable {

	private final static Logger logger =  Logger.getLogger(PreprocessingExcute.class);
	
	private String fileName;
	
	private String company;
	
	private ReportFeedBackMessageService reportFeedBackMessageService;
	
	private ReportMessageManager reportMessageService;
	
	public Properties properties;
	
	public String spFlag;
	
	public PreprocessingExcute(String fileName, String company,
			ReportFeedBackMessageService reportFeedBackMessageService, ReportMessageManager reportMessageService, Properties properties,String spFlag) {
		this.fileName = fileName;
		this.company = company;
		this.reportFeedBackMessageService = reportFeedBackMessageService;
		this.reportMessageService = reportMessageService;
		this.properties = properties;
		this.spFlag = spFlag;
	}

	@Override
	public void run() {
		String saveCreateReportPath = properties.getProperty("saveCreateReportPath");
    	String feedbackDir = properties.getProperty("saveBackReportPath");
    	String dateString = StringDateUtil.getDateString("yyyy-MM-dd");
        String savePath = saveCreateReportPath + File.separator + dateString;
    	//韦宗英 
        String txtName = fileName;
        
        //以下为预处理操作 status:待定校验成功的状态是否为 SUCCESS。之前的判断逻辑已被推翻
        logger.info("预处理校验开始.......................................wzy"+new Date().toString());
        String status = null;
        if("noVerify".equals(spFlag)){
        	status = "SUCCESS";
        	logger.info("预处理校验模拟结束.......................................wzy"+new Date().toString());
        	Map<String, Object> conditionMap = new HashMap<>();
        	//report_message中 repName 不带后缀
    		String repName = txtName.substring(0,txtName.length()-4);
        	conditionMap.put("repName", repName);
			conditionMap.put("repStatus",PecrConstantUtil.REPORT_STATUS_CHECK_OK );
			try {
				reportMessageService.updateRepByRepName(conditionMap);
			} catch (Exception e) {
				logger.error("更新报文状态失败------------------"+txtName);
			}
        }else{
    		try {
    			status = DealWithFile.verifyFile(savePath, txtName,feedbackDir,reportFeedBackMessageService,reportMessageService,company);
    		} catch (Exception e) {
    			logger.error("预处理环节---校验---异常...................文件："+txtName+"...................", e);
    		}
            logger.info("预处理校验结束.......................................wzy"+new Date().toString());
        }
        if(status != null && "SUCCESS".equals(status)) {
	        //以下操作为进行压缩加密
	        //压缩
	        ArrayList<String> compressErrorMessage = null;
			try {
				compressErrorMessage = DealWithFile.messageCompress(savePath, txtName);
			} catch (IOException e) {
				logger.error("预处理环节---压缩---异常...................文件："+txtName+"...................", e);
			}
	        if (compressErrorMessage != null && compressErrorMessage.size() == 0) {
	        	//加密
	        	ArrayList<String> encryptErrorMessage = null;
				try {
					encryptErrorMessage = DealWithFile.messageEncrypt(savePath, txtName);
				} catch (IOException e) {
					logger.error("预处理环节---加密---异常...................文件："+txtName+"...................", e);
				}
	        	//加密失败
	        	if (encryptErrorMessage != null && encryptErrorMessage.size() != 0) {
	                logger.error("加密失败，具体信息为： " + encryptErrorMessage.toString());
	            }
	        }else{
	        	logger.error("压缩失败，具体信息为： " + compressErrorMessage== null?"":compressErrorMessage.toString());
	        }
	     }else{
	    	logger.error("预处理校验失败！");
	     }

	}

}
