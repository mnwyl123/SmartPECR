package com.dcits.supervise.pecr.indv.controller.seo;

import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.indv.entity.Accountchange;
import com.dcits.supervise.pecr.indv.service.seo.AccountchangeSeoManager;

import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 综合查询  > 标识变更数据管理&标识变更报文管理
 * @author 穆楠
 *
 */
@Controller
@RequestMapping(value = "/accountchangeSeo")
public class AccountchangeSeoController extends BaseController {
	@Autowired
	private AccountchangeSeoManager indvSeoService;
	
	/**
	 * 数据列表界面
	 * @return
	 */
	@RequestMapping("/listPage")
	public String dataPage() {
		return "pecr/indv/seo/accountchangeSeo/accountchangeSeoList";
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
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			PageData pd = this.getPageData();
			pd.put("COMPANY", company);
			int pge = Integer.parseInt(pd.getString("page"));
			int limit = Integer.parseInt(pd.getString("limit"));
			page.setCurrentPage(pge);
			page.setShowCount(limit);
			page.setPd(pd);
			List<PageData> dataList = indvSeoService.dataList(page);
			resultMap.put("code", 0);
			resultMap.put("msg","");
			resultMap.put("count", page.getTotalResult());
			resultMap.put("data", dataList);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("code", 1);
		}
		return resultMap;
	}
	
	/**
	 * 获取历史记录页面
	 * @param page
	 * @return
	 */
	@RequestMapping("/listHistPage")
	public ModelAndView listHistPage(Page page) { 
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		mv.addObject("pd", pd);
		mv.setViewName("pecr/indv/seo/accountchangeSeo/accountchangeSeoHist");
		return mv;
	}
	/**
	 * 获取表格数据列表
	 * @param page
	 * @return
	 */
	@RequestMapping("/dataHistList")
	@ResponseBody
	public Map<String, Object> dataHistList(Page page){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			PageData pd = this.getPageData();
			pd.put("COMPANY", company);
			int pge = Integer.parseInt(pd.getString("page"));
			int limit = Integer.parseInt(pd.getString("limit"));
			page.setCurrentPage(pge);
			page.setShowCount(limit);
			page.setPd(pd);
			List<Accountchange> dataList = indvSeoService.dataHistList(page);
			resultMap.put("code", 0);
			resultMap.put("msg","");
			resultMap.put("count", page.getTotalResult());
			resultMap.put("data", dataList);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("code", 1);
		}
		return resultMap;
	}
	/**
	 * 发起补录
	 * @param page
	 * @return
	 */
	@RequestMapping("/updatedate") 
	@ResponseBody
	public Map<String, Object> updatedate(Page page){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			PageData pd = this.getPageData();
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("COMPANY", company);
			map.put("baseId", pd.getString("pk"));
			map.put("infRecType", pd.getString("infRecType"));
			indvSeoService.updateStatus(map);
			resultMap.put("success", true);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
		}
		return resultMap;
	}
	
	/**
	 * 报文回退
	 * @param page
	 * @return
	 */
	@RequestMapping("/backdate") 
	@ResponseBody
	public Map<String, Object> backdate(Page page){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			PageData pd = this.getPageData();
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("COMPANY", company);
			map.put("baseId", pd.getString("pk"));
			map.put("infRecType", pd.getString("infRecType"));
			map.put("reportMessageId", pd.getString("reportMessageId"));
			indvSeoService.backdate(map);
			indvSeoService.updateStatus(map);
			indvSeoService.deletedate(map);
			resultMap.put("success", true);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
		}
		return resultMap;
	}
}
