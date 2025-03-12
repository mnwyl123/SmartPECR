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
import com.dcits.supervise.pecr.ent.entity.EnSecAcctInf;
import com.dcits.supervise.pecr.ent.service.dataRecode.EnSecAcctInfManager;
import com.dcits.supervise.pecr.log.Operate;
import com.dcits.supervise.pecr.validateData.model.ValidateErrorMessage;
import com.dcits.supervise.pecr.validateData.service.ValidateErrorMessageService;

/**
 * 企业担保账户信息
 * @author 穆楠
 *
 */
@Controller
@RequestMapping("/enSecAcctInf")
public class EnSecAcctInfController extends BaseController{

	@Autowired
	private EnSecAcctInfManager enSecAcctInfService;
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
		return "pecr/ent/dataRecode/enSecAcctInf/enSecAcctInfList";
	}
	
	/**
	 * 获取表格数据列表
	 * @param page
	 * @return
	 */
	@RequestMapping("/enSecAcctInfList")
	@ResponseBody
	public Map<String, Object> enSecAcctInfList(Page page){
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
			List<EnSecAcctInf> dataList = enSecAcctInfService.getenSecAcctInfList(page);
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
	 * 删除 列表数据
	 * @param page
	 * @return
	 */
	@Operate(modulName = "企业担保信息--删除")
	@RequestMapping("/delEnSecAcctInfList") 
	@ResponseBody
	public Map<String, Object> delEnSecAcctInfList(Page page){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			PageData pd = this.getPageData();
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("COMPANY", company);
			map.put("eeaGuarAcctBsSgmtId", pd.getString("eeaGuarAcctBsSgmtId"));
			enSecAcctInfService.delEnSecAcctInfById(map);
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
		try {
			PageData pd = this.getPageData();
			pd.put("COMPANY", company);
			String addOrUpdate = pd.getString("addOrUpdate");
			if(addOrUpdate != null && !"add".equals(addOrUpdate)){
				//基础段
				Map<String, Object> enSecAcctInf = enSecAcctInfService.getenSecAcctInfById(pd);
				//基本信息段
				PageData guarAcctBsInfSgmt = enSecAcctInfService.getGuarAcctBsInfSgmtById(pd);
				//账户信息授信额度信息段
				PageData acctCredSgmt = enSecAcctInfService.getacctCredSgmtById(pd);
				//在保责任信息段
				PageData repymtInfSgmt = enSecAcctInfService.getRepymtInfSgmtById(pd);
				String PK = pd.getString("eeaGuarAcctBsSgmtId");
				List<ValidateErrorMessage> validateErrors  = validateErrorMessageService.selectErrorMessageByMasterTablePK(PK);
				mv.addObject("enSecAcctInf", JSONUtils.toJSONString(enSecAcctInf));
				mv.addObject("guarAcctBsInfSgmt", JSONUtils.toJSONString(guarAcctBsInfSgmt));
				mv.addObject("acctCredSgmt", JSONUtils.toJSONString(acctCredSgmt));
				mv.addObject("repymtInfSgmt", JSONUtils.toJSONString(repymtInfSgmt));
				mv.addObject("feedBackErrorSgmt", validateErrors);
			}
			mv.addObject("pd", pd);
		}catch(Exception e) {
			logger.error("企业担保信息 获取详情、修改、新增页面失败",e);
		}
		mv.setViewName("pecr/ent/dataRecode/enSecAcctInf/enSecAcctInfEdit");
		return mv;
	}
	
	/**
	 * 获取相关还款责任人段
	 * @param page
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
				dataList = enSecAcctInfService.getRltInfList(page);
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
				dataList = enSecAcctInfService.getMccInfList(page);
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
	 * 基础段   新增或修改
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@Operate(modulName = "企业担保基础段--新增/修改")
	@SuppressWarnings("unchecked")
	@RequestMapping("/saveEnSecAcctInf")
	@ResponseBody
	public Map<String, Object> saveEnSecAcctInf(Model model,
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
				if(enSecAcctInfService.getEnSecAcctInfKey(map) > 0) {
					resultMap.put("msg", "主键重复!请将该信息删除后,重新添加数据信息!");
					resultMap.put("success", false);
				}else {
					//新增
					enSecAcctInfService.insertEnSecAcctInf(map);
					middleDataChangeService.changeMiddleDataMCom("440",map.get("eeaGuarAcctBsSgmtId").toString(),"add",company);

				}
			}else if(pageType != null && "edit".equals(pageType)){
				//修改
				enSecAcctInfService.updateEnSecAcctInf(map);
				middleDataChangeService.changeMiddleDataMCom("440",map.get("eeaGuarAcctBsSgmtId").toString(),"update",company);
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
	 * 删除基础段
	 * @param page
	 * @return
	 */
	@Operate(modulName = "企业担保基础段--删除")
	@SuppressWarnings("unchecked")
	@RequestMapping("/delEnSecAcctInf") 
	@ResponseBody
	public Map<String, Object> delEnSecAcctInf(Model model,
			HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			PageData pd = this.getPageData();
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("COMPANY", company);
			map.put("eeaGuarAcctBsSgmtId", pd.getString("eeaGuarAcctBsSgmtId"));
			middleDataChangeService.changeMiddleDataMCom("440",map.get("eeaGuarAcctBsSgmtId").toString(),"delete",company);

			enSecAcctInfService.delEnSecAcctInfById(map);
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
	@Operate(modulName = "企业担保基本信息段--新增/修改")
	@SuppressWarnings("unchecked")
	@RequestMapping("/saveGuarAcctBsInfSgmt")
	@ResponseBody
	public Map<String, Object> saveGuarAcctBsInfSgmt(Model model,
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
				if(enSecAcctInfService.getGuarAcctBsInfSgmtKey(map) > 0) {
					resultMap.put("msg", "主键重复!请将该信息删除后,重新添加数据信息!");
					resultMap.put("success", false);
				}else {
					//新增
					enSecAcctInfService.insertGuarAcctBsInfSgmt(map);
				}
			}else if(pageType != null && "edit".equals(pageType)){
				//修改
				enSecAcctInfService.updateGuarAcctBsInfSgmt(map);
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
	@Operate(modulName = "企业担保基本信息段--删除")
	@SuppressWarnings("unchecked")
	@RequestMapping("/guarAcctBsInfSgmtDel") 
	@ResponseBody
	public Map<String, Object> guarAcctBsInfSgmtDel(Model model,
			HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			ObjectMapper mapper = new ObjectMapper();
			String jsonSetMap = ServletRequestUtils.getStringParameter(request,
					"str", "");
			jsonSetMap = java.net.URLDecoder.decode(jsonSetMap, "UTF-8");
			Map<String, Object> map = mapper.readValue(jsonSetMap,Map.class);
			enSecAcctInfService.delGuarAcctBsInfSgmt(map);
			resultMap.put("success", true);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
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
	@Operate(modulName = "企业担保相关还款责任人段--新增/修改")
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
			String eeaGuarAcctBsSgmtId = request.getParameter("eeaGuarAcctBsSgmtId");
			String eecRltRepymtInfSgmtId = request.getParameter("eecRltRepymtInfSgmtId");
			String jsonSetMap = ServletRequestUtils.getStringParameter(request,
					"rltData", "");
			jsonSetMap = java.net.URLDecoder.decode(jsonSetMap, "UTF-8");
			Map<String, Object> map = mapper.readValue(jsonSetMap,Map.class);
			map.put("COMPANY", company);
			map.put("eeaGuarAcctBsSgmtId", eeaGuarAcctBsSgmtId);
			map.put("eecRltRepymtInfSgmtId", eecRltRepymtInfSgmtId);
			
			if(enSecAcctInfService.getRltRepymtInfKey(map) > 0 ){
			//更新
				enSecAcctInfService.updateRltRepymtInf(map);
			}else{
				//新增	
				enSecAcctInfService.insertRltRepymtInf(map);;
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
	@Operate(modulName = "企业担保相关还款责任人段--删除")
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
			map.put("COMPANY",company);
			enSecAcctInfService.delRltRepymtInf(map);
			resultMap.put("success", true);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
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
	@Operate(modulName = "企业抵质押物信息段--新增/修改")
	@SuppressWarnings("unchecked")
	@RequestMapping("/saveMccInf")
	@ResponseBody
	public Map<String, Object> saveMccInf(Model model,
			HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			ObjectMapper mapper = new ObjectMapper();
			String eeaGuarAcctBsSgmtId = request.getParameter("eeaGuarAcctBsSgmtId");
			String eedGuarMotgaCltalInfId = request.getParameter("eedGuarMotgaCltalInfId");
			String jsonSetMap = ServletRequestUtils.getStringParameter(request,
					"mccData", "");
			jsonSetMap = java.net.URLDecoder.decode(jsonSetMap, "UTF-8");
			Map<String, Object> map = mapper.readValue(jsonSetMap,Map.class);
			map.put("COMPANY", company);
			map.put("eeaGuarAcctBsSgmtId", eeaGuarAcctBsSgmtId);
			map.put("eedGuarMotgaCltalInfId", eedGuarMotgaCltalInfId);
			if(enSecAcctInfService.getMccInfKey(map) > 0 ){
			
				//更新
				enSecAcctInfService.updateMccInf(map);
			}else{
				//新增
				enSecAcctInfService.insertMccInf(map);
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
	@Operate(modulName = "企业抵质押物信息段--删除")
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
			enSecAcctInfService.delMccInf(map);
			resultMap.put("success", true);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
		}
		return resultMap;
	}
	
	/**
	 * 新增或修改   账户信息授信额度信息段
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@Operate(modulName = "企业担保授信额度信息段--新增/修改")
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
				if(enSecAcctInfService.getAcctCredSgmtKey(map) > 0) {
					resultMap.put("msg", "主键重复!请将该信息删除后,重新添加数据信息!");
					resultMap.put("success", false);
				}else {
					//新增
					enSecAcctInfService.insertAcctCredSgmt(map);
				}
			}else if(pageType != null && "edit".equals(pageType)){
				//修改
				enSecAcctInfService.updateAcctCredSgmt(map);
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
	 * 删除  账户信息授信额度信息段
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@Operate(modulName = "企业担保授信额度信息段--删除")
	@SuppressWarnings("unchecked")
	@RequestMapping("/delAcctCredSgmt") 
	@ResponseBody
	public Map<String, Object> delAcctCredSgmt(Model model,
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
			enSecAcctInfService.delAcctCredSgmt(map);
			resultMap.put("success", true);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
		}
		return resultMap;
	}
	
	/**
	 * 新增或修改   在保责任信息段
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@Operate(modulName = "企业担保在保责任信息段--新增/修改")
	@SuppressWarnings("unchecked")
	@RequestMapping("/saveRepymtInfSgmt")
	@ResponseBody
	public Map<String, Object> saveRepymtInfSgmt(Model model,
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
				if(enSecAcctInfService.getRepymtInfSgmtKey(map) > 0) {
					resultMap.put("msg", "主键重复!请将该信息删除后,重新添加数据信息!");
					resultMap.put("success", false);
				}else {
					//新增
					enSecAcctInfService.insertRepymtInfSgmt(map);
				}
			}else if(pageType != null && "edit".equals(pageType)){
				//修改
				enSecAcctInfService.updateRepymtInfSgmt(map);
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
	 * 删除  在保责任信息段
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@Operate(modulName = "企业担保在保责任信息段--删除")
	@SuppressWarnings("unchecked")
	@RequestMapping("/delRepymtInfSgmt") 
	@ResponseBody
	public Map<String, Object> delRepymtInfSgmt(Model model,
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
			enSecAcctInfService.delRepymtInfSgmt(map);
			resultMap.put("success", true);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
		}
		return resultMap;
	}

}
