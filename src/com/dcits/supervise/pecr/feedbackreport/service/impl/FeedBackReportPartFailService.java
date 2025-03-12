package com.dcits.supervise.pecr.feedbackreport.service.impl;

import java.io.BufferedReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dcits.supervise.pecr.feedbackreport.entity.FeedBackReportCode;
import com.dcits.supervise.pecr.feedbackreport.entity.FeedBackReportErrorMessage;
import com.dcits.supervise.pecr.feedbackreport.mapper.ReportFeedBackMessageMapper;
import com.dcits.supervise.pecr.generateReport.entity.ReportAndBackMessageEnt;
import com.dcits.supervise.pecr.util.Base64;
import com.dcits.supervise.pecr.util.FileUtil;
import com.dcits.supervise.pecr.util.IdUtil;
import com.dcits.supervise.pecr.util.PecrConstantUtil;
import com.dcits.supervise.pecr.util.ReportType;
import com.dcits.supervise.pecr.util.StringDateUtil;

public abstract  class FeedBackReportPartFailService {
	private static Logger logger;

	public void processingData( ReportAndBackMessageEnt reportMessage, String txtFeedBackFilePath,ReportFeedBackMessageMapper reportMessageMapper)
			throws Exception {
		List<String> recordIds = new ArrayList<>();
		List<FeedBackReportErrorMessage> feedBackReportErrorMessageList = new ArrayList<FeedBackReportErrorMessage>();
		String reportMessageId = reportMessage.getReport_message_id();
		String reportMessageType = reportMessage.getReport_message_type();
		String reportMessageFileName = reportMessage.getReport_message_file_name();
		String feedbackMessageFileName = reportMessage.getFeedback_message_file_name();
		String tableName = ReportType.getReportTypeBaseTable(reportMessageType);
		String primaryKeyName = ReportType.getReportTypePrimaryKey(reportMessageType);
		int lineNum = 0;
		String header = "";
		String fileBody = "";
		BufferedReader bufferedReader = FileUtil.getReader(txtFeedBackFilePath, "UTF-8");
		while ((fileBody = bufferedReader.readLine()) != null) {
			if (++lineNum == 1) {
				header = fileBody;
			}
			if (lineNum > 1) {
				if ("".equals(fileBody)) {
					continue;
				}
				Document document = DocumentHelper.parseText(fileBody);
				Element rootElt = document.getRootElement();
				Element fbInf = rootElt.element("FbInf");
				Element errRecE = fbInf.element("ErrRec");
				String errRec = errRecE.getStringValue();
				String recordXml = Base64.decodeStr(errRec, "UTF-8");
				Document reportDocument = DocumentHelper.parseText(recordXml);
				// 获取对应数据
				String recordId = selectIdByJSONObject(reportDocument);
//				String recordId="";
				if (StringUtils.isBlank((String) recordId)) {
					logger.error("未找到对应的信息记录：" + reportDocument.toString());
					break;
				}
				//Element fbErrNumE = fbInf.element("FbErrNum");
				//int fbErrNum = Integer.valueOf(fbErrNumE.getStringValue());
				List<Element> elements = fbInf.elements();
				for (Element element : elements) {
					if (element.getName().equals("ErrInf")) {
						String fbCode = element.element("FbCode").getStringValue();
						String fbMsg = element.element("FbMsg").getStringValue();
						// 反馈报文数据信息
						FeedBackReportCode feedBackReportCode = reportMessageMapper.selectByCodeAndTag(fbCode,
								fbMsg);
						if (feedBackReportCode == null) {
							feedBackReportCode = new FeedBackReportCode();
							feedBackReportCode.setFeedBackReportCodeId("");
							feedBackReportCode.setMessage("反馈报文错误信息表中不存在:" + fbCode + "-" + fbMsg);
						}
						FeedBackReportErrorMessage feedBackReportErrorMessage = new FeedBackReportErrorMessage();
//						feedBackReportErrorMessage.setFeedBackReportErrorMessId(IdUtil.simpleUUID());
						feedBackReportErrorMessage.setReportMessageId(reportMessageId);
						feedBackReportErrorMessage.setReportMessageType(reportMessageType);
						feedBackReportErrorMessage.setRecordId(recordId);
						feedBackReportErrorMessage
								.setFeedBackReportCodeId(feedBackReportCode.getFeedBackReportCodeId());
						feedBackReportErrorMessage.setErrorMessage(feedBackReportCode.getMessage());
						feedBackReportErrorMessage.setCreateTime(StringDateUtil.getDateString("yyyy-MM-dd"));
						feedBackReportErrorMessage.setReportMessageName(reportMessageFileName);
						feedBackReportErrorMessage.setFeedBackReportName(feedbackMessageFileName);
						feedBackReportErrorMessage.setFbCode(feedBackReportCode.getFbCode());
						feedBackReportErrorMessage.setFbTag(feedBackReportCode.getFbTag());
						feedBackReportErrorMessage.setIsCheck("1");
						feedBackReportErrorMessageList.add(feedBackReportErrorMessage);
					}
				}
				recordIds.add(recordId);
			}
		}
		bufferedReader.close();
		reportMessageMapper.saveFeedBackErrorList(feedBackReportErrorMessageList);
		Map<String, Object> conditionMap = new HashMap<>();
		conditionMap.put("table_name", tableName);
		conditionMap.put("hist_table_name", tableName+"_hist");
		conditionMap.put("reportName", reportMessage.getReport_message_file_name());
		conditionMap.put("pk", recordIds);
		conditionMap.put("primaryKeyName", primaryKeyName);
		conditionMap.put("BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_80);
		conditionMap.put("OLD_BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_60);
		logger.info("开始更新部分反馈错误返回报文数据的数据状态");
		reportMessageMapper.UpdateBusinessStateByCondition(conditionMap);
		logger.info("完成更新部分反馈错误返回报文数据的数据状态");
		
		//穆楠
		//操作数据的流程必须为先更新当前表数据状态，再迁移数据到历史表，最后修改历史表数据状态
		/*//将历史表中数据状态修改为70
		 * reportMessageMapper.moveData(conditionMap);
		conditionMap.put("BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_70);
		reportMessageMapper.UpdateBusinessStateHistByCondition(conditionMap);*/
		
		String successNum = header.substring(58, 65);
		String failNum = header.substring(65, 72);
		reportMessage.setFk_success_number(Float.valueOf(successNum));
		reportMessage.setFk_fail_number(Float.valueOf(failNum));
		reportMessageMapper.updateByPrimaryKeySelective(reportMessage);
	}
	public void processingCheckData( ReportAndBackMessageEnt reportMessage, String txtFeedBackFilePath,ReportFeedBackMessageMapper reportMessageMapper)
			throws Exception {
		List<String> recordIds = new ArrayList<>();
		List<FeedBackReportErrorMessage> feedBackReportErrorMessageList = new ArrayList<FeedBackReportErrorMessage>();
		String reportMessageId = reportMessage.getReport_message_id();
		String reportMessageType = reportMessage.getReport_message_type();
		String reportMessageFileName = reportMessage.getReport_message_file_name();
		String feedbackMessageFileName = reportMessage.getFeedback_message_file_name();
		String tableName = ReportType.getReportTypeBaseTable(reportMessageType);
		String primaryKeyName = ReportType.getReportTypePrimaryKey(reportMessageType);
		int lineNum = 0;
		String header = "";
		String fileBody = "";
		BufferedReader bufferedReader = FileUtil.getReader(txtFeedBackFilePath, "UTF-8");
		while ((fileBody = bufferedReader.readLine()) != null) {
			if (++lineNum == 1) {
				header = fileBody;
			}
			if (lineNum > 1) {
				if ("".equals(fileBody)) {
					continue;
				}
				Document document = DocumentHelper.parseText(fileBody);
				Element rootElt = document.getRootElement();
				Element fbInf = rootElt.element("FbInf");
				Element errRecE = fbInf.element("ErrRec");
				String errRec = errRecE.getStringValue();
				String recordXml = Base64.decodeStr(errRec, "UTF-8");
				Document reportDocument = DocumentHelper.parseText(recordXml);
				// 获取对应数据
				String recordId = selectIdByJSONObject(reportDocument);
//				String recordId="";
				if (StringUtils.isBlank((String) recordId)) {
					logger.error("未找到对应的信息记录：" + reportDocument.toString());
					break;
				}
				//Element fbErrNumE = fbInf.element("FbErrNum");
				//int fbErrNum = Integer.valueOf(fbErrNumE.getStringValue());
				List<Element> elements = fbInf.elements();
				for (Element element : elements) {
					if (element.getName().equals("ErrInf")) {
						String fbCode = element.element("FbCode").getStringValue();
						String fbMsg = element.element("FbMsg").getStringValue();
						// 反馈报文数据信息
						FeedBackReportCode feedBackReportCode = reportMessageMapper.selectByCodeAndTag(fbCode,
								fbMsg);
						if (feedBackReportCode == null) {
							feedBackReportCode = new FeedBackReportCode();
							feedBackReportCode.setFeedBackReportCodeId("");
							feedBackReportCode.setMessage("反馈报文错误信息表中不存在:" + fbCode + "-" + fbMsg);
						}
						FeedBackReportErrorMessage feedBackReportErrorMessage = new FeedBackReportErrorMessage();
//						feedBackReportErrorMessage.setFeedBackReportErrorMessId(IdUtil.simpleUUID());
						feedBackReportErrorMessage.setReportMessageId(reportMessageId);
						feedBackReportErrorMessage.setReportMessageType(reportMessageType);
						feedBackReportErrorMessage.setRecordId(recordId);
						feedBackReportErrorMessage
								.setFeedBackReportCodeId(feedBackReportCode.getFeedBackReportCodeId());
						feedBackReportErrorMessage.setErrorMessage(feedBackReportCode.getMessage());
						feedBackReportErrorMessage.setCreateTime(StringDateUtil.getDateString("yyyy-MM-dd"));
						feedBackReportErrorMessage.setReportMessageName(reportMessageFileName);
						feedBackReportErrorMessage.setFeedBackReportName(feedbackMessageFileName);
						feedBackReportErrorMessage.setFbCode(feedBackReportCode.getFbCode());
						feedBackReportErrorMessage.setFbTag(feedBackReportCode.getFbTag());
						feedBackReportErrorMessage.setIsCheck("0");
						feedBackReportErrorMessageList.add(feedBackReportErrorMessage);
					}
				}
				recordIds.add(recordId);
			}
		}
		bufferedReader.close();
		reportMessageMapper.saveFeedBackErrorList(feedBackReportErrorMessageList);
		Map<String, Object> conditionMap = new HashMap<>();
		conditionMap.put("table_name", tableName);
//		conditionMap.put("hist_table_name", tableName+"_hist");
		conditionMap.put("reportName", reportMessage.getReport_message_file_name());
		conditionMap.put("pk", recordIds);
		conditionMap.put("primaryKeyName", primaryKeyName);
		conditionMap.put("BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_110);
		conditionMap.put("OLD_BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_50);
		
		reportMessageMapper.UpdateBusinessStateByCondition(conditionMap);
		//将历史表中数据状态修改为20      穆楠注释
		//操作数据的流程必须为先更新当前表数据状态，再迁移数据到历史表，最后修改历史表数据状态
		/*conditionMap.put("BUSINESS_STATES", PecrConstantUtil.BUSINESS_STATUS_20);
		reportMessageMapper.UpdateBusinessStateCheckByCondition(conditionMap);*/
		
		String successNum = header.substring(58, 65);
		String failNum = header.substring(65, 72);
		reportMessage.setFk_success_number(Float.valueOf(successNum));
		reportMessage.setFk_fail_number(Float.valueOf(failNum));
		reportMessageMapper.updateByPrimaryKeySelective(reportMessage);
	}
	abstract String selectIdByJSONObject(Document reportDocument) throws Exception;

	static {
		logger = LoggerFactory.getLogger(FeedBackReportPartFailService.class);
	}
}
