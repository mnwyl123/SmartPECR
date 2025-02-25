package com.dcits.supervise.pecr.validateData.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dcits.supervise.pecr.exceptions.BusinessException;
import com.dcits.supervise.pecr.util.ValidateConstant;
import com.dcits.supervise.pecr.validateData.model.ValidateField;
import com.dcits.supervise.pecr.validateData.model.ValidateMapping;
import com.dcits.supervise.pecr.validateData.model.ValidateRules;
import com.dcits.supervise.pecr.validateData.model.ValidateTable;
import com.dcits.supervise.pecr.validateData.model.ValidateTemplate;
import com.dcits.supervise.pecr.validateData.service.AnalyticValidateService;
import com.dcits.supervise.pecr.validateData.service.ChangeDataStatusService;
import com.dcits.supervise.pecr.validateData.service.ValidateErrorMessageService;
import com.dcits.supervise.pecr.validateData.service.ValidateFieldService;
import com.dcits.supervise.pecr.validateData.service.ValidateMappingService;
import com.dcits.supervise.pecr.validateData.service.ValidateParameterService;
import com.dcits.supervise.pecr.validateData.service.ValidateRulesService;
import com.dcits.supervise.pecr.validateData.service.ValidateService;
import com.dcits.supervise.pecr.validateData.service.ValidateTableService;
import com.dcits.supervise.pecr.validateData.service.ValidateTemplateService;
import com.dcits.supervise.pecr.validateData.vo.ValidateDataVo;

@Service
@Transactional
public class ValidateServiceImpl implements ValidateService {
	@Autowired
	private ValidateRulesService validateRulesService;
	@Autowired
	private ValidateTemplateService validateTemplateService;
	@Autowired
	private ValidateParameterService validateParameterService;
	@Autowired
	private ValidateFieldService validateFieldService;
	@Autowired
	private ValidateErrorMessageService validateErrorMessageService;
	@Autowired
	private ChangeDataStatusService changeDataStatusService;
	@Autowired
	private ValidateTableService validateTableService;
	@Autowired
	private ValidateMappingService validateMappingService;
	@Resource(name = "analyticValidateServiceImpl_sql")
	private AnalyticValidateService analyticValidateService;
	private static final Logger logger;

