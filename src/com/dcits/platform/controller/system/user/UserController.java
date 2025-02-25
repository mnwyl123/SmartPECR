package com.dcits.platform.controller.system.user;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONArray;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.Org;
import com.dcits.platform.entity.system.Role;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.service.system.menu.MenuManager;
import com.dcits.platform.service.system.operation.OperationManager;
import com.dcits.platform.service.system.org.OrgManager;
import com.dcits.platform.service.system.pwdRuleConfig.pwdRuleConfigManager;
import com.dcits.platform.service.system.role.RoleManager;
import com.dcits.platform.service.system.user.UserManager;
import com.dcits.platform.util.AppUtil;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.FileDownload;
import com.dcits.platform.util.FileUpload;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.ObjectExcelRead;
import com.dcits.platform.util.ObjectExcelView;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.PasswordEncoder;
import com.dcits.platform.util.PathUtil;
import com.dcits.platform.util.PwdRuleCheck;
import com.dcits.platform.util.role.RoleAuthFactory;
import com.dcits.supervise.pecr.log.Operate;

/** 
 * 类名称：UserController
 * 创建人：FH fhpengyj (pengyj)
 * 更新时间：2015年11月3日
 * @version
 */
@Controller
@RequestMapping(value="/user")
public class UserController extends BaseController {
	
	String menuUrl = "user/listUsers.do"; //菜单地址(权限用)
	@Resource(name="userService")
	private UserManager userService;
	@Resource(name="pwdRuleConfigService")
	private pwdRuleConfigManager pwdRuleConfigService ;
	@Resource(name="roleService")
	private RoleManager roleService;
	@Resource(name="menuService")
	private MenuManager menuService;
	@Resource(name="orgService")
	private OrgManager orgService;
	@Resource(name="operationService")
	private OperationManager operationService;
	
	private RoleAuthFactory roleAtuhFactory;
	PasswordEncoder passwordEncoder = new PasswordEncoder();
	
	/**显示用户列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/listUsers")
	public ModelAndView listUsers(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
//		String keywords = pd.getString("keywords");				//关键词检索条件
//		if(null != keywords && !"".equals(keywords)){
//			pd.put("keywords", keywords.trim());
//		}
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		Org curOrg = (Org) session.getAttribute(USERID+Const.SESSION_ORG);
		if(curOrg!=null){
			pd.put("orgId", curOrg.getOrgId());
		}

		List<String> roleIds = (List<String>) session.getAttribute(USERID+Const.SESSION_ROLE_RIGHTS);
		String menuId = pd.getString("menuId");
		if(menuId!=null){
			session.setAttribute(USERID+"userMenuIdSession", menuId);
		}else{
			menuId = (String) session.getAttribute(USERID+"userMenuIdSession");
		}
		pd.put("COMPANY", company); 
		pd.put("curUser", user.getUSERNAME());
		pd.put("curComp", "admin"+company);
		pd.put("USER_ID", USERID);
		page.setPd(pd);
		
		
		List<Role> roleList = roleService.listRolesByPId(pd);//列出所有系统用户角色
		Map<String,String> map = roleAtuhFactory.getHC(roleIds,menuId);
		List<Org> orgList = orgService.listAllOrgByCompany(company);
		List<PageData>	userList = userService.listUsers(page);	//列出用户列表
		String roleCount="0";
		String orgCount="0";
		if(roleList.size()>0){
			roleCount = "1";
		}
		if(orgList.size()>0){
			orgCount = "1";
		}
		pd.put("roleCount", roleCount);
		pd.put("orgCount", orgCount);
		mv.setViewName("system/user/user_list");
		mv.addObject("userList", userList);
		mv.addObject("roleList", roleList);
		mv.addObject("orgList",orgList);
		mv.addObject("pd", pd);
		mv.addObject("QX",map);	//按钮权限
		return mv;
	}
	
	/**删除用户
	 * @param out
	 * @throws Exception 
	 */
	@Operate(modulName = "删除user")
	@RequestMapping(value="/deleteU")
	public void deleteU(PrintWriter out) throws Exception{
	//	if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"删除user");
		PageData pd = this.getPageData();
		userService.deleteU(pd);
		out.write("success");
		out.close();
	}
	
