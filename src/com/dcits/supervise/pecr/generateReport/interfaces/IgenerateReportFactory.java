package com.dcits.supervise.pecr.generateReport.interfaces;

import com.dcits.supervise.pecr.generateReport.entity.NeedReportDetail;
import com.dcits.supervise.pecr.generateReport.exceptions.NoSuchReportException;
import com.dcits.supervise.pecr.generateReport.service.ReportMessageManager;

import java.util.Properties;

/**
 * 线程工厂接口类
 * @author munan
 *
 */
public interface IgenerateReportFactory {

	public IReport createReportClass(NeedReportDetail needReportDetail,Properties properties,ReportMessageManager reportMessageService) throws NoSuchReportException;
}
