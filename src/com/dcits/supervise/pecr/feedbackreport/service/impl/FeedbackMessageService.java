package com.dcits.supervise.pecr.feedbackreport.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.entity.Page;
import com.dcits.supervise.pecr.feedbackreport.entity.FeedBackReportErrorMessage;
import com.dcits.supervise.pecr.feedbackreport.service.FeedbackMessageManager;
@Service
public class FeedbackMessageService implements FeedbackMessageManager{

	@Resource(name = "daoSupportPecr")
    private DaoSupportPecr dao;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> getFeedbackMsgList(Page page) throws Exception {
		return  (List<Map<String, Object>>) dao.findForList("FeedbackMessageMapper.getFeedbackMsglistPage", page);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<FeedBackReportErrorMessage> getFeedBackErrorMessageByPk(Map<String, Object> conditionMap) throws Exception {
		return (List<FeedBackReportErrorMessage>) dao.findForList("ReportFeedBackMessageMapper.getFeedBackErrorMessageByPk", conditionMap);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, String>> getFeedbackReportNameList(Page page) throws Exception {
		// TODO Auto-generated method stub
		return (List<Map<String, String>>) dao.findForList("FeedbackMessageMapper.getFeedbackReportNamelistPage", page);
	}

}
