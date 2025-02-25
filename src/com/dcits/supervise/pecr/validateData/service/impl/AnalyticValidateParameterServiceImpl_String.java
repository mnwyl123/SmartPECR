package com.dcits.supervise.pecr.validateData.service.impl;

import org.springframework.stereotype.Service;

import com.dcits.supervise.pecr.validateData.model.ValidateParameter;
import com.dcits.supervise.pecr.validateData.service.AnalyticValidateParameterService;

@Service("analyticValidateParameterServiceImpl_string")
public class AnalyticValidateParameterServiceImpl_String
  implements AnalyticValidateParameterService
{
  public String analyticValidateParameter(ValidateParameter validateParameter)
  {
    return validateParameter.getParameterValue();
  }
}