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
import com.dcits.supervise.pecr.ent.entity.EntInstitutionBalance;
import com.dcits.supervise.pecr.ent.service.dataRecode.EntInstitutionBalanceManager;
import com.dcits.supervise.pecr.log.Operate;
import com.dcits.supervise.pecr.validateData.model.ValidateErrorMessage;
import com.dcits.supervise.pecr.validateData.service.ValidateErrorMessageService;

/**
 * 企业财务报表   事业单位资产负债表
 * @author 穆楠
 *
 */
@Controller
@RequestMapping("/entInstitutionInfo")
public class EntInstitutionBalanceController extends BaseController{

	@Autowired
	private EntInstitutionBalanceManager entInstitutionBalanceService;
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
		return "pecr/ent/dataRecode/financial/entInstitutionList";
	}
	
	/**
	 * 获取表格数据列表
	 * @param page
	 * @return
	 */
	@RequestMapping("/balanceSheetList")
	@ResponseBody
	public Map<String, Object> balanceSheetList(Page page){
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
			List<EntInstitutionBalance> dataList = entInstitutionBalanceService.getBalanceSheetList(page);
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
	@Operate(modulName = "事业单位资产负债表--删除")
	@RequestMapping("/delInstitution") 
	@ResponseBody
	public Map<String, Object> delInstitution(Page page){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			PageData pd = this.getPageData();
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("COMPANY", company);
			map.put("ekaInstitutionBalanceShtId", pd.getString("ekaInstitutionBalanceShtId"));
			entInstitutionBalanceService.deleteInstitutionInfoBs(map);
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
	@RequestMapping("/institutionEdit")
	public ModelAndView institutionEdit(Page page) {
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
				Map<String, Object> institutionInfo = entInstitutionBalanceService.getInstitutionInfoById(pd);
				//事业单位资产负债表段
				PageData institutionSheet = entInstitutionBalanceService.getInstitutionSheetById(pd);
				String PK = pd.getString("ekaInstitutionBalanceShtId");
				List<ValidateErrorMessage> validateErrors  = validateErrorMessageService.selectErrorMessageByMasterTablePK(PK);
				mv.addObject("institutionInfo", JSONUtils.toJSONString(institutionInfo));
				mv.addObject("institutionSheet", JSONUtils.toJSONString(institutionSheet));
				mv.addObject("feedBackErrorSgmt", validateErrors);
			}
			mv.addObject("pd", pd);
		}catch(Exception e) {
			logger.error("事业单位资产负债:获取新增、详情、修改页面失败：",e);
		}
		mv.setViewName("pecr/ent/dataRecode/financial/entInstitutionEdit");
		return mv;
	}
	
	/**
	 * 基础段   新增或修改
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@Operate(modulName = "事业单位资产负债基础段--新增/修改")
	@SuppressWarnings("unchecked")
	@RequestMapping("/saveInstitution")
	@ResponseBody
	public Map<String, Object> saveInstitution(Model model,
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
				if(entInstitutionBalanceService.getInstitutionInfoBsKey(map) > 0) {
					resultMap.put("msg", "主键重复!请将该信息删除后,重新添加数据信息!");
					resultMap.put("success", false);
				}else {
					//新增
					entInstitutionBalanceService.insertInstitutionInfoBs(map);
					middleDataChangeService.changeMiddleDataMCom("640",map.get("ekaInstitutionBalanceShtId").toString(),"add",company);

				}
			}else if(pageType != null && "edit".equals(pageType)){
				//修改
				entInstitutionBalanceService.updateInstitutionInfoBs(map);
				middleDataChangeService.changeMiddleDataMCom("640",map.get("ekaInstitutionBalanceShtId").toString(),"update",company);
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
	@Operate(modulName = "事业单位资产负债基础段--删除")
	@SuppressWarnings("unchecked")
	@RequestMapping("/delInstitutionBs") 
	@ResponseBody
	public Map<String, Object> delInstitutionBs(Model model,
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
			middleDataChangeService.changeMiddleDataMCom("640",map.get("ekaInstitutionBalanceShtId").toString(),"delete",company);

			entInstitutionBalanceService.deleteInstitutionInfoBs(map);
			resultMap.put("success", true);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
		}
		return resultMap;
	}
	
	/**
	 * 事业单位资产负债表段   新增或修改
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@Operate(modulName = "事业单位资产负债表段--新增/修改")
	@SuppressWarnings("unchecked")
	@RequestMapping("/saveInsBalance")
	@ResponseBody
	public Map<String, Object> saveInsBalance(Model model,
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
				if(entInstitutionBalanceService.getInsBalanceKey(map) > 0) {
					resultMap.put("msg", "主键重复!请将该信息删除后,重新添加数据信息!");
					resultMap.put("success", false);
				}else {
					//新增
					entInstitutionBalanceService.insertInsBalance(map);
				}
			}else if(pageType != null && "edit".equals(pageType)){
				//修改
				entInstitutionBalanceService.updateInsBalance(map);
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
	 * 删除  事业单位资产负债表段
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@Operate(modulName = "事业单位资产负债表段--删除")
	@SuppressWarnings("unchecked")
	@RequestMapping("/delInsBalance") 
	@ResponseBody
	public Map<String, Object> delInsBalance(Model model,
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
			entInstitutionBalanceService.delInsBalance(map);
			resultMap.put("success", true);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
		}
		return resultMap;
	}
}
