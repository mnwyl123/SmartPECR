package com.dcits.platform.controller.system.buttonAuth;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.session.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.service.system.buttonAuth.ButtonAuthManager;
import com.dcits.platform.util.AppUtil;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.role.RoleAuthFactory;

@Controller
@RequestMapping(value="/buttonAuthController")
public class ButtonAuthController extends BaseController{

	@Resource(name = "buttonAuthService")
	private ButtonAuthManager buttonAuthService;

	private RoleAuthFactory roleAtuhFactory;
	
	@RequestMapping(value="/lists")
	public ModelAndView lists(Page page)throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表buttonAuth");
		ModelAndView mv = this.getModelAndView();
		//PageData pd = new PageData();
		//pd = this.getPageData();
		PageData pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		
		List<String> roleIds = (List<String>) session.getAttribute(USERID+Const.SESSION_ROLE_RIGHTS);
		String menuId = pd.getString("menuId");
		//if(menuId!=null&&!menuId.equals(null)){
		if(menuId != null && !(menuId== null)){
			session.setAttribute(USERID+"buttonAuthControllerSession", menuId);
		}else{
			menuId = (String) session.getAttribute(USERID+"buttonAuthControllerSession");
		}
		
		pd.put("COMPANY", company); 
		pd.put("USER_ID", USERID);
		String keywords = pd.getString("keywords");					//检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		
		List<PageData> buttonAuthList = buttonAuthService.lists(page);
		
		Map<String,String> QX = (Map<String, String>) roleAtuhFactory.getHC(roleIds,menuId);
		
		mv.addObject("pd", pd);
		mv.addObject("page", page);
		mv.addObject("buttonAuthList", buttonAuthList);
		mv.addObject("QX",QX);	//按钮权限
		mv.setViewName("system/buttonAuth/buttonAuth_list");
		return mv;
	}
	
	/**
	 * 去新增页面
	 * @return
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			Session session = Jurisdiction.getSession();
			User user = (User)session.getAttribute(Const.SESSION_USER);
			String USERID = user.getUSER_ID();
			String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
			pd.put("COMPANY", company);
			PageData comPd = buttonAuthService.getCompanyName(pd);
			pd.put("COMP_CODE", comPd.get("COMP_CODE"));
			pd.put("COMP_NAME", comPd.get("COMP_NAME"));
			//获取menuList
			List<PageData> menuList = buttonAuthService.findAllMenu(pd);
			
			mv.addObject("msg", "add");
			mv.addObject("menuList", menuList);
			mv.setViewName("system/buttonAuth/buttonAuth_edit");
			mv.addObject("pd", pd);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**
	 * 去修改页面
	 * @return
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			pd = buttonAuthService.findButtonAuthByID(pd);
			PageData comPd = buttonAuthService.getCompanyName(pd);
			pd.put("COMP_NAME", comPd.get("COMP_NAME"));
			List<PageData> menuList = buttonAuthService.findAllMenu(pd);
			List<PageData> funIdList = buttonAuthService.getFunNameByMenuId(pd);
			mv.addObject("menuList", menuList);
			mv.addObject("funIdList", funIdList);
			mv.addObject("msg", "edit");
			mv.setViewName("system/buttonAuth/buttonAuth_edit");
			mv.addObject("pd", pd);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**
	 * 异步请求获取功能代码
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/funCodeChange")
	@ResponseBody
	public Object funCodeChange()throws Exception{
		//PageData pd = new PageData();
		//pd = this.getPageData();
		PageData pd = this.getPageData();
		Map<String,Object> map = new HashMap<String,Object>();
		String RESO_ID = pd.getString("RESO_ID");
		String FUN_GROUP_ID = RESO_ID.split("-")[2];
		pd.put("FUN_GROUP_ID", FUN_GROUP_ID);
		List<PageData> funIdList = new ArrayList<PageData>();
		try {
			funIdList = buttonAuthService.findFunIdByGroupId(pd);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			map.put("result", "error");
		}
		map.put("funIdList", funIdList);
		map.put("result", "success");
		return AppUtil.returnObject(pd, map);
	}
	
	@RequestMapping(value="/add")
	public ModelAndView add()throws Exception{
	//	if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"新增安全信息维护");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try{
			pd = this.getPageData();
			Session session = Jurisdiction.getSession();
			User user = (User)session.getAttribute(Const.SESSION_USER);
			String name = user.getUSERNAME();
			String createTime = sdf.format(new Date());
			
			pd.put("CREATE_USER", name);
			pd.put("CREATE_DATE", createTime);
			
			pd.put("BUTTONAUTH_CODE", this.get32UUID());	//ID 主键
			pd.put("RESERVED", "");
			pd.put("DELETE_USER", "");
			pd.put("DELETE_DATE", "");
			buttonAuthService.save(pd);
		} catch(Exception e){
			logger.error(e.toString(), e);
			mv.addObject("msg","failed");
		}
		mv.setViewName("save_result");
		return mv;
	}
	
	@RequestMapping(value="/edit")
	public ModelAndView edit()throws Exception{
	//	if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"修改安全信息维护");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try{
			pd = this.getPageData();
			Session session = Jurisdiction.getSession();
			User user = (User)session.getAttribute(Const.SESSION_USER);
			String name = user.getUSERNAME();
			String updateTime = sdf.format(new Date());
			
			pd.put("UPDATE_USER", name);
			pd.put("UPDATE_DATE", updateTime);
			if("N".equals(pd.getString("STATUS"))){
				pd.put("DELETE_USER", name);
				pd.put("DELETE_DATE", updateTime);
			}
			pd.put("RESERVED", "");
			pd.put("DELETE_USER", "");
			pd.put("DELETE_DATE", "");
			buttonAuthService.updateButtonAuth(pd);
		} catch(Exception e){
			logger.error(e.toString(), e);
			mv.addObject("msg","failed");
		}
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 删除，只是改变其状态
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteBA")
	@ResponseBody
	public Object deleteBA()throws Exception{
		//PageData pd = new PageData();
		//pd = this.getPageData();
		PageData pd = this.getPageData();
		Map<String,Object> map = new HashMap<String,Object>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Session session = Jurisdiction.getSession();
			User user = (User)session.getAttribute(Const.SESSION_USER);
			String name = user.getUSERNAME();
			String deleteTime = sdf.format(new Date());
			
			pd.put("DELETE_USER", name);
			pd.put("DELETE_DATE", deleteTime);
			pd.put("STATUS", "N");
			buttonAuthService.updateStatus(pd);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			map.put("result", "false");
		}
		map.put("result", "success");
		return AppUtil.returnObject(pd, map);
	}
}
