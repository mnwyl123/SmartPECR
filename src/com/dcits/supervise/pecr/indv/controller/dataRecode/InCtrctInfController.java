package com.dcits.supervise.pecr.indv.controller.dataRecode;

import com.alibaba.druid.support.json.JSONUtils;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.common.service.MiddleDataChangeService;
import com.dcits.supervise.pecr.indv.entity.InCtrctInfCtrctBsSgmt;
import com.dcits.supervise.pecr.indv.service.dataRecode.InCtrctInfManager;
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
 * 个人授信协议信息记录
 * @return
 */
@Controller
@RequestMapping("/inCtrctInf")
public class InCtrctInfController extends BaseController {
	
	@Autowired
	private InCtrctInfManager inCtrctInfService;
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
		return "pecr/indv/dataRecode/InCtrctInf/InCtrctInfdataList";
	}

	/**
	 * 个人授信信息基础段数据列表
	 * @return
	 */
	@RequestMapping("/dataCtrctBsSgmtList")
	@ResponseBody
	public Map<String, Object> dataCtrctBsSgmtList(Page page){
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
			List<InCtrctInfCtrctBsSgmt> dataCtrctBsSgmtList = inCtrctInfService.dataCtrctBsSgmtList(page);
			resultMap.put("data", dataCtrctBsSgmtList);
			resultMap.put("code", 0);
			resultMap.put("count", page.getTotalResult());
		}catch(Exception e) {
			logger.error(e.getMessage(),e);
			resultMap.put("code", 1);
		}
		return resultMap;
	}
	
	/**
	 * 个人授信，新增/修改/详情 页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/inCtrctInfEdit")
	public ModelAndView dataDetail(HttpServletRequest request){
		ModelAndView mv = this.getModelAndView();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		//List<PageData> ctrctCertRelSgmtList = null;
		try {
			PageData pd = this.getPageData();
			String addOrUpdate = pd.getString("addOrUpdate");
			pd.put("COMPANY", company);
			if(addOrUpdate != null && !"add".equals(addOrUpdate)){
				//基础段
				PageData ctrctBsSgmtInfo = inCtrctInfService.getCtrctBsSgmtData(pd);
				//额度信息段
				PageData  creditLimSgmt = inCtrctInfService.getCreditLimSgmtData(pd);
				String PK = pd.getString("pcaCtrctBsSgmtId");
				List<ValidateErrorMessage> validateErrors  = validateErrorMessageService.selectErrorMessageByMasterTablePK(PK);
				mv.addObject("CtrctBsSgmt", JSONUtils.toJSONString(ctrctBsSgmtInfo));
				mv.addObject("CreditLimSgmt", JSONUtils.toJSONString(creditLimSgmt));
				mv.addObject("feedBackErrorSgmt", validateErrors);
			}
			mv.addObject("pd", pd);
			mv.setViewName("pecr/indv/dataRecode/InCtrctInf/InCtrctInfdataEdit");
		}catch(Exception e) {
			logger.error("个人授信协议信息:获取detail页面失败：",e);
		}
		return mv;
	}
	
	/**
	 * 基础段   新增或修改
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@Operate(modulName = "个人授信基础段--新增/修改")
	@SuppressWarnings("unchecked")
	@RequestMapping("/saveCtrctBsSgmt")
	@ResponseBody
	public Map<String, Object> saveCtrctBsSgmt(Model model,
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
				if(inCtrctInfService.getCtrctBsSgmtKey(map) > 0) {
					resultMap.put("msg", "主键重复!请将该信息删除后,重新添加数据信息!");
					resultMap.put("success", false);
				}else {
					//新增
					inCtrctInfService.insertCtrctBsSgmt(map);
					middleDataChangeService.changeMiddleDataMCom("220",map.get("pcaCtrctBsSgmtId").toString(),"add",company);

				}
			}else if(pageType != null && "edit".equals(pageType)){
				//修改
				inCtrctInfService.updateCtrctBsSgmt(map);
				middleDataChangeService.changeMiddleDataMCom("220",map.get("pcaCtrctBsSgmtId").toString(),"update",company);
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
	@Operate(modulName = "个人授信协议信息--删除")
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
			map.put("pcaCtrctBsSgmtId", pd.getString("pcaCtrctBsSgmtId"));
			map.put("COMPANY", company);
			middleDataChangeService.changeMiddleDataMCom("220",map.get("pcaCtrctBsSgmtId").toString(),"delete",company);
			inCtrctInfService.deleteCtrctBsSgmt(map);
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
	@Operate(modulName = "个人授信基础段--删除")
	@SuppressWarnings("unchecked")
	@RequestMapping("/delCtrctBsSgmt") 
	@ResponseBody
	public Map<String, Object> delCtrctBsSgmt(Model model,
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
			middleDataChangeService.changeMiddleDataMCom("220",map.get("pcbCtrctCertRelSgmtId").toString(),"delete",company);

			inCtrctInfService.deleteCtrctBsSgmt(map);
			resultMap.put("success", true);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
		}
		return resultMap;
	}
	
	/**
	 * 获取  共同授信人信息段
	 * @param pd
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getCtrctCertRelSgmtList")
	public Map<String, Object> getCtrctCertRelSgmtList(Page page){
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
				dataList = inCtrctInfService.getCertRelSgmtList(page);
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
	 * 新增或修改  共同授信人信息段
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@Operate(modulName = "个人授信共同授信人--新增/修改")
	@SuppressWarnings("unchecked")
	@RequestMapping("/saveCertRelSgmt")
	@ResponseBody
	public Map<String, Object> saveCertRelSgmt(Model model,
			HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			ObjectMapper mapper = new ObjectMapper();
			String pcaCtrctBsSgmtId = request.getParameter("pcaCtrctBsSgmtId");
			String pcbCtrctCertRelSgmtId = request.getParameter("pcbCtrctCertRelSgmtId");
			String jsonSetMap = ServletRequestUtils.getStringParameter(request,
					"commData", "");
			jsonSetMap = java.net.URLDecoder.decode(jsonSetMap, "UTF-8");
			Map<String, Object> map = mapper.readValue(jsonSetMap,Map.class);
			map.put("COMPANY", company);
			map.put("pcaCtrctBsSgmtId", pcaCtrctBsSgmtId);
			map.put("pcbCtrctCertRelSgmtId", pcbCtrctCertRelSgmtId);
			if(inCtrctInfService.getCertRelSgmtKey(map)== 0){
				//新增
				inCtrctInfService.insertCertRelSgmt(map);
			}else{
				//更新
				inCtrctInfService.updateCertRelSgmt(map);
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
	 * 删除  共同授信人信息段
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@Operate(modulName = "个人授信共同授信人--删除")
	@SuppressWarnings("unchecked")
	@RequestMapping("/delCtrctCertRelSgmt") 
	@ResponseBody
	public Map<String, Object> delCtrctCertRelSgmt(Model model,
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
			inCtrctInfService.deleteCertRelSgmt(map);
			resultMap.put("success", true);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
		}
		return resultMap;
	}
	
	/**
	 * 新增或修改   额度信息段
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@Operate(modulName = "个人授信额度信息--新增/修改")
	@SuppressWarnings("unchecked")
	@RequestMapping("/saveCreditLimSgmt")
	@ResponseBody
	public Map<String, Object> saveCreditLimSgmt(Model model,
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
				if(inCtrctInfService.getCreditLimSgmtKey(map) > 0) {
					resultMap.put("msg", "主键重复!请将该信息删除后,重新添加数据信息!");
					resultMap.put("success", false);
				}else {
					//新增
					inCtrctInfService.insertCreditLimSgmt(map);
				}
			}else if(pageType != null && "edit".equals(pageType)){
				//修改
				inCtrctInfService.updateCreditLimSgmt(map);
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
	 * 删除   额度信息段
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@Operate(modulName = "个人授信额度信息--删除")
	@SuppressWarnings("unchecked")
	@RequestMapping("/delCreditLimSgmt") 
	@ResponseBody
	public Map<String, Object> delCreditLimSgmt(Model model,
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
			inCtrctInfService.delCreditLimSgmt(map);
			resultMap.put("success", true);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
		}
		return resultMap;
	}
}
