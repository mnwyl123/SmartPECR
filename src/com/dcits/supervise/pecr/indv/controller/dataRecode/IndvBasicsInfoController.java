package com.dcits.supervise.pecr.indv.controller.dataRecode;

import com.alibaba.druid.support.json.JSONUtils;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.common.service.MiddleDataChangeService;
import com.dcits.supervise.pecr.indv.entity.PecrIndvBsSgmt;
import com.dcits.supervise.pecr.indv.entity.PecrIndvIdSgmt;
import com.dcits.supervise.pecr.indv.service.dataRecode.IndvBasicsInfoManager;
import com.dcits.supervise.pecr.log.Operate;
import com.dcits.supervise.pecr.validateData.model.ValidateErrorMessage;
import com.dcits.supervise.pecr.validateData.service.ValidateErrorMessageService;

import org.apache.shiro.session.Session;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 个人基本信息
 * @author munan
 *
 */
@Controller
@RequestMapping("/indvBasicsInfo")
public class IndvBasicsInfoController extends BaseController{

	@Autowired
	private IndvBasicsInfoManager indvBasicsInfoService;
	
	@Autowired
	private MiddleDataChangeService middleDataChangeService;
	
	@Autowired
	private ValidateErrorMessageService validateErrorMessageService;
	/**
	 * 数据列表界面
	 * @return
	 */
	@RequestMapping("/indvBasicsInfoPage")
	public String dataPage() {
		return "pecr/indv/dataRecode/indvBasicsInfoList";
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
			pd.put("queryType", "APPLY");
			Boolean flag = (Boolean) session.getAttribute(user.getUSER_ID()+"isCompany");
			pd.put("managerId",flag?"":user.getUSERNAME());
			int pge = Integer.parseInt(pd.getString("page"));
			int limit = Integer.parseInt(pd.getString("limit"));
			page.setCurrentPage(pge);
			page.setShowCount(limit);
			page.setPd(pd);
			List<PecrIndvBsSgmt> dataList = indvBasicsInfoService.dataBsSgmtList(page);
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
			PageData basBsSgmt = indvBasicsInfoService.getPcBasBsSgmtById(pd);
			PageData basFcsInfoSgmt = indvBasicsInfoService.getPcBasFcsInfSgmtById(pd);
			PageData basSpsInfoSgmt = indvBasicsInfoService.getPcBasSpsInfSgmtById(pd);
			PageData basEduInfoSgmt = indvBasicsInfoService.getPcBasEduInfSgmtById(pd);
			PageData basOctpnInfoSgmt = indvBasicsInfoService.getPcBasOctpnInfSgmtById(pd);
			PageData basRedncInfoSgmt = indvBasicsInfoService.getPcBasRedncInfSgmtById(pd); 
			PageData basMlgInfoSgmt = indvBasicsInfoService.getPcBasMlgInfSgmtById(pd);
			PageData basIncInfSgmt = indvBasicsInfoService.getPcBasIncInfSgmtById(pd);
			String PK = pd.getString("paaBsSmgtId");
			List<ValidateErrorMessage> validateErrors  = validateErrorMessageService.selectErrorMessageByMasterTablePK(PK);
			
			mv.addObject("basBsSgmt", JSONUtils.toJSONString(basBsSgmt));
			mv.addObject("basFcsInfoSgmt", JSONUtils.toJSONString(basFcsInfoSgmt));
			mv.addObject("basSpsInfoSgmt", JSONUtils.toJSONString(basSpsInfoSgmt));
			mv.addObject("basEduInfoSgmt", JSONUtils.toJSONString(basEduInfoSgmt));
			mv.addObject("basOctpnInfoSgmt", JSONUtils.toJSONString(basOctpnInfoSgmt));
			mv.addObject("basRedncInfoSgmt", JSONUtils.toJSONString(basRedncInfoSgmt));
			mv.addObject("basMlgInfoSgmt", JSONUtils.toJSONString(basMlgInfoSgmt));
			mv.addObject("basIncInfSgmt", JSONUtils.toJSONString(basIncInfSgmt));
			mv.addObject("feedBackErrorSgmt", validateErrors);
			mv.addObject("pd", pd);
		}catch(Exception e) {
			logger.error("个人基本信息:获取detail页面失败：",e);
		}
		
