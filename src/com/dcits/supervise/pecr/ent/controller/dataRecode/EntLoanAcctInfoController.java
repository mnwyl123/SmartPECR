package com.dcits.supervise.pecr.ent.controller.dataRecode;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.session.Session;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestUtils;
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
import com.dcits.supervise.pecr.common.service.MiddleDataChangeService;
import com.dcits.supervise.pecr.ent.entity.EntAcctBsSgmt;
import com.dcits.supervise.pecr.ent.entity.EntRltRepymtSgmt;
import com.dcits.supervise.pecr.ent.service.dataRecode.EntLoanAcctInfoManager;
import com.dcits.supervise.pecr.log.Operate;
import com.dcits.supervise.pecr.validateData.model.ValidateErrorMessage;
import com.dcits.supervise.pecr.validateData.service.ValidateErrorMessageService;

/**
 * 企业借贷账户信息
 * @author leizx
 *
 */
@Controller
@RequestMapping("/entLoanAcctInfo")
public class EntLoanAcctInfoController extends BaseController{

	@Autowired
	private EntLoanAcctInfoManager entLoanAcctInfoService;
	@Autowired
	private MiddleDataChangeService middleDataChangeService;
	@Autowired
	private ValidateErrorMessageService validateErrorMessageService;
	/**
	 * 数据列表界面
	 * @return
	 */
	@RequestMapping("/dataPage")
	public String dataPage() {
		return "pecr/ent/dataRecode/loanAcctInfo/entLoanAcctInfoList";
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
			pd.put("queryType", "APPLY");
			Boolean flag = (Boolean) session.getAttribute(user.getUSER_ID()+"isCompany");
			pd.put("managerId",flag?"":user.getUSERNAME());
			int pge = Integer.parseInt(pd.getString("page"));
			int limit = Integer.parseInt(pd.getString("limit"));
			page.setCurrentPage(pge);
			page.setShowCount(limit);
			page.setPd(pd);
			List<EntAcctBsSgmt> dataList = entLoanAcctInfoService.getLoanAcctBsSgmtList(page);
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
		try {
			PageData pd = this.getPageData();
			pd.put("COMPANY", company);
			String addOrUpdate = pd.getString("addOrUpdate");
			if(addOrUpdate != null && !"add".equals(addOrUpdate)){
				//基础段
				Map<String, Object> acctBsSgmt = entLoanAcctInfoService.getAcctBsSgmtById(pd);
				//基本信息段
				PageData acctBsInfSgmt = entLoanAcctInfoService.getAcctBsInfSgmtById(pd);
				//授信额度信息段
				PageData acctCredSgmt = entLoanAcctInfoService.getAcctCredSgmtById(pd);
				//初始债权说明段
				PageData creditorInfSgmt = entLoanAcctInfoService.getCreditorInfSgmtById(pd);
				//还款表现信息段
				PageData lbltyInfSgmt = entLoanAcctInfoService.getLbltyInfSgmtById(pd);
				String PK = pd.getString("edaAcctBsSgmtId");
				
				List<ValidateErrorMessage> validateErrors  = validateErrorMessageService.selectErrorMessageByMasterTablePK(PK);
				mv.addObject("acctBsSgmt", JSONUtils.toJSONString(acctBsSgmt));
				mv.addObject("acctBsInfSgmt", JSONUtils.toJSONString(acctBsInfSgmt));
				mv.addObject("acctCredSgmt", JSONUtils.toJSONString(acctCredSgmt));
				mv.addObject("creditorInfSgmt", JSONUtils.toJSONString(creditorInfSgmt));
				mv.addObject("lbltyInfSgmt", JSONUtils.toJSONString(lbltyInfSgmt));
				mv.addObject("feedBackErrorSgmt", validateErrors);
			}
			mv.addObject("pd", pd);
		}catch(Exception e) {
			logger.error("企业借贷信息，获取新增、修改或者详情页面失败",e);
		}
		mv.setViewName("pecr/ent/dataRecode/loanAcctInfo/entLoanAcctInfoEdit");
		return mv;
	}
	
