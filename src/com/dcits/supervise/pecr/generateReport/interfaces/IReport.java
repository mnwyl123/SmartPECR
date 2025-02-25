package com.dcits.supervise.pecr.generateReport.interfaces;

import com.dcits.supervise.pecr.feedbackreport.service.ReportFeedBackMessageService;
import com.dcits.supervise.pecr.generateReport.entity.NeedReportDetail;

/**
 * 报文生成实体接口
 * @author munan
 *
 */
public interface IReport {

	/**
	 * 生成报文内容
	 * @param needReportDetail
	 * @return
	 */
	public String generateReport(NeedReportDetail needReportDetail,ReportFeedBackMessageService reportFeedBackMessageService,String name,String spFlag);
	
	
}
