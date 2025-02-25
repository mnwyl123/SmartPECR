package com.dcits.supervise.pecr.validateData.service.impl;

import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dcits.platform.util.UuidUtil;
import com.dcits.supervise.pecr.util.ValidateConstant;
import com.dcits.supervise.pecr.validateData.mapper.ValidateMapper;
import com.dcits.supervise.pecr.validateData.model.ValidateRules;
import com.dcits.supervise.pecr.validateData.model.ValidateTemplate;

@Transactional
@Service("analyticValidateServiceImpl_sql")
public class AnalyticValidateServiceImpl_sql extends AnalyticValidateServiceImpl
{

  @Autowired
  private ValidateMapper validateMapper;
  private static  Logger logger = LoggerFactory.getLogger(AnalyticValidateServiceImpl_sql.class);

  public String compileTemplate(ValidateTemplate validateTemplate, ValidateRules validateRule, Map<String, String> parametersMap) throws Exception
  {
    String tablePk = StringUtils.isNotBlank(validateRule.getTablePk()) ? validateRule.getTablePk() : "id";
    StringBuilder template = new StringBuilder(validateTemplate.getTemplateTpl());
//    String uuid = this.validateDatabaseService.getUUID();
    //String uuid = "upper(SYS_GUID())";
    String uuid = "'"+UuidUtil.get32UUID() + "'";
    String headerStr = " insert into " + ValidateConstant.validate_dataBase_name + "VALIDATE_ERROR_MESSAGE " + " (ID,TABLE_PK,TABLE_NAME,TABLE_FIELD,ERROR_MSG, CUR_DATE ,VALIDATE_RULES_ID, BUSINESS_PK,TABLE_NAME_CN,SUBJECT,IS_FORCE,IS_MULTI_TABLE,MASTER_TABLE_ID) " + " select " + uuid + " as id, " + " resultList." + tablePk + " as table_pk, " + " '#table_name#' as table_name, " + " '#table_field#' as table_field, " + " '#error_msg#' as error_msg, " + " '#currentDate#' as cur_date, " + " '#validate_rules_Id#' as validate_rules_Id, " + " resultList.business_pk as business_pk, " + " '#table_name_cn#' as table_name_cn, " + " '#subject#' as subject, " + " '#isForce#' as is_force, " + " '#isMultiTable#' as is_multi_table, " + " resultList.master_table_id as MASTER_TABLE_ID " + " from ( ";

    String tailStr = ")resultList";
    return template.insert(0, headerStr).append(tailStr).toString();
  }

  public Map runValidate(Object... objects) throws Exception
  {
    logger.info(objects[0].toString());
    this.validateMapper.executeSql(objects[0].toString());
    return null;
  }
}