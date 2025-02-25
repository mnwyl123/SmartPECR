package com.dcits.supervise.pecr.generateReport.ThreadExcute;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.dcits.supervise.pecr.feedbackreport.mapper.ReportFeedBackMessageMapper;
import com.dcits.supervise.pecr.util.PecrConstantUtil;
import com.dcits.supervise.pecr.util.ReportType;

public class FeedReportAllSuccRunnable implements Runnable {

	private final static Logger logger =  Logger.getLogger(FeedReportAllSuccRunnable.class);
	
	private ReportFeedBackMessageMapper reportMessageMapper;
	
	private Map<String,String> paramMap;
	
	public FeedReportAllSuccRunnable(ReportFeedBackMessageMapper reportMessageMapper,Map<String,String> paramMap) {
		this.reportMessageMapper = reportMessageMapper;
		this.paramMap = paramMap;
	}



	@Override
	public void run() {
		Map<String, Object> conditionMap = new HashMap<>();
		String reportMessageType = paramMap.get("REPORT_MESSAGE_TYPE").toString();
		String reportMessageFileName = paramMap.get("REPORT_MESSAGE_FILE_NAME").toString();
		String tableName = ReportType.getReportTypeBaseTable(reportMessageType);
		conditionMap.put("table_name", tableName);
		conditionMap.put("reportName", reportMessageFileName);
		conditionMap.put("BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_70);
		conditionMap.put("OLD_BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_50);
		try {
			//更新 对应的基础表中的数据状态
			reportMessageMapper.UpdateBusinessStateByCondition(conditionMap);
			//操作数据的流程必须为先更新当前表数据状态，再迁移数据到历史表，最后修改历史表数据状态
			//此处迁移历史表仅仅是 报文记录类型的基础信息表，应该将整条数据线都进行迁移至历史表，然后删除当前表中的数据。
			conditionMap.put("hist_table_name", tableName+"_HIST");
			String tablePK = ReportType.getReportTypePrimaryKey(reportMessageType);
			conditionMap.put("tablePK", tablePK);
			List<String> realTableLists = ReportType.getReportTypeBusinessRealTables(reportMessageType);
			logger.info("开始迁移数据完成AllSuccess返回报文的主表数据"+tableName);
			reportMessageMapper.moveData(conditionMap);
			logger.info("完成迁移数据完成AllSuccess返回报文的主表数据"+tableName);
			if(realTableLists != null && realTableLists.size() > 0){
				//获取到的是基础表的相关干系表，此处将当前表数据迁移至历史表
				for (String realTable : realTableLists) {
					conditionMap.put("realTable", realTable);
					conditionMap.put("realTableHist", realTable+"_HIST");
					logger.info("开始迁移数据完成AllSuccess返回报文的相关干系表数据"+realTable);
					reportMessageMapper.moveRealTableData(conditionMap);
					logger.info("完成迁移数据完成AllSuccess返回报文的相关干系表数据"+realTable);
				}
				//此处将当前表数据进行删除，先删除相关干系表，再删除基础表。删除的时候都与对应的历史表做了关联的
				for (String realTable : realTableLists) {
					conditionMap.put("realTable", realTable);
					conditionMap.put("realTableHist", realTable+"_HIST");
					logger.info("开始删除AllSuccess返回报文的相关干系表数据"+realTable);
					reportMessageMapper.deleteRealTableData(conditionMap);
					logger.info("完成删除AllSuccess返回报文的相关干系表数据"+realTable);
					
				}
			}
			
			logger.info("开始删除AllSuccess返回报文的主表数据"+tableName);
			reportMessageMapper.deleteTableData(conditionMap);
			logger.info("完成删除AllSuccess返回报文的主表数据"+tableName);
		} catch (Exception e) {
			logger.error("表："+tableName+"-------报文名："+reportMessageFileName+"数据迁移失败", e);
			return ;
		}
	}
	
}
