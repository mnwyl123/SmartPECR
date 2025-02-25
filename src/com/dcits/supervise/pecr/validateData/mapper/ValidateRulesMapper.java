package com.dcits.supervise.pecr.validateData.mapper;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.dcits.common.DaoSupportPecr;
import com.dcits.supervise.pecr.validateData.model.ValidateRules;

@Repository
public class ValidateRulesMapper
{
	@Resource(name="daoSupportPecr")
	private DaoSupportPecr dao;
	
	@SuppressWarnings("unchecked")
	public List<ValidateRules> selectByCondition(Map<String, Object> map)throws Exception{
		return (List<ValidateRules>) dao.findForList("ValidateRulesMapper.selectByCondition", map);
	}
}
