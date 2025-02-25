package com.dcits.supervise.pecr.validateData.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dcits.supervise.pecr.validateData.mapper.ValidateRulesMapper;
import com.dcits.supervise.pecr.validateData.model.ValidateRules;
import com.dcits.supervise.pecr.validateData.service.ValidateRulesService;

@Service
public class ValidateRulesServiceImpl implements ValidateRulesService
{
    @Autowired
    private ValidateRulesMapper validateRulesMapper;
    
    public List<ValidateRules> getValidateRulesList( String tableName,  List<String> types,  String isMultiTable) throws Exception {
        Map<String, Object> conditionMap = new HashMap<String, Object>();
        conditionMap.put("tableName", tableName);
        conditionMap.put("types", types);
        conditionMap.put("isMultiTable", isMultiTable);
        return (List<ValidateRules>)validateRulesMapper.selectByCondition(conditionMap);
    }
}