	// ValidateDataVo:包含表名、主键、当前date、状态、主表ID
	// publicParametersMap:空的HashMap
	// isMulti：false
	// ValidateTable：表信息：主键ID、表英文名、表中文名、对应主表名称、主表主键、校验表主键
	public synchronized List<Map<Object, Object>> validationData(List<ValidateDataVo> validateSingleVoList,
			Map<String, String> publicParametersMap, boolean isMulti) throws Exception {
		logger.info("准备校验：{}", validateSingleVoList.toString());
		List<Map<Object, Object>> resultMapList = new ArrayList<Map<Object, Object>>();
		ValidateTable validateTableCase = null;
		ValidateTable validateTable = null;
		Map<Object, Object> itemMap;
		boolean validateResult;
		List<String> types;
		List<ValidateRules> validateRulesList;
		for (ValidateDataVo x : validateSingleVoList) {
			if (StringUtils.isNotBlank(x.getCurrentDate()) || !isMulti) {
				if (!isMulti) {
					publicParametersMap.put("tablePk", x.getPk());
					x.setCurrentDate("");
				}
				validateTableCase = new ValidateTable();
				validateTableCase.setTableNameEn(x.getTableName());
				validateTable = validateTableService.selectValidateTable(validateTableCase);
				if (validateTable != null) {
					logger.info("开始校验{}表", x.getTableName());
					logger.info("开始删除：{}表错误信息", x.getTableName());
					// 删除对应表的当前
					validateErrorMessageService.delErrorMessage(x.getCurrentDate(), x.getTableName(),
							ValidateConstant.N, isMulti, x.getPk());
					// ValidateConstant.N isMultiTable 多表关联
					logger.info("删除完成：{}表错误信息", x);
					itemMap = new HashMap<Object, Object>(16);
					validateResult = true;
					types = new ArrayList<String>();
					types.add(ValidateConstant.VALIDATERULESTYPE_SQL);
					types.add(ValidateConstant.VALIDATERULESTYPE_PROUDUCE);
					//validateRulesList = new ArrayList<>();
					// 获取当前表的校验规则
					validateRulesList = this.validateRulesService.getValidateRulesList(x.getTableName(), types,
							ValidateConstant.N);
					// validateRulesList list<ValidateRules>
					logger.info("{}表校验规则：{}条", x.getTableName(), validateRulesList.size());
					if (validateRulesList.size() > 0) {
						logger.info("开始校验：{}", x.getTableName());
						// y validateRules; publicParametersMap ("tablePk",
						// x.getPk()); isMulti false;
						for (ValidateRules y : validateRulesList) {
							_validationData(y, publicParametersMap, x.getCurrentDate(), isMulti);
						}
						logger.info("校验结束：{}", x.getTableName());
						validateResult = validateErrorMessageService.validateResult(x.getTableName(), x.getPk());
						itemMap.put(x, validateResult);
					}
					logger.info("开始改变状态：{}", x.getTableName());
					if (isMulti) {
						changeDataStatusService.toValidateFailed(validateTable);
						changeDataStatusService.validatedChangeDataStatus(validateTable, x.getCurrentDate());
					} else {
						changeDataStatusService.changeSingleDataStatus(validateTable, x.getPk());
						if (validateResult && "RKSB".equals(x.getStatus())) {
							validateErrorMessageService.delFeedBackReportMessage(x.getPk());
						}
					}
					logger.info("改变状态结束：{}", x.getTableName());
					resultMapList.add(itemMap);
				} else {
					logger.info("未配置校验表信息:" + x.getTableName());
				}
				logger.info("校验结束{}表", x.getTableName());
			} else {
				logger.info("档期参数格式不正确:{}", (x.getCurrentDate() + "正确格式:YYYYMM或YYYYMMDD"));
				throw new BusinessException("档期参数格式不正确");
			}
		}
		return resultMapList;
	}

