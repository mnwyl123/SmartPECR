package com.dcits.supervise.pecr.validateData.service;

import com.dcits.supervise.pecr.validateData.model.ValidateTemplate;

public abstract interface ValidateTemplateService
{
  public abstract ValidateTemplate getValidateTemplate(String paramString)
    throws Exception;

}