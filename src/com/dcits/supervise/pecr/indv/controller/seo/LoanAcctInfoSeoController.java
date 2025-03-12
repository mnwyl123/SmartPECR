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
import com.dcits.supervise.pecr.indv.entity.LoanAcctRltInfSgmt;
import com.dcits.supervise.pecr.indv.entity.PecrIndvBsSgmt;
import com.dcits.supervise.pecr.indv.service.seo.LoanAcctInfoSeoManager;
/**
 * 个人借贷账户信息
 * @author 穆楠
 *
 */
@Controller
@RequestMapping("/indvLoanAcctInfoSeo")
public class LoanAcctInfoSeoController extends BaseController{
	@Autowired
	private LoanAcctInfoSeoManager indvSeoService;
	
	/**
	 * 数据列表界面
	 * @return
	 */
	@RequestMapping("/listPage")
	public String dataPage() {
		return "pecr/indv/seo/indvLoanAcctInfoSeo/indvLoanAcctInfoSeoList";
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
		mv.setViewName("pecr/indv/seo/indvLoanAcctInfoSeo/indvLoanAcctInfoSeoHist");
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
	 * 数据列表界面
	 * @return
	 */
	@RequestMapping("/listPageForUpdate")
	public String dataPageForUpdate() {
		return "pecr/indv/seo/indvLoanAcctInfoSeo/indvLoanAcctInfoUpdateSeoList";
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
			List<PageData> dataList = indvSeoService.dataListForUpdate(page);
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
	@RequestMapping("/listHistPageForUpdate")
	public ModelAndView listHistPageForUpdate(Page page) { 
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		mv.addObject("pd", pd);
		mv.setViewName("pecr/indv/seo/indvLoanAcctInfoSeo/indvLoanAcctInfoUpdateSeoHist");
		return mv;
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
			List<PecrIndvBsSgmt> dataList = indvSeoService.dataHistListForUpdate(page);
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
			map.put("baseId", pd.getString("pbaAcctBsSgmtId"));
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
			map.put("baseId", pd.getString("pbaAcctBsSgmtId"));
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
	/**
	 * 
	 * 获取新增、修改或者详情页面，以标识区分，前端进行样式控制
	 * 
	 * @param page
	 * @return
	 */
	@RequestMapping("/loanAcctInfoEdit")
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
				Map<String, Object> acctBsSgmt = indvSeoService.getAcctBsSgmtById(pd);
				//基本信息段
				PageData acctBsInfSgmt = indvSeoService.getAcctBsInfSgmtById(pd);
				//授信额度信息段
				PageData acctCredSgmt = indvSeoService.getAcctCredSgmtById(pd);
				//初始债权说明段
				PageData ocInfoSgmt = indvSeoService.getOcInfoSgmtById(pd);
				//月度表现信息段
				PageData amblgInfoSgmt = indvSeoService.getAmblgInfoSgmtById(pd);
				//大额专项分期信息段
				PageData specPrdSgmt = indvSeoService.getSpecPrdSgmtById(pd);
				//非月度表现信息段
				PageData acctDbtInfSgmt = indvSeoService.getAcctDbtInfSgmtById(pd);
				mv.addObject("acctBsSgmt", JSONUtils.toJSONString(acctBsSgmt));
				mv.addObject("acctBsInfSgmt", JSONUtils.toJSONString(acctBsInfSgmt));
				mv.addObject("acctCredSgmt", JSONUtils.toJSONString(acctCredSgmt));
				mv.addObject("ocInfoSgmt", JSONUtils.toJSONString(ocInfoSgmt));
				mv.addObject("amblgInfoSgmt", JSONUtils.toJSONString(amblgInfoSgmt));
				mv.addObject("specPrdSgmt", JSONUtils.toJSONString(specPrdSgmt));
				mv.addObject("acctDbtInfSgmt", JSONUtils.toJSONString(acctDbtInfSgmt));
			}
			mv.addObject("pd", pd);
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		if(queryType != null && "indvLoanUpdateBySegment".equals(queryType)){
			mv.setViewName("pecr/indv/dataRecode/indvLoanChangeEdit");
		}else{
			mv.setViewName("pecr/indv/seo/indvLoanAcctInfoSeo/indvLoanAcctInfoSeoEdit");
		}
		return mv;
	}
	/**
	 * 获取相关还款责任人段
	 * @param pd
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getRltRepymtInfList")
	public Map<String, Object> getRltRepymtInfList(Page page){
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
			List<LoanAcctRltInfSgmt> dataList = null;
			if(pageType != null && "edit".equals(pageType)){
				dataList = indvSeoService.getLoanRltSgmtById(page);
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
				dataList = indvSeoService.getMccInfoSgmtById(page);
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
	 * 获取  特殊交易说明段
	 * @param pd
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getDspnSgmtList")
	public Map<String, Object> getDspnSgmtList(Page page){
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
				dataList = indvSeoService.getTrstDspnSgmtById(page);
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
	 * 获取账户类型为D1  页面
	 * @return
	 */
	@RequestMapping("/indvLoanAcctInfoEditD1")
	public String indvLoanAcctInfoEditD1() {
		return "pecr/indv/seo/indvLoanAcctInfoSeo/indvLoanAcctInfoSeoEditD1";
	}
	
	/**
	 * 获取账户类型为R1  页面
	 * @return
	 */
	@RequestMapping("/indvLoanAcctInfoEditR1")
	public String indvLoanAcctInfoEditR1() {
		return "pecr/indv/seo/indvLoanAcctInfoSeo/indvLoanAcctInfoSeoEditR1";
	}
	
	/**
	 * 获取账户类型为R2  页面
	 * @return
	 */
	@RequestMapping("/indvLoanAcctInfoEditR2")
	public String indvLoanAcctInfoEditR2() {
		return "pecr/indv/seo/indvLoanAcctInfoSeo/indvLoanAcctInfoSeoEditR2";
	}
	
	/**
	 * 获取账户类型为R3  页面
	 * @return
	 */
	@RequestMapping("/indvLoanAcctInfoEditR3")
	public String indvLoanAcctInfoEditR3() {
		return "pecr/indv/seo/indvLoanAcctInfoSeo/indvLoanAcctInfoSeoEditR3";
	}
	
	/**
	 * 获取账户类型为R4  页面
	 * @return
	 */
	@RequestMapping("/indvLoanAcctInfoEditR4")
	public String indvLoanAcctInfoEditR4() {
		return "pecr/indv/seo/indvLoanAcctInfoSeo/indvLoanAcctInfoSeoEditR4";
	}
	
	/**
	 * 获取账户类型为D1  页面
	 * @return
	 */
	@RequestMapping("/indvLoanAcctInfoEditC1")
	public String indvLoanAcctInfoEditC1() {
		return "pecr/indv/seo/indvLoanAcctInfoSeo/indvLoanAcctInfoSeoEditC1";
	}
}
