package com.dcits.supervise.pecr.validateData.service;

import java.util.List;

import com.dcits.supervise.pecr.validateData.model.ValidateTable;
import com.dcits.supervise.pecr.validateData.vo.ValidateTableVo;

public abstract interface ValidateTableService 
{
  public abstract ValidateTable selectValidateTable(ValidateTable paramValidateTable)throws Exception;

  public abstract List<ValidateTable> selectValidateTableList()throws Exception;

  public abstract List<ValidateTableVo> selectAllTableAndField()throws Exception;
}