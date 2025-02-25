package com.dcits.supervise.pecr.common.service.impl;

import com.dcits.common.DaoSupportPecr;
import com.dcits.supervise.pecr.common.service.ChangeDataStateService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Map;

@Service
public class ChangeDataStateServiceImpl implements ChangeDataStateService{

	@Resource(name="daoSupportPecr")
	private DaoSupportPecr dao;
	
	@Override
	public void updateBusinessStateByCondition(Map<String, Object> conditionMap) throws Exception {
		dao.update("ChangeDataStateMapper.updateBusinessStateByCondition", conditionMap);
		dao.update("ChangeDataStateMapper.updateFeedbackerrstatus", conditionMap);
	}
	
	@Override
	public void updateBaseAudit(Map<String, Object> conditionMap) throws Exception {
		dao.update("ChangeDataStateMapper.updateBaseAudit", conditionMap);
	}

	
}
