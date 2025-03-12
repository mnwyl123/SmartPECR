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
import com.dcits.supervise.pecr.indv.entity.LoanAcctBsSgmt;
import com.dcits.supervise.pecr.indv.entity.LoanAcctRltInfSgmt;
import com.dcits.supervise.pecr.indv.service.dataRecode.LoanAcctInfoManager;
import com.dcits.supervise.pecr.log.Operate;
import com.dcits.supervise.pecr.validateData.model.ValidateErrorMessage;
import com.dcits.supervise.pecr.validateData.service.ValidateErrorMessageService;

/**
 * 个人借贷账户信息
 * @author 穆楠
 *
 */
@Controller
@RequestMapping("/indvLoanAcctInfo")
public class LoanAcctInfoController extends BaseController{

	@Autowired
	private LoanAcctInfoManager loanAcctInfoService;
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
		return "pecr/indv/dataRecode/loanAcctInfo/indvLoanAcctInfoList";
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
			List<LoanAcctBsSgmt> dataList = loanAcctInfoService.getLoanAcctBsSgmtList(page);
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
	@Operate(modulName = "个人借贷账户信息--删除")
	@RequestMapping("/delLoanAcctInfo") 
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
			map.put("pbaAcctBsSgmtId", pd.getString("pbaAcctBsSgmtId"));
			middleDataChangeService.changeMiddleDataMCom("210",map.get("pbaAcctBsSgmtId").toString(),"delete",company);
			loanAcctInfoService.deleteLoanAcctBsSgmt(map);
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
		try {
			PageData pd = this.getPageData();
			pd.put("COMPANY", company);
			String addOrUpdate = pd.getString("addOrUpdate");
			if(addOrUpdate != null && !"add".equals(addOrUpdate)){
				//基础段
				Map<String, Object> acctBsSgmt = loanAcctInfoService.getAcctBsSgmtById(pd);
				//基本信息段
				PageData acctBsInfSgmt = loanAcctInfoService.getAcctBsInfSgmtById(pd);
				//授信额度信息段
				PageData acctCredSgmt = loanAcctInfoService.getAcctCredSgmtById(pd);
				//初始债权说明段
				PageData ocInfoSgmt = loanAcctInfoService.getOcInfoSgmtById(pd);
				//月度表现信息段
				PageData amblgInfoSgmt = loanAcctInfoService.getAmblgInfoSgmtById(pd);
				//大额专项分期信息段
				PageData specPrdSgmt = loanAcctInfoService.getSpecPrdSgmtById(pd);
				//非月度表现信息段
				PageData acctDbtInfSgmt = loanAcctInfoService.getAcctDbtInfSgmtById(pd);
				String PK = pd.getString("pbaAcctBsSgmtId");
				
				List<ValidateErrorMessage> validateErrors  = validateErrorMessageService.selectErrorMessageByMasterTablePK(PK);
				mv.addObject("acctBsSgmt", JSONUtils.toJSONString(acctBsSgmt));
				mv.addObject("acctBsInfSgmt", JSONUtils.toJSONString(acctBsInfSgmt));
				mv.addObject("acctCredSgmt", JSONUtils.toJSONString(acctCredSgmt));
				mv.addObject("ocInfoSgmt", JSONUtils.toJSONString(ocInfoSgmt));
				mv.addObject("amblgInfoSgmt", JSONUtils.toJSONString(amblgInfoSgmt));
				mv.addObject("specPrdSgmt", JSONUtils.toJSONString(specPrdSgmt));
				mv.addObject("acctDbtInfSgmt", JSONUtils.toJSONString(acctDbtInfSgmt));
				mv.addObject("feedBackErrorSgmt", validateErrors);
			}
			mv.addObject("pd", pd);
		}catch(Exception e) {
			logger.error("个人借贷信息，获取新增、修改或者详情页面失败",e);
		}
		mv.setViewName("pecr/indv/dataRecode/loanAcctInfo/indvLoanAcctInfoEdit");
		return mv;
	}
	
	/**
	 * 获取账户类型为D1  页面
	 * @return
	 */
	@RequestMapping("/indvLoanAcctInfoEditD1")
	public String indvLoanAcctInfoEditD1() {
		return "pecr/indv/dataRecode/loanAcctInfo/indvLoanAcctInfoEditD1";
	}
	
	/**
	 * 获取账户类型为R1  页面
	 * @return
	 */
	@RequestMapping("/indvLoanAcctInfoEditR1")
	public String indvLoanAcctInfoEditR1() {
		return "pecr/indv/dataRecode/loanAcctInfo/indvLoanAcctInfoEditR1";
	}
	
	/**
	 * 获取账户类型为R2  页面
	 * @return
	 */
	@RequestMapping("/indvLoanAcctInfoEditR2")
	public String indvLoanAcctInfoEditR2() {
		return "pecr/indv/dataRecode/loanAcctInfo/indvLoanAcctInfoEditR2";
	}
	
	/**
	 * 获取账户类型为R3  页面
	 * @return
	 */
	@RequestMapping("/indvLoanAcctInfoEditR3")
	public String indvLoanAcctInfoEditR3() {
		return "pecr/indv/dataRecode/loanAcctInfo/indvLoanAcctInfoEditR3";
	}
	
	/**
	 * 获取账户类型为R4  页面
	 * @return
	 */
	@RequestMapping("/indvLoanAcctInfoEditR4")
	public String indvLoanAcctInfoEditR4() {
		return "pecr/indv/dataRecode/loanAcctInfo/indvLoanAcctInfoEditR4";
	}
	
	/**
	 * 获取账户类型为D1  页面
	 * @return
	 */
	@RequestMapping("/indvLoanAcctInfoEditC1")
	public String indvLoanAcctInfoEditC1() {
		return "pecr/indv/dataRecode/loanAcctInfo/indvLoanAcctInfoEditC1";
	}
	
	/**
	 * 基础段   新增或修改
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@Operate(modulName = "个人借贷基础段--新增/修改")
	@SuppressWarnings("unchecked")
	@RequestMapping("/acctBsSgmtAddOrEdit")
	@ResponseBody
	public Map<String, Object> acctBsSgmtAddOrEdit(Model model,
			HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			Session session = Jurisdiction.getSession();
			User user = (User)session.getAttribute(Const.SESSION_USER);
			String userName = user.getUSERNAME();//登录用户名
			String  company = user.getCOMPANY();
			ObjectMapper mapper = new ObjectMapper();
			String pageType = request.getParameter("pageType");
			String jsonSetMap = ServletRequestUtils.getStringParameter(request,
					"str", "");
			jsonSetMap = java.net.URLDecoder.decode(jsonSetMap, "UTF-8");
			Map<String, Object> map = mapper.readValue(jsonSetMap,Map.class);
			map.put("COMPANY", company);
			map.put("operationUser",userName);
			if(pageType != null && "add".equals(pageType)){
				if(loanAcctInfoService.getAcctBsSgmtKey(map) > 0) {
					resultMap.put("msg", "主键重复!请将该信息删除后,重新添加数据信息!");
					resultMap.put("success", false);
				}else {
					//新增
					loanAcctInfoService.insertAcctBsSgmt(map);
					middleDataChangeService.changeMiddleDataMCom("210",map.get("pbaAcctBsSgmtId").toString(),"add",company);

				}
			}else if(pageType != null && "edit".equals(pageType)){
				//修改
				loanAcctInfoService.updateAcctBsSgmt(map);
				middleDataChangeService.changeMiddleDataMCom("210",map.get("pbaAcctBsSgmtId").toString(),"update",company);
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
	@Operate(modulName = "个人借贷基础段--删除")
	@SuppressWarnings("unchecked")
	@RequestMapping("/acctBsSgmtDelete") 
	@ResponseBody
	public Map<String, Object> acctBsSgmtDelete(Model model,
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
			middleDataChangeService.changeMiddleDataMCom("210",map.get("pbaAcctBsSgmtId").toString(),"delete",company);

			loanAcctInfoService.deleteLoanAcctBsSgmt(map);
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
	@Operate(modulName = "个人借贷基本信息段--新增/修改")
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
			map.put("COMPANY", company);
			map.put("operationUser",userName);
			if(pageType != null && "add".equals(pageType)){
				if(loanAcctInfoService.getAcctBsInfoSgmtKey(map) > 0) {
					resultMap.put("msg", "主键重复!请将该信息删除后,重新添加数据信息!");
					resultMap.put("success", false);
				}else {
					//新增
					loanAcctInfoService.insertAcctBsInfoSgmt(map);
				}
			}else if(pageType != null && "edit".equals(pageType)){
				//修改
				loanAcctInfoService.updateAcctBsInfoSgmt(map);
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
	@Operate(modulName = "个人借贷基本信息段--删除")
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
			loanAcctInfoService.delAcctBsInfoSgmt(map);
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
			List<LoanAcctRltInfSgmt> dataList = null;
			if(pageType != null && "edit".equals(pageType)){
				dataList = loanAcctInfoService.getLoanRltSgmtById(page);
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
	@Operate(modulName = "个人借贷相关还款责任人段--新增/修改")
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
			String pbaAcctBsSgmtId = request.getParameter("pbaAcctBsSgmtId");
			String pbcRltRepymtInfSgmtId = request.getParameter("pbcRltRepymtInfSgmtId");
			String jsonSetMap = ServletRequestUtils.getStringParameter(request,
					"rltData", "");
			jsonSetMap = java.net.URLDecoder.decode(jsonSetMap, "UTF-8");
			Map<String, Object> map = mapper.readValue(jsonSetMap,Map.class);
			map.put("COMPANY", company);
			map.put("pbaAcctBsSgmtId", pbaAcctBsSgmtId);
			map.put("pbcRltRepymtInfSgmtId", pbcRltRepymtInfSgmtId);
			if(loanAcctInfoService.getrltRepymtInfKey(map) == 0){
				//新增
				loanAcctInfoService.insertRltRepymtInf(map);
			}else{
				//更新
				loanAcctInfoService.updateRltRepymtInf(map);
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
	@Operate(modulName = "个人借贷相关还款责任人段--删除")
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
			loanAcctInfoService.delrltRepymtInf(map);
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
				dataList = loanAcctInfoService.getMccInfoSgmtById(page);
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
	@Operate(modulName = "个人借贷抵质押物--新增/修改")
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
			String pbaAcctBsSgmtId = request.getParameter("pbaAcctBsSgmtId");
			String pbdMccInfSgmtId = request.getParameter("pbdMccInfSgmtId");
			String jsonSetMap = ServletRequestUtils.getStringParameter(request,
					"mccData", "");
			jsonSetMap = java.net.URLDecoder.decode(jsonSetMap, "UTF-8");
			Map<String, Object> map = mapper.readValue(jsonSetMap,Map.class);
			map.put("COMPANY", company);
			map.put("pbaAcctBsSgmtId", pbaAcctBsSgmtId);
			map.put("pbdMccInfSgmtId", pbdMccInfSgmtId);
			if(loanAcctInfoService.getMccInfKey(map)== 0){
				//新增
				loanAcctInfoService.insertMccInf(map);
			}else{
				
				//更新
				loanAcctInfoService.updateMccInf(map);
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
	@Operate(modulName = "个人借贷抵质押物--删除")
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
			loanAcctInfoService.delMccInf(map);
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
	@Operate(modulName = "个人借贷授信额度--新增/修改")
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
				if(loanAcctInfoService.getAcctCredSgmtKey(map) > 0) {
					resultMap.put("msg", "主键重复!请将该信息删除后,重新添加数据信息!");
					resultMap.put("success", false);
				}else {
					//新增
					loanAcctInfoService.insertAcctCredSgmt(map);
				}
			}else if(pageType != null && "edit".equals(pageType)){
				//修改
				loanAcctInfoService.updateAcctCredSgmt(map);
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
	@Operate(modulName = "个人借贷授信额度--删除")
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
			loanAcctInfoService.delAcctCredSgmt(map);
			resultMap.put("success", true);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
		}
		return resultMap;
	}
	
	/**
	 * 新增或修改   月度表现信息段
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@Operate(modulName = "个人借贷月度表现--新增/修改")
	@SuppressWarnings("unchecked")
	@RequestMapping("/saveAMBlgInfSgmt")
	@ResponseBody
	public Map<String, Object> saveAMBlgInfSgmt(Model model,
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
				if(loanAcctInfoService.getAmblgInfSgmtKey(map) > 0) {
					resultMap.put("msg", "主键重复!请将该信息删除后,重新添加数据信息!");
					resultMap.put("success", false);
				}else {
					//新增
					loanAcctInfoService.insertAmblgInfSgmt(map);
				}
			}else if(pageType != null && "edit".equals(pageType)){
				//修改
				loanAcctInfoService.updateAmblgInfSgmt(map);
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
	 * 删除  月度表现信息段
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@Operate(modulName = "个人借贷月度表现--删除")
	@SuppressWarnings("unchecked")
	@RequestMapping("/amblgInfSgmtDel") 
	@ResponseBody
	public Map<String, Object> amblgInfSgmtDel(Model model,
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
			loanAcctInfoService.delAmblgInfSgmt(map);
			resultMap.put("success", true);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
		}
		return resultMap;
	}
	
	/**
	 * 新增或修改   非月度表现信息段
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@Operate(modulName = "个人借贷非月度表现--新增/修改")
	@SuppressWarnings("unchecked")
	@RequestMapping("/saveAcctDbtInfSgmt")
	@ResponseBody
	public Map<String, Object> saveAcctDbtInfSgmt(Model model,
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
				if(loanAcctInfoService.getAcctDbtInfSgmtKey(map) > 0) {
					resultMap.put("msg", "主键重复!请将该信息删除后,重新添加数据信息!");
					resultMap.put("success", false);
				}else {
					//新增
					loanAcctInfoService.insertAcctDbtInfSgmt(map);
				}
			}else if(pageType != null && "edit".equals(pageType)){
				//修改
				loanAcctInfoService.updateAcctDbtInfSgmt(map);
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
	 * 删除  非月度表现信息段
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@Operate(modulName = "个人借贷非月度表现--删除")
	@SuppressWarnings("unchecked")
	@RequestMapping("/acctDbtInfSgmtDel") 
	@ResponseBody
	public Map<String, Object> acctDbtInfSgmtDel(Model model,
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
			loanAcctInfoService.delAcctDbtInfSgmt(map);
			resultMap.put("success", true);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
		}
		return resultMap;
	}
	
	/**
	 * 新增或修改   大额专项分期信息段
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@Operate(modulName = "个人借贷大额专项分期信息--新增/修改")
	@SuppressWarnings("unchecked")
	@RequestMapping("/saveSpecPrdSgmt")
	@ResponseBody
	public Map<String, Object> saveSpecPrdSgmt(Model model,
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
				if(loanAcctInfoService.getSpecPrdSgmtKey(map) > 0) {
					resultMap.put("msg", "主键重复!请将该信息删除后,重新添加数据信息!");
					resultMap.put("success", false);
				}else {
					//新增
					loanAcctInfoService.insertSpecPrdSgmt(map);
				}
			}else if(pageType != null && "edit".equals(pageType)){
				//修改
				loanAcctInfoService.updateSpecPrdSgmt(map);
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
	 * 删除  大额专项分期信息段
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@Operate(modulName = "个人借贷大额专项分析信息--删除")
	@SuppressWarnings("unchecked")
	@RequestMapping("/specPrdSgmtDel") 
	@ResponseBody
	public Map<String, Object> specPrdSgmtDel(Model model,
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
			loanAcctInfoService.delSpecPrdSgmt(map);
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
				dataList = loanAcctInfoService.getTrstDspnSgmtById(page);
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
	@Operate(modulName = "个人借贷特殊交易说明--新增/修改")
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
			String pbaAcctBsSgmtId = request.getParameter("pbaAcctBsSgmtId");
			String pbjAsTrstDspnSgmtId = request.getParameter("pbjAsTrstDspnSgmtId");
			String jsonSetMap = ServletRequestUtils.getStringParameter(request,
					"busData", "");
			jsonSetMap = java.net.URLDecoder.decode(jsonSetMap, "UTF-8");
			Map<String, Object> map = mapper.readValue(jsonSetMap,Map.class);
			map.put("COMPANY", company);
			map.put("pbaAcctBsSgmtId", pbaAcctBsSgmtId);
			map.put("pbjAsTrstDspnSgmtId", pbjAsTrstDspnSgmtId);
			if(loanAcctInfoService.getTrstDspnKey(map)== 0){
				//新增
				loanAcctInfoService.insertTrstDspn(map);
			}else{
				
				//更新
				loanAcctInfoService.updateTrstDspn(map);
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
	@Operate(modulName = "个人借贷特殊交易说明--删除")
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
			loanAcctInfoService.delTrstDspn(map);
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
	@Operate(modulName = "个人借贷初始债权--新增/修改")
	@SuppressWarnings("unchecked")
	@RequestMapping("/saveOcInfSgmt")
	@ResponseBody
	public Map<String, Object> saveOcInfSgmt(Model model,
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
				if(loanAcctInfoService.getOcInfSgmtKey(map) > 0) {
					resultMap.put("msg", "主键重复!请将该信息删除后,重新添加数据信息!");
					resultMap.put("success", false);
				}else {
					//新增
					loanAcctInfoService.insertOcInfSgmt(map);
				}
			}else if(pageType != null && "edit".equals(pageType)){
				//修改
				loanAcctInfoService.updateOcInfSgmt(map);
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
	@Operate(modulName = "个人借贷初始债权--删除")
	@SuppressWarnings("unchecked")
	@RequestMapping("/ocInfSgmtDel") 
	@ResponseBody
	public Map<String, Object> ocInfSgmtDel(Model model,
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
			loanAcctInfoService.delOcInfSgmt(map);
			resultMap.put("success", true);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
		}
		return resultMap;
	}
}
