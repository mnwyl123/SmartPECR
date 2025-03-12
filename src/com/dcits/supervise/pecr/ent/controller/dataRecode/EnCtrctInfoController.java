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
import com.dcits.supervise.pecr.ent.service.dataRecode.EnCtrctInfoManager;
import com.dcits.supervise.pecr.log.Operate;
import com.dcits.supervise.pecr.validateData.model.ValidateErrorMessage;
import com.dcits.supervise.pecr.validateData.service.ValidateErrorMessageService;

/**
 * 企业授信信息
 * @author 穆楠
 *
 */
@Controller
@RequestMapping("/enCtrctInfo")
public class EnCtrctInfoController extends BaseController {
    @Autowired
    EnCtrctInfoManager enCtrctInfoService;
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
        return "pecr/ent/dataRecode/enCtrctInfo/enCtrctInfodataList";
    }

    /**
     * 获取表格数据列表
     * @param page
     * @return
     */
    @RequestMapping("/ctrctBsSgmtList")
    @ResponseBody
    public Map<String, Object> ctrctBsSgmtList(Page page){
        Map<String, Object> resultMap = new HashMap<String, Object>();
        Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
        try {
            PageData pd = this.getPageData();
            pd.put("COMPANY", company);
            pd.put("queryType", "APPLY");
            //判断是否为管理员
            Boolean flag = (Boolean) session.getAttribute(user.getUSER_ID()+"isCompany");
			pd.put("managerId",flag?"":user.getUSERNAME());
            int pge = Integer.parseInt(pd.getString("page"));
            int limit = Integer.parseInt(pd.getString("limit"));
            page.setCurrentPage(pge);
            page.setShowCount(limit);
            page.setPd(pd);
            List<Map<String, Object>> dataList = enCtrctInfoService.getctrctBsSgmtList(page);
            resultMap.put("data", dataList);
            resultMap.put("code", 0);
            resultMap.put("count", page.getTotalResult());
        }catch(Exception e) {
            logger.error(e.getMessage(),e);
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
    @RequestMapping("/enCtrctInfoEdit")
    public ModelAndView dataDetail(Page page) {
        ModelAndView mv = this.getModelAndView();
        Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
        try {
            PageData pd = this.getPageData();
            pd.put("COMPANY", company);
            String addOrUpdate = pd.getString("addOrUpdate");
            if (addOrUpdate != null && !"add".equals(addOrUpdate)) {
                Map<String, Object> ctrctBsSgmt = enCtrctInfoService.getCtrctBsSgmtById(pd);
                PageData creditLimSgmt = enCtrctInfoService.getCreditLimSgmtById(pd);
                String PK =pd.getString("egaCtrctBsSgmtId");
				List<ValidateErrorMessage> validateErrors  = validateErrorMessageService.selectErrorMessageByMasterTablePK(PK);
                mv.addObject("ctrctBsSgmt", JSONUtils.toJSONString(ctrctBsSgmt));
                mv.addObject("creditLimSgmt", JSONUtils.toJSONString(creditLimSgmt));
                mv.addObject("feedBackErrorSgmt", validateErrors);
            }
            mv.addObject("pd", pd);
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        mv.setViewName("pecr/ent/dataRecode/enCtrctInfo/enCtrctInfodataEdit");
        return mv;
    }
    /**
     * 基础段   新增或修改
     * @param model
     * @param request
     * @param response
     * @return
     */
    @Operate(modulName = "企业授信基础段--新增/修改")
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
            map.put("operationUser",userName);
            map.put("COMPANY", company);
            if(pageType != null && "add".equals(pageType)){
                if(enCtrctInfoService.getCtrctBsSgmtKey(map) > 0) {
                    resultMap.put("msg", "主键重复!请将该信息删除后,重新添加数据信息!");
                    resultMap.put("success", false);
                }else {
                    //新增
                    enCtrctInfoService.insertCtrctBsSgmt(map);
					middleDataChangeService.changeMiddleDataMCom("420",map.get("egaCtrctBsSgmtId").toString(),"add",company);

                }
            }else if(pageType != null && "edit".equals(pageType)){
                //修改
                enCtrctInfoService.updateCtrctBsSgmt(map);
                middleDataChangeService.changeMiddleDataMCom("420",map.get("egaCtrctBsSgmtId").toString(),"update",company);
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
	 * 删除 基础段数据
	 * @param page
	 * @return
	 */
    @Operate(modulName = "企业授信基础段--删除")
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
			map.put("eeaGuarAcctBsSgmtId", pd.getString("eeaGuarAcctBsSgmtId"));
			middleDataChangeService.changeMiddleDataMCom("420",map.get("egaCtrctBsSgmtId").toString(),"delete",company);
			enCtrctInfoService.deleteOneRecord(map);
			resultMap.put("success", true);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
		}
		return resultMap;
	}
    
    /**
     * 删除企业信息
     * @param page
     * @return
     */
    @Operate(modulName = "企业授信信息--删除")
    @RequestMapping("/deleteOneRecord")
    @ResponseBody
    public Map<String, Object> deleteOneRecord(Page page){
        Map<String, Object> resultMap = new HashMap<String, Object>();
        Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
        resultMap.put("success", true);
        try {
            PageData pd = this.getPageData();
            pd.put("COMPANY", company);
            enCtrctInfoService.deleteOneRecord(pd);
        }catch(Exception e) {
            logger.error(e.getMessage());
            resultMap.put("success", false);
            resultMap.put("msg", e.getMessage());
        }
        return resultMap;
    }
    /**
     * 获取  共同授信人信息段
     * @param page
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
            List<PageData> dataList = null;
            if(pageType != null && "edit".equals(pageType)){
                dataList = enCtrctInfoService.getRltInfList(page);
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
    @Operate(modulName = "企业授信共同授信人信息段--新增/修改")
    @SuppressWarnings("unchecked")
    @RequestMapping("/saveCtrctCertRelSgmt")
    @ResponseBody
    public Map<String, Object> saveCtrctCertRelSgmt(Model model,
                                               HttpServletRequest request, HttpServletResponse response){
        Map<String, Object> resultMap = new HashMap<String, Object>();
        Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
        try {
            ObjectMapper mapper = new ObjectMapper();
            String egaCtrctBsSgmtId = request.getParameter("egaCtrctBsSgmtId");
            String egbCtrctCertRelSgmtId = request.getParameter("egbCtrctCertRelSgmtId");
            String jsonSetMap = ServletRequestUtils.getStringParameter(request,
                    "rltData", "");
            jsonSetMap = java.net.URLDecoder.decode(jsonSetMap, "UTF-8");
            Map<String, Object> map = mapper.readValue(jsonSetMap,Map.class);
            map.put("COMPANY", company);
            map.put("egaCtrctBsSgmtId", egaCtrctBsSgmtId);
            map.put("egbCtrctCertRelSgmtId", egbCtrctCertRelSgmtId);
            if(enCtrctInfoService.getCertRelSgmtKey(map)>0){
            	//更新
                enCtrctInfoService.updateCertRelSgmt(map);
               
            }else{
            	 //新增
                enCtrctInfoService.insertCertRelSgmt(map);
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
    @Operate(modulName = "企业授信共同授信人信息段--删除")
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
            enCtrctInfoService.deleteCertRelSgmt(map);
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
    @Operate(modulName = "企业授信额度信息段--新增/修改")
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
                if(enCtrctInfoService.getCreditLimSgmtKey(map) > 0) {
                    resultMap.put("msg", "主键重复!请将该信息删除后,重新添加数据信息!");
                    resultMap.put("success", false);
                }else {
                    //新增
                    enCtrctInfoService.insertCreditLimSgmt(map);
                }
            }else if(pageType != null && "edit".equals(pageType)){
                //修改
                enCtrctInfoService.updateCreditLimSgmt(map);
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
    @Operate(modulName = "企业授信额度信息段--删除")
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
            enCtrctInfoService.delCreditLimSgmt(map);
            resultMap.put("success", true);
        }catch(Exception e) {
            logger.error(e.getMessage());
            resultMap.put("success", false);
            resultMap.put("msg", e.getMessage());
        }
        return resultMap;
    }
}
