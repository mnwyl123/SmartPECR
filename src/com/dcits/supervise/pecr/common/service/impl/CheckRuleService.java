package com.dcits.supervise.pecr.common.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.common.service.CheckRuleMapper;

/**
 * 校验规则配置管理
 * @author 穆楠
 *
 */
@Service("checkRuleService")
public class CheckRuleService implements CheckRuleMapper{
	
	@Resource(name = "daoSupportPecr")
	private DaoSupportPecr dao;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> queryCheckRule(Page page) throws Exception {
		return (List<PageData>) dao.findForList("CheckRuleMapper.queryCheckRulelistPage", page);
	}

	@Override
	public PageData getOneCheckRule(PageData pd) throws Exception {
		return (PageData) dao.findForObject("CheckRuleMapper.getOneCheckRule", pd);
	}

	@Override
	public void addCheckRules(PageData pd) throws Exception {
		dao.save("CheckRuleMapper.addCheckRules", pd);
	}
	
	@Override
	public void updateCheckRules(PageData pd) throws Exception {
		dao.update("CheckRuleMapper.updateCheckRules", pd);
	}

	@Override
	public void deleteCheckRules(String rule) throws Exception {
		dao.delete("CheckRuleMapper.deleteCheckRules", rule);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> getDataCheckList(Page page)
			throws Exception {
		return  (List<Map<String, Object>>) dao.findForList("CheckRuleMapper.getDataChecklistPage", page);
	}
	
	@Override
	public List<Map<String, Object>> getOrgCode(Map map){
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		try {
			list = (List<Map<String, Object>>)dao.findForList("CheckRuleMapper.getOrgCode", map);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}

}
