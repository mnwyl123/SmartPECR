package com.dcits.supervise.pecr.validateData.service;

import java.util.List;
import java.util.Map;

import com.dcits.supervise.pecr.validateData.vo.ValidateDataVo;

public abstract interface ValidateService 
{
  public abstract List<Map<Object, Object>> validationData(List<ValidateDataVo> paramList, Map<String, String> paramMap, boolean paramBoolean)throws Exception;
//
//  public abstract List<Map> validationViewPageData_add(String paramString1, Map paramMap, String paramString2)throws Exception;
//
//  public abstract List<Map> validationViewPageData_update(String paramString1, Map paramMap, String paramString2)throws Exception;
//
//  public abstract List<Map> validationMultiTable(List<String> paramList, Map<String, String> paramMap, String paramString);
}