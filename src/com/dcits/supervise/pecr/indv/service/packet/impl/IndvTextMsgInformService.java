package com.dcits.supervise.pecr.indv.service.packet.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.indv.entity.SendInform;
import com.dcits.supervise.pecr.indv.service.packet.IndvTextMsgInformManager;

@Service
public class IndvTextMsgInformService implements IndvTextMsgInformManager {

	@Resource(name = "daoSupportPecr")
	private DaoSupportPecr dao;

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> selectInformInfo(Page page)
			throws Exception {
		return (List<Map<String, Object>>) dao.findForList(
				"IndvTextMsgInformMapper.selectInformInfo", page);
	}

	@Override
	public int selectInformCount(Map<String, Object> msgData) throws Exception {
		return (int) dao.findForObject(
				"IndvTextMsgInformMapper.selectInformCount", msgData);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> getPecrSendMsgPmt(
			Map<String, Object> msgData) throws Exception {
		return (List<Map<String, Object>>) dao.findForList(
				"IndvTextMsgInformMapper.getPecrSendMsgPmt", msgData);
	}

	@Override
	public int selectSendCount(Map<String, Object> msgData) throws Exception {
		return (int) dao.findForObject(
				"IndvTextMsgInformMapper.selectSendCount", msgData);
	}

	@Override
	public void insertSendMsgInformInfo(Map<String, Object> msgData)
			throws Exception {
		dao.save("IndvTextMsgInformMapper.insertSendMsgInformInfo", msgData);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<SendInform> selectsendListGivenStatus(
			Map<String, Object> selectMap) throws Exception {
		return (List<SendInform>) dao.findForList(
				"IndvTextMsgInformMapper.selectsendListGivenStatus", selectMap);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<SendInform> selectsendListCon(Map<String, Object> selectMap)
			throws Exception {
		return (List<SendInform>) dao.findForList(
				"IndvTextMsgInformMapper.selectsendListCon", selectMap);
	}

	@Override
	public void updateGlobalNo(Map<String, Object> msgData) {
		try {
			dao.update("IndvTextMsgInformMapper.updateGlobalNo", msgData);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> getMessageCountList(
			Map<String, Object> msgData) throws Exception {
		return (List<Map<String, Object>>) dao.findForList(
				"IndvTextMsgInformMapper.getMessageCountList", msgData);
	}

	@Override
	public int selectSendViewCount(Map<String, Object> msgData)
			throws Exception {
		return (int) dao.findForObject(
				"IndvTextMsgInformMapper.selectSendViewCount", msgData);
	}

	@Override
	public void deleteSendTextInfo(Map<String, Object> msgData)
			throws Exception {
		dao.delete("IndvTextMsgInformMapper.deleteSendTextInfo", msgData);
	}

	@Override
	public int selectInformStateCount(Map<String, Object> msgData)
			throws Exception {
		return (int) dao.findForObject(
				"IndvTextMsgInformMapper.selectInformStateCount", msgData);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> getGivenStatusGlobal(
			Map<String, Object> msgData) throws Exception {
		return (List<Map<String, Object>>) dao.findForList(
				"IndvTextMsgInformMapper.getGivenStatusGlobal", msgData);
	}

	@Override
	public void updateGlobalStatusFalse(Map<String, Object> msgData)
			throws Exception {
		dao.update("IndvTextMsgInformMapper.updateGlobalStatusFalse", msgData);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> selectInformCountGivenStatus(
			Map<String, Object> msgData) throws Exception {
		return (List<Map<String, Object>>) dao
				.findForList(
						"IndvTextMsgInformMapper.selectInformCountGivenStatus",
						msgData);
	}

	@SuppressWarnings("unchecked")
	@Override
	public Map<String, Object> findOneTextMsgInfo(PageData pd) throws Exception {
		return (Map<String, Object>) dao.findForList(
				"IndvTextMsgInformMapper.findOneTextMsgInfo", pd);
	}
}
