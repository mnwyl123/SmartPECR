package com.dcits.supervise.pecr.feedbackreport.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dcits.supervise.pecr.feedbackreport.mapper.ReportFeedBackMessageMapper;
import com.dcits.supervise.pecr.generateReport.entity.ReportAndBackMessageEnt;
import com.dcits.supervise.pecr.util.PecrConstantUtil;
import com.dcits.supervise.pecr.util.ReportType;

@Service
public class FeedBackReportAllSuccessService {
	private static final Logger logger = LoggerFactory.getLogger(FeedBackReportAllSuccessService.class);;
	@Autowired
	private ReportFeedBackMessageMapper reportMessageMapper;

	public void processingData( ReportAndBackMessageEnt reportMessage) throws Exception {
		Map<String, Object> conditionMap = new HashMap<>();
		String reportMessageType = reportMessage.getReport_message_type();
		//更新表 report_message
		reportMessageMapper.updateByPrimaryKeySelective(reportMessage);
		String tableName = ReportType.getReportTypeBaseTable(reportMessageType);
		conditionMap.put("table_name", tableName);
		conditionMap.put("primaryKeyName", null);
		conditionMap.put("reportName", reportMessage.getReport_message_file_name());
		conditionMap.put("BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_70);
		conditionMap.put("OLD_BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_50);
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
		
	}
	/**
	 * 预处理
	 * @param reportMessage
	 * @throws Exception
	 */
	public void processingCheckData( ReportAndBackMessageEnt reportMessage) throws Exception {
		Map<String, Object> conditionMap = new HashMap<>();
		String reportMessageType = reportMessage.getReport_message_type();
		logger.info("开始更新AllSuccess返回报文的数据状态");
		reportMessageMapper.updateByPrimaryKeySelective(reportMessage);
		logger.info("更新完成AllSuccess返回报文的数据状态");
		String tableName = ReportType.getReportTypeBaseTable(reportMessageType);
		conditionMap.put("table_name", tableName);
//		conditionMap.put("hist_table_name", tableName+"_hist");
		conditionMap.put("primaryKeyName", null);
		conditionMap.put("reportName", reportMessage.getReport_message_file_name());
		conditionMap.put("BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_120);
		conditionMap.put("OLD_BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_50);
		//操作数据的流程必须为先更新当前表数据状态，再迁移数据到历史表，最后修改历史表数据状态  舍弃   穆楠
//		logger.info("开始迁移数据完成AllSuccess返回报文的数据");
//		reportMessageMapper.moveData(conditionMap);
//		logger.info("完成迁移数据完成AllSuccess返回报文的数据");
		logger.info("开始更新AllCheckSuccess返回报文数据的数据状态");
		reportMessageMapper.UpdateBusinessStateCheckByCondition(conditionMap);
		logger.info("完成更新AllCheckSuccess返回报文数据的数据状态");
	}
}
