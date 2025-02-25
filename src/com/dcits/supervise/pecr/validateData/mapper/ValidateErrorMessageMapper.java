package com.dcits.supervise.pecr.validateData.mapper;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.dcits.common.DaoSupportPecr;
import com.dcits.supervise.pecr.validateData.model.ValidateErrorMessage;

@Repository
public class ValidateErrorMessageMapper {

	@Resource(name = "daoSupportPecr")
    private DaoSupportPecr dao;
	
	public void deleteErrorMessage(Map<String, Object> map) throws Exception {
		dao.delete("ValidateErrorMessageMapper.deleteErrorMessage",map);
	};
	
	public Long countByCondition(Map<String, Object> map) throws Exception {
		Long count = (Long) dao.findForObject("ValidateErrorMessageMapper.countByCondition",map);
		return count;
	};
	
	@SuppressWarnings("unchecked")
	public List<ValidateErrorMessage> selectByCondition(Map<String, Object> map) throws Exception {
		return (List<ValidateErrorMessage>)dao.findForList("ValidateErrorMessageMapper.selectByCondition",map);
	};
	
	@SuppressWarnings("unchecked")
	public List<LinkedHashMap<String, Object>> selectListByCondition(Map<String, Object> map)throws Exception{
		return (List<LinkedHashMap<String, Object>>)dao.findForList("ValidateErrorMessageMapper.selectListByCondition",map);
	}
}
