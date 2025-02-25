package com.dcits.supervise.pecr.validateData.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.dcits.supervise.pecr.validateData.mapper.ValidateFieldMapper;
import com.dcits.supervise.pecr.validateData.model.ValidateField;
import com.dcits.supervise.pecr.validateData.service.ValidateFieldService;

@Service
public class ValidateFieldServiceImpl implements ValidateFieldService
{
    @Autowired
    private ValidateFieldMapper validateFieldMapper;
    
    public ValidateField selectValidateField( ValidateField validateField) throws Exception {
    		Map<String, Object> conditionMap = new HashMap<String, Object>();
        if (!StringUtils.isEmpty((Object)validateField.getFieldNameEn())) {
        	conditionMap.put("FIELD_NAME_EN", validateField.getFieldNameEn());
        }
        if (!StringUtils.isEmpty((Object)validateField.getTableId())) {
        	conditionMap.put("TABLE_ID", validateField.getTableId());
        }
        return (ValidateField)validateFieldMapper.selectOneByCondition(conditionMap);
    }
    
    public List<ValidateField> selectValidateFieldList( ValidateField validateField)throws Exception {
    	Map<String, Object> conditionMap = new HashMap<String, Object>();
        if (!StringUtils.isEmpty((Object)validateField.getFieldNameEn())) {
        	conditionMap.put("FIELD_NAME_EN", validateField.getFieldNameEn());
        }
        if (!StringUtils.isEmpty((Object)validateField.getTableId())) {
        	conditionMap.put("TABLE_ID", validateField.getTableId());
        }
        return (List<ValidateField>)validateFieldMapper.selectByCondition(null);
    }
    
}
