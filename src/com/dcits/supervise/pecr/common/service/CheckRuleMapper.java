package com.dcits.supervise.pecr.common.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;

/**
 * 检验规则配置管理
 * @author 穆楠
 *
 */
public interface CheckRuleMapper {
	//查询校验规则
	public List<PageData> queryCheckRule(Page page) throws Exception;
	//根据主键查找校验规则
	public PageData getOneCheckRule(PageData pd) throws Exception;
	//增加校验规则
	public void addCheckRules(PageData pd) throws Exception;
	//修改校验规则
	public void updateCheckRules(PageData pd) throws Exception;
	//删除校验规则
	public void deleteCheckRules(@Param("ERRNO")String rule) throws Exception;
	//查询数据校验结果列表
	public List<Map<String, Object>> getDataCheckList(Page page) throws Exception;
	
	//获取机构区代码
	public List<Map<String, Object>> getOrgCode(Map map);
}
