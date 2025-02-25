package com.dcits.supervise.pecr.indv.service.packet;

import java.util.List;
import java.util.Map;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.indv.entity.SendInform;

public interface IndvTextMsgInformManager {

	public List<Map<String, Object>> selectInformInfo(Page page)
			throws Exception;

	public int selectInformCount(Map<String, Object> msgData) throws Exception;

	public List<Map<String, Object>> getPecrSendMsgPmt(Map<String, Object> msgData)
			throws Exception;

	public int selectSendCount(Map<String, Object> msgData) throws Exception;

	public void insertSendMsgInformInfo(Map<String, Object> msgData)
			throws Exception;

	public List<SendInform> selectsendListGivenStatus(
			Map<String, Object> selectMap) throws Exception;

	public List<SendInform> selectsendListCon(Map<String, Object> selectMap)
			throws Exception;

	public void updateGlobalNo(Map<String, Object> msgData);

	public List<Map<String, Object>> getMessageCountList(
			Map<String, Object> msgData) throws Exception;

	public int selectSendViewCount(Map<String, Object> msgData)
			throws Exception;

	public void deleteSendTextInfo(Map<String, Object> msgData)
			throws Exception;

	public int selectInformStateCount(Map<String, Object> msgData)
			throws Exception;

	public List<Map<String, Object>> getGivenStatusGlobal(
			Map<String, Object> msgData) throws Exception;

	public void updateGlobalStatusFalse(Map<String, Object> msgData)
			throws Exception;

	public List<Map<String, Object>> selectInformCountGivenStatus(
			Map<String, Object> msgData) throws Exception;

	public Map<String, Object> findOneTextMsgInfo(PageData pd) throws Exception;

}
