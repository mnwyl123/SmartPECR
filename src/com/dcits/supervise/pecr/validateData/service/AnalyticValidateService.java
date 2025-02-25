package com.dcits.supervise.pecr.validateData.service;

import java.util.List;
import java.util.Map;

import com.dcits.supervise.pecr.validateData.model.ValidateMapping;
import com.dcits.supervise.pecr.validateData.model.ValidateRules;
import com.dcits.supervise.pecr.validateData.model.ValidateTemplate;

public abstract interface AnalyticValidateService
{
  public abstract String compileTemplate(ValidateTemplate paramValidateTemplate, ValidateRules paramValidateRules, Map<String, String> paramMap)throws Exception;

  public abstract Map runValidate(Object... objects)throws Exception;

  public abstract String fieldMapping(String paramString, List<ValidateMapping> paramList)throws Exception;

  public abstract String renderTemplate(ValidateTemplate paramValidateTemplate, Map<String, String> paramMap)throws Exception;

  public abstract String renderErrorMessage(ValidateTemplate paramValidateTemplate, Map<String, String> paramMap, ValidateRules paramValidateRules)throws Exception;

  public abstract String validateTemplate(String paramString, boolean paramBoolean)throws Exception;
}
