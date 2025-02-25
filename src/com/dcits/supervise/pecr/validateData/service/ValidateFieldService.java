package com.dcits.supervise.pecr.validateData.service;

import java.util.List;

import com.dcits.supervise.pecr.validateData.model.ValidateField;

public abstract interface ValidateFieldService 
{
  public abstract ValidateField selectValidateField(ValidateField paramValidateField)throws Exception;

  public abstract List<ValidateField> selectValidateFieldList(ValidateField paramValidateField)throws Exception;
}