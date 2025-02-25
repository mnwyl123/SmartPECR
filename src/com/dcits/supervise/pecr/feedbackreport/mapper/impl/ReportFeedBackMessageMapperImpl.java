package com.dcits.supervise.pecr.feedbackreport.mapper.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.feedbackreport.entity.FeedBackReportCode;
import com.dcits.supervise.pecr.feedbackreport.entity.FeedBackReportErrorMessage;
import com.dcits.supervise.pecr.feedbackreport.mapper.ReportFeedBackMessageMapper;
import com.dcits.supervise.pecr.generateReport.entity.ReportAndBackMessageEnt;

@Repository
public class ReportFeedBackMessageMapperImpl implements ReportFeedBackMessageMapper{

	@Resource(name="daoSupportPecr")
	private DaoSupportPecr dao;

	@Override
	public void updateByPrimaryKeySelective(ReportAndBackMessageEnt reportMessage) throws Exception {
		dao.update("ReportFeedBackMessageMapper.updateByPrimaryKeySelective", reportMessage);
	}

	@Override
	public void UpdateBusinessStateByCondition(Map<String, Object> conditionMap) throws Exception {
		dao.update("ReportFeedBackMessageMapper.UpdateBusinessStateByCondition", conditionMap);
		
	}

	@Override
	public void moveData(Map<String, Object> conditionMap) throws Exception {
		dao.save("ReportFeedBackMessageMapper.moveData", conditionMap);
	}

	@Override
	public FeedBackReportCode selectByCodeAndTag(String fbCode, String fbMsg) throws Exception {
		Map<String, String> conditionMap = new HashMap<>();
		//特殊的 fbCode
		List<String> spFbCodeLists = new ArrayList<String>();
		spFbCodeLists.add("ABD000");
		spFbCodeLists.add("ABD001");
		spFbCodeLists.add("ABE000");
		spFbCodeLists.add("CMR003");
		spFbCodeLists.add("ABE008");
		spFbCodeLists.add("ABE001");
		spFbCodeLists.add("ABE004");
		spFbCodeLists.add("CLD000");
		spFbCodeLists.add("BLD000");
		if(spFbCodeLists.toString().contains(fbCode)){
			conditionMap.put("FB_CODE", fbCode);
		}else{
			conditionMap.put("FB_CODE", fbCode);
			conditionMap.put("FB_TAG", fbMsg);
		}
		return (FeedBackReportCode) dao.findForObject("ReportFeedBackMessageMapper.selectByCodeAndTag", conditionMap);
	}
	
	@Override
	public void UpdateBusinessStateHistByCondition(Map<String, Object> conditionMap)throws Exception {
		dao.update("ReportFeedBackMessageMapper.UpdateBusinessStateHistByCondition", conditionMap);
	}
	@Override
	public void UpdateBusinessStateCheckByCondition(Map<String, Object> conditionMap)throws Exception {
		dao.update("ReportFeedBackMessageMapper.UpdateBusinessStateCheckByCondition", conditionMap);
	}
	@Override
	public void saveFeedBackErrorList(List<FeedBackReportErrorMessage> list) throws Exception {
		dao.save("ReportFeedBackMessageMapper.saveFeedBackErrorList", list);
	}

	@Override
	public ReportAndBackMessageEnt selectOneReportMessageByName(String reportName) throws Exception {
		return (ReportAndBackMessageEnt) dao.findForObject("ReportFeedBackMessageMapper.selectOneReportMessageByName", reportName);
	}

	@Override
	public String findRecordIdByConditionMap(Map<String, Object> conditionMap) throws Exception {
		return dao.findForObject("ReportFeedBackMessageMapper.findRecordIdByConditionMap", conditionMap).toString();
	}

	@Override
	public List<PageData> findFeedMessageByFilenameAndType(Map<String, Object> conditionMap) throws Exception {
		List<PageData> normalPd = (List<PageData>) dao.findForList("ReportFeedBackMessageMapper.getFeedBackErrorMessageByFilename", conditionMap);
		if(normalPd == null || normalPd.size() == 0){
			//List<PageData> specialPd = (List<PageData>) dao.findForList("ReportFeedBackMessageMapper.getFeedBackErrorMessageByFilenameSP", conditionMap);
			//normalPd.addAll(specialPd);
			normalPd = (List<PageData>) dao.findForList("ReportFeedBackMessageMapper.getFeedBackErrorMessageByFilenameSP", conditionMap);
		}
		return normalPd;
	}

	@Override
	public List<PageData> findPKByMasterPK(Map<String, Object> conditionMap) throws Exception {
		return (List<PageData>) dao.findForList("ReportFeedBackMessageMapper.findPKByMasterPK", conditionMap);
	}

	@Override
	public void insertValidateErrorMessage(List<PageData> pdLists) throws Exception {
		dao.insert("ReportFeedBackMessageMapper.insertValidateErrorMessage", pdLists);
	}

	@Override
	public void moveRealTableData(Map<String, Object> conditionMap) throws Exception {
		dao.save("ReportFeedBackMessageMapper.moveRealTableData", conditionMap);
	}

	@Override
	public void deleteRealTableData(Map<String, Object> conditionMap) throws Exception {
		dao.delete("ReportFeedBackMessageMapper.deleteRealTableData", conditionMap);
	}

	@Override
	public void deleteTableData(Map<String, Object> conditionMap) throws Exception {
		dao.delete("ReportFeedBackMessageMapper.deleteTableData", conditionMap);
	}

}
