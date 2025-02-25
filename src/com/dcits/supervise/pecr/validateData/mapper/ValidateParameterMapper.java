package com.dcits.supervise.pecr.validateData.mapper;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.dcits.common.DaoSupportPecr;
import com.dcits.supervise.pecr.validateData.model.ValidateParameter;

@Repository
public class ValidateParameterMapper
{
	@Resource(name = "daoSupportPecr")
    private DaoSupportPecr dao;
	
	@SuppressWarnings("unchecked")
	public List<ValidateParameter> selectByCondition(List<String> parameter)throws Exception{
		return (List<ValidateParameter>) dao.findForList("ValidateParameterMapper.selectByCondition", parameter);
	}
}