	/**
	 * 获取账户类型为D1  页面
	 * @return
	 */
	@RequestMapping("/entLoanAcctInfoEditD1")
	public String indvLoanAcctInfoEditD1() {
		return "pecr/ent/dataRecode/loanAcctInfo/entLoanAcctInfoEditD1";
	}
	
	/**
	 * 获取账户类型为D2  页面
	 * @return
	 */
	@RequestMapping("/entLoanAcctInfoEditD2")
	public String indvLoanAcctInfoEditR2() {
		return "pecr/ent/dataRecode/loanAcctInfo/entLoanAcctInfoEditD2";
	}
	
	/**
	 * 获取账户类型为R1  页面
	 * @return
	 */
	@RequestMapping("/entLoanAcctInfoEditR1")
	public String indvLoanAcctInfoEditR1() {
		return "pecr/ent/dataRecode/loanAcctInfo/entLoanAcctInfoEditR1";
	}
	
	/**
	 * 获取账户类型为R4  页面
	 * @return
	 */
	@RequestMapping("/entLoanAcctInfoEditR4")
	public String indvLoanAcctInfoEditR4() {
		return "pecr/ent/dataRecode/loanAcctInfo/entLoanAcctInfoEditR4";
	}
	
	/**
	 * 获取账户类型为C1  页面
	 * @return
	 */
	@RequestMapping("/entLoanAcctInfoEditC1")
	public String indvLoanAcctInfoEditC1() {
		return "pecr/ent/dataRecode/loanAcctInfo/entLoanAcctInfoEditC1";
	}
	
