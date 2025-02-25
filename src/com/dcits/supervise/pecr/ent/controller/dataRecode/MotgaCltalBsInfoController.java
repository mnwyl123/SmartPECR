package com.dcits.supervise.pecr.ent.controller.dataRecode;

import java.util.ArrayList;
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
import com.dcits.supervise.pecr.ent.entity.MotgaCltalCtrctBsSgmt;
import com.dcits.supervise.pecr.ent.service.dataRecode.MotgaCltalBsInfoManager;
import com.dcits.supervise.pecr.log.Operate;
import com.dcits.supervise.pecr.validateData.model.ValidateErrorMessage;
import com.dcits.supervise.pecr.validateData.service.ValidateErrorMessageService;

/**
 * 抵（质）押合同信息
 * 企业、个人抵质押合同信息 上报信息段一致   共用
 * @author leizx
 *
 */
@Controller
@RequestMapping("/motgaInfo")
public class MotgaCltalBsInfoController extends BaseController{

	@Autowired
	private MotgaCltalBsInfoManager motgaCltalBsInfoService;
	@Autowired
	private MiddleDataChangeService middleDataChangeService;
	@Autowired
	private ValidateErrorMessageService validateErrorMessageService;
	
	/**
	 * 数据列表界面
	 * @return
	 */
	@RequestMapping("/dataPage")
	public String dataPage(Page page) {
		return "pecr/mortgage/motgaContractInfoList";
	}
	
