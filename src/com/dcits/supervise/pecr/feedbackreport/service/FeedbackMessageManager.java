package com.dcits.supervise.pecr.feedbackreport.service;

import java.util.List;
import java.util.Map;

import com.dcits.platform.entity.Page;
import com.dcits.supervise.pecr.feedbackreport.entity.FeedBackReportErrorMessage;

public interface FeedbackMessageManager {
	/**
	 * 获取回执信息
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getFeedbackMsgList(Page page) throws Exception;
	/**
	 * 获取对应主键数据的反馈信息
	 * @param conditionMap
	 * @return
	 * @throws Exception
	 */
	public List<FeedBackReportErrorMessage> getFeedBackErrorMessageByPk(Map<String, Object> conditionMap)throws Exception;
	
	/**
	 * 根据报文名等信息分组列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, String>> getFeedbackReportNameList(Page page) throws Exception;

}
