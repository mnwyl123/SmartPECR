package com.dcits.supervise.pecr.generateReport.ThreadExcute;

import java.util.Properties;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.dcits.supervise.pecr.feedbackreport.service.ReportFeedBackMessageService;
import com.dcits.supervise.pecr.generateReport.entity.NeedReportDetail;
import com.dcits.supervise.pecr.generateReport.exceptions.NoSuchReportException;
import com.dcits.supervise.pecr.generateReport.factory.GenerateReportFactory;
import com.dcits.supervise.pecr.generateReport.interfaces.IReport;
import com.dcits.supervise.pecr.generateReport.service.ReportMessageManager;
import com.dcits.supervise.pecr.util.CreateSerialNumber;

/**
 * 生成报文线程执行类
 * @author munan
 *
 */
public class ServiceHandleExcutor implements Runnable{

	private final static Logger logger =  Logger.getLogger(ServiceHandleExcutor.class);
	
	
	private  ReportFeedBackMessageService reportFeedBackMessageService;
	/**
	 * 生成报文传参对象
	 */
	private NeedReportDetail needReportDetail;
	
	public Properties properties;
	public ReportMessageManager reportMessageService;
	
	//用户名称
	private String name;
	/**
	 * 各生成报文实现的接口类
	 */
	private IReport iReport;
	
	//特殊标志--不进行预处理校验程序
	private String spFlag;
	
	private GenerateReportFactory generateReportFactory;
	public ServiceHandleExcutor(NeedReportDetail needReportDetail ,Properties properties,ReportMessageManager reportMessageService,ReportFeedBackMessageService reportFeedBackMessageService,String name){
		this.needReportDetail=needReportDetail;
		this.properties=properties;
		this.reportMessageService=reportMessageService;
		this.reportFeedBackMessageService=reportFeedBackMessageService;
		this.name = name;
	}
	
	public ServiceHandleExcutor(NeedReportDetail needReportDetail ,Properties properties,ReportMessageManager reportMessageService,ReportFeedBackMessageService reportFeedBackMessageService,String name, String spFlag){
		this.needReportDetail=needReportDetail;
		this.properties=properties;
		this.reportMessageService=reportMessageService;
		this.reportFeedBackMessageService=reportFeedBackMessageService;
		this.name = name;
		this.spFlag = spFlag;
	}
	
	/**
	 * 
	 */
	@Override
	public void run() {
		logger.info("获取报文生成工厂类");
		generateReportFactory=GenerateReportFactory.getGenerateReportFactory();
		try {
			iReport = generateReportFactory.createReportClass(needReportDetail,properties,reportMessageService);
			iReport.generateReport(needReportDetail,reportFeedBackMessageService,name,spFlag);
		} catch (NoSuchReportException e) {
			logger.info(e);
		} catch(Exception e){
			logger.info(e);
		}
		if (logger.isDebugEnabled()) {
			logger.debug("处理任务结束,处理线程状态:" + Thread.currentThread().getState());
		}
	}

}