	/**
	 * 删除 列表数据
	 * @param page
	 * @return
	 */
	@Operate(modulName = "删除抵(质)押合同信息")
	@RequestMapping("/delMotgaContractInfo") 
	@ResponseBody
	public Map<String, Object> delMotgaContractInfo(Page page){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			PageData pd = this.getPageData();
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("COMPANY", company);
			map.put("efaMotgaCltalCtrctBsId", pd.getString("efaMotgaCltalCtrctBsId"));
			motgaCltalBsInfoService.deleteMotgaCltalBsSgmt(map);
			resultMap.put("success", true);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
		}
		return resultMap;
	}
	
	/**
	 * 获取表格数据列表
	 * @param page
	 * @return
	 */
	@RequestMapping("/motgaContractInfoList")
	@ResponseBody
	public Map<String, Object> motgaContractInfoList(Page page){
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
			List<MotgaCltalCtrctBsSgmt> dataList = motgaCltalBsInfoService.getMotgaContractInfoList(page);
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
	@RequestMapping("/motgaContractInfoEdit")
	public ModelAndView motgaContractInfoEdit(Page page) {
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
				Map<String, Object> motgaCltalBsSgmt = motgaCltalBsInfoService.getMotgaCltalBsSgmtById(pd);
				//基本信息段
				PageData motgaCltalInfSgmt = motgaCltalBsInfoService.getMotgaCltalInfById(pd);
				String PK = pd.getString("efaMotgaCltalCtrctBsId");
				List<ValidateErrorMessage> validateErrors  = validateErrorMessageService.selectErrorMessageByMasterTablePK(PK);
				mv.addObject("motgaCltalBsSgmt", JSONUtils.toJSONString(motgaCltalBsSgmt));
				mv.addObject("motgaCltalInfSgmt", JSONUtils.toJSONString(motgaCltalInfSgmt));
				mv.addObject("feedBackErrorSgmt", validateErrors);
			}
			mv.addObject("pd", pd);
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		mv.setViewName("pecr/mortgage/motgaContractInfoEdit");
		return mv;
	}
	
	/**
	 * 基础段   新增或修改
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@Operate(modulName = "新增/修改抵(质)押合同基础段")
	@SuppressWarnings("unchecked")
	@RequestMapping("/saveMotgaCltalSgmt")
	@ResponseBody
	public Map<String, Object> saveMotgaCltalSgmt(Model model,
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
			map.put("COMPANY", company);
			map.put("operationUser",userName);
			if(pageType != null && "add".equals(pageType)){
				if(motgaCltalBsInfoService.getMotgaCltalBsSgmtKey(map) > 0) {
					resultMap.put("msg", "主键重复!请将该信息删除后,重新添加数据信息!");
					resultMap.put("success", false);
				}else {
					//新增
					motgaCltalBsInfoService.insertMotgaCltalBsSgmt(map);
					middleDataChangeService.changeMiddleDataMCom("510",map.get("efaMotgaCltalCtrctBsId").toString(),"add",company);

				}
			}else if(pageType != null && "edit".equals(pageType)){
				//修改
				motgaCltalBsInfoService.updateMotgaCltalBsSgmt(map);
				middleDataChangeService.changeMiddleDataMCom("510",map.get("efaMotgaCltalCtrctBsId").toString(),"update",company);
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
	@Operate(modulName = "删除抵(质)押合同基础段	")
	@SuppressWarnings("unchecked")
	@RequestMapping("/delMotgaCltalSgmt") 
	@ResponseBody
	public Map<String, Object> delMotgaCltalSgmt(Model model,
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
			middleDataChangeService.changeMiddleDataMCom("510",map.get("efaMotgaCltalCtrctBsId").toString(),"delete",company);

			motgaCltalBsInfoService.deleteMotgaCltalBsSgmt(map);
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
	@Operate(modulName = "新增/修改抵(质)押合同基本信息段")
	@SuppressWarnings("unchecked")
	@RequestMapping("/saveMotgaCltalInfo")
	@ResponseBody
	public Map<String, Object> saveMotgaCltalInfo(Model model,
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
				if(motgaCltalBsInfoService.getMotgaCltalInfoKey(map) > 0) {
					resultMap.put("msg", "主键重复!请将该信息删除后,重新添加数据信息!");
					resultMap.put("success", false);
				}else {
					//新增
					motgaCltalBsInfoService.insertMotgaCltalInfo(map);
				}
			}else if(pageType != null && "edit".equals(pageType)){
				//修改
				motgaCltalBsInfoService.updateMotgaCltalInfo(map);
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
	@Operate(modulName = "删除抵(质)押合同基本信息段")
	@SuppressWarnings("unchecked")
	@RequestMapping("/delMotgaCltalInfo") 
	@ResponseBody
	public Map<String, Object> delMotgaCltalInfo(Model model,
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
			motgaCltalBsInfoService.delMotgaCltalInfo(map);
			resultMap.put("success", true);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
		}
		return resultMap;
	}
	
	/**
	 * 获取其他债务人信息段
	 * @param pd
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getComRecInfSgmtList")
	public Map<String, Object> getComRecInfSgmtList(Page page){
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
				dataList = motgaCltalBsInfoService.getComRecInfSgmtById(page);
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
	 * 其他债务人信息段   新增或修改
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@Operate(modulName = "新增/修改其他债务人信息段")
	@SuppressWarnings("unchecked")
	@RequestMapping("/saveComRecInfSgmt")
	@ResponseBody
	public Map<String, Object> saveComRecInfSgmt(Model model,
			HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			ObjectMapper mapper = new ObjectMapper();
			String efaMotgaCltalCtrctBsId = request.getParameter("efaMotgaCltalCtrctBsId");
			String efcComRecInfSgmtId = request.getParameter("efcComRecInfSgmtId");
			String jsonSetMap = ServletRequestUtils.getStringParameter(request,
					"rltData", "");
			jsonSetMap = java.net.URLDecoder.decode(jsonSetMap, "UTF-8");
			Map<String, Object> map = mapper.readValue(jsonSetMap,Map.class);
			map.put("COMPANY", company);
			map.put("efaMotgaCltalCtrctBsId", efaMotgaCltalCtrctBsId);
			if(efcComRecInfSgmtId == null || efcComRecInfSgmtId.length() <= 0){
				//新增
				motgaCltalBsInfoService.insertComRecInfSgmt(map);;
			}else{
				map.put("efcComRecInfSgmtId", efcComRecInfSgmtId);
				//更新
				motgaCltalBsInfoService.updateComRecInfSgmt(map);
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
	 * 删除  其他债务人信息段 
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@Operate(modulName = "删除其他债务人信息段")
	@SuppressWarnings("unchecked")
	@RequestMapping("/delComRecInfSgmt") 
	@ResponseBody
	public Map<String, Object> delComRecInfSgmt(Model model,
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
			motgaCltalBsInfoService.delComRecInfSgmt(map);
			resultMap.put("success", true);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
		}
		return resultMap;
	}
	
	/**
	 * 获取  抵押物信息段
	 * @param pd
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getMotgaProptInfList")
	public Map<String, Object> getMotgaProptInfList(Page page){
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
				dataList = motgaCltalBsInfoService.getMotgaProptInfListById(page);
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
	 * 抵押物信息段   新增或修改
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@Operate(modulName = "新增/修改抵押物信息段")
	@SuppressWarnings("unchecked")
	@RequestMapping("/saveMotgaProptInf")
	@ResponseBody
	public Map<String, Object> saveMotgaProptInf(Model model,
			HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			ObjectMapper mapper = new ObjectMapper();
			String efaMotgaCltalCtrctBsId = request.getParameter("efaMotgaCltalCtrctBsId");
			String efdMotgaProptInfSgmtId = request.getParameter("efdMotgaProptInfSgmtId");
			String jsonSetMap = ServletRequestUtils.getStringParameter(request,
					"mccData", "");
			jsonSetMap = java.net.URLDecoder.decode(jsonSetMap, "UTF-8");
			Map<String, Object> map = mapper.readValue(jsonSetMap,Map.class);
			map.put("COMPANY", company);
			map.put("efaMotgaCltalCtrctBsId", efaMotgaCltalCtrctBsId);
			if(efdMotgaProptInfSgmtId == null || efdMotgaProptInfSgmtId.length() <= 0){
				//新增
				motgaCltalBsInfoService.insertMotgaProptInf(map);;
			}else{
				map.put("efdMotgaProptInfSgmtId", efdMotgaProptInfSgmtId);
				//更新
				motgaCltalBsInfoService.updateMotgaProptInf(map);
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
	 * 删除  抵押物信息段 
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@Operate(modulName = "删除抵押物信息段")
	@SuppressWarnings("unchecked")
	@RequestMapping("/delMotgaProptInf") 
	@ResponseBody
	public Map<String, Object> delMotgaProptInf(Model model,
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
			motgaCltalBsInfoService.delMotgaProptInf(map);
			resultMap.put("success", true);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
		}
		return resultMap;
	}
	
	/**
	 * 获取  质物信息段
	 * @param pd
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getCltalInfList")
	public Map<String, Object> getCltalInfList(Page page){
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
				dataList = motgaCltalBsInfoService.getCltalInfListById(page);
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
	 * 质物信息段   新增或修改
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@Operate(modulName = "新增/修改质押物信息段")
	@SuppressWarnings("unchecked")
	@RequestMapping("/saveCltalInf")
	@ResponseBody
	public Map<String, Object> saveCltalInf(Model model,
			HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			ObjectMapper mapper = new ObjectMapper();
			String efaMotgaCltalCtrctBsId = request.getParameter("efaMotgaCltalCtrctBsId");
			String efeCltalInfSgmtId = request.getParameter("efeCltalInfSgmtId");
			String jsonSetMap = ServletRequestUtils.getStringParameter(request,
					"busData", "");
			jsonSetMap = java.net.URLDecoder.decode(jsonSetMap, "UTF-8");
			Map<String, Object> map = mapper.readValue(jsonSetMap,Map.class);
			map.put("COMPANY", company);
			map.put("efaMotgaCltalCtrctBsId", efaMotgaCltalCtrctBsId);
			if(efeCltalInfSgmtId == null || efeCltalInfSgmtId.length() <= 0){
				//新增
				motgaCltalBsInfoService.insertCltalInf(map);;
			}else{
				map.put("efeCltalInfSgmtId", efeCltalInfSgmtId);
				//更新
				motgaCltalBsInfoService.updateCltalInf(map);
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
	 * 删除  质物信息段
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@Operate(modulName = "删除质押物信息段")
	@SuppressWarnings("unchecked")
	@RequestMapping("/delCltalInf") 
	@ResponseBody
	public Map<String, Object> delCltalInf(Model model,
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
			motgaCltalBsInfoService.delCltalInf(map);
			resultMap.put("success", true);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
		}
		return resultMap;
	}
	
}
