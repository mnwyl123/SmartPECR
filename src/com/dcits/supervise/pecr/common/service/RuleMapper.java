package com.dcits.supervise.pecr.common.service;

import java.util.List;


import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;

/**
 * 回执规则配置管理
 * @author 穆楠  
 *
 */
public interface RuleMapper {
	//查询校验规则
	public List<PageData> queryCheckRule(Page page) throws Exception;

	//增加校验规则
	public void addCheckRules(PageData pd) throws Exception;
	//修改校验规则
	public void updateCheckRules(PageData pd) throws Exception;

	
}
