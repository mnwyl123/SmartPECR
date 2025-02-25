package com.dcits.supervise.pecr.validateData.mapper;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.dcits.common.DaoSupportPecr;
import com.dcits.supervise.pecr.validateData.model.ValidateDbType;

@Repository
public class ValidateDbTypeMapper
{
	@Resource(name="daoSupportPecr")
	private DaoSupportPecr dao;
	
	public ValidateDbType selectOneByCondition(Map<String, Object> map) throws Exception{
		return (ValidateDbType) dao.findForObject("ValidateDbTypeMapper.selectOneByCondition", map); 
	}
	
	@SuppressWarnings("unchecked")
	public List<ValidateDbType> selectByCondition(Map<String, Object> map) throws Exception{
		return (List<ValidateDbType>) dao.findForList("ValidateDbTypeMapper.selectByCondition", map); 
	}
}
