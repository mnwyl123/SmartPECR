package com.dcits.supervise.pecr.validateData.service;

import java.util.List;

import com.dcits.supervise.pecr.validateData.model.ValidateRules;

public abstract interface ValidateRulesService
{
  public abstract List<ValidateRules> getValidateRulesList(String paramString1, List<String> paramList, String paramString2)throws Exception;
}