package com.dcits.supervise.pecr.validateData.mapper;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.dcits.common.DaoSupportPecr;
import com.dcits.supervise.pecr.validateData.model.ValidateTemplate;

@Repository
public class ValidateTemplateMapper
{
	@Resource(name="daoSupportPecr")
	private DaoSupportPecr dao;
	
	@SuppressWarnings("unchecked")
	public List<ValidateTemplate> selectByCondition(Map<String, Object> map)throws Exception{
		return (List<ValidateTemplate>) dao.findForList("ValidateTemplateMapper.selectByCondition", map);
	}
}
