package com.dcits.supervise.pecr.common.service.impl;

import com.dcits.common.DaoSupportPecr;
import com.dcits.supervise.pecr.common.service.MiddleDataChangeMapper;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.Map;

@Repository
public class MiddleDataChangeMapperImpl implements MiddleDataChangeMapper{

	@Resource(name="daoSupportPecr")
	private DaoSupportPecr dao;
	
	@Override
	public void addMiddleData(Map<String, Object> conditionMap) throws Exception {
		dao.update("MiddleDataChangeMapper.addMiddleData", conditionMap);
	}

	@Override
	public void deleteMiddleData(Map<String, Object> conditionMap) throws Exception {
		dao.delete("MiddleDataChangeMapper.deleteMiddleData", conditionMap);
	}

	@SuppressWarnings("unchecked")
	@Override
	public Map<String, Object> compareMiddleData(Map<String, Object> conditionMap) throws Exception {
		return (Map<String, Object>) dao.findForObject("MiddleDataChangeMapper.compareMiddleData", conditionMap);
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public Map<String, Object> getBusinessParameterKey(Map<String, Object> conditionMap) throws Exception {
		return (Map<String, Object>) dao.findForObject("MiddleDataChangeMapper.getBusinessParameterKey", conditionMap);
	}

	@Override
	public boolean findHistTableData(Map<String, Object> conditionMap) throws Exception {
		int nums = (int)dao.findForObject("MiddleDataChangeMapper.findHistTableData", conditionMap);
		return nums > 1 ? true :false;
	}

}
