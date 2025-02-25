package com.dcits.supervise.pecr.validateData.service;

import java.util.LinkedHashMap;
import java.util.List;

import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.validateData.model.ValidateErrorMessage;
import com.dcits.supervise.pecr.validateData.vo.ValidateDataVo;

public abstract interface ValidateErrorMessageService {
	public abstract boolean validateResult(String paramString) throws Exception;

	public abstract boolean validateResult(String paramString, String pk) throws Exception;

	public abstract List<String> validateResultByTableName(String paramString) throws Exception;

	public abstract List<ValidateErrorMessage> selectErrorMessage(String paramString1, String paramString2)
			throws Exception;

	public abstract void delErrorMessage(String paramString1, String paramString2, String paramString3,
			boolean paramBoolean, String paramString4);

	public abstract void truncateMessage() throws Exception;

	public abstract List<LinkedHashMap<String, Object>> getValidateErrorMessage(List<ValidateDataVo> paramList)
			throws Exception;

	public abstract void delFeedBackReportMessage(String paramString) throws Exception;
	
	public List<ValidateErrorMessage> selectErrorMessageByTablePK(List<String> lists) throws Exception;
	
	public List<ValidateErrorMessage> selectErrorMessageByMasterTablePK(String PKString) throws Exception;
}