	// validateRule validateRules; parametersMap ("tablePk", x.getPk()); isMulti
	// false;
	private Map _validationData(ValidateRules validateRule, Map<String, String> parametersMap, String currentDate,
			boolean isMulti) throws Exception {
		// 获取validate_parameter表中的数据
		// parametersMap.putAll(this.validateParameterService.getSystemDefParameterList());
		// parametersMap 参数Map
		if (StringUtils.isBlank(validateRule.getTemplateName())) {
			throw new NullPointerException("模板为空…对应规则ID：" + validateRule.getId());
		}
		// 依据查出来的validateRule的TEMPLATE_NAME值去validate_template表中查出对应的数据
		ValidateTemplate validateTemplateDb = validateTemplateService
				.getValidateTemplate(validateRule.getTemplateName());
		// cloneBean 克隆 validateTemplateDb
		ValidateTemplate validateTemplate = (ValidateTemplate) BeanUtils.cloneBean(validateTemplateDb);
		// 通过validateRule的ID获取validateRule的ID表中VALIDATE_RULES_ID同validateRule的ID相同的数据
		List<ValidateMapping> validateMappingList = validateMappingService.getValidateMappingList(validateRule.getId());
		List<String> validateParameterList = new ArrayList<String>();
		String param;
		// 便利 validateRule的ID
		// list的值是VALIDATE_PARAMETER_NAME的集合
		for (ValidateMapping x : validateMappingList) {
			param = x.getValidateParameterName();
			if (param != null) {
				validateParameterList.add(param);
			}
		}
		// ？？？？？为何对空的validateParameterList进行判断
		if (validateParameterList.size() > 0) {
			parametersMap.putAll(validateParameterService.getValidateParameterList(validateParameterList));
		}

		// 此时parametersMap含有表名，表主键，validate_parameter表中的数据
		parametersMap.put("table_name", validateRule.getTableName());

		ValidateTable validateTableCase = new ValidateTable();
		validateTableCase.setTableNameEn(validateRule.getTableName());
		// 通过表中文名或英文名获取validate_table表中对应数据
		ValidateTable validateTable = validateTableService.selectValidateTable(validateTableCase);
		parametersMap.put("master_table_id", validateTable.getMasterTablePk());
		parametersMap.put("table_name_cn", validateTable.getTableNameCn());

		// 获取validate_field表中对应的数据
		if (StringUtils.isNotBlank(validateRule.getTableField())) {
			String tableField = validateRule.getTableField();
			String tableFieldCn = validateRule.getTableField();
			if (StringUtils.isNotBlank(tableField)) {
				ValidateField validateFieldCase = new ValidateField();
				validateFieldCase.setFieldNameEn(validateRule.getTableField());
				validateFieldCase.setTableId(validateTable.getTableId());
				ValidateField validateField = validateFieldService.selectValidateField(validateFieldCase);
				if (validateField != null) {
					tableFieldCn = validateField.getFieldNameCn();
				}
			}
			parametersMap.put("table_field", validateRule.getTableField());
			parametersMap.put("table_field_cn",
					StringUtils.isNotBlank(tableFieldCn) ? tableFieldCn : validateRule.getTableField());
		}
		parametersMap.put("validate_rules_Id", validateRule.getId());
		parametersMap.put("currentDate", currentDate);
		parametersMap.put("isMultiTable", validateRule.getIsMultiTable());
		parametersMap.put("table_pk", validateRule.getTablePk());
		parametersMap.put("validate_date", "RPT_DATE");
		parametersMap.put("subject", validateRule.getSubject());
		parametersMap.put("isForce", validateRule.getIsForce());
		// 依据数据库中validateTemplate的ServiceName名称获取对象。
		// AnalyticValidateService analyticValidateService =
		// (AnalyticValidateService)SpringContextUtil.getBean(validateTemplate.getServiceName());
		// 将maping表中错误信息等拼接成错误描述，
		validateTemplate
				.setErrorMsg(analyticValidateService.fieldMapping(validateTemplate.getErrorMsg(), validateMappingList));

		parametersMap.put("error_msg",
				analyticValidateService.renderErrorMessage(validateTemplate, parametersMap, validateRule));

		// sql类型的validateTemplate写入TemplateTpl
		if (!ValidateConstant.VALIDATERULESTYPE_PROUDUCE.equals(validateRule.getRuleType())) {
			validateTemplate.setTemplateTpl(
					analyticValidateService.validateTemplate(validateTemplate.getTemplateTpl(), isMulti));
			validateTemplate.setTemplateTpl(
					analyticValidateService.fieldMapping(validateTemplate.getTemplateTpl(), validateMappingList));
			validateTemplate.setTemplateTpl(
					analyticValidateService.compileTemplate(validateTemplate, validateRule, parametersMap));
			String resultStr = analyticValidateService.renderTemplate(validateTemplate, parametersMap);
			return analyticValidateService.runValidate(resultStr, parametersMap);
		}

		validateTemplate
				.setTemplateTpl(analyticValidateService.validateTemplate(validateTemplate.getTemplateTpl(), isMulti));
		validateTemplate.setTemplateTpl(
				analyticValidateService.fieldMapping(validateTemplate.getTemplateTpl(), validateMappingList));
		String resultStr = analyticValidateService.renderTemplate(validateTemplate, parametersMap);
		analyticValidateService.runValidate(resultStr, parametersMap);
		String sql = "call " + validateTemplate.getTemplateName() + "()";
		if (!validateTemplate.getTemplateTpl().equalsIgnoreCase(sql)
				&& !validateTemplate.getTemplateTpl().toLowerCase().startsWith("call")) {
			return analyticValidateService.runValidate(sql);
		}
		return null;
	}

	static {
		logger = LoggerFactory.getLogger(ValidateServiceImpl.class);
	}
}
