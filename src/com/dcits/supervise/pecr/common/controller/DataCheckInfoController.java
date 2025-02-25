package com.dcits.supervise.pecr.common.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
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
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.common.service.CheckRuleMapper;

/**
 * 数据校验详情	
 * @author zhanggym
 *
 */
@Controller
@RequestMapping("/dataCheckInfo")
public class DataCheckInfoController extends BaseController{
	
	@Autowired
	private CheckRuleMapper checkRuleService;
	
	/**
	 * 数据列表界面
	 * @return
	 */
	@RequestMapping("/dataCheckInfo")
	public ModelAndView dataPage() {
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		if(pd.get("curDate") == null || "".equals(pd.get("curDate").toString())){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar calendar =  Calendar.getInstance();
			calendar.setTime(new Date());
			calendar.add(Calendar.DAY_OF_YEAR, -1);
			String curDateMR = sdf.format(calendar.getTime());
			pd.put("curDate", curDateMR);
		}
		mv.setViewName("pecr/checkRule/dataCheckInfo");
		mv.addObject("pd", pd);
		return mv;
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
			/*//做默认值处理
			if(pd.get("curDate") == null || "".equals(pd.get("curDate").toString())){
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Calendar calendar =  Calendar.getInstance();
				calendar.setTime(new Date());
				calendar.add(Calendar.DAY_OF_YEAR, -1);
				String curDateMR = sdf.format(calendar.getTime());
				pd.put("curDate", curDateMR);
			}*/
			int pge = Integer.parseInt(pd.getString("page"));
			int limit = Integer.parseInt(pd.getString("limit"));
			page.setCurrentPage(pge);
			page.setShowCount(limit);
			page.setPd(pd);
			List<Map<String, Object>> dataList = checkRuleService.getDataCheckList(page);
			resultMap.put("data", dataList);
			resultMap.put("code", 0);
			resultMap.put("count", page.getTotalResult());
			resultMap.put("pd", pd);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("code", 1);
		}
		return resultMap;
	}
}
