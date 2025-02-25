package com.dcits.supervise.pecr.common.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.common.service.RuleMapper;

/**
 * 校验规则配置管理
 * @author leizx
 *
 */
@Service("RuleService")
public class RuleService implements RuleMapper{
	
	@Resource(name = "daoSupportPecr")
	private DaoSupportPecr dao;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> queryCheckRule(Page page) throws Exception {
		return (List<PageData>) dao.findForList("RuleMapper.queryRulelistPage", page);
	}

	

	@Override
	public void addCheckRules(PageData pd) throws Exception {
		dao.save("RuleMapper.addRules", pd);
	}
	
	@Override
	public void updateCheckRules(PageData pd) throws Exception {
		dao.update("RuleMapper.updateRules", pd);
	}


	
}
