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
import com.dcits.supervise.pecr.ent.entity.EntBalanceSheetBsSgmt;
import com.dcits.supervise.pecr.ent.service.dataRecode.EntBalanceSheetInfoManager;
import com.dcits.supervise.pecr.log.Operate;
import com.dcits.supervise.pecr.validateData.model.ValidateErrorMessage;
import com.dcits.supervise.pecr.validateData.service.ValidateErrorMessageService;

/**
 * 企业财务报表   企业资产负债表
 * @author leizx
 *
 */
@Controller
@RequestMapping("/entBalanceInfo")
public class EntBalanceSheetInfoController extends BaseController{

	@Autowired
	private EntBalanceSheetInfoManager entBalanceSheetInfoService;
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
		return "pecr/ent/dataRecode/financial/entBalanceInfoList";
	}
	
	/**
	 * 获取表格数据列表
	 * @param page
	 * @return
	 */
	@RequestMapping("/assetsInfoList")
	@ResponseBody
	public Map<String, Object> assetsInfoList(Page page){
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
			List<EntBalanceSheetBsSgmt> dataList = entBalanceSheetInfoService.getAssetsInfoList(page);
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
	@Operate(modulName = "企业资产负债表--删除")
	@RequestMapping("/delAssetsInfo") 
	@ResponseBody
	public Map<String, Object> delAssetsInfo(Page page){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			PageData pd = this.getPageData();
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("COMPANY", company);
			map.put("ehaBalanceSheetBsSgmtId", pd.getString("ehaBalanceSheetBsSgmtId"));
			entBalanceSheetInfoService.deleteBalanceSheetSgmt(map);
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
	@RequestMapping("/assetsInfoEdit")
	public ModelAndView assetsInfoEdit(Page page) {
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
				Map<String, Object> balanceBsSgmt = entBalanceSheetInfoService.getBalanceBsSgmtById(pd);
				//02企业资产负债表段
				PageData balanceSheet2002 = entBalanceSheetInfoService.getBalanceSheet2002ById(pd);
				//07企业资产负债表段
				PageData balanceSheet2007 = entBalanceSheetInfoService.getBalanceSheet2007ById(pd);
				String PK = pd.getString("ehaBalanceSheetBsSgmtId");
				List<ValidateErrorMessage> validateErrors  = validateErrorMessageService.selectErrorMessageByMasterTablePK(PK);
				mv.addObject("balanceBsSgmt", JSONUtils.toJSONString(balanceBsSgmt));
				mv.addObject("balanceSheet2002", JSONUtils.toJSONString(balanceSheet2002));
				mv.addObject("balanceSheet2007", JSONUtils.toJSONString(balanceSheet2007));
				mv.addObject("feedBackErrorSgmt", validateErrors);
			}
			mv.addObject("pd", pd);
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		mv.setViewName("pecr/ent/dataRecode/financial/entBalanceInfoEdit");
		return mv;
	}
	
	/**
	 * 基础段   新增或修改
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@Operate(modulName = "企业资产负债基础段--新增/修改")
	@SuppressWarnings("unchecked")
	@RequestMapping("/saveBalanceSheetBsSgmt")
	@ResponseBody
	public Map<String, Object> saveBalanceSheetBsSgmt(Model model,
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
				if(entBalanceSheetInfoService.getBalanceSheetSgmtKey(map) > 0) {
					resultMap.put("msg", "主键重复!请将该信息删除后,重新添加数据信息!");
					resultMap.put("success", false);
				}else {
					//新增
					entBalanceSheetInfoService.insertBalanceSheetSgmt(map);
					middleDataChangeService.changeMiddleDataMCom("610",map.get("ehaBalanceSheetBsSgmtId").toString(),"add",company);

				}
			}else if(pageType != null && "edit".equals(pageType)){
				//修改
				entBalanceSheetInfoService.updateBalanceSheetSgmt(map);
				middleDataChangeService.changeMiddleDataMCom("610",map.get("ehaBalanceSheetBsSgmtId").toString(),"update",company);
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
	@Operate(modulName = "企业资产负债基础段--删除")
	@SuppressWarnings("unchecked")
	@RequestMapping("/delBalanceSheetBsSgmt") 
	@ResponseBody
	public Map<String, Object> delBalanceSheetBsSgmt(Model model,
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
			middleDataChangeService.changeMiddleDataMCom("610",map.get("ehaBalanceSheetBsSgmtId").toString(),"delete",company);

			entBalanceSheetInfoService.deleteBalanceSheetSgmt(map);
			resultMap.put("success", true);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
		}
		return resultMap;
	}
	
	/**
	 * 02企业资产负债表段   新增或修改
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@Operate(modulName = "02企业资产负债表段--新增/修改")
	@SuppressWarnings("unchecked")
	@RequestMapping("/saveBalanceSheet2002Sgmt")
	@ResponseBody
	public Map<String, Object> saveBalanceSheet2002Sgmt(Model model,
			HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			Session session = Jurisdiction.getSession();
			User user = (User)session.getAttribute(Const.SESSION_USER);
			String userName = user.getUSERNAME();//登录用户名
			String company = user.getCOMPANY();
			ObjectMapper mapper = new ObjectMapper();
			String pageType = request.getParameter("pageType");
			String ehaBalanceSheetBsSgmtId = request.getParameter("ehaBalanceSheetBsSgmtId");
			String ehbBalanceSheet2002SgmtId = request.getParameter("ehbBalanceSheet2002SgmtId");		
			String jsonSetMap = ServletRequestUtils.getStringParameter(request,
					"str", "");
			jsonSetMap = java.net.URLDecoder.decode(jsonSetMap, "UTF-8");
			Map<String, Object> map = mapper.readValue(jsonSetMap,Map.class);
			map.put("COMPANY", company);
			map.put("operationUser",userName);
			map.put("ehaBalanceSheetBsSgmtId",ehaBalanceSheetBsSgmtId);
			map.put("ehbBalanceSheet2002SgmtId",ehbBalanceSheet2002SgmtId);
			if(pageType != null && "add".equals(pageType)){
				if(entBalanceSheetInfoService.getSheet02SgmtKey(map) > 0) {
					resultMap.put("msg", "主键重复!请将该信息删除后,重新添加数据信息!");
					resultMap.put("success", false);
				}else {
					//新增
					entBalanceSheetInfoService.insertSheet02Sgmt(map);
				}
			}else if(pageType != null && "edit".equals(pageType)){
				//修改
				entBalanceSheetInfoService.updateSheet02Sgmt(map);
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
	 * 删除  02企业资产负债表段
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@Operate(modulName = "02企业资产负债表段--删除")
	@SuppressWarnings("unchecked")
	@RequestMapping("/delBalanceSheet2002Sgmt") 
	@ResponseBody
	public Map<String, Object> delBalanceSheet2002Sgmt(Model model,
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
			entBalanceSheetInfoService.delSheet02Sgmt(map);
			resultMap.put("success", true);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
		}
		return resultMap;
	}
	
	
	/**
	 * 07企业资产负债表段   新增或修改
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@Operate(modulName = "07企业资产负债表段--新增/修改")
	@SuppressWarnings("unchecked")
	@RequestMapping("/saveBalanceSheet2007Sgmt")
	@ResponseBody
	public Map<String, Object> saveBalanceSheet2007Sgmt(Model model,
			HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			Session session = Jurisdiction.getSession();
			User user = (User)session.getAttribute(Const.SESSION_USER);
			String userName = user.getUSERNAME();//登录用户名
			String company = user.getCOMPANY();
			ObjectMapper mapper = new ObjectMapper();
			String pageType = request.getParameter("pageType");
			String ehaBalanceSheetBsSgmtId = request.getParameter("ehaBalanceSheetBsSgmtId");
			String ehbBalanceSheet2007SgmtId = request.getParameter("ehbBalanceSheet2007SgmtId");
			String jsonSetMap = ServletRequestUtils.getStringParameter(request,
					"str", "");
			jsonSetMap = java.net.URLDecoder.decode(jsonSetMap, "UTF-8");
			Map<String, Object> map = mapper.readValue(jsonSetMap,Map.class);
			map.put("COMPANY", company);
			map.put("operationUser",userName);
			map.put("ehaBalanceSheetBsSgmtId",ehaBalanceSheetBsSgmtId);
			map.put("ehcBalanceSheet2007SgmtId",ehbBalanceSheet2007SgmtId);
			if(pageType != null && "add".equals(pageType)){
				if(entBalanceSheetInfoService.getSheet07SgmtKey(map) > 0) {
					resultMap.put("msg", "主键重复!请将该信息删除后,重新添加数据信息!");
					resultMap.put("success", false);
				}else {
					//新增
					entBalanceSheetInfoService.insertSheet07Sgmt(map);
				}
			}else if(pageType != null && "edit".equals(pageType)){
				//修改
				entBalanceSheetInfoService.updateSheet07Sgmt(map);
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
	 * 删除  07企业资产负债表段
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@Operate(modulName = "07企业资产负债表段--删除")
	@SuppressWarnings("unchecked")
	@RequestMapping("/delBalanceSheet2007Sgmt") 
	@ResponseBody
	public Map<String, Object> delBalanceSheet2007Sgmt(Model model,
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
			entBalanceSheetInfoService.delSheet07Sgmt(map);
			resultMap.put("success", true);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
		}
		return resultMap;
	}
}
