package com.dcits.supervise.pecr.validateData.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dcits.supervise.pecr.validateData.service.ValidateDatabaseService;
import com.dcits.supervise.pecr.validateData.service.ValidateDbTypeService;

@Service
public class ValidateDatabaseServiceImpl
  implements ValidateDatabaseService
{

  @Autowired
  private ValidateDbTypeService validateDbTypeService;

  public String getUUID() throws Exception
  {
    String databaseType = validateDbTypeService.selectValidateDbType();
    if (databaseType.equalsIgnoreCase("sqlserver")) {
      return "NEWID()";
    }
    if (databaseType.equalsIgnoreCase("oracle")) {
      return "SYS_GUID()";
    }
    if (databaseType.equalsIgnoreCase("mysql")) {
      return "UUID()";
    }
    return "";
  }

  public String getAppendStrFlag()throws Exception
  {
    String databaseType = validateDbTypeService.selectValidateDbType();
    if (databaseType.equalsIgnoreCase("sqlserver")) {
      return "+";
    }
    if (databaseType.equalsIgnoreCase("oracle")) {
      return "||";
    }
    return null;
  }
}