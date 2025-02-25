package com.dcits.supervise.pecr.validateData.service;

import java.util.List;

import com.dcits.supervise.pecr.validateData.model.ValidateDbType;

public interface ValidateDbTypeService 
{
    List<ValidateDbType> selectValidateDbTypeList()throws Exception;
    
    String selectValidateDbType()throws Exception;
}