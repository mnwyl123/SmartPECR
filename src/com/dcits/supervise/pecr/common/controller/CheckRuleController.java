package com.dcits.supervise.pecr.common.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.common.service.CheckRuleMapper;

/**
 * 检验规则配置管理
 * @author 穆楠
 *
 */
@Controller
@RequestMapping("/checkRule")
public class CheckRuleController extends BaseController{

	@Autowired
	private CheckRuleMapper checkRuleService;
	
	/**
	 * 数据列表界面
	 * @return
	 */
	@RequestMapping("/dataPage")
	public String dataPage() {
		return "pecr/checkRule/checkRuleManagerList";
	}
	
	/**
	 * 获取表格数据列表
	 * @param page
	 * @return
	 */
	@RequestMapping("/dataList")
	@ResponseBody
	public Map<String, Object> dataList(Page page){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			PageData pd = this.getPageData();
			int pge = Integer.parseInt(pd.getString("page"));
			int limit = Integer.parseInt(pd.getString("limit"));
			page.setCurrentPage(pge);
			page.setShowCount(limit);
			page.setPd(pd);
			List<PageData> dataList = checkRuleService.queryCheckRule(page);
			resultMap.put("data", dataList);
			resultMap.put("code", 0);
			resultMap.put("count", page.getTotalResult());
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("code", 1);
		}
		return resultMap;
	}
	
	/**
	 * 新增或修改
	 * @param page
	 * @return
	 */
	@RequestMapping("/addOrUpdate")
	@ResponseBody
	public Map<String, Object> addOrUpdateRule(Page page){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			PageData pd = this.getPageData();
			String addOrUpdate = pd.getString("addOrUpdate");
			if("add".equalsIgnoreCase(addOrUpdate)) {
				if(checkRuleService.getOneCheckRule(pd) != null) {
					resultMap.put("msg", "主键重复!");
					resultMap.put("success", false);
				}else {
					checkRuleService.addCheckRules(pd);
				}
			}else {
				checkRuleService.updateCheckRules(pd);
			}
			resultMap.put("success", true);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
		}
		return resultMap;
	}
	
	/**
	 * 删除/批量删除
	 * @param page
	 * @return
	 */
	@RequestMapping("/deleteALL") 
	@ResponseBody
	public Map<String, Object> deleteALL(Page page){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		PageData pd = this.getPageData();
		String ruleIds = pd.getString("str");
		try {
			String[] rules = ruleIds.split(",");
			for (int i = 0; i < rules.length; i++) {
				String rule = rules[i];
				checkRuleService.deleteCheckRules(rule);
			}
			resultMap.put("success", true);
			resultMap.put("code", 1);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("code", -1);
			resultMap.put("msg", e.getMessage());
		}
		return resultMap;
	}
}
