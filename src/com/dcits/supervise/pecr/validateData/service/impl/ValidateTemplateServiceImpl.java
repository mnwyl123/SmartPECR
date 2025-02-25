package com.dcits.supervise.pecr.validateData.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dcits.supervise.pecr.validateData.mapper.ValidateTemplateMapper;
import com.dcits.supervise.pecr.validateData.model.ValidateTemplate;
import com.dcits.supervise.pecr.validateData.service.ValidateTemplateService;

@Service
@Transactional
public class ValidateTemplateServiceImpl implements ValidateTemplateService
{
    @Autowired
    private ValidateTemplateMapper validateTemplateMapper;
    
    @Override
    public ValidateTemplate getValidateTemplate(String name) throws Exception {
    	Map<String, Object> conditionMap = new HashMap<String, Object>();
    	conditionMap.put("TEMPLATE_NAME", name);
         List<ValidateTemplate> validateTemplateList = (List<ValidateTemplate>)validateTemplateMapper.selectByCondition(conditionMap);
        return (validateTemplateList.size() == 0) ? null : validateTemplateList.get(0);
    }
}

