package com.dcits.supervise.pecr.validateData.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.validateData.mapper.ValidateErrorMessageMapper;
import com.dcits.supervise.pecr.validateData.mapper.ValidateMapper;
import com.dcits.supervise.pecr.validateData.model.ValidateErrorMessage;
import com.dcits.supervise.pecr.validateData.service.ValidateErrorMessageService;
import com.dcits.supervise.pecr.validateData.vo.ValidateDataVo;

@Service
@Transactional
public class ValidateErrorMessageServiceImpl implements ValidateErrorMessageService {
	@Autowired
	private ValidateErrorMessageMapper validateErrorMessageMapper;
	@Autowired
	private ValidateMapper validateMapper;
	@Resource(name = "daoSupportPecr")
    private DaoSupportPecr dao;

	@Override
	public boolean validateResult(String tableName) {
		Map<String, Object> conditionMap = new HashMap<>();
		conditionMap.put("tableName", tableName);
		conditionMap.put("pk", "");
		Long count = -1L;
		try {
			count = validateErrorMessageMapper.countByCondition(conditionMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count == 0L;
	}

	@Override
	public boolean validateResult(String tableName, String pk) {
		Map<String, Object> conditionMap = new HashMap<>();
		conditionMap.put("tableName", tableName);
		conditionMap.put("pk", pk);
		Long count = -1L;
		try {
			count = validateErrorMessageMapper.countByCondition(conditionMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count == 0L;
	}

	public List<String> validateResultByTableName(String tableName) throws Exception {
		List<String> list = new ArrayList<>();
		Map<String, Object> conditionMap = new HashMap<>();
		conditionMap.put("tableName", tableName);
		List<ValidateErrorMessage> validateErrorMessages = (List<ValidateErrorMessage>) validateErrorMessageMapper
				.selectByCondition(conditionMap);
		for (ValidateErrorMessage validateErrorMessage : validateErrorMessages) {
			list.add(validateErrorMessage.getTablePk());
		}
		return list;
	}

	public List<ValidateErrorMessage> selectErrorMessage(String tableName, String tablePk) throws Exception {
		Map<String, Object> conditionMap = new HashMap<>();
		conditionMap.put("tableName", tableName);
		conditionMap.put("pk", tablePk);
		List<ValidateErrorMessage> validateErrorMessages = (List<ValidateErrorMessage>) validateErrorMessageMapper
				.selectByCondition(conditionMap);
		return validateErrorMessages;
	}

	/**
	 * 删除检验错误数据
	 * 
	 * @param currentDate
	 * @param tableName
	 * @param isMultiTable
	 * @param isMulti
	 * @param pk
	 */
	public void delErrorMessage(String currentDate, String tableName, String isMultiTable, boolean isMulti, String pk) {
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		conditionMap.put("currentDate", currentDate);
		conditionMap.put("tableName", tableName);
		conditionMap.put("isMultiTable", isMultiTable);
		conditionMap.put("pk", pk);
		try {
			validateErrorMessageMapper.deleteErrorMessage(conditionMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void truncateMessage() throws Exception {
		this.validateMapper.executeSql("truncate table VALIDATE_ERROR_MESSAGE");
	}

	public List<LinkedHashMap<String, Object>> getValidateErrorMessage(List<ValidateDataVo> validateDataVoList)
			throws Exception {
		Map<String, Object> conditionMap = new HashMap<>();
		List<String> tableNames = new ArrayList<>();
		List<String> tablePks = new ArrayList<>();
		for (ValidateDataVo validateDataVo : validateDataVoList) {
			tableNames.add(validateDataVo.getTableName().toString());
			tablePks.add(validateDataVo.getPk().toString());
		}
		conditionMap.put("tableNames", tableNames);
		conditionMap.put("tablePks", tablePks);
		return validateErrorMessageMapper.selectListByCondition(conditionMap);
	}

	public void delFeedBackReportMessage(String record) throws Exception {
		StringBuffer sql = new StringBuffer();
		sql.append("delete from feed_back_report_err_message where RECORD_ID='" + record + "'");
		this.validateMapper.executeSql(sql.toString());
	}

	@Override
	public List<ValidateErrorMessage> selectErrorMessageByTablePK(List<String> lists) throws Exception {
		return (List<ValidateErrorMessage>) dao.findForList("ValidateErrorMessageMapper.selectErrorMessageByTablePK", lists);
	}
	
	@Override
	public List<ValidateErrorMessage> selectErrorMessageByMasterTablePK(String PKString) throws Exception {
		return (List<ValidateErrorMessage>) dao.findForList("ValidateErrorMessageMapper.selectErrorMessageByMasterTablePK", PKString);
	}

}
