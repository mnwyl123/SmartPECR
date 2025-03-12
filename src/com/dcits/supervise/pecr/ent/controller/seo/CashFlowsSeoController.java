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
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.supervise.pecr.ent.entity.CashFlows;
import com.dcits.supervise.pecr.ent.service.seo.CashFlowsSeoManager;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;

/**
 * 企业现金流量信息表综合查询
 * @author 
 *
 */
@Controller
@RequestMapping("/cashFlowsSeo")
public class CashFlowsSeoController extends BaseController{

	@Autowired
	private CashFlowsSeoManager cashFlowsService;
	
	/**
	 * 数据列表界面
	 * @return
	 */
	@RequestMapping("/listPage")
	public String dataPage() {
		return "pecr/ent/seo/CashFlowsSeo/CashFlowsSeoList";
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
			List<PageData> dataList = cashFlowsService.dataList(page);
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
		mv.setViewName("pecr/ent/seo/CashFlowsSeo/CashFlowsSeoHist");
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
			List<CashFlows> dataList = cashFlowsService.dataHistList(page);
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
			//基础段
			Map<String, Object> cashFlowsBsSgmt = cashFlowsService.getCashFlowsBsSgmtById(pd);
			//企业现金流量表02现金流量表段
			PageData cashFlows2002Sgmt = cashFlowsService.getCashFlows2002SgmtById(pd);
			//企业现金流量表07现金流量表段
			PageData cashFlows2007Sgmt = cashFlowsService.getCashFlows2007SgmtById(pd);
			
			mv.addObject("cashFlowsBsSgmt", JSONUtils.toJSONString(cashFlowsBsSgmt));
			mv.addObject("cashFlows2002Sgmt", JSONUtils.toJSONString(cashFlows2002Sgmt));
			mv.addObject("cashFlows2007Sgmt", JSONUtils.toJSONString(cashFlows2007Sgmt));
			mv.addObject("pd", pd);
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		
		mv.setViewName("pecr/ent/dataRecode/CashFlows/cashFlowsEdit");
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
			map.put("baseId", pd.getString("pcaCtrctBsSgmtId"));
			cashFlowsService.updateStatus(map);
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
			map.put("baseId", pd.getString("ejaCashFlowsBsSgmtId"));
			map.put("reportMessageId", pd.getString("reportMessageId"));
			cashFlowsService.backdate(map);
			cashFlowsService.updateStatus(map);
			cashFlowsService.deletedate(map);
			resultMap.put("success", true);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
		}
		return resultMap;
	}
}
