package com.dcits.supervise.pecr.validateData.mapper;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.dcits.common.DaoSupportPecr;
import com.dcits.supervise.pecr.validateData.model.ValidateTable;

@Repository
public class ValidateTableMapper
{
	@Resource(name="daoSupportPecr")
	private DaoSupportPecr dao;
	public  ValidateTable selectOneByCondition(ValidateTable validateTable) throws Exception{
		return (ValidateTable) dao.findForObject("ValidateTableMapper.selectOneByCondition", validateTable);
	}
	
	@SuppressWarnings("unchecked")
	public  List<ValidateTable> selectByCondition()throws Exception{
		return (List<ValidateTable>) dao.findForList("ValidateTableMapper.selectByCondition");
		
	}
}
