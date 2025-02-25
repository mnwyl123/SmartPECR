package com.dcits.supervise.pecr.validateData.service;

import com.dcits.supervise.pecr.validateData.model.ValidateTable;

public abstract interface ChangeDataStatusService
{


  public abstract boolean toValidateFailed(ValidateTable paramValidateTable)throws Exception;

  public abstract boolean validatedChangeDataStatus(ValidateTable paramValidateTable, String paramString)throws Exception;

  public abstract boolean changeDataStatus(ValidateTable paramValidateTable, String paramString)throws Exception;

  public abstract void changeSingleDataStatus(ValidateTable paramValidateTable, String paramString)throws Exception;
}
