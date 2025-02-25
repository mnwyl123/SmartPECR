package com.dcits.supervise.pecr.indv.controller.seo;

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
import com.dcits.supervise.pecr.indv.entity.PecrIndvBsSgmt;
import com.dcits.supervise.pecr.indv.entity.PecrIndvIdSgmt;
import com.dcits.supervise.pecr.indv.service.seo.IndvBasicsInfoSeoManager;

/**
 * 个人基本信息综合查询
 * @author munan
 *
 */
@Controller
@RequestMapping("/indvBasicsInfoSeo")
public class IndvBasicsInfoSeoController extends BaseController{
	@Autowired
	private IndvBasicsInfoSeoManager indvSeoService;
	
	/**
	 * 数据列表界面
	 * @return
	 */
	@RequestMapping("/listPage")
	public String dataPage() {
		return "pecr/indv/seo/indvBasicsInfoSeo/indvBasicsInfoList";
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
		mv.setViewName("pecr/indv/seo/indvBasicsInfoSeo/indvBasicsInfoSeoHist");
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
			List<PecrIndvBsSgmt> dataList = indvSeoService.dataHistList(page);
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
	@RequestMapping("/indvBasicsInfoDetail")
	public ModelAndView dataDetail(Page page) { 
		ModelAndView mv = this.getModelAndView();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			PageData pd = this.getPageData();
			pd.put("COMPANY", company);
			String addOrUpdate = pd.getString("addOrUpdate");
			if(addOrUpdate.equals("add")){
				mv.addObject("pd", pd);
				mv.setViewName("pecr/indv/dataRecode/indvBasicsInfoDetail");
				return mv;
			}
			PageData basBsSgmt = indvSeoService.getPcBasBsSgmtById(pd);
			PageData basFcsInfoSgmt = indvSeoService.getPcBasFcsInfSgmtById(pd);
			PageData basSpsInfoSgmt = indvSeoService.getPcBasSpsInfSgmtById(pd);
			PageData basEduInfoSgmt = indvSeoService.getPcBasEduInfSgmtById(pd);
			PageData basOctpnInfoSgmt = indvSeoService.getPcBasOctpnInfSgmtById(pd);
			PageData basRedncInfoSgmt = indvSeoService.getPcBasRedncInfSgmtById(pd); 
			PageData basMlgInfoSgmt = indvSeoService.getPcBasMlgInfSgmtById(pd);
			PageData basIncInfSgmt = indvSeoService.getPcBasIncInfSgmtById(pd);
			
			mv.addObject("basBsSgmt", JSONUtils.toJSONString(basBsSgmt));
			mv.addObject("basFcsInfoSgmt", JSONUtils.toJSONString(basFcsInfoSgmt));
			mv.addObject("basSpsInfoSgmt", JSONUtils.toJSONString(basSpsInfoSgmt));
			mv.addObject("basEduInfoSgmt", JSONUtils.toJSONString(basEduInfoSgmt));
			mv.addObject("basOctpnInfoSgmt", JSONUtils.toJSONString(basOctpnInfoSgmt));
			mv.addObject("basRedncInfoSgmt", JSONUtils.toJSONString(basRedncInfoSgmt));
			mv.addObject("basMlgInfoSgmt", JSONUtils.toJSONString(basMlgInfoSgmt));
			mv.addObject("basIncInfSgmt", JSONUtils.toJSONString(basIncInfSgmt));
			mv.addObject("pd", pd);
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		
		mv.setViewName("pecr/indv/seo/indvBasicsInfoSeo/indvBasicsInfoDetail");
		return mv;
	}
	/**
	 * 获取个人基本信息其他信息段列表
	 * @param pd
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getIdSmgtList")
	public Map<String, Object> getIdSmgtList(Page page){
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
			List<PecrIndvIdSgmt> dataList = null;
			if(pageType != null && "edit".equals(pageType)){
			    dataList = indvSeoService.getPecrIndvIdSgmtById(page);
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
			map.put("paaBsSmgtId", pd.getString("paaBsSmgtId"));
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
			map.put("paaBsSmgtId", pd.getString("paaBsSmgtId"));
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
