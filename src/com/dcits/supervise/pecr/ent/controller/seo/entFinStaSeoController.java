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
import com.dcits.supervise.pecr.ent.entity.BalanceSheetDlt;
import com.dcits.supervise.pecr.ent.service.seo.entFinStaSeoManager;

/**
 * 企业财报整笔删除
 * @author 穆楠  
 *
 */
@Controller
@RequestMapping("/entFinStaSeo")
public class entFinStaSeoController extends BaseController{

	@Autowired
	private entFinStaSeoManager entFinStaSeoService;
	/**
	 * 数据列表界面
	 * @return
	 */
	@RequestMapping("/listPage")
	public String dataPage() {
		return "pecr/ent/seo/entFinStaSeo/entFinStaSeoList";
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
			List<PageData> dataList = entFinStaSeoService.dataList(page);
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
		mv.setViewName("pecr/ent/seo/entFinStaSeo/entFinStaSeoHist");
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
			List<BalanceSheetDlt> dataList = entFinStaSeoService.dataHistList(page);
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
			PageData data=null;
			if(pd.get("infRecType").equals("614")) {
				data=entFinStaSeoService.getBalanceById(pd);
			}else if(pd.get("infRecType").equals("634")) {
				data=entFinStaSeoService.getCashById(pd);
			}else if(pd.get("infRecType").equals("654")) {
				data=entFinStaSeoService.getIncomeById(pd);
			}else if(pd.get("infRecType").equals("624")) {
				data=entFinStaSeoService.getPabsById(pd);
			}else if(pd.get("infRecType").equals("644")) {
				data=entFinStaSeoService.getInstitutionById(pd);
			}
			mv.addObject("entFinSta", JSONUtils.toJSONString(data));
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
			if(pd.get("infRecType").equals("614")) {
				entFinStaSeoService.updateStatusBalance(map);
			}else if(pd.get("infRecType").equals("634")) {
				entFinStaSeoService.updateStatusCash(map);
			}else if(pd.get("infRecType").equals("654")) {
				entFinStaSeoService.updateStatusIncome(map);
			}else if(pd.get("infRecType").equals("624")) {
				entFinStaSeoService.updateStatusPabs(map);
			}else if(pd.get("infRecType").equals("644")) {
				entFinStaSeoService.updateStatusInstitution(map);
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
			map.put("baseId", pd.getString("pcaCtrctBsSgmtId"));
			map.put("reportMessageId", pd.getString("reportMessageId"));
			if(pd.get("infRecType").equals("614")) {
				entFinStaSeoService.backdateBalance(map);
			}else if(pd.get("infRecType").equals("634")) {
				entFinStaSeoService.backdateCash(map);
			}else if(pd.get("infRecType").equals("654")) {
				entFinStaSeoService.backdateIncome(map);
			}else if(pd.get("infRecType").equals("624")) {
				entFinStaSeoService.backdatePabs(map);
			}else if(pd.get("infRecType").equals("644")) {
				entFinStaSeoService.backdateInstitution(map);
			}
			entFinStaSeoService.deletedate(map);
			resultMap.put("success", true);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
		}
		return resultMap;
	}
}
