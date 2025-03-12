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
import com.dcits.supervise.pecr.ent.entity.EnIcdnRltpInf;
import com.dcits.supervise.pecr.ent.service.dataRecode.EnIcdnRltpInfManager;
import com.dcits.supervise.pecr.log.Operate;
import com.dcits.supervise.pecr.validateData.model.ValidateErrorMessage;
import com.dcits.supervise.pecr.validateData.service.ValidateErrorMessageService;
/**
 * 企业间关联关系信息记录
 * @author 穆楠
 *
 */
@Controller
@RequestMapping("/enIcdnRltpInf")
public class EnIcdnRltpInfController extends BaseController{

	@Autowired
	private EnIcdnRltpInfManager EnIcdnRltpInfService;
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
		return "pecr/ent/dataRecode/enIcdnRltpInf/enIcdnRltpInfList";
	}
	
	/**
	 * 获取表格数据列表
	 * @param page
	 * @return
	 */
	@RequestMapping("/enIcdnRltpInfList")
	@ResponseBody
	public Map<String, Object> enIcdnRltpInfList(Page page){
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
			List<EnIcdnRltpInf> dataList = EnIcdnRltpInfService.List(page);
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
	@RequestMapping("/enIcdnRltpInfEdit")
	public ModelAndView enIcdnRltpInfEdit(Page page) {
		ModelAndView mv = this.getModelAndView();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			PageData pd = this.getPageData();
			pd.put("COMPANY", company);
			String addOrUpdate = pd.getString("addOrUpdate");
			if(addOrUpdate != null && !"add".equals(addOrUpdate)){
				PageData dataList = EnIcdnRltpInfService.EnIcdnRltpInfbyId(pd);
				String PK = pd.getString("ecaEnIcdnRltpInfId");
				List<ValidateErrorMessage> validateErrors  = validateErrorMessageService.selectErrorMessageByMasterTablePK(PK);
				mv.addObject("enIcdnRltpInf", JSONUtils.toJSONString(dataList));
				mv.addObject("feedBackErrorSgmt", validateErrors);
			}
			
			mv.addObject("pd", pd);
		}catch(Exception e) {
			logger.error("企业关联关系信息信息:获取新增、详情、修改页面失败：",e);
		}
		mv.setViewName("pecr/ent/dataRecode/enIcdnRltpInf/enIcdnRltpInfEdit");
		return mv;
	}
	/**
	 * 基本信息段   新增或修改
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@Operate(modulName = "企业间关联关系基本信息段--新增/修改")
	@SuppressWarnings("unchecked")
	@RequestMapping("/saveEnIcdnRltpInf")
	@ResponseBody
	public Map<String, Object> saveEnIcdnRltpInf(Model model,
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
				EnIcdnRltpInfService.insertEnIcdnRltpInf(map);
				middleDataChangeService.changeMiddleDataMCom("350",map.get("ecaEnIcdnRltpInfId").toString(),"add",company);

			}else if(pageType != null && "edit".equals(pageType)){
				//修改
				EnIcdnRltpInfService.updateEnIcdnRltpInf(map);
				middleDataChangeService.changeMiddleDataMCom("350",map.get("ecaEnIcdnRltpInfId").toString(),"update",company);
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
	@Operate(modulName = "企业间关联关系基本信息段--删除")
	@RequestMapping("/delEnIcdnRltpInf") 
	@ResponseBody
	public Map<String, Object> delEnIcdnRltpInf(Model model,
			HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			PageData pd = this.getPageData();
			pd.put("COMPANY", company);
			middleDataChangeService.changeMiddleDataMCom("350",pd.get("ecaEnIcdnRltpInfId").toString(),"delete",company);
			EnIcdnRltpInfService.deleteEnIcdnRltpInf(pd);
			resultMap.put("success", true);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
		}
		return resultMap;
	}
}
