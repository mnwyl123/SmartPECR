package com.dcits.supervise.pecr.validateData.mapper;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.dcits.common.DaoSupportPecr;
import com.dcits.supervise.pecr.validateData.model.ValidateField;

@Repository
public class ValidateFieldMapper 
{
	@Resource(name = "daoSupportPecr")
    private DaoSupportPecr dao;
	
	public ValidateField selectOneByCondition(Map<String, Object> conditionMap) throws Exception{
		return (ValidateField) dao.findForObject("ValidateFieldMapper.selectOneByCondition", conditionMap);
	}
	@SuppressWarnings("unchecked")
	public List<ValidateField> selectByCondition(Map<String, Object> conditionMap) throws Exception{
		return (List<ValidateField>) dao.findForList("ValidateFieldMapper.selectByCondition", conditionMap);
	}
}