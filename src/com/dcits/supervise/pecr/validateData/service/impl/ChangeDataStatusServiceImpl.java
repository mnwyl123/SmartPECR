package com.dcits.supervise.pecr.validateData.service.impl;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dcits.supervise.pecr.validateData.mapper.ValidateErrorMessageMapper;
import com.dcits.supervise.pecr.validateData.mapper.ValidateMapper;
import com.dcits.supervise.pecr.validateData.model.ValidateErrorMessage;
import com.dcits.supervise.pecr.validateData.model.ValidateTable;
import com.dcits.supervise.pecr.validateData.service.ChangeDataStatusService;
import com.dcits.supervise.pecr.validateData.service.ValidateDbTypeService;

@Service
public class ChangeDataStatusServiceImpl implements ChangeDataStatusService {
	private static final Logger logger = LoggerFactory.getLogger(ChangeDataStatusServiceImpl.class);
	@Autowired
	public ValidateMapper validateMapper;
	@Autowired
	private ValidateDbTypeService validateDbTypeService;
	@Autowired
	private ValidateErrorMessageMapper validateErrorMessageMapper;

	@Override
	public boolean toValidateFailed(ValidateTable validateTable) throws Exception {
		return this.changeDataStatus(validateTable, "10");
	}

	@Override
	public boolean validatedChangeDataStatus(ValidateTable validateTable, String date) throws Exception {
		StringBuffer updateSql = new StringBuffer();
		updateSql.append("update ");
		updateSql.append(validateTable.getMasterTableEn());
		updateSql.append(" set ");
		updateSql.append("BUSINESS_STATES");
		updateSql.append("= '").append("VS").append("'");
		updateSql.append(" where RPT_DATE like '" + date + "%' and (");
		updateSql.append("BUSINESS_STATES");
		updateSql.append("= '").append("VN").append("' or ");
		updateSql.append("BUSINESS_STATES");
		updateSql.append("= '' or ");
		updateSql.append("BUSINESS_STATES");
		updateSql.append(" is null)");
		logger.info("开始更新状态" + updateSql.toString());
		validateMapper.executeSql(updateSql.toString());
		return true;
	}

	@Override
	public boolean changeDataStatus(ValidateTable validateTable, String dataStatus) throws Exception {
		StringBuffer updateSql = new StringBuffer();
		String databaseType = this.validateDbTypeService.selectValidateDbType();
		if (databaseType.equalsIgnoreCase("sqlserver")) {
			updateSql.append("update ");
			updateSql.append(validateTable.getMasterTableEn());
			updateSql.append(" set ");
			updateSql.append("BUSINESS_STATES");
			updateSql.append("= '").append(dataStatus).append("' from ");
			updateSql.append(validateTable.getMasterTableEn() + " s");
			updateSql.append(" join " + validateTable.getTableNameEn() + " j on j." + validateTable.getMasterTablePk()
					+ "=s." + validateTable.getMasterTablePk());
			updateSql
					.append(" join VALIDATE_ERROR_MESSAGE  error on j." + validateTable.getTbalePk()
							+ "=error.TABLE_PK and error.TABLE_NAME = ")
					.append("'").append(validateTable.getTableNameEn()).append("'");
		}
		if (databaseType.equalsIgnoreCase("oracle") || databaseType.equalsIgnoreCase("mysql")) {
			updateSql.append("update ");
			updateSql.append(validateTable.getMasterTableEn());
			updateSql.append(" s");
			updateSql.append(" set ");
			updateSql.append("s.BUSINESS_STATES");
			updateSql.append("=  '").append(dataStatus).append("' ");
			updateSql.append(" where exists (select 1 from VALIDATE_ERROR_MESSAGE b");
			updateSql.append(" JOIN " + validateTable.getTableNameEn() + " j" + " on b.TABLE_PK=j."
					+ validateTable.getTbalePk());
			updateSql.append(" where j." + validateTable.getMasterTablePk() + "=s." + validateTable.getMasterTablePk());
			updateSql.append(" and b.TABLE_NAME=").append("'").append(validateTable.getTableNameEn()).append("'");
			updateSql.append(" )");
		}
		validateMapper.executeSql(updateSql.toString());
		return true;
	}

	@Override
	public void changeSingleDataStatus(ValidateTable validateTable, String pk) throws Exception {
		StringBuffer updateSql = new StringBuffer();
		String status = "";
		Map<String, Object> conditionMap = new HashMap<>();
		conditionMap.put("pk", pk);
		conditionMap.put("tableName", validateTable.getTableNameEn());
		List<ValidateErrorMessage> validateErrorMessages = (List<ValidateErrorMessage>) validateErrorMessageMapper
				.selectByCondition(conditionMap);
		String masterTableId = null;
		Map<String, Object> condtempMap = null;
		if (validateErrorMessages != null && validateErrorMessages.size() > 0) {
			condtempMap = new HashMap<>();
			masterTableId = validateErrorMessages.get(0).getMasterTableId();
			condtempMap.put("masterTableId", masterTableId);
			List<ValidateErrorMessage> queryLists = (List<ValidateErrorMessage>) validateErrorMessageMapper
					.selectByCondition(condtempMap);
			if (queryLists.size() > 0) {
				status = "10";
			} else {
				status = "20";
				//20210317,新增逻辑，如果校验成功则修改 feed_back_report_err_message 中以 masterTableId 为条件的数据状态（is_edit） 
				String feedBackErrSql = "update feed_back_report_err_message set is_edit = '1' where record_id = '" + masterTableId +"'";
				validateMapper.executeSql(feedBackErrSql);
			}
		} else {
			String sql = "select " + validateTable.getMasterTablePk() + " from " + validateTable.getTableNameEn()
					+ " where " + validateTable.getTbalePk() + " = '" + pk + "'";
			List<LinkedHashMap<String, Object>> linkedHashMapList = validateMapper.querySqlByCondition(sql);
			if(linkedHashMapList != null && linkedHashMapList.size() > 0){
				masterTableId = linkedHashMapList.get(0).get(validateTable.getMasterTablePk()).toString();
			}
			condtempMap = new HashMap<>();
			condtempMap.put("masterTableId", masterTableId);
			List<ValidateErrorMessage> queryLists2 = (List<ValidateErrorMessage>) validateErrorMessageMapper
					.selectByCondition(condtempMap);
			if (queryLists2.size() > 0) {
				status = "10";
			} else {
				status = "20";
				//20210317,新增逻辑，如果校验成功则修改 feed_back_report_err_message 中以 masterTableId 为条件的数据状态（is_edit） 
				String feedBackErrSql = "update feed_back_report_err_message set is_edit = '1' where record_id = '" + masterTableId +"'";
				validateMapper.executeSql(feedBackErrSql);
			}
		}
		updateSql.setLength(0);
		updateSql.append("update ");
		updateSql.append(validateTable.getMasterTableEn());
		updateSql.append(" set ");
		updateSql.append("BUSINESS_STATES");
		updateSql.append("= '").append(status).append("'");
		updateSql.append(" where " + validateTable.getMasterTablePk() + "='" + masterTableId + "'");
		validateMapper.executeSql(updateSql.toString());
	}
}
