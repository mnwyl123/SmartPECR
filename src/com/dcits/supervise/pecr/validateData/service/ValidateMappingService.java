package com.dcits.supervise.pecr.validateData.service;

import java.util.List;

import com.dcits.supervise.pecr.validateData.model.ValidateMapping;

public abstract interface ValidateMappingService
{
  public abstract List<ValidateMapping> getValidateMappingList(String paramString)throws Exception;

  public abstract void deleteValidateMapping(ValidateMapping paramValidateMapping)throws Exception;
}