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
import com.dcits.supervise.pecr.ent.entity.EntIncomeAndExpenseStatemeBs;
import com.dcits.supervise.pecr.ent.service.dataRecode.EntIncomeAndExpenseStatemeBsManager;
import com.dcits.supervise.pecr.log.Operate;
import com.dcits.supervise.pecr.validateData.model.ValidateErrorMessage;
import com.dcits.supervise.pecr.validateData.service.ValidateErrorMessageService;

/**
 * 事业单位收入支出
 * @author leizx
 *
 */
@Controller
@RequestMapping("/ecdtreportinstie")
public class EntIncomeAndExpenseStatemeBsController extends BaseController{

	
	
	
	@Autowired
	private EntIncomeAndExpenseStatemeBsManager entIncomeAndExpenseStatemeBs;
	@Autowired
	private MiddleDataChangeService middleDataChangeService;
	@Autowired
	private ValidateErrorMessageService validateErrorMessageService;
	/**
	 * 数据列表界面
	 * @return
	 */
	@RequestMapping("/list")
	public String dataPage() {
		return "pecr/ent/dataRecode/entIncomeAndExpenseStatemeBs/entIncomeAndExpenseStatemeBsList";
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
			List<EntIncomeAndExpenseStatemeBs> dataList = entIncomeAndExpenseStatemeBs.getentIncomeAndExpenseStatemeList(page);
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
	@RequestMapping("/entIncomeAndExpenseStatemeBsEdit")
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
				//基本信息段
				PageData acctBsSgmt = entIncomeAndExpenseStatemeBs.getAcctInfSgmtById(pd);
				//在保责任信息段
				PageData acctInfSgmt = entIncomeAndExpenseStatemeBs.getRepymtInfSgmtById(pd);
				String PK = pd.getString("elaIncomeAndExpenseStatId");
				List<ValidateErrorMessage> validateErrors  = validateErrorMessageService.selectErrorMessageByMasterTablePK(PK);
				mv.addObject("acctBsSgmt", JSONUtils.toJSONString(acctBsSgmt));
				mv.addObject("acctInfSgmt", JSONUtils.toJSONString(acctInfSgmt));
				mv.addObject("feedBackErrorSgmt", validateErrors);
			}
			mv.addObject("pd", pd);
		}catch(Exception e) {
			logger.error("事业单位收入支出表:获取新增、详情或者修改页面失败：",e);
		}
		mv.setViewName("pecr/ent/dataRecode/entIncomeAndExpenseStatemeBs/entIncomeAndExpenseStatemeBEdit");
		return mv;
	}

	/**
	 * 基础段   新增或修改
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@Operate(modulName = "事业单位收入支出基础段--新增/修改")
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
				if(entIncomeAndExpenseStatemeBs.getAcctBsSgmtKey(map) > 0) {
					resultMap.put("msg", "主键重复!请将该信息删除后,重新添加数据信息!");
					resultMap.put("success", false);
				}else {
					//新增
					entIncomeAndExpenseStatemeBs.insertAcctBsSgmt(map);
					middleDataChangeService.changeMiddleDataMCom("650",map.get("elaIncomeAndExpenseStatId").toString(),"add",company);

				}
			}else if(pageType != null && "edit".equals(pageType)){
				//修改
				entIncomeAndExpenseStatemeBs.updateAcctBsSgmt(map);
				middleDataChangeService.changeMiddleDataMCom("650",map.get("elaIncomeAndExpenseStatId").toString(),"update",company);
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
	@Operate(modulName = "事业单位收入支出基础段--删除")
	@RequestMapping("/delAcctBsSgmt") 
	@ResponseBody
	public Map<String, Object> delAcctBsSgmt(Model model,
			HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			PageData pd = this.getPageData();
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("COMPANY", company);
			map.put("elaIncomeAndExpenseStatId", pd.getString("elaIncomeAndExpenseStatId"));
			middleDataChangeService.changeMiddleDataMCom("650",map.get("elaIncomeAndExpenseStatId").toString(),"delete",company);

			entIncomeAndExpenseStatemeBs.deleteAcctBsSgmt(map);
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
	@Operate(modulName = "事业单位收入支出基本信息段--新增/修改")
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
			map.put("operationUser",userName);
			map.put("COMPANY", company);
			if(pageType != null && "add".equals(pageType)){
				if(entIncomeAndExpenseStatemeBs.getAcctInfoSgmtKey(map) > 0) {
					resultMap.put("msg", "主键重复!请将该信息删除后,重新添加数据信息!");
					resultMap.put("success", false);
				}else {
					//新增
					entIncomeAndExpenseStatemeBs.insertAcctInfoSgmt(map);
				}
			}else if(pageType != null && "edit".equals(pageType)){
				//修改
				entIncomeAndExpenseStatemeBs.updateAcctInfoSgmt(map);
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
	@Operate(modulName = "事业单位收入支出基本信息段--删除")
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
			map.put("COMPANY",company);
			entIncomeAndExpenseStatemeBs.delAcctInfoSgmt(map);
			resultMap.put("success", true);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
		}
		return resultMap;
	}
}
