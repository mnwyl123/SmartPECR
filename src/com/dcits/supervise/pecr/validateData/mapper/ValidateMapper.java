package com.dcits.supervise.pecr.validateData.mapper;

import java.util.LinkedHashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.dcits.common.DaoSupportPecr;

@Repository
public class ValidateMapper
{
	@Resource(name="daoSupportPecr")
	private DaoSupportPecr dao;
	
    @SuppressWarnings("unchecked")
	public List<LinkedHashMap<String, Object>> querySqlByCondition( String p0) throws Exception{
    	return (List<LinkedHashMap<String, Object>>) dao.findForList("ValidateMapper.querySqlByCondition", p0);
    }
    
    public void executeSql(final String p0) throws Exception{
    	dao.findForObject("ValidateMapper.executeSql", p0);
    }
}