		mv.setViewName("pecr/indv/dataRecode/indvBasicsInfoDetail");
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
			    dataList = indvBasicsInfoService.getPecrIndvIdSgmtById(page);
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
	@Operate(modulName = "个人信息基础段列表--新增/修改")
	@SuppressWarnings("unchecked")
	@RequestMapping("/updatePcBasBsSgmt")
	@ResponseBody
	public Map<String, Object> updatePcBasBsSgmt(Model model,
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
				//新增
				indvBasicsInfoService.insertPcBasBsSgmt(map);
				middleDataChangeService.changeMiddleDataMCom("110",map.get("paaBsSmgtId").toString(),"add",company);

			}else if(pageType != null && "edit".equals(pageType)){
				//修改
				indvBasicsInfoService.updatePcBasBsSgmt(map);
				middleDataChangeService.changeMiddleDataMCom("110",map.get("paaBsSmgtId").toString(),"update",company);
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
	@Operate(modulName = "个人基本信息--删除")
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
			map.put("paaBsSmgtId", pd.getString("paaBsSmgtId"));
			map.put("COMPANY", company);
			middleDataChangeService.changeMiddleDataMCom("110",map.get("paaBsSmgtId").toString(),"delete",company);

			indvBasicsInfoService.deletePcBsSgmt(map);
			resultMap.put("success", true);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
		}
		return resultMap;
	}
	
	/**
	 * 删除个人信息
	 * @param page
	 * @return
	 */
	@Operate(modulName = "个人基本信息基础段--删除")
	@SuppressWarnings("unchecked")
	@RequestMapping("/deletePcBsSgmt") 
	@ResponseBody
	public Map<String, Object> deletePcBsSgmt(Model model,
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
			indvBasicsInfoService.deletePcBsSgmt(map);
			resultMap.put("success", true);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
		}
		return resultMap;
	}
	
	@Operate(modulName = "个人基本信息基础段--新增/修改")
	@SuppressWarnings("unchecked")
	@RequestMapping("/addOrUpdatePcBasBsSgmt")
	@ResponseBody
	public Map<String, Object> addOrUpdatePcBasBsSgmt(Model model,
			HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			ObjectMapper mapper = new ObjectMapper();
			String paaBsSmgtId = request.getParameter("paaBsSmgtId");
			String pabIdSgmtId = request.getParameter("pabIdSgmtId");
			String jsonSetMap = ServletRequestUtils.getStringParameter(request,
					"rltData", "");
			jsonSetMap = java.net.URLDecoder.decode(jsonSetMap, "UTF-8");
			Map<String, Object> map = mapper.readValue(jsonSetMap,Map.class);
			map.put("paaBsSmgtId", paaBsSmgtId);
			map.put("pabIdSgmtId", pabIdSgmtId);
			map.put("COMPANY", company);
			if(indvBasicsInfoService.getPecrIndvIdSgmtCKey(map)==0){
				//新增
				indvBasicsInfoService.insertPcBasIdSgmt(map);
			}else{
				
				//更新
				indvBasicsInfoService.updatePcBasIdSgmt(map);
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
	 * 删除
	 * @param page
	 * @return
	 */
	@Operate(modulName = "个人基本信息基础段--删除")
	@SuppressWarnings("unchecked")
	@RequestMapping("/deletePcBasIdSgmt") 
	@ResponseBody
	public Map<String, Object> deletePcBasIdSgmt(Model model,
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
			indvBasicsInfoService.deletePcBasIdSgmt(map);
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
	@Operate(modulName = "个人基本信息基本信息段--新增/修改")
	@SuppressWarnings("unchecked")
	@RequestMapping("/updatePcBasFcsInfSgmt")
	@ResponseBody
	public Map<String, Object> updatePcBasFcsInfSgmt(Model model,
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
				if(indvBasicsInfoService.getPcBasFcsInfSgmtKey(map) > 0) {
					resultMap.put("msg", "主键重复!请将该信息删除后,重新添加数据信息!");
					resultMap.put("success", false);
				}else {
					//新增
					indvBasicsInfoService.insertPcBasFcsInfSgmt(map);
				}
			}else if(pageType != null && "edit".equals(pageType)){
				//修改
				indvBasicsInfoService.updatePcBasFcsInfSgmt(map);
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
	@Operate(modulName = "个人基本信息基本信息段--删除")
	@SuppressWarnings("unchecked")
	@RequestMapping("/PcBasFcsInfSgmtDel") 
	@ResponseBody
	public Map<String, Object> PcBasFcsInfSgmtDel(Model model,
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
			indvBasicsInfoService.delPcBasFcsInfSgmt(map);
			resultMap.put("success", true);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
		}
		return resultMap;
	}
	/**
	 * 教育信息段   新增或修改
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@Operate(modulName = "个人教育信息段--新增/修改")
	@SuppressWarnings("unchecked")
	@RequestMapping("/updatePcBasEduInfSgmt")
	@ResponseBody
	public Map<String, Object> updatePcBasEduInfSgmt(Model model,
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
				if(indvBasicsInfoService.getPcBasEduInfSgmtKey(map) > 0) {
					resultMap.put("msg", "主键重复!请将该信息删除后,重新添加数据信息!");
					resultMap.put("success", false);
				}else {
					//新增
					indvBasicsInfoService.insertPcBasEduInfSgmt(map);
				}
			}else if(pageType != null && "edit".equals(pageType)){
				//修改
				indvBasicsInfoService.updatePcBasEduInfSgmt(map);
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
	 * 删除  教育信息段
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@Operate(modulName = "个人教育信息段--删除")
	@SuppressWarnings("unchecked")
	@RequestMapping("/delPcBasEduInfSgmtById") 
	@ResponseBody
	public Map<String, Object> delPcBasEduInfSgmtById(Model model,
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
			indvBasicsInfoService.delPcBasEduInfSgmtById(map);
			resultMap.put("success", true);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
		}
		return resultMap;
	}
	/**
	 * 职业信息段  新增或修改
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@Operate(modulName = "个人职业信息段--新增/修改")
	@SuppressWarnings("unchecked")
	@RequestMapping("/updatePcBasOctpnInfSgmt")
	@ResponseBody
	public Map<String, Object> updatePcBasOctpnInfSgmt(Model model,
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
				if(indvBasicsInfoService.getPcBasOctpnInfSgmtKey(map) > 0) {
					resultMap.put("msg", "主键重复!请将该信息删除后,重新添加数据信息!");
					resultMap.put("success", false);
				}else {
					//新增
					indvBasicsInfoService.insertPcBasOctpnInfSgmt(map);
				}
			}else if(pageType != null && "edit".equals(pageType)){
				//修改
				indvBasicsInfoService.updatePcBasOctpnInfSgmt(map);
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
	 * 删除  职业信息段
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@Operate(modulName = "个人职业信息段--删除")
	@SuppressWarnings("unchecked")
	@RequestMapping("/delPcBasOctpnInfSgmtById") 
	@ResponseBody
	public Map<String, Object> delPcBasOctpnInfSgmtById(Model model,
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
			indvBasicsInfoService.delPcBasOctpnInfSgmtById(map);
			resultMap.put("success", true);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
		}
		return resultMap;
	}
	/**
	 * 居住地址段  新增或修改
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@Operate(modulName = "个人居住地址--新增/修改")
	@SuppressWarnings("unchecked")
	@RequestMapping("/updatePcBasRedncInfSgmt")
	@ResponseBody
	public Map<String, Object> updatePcBasRedncInfSgmt(Model model,
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
				if(indvBasicsInfoService.getPcBasRedncInfSgmtKey(map) > 0) {
					resultMap.put("msg", "主键重复!请将该信息删除后,重新添加数据信息!");
					resultMap.put("success", false);
				}else {
					//新增
					indvBasicsInfoService.insertPcBasRedncInfSgmt(map);
				}
			}else if(pageType != null && "edit".equals(pageType)){
				//修改
				indvBasicsInfoService.updatePcBasRedncInfSgmt(map);
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
	 * 删除 居住地址段
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@Operate(modulName = "个人居住地址--删除")
	@SuppressWarnings("unchecked")
	@RequestMapping("/delPcBasRedncInfSgmtById") 
	@ResponseBody
	public Map<String, Object> delPcBasRedncInfSgmtById(Model model,
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
			indvBasicsInfoService.delPcBasRedncInfSgmtById(map);
			resultMap.put("success", true);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
		}
		return resultMap;
	}
	/**
	 * 居住地址段 通讯地址信息段
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@Operate(modulName = "个人通讯地址--新增/修改")
	@SuppressWarnings("unchecked")
	@RequestMapping("/updatePcBasMlgInfSgmt")
	@ResponseBody
	public Map<String, Object> updatePcBasMlgInfSgmt(Model model,
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
				if(indvBasicsInfoService.getPcBasMlgInfSgmtKey(map) > 0) {
					resultMap.put("msg", "主键重复!请将该信息删除后,重新添加数据信息!");
					resultMap.put("success", false);
				}else {
					//新增
					indvBasicsInfoService.insertPcBasMlgInfSgmt(map);
				}
			}else if(pageType != null && "edit".equals(pageType)){
				//修改
				indvBasicsInfoService.updatePcBasMlgInfSgmt(map);
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
	 * 删除 通讯地址信息段
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@Operate(modulName = "个人通讯地址--删除")
	@SuppressWarnings("unchecked")
	@RequestMapping("/delPcBasMlgInfSgmtById") 
	@ResponseBody
	public Map<String, Object> delPcBasMlgInfSgmtById(Model model,
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
			indvBasicsInfoService.delPcBasMlgInfSgmtById(map);
			resultMap.put("success", true);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
		}
		return resultMap;
	}
	/**
	 * 婚姻信息段
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@Operate(modulName = "个人婚姻信息--新增/修改")
	@SuppressWarnings("unchecked")
	@RequestMapping("/updatePcBasSpsInfSgmt")
	@ResponseBody
	public Map<String, Object> updatePcBasSpsInfSgmt(Model model,
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
				if(indvBasicsInfoService.getPcBasSpsInfSgmtKey(map) > 0) {
					resultMap.put("msg", "主键重复!请将该信息删除后,重新添加数据信息!");
					resultMap.put("success", false);
				}else {
					//新增
					indvBasicsInfoService.insertPcBasSpsInfSgmt(map);
				}
			}else if(pageType != null && "edit".equals(pageType)){
				//修改
				indvBasicsInfoService.updatePcBasSpsInfSgmt(map);
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
	 * 删除 婚姻信息段
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@Operate(modulName = "个人婚姻信息--删除")
	@SuppressWarnings("unchecked")
	@RequestMapping("/delPcBasSpsInfSgmtById") 
	@ResponseBody
	public Map<String, Object> delPcBasSpsInfSgmtById(Model model,
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
			indvBasicsInfoService.delPcBasSpsInfSgmtById(map);
			resultMap.put("success", true);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
		}
		return resultMap;
	}
	/**
	 * 婚姻信息段
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@Operate(modulName = "个人收入信息段--新增/修改")
	@SuppressWarnings("unchecked")
	@RequestMapping("/updatePcBasIncInfSgmt")
	@ResponseBody
	public Map<String, Object> updatePcBasIncInfSgmt(Model model,
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
				if(indvBasicsInfoService.getPcBasIncInfSgmtKey(map) > 0) {
					resultMap.put("msg", "主键重复!请将该信息删除后,重新添加数据信息!");
					resultMap.put("success", false);
				}else {
					//新增
					indvBasicsInfoService.insertPcBasIncInfSgmt(map);
				}
			}else if(pageType != null && "edit".equals(pageType)){
				//修改
				indvBasicsInfoService.updatePcBasIncInfSgmt(map);
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
	 * 删除 婚姻信息段
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@Operate(modulName = "个人收入信息--删除")
	@SuppressWarnings("unchecked")
	@RequestMapping("/delPcBasIncInfSgmtById") 
	@ResponseBody
	public Map<String, Object> delPcBasIncInfSgmtById(Model model,
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
			indvBasicsInfoService.delPcBasIncInfSgmtById(map);
			resultMap.put("success", true);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
		}
		return resultMap;
	}

}
