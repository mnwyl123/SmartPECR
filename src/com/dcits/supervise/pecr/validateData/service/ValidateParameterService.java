package com.dcits.supervise.pecr.validateData.service;

import java.util.List;
import java.util.Map;

public abstract interface ValidateParameterService
{
  public abstract Map<String, String> getValidateParameterList(List<String> paramList)throws Exception;

  public abstract Map<String, String> getSystemDefParameterList()throws Exception;
}