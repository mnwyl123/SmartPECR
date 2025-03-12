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
import com.dcits.supervise.pecr.ent.entity.CashFlows;
import com.dcits.supervise.pecr.ent.service.dataRecode.CashFlowsManager;
import com.dcits.supervise.pecr.log.Operate;
import com.dcits.supervise.pecr.validateData.model.ValidateErrorMessage;
import com.dcits.supervise.pecr.validateData.service.ValidateErrorMessageService;

/**
 * 企业现金流量
 * @author 穆楠
 *
 */
@Controller
@RequestMapping("/cashFlows")
public class CashFlowsController extends BaseController{

	@Autowired
	private CashFlowsManager cashFlowsService;
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
		return "pecr/ent/dataRecode/CashFlows/cashFlowsList";
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
			Boolean flag = (Boolean) session.getAttribute(user.getUSER_ID()+"isCompany");
			pd.put("managerId",flag?"":user.getUSERNAME());
			int pge = Integer.parseInt(pd.getString("page"));
			int limit = Integer.parseInt(pd.getString("limit"));
			page.setCurrentPage(pge);
			page.setShowCount(limit);
			page.setPd(pd);
			List<CashFlows> dataList = cashFlowsService.getcashFlowsList(page);
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
	@Operate(modulName = "删除现金流量信息")
	@RequestMapping("/delAcctBsSgmt") 
	@ResponseBody
	public Map<String, Object> delAcctBsSgmt(Page page){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			PageData pd = this.getPageData();
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("COMPANY", company);
			map.put("ejaCashFlowsBsSgmtId", pd.getString("ejaCashFlowsBsSgmtId"));
			cashFlowsService.delCashFlowsBsSgmtById(map);
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
				Map<String, Object> cashFlowsBsSgmt = cashFlowsService.getCashFlowsBsSgmtById(pd);
				//企业现金流量表02现金流量表段
				PageData cashFlows2002Sgmt = cashFlowsService.getCashFlows2002SgmtById(pd);
				//企业现金流量表07现金流量表段
				PageData cashFlows2007Sgmt = cashFlowsService.getCashFlows2007SgmtById(pd);
				String PK = pd.getString("ejaCashFlowsBsSgmtId");
				List<ValidateErrorMessage> validateErrors  = validateErrorMessageService.selectErrorMessageByMasterTablePK(PK);
				mv.addObject("cashFlowsBsSgmt", JSONUtils.toJSONString(cashFlowsBsSgmt));
				mv.addObject("cashFlows2002Sgmt", JSONUtils.toJSONString(cashFlows2002Sgmt));
				mv.addObject("cashFlows2007Sgmt", JSONUtils.toJSONString(cashFlows2007Sgmt));
				mv.addObject("feedBackErrorSgmt", validateErrors);
			}
			mv.addObject("pd", pd);
		}catch(Exception e) {
			logger.error("企业现金流量：获取新增、修改或者详情页面失败：",e);
		}
		mv.setViewName("pecr/ent/dataRecode/CashFlows/cashFlowsEdit");
		return mv;
	}
	
	/**
	 * 基础段   新增或修改
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@Operate(modulName = "现金流量基础段--新增/修改")
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
				if(cashFlowsService.getCashFlowsBsSgmtKey(map) > 0) {
					resultMap.put("msg", "主键重复!请将该信息删除后,重新添加数据信息!");
					resultMap.put("success", false);
				}else {
					//新增
					cashFlowsService.insertCashFlowsBsSgmt(map);
					middleDataChangeService.changeMiddleDataMCom("630",map.get("ejaCashFlowsBsSgmtId").toString(),"add",company);
				}
			}else if(pageType != null && "edit".equals(pageType)){
				//修改
				cashFlowsService.updateCashFlowsBsSgmt(map);
				middleDataChangeService.changeMiddleDataMCom("630",map.get("ejaCashFlowsBsSgmtId").toString(),"update",company);
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
	@Operate(modulName = "现金流量基础段--删除")
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
			ObjectMapper mapper = new ObjectMapper();
			String jsonSetMap = ServletRequestUtils.getStringParameter(request,
					"str", "");
			jsonSetMap = java.net.URLDecoder.decode(jsonSetMap, "UTF-8");
			Map<String, Object> map = mapper.readValue(jsonSetMap,Map.class);
			map.put("COMPANY", company);
			middleDataChangeService.changeMiddleDataMCom("630",map.get("ejaCashFlowsBsSgmtId").toString(),"delete",company);
			cashFlowsService.delCashFlowsBsSgmtById(map);
			resultMap.put("success", true);

		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
		}
		return resultMap;
	}
	
	/**
	 * 企业现金流量表02现金流量表段   新增或修改
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@Operate(modulName = "02现金流量表段--新增/删除")
	@SuppressWarnings("unchecked")
	@RequestMapping("/save2002Sgmt")
	@ResponseBody
	public Map<String, Object> save2002Sgmt(Model model,
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
				if(cashFlowsService.get2002SgmtKey(map) > 0) {
					resultMap.put("msg", "主键重复!请将该信息删除后,重新添加数据信息!");
					resultMap.put("success", false);
				}else {
					//新增
					cashFlowsService.insert2002Sgmt(map);;
				}
			}else if(pageType != null && "edit".equals(pageType)){
				//修改
				cashFlowsService.update2002Sgmt(map);
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
	 * 删除企业现金流量表02现金流量表段
	 * @param page
	 * @return
	 */
	@Operate(modulName = "02现金流量表段--删除")
	@SuppressWarnings("unchecked")
	@RequestMapping("/del2002Sgmt") 
	@ResponseBody
	public Map<String, Object> del2002Sgmt(Model model,
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
			cashFlowsService.del2002SgmtById(map);
			resultMap.put("success", true);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
		}
		return resultMap;
	}
	
	/**
	 * 企业现金流量表07现金流量表段   新增或修改
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@Operate(modulName = "07现金流量表段--新增/修改")
	@SuppressWarnings("unchecked")
	@RequestMapping("/save2007Sgmt")
	@ResponseBody
	public Map<String, Object> save2007Sgmt(Model model,
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
				if(cashFlowsService.get2007SgmtKey(map) > 0) {
					resultMap.put("msg", "主键重复!请将该信息删除后,重新添加数据信息!");
					resultMap.put("success", false);
				}else {
					//新增
					cashFlowsService.insert2007Sgmt(map);;
				}
			}else if(pageType != null && "edit".equals(pageType)){
				//修改
				cashFlowsService.update2007Sgmt(map);
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
	 * 删除企业现金流量表07现金流量表段
	 * @param page
	 * @return
	 */
	@Operate(modulName = "07现金流量表段--删除")
	@SuppressWarnings("unchecked")
	@RequestMapping("/del2007Sgmt") 
	@ResponseBody
	public Map<String, Object> del2007Sgmt(Model model,
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
			cashFlowsService.del2007SgmtById(map);
			resultMap.put("success", true);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
		}
		return resultMap;
	}
}
