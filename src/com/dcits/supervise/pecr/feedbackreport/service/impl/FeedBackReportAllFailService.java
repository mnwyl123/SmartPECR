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
public class FeedBackReportAllFailService {
	private static final Logger logger = LoggerFactory.getLogger(FeedBackReportAllFailService.class);
	@Autowired
	private ReportFeedBackMessageMapper reportMessageMapper;

	/**
	 * 更新表report_message报文状态
	 * @param reportMessage
	 * @throws Exception
	 */
	public void processingData(ReportAndBackMessageEnt reportMessage) throws Exception {
		logger.info("开始更新AllFail返回报文的数据状态");
		reportMessageMapper.updateByPrimaryKeySelective(reportMessage);
		logger.info("更新完成AllFail返回报文的数据状态");
	}
	
	
	/**
	 * 更新表report_message报文状态以及数据状态的首次默认更改
	 * 此时：反馈报文将数据状态默认置为70-上报成功；预处理校验将数据状态置为 30-审核通过
	 * @param reportMessage
	 * @throws Exception
	 */
	public void processingData(ReportAndBackMessageEnt reportMessage,Map<String,Object> param) throws Exception {
		Map<String, Object> conditionMap = new HashMap<>();
		String reportMessageType = reportMessage.getReport_message_type();
		String isLocal = "";
		if(param.get("isLocal") != null && !"".equals(param.get("isLocal").toString())){
			isLocal = param.get("isLocal").toString();
			String tableName = ReportType.getReportTypeBaseTable(reportMessageType);
			conditionMap.put("table_name", tableName);
			conditionMap.put("primaryKeyName", null);
			conditionMap.put("reportName", reportMessage.getReport_message_file_name());
			//1:反馈报文文件；0：.bad文件解析
			if("1".equals(isLocal)){
				conditionMap.put("BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_70);
				conditionMap.put("OLD_BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_50);
			}else{
				conditionMap.put("BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_30);
				conditionMap.put("OLD_BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_50);
			}
			logger.info("开始更新SomeFail返回报文的状态");
			reportMessageMapper.updateByPrimaryKeySelective(reportMessage);
			logger.info("更新完成SomeFail返回报文的状态");
			
			logger.info("开始更新SomeFail返回报文数据的数据状态");
			reportMessageMapper.UpdateBusinessStateByCondition(conditionMap);
			logger.info("完成更新SomeFail返回报文数据的数据状态");
			
		}
	}
	
	public void processingCheckData(ReportAndBackMessageEnt reportMessage) throws Exception {
		Map<String, Object> conditionMap = new HashMap<>();
		String reportMessageType = reportMessage.getReport_message_type();
		//logger.info("开始更新AllFail返回报文的数据状态");
		//reportMessageMapper.updateByPrimaryKeySelective(reportMessage);
		logger.info("更新完成AllFail返回报文的数据状态");
		String tableName = ReportType.getReportTypeBaseTable(reportMessageType);
		conditionMap.put("table_name", tableName);
		conditionMap.put("primaryKeyName", null);
		conditionMap.put("reportName", reportMessage.getReport_message_file_name());
		//对于整体报文出错的情况下，将报文中所有数据的数据状态修改为校验成功，可利于下次直接生成报文。
		//预处理失败  改状态为110  穆楠
		conditionMap.put("BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_110);
		conditionMap.put("OLD_BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_50);
		logger.info("开始更新AllFail返回报文数据的数据状态");
		reportMessageMapper.UpdateBusinessStateByCondition(conditionMap);
		logger.info("完成更新AllFail返回报文数据的数据状态");
		//操作数据的流程必须为先更新当前表数据状态，再迁移数据到历史表，最后修改历史表数据状态   舍弃
	}
	
	/**
	 * 根据报文名称和数据状态进行数据移植至历史表，然后删除当前表中的数据
	 * @param reportMessage
	 * @throws Exception
	 */
	public void processingMoveAndDelData(ReportAndBackMessageEnt reportMessage) throws Exception {
		Map<String, Object> conditionMap = new HashMap<>();
		String reportMessageType = reportMessage.getReport_message_type();
		String tableName = ReportType.getReportTypeBaseTable(reportMessageType);
		conditionMap.put("table_name", tableName);
		conditionMap.put("reportName", reportMessage.getReport_message_file_name());
		conditionMap.put("BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_70);
		//此处迁移历史表仅仅是 报文记录类型的基础信息表，应该将整条数据线都进行迁移至历史表，然后删除当前表中的数据。
		conditionMap.put("hist_table_name", tableName+"_HIST");
		String tablePK = ReportType.getReportTypePrimaryKey(reportMessageType);
		conditionMap.put("tablePK", tablePK);
		List<String> realTableLists = ReportType.getReportTypeBusinessRealTables(reportMessageType);
		logger.info("开始迁移数据完成SomeFail返回报文的主表数据"+tableName);
		reportMessageMapper.moveData(conditionMap);
		logger.info("完成迁移数据完成SomeFail返回报文的主表数据"+tableName);
		if(realTableLists != null && realTableLists.size() > 0){
			//获取到的是基础表的相关干系表，此处将当前表数据迁移至历史表
			for (String realTable : realTableLists) {
				conditionMap.put("realTable", realTable);
				conditionMap.put("realTableHist", realTable+"_HIST");
				logger.info("开始迁移数据完成SomeFail返回报文的相关干系表数据"+realTable);
				reportMessageMapper.moveRealTableData(conditionMap);
				logger.info("完成迁移数据完成SomeFail返回报文的相关干系表数据"+realTable);
			}
			//此处将当前表数据进行删除，先删除相关干系表，再删除基础表。删除的时候都与对应的历史表做了关联的
			for (String realTable : realTableLists) {
				conditionMap.put("realTable", realTable);
				conditionMap.put("realTableHist", realTable+"_HIST");
				logger.info("开始删除SomeFail返回报文的相关干系表数据"+realTable);
				reportMessageMapper.deleteRealTableData(conditionMap);
				logger.info("完成删除SomeFail返回报文的相关干系表数据"+realTable);
				
			}
		}
		
		logger.info("开始删除SomeFail返回报文的主表数据"+tableName);
		reportMessageMapper.deleteTableData(conditionMap);
		logger.info("完成删除SomeFail返回报文的主表数据"+tableName);
	}
}