	/**
	 * 基础段   新增或修改
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@Operate(modulName = "企业借贷基础段--新增/修改")
	@SuppressWarnings("unchecked")
	@RequestMapping("/saveAcctBsSgmt")
	@ResponseBody
	public Map<String, Object> saveAcctBsSgmt(Model model,
			HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			Session session = Jurisdiction.getSession();
			User user = (User)session.getAttribute(Const.SESSION_USER);
			String userName = user.getUSERNAME();//登录用户名
			String company = user.getCOMPANY();
			ObjectMapper mapper = new ObjectMapper();
			String pageType = request.getParameter("pageType");
			String jsonSetMap = ServletRequestUtils.getStringParameter(request,
					"str", "");
			jsonSetMap = java.net.URLDecoder.decode(jsonSetMap, "UTF-8");
			Map<String, Object> map = mapper.readValue(jsonSetMap,Map.class);
			map.put("operationUser",userName);
			map.put("COMPANY", company);
			if(pageType != null && "add".equals(pageType)){
				if(entLoanAcctInfoService.getAcctBsSgmtKey(map) > 0) {
					resultMap.put("msg", "主键重复!请将该信息删除后,重新添加数据信息!");
					resultMap.put("success", false);
				}else {
					//新增
					entLoanAcctInfoService.insertAcctBsSgmt(map);
					middleDataChangeService.changeMiddleDataMCom("410",map.get("edaAcctBsSgmtId").toString(),"add",company);

				}
			}else if(pageType != null && "edit".equals(pageType)){
				//修改
				entLoanAcctInfoService.updateAcctBsSgmt(map);
				middleDataChangeService.changeMiddleDataMCom("410",map.get("edaAcctBsSgmtId").toString(),"update",company);
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
	 * 删除 列表数据
	 * @param page
	 * @return
	 */
	@Operate(modulName = "企业借贷账户信息--删除")
	@RequestMapping("/delBasicsInfo") 
	@ResponseBody
	public Map<String, Object> delLoanAcctInfo(Page page){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			PageData pd = this.getPageData();
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("COMPANY", company);
			map.put("edaAcctBsSgmtId", pd.getString("edaAcctBsSgmtId"));
			entLoanAcctInfoService.deleteLoanAcctBsSgmt(map);
			resultMap.put("success", true);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
		}
		return resultMap;
	}
	
	
	
	/**
	 * 删除基础段
	 * @param page
	 * @return
	 */
	@Operate(modulName = "企业借贷基础段--删除")
	@SuppressWarnings("unchecked")
	@RequestMapping("/deleteAcctBsSgmt") 
	@ResponseBody
	public Map<String, Object> deleteAcctBsSgmt(Model model,
			HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			ObjectMapper mapper = new ObjectMapper();
			String jsonSetMap = ServletRequestUtils.getStringParameter(request,
					"str", "");
			jsonSetMap = java.net.URLDecoder.decode(jsonSetMap, "UTF-8");
			Map<String, Object> map = mapper.readValue(jsonSetMap,Map.class);
			map.put("COMPANY", company);
			middleDataChangeService.changeMiddleDataMCom("410",map.get("edaAcctBsSgmtId").toString(),"delete",company);

			entLoanAcctInfoService.deleteLoanAcctBsSgmt(map);
			resultMap.put("success", true);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
		}
		return resultMap;
	}
	
	/**
	 * 基本信息段   新增或修改
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@Operate(modulName = "企业借贷基本信息段--新增/修改")
	@SuppressWarnings("unchecked")
	@RequestMapping("/saveAcctBsInfoSgmt")
	@ResponseBody
	public Map<String, Object> saveAcctBsInfoSgmt(Model model,
			HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			Session session = Jurisdiction.getSession();
			User user = (User)session.getAttribute(Const.SESSION_USER);
			String userName = user.getUSERNAME();//登录用户名
			String company = user.getCOMPANY();
			ObjectMapper mapper = new ObjectMapper();
			String pageType = request.getParameter("pageType");
			String jsonSetMap = ServletRequestUtils.getStringParameter(request,
					"str", "");
			jsonSetMap = java.net.URLDecoder.decode(jsonSetMap, "UTF-8");
			Map<String, Object> map = mapper.readValue(jsonSetMap,Map.class);
			map.put("operationUser",userName);
			map.put("COMPANY", company);
			if(pageType != null && "add".equals(pageType)){
				if(entLoanAcctInfoService.getAcctBsInfoSgmtKey(map) > 0) {
					resultMap.put("msg", "主键重复!请将该信息删除后,重新添加数据信息!");
					resultMap.put("success", false);
				}else {
					//新增
					entLoanAcctInfoService.insertAcctBsInfoSgmt(map);
				}
			}else if(pageType != null && "edit".equals(pageType)){
				//修改
				entLoanAcctInfoService.updateAcctBsInfoSgmt(map);
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
	 * 删除  基本信息段
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@Operate(modulName = "企业借贷基本信息段--删除")
	@SuppressWarnings("unchecked")
	@RequestMapping("/acctBsInfSgmtDel") 
	@ResponseBody
	public Map<String, Object> acctBsInfSgmtDel(Model model,
			HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			ObjectMapper mapper = new ObjectMapper();
			String jsonSetMap = ServletRequestUtils.getStringParameter(request,
					"str", "");
			jsonSetMap = java.net.URLDecoder.decode(jsonSetMap, "UTF-8");
			Map<String, Object> map = mapper.readValue(jsonSetMap,Map.class);
			map.put("COMPANY", company);
			entLoanAcctInfoService.delAcctBsInfoSgmt(map);
			resultMap.put("success", true);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
		}
		return resultMap;
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
			List<EntRltRepymtSgmt> dataList = null;
			if(pageType != null && "edit".equals(pageType)){
				dataList = entLoanAcctInfoService.getLoanRltSgmtById(page);
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
	 * 相关还款责任人段   新增或修改
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@Operate(modulName = "企业借贷相关还款责任人段--新增/修改")
	@SuppressWarnings("unchecked")
	@RequestMapping("/saveRltRepymtInf")
	@ResponseBody
	public Map<String, Object> saveRltRepymtInf(Model model,
			HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			ObjectMapper mapper = new ObjectMapper();
			String edaAcctBsSgmtId = request.getParameter("edaAcctBsSgmtId");
			String edcRltRepymtInfSgmtId = request.getParameter("edcRltRepymtInfSgmtId");
			String jsonSetMap = ServletRequestUtils.getStringParameter(request,
					"rltData", "");
			jsonSetMap = java.net.URLDecoder.decode(jsonSetMap, "UTF-8");
			Map<String, Object> map = mapper.readValue(jsonSetMap,Map.class);
			map.put("edaAcctBsSgmtId", edaAcctBsSgmtId);
			map.put("COMPANY", company);
			map.put("edcRltRepymtInfSgmtId", edcRltRepymtInfSgmtId);
			if(entLoanAcctInfoService.getRltRepymtInfKey(map) == 0){
				//新增
				entLoanAcctInfoService.insertRltRepymtInf(map);
			}else{
				map.put("edcRltRepymtInfSgmtId", edcRltRepymtInfSgmtId);
				//更新
				entLoanAcctInfoService.updateRltRepymtInf(map);
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
	 * 删除  相关还款责任人段 
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@Operate(modulName = "企业借贷相关还款责任人段--删除")
	@SuppressWarnings("unchecked")
	@RequestMapping("/rltRepymtInfDel") 
	@ResponseBody
	public Map<String, Object> rltRepymtInfDel(Model model,
			HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			ObjectMapper mapper = new ObjectMapper();
			String jsonSetMap = ServletRequestUtils.getStringParameter(request,
					"str", "");
			jsonSetMap = java.net.URLDecoder.decode(jsonSetMap, "UTF-8");
			Map<String, Object> map = mapper.readValue(jsonSetMap,Map.class);
			map.put("COMPANY", company);
			entLoanAcctInfoService.delRltRepymtInf(map);
			resultMap.put("success", true);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
		}
		return resultMap;
	}
	
	/**
	 * 新增或修改   还款表现信息段
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@Operate(modulName = "企业借贷还款表现信息段--新增/修改")
	@SuppressWarnings("unchecked")
	@RequestMapping("/saveLbltyInfSgmt")
	@ResponseBody
	public Map<String, Object> saveLbltyInfSgmt(Model model,
			HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			ObjectMapper mapper = new ObjectMapper();
			String pageType = request.getParameter("pageType");
			String jsonSetMap = ServletRequestUtils.getStringParameter(request,
					"str", "");
			jsonSetMap = java.net.URLDecoder.decode(jsonSetMap, "UTF-8");
			Map<String, Object> map = mapper.readValue(jsonSetMap,Map.class);
			map.put("COMPANY", company);
			if(pageType != null && "add".equals(pageType)){
				if(entLoanAcctInfoService.getLbltyInfSgmtKey(map) > 0) {
					resultMap.put("msg", "主键重复!请将该信息删除后,重新添加数据信息!");
					resultMap.put("success", false);
				}else {
					//新增
					entLoanAcctInfoService.insertLbltyInfSgmt(map);
				}
			}else if(pageType != null && "edit".equals(pageType)){
				//修改
				entLoanAcctInfoService.updateLbltyInfSgmt(map);
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
	 * 删除  还款表现信息段
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@Operate(modulName = "企业借贷还款表现信息段--删除")
	@SuppressWarnings("unchecked")
	@RequestMapping("/deleteLbltyInfSgmt") 
	@ResponseBody
	public Map<String, Object> deleteLbltyInfSgmt(Model model,
			HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			ObjectMapper mapper = new ObjectMapper();
			String jsonSetMap = ServletRequestUtils.getStringParameter(request,
					"str", "");
			jsonSetMap = java.net.URLDecoder.decode(jsonSetMap, "UTF-8");
			Map<String, Object> map = mapper.readValue(jsonSetMap,Map.class);
			map.put("COMPANY", company);
			entLoanAcctInfoService.delLbltyInfSgmt(map);
			resultMap.put("success", true);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
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
				dataList = entLoanAcctInfoService.getMccInfoSgmtById(page);
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
	 * 抵质押物信息段   新增或修改
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@Operate(modulName = "企业借贷抵质押物信息段--新增/修改")
	@SuppressWarnings("unchecked")
	@RequestMapping("/saveMccInf")
	@ResponseBody
	public Map<String, Object> savemccInf(Model model,
			HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			ObjectMapper mapper = new ObjectMapper();
			String edaAcctBsSgmtId = request.getParameter("edaAcctBsSgmtId");
			String eddMotgaCltalCtrctInfId = request.getParameter("eddMotgaCltalCtrctInfId");
			String jsonSetMap = ServletRequestUtils.getStringParameter(request,
					"mccData", "");
			jsonSetMap = java.net.URLDecoder.decode(jsonSetMap, "UTF-8");
			Map<String, Object> map = mapper.readValue(jsonSetMap,Map.class);
			map.put("edaAcctBsSgmtId", edaAcctBsSgmtId);
			map.put("COMPANY", company);
			map.put("eddMotgaCltalCtrctInfId", eddMotgaCltalCtrctInfId);
			if(entLoanAcctInfoService.getmccInfKey(map) == 0){
				//新增
				entLoanAcctInfoService.insertMccInf(map);
			}else{
				map.put("eddMotgaCltalCtrctInfId", eddMotgaCltalCtrctInfId);
				//更新
				entLoanAcctInfoService.updateMccInf(map);
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
	 * 删除  抵质押物信息段 
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@Operate(modulName = "企业借贷抵质押物信息段--删除")
	@SuppressWarnings("unchecked")
	@RequestMapping("/mccInfDel") 
	@ResponseBody
	public Map<String, Object> mccInfDel(Model model,
			HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			ObjectMapper mapper = new ObjectMapper();
			String jsonSetMap = ServletRequestUtils.getStringParameter(request,
					"str", "");
			jsonSetMap = java.net.URLDecoder.decode(jsonSetMap, "UTF-8");
			Map<String, Object> map = mapper.readValue(jsonSetMap,Map.class);
			map.put("COMPANY", company);
			entLoanAcctInfoService.delMccInf(map);
			resultMap.put("success", true);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
		}
		return resultMap;
	}
	
	/**
	 * 新增或修改   授信额度信息段
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@Operate(modulName = "企业借贷授信额度信息段--新增/修改")
	@SuppressWarnings("unchecked")
	@RequestMapping("/saveAcctCredSgmt")
	@ResponseBody
	public Map<String, Object> saveAcctCredSgmt(Model model,
			HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			ObjectMapper mapper = new ObjectMapper();
			String pageType = request.getParameter("pageType");
			String jsonSetMap = ServletRequestUtils.getStringParameter(request,
					"str", "");
			jsonSetMap = java.net.URLDecoder.decode(jsonSetMap, "UTF-8");
			Map<String, Object> map = mapper.readValue(jsonSetMap,Map.class);
			map.put("COMPANY", company);
			if(pageType != null && "add".equals(pageType)){
				if(entLoanAcctInfoService.getAcctCredSgmtKey(map) > 0) {
					resultMap.put("msg", "主键重复!请将该信息删除后,重新添加数据信息!");
					resultMap.put("success", false);
				}else {
					//新增
					entLoanAcctInfoService.insertAcctCredSgmt(map);
				}
			}else if(pageType != null && "edit".equals(pageType)){
				//修改
				entLoanAcctInfoService.updateAcctCredSgmt(map);
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
	 * 删除  授信额度信息段
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@Operate(modulName = "企业借贷授信额度信息段--删除")
	@SuppressWarnings("unchecked")
	@RequestMapping("/acctCredSgmtDel") 
	@ResponseBody
	public Map<String, Object> acctCredSgmtDel(Model model,
			HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			ObjectMapper mapper = new ObjectMapper();
			String jsonSetMap = ServletRequestUtils.getStringParameter(request,
					"str", "");
			jsonSetMap = java.net.URLDecoder.decode(jsonSetMap, "UTF-8");
			Map<String, Object> map = mapper.readValue(jsonSetMap,Map.class);
			map.put("COMPANY", company);
			entLoanAcctInfoService.delAcctCredSgmt(map);
			resultMap.put("success", true);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
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
				dataList = entLoanAcctInfoService.getTrstDspnSgmtById(page);
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
	 * 特殊交易说明段   新增或修改
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@Operate(modulName = "企业借贷特殊交易说明段--新增/修改")
	@SuppressWarnings("unchecked")
	@RequestMapping("/saveTrstDspnSgmt")
	@ResponseBody
	public Map<String, Object> saveTrstDspnSgmt(Model model,
			HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			ObjectMapper mapper = new ObjectMapper();
			String edaAcctBsSgmtId = request.getParameter("edaAcctBsSgmtId");
			String edhAcctSpecTrstDspnSgId = request.getParameter("edhAcctSpecTrstDspnSgId");
			String jsonSetMap = ServletRequestUtils.getStringParameter(request,
					"busData", "");
			jsonSetMap = java.net.URLDecoder.decode(jsonSetMap, "UTF-8");
			Map<String, Object> map = mapper.readValue(jsonSetMap,Map.class);
			map.put("COMPANY", company);
			map.put("edaAcctBsSgmtId", edaAcctBsSgmtId);
			map.put("edhAcctSpecTrstDspnSgId", edhAcctSpecTrstDspnSgId);
			if(entLoanAcctInfoService.getTrstDspnSgmtKey(map) == 0){
				//新增
				entLoanAcctInfoService.insertTrstDspn(map);;
			}else{
				map.put("edhAcctSpecTrstDspnSgId", edhAcctSpecTrstDspnSgId);
				//更新
				entLoanAcctInfoService.updateTrstDspn(map);
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
	 * 删除  特殊交易说明段
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@Operate(modulName = "企业借贷特殊交易说明段--删除")
	@SuppressWarnings("unchecked")
	@RequestMapping("/trstDspnSgmtDel") 
	@ResponseBody
	public Map<String, Object> trstDspnSgmtDel(Model model,
			HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			ObjectMapper mapper = new ObjectMapper();
			String jsonSetMap = ServletRequestUtils.getStringParameter(request,
					"str", "");
			jsonSetMap = java.net.URLDecoder.decode(jsonSetMap, "UTF-8");
			Map<String, Object> map = mapper.readValue(jsonSetMap,Map.class);
			map.put("COMPANY", company);
			entLoanAcctInfoService.delTrstDspn(map);
			resultMap.put("success", true);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
		}
		return resultMap;
	}
	
	/**
	 * 新增或修改   初始债权说明段
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@Operate(modulName = "企业借贷初始债权说明段--新增/修改")
	@SuppressWarnings("unchecked")
	@RequestMapping("/saveCreditorInfSgmt")
	@ResponseBody
	public Map<String, Object> saveCreditorInfSgmt(Model model,
			HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			ObjectMapper mapper = new ObjectMapper();
			String pageType = request.getParameter("pageType");
			String jsonSetMap = ServletRequestUtils.getStringParameter(request,
					"str", "");
			jsonSetMap = java.net.URLDecoder.decode(jsonSetMap, "UTF-8");
			Map<String, Object> map = mapper.readValue(jsonSetMap,Map.class);
			map.put("COMPANY", company);
			if(pageType != null && "add".equals(pageType)){
				if(entLoanAcctInfoService.getOcInfSgmtKey(map) > 0) {
					resultMap.put("msg", "主键重复!请将该信息删除后,重新添加数据信息!");
					resultMap.put("success", false);
				}else {
					//新增
					entLoanAcctInfoService.insertOcInfSgmt(map);
				}
			}else if(pageType != null && "edit".equals(pageType)){
				//修改
				entLoanAcctInfoService.updateOcInfSgmt(map);
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
	 * 删除  初始债权说明段
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@Operate(modulName = "企业借贷初始债权说明段--删除")
	@SuppressWarnings("unchecked")
	@RequestMapping("/delCreditorInfSgmt") 
	@ResponseBody
	public Map<String, Object> delCreditorInfSgmt(Model model,
			HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			ObjectMapper mapper = new ObjectMapper();
			String jsonSetMap = ServletRequestUtils.getStringParameter(request,
					"str", "");
			jsonSetMap = java.net.URLDecoder.decode(jsonSetMap, "UTF-8");
			Map<String, Object> map = mapper.readValue(jsonSetMap,Map.class);
			map.put("COMPANY", company);
			entLoanAcctInfoService.delOcInfSgmt(map);
			resultMap.put("success", true);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
		}
		return resultMap;
	}
}
