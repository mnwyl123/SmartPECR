package com.dcits.supervise.pecr.ent.controller.seo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.alibaba.druid.support.json.JSONUtils;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.ent.entity.EntIncomeAndExpenseStatemeBs;
import com.dcits.supervise.pecr.ent.service.seo.EntIncomeAndExpenseStatemeBsSeoManager;

/**
 * 事业单位收入支出
 * @author wangyan
 *
 */
@Controller
@RequestMapping("/ecdtreportinstieSeo")
public class EntIncomeAndExpenseStatemeBsSeoController extends BaseController{

	
	
	
	@Autowired
	private EntIncomeAndExpenseStatemeBsSeoManager entIncomeAndExpenseStatemeBs;
	
	/**
	 * 数据列表界面
	 * @return
	 */
	@RequestMapping("/list")
	public String dataPage() {
		return "pecr/ent/seo/ecdtreportinstieSeo/ecdtreportinstieSeoList";
	}
	
	/**
	 * 获取表格数据列表
	 * @param page
	 * @return
	 */
	@RequestMapping("/acctInfoList")
	@ResponseBody
	public Map<String, Object> acctInfoList(Page page){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			PageData pd = this.getPageData();
			pd.put("COMPANY", company);
			Boolean flag = (Boolean) session.getAttribute(user.getUSER_ID()+"isCompany");
			pd.put("managerId",flag?"":user.getUSERNAME());
			int pge = Integer.parseInt(pd.getString("page"));
			int limit = Integer.parseInt(pd.getString("limit"));
			page.setCurrentPage(pge);
			page.setShowCount(limit);
			page.setPd(pd);
			List<PageData> dataList = entIncomeAndExpenseStatemeBs.dataList(page);
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
	 * 获取历史记录页面
	 * @param page
	 * @return
	 */
	@RequestMapping("/listHistPage")
	public ModelAndView listHistPage(Page page) { 
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		mv.addObject("pd", pd);
		mv.setViewName("pecr/ent/seo/ecdtreportinstieSeo/ecdtreportinstieSeoHist");
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
			List<EntIncomeAndExpenseStatemeBs> dataList = entIncomeAndExpenseStatemeBs.dataHistList(page);
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
	 * 获取detail页面非table数据
	 * @param page
	 * @return
	 */
	@RequestMapping("/basicsInfoDetail")
	public ModelAndView dataDetail(Page page) { 
		ModelAndView mv = this.getModelAndView();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			PageData pd = this.getPageData();
			pd.put("COMPANY", company);
			String addOrUpdate = pd.getString("addOrUpdate");
			if(addOrUpdate != null && !"add".equals(addOrUpdate)){
				//基本信息段
				PageData acctBsSgmt = entIncomeAndExpenseStatemeBs.getAcctInfSgmtById(pd);
				//在保责任信息段
				PageData acctInfSgmt = entIncomeAndExpenseStatemeBs.getRepymtInfSgmtById(pd);
				mv.addObject("acctBsSgmt", JSONUtils.toJSONString(acctBsSgmt));
				mv.addObject("acctInfSgmt", JSONUtils.toJSONString(acctInfSgmt));
			}
			mv.addObject("pd", pd);
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		mv.setViewName("pecr/ent/seo/ecdtreportinstieSeo/entIncomeAndExpenseStatemeBEdit");
		return mv;
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
			map.put("baseId", pd.getString("elaIncomeAndExpenseStatId"));
			entIncomeAndExpenseStatemeBs.updateStatus(map);
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
			//TODO
			map.put("COMPANY", company);
			map.put("baseId", pd.getString("elaIncomeAndExpenseStatId"));
			map.put("reportMessageId", pd.getString("reportMessageId"));
			entIncomeAndExpenseStatemeBs.backdate(map);
			entIncomeAndExpenseStatemeBs.updateStatus(map);
			entIncomeAndExpenseStatemeBs.deletedate(map);
			resultMap.put("success", true);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
		}
		return resultMap;
	}
}
