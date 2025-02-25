package com.dcits.supervise.pecr.common.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.common.service.DataCheckResultMapper;

/**
 * 校验结果查看
 * @author leizx
 *
 */
@Controller
@RequestMapping(value = "/checkResult")
public class DataCheckResultController  extends BaseController{
	
	@Autowired
	private DataCheckResultMapper dataCheckResultService;
	
	@RequestMapping(value="/dataPage")
	public ModelAndView dataPage(){
		logBefore(logger, Jurisdiction.getUsername()+"校验结果查看");
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		mv.addObject("flag",pd.getString("flag")); //对公对私标识
		mv.setViewName("pecr/checkRule/checkResult_list");
		return mv;
	}
	
	/**
	 * 获取表格数据列表
	 * @param page
	 * @return
	 */
	@RequestMapping("/resultDataList")
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
			List<PageData> dataList = dataCheckResultService.findResultList(page);
			resultMap.put("data", dataList);
			resultMap.put("code", 0);
			resultMap.put("count", page.getTotalResult());
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("code", 1);
		}
		return resultMap;
	}
}
