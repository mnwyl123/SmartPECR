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
import com.dcits.supervise.pecr.ent.service.seo.EnSecAcctInfSeoManager;
import com.dcits.supervise.pecr.indv.entity.PecrIndvBsSgmt;
/**
 * 企业担保账户信息
 * @author 穆楠
 *
 */
@Controller
@RequestMapping("/enSecAcctInfSeo")
public class EnSecAcctInfSeoController extends BaseController{
	@Autowired
	private EnSecAcctInfSeoManager entSecAcctSeoService;
	
	/**
	 * 数据列表界面
	 * @return
	 */
	@RequestMapping("/listPage")
	public String dataPage() {
		return "pecr/ent/seo/enSecAcctInfSeo/enSecAcctInfSeoList";
	}
	/**
	 * 数据列表界面
	 * @return
	 */
	@RequestMapping("/listPageForUpdate")
	public String dataPageForUpdate() {
		return "pecr/ent/seo/enSecAcctInfSeo/enSecAcctInfUpdateSeoList";
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
			Boolean flag = (Boolean) session.getAttribute(user.getUSER_ID()+"isCompany");
			pd.put("managerId",flag?"":user.getUSERNAME());
			int pge = Integer.parseInt(pd.getString("page"));
			int limit = Integer.parseInt(pd.getString("limit"));
			page.setCurrentPage(pge);
			page.setShowCount(limit);
			page.setPd(pd);
			List<PageData> dataList = entSecAcctSeoService.dataList(page);
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
	 * 获取表格数据列表
	 * @param page
	 * @return
	 */
	@RequestMapping("/dataListForUpdate")
	@ResponseBody
	public Map<String, Object> dataListForUpdate(Page page){
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
			List<PageData> dataList = entSecAcctSeoService.dataListForUpdate(page);
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
		mv.setViewName("pecr/ent/seo/enSecAcctInfSeo/enSecAcctInfSeoHist");
		return mv;
	}
	/**
	 * 获取历史记录页面
	 * @param page
	 * @return
	 */
	@RequestMapping("/listHistPageForUpdate")
	public ModelAndView listHistPageForUpdate(Page page) { 
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		mv.addObject("pd", pd);
		mv.setViewName("pecr/ent/seo/enSecAcctInfSeo/enSecAcctInfUpdateSeoHist");
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
			List<PecrIndvBsSgmt> dataList = entSecAcctSeoService.dataHistList(page);
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
	 * 获取表格数据列表
	 * @param page
	 * @return
	 */
	@RequestMapping("/dataHistListForUpdate")
	@ResponseBody
	public Map<String, Object> dataHistListForUpdate(Page page){
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
			List<PecrIndvBsSgmt> dataList = entSecAcctSeoService.dataHistListForUpdate(page);
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
			map.put("baseId", pd.getString("eeaGuarAcctBsSgmtId"));
			entSecAcctSeoService.updateStatus(map);
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
			map.put("baseId", pd.getString("eeaGuarAcctBsSgmtId"));
			map.put("reportMessageId", pd.getString("reportMessageId"));
			entSecAcctSeoService.backdate(map);
			entSecAcctSeoService.updateStatus(map);
			entSecAcctSeoService.deletedate(map);
			resultMap.put("success", true);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
		}
		return resultMap;
	}
	/**
	 * 
	 * 获取新增、修改或者详情页面，以标识区分，前端进行样式控制
	 * 
	 * @param page
	 * @return
	 */
	@RequestMapping("/enSecAcctInfEdit")
	public ModelAndView dataDetail(Page page) {
		ModelAndView mv = this.getModelAndView();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		String queryType = null;
		try {
			PageData pd = this.getPageData();
			queryType = pd.getString("queryType");
			pd.put("COMPANY", company);
			String addOrUpdate = pd.getString("addOrUpdate");
			if(addOrUpdate != null && !"add".equals(addOrUpdate)){
				//基础段
				Map<String, Object> enSecAcctInf = entSecAcctSeoService.getenSecAcctInfById(pd);
				//基本信息段
				PageData guarAcctBsInfSgmt = entSecAcctSeoService.getGuarAcctBsInfSgmtById(pd);
				//账户信息授信额度信息段
				PageData acctCredSgmt = entSecAcctSeoService.getacctCredSgmtById(pd);
				//在保责任信息段
				PageData repymtInfSgmt = entSecAcctSeoService.getRepymtInfSgmtById(pd);
				mv.addObject("enSecAcctInf", JSONUtils.toJSONString(enSecAcctInf));
				mv.addObject("guarAcctBsInfSgmt", JSONUtils.toJSONString(guarAcctBsInfSgmt));
				mv.addObject("acctCredSgmt", JSONUtils.toJSONString(acctCredSgmt));
				mv.addObject("repymtInfSgmt", JSONUtils.toJSONString(repymtInfSgmt));
			}
			mv.addObject("pd", pd);
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		if(queryType != null && "entGuarUpdateBySegment".equals(queryType)){
			mv.setViewName("pecr/ent/dataRecode/entGuaranteeChangeEdit");
		}else{
			mv.setViewName("pecr/ent/seo/enSecAcctInfSeo/enSecAcctInfEdit");
		}
		return mv;
	}
	
	/**
	 * 获取相关还款责任人段
	 * @param pd
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getRltInfList")
	public Map<String, Object> getRltInfList(Page page){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			PageData pd = this.getPageData();
			pd.put("COMPANY", company);
			int pge = Integer.parseInt(pd.getString("page"));
			int limit = Integer.parseInt(pd.getString("limit"));
			String pageType = pd.getString("pageType");
			page.setCurrentPage(pge);
			page.setShowCount(limit);
			page.setPd(pd);
			List<PageData> dataList = null;
			if(pageType != null && "edit".equals(pageType)){
				dataList = entSecAcctSeoService.getRltInfList(page);
			}
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
	 * 获取  抵质押物信息段
	 * @param pd
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getMccInfList")
	public Map<String, Object> getMccInfList(Page page){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			PageData pd = this.getPageData();
			pd.put("COMPANY", company);
			int pge = Integer.parseInt(pd.getString("page"));
			int limit = Integer.parseInt(pd.getString("limit"));
			String pageType = pd.getString("pageType");
			page.setCurrentPage(pge);
			page.setShowCount(limit);
			page.setPd(pd);
			List<PageData> dataList = null;
			if(pageType != null && "edit".equals(pageType)){
				dataList = entSecAcctSeoService.getMccInfList(page);
			}
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
