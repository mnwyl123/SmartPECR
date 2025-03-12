package com.dcits.supervise.pecr.objectionHanding.controller;

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
import com.dcits.supervise.pecr.objectionHanding.service.PersonObjectionManager;

/**
 * 异议处理
 * @author 穆楠  
 *
 */
@Controller
//@RequestMapping("/objectionHanding")
public class objectionHandingController extends BaseController{

	@Autowired
	private PersonObjectionManager personObjectionManager;
	/**
	 * 数据列表界面
	 * @return
	 */
	@RequestMapping("/dataPage")
	public String dataPage() {
		return "pecr/objectionHanding/objectionHandingList";
	}
	
	/**
	 * 获取表格数据列表
	 * @param page
	 * @return
	 */
	@RequestMapping("/List")
	@ResponseBody
	public Map<String, Object> objectionHandingList(Page page){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			PageData pd = this.getPageData();
			int pge = Integer.parseInt(pd.getString("page"));
			int limit = Integer.parseInt(pd.getString("limit"));
			page.setCurrentPage(pge);
			page.setShowCount(limit);
			page.setPd(pd);
			List<PageData> dataList = personObjectionManager.listToCheckMainlistPage(page);
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
	 * 获取历史表格数据列表
	 * @param page
	 * @return
	 */
	@RequestMapping("/getHisList")
	@ResponseBody
	public Map<String, Object> getHisList(Page page){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			PageData pd = this.getPageData();
			int pge = Integer.parseInt(pd.getString("page"));
			int limit = Integer.parseInt(pd.getString("limit"));
			page.setCurrentPage(pge);
			page.setShowCount(limit);
			page.setPd(pd);
			List<PageData> dataList = personObjectionManager.listToCheckSubLastlistPage(page);
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
