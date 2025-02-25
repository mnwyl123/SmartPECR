 package com.dcits.supervise.pecr.indv.controller.dataRecode;

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
import com.dcits.supervise.pecr.indv.entity.GuarAcctBsSgmt;
import com.dcits.supervise.pecr.indv.entity.GuarRltRepymtInfSgmt;
import com.dcits.supervise.pecr.indv.service.dataRecode.GuarAcctInfoManager;
import com.dcits.supervise.pecr.log.Operate;
import com.dcits.supervise.pecr.validateData.model.ValidateErrorMessage;
import com.dcits.supervise.pecr.validateData.service.ValidateErrorMessageService;

/**
 * 个人担保账户信息
 * @author leizx
 *
 */
@Controller
@RequestMapping("/indvGuarAcctInfo")
public class GuarAcctInfoController extends BaseController{

	@Autowired
	private GuarAcctInfoManager guarAcctInfoService;
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
		return "pecr/indv/dataRecode/guarAcctInfo/guarAcctInfoList";
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
			List<GuarAcctBsSgmt> dataList = guarAcctInfoService.getGuarAcctBsSgmtList(page);
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
	@RequestMapping("/guarAcctInfoEdit")
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
				Map<String, Object> acctBsSgmt = guarAcctInfoService.getAcctBsSgmtById(pd);
				//基本信息段
				PageData acctInfSgmt = guarAcctInfoService.getAcctInfSgmtById(pd);
				//在保责任信息段
				PageData repymtInfSgmt = guarAcctInfoService.getRepymtInfSgmtById(pd);
				String PK = pd.getString("pdaGuarAcctBsSgmtId");
				List<ValidateErrorMessage> validateErrors  = validateErrorMessageService.selectErrorMessageByMasterTablePK(PK);
				mv.addObject("acctBsSgmt", JSONUtils.toJSONString(acctBsSgmt));
				mv.addObject("acctInfSgmt", JSONUtils.toJSONString(acctInfSgmt));
				mv.addObject("repymtInfSgmt", JSONUtils.toJSONString(repymtInfSgmt));
				mv.addObject("feedBackErrorSgmt", validateErrors);
			}
			mv.addObject("pd", pd);
		}catch(Exception e) {
			logger.error("个人担保账户信息:获取detail页面失败：",e);
		}
		mv.setViewName("pecr/indv/dataRecode/guarAcctInfo/guarAcctInfoEdit");
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
			List<GuarRltRepymtInfSgmt> dataList = null;
			if(pageType != null && "edit".equals(pageType)){
				dataList = guarAcctInfoService.getRltInfList(page);
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
				dataList = guarAcctInfoService.getMccInfList(page);
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
	@Operate(modulName = "个人担保基础段--新增/修改")
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
			map.put("COMPANY", company);
			map.put("operationUser",userName);
			if(pageType != null && "add".equals(pageType)){
				if(guarAcctInfoService.getAcctBsSgmtKey(map) > 0) {
					resultMap.put("msg", "主键重复!请将该信息删除后,重新添加数据信息!");
					resultMap.put("success", false);
				}else {
					//新增
					guarAcctInfoService.insertAcctBsSgmt(map);
					middleDataChangeService.changeMiddleDataMCom("230",map.get("pdaGuarAcctBsSgmtId").toString(),"add",company);

				}
			}else if(pageType != null && "edit".equals(pageType)){
				//修改
				guarAcctInfoService.updateAcctBsSgmt(map);
				middleDataChangeService.changeMiddleDataMCom("230",map.get("pdaGuarAcctBsSgmtId").toString(),"update",company);
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
	@Operate(modulName = "个人担保账户信息--删除")
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
			map.put("pdaGuarAcctBsSgmtId", pd.getString("pdaGuarAcctBsSgmtId"));
			middleDataChangeService.changeMiddleDataMCom("230",map.get("pdaGuarAcctBsSgmtId").toString(),"delete",company);
			guarAcctInfoService.deleteAcctBsSgmt(map);
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
	@Operate(modulName = "个人担保基础段--删除")
	@SuppressWarnings("unchecked")
	@RequestMapping("/delAcctBsSgmt") 
	@ResponseBody
	public Map<String, Object> delAcctBsSgmt(Model model,
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
			middleDataChangeService.changeMiddleDataMCom("230",map.get("pdaGuarAcctBsSgmtId").toString(),"delete",company);

			guarAcctInfoService.deleteAcctBsSgmt(map);
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
	@Operate(modulName = "个人担保基本信息段--新增/修改")
	@SuppressWarnings("unchecked")
	@RequestMapping("/saveAcctInfoSgmt")
	@ResponseBody
	public Map<String, Object> saveAcctInfoSgmt(Model model,
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
				if(guarAcctInfoService.getAcctInfoSgmtKey(map) > 0) {
					resultMap.put("msg", "主键重复!请将该信息删除后,重新添加数据信息!");
					resultMap.put("success", false);
				}else {
					//新增
					guarAcctInfoService.insertAcctInfoSgmt(map);
				}
			}else if(pageType != null && "edit".equals(pageType)){
				//修改
				guarAcctInfoService.updateAcctInfoSgmt(map);
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
	@Operate(modulName = "个人担保基本信息段--删除")
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
			guarAcctInfoService.delAcctInfoSgmt(map);
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
	@Operate(modulName = "个人担保相关还款责任人段--新增/修改")
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
			String pdaGuarAcctBsSgmtId = request.getParameter("pdaGuarAcctBsSgmtId");
			String pdcRltRepymtInfSgmtId = request.getParameter("pdcRltRepymtInfSgmtId");
			String jsonSetMap = ServletRequestUtils.getStringParameter(request,
					"rltData", "");
			jsonSetMap = java.net.URLDecoder.decode(jsonSetMap, "UTF-8");
			Map<String, Object> map = mapper.readValue(jsonSetMap,Map.class);
			map.put("COMPANY", company);
			map.put("pdaGuarAcctBsSgmtId", pdaGuarAcctBsSgmtId);
			map.put("pdcRltRepymtInfSgmtId", pdcRltRepymtInfSgmtId);
			if(guarAcctInfoService.getRltRepymtInfKey(map)==0){
				//新增
				guarAcctInfoService.insertRltRepymtInf(map);
			}else{
				
				//更新
				guarAcctInfoService.updateRltRepymtInf(map);
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
	@Operate(modulName = "个人担保相关还款责任人段--删除")
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
			guarAcctInfoService.delRltRepymtInf(map);
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
	@Operate(modulName = "个人担保抵质押物--新增/修改")
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
			String pdaGuarAcctBsSgmtId = request.getParameter("pdaGuarAcctBsSgmtId");
			String pddGuarMccInfSgmtId = request.getParameter("pddGuarMccInfSgmtId");
			String jsonSetMap = ServletRequestUtils.getStringParameter(request,
					"mccData", "");
			jsonSetMap = java.net.URLDecoder.decode(jsonSetMap, "UTF-8");
			Map<String, Object> map = mapper.readValue(jsonSetMap,Map.class);
			map.put("COMPANY", company);
			map.put("pdaGuarAcctBsSgmtId", pdaGuarAcctBsSgmtId);
			map.put("pddGuarMccInfSgmtId", pddGuarMccInfSgmtId);
			if(guarAcctInfoService.getMccInfKey(map)== 0){
				//新增
				guarAcctInfoService.insertMccInf(map);
			}else{
				
				//更新
				guarAcctInfoService.updateMccInf(map);
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
	@Operate(modulName = "个人担保抵质押物--新增/修改")
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
			guarAcctInfoService.delMccInf(map);
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
	@Operate(modulName = "个人担保在保责任信息--新增/修改")
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
				if(guarAcctInfoService.getRepymtInfSgmtKey(map) > 0) {
					resultMap.put("msg", "主键重复!请将该信息删除后,重新添加数据信息!");
					resultMap.put("success", false);
				}else {
					//新增
					guarAcctInfoService.insertRepymtInfSgmt(map);
				}
			}else if(pageType != null && "edit".equals(pageType)){
				//修改
				guarAcctInfoService.updateRepymtInfSgmt(map);
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
	@Operate(modulName = "个人担保在保责任信息--删除")
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
			guarAcctInfoService.delRepymtInfSgmt(map);
			resultMap.put("success", true);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
		}
		return resultMap;
	}
}