	/**去新增用户页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goAddU")
	public ModelAndView goAddU()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
//		pd.put("ROLE_ID", "1");
//		List<Role> roleList = roleService.listAllRolesByPId(pd);//列出所有系统用户角色
		mv.setViewName("system/user/user_edit");
		mv.addObject("msg", "saveU");
		mv.addObject("pd", pd);
		//mv.addObject("roleList", roleList);
		return mv;
	}
	
	
	/**去用户授权页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goAuthOrg")
	public ModelAndView goAuthOrg(Model model)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String company = (String) session.getAttribute(USERID+"sessionComp");
		List<String> IDs ;
		String json ="";
		//从数据库中读取已经授权的机构ID
		if(pd.get("type").toString()=="org"||pd.get("type").toString().equals("org")){
			//机构授权
			IDs = userService.findOrgId(pd.get("USER_ID").toString());
			net.sf.json.JSONArray arr = net.sf.json.JSONArray.fromObject(orgService.listAllOrg("0",company));
			json = arr.toString();
			json = json.replaceAll("orgId", "id").replaceAll("parentId", "pId").replaceAll("name", "name").replaceAll("subDepartment", "nodes").replaceAll("hasDepartment", "checked").replaceAll("treeurl", "url");
		}else{
			//角色授权
			IDs = userService.findRoleId(pd.get("USER_ID").toString());
			net.sf.json.JSONArray arr = net.sf.json.JSONArray.fromObject(roleService.listAllRole(company));
			json = arr.toString();
			json = json.replaceAll("ROLE_ID", "id").replaceAll("ROLE_NAME", "name");
		}
		model.addAttribute("zTreeNodes", json);
		mv.addObject("ID",IDs);
		mv.addObject("pd", pd);	
		mv.setViewName("system/user/user_auth");
		return mv;
	}

	@RequestMapping(value="/saveAuth")
	public ModelAndView saveAuth(@RequestParam String userId,@RequestParam String type,@RequestParam String AllInfo) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增user");
		ModelAndView mv = this.getModelAndView();
		JSONArray dataJson = JSONArray.parseArray(AllInfo.toString());
		
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		Boolean isCompany = (Boolean) session.getAttribute(USERID+"isCompany");
		
		//List<String> IDs = new ArrayList<String>();
		Map<String,Object> list = new HashMap<String,Object>();
		list.put("USER_ID", USERID);
		
		if(type=="org"||type.equals("org")){
			//机构
			//删除已授权
			userService.deleteAuthOrg(userId);
			//if(isCompany){
			//	userService.deleteAuthOrg(userId);
			//}else{
			//	userService.deleteAuthOrg(userId);
//				IDs = userService.findOrgId(USERID);
//				list.put("list", IDs);
//				userService.deleteAuthOrgC(list);
			//}
			for (int i = 0; i < dataJson.size(); i++) {
		    	  Map<String,Object> map = new HashMap<String,Object>();
		        JSONObject jsonObject = dataJson.getJSONObject(i);
		        	map.put("USER_ID",userId);
		        	map.put("ORG_ID",jsonObject.get("id"));
		        	userService.saveOrgAuth(map); 	//执行保存		
		    }
		}else{
			//角色
			//删除已授权
			userService.deleteAuthRole(userId);
			//if(isCompany){
			//	
			//	userService.deleteAuthRole(userId);
			//}else{
			//	userService.deleteAuthRole(userId);
//				IDs = userService.findRoleId(USERID);
//				list.put("list", IDs);
//				userService.deleteAuthRoleC(list);
			//}
			
			for (int i = 0; i < dataJson.size(); i++) {
		    	  Map<String,Object> map = new HashMap<String,Object>();
		        JSONObject jsonObject = dataJson.getJSONObject(i);
		        	map.put("USER_ID",userId);
		        	map.put("ROLE_ID",jsonObject.get("id"));
		        	userService.saveRoleAuth(map); 	//执行保存		
		    }
		}

		mv.addObject("msg","success");
		mv.addObject("msg","failed");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**保存用户
	 * @return
	 * @throws Exception
	 */
	@Operate(modulName = "新增user")
	@RequestMapping(value="/saveU")
	public ModelAndView saveU() throws Exception{
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"新增user");
		ModelAndView mv = this.getModelAndView();
		
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		
		PageData pd = this.getPageData();
		pd.put("USER_ID", this.get32UUID());	//ID 主键
		pd.put("COMPANY", company); 
		pd.put("LAST_LOGIN", "");				//最后登录时间
		pd.put("IP", "");						//IP
		pd.put("STATUS", "0");					//状态
		pd.put("SKIN", "default");
		pd.put("RIGHTS", "");
		pd.put("LOCK_STATUS", "0");
		//pyj 20180223 mysql 报错修改
		pd.put("ERR_TIMES", "0");
		pd.put("PASSWORD", passwordEncoder.encode(pwdRuleConfigService.checkPass("")).toString());	//密码加密
		if(null == userService.findByUsername(pd)){	//判断用户名是否存在
			userService.saveU(pd); 					//执行保存
			mv.addObject("msg","success");
		}else{
			mv.addObject("msg","failed");
		}
		mv.setViewName("save_result");
		return mv;
	}
	
	/**判断用户名是否存在
	 * @return
	 */
	@RequestMapping(value="/hasU")
	@ResponseBody
	public Object hasU(){
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "success";
		PageData pd = new PageData();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		try{
			pd = this.getPageData();
			pd.put("company", company);
			if(userService.findByUsername(pd) != null){
				errInfo = "error";
			}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);				//返回结果
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**判断邮箱是否存在
	 * @return
	 */
	@RequestMapping(value="/hasE")
	@ResponseBody
	public Object hasE(){
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "success";
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			if(userService.findByUE(pd) != null){
				errInfo = "error";
			}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);				//返回结果
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**判断编码是否存在
	 * @return
	 */
	@RequestMapping(value="/hasN")
	@ResponseBody
	public Object hasN(){
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "success";
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			if(userService.findByUN(pd) != null){
				errInfo = "error";
			}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);				//返回结果
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**去修改用户页面  zy
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goEditU")
	public ModelAndView goEditU() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		String userId = pd.get("USER_ID").toString();
		String fx = pd.getString("fx");//顶部修改个人资料
		if("head".equals(fx)){
			mv.addObject("fx", "head");
		}else{
			mv.addObject("fx", "user");
		}
		pd.put("ROLE_ID", "1");
		pd.put("COMPANY", company);
		pd.put("USER_ID", USERID);
		Page page = new Page();
		page.setPd(pd);
		List<Role> roleList = roleService.listAllRolesByPId(page);	//列出所有系统用户角色
		pd.put("USER_ID", userId);
		pd = userService.findById(pd);								//根据ID读取
		mv.setViewName("system/user/user_edit");
		mv.addObject("msg", "editU");
		mv.addObject("pd", pd);
		mv.addObject("roleList", roleList);
		return mv;
	}
	
	
	/**查看用户
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/view")
	public ModelAndView view() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		pd = userService.findByUserId(pd);						//根据ID读取
		mv.setViewName("system/user/user_view");
		mv.addObject("msg", "editU");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**去修改用户页面(在线管理页面打开)
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goEditUfromOnline")
	public ModelAndView goEditUfromOnline() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
//		pd.put("ROLE_ID", "1");
//		List<Role> roleList = roleService.listAllRolesByPId(pd);	//列出所有系统用户角色
		pd = userService.findByUsername(pd);						//根据ID读取
		mv.setViewName("system/user/user_edit");
		mv.addObject("msg", "editU");
		mv.addObject("pd", pd);
//		mv.addObject("roleList", roleList);
		return mv;
	}
	
	/**
	 * 校验密码规则  hzw
	 */
	@RequestMapping(value="/pwdCheck",produces="application/json;charset=UTF-8")
	@ResponseBody
	public Object pwdCheck() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"校验密码规则");
		PwdRuleCheck pwdRuleCheck = new PwdRuleCheck();
		//返回信息
		Map<String,String> map = new HashMap<String,String>();
		String msg = null;
		//获取页面传入值
		PageData pd = this.getPageData();
		String password = pd.getString("password");
		pd = pwdRuleConfigService.list(pd);
		msg = pwdRuleCheck.checkPassword(pd,password);
		if(msg!=null&&!"".equals(msg)){
			map.put("result", "fail");
			map.put("msg", msg);
		}else{
			map.put("result", "success");
		}
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**
	 * 修改用户  zy
	 */
	@Operate(modulName = "修改user")
	@RequestMapping(value="/editU")
	public ModelAndView editU() throws Exception{
	//	if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"修改ser");
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		if(pd.getString("PASSWORD") != null && !"".equals(pd.getString("PASSWORD"))){
			pd.put("PASSWORD", new SimpleHash("SHA-1", pd.getString("USERNAME"), pd.getString("PASSWORD")).toString());
		}
		userService.editU(pd);	//执行修改
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 批量删除
	 * @throws Exception 
	 */
	@Operate(modulName = "批量删除user")
	@RequestMapping(value="/deleteAllU")
	@ResponseBody
	public Object deleteAllU() throws Exception {
	//	if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"批量删除user");
		PageData pd = this.getPageData();
		Map<String,Object> map = new HashMap<String,Object>();
		List<PageData> pdList = new ArrayList<PageData>();
		String USER_IDS = pd.getString("USER_IDS");
		if(null != USER_IDS && !"".equals(USER_IDS)){
			String ArrayUSER_IDS[] = USER_IDS.split(",");
			userService.deleteAllU(ArrayUSER_IDS);
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	
	/**批量禁用
	 * @throws Exception
	 */
	@RequestMapping(value="/disableAllU")
	@ResponseBody
	public Object disableAllU() throws Exception {
		logBefore(logger, Jurisdiction.getUsername()+"批量禁用user");
		PageData pd = this.getPageData();
		Map<String,Object> map = new HashMap<String,Object>();
		List<PageData> pdList = new ArrayList<PageData>();
		String USER_IDS = pd.getString("USER_IDS");
		if(null != USER_IDS && !"".equals(USER_IDS)){
			String ArrayUSER_IDS[] = USER_IDS.split(",");
			userService.disableAllU(ArrayUSER_IDS);
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	
	/**导出用户信息到EXCEL
	 * @return
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel(){
		ModelAndView mv = this.getModelAndView();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		 
		Page page = new Page();
		PageData pd = this.getPageData();
		
		String ids = (String) pd.get("IDS");
		String[] userId = ids.split(",");
		
		pd.put("COMPANY", company); 
		try{
		//	if(Jurisdiction.buttonJurisdiction(menuUrl, "cha")){
				String keywords = pd.getString("keywords");				//关键词检索条件
				if(null != keywords && !"".equals(keywords)){
					pd.put("keywords", keywords.trim());
				}
				String lastLoginStart = pd.getString("lastLoginStart");	//开始时间
				String lastLoginEnd = pd.getString("lastLoginEnd");		//结束时间
				if(lastLoginStart != null && !"".equals(lastLoginStart)){
					pd.put("lastLoginStart", lastLoginStart+" 00:00:00");
				}
				if(lastLoginEnd != null && !"".equals(lastLoginEnd)){
					pd.put("lastLoginEnd", lastLoginEnd+" 00:00:00");
				} 
				Map<String,Object> dataMap = new HashMap<String,Object>();
				List<String> titles = new ArrayList<String>();
				titles.add("登录编码"); 		//1
				titles.add("姓名");			//2
//				titles.add("柜员号");			//3
//				titles.add("部门编码");			//3
//				titles.add("手机");			//4
				titles.add("邮箱");			//5
				titles.add("最近登录");		//6
				titles.add("上次登录IP");	//7
				titles.add("法人");
				dataMap.put("titles", titles);
				page.setPd(pd);
				//List<User> userList = userService.OutUsers(page);
				List<PageData> varList = new ArrayList<PageData>();
				for(int i=0;i<userId.length;i++){
					PageData pd1 = new PageData();
					pd1.put("USER_ID", userId[i]);
					PageData user1 = userService.findById(pd1);
					PageData vpd = new PageData();
					/*vpd.put("var1", userList.get(i).getUSERNAME());		//1
					vpd.put("var2", userList.get(i).getNAME());			//2
					vpd.put("var3", userList.get(i).getTELLER_NUMBER());			//3
					vpd.put("var4", userList.get(i).getPHONE());		//4
					vpd.put("var5", userList.get(i).getEMAIL());		//5
					vpd.put("var6", userList.get(i).getLAST_LOGIN());	//6
					vpd.put("var7", userList.get(i).getIP());			//7
*/					vpd.put("var1", user1.get("USERNAME"));		//1
					vpd.put("var2", user1.get("NAME"));			//2
//					vpd.put("var3", user1.get("TELLER_NUMBER"));			//3
//					vpd.put("var4", user1.get("DEPT_CODE"));
//					vpd.put("var5", user1.get("PHONE"));		//4
					vpd.put("var3", user1.get("EMAIL"));		//5
					vpd.put("var4", user1.get("LAST_LOGIN"));	//6
					vpd.put("var5", user1.get("IP"));			//7
					vpd.put("var6", user1.get("COMPANY"));
					varList.add(vpd);
				}
				dataMap.put("varList", varList);
				dataMap.put("menuname", "User");
				ObjectExcelView erv = new ObjectExcelView();					//执行excel操作
				mv = new ModelAndView(erv,dataMap);
		//	}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}

	
	/**打开上传EXCEL页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goUploadExcel")
	public ModelAndView goUploadExcel()throws Exception{
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("system/user/uploadexcel");
		return mv;
	}
	
	/**下载模版
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value="/downExcel")
	public void downExcel(HttpServletResponse response)throws Exception{
		FileDownload.fileDownload(response, PathUtil.getClasspath() + Const.FILEPATHFILE + "Users.xls", "Users.xls");
	}
	
	/**从EXCEL导入到数据库
	 * @param file
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/readExcel")
	@ResponseBody
	public Object readExcel(
			@RequestParam(value="excel",required=false) MultipartFile file
			) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String COMPANY = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		PageData pd = new PageData();
		pd.put("COMPANY", COMPANY);
		String RuserName="";
		String CuserName="";
		String msg = "error";
	//	if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;}
		if (null != file && !file.isEmpty()) {
			String filePath = PathUtil.getClasspath() + Const.FILEPATHFILE;								//文件上传路径
			String fileName =  FileUpload.fileUp(file, filePath, "userexcel");							//执行上传
			List<PageData> listPd = (List)ObjectExcelRead.readExcel(filePath, fileName, 1, 0, 0);		//执行读EXCEL操作,读出的数据导入List 2:从第3行开始；0:从第A列开始；0:第0个sheet
			/*存入数据库操作======================================*/
//			String s = listPd.get(0).getString("var1").toString();
			String initPas = pwdRuleConfigService.checkPass("");
			List<String> listUserCode = userService.findUserCode(pd);
			pd.put("LAST_LOGIN", "");
			pd.put("IP", "");
			pd.put("SKIN", "default");
			pd.put("PWD_ALTER_TIME", "");
			pd.put("STATE", "0");
			pd.put("LOCK_STATUS", "0");
			//{var5=部门编码, var6=法人, var3=邮箱, var4=柜员号, var1=性别, var2=手机, var0=登录名}
			PageData tableTitle = listPd.get(0);
			if(	tableTitle.get("var0").equals("登录名") && 
				tableTitle.get("var1").equals("姓名") && 
				tableTitle.get("var2").equals("手机") && 
				tableTitle.get("var3").equals("邮箱") && 
				tableTitle.get("var4").equals("柜员号") &&
				tableTitle.get("var5").equals("部门编码") &&
				tableTitle.get("var6").equals("法人")){
			
				for(int i=1;i<listPd.size();i++){
					if(listPd.get(i).getString("var6").toString()==COMPANY||COMPANY.equals(listPd.get(i).getString("var6").toString())||listPd.get(i).getString("var6").toString()==""||listPd.get(i).getString("var6").toString().equals("")){
						int num=0;
						for(int j=0;j<listUserCode.size();j++){
							if(listPd.get(i).getString("var0").toString()==listUserCode.get(j).toString()||listUserCode.get(j).toString().equals(listPd.get(i).getString("var0").toString())){
								num++;
								RuserName+=listPd.get(i).getString("var0").toString()+";";
							}
						}
						if(num==0&&(listPd.get(i).getString("var0").toString()!=""&&!listPd.get(i).getString("var0").toString().equals(""))){
							pd.put("USER_ID", this.get32UUID());
							pd.put("USERNAME", listPd.get(i).getString("var0"));
							pd.put("NAME", listPd.get(i).getString("var1"));
							pd.put("PHONE", listPd.get(i).getString("var2"));
							pd.put("EMAIL", listPd.get(i).getString("var3"));
							pd.put("TELLER_NUMBER", listPd.get(i).getString("var4"));
							pd.put("DEPT_CODE", listPd.get(i).getString("var5"));
							if(listPd.get(i).getString("var6").toString()==""||listPd.get(i).getString("var6").toString().equals("")){
								pd.put("COMPANY", COMPANY);
							}else{
								pd.put("COMPANY", listPd.get(i).getString("var6"));
							}
							pd.put("PASSWORD",  new SimpleHash("SHA-1", listPd.get(i).getString("var0"), initPas).toString());
							userService.saveU(pd);
						}
					}else{
						CuserName+=listPd.get(i).getString("var0").toString()+";";
					}
				}
				msg= "success";
			}else{
				RuserName+="上传模板不正确，请重新上传";
				msg = "uInfo";
				map.put("RuserName",RuserName);
				map.put("msg",msg);
				return AppUtil.returnObject(new PageData(), map);
			}
		}
		if(RuserName.length()>0){
			RuserName+="已经存在,上传失败！";
			msg = "uInfo";
			map.put("RuserName",RuserName);
		}
		if(CuserName.length()>0){
			CuserName+="等用户法人不是当前法人,上传失败！";
			RuserName+=CuserName;
			msg = "uInfo";
			map.put("RuserName",RuserName);
		}
		map.put("msg",msg);
		return AppUtil.returnObject(new PageData(), map);
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
	/**解锁重置密码
	 * @return
	 */
	@RequestMapping(value="/unLock")
	@ResponseBody
	public Object unLock(){
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "success";
		PageData pd = this.getPageData();
		try{
			pd.put("ERR_TIMES", "0");
			pd.put("LOCK_STATUS", "0");
			pd.put("PASSWORD", passwordEncoder.encode(pwdRuleConfigService.checkPass("")).toString());
			userService.updateUnLock(pd);
		} catch(Exception e){
			errInfo = "false";
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);				//返回结果
		return AppUtil.returnObject(new PageData(), map);
	}
}
