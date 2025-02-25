package com.dcits.supervise.pecr.validateData.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dcits.supervise.pecr.validateData.mapper.ValidateDbTypeMapper;
import com.dcits.supervise.pecr.validateData.model.ValidateDbType;
import com.dcits.supervise.pecr.validateData.service.ValidateDbTypeService;

@Service
@Transactional
public class ValidateDbTypeServiceImpl implements ValidateDbTypeService
{
    @Autowired
    private ValidateDbTypeMapper validateDbTypeMapper;
    
    public List<ValidateDbType> selectValidateDbTypeList() throws Exception {
        Map<String, Object> map = new HashMap<>();
    	map.put("IS_CURRENT", "Y");
        return (List<ValidateDbType>)validateDbTypeMapper.selectByCondition(map);
    }
    
    
    public String selectValidateDbType() throws Exception {
    	Map<String, Object> map = new HashMap<>();
    	map.put("IS_CURRENT", "Y");
    	ValidateDbType validateDbType = validateDbTypeMapper.selectOneByCondition(map);
        return validateDbType.getDbName();
    }
    
}
