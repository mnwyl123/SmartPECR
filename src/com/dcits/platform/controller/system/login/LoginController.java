package com.dcits.platform.controller.system.login;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dcits.platform.util.dynsource.DbContextHolder;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.system.Menu;
import com.dcits.platform.entity.system.Org;
import com.dcits.platform.entity.system.Role;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.service.system.appuser.AppuserManager;
import com.dcits.platform.service.system.buttonrights.ButtonrightsManager;
import com.dcits.platform.service.system.company.CompanyManager;
import com.dcits.platform.service.system.fhbutton.FhbuttonManager;
import com.dcits.platform.service.system.menu.MenuManager;
import com.dcits.platform.service.system.operation.OperationManager;
import com.dcits.platform.service.system.org.OrgManager;
import com.dcits.platform.service.system.pwdRuleConfig.pwdRuleConfigManager;
import com.dcits.platform.service.system.role.RoleManager;
import com.dcits.platform.service.system.user.UserManager;
import com.dcits.platform.util.AppUtil;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.DateUtil;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.PasswordEncoder;
import com.dcits.platform.util.PwdRuleCheck;
import com.dcits.platform.util.RightsHelper;
import com.dcits.platform.util.Tools;
import com.dcits.platform.util.tree.TreeEntity;
/**
 * 总入口
 * @author pengyj 
 * 修改日期：2015/11/2
 */
@Controller
public class LoginController extends BaseController {

	@Resource(name="userService")
	private UserManager userService;
	@Resource(name="menuService")
	private MenuManager menuService;
	@Resource(name="roleService")
	private RoleManager roleService;
	@Resource(name="companyService")
	private CompanyManager companyService;
	@Resource(name="fhbuttonService")
	private FhbuttonManager fhbuttonService;
	@Resource(name="appuserService")
	private AppuserManager appuserService;
	@Resource(name="orgService")
	private OrgManager orgService;
	@Resource(name="operationService")
	private OperationManager operationService;
	@Resource(name="pwdRuleConfigService")
	private pwdRuleConfigManager pwdRuleConfigService;
	PasswordEncoder passwordEncoder = new PasswordEncoder();
	
	/**访问登录页
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/login_toLogin")
	public ModelAndView toLogin()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		pd.put("SYSNAME", Tools.readTxtFile(Const.SYSNAME)); //读取系统名称
		mv.setViewName("system/index/login");
		mv.addObject("pd",pd);
		return mv;
	}
	/**
	 * 修改初始密碼 hzw
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/login_Pwdchange", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object login_goPwdchange() throws Exception {
		logBefore(logger, "修改初始密碼");
		PwdRuleCheck pwdRuleCheck = new PwdRuleCheck();
		// 创建返回集合
		Map<String, String> map = new HashMap<String, String>();
		// 获取页面数据
		PageData pd = this.getPageData();
		// 校验密码规则
		String msg = null;
		String password = pd.getString("InitPwd");
		PageData pwdRule = pwdRuleConfigService.list(pd);
		if(password==pwdRule.get("INITIAL_PASSWORD").toString()||password.equals(pwdRule.get("INITIAL_PASSWORD").toString())){
			map.put("result", "false");
			map.put("msg", "密码不能与初始密码相同");
		}else{
			msg = pwdRuleCheck.checkPassword(pwdRule, password);
			if (msg != null && !"".equals(msg)) {
				map.put("result", "fail");
				map.put("msg", msg);
			} else {
				// 获取用户信息
//				Session session = Jurisdiction.getSession();
//				User user = (User) session.getAttribute(Const.SESSION_USER);
//				String name = user.getNAME();
//				pd.put("UESER_NAME", user.getNAME());
//				pd.put("USER_ID", user.getUSER_ID());
				// 密码加密
				if (password != null && !"".equals(password)) {
					pd.put("PASSWORD", passwordEncoder.encode(password).toString());
					pd.put("PWD_ALTER_TIME", DateUtil.formatDate("yyyyMMdd", new Date()));
				}
				// 更新用户密码
				userService.ChangeInitPwd(pd);
//				clearSession(session,user.getUSER_ID());
				map.put("result", "success");
			}
		}
		return AppUtil.returnObject(new PageData(), map);
	}
	/**请求登录，验证用户
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/login_login" ,produces="application/json;charset=UTF-8")
	@ResponseBody
	public Object login()throws Exception{
		Map<String,String> map = new HashMap<String,String>();
		Session session = Jurisdiction.getSession();
		PageData pd = this.getPageData();
		String USERID="";
		String USERName="";
		String errInfo = "";
		StringBuffer operResult = new StringBuffer();
		operResult.append("登录失败");
		User curUser = null;
		//获得配置文件配置信息
		String isValiteIP = BaseController.getPropertiesValue("isValiteIP");
		if("true".equals(isValiteIP)||"true"==isValiteIP){
			//获取当前登录用户
			curUser = (User) session.getAttribute(Const.SESSION_USER);
		}
		String KEYDATA[] = pd.getString("KEYDATA").split(",dcits,");
		if(curUser ==null){
			if(null != KEYDATA){
				if(KEYDATA.length ==3 || KEYDATA.length == 4){
					String USERNAME = KEYDATA[0];	//登录过来的用户名
					String COMPANY = KEYDATA[1];    //登录过来的法人
					String PASSWORD  = KEYDATA[2];	//登录过来的密码
					
					String sessionCode = (String)session.getAttribute(Const.SESSION_SECURITY_CODE);		//获取session中的验证码
					String code="";
					String ERR_TIMES="";
					pd.put("USERNAME", USERNAME);
					
					if(USERNAME.equals("super")){
						COMPANY = USERNAME;
					}
					//String passwd = new SimpleHash("SHA-1", USERNAME, PASSWORD).toString();	
					String passwd = passwordEncoder.encode(PASSWORD);    //密码加密
					pd.put("PASSWORD", passwd);
					if(COMPANY=="null"||COMPANY.equals("null")){
						//根据用户名和密码查询法人
						try {
							List<String> com= userService.findCompCode(pd);
							if(com.size()>0){
								COMPANY = com.get(0).toString();
							}
						} catch (Exception e) {
							//e.printStackTrace();
							logger.error(e);
						}
					}
					if(COMPANY=="null"||COMPANY.equals("null")){
						operResult.append(",缺少法人信息");
						errInfo = "comInfo";	
					}else{
						pd.put("COMPANY", COMPANY);
						
						//查询用户是否锁定
						String LockStatus = userService.checkLock(pd);
						if(!LockStatus.equals("0")&&LockStatus!="0"){
							errInfo = "lock";
							operResult.append(",用户被锁定");
						}else{
							//首先根据用户名和法人查询错误次数，检验该用户是否能够登陆
							ERR_TIMES = userService.checkErrTime(pd);
							if(ERR_TIMES==null){
								ERR_TIMES="0";
							}
							if(Integer.parseInt(ERR_TIMES)>=2){
								errInfo = "ShowCode";
							}
							if(Integer.parseInt(ERR_TIMES)>Integer.parseInt(pwdRuleConfigService.checkMaxTime(""))){
								pd.put("STATUS", "1");
								userService.LockUser(pd);   //锁定用户
								errInfo = "OutTimes"; 				//判断用户输入错误次数是否超过上限
								logBefore(logger, USERNAME+"密码错误次数超过上限");
							}else{
								if(Integer.parseInt(ERR_TIMES)>=3){
									if(KEYDATA.length == 4){
										code = KEYDATA[3];
										if(!sessionCode.equalsIgnoreCase(code)){
											operResult.append(",验证码输入有误");
											errInfo = "codeerror";				 	//验证码输入有误
										}
									}
				            	}
								
								User user = userService.getUserByNameAndPwd(pd);	//根据用户名和密码去读取用户信息
								if(user!=null){
									String userid= user.getUSER_ID();
									pd.put("USER_ID", userid);
								}								
								if(user != null){
									//List<PageData> user1 = userService.getOrgUseUserId(pd);
									USERID = user.getUSER_ID().toString();
									USERName = user.getUSERNAME();
									if(user.getDEPT_CODE()!=null){
									//String deptcode = user.getDEPT_CODE().toString();
									/*if(!deptcode.equals("")&&!deptcode.equals("212")){
										
										if(user1.size() == 0){
											operResult.append(",用户未授权机构");
											errInfo = "needorg";
										}
									}*/
									}
									if(!"needorg".equals(errInfo)&&!"codeerror".equals(errInfo)&&!"OutTimes".equals(errInfo)){
										 //验证用户是否需要修改密码,密码为初始密码则需要修改-----------------
								        String initPass = pwdRuleConfigService.checkPass("");
								        if(initPass.equals(PASSWORD)){
								        	errInfo = "InitPwd";
								    		map.put("USERID", USERID);
								    		map.put("USERName", USERName);
								        }else{
								        
								        	//校验密码是否过期
								        	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
								        	String EffectDays = pwdRuleConfigService.getEffectDays();
								        	Calendar cal = Calendar.getInstance();
								        	String alterTime = user.getPWD_ALTER_TIME();
								        	
								        	/* 源代码（撤回直接用源代码替换修改的代码）
								        	cal.setTime(sdf.parse(alterTime));
									        cal.add(Calendar.DAY_OF_MONTH, Integer.valueOf(EffectDays));
								        	if(new Date().after(cal.getTime())){
								        		errInfo = "ValidityPwd";
								        		map.put("USERID", USERID);
									    		map.put("USERName", USERName);
								        	}else{
								        		pd.put("LAST_LOGIN",DateUtil.getTime().toString());
												pd.put("NAME", USERID);
												pd.put("USER_ID", user.getUSER_ID().toString());
												userService.updateLastLogin(pd);
												session.setAttribute(USERID+Const.SESSION_COMPANY, COMPANY);	
												session.setAttribute(Const.SESSION_USER, user);			//把用户信息放session中
												session.removeAttribute(Const.SESSION_SECURITY_CODE);	//清除登录验证码的session
												//讲用户角色加入session
							                	List<String> roleIds = menuService.getRoleIdsByUserName(user.getUSERNAME(), user.getCOMPANY());
							                	session.setAttribute(USERID+Const.SESSION_ROLE_RIGHTS, roleIds);
							                	pd.put("COMPANY", user.getCOMPANY());
										        //查询机构信息，通过USER_ID查到ORG_ID,再由ORG_ID和COMPANY查询机构名称
										        List<Org> OrgList = orgService.getOrgByUserId(pd);	//根据用户名和密码去读取用户信息
										        if(OrgList.size() >0){
										        	pd.put("ORG", OrgList.get(0).getName());
										        	session.setAttribute(USERID+Const.SESSION_ORG, OrgList.get(0));
										        	session.setAttribute(USERID+Const.SESSION_ORGS, OrgList);
										        	user.setOrg(OrgList.get(0));
										        }
										      //shiro加入身份验证
												Subject subject = SecurityUtils.getSubject(); 
											    UsernamePasswordToken token = new UsernamePasswordToken(USERNAME, PASSWORD); 
											    try{
											    	subject.login(token);				    	
											    }catch(AuthenticationException e) { 
											    	operResult.append(",身份验证失败！");
											    	errInfo = "身份验证失败！";
												 }
											    *//**pengyj 多法人支持
												 * 根据用户所属法人机构设置动态数据源 20180817 
												 *//*
												DbContextHolder.setDbType(user.getCOMPANY() == null?"":user.getCOMPANY());
												session.setAttribute("datasrc", user.getCOMPANY() == null?"":user.getCOMPANY());
								        	}*/
								        	
								        	//修改开始
								        	//如果过期时间为null则不判断过期
								        	if(alterTime != null){
								        		cal.setTime(sdf.parse(alterTime));
									        	cal.add(Calendar.DAY_OF_MONTH, Integer.valueOf(EffectDays));
									        	if(new Date().after(cal.getTime())){
									        		errInfo = "ValidityPwd";
									        		map.put("USERID", USERID);
										    		map.put("USERName", USERName);
										    		pd.put("NAME", USERID);
										    		pd.put("USER_ID", user.getUSER_ID().toString());
									        	}else{
									        		pd.put("LAST_LOGIN",DateUtil.getTime().toString());
													pd.put("NAME", USERID);
													pd.put("USER_ID", user.getUSER_ID().toString());
													userService.updateLastLogin(pd);
													session.setAttribute(USERID+Const.SESSION_COMPANY, COMPANY);	
													session.setAttribute(Const.SESSION_USER, user);			//把用户信息放session中
													session.removeAttribute(Const.SESSION_SECURITY_CODE);	//清除登录验证码的session
													//讲用户角色加入session
								                	List<String> roleIds = menuService.getRoleIdsByUserName(user.getUSERNAME(), user.getCOMPANY());
								                	session.setAttribute(USERID+Const.SESSION_ROLE_RIGHTS, roleIds);
								                	pd.put("COMPANY", user.getCOMPANY());
											        //查询机构信息，通过USER_ID查到ORG_ID,再由ORG_ID和COMPANY查询机构名称
											        List<Org> OrgList = orgService.getOrgByUserId(pd);	//根据用户名和密码去读取用户信息
											        if(OrgList.size() >0){
											        	pd.put("ORG", OrgList.get(0).getName());
											        	session.setAttribute(USERID+Const.SESSION_ORG, OrgList.get(0));
											        	session.setAttribute(USERID+Const.SESSION_ORGS, OrgList);
											        	user.setOrg(OrgList.get(0));
											        }
											      //shiro加入身份验证
													Subject subject = SecurityUtils.getSubject(); 
												    UsernamePasswordToken token = new UsernamePasswordToken(USERNAME, PASSWORD); 
												    try{
												    	subject.login(token);				    	
												    }catch(AuthenticationException e) { 
												    	operResult.append(",身份验证失败！");
												    	errInfo = "身份验证失败！";
													 }
												    /**pengyj 多法人支持
													 * 根据用户所属法人机构设置动态数据源 20180817 
													 */
													DbContextHolder.setDbType(user.getCOMPANY() == null?"":user.getCOMPANY());
													session.setAttribute("datasrc", user.getCOMPANY() == null?"":user.getCOMPANY());
									        	}
								        	}else{
								        		pd.put("LAST_LOGIN",DateUtil.getTime().toString());
												pd.put("NAME", USERID);
												pd.put("USER_ID", user.getUSER_ID().toString());
												userService.updateLastLogin(pd);
												session.setAttribute(USERID+Const.SESSION_COMPANY, COMPANY);	
												session.setAttribute(Const.SESSION_USER, user);			//把用户信息放session中
												session.removeAttribute(Const.SESSION_SECURITY_CODE);	//清除登录验证码的session
												//讲用户角色加入session
							                	List<String> roleIds = menuService.getRoleIdsByUserName(user.getUSERNAME(), user.getCOMPANY());
							                	session.setAttribute(USERID+Const.SESSION_ROLE_RIGHTS, roleIds);
							                	pd.put("COMPANY", user.getCOMPANY());
										        //查询机构信息，通过USER_ID查到ORG_ID,再由ORG_ID和COMPANY查询机构名称
										        List<Org> OrgList = orgService.getOrgByUserId(pd);	//根据用户名和密码去读取用户信息
										        if(OrgList.size() >0){
										        	pd.put("ORG", OrgList.get(0).getName());
										        	session.setAttribute(USERID+Const.SESSION_ORG, OrgList.get(0));
										        	session.setAttribute(USERID+Const.SESSION_ORGS, OrgList);
										        	user.setOrg(OrgList.get(0));
										        }
										      //shiro加入身份验证
												Subject subject = SecurityUtils.getSubject(); 
											    UsernamePasswordToken token = new UsernamePasswordToken(USERNAME, PASSWORD); 
											    try{
											    	subject.login(token);				    	
											    }catch(AuthenticationException e) { 
											    	operResult.append(",身份验证失败！");
											    	errInfo = "身份验证失败！";
												 }
											    /**pengyj 多法人支持
												 * 根据用户所属法人机构设置动态数据源 20180817 
												 */
												DbContextHolder.setDbType(user.getCOMPANY() == null?"":user.getCOMPANY());
												session.setAttribute("datasrc", user.getCOMPANY() == null?"":user.getCOMPANY());
								        	}
								        	//修改结束点
								        	
								        }
								        if(!"InitPwd".equals(errInfo)&&!"ValidityPwd".equals(errInfo)){
								        	operResult.delete(0, operResult.length());
								        	operResult.append("登录成功");
											errInfo = "success";					//验证成功
											logBefore(logger, USERNAME+"登录系统");
								        }
									}
								}else if (!"needorg".equals(errInfo)){
									//更改密码输入错误次数,通过用户名和法人去验证-------------
									ERR_TIMES = Integer.toString((Integer.parseInt(ERR_TIMES)+1));
									if(KEYDATA.length ==3 && Integer.parseInt(ERR_TIMES)<3){
										operResult.append(",登录密码错误");
										errInfo = "paserror";	
									}else{
										operResult.append(",登录密码错误");
										errInfo = "Spaserror";
									}
									pd.put("ERR_TIMES", ERR_TIMES);
									this.checkUserValidity(pd);	
									//用户名或密码有误
									logBefore(logger, USERNAME+"登录信息错误");
								}
							}
						}
					}	
				}else{
					operResult.append(",缺少参数");
					errInfo = "error";	//缺少参数
				}
			}else{
				operResult.append(",缺少参数");
				errInfo = "error";	//缺少参数
			}
		}else{
			operResult.append(",本机已有用户登录");
			errInfo = "hasU";	//缺少参数
		}
		if(pd.get("USERNAME")!=null){
			HttpServletRequest request = this.getRequest();
			String ip = "";
			if (request.getHeader("x-forwarded-for") == null) {  
				ip = request.getRemoteAddr();  
		    }else{
		    	ip = request.getHeader("x-forwarded-for");  
		    }
			pd.put("IP", ip);
			pd.put("OPERATION_TIME",  new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
			pd.put("OPERATION_DESC", operResult.toString());
			pd.put("MAC", operationService.getMac());
			//pd.put("LOG_ID", new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()));
			pd.put("LOG_ID", this.get32UUID());
			if(USERID!=""&&!USERID.equals("")){
				session.setAttribute(USERID+Const.SESSION_LoginInfo, pd);
			}
			operationService.addLog(pd);
		}
		map.put("result", errInfo);
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**访问系统首页
	 * @param changeMenu：切换菜单参数
	 * @return
	 */
	@RequestMapping(value="/main/{changeMenu}")
	@SuppressWarnings("unchecked")
	public ModelAndView login_index(@PathVariable("changeMenu") String changeMenu,HttpServletResponse response){
		response.addHeader("X-Content-Type-Option", "nosniff");
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		try{
			Session session = Jurisdiction.getSession();
			User user = (User)session.getAttribute(Const.SESSION_USER);				//读取session中的用户信息(单独用户信息)
			if (user != null) {
				String USERNAME = user.getUSERNAME();
				String USERID = user.getUSER_ID();
				session.setAttribute(USERID+Const.SESSION_USERNAME, USERNAME);				//放入用户名到session
				List<TreeEntity> menuList = menuService.getMenuByUserName(USERNAME, user.getCOMPANY());
				session.setAttribute(USERID+Const.SESSION_menuList, menuList);
				this.getRemortIP(USERID);	//更新登录IP
				mv.setViewName("system/index/main");
				mv.addObject("user", user);
				mv.addObject("menuList", menuList);
				String name = user.getNAME();
				if(user.getOrg()!=null){
					pd.put("org", user.getOrg().getName());
					pd.put("orgcode", user.getOrg().getOrgCode());
				}
				pd.put("company", user.getCOMPANY());
				pd.put("name", name);
			}else {
				mv.setViewName("system/index/login");//session失效后跳转登录页面
			}
		} catch(Exception e){
			mv.setViewName("system/index/login");
			logger.error(e.getMessage(), e);
		}
		pd.put("SYSNAME", Tools.readTxtFile(Const.SYSNAME)); //读取系统名称
		mv.addObject("pd",pd);
		return mv;
	}
	
//	/**根据角色权限获取本权限的菜单列表(递归处理)
//	 * @param menuList：传入的总菜单
//	 * @param roleRights：加密的权限字符串
//	 * @return
//	 */
//	public List<Menu> readMenu(List<Menu> menuList,String roleRights){
//		int i=0;
//		for(;i<menuList.size();i++){
//			menuList.get(i).setHasMenu(RightsHelper.testRights(roleRights, menuList.get(i).getMENU_ID()));
//			if(menuList.get(i).isHasMenu()){		//判断是否有此菜单权限
//				this.readMenu(menuList.get(i).getSubMenu(), roleRights);//是：继续排查其子菜单
//			}else{
//				menuList.remove(i);
//				i--;
//			}
//		}
//		return menuList;
//	}
	
	/**
	 * 进入tab标签
	 * @return
	 */
	@RequestMapping(value="/tab")
	public String tab(){
		return "system/index/tab";
	}
	
	/**
	 * 进入首页后的默认页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/login_default")
	public ModelAndView defaultPage() throws Exception{
		ModelAndView mv = this.getModelAndView();
		Session session = Jurisdiction.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		String name = user.getNAME();
		PageData pd = new PageData();
		pd.put("userCount", Integer.parseInt(userService.getUserCount("").get("USERCOUNT").toString()));
		pd.put("name", name);
		//系统用户数
		//pd.put("appUserCount", Integer.parseInt(appuserService.getAppUserCount("").get("appUserCount").toString()));	//会员数
		mv.addObject("pd",pd);
		mv.setViewName("system/index/default");
		return mv;
	}
	
	/**
	 * 用户注销
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/logout")
	public ModelAndView logout(){
		String USERNAME = Jurisdiction.getUsername();	//当前登录的用户名
		logBefore(logger, USERNAME+"退出系统");
		ModelAndView mv = this.getModelAndView();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		PageData pd = (PageData) session.getAttribute(USERID+Const.SESSION_LoginInfo);

		//清除用户密码错误次数
		try {
			 pd.put("USER_ID", user.getUSER_ID());
			userService.clearErrTime(pd);
		} catch (Exception e) {
			//e.printStackTrace();
			logger.error(e);
		}
		pd = this.getPageData();
		//用户正常退出
		if(pd.get("msg")==null||pd.get("msg").equals(null)){
			try {
				operationService.operationLog("", "退出系统");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				//e.printStackTrace();
				logger.error(e);
			}
			//清除session
			clearSession(session,USERID);
		}else{
			//强制已登录(同名)用户退出
			if(pd.get("msg").toString()!="1"&&!pd.get("msg").toString().equals("1")){
				try {
					operationService.operationLog("", "强制退出系统");
				} catch (Exception e) {
					// TODO Auto-generated catch block
					//e.printStackTrace();
					logger.error(e);
				}
				USERID = pd.get("USER_ID").toString();
				//清除session
				clearSession(session,USERID);
			}else{
				try {
					operationService.operationLog("", "已有用户在本机登录,退出系统");
				} catch (Exception e) {
					// TODO Auto-generated catch block
					logger.error(e);
				}
			}
		}		
		pd.put("msg", pd.getString("msg"));
		pd.put("SYSNAME", Tools.readTxtFile(Const.SYSNAME)); //读取系统名称
		mv.setViewName("system/index/login");
		mv.addObject("pd",pd);
		return mv;
	}
	
	/**获取用户权限
	 * @param session
	 * @return
	 */
	public Map<String, String> getUQX(String USERNAME){
		//PageData pd = new PageData();
		Map<String, String> map = new HashMap<String, String>();
//		try {
//			pd.put(Const.SESSION_USERNAME, USERNAME);
//			pd.put("ROLE_ID", userService.findByUsername(pd).get("ROLE_ID").toString());//获取角色ID
//			pd = roleService.findObjectById(pd);										//获取角色信息														
//			map.put("adds", pd.getString("ADD_QX"));	//增
//			map.put("dels", pd.getString("DEL_QX"));	//删
//			map.put("edits", pd.getString("EDIT_QX"));	//改
//			map.put("chas", pd.getString("CHA_QX"));	//查
//			List<PageData> buttonQXnamelist = new ArrayList<PageData>();
//			if("admin".equals(USERNAME)){
//				buttonQXnamelist = fhbuttonService.listAll(pd);					//admin用户拥有所有按钮权限
//			}else{
//				buttonQXnamelist = buttonrightsService.listAllBrAndQxname(pd);	//此角色拥有的按钮权限标识列表
//			}
//			for(int i=0;i<buttonQXnamelist.size();i++){
//				map.put(buttonQXnamelist.get(i).getString("QX_NAME"),"1");		//按钮权限
//			}
//		} catch (Exception e) {
//			logger.error(e.toString(), e);
//		}	
		return map;
	}
	
	/** 更新登录用户的IP
	 * @param USERNAME
	 * @throws Exception
	 */
	public void getRemortIP(String USER_ID) throws Exception {  
		PageData pd = new PageData();
		HttpServletRequest request = this.getRequest();
		String ip = "";
		if (request.getHeader("x-forwarded-for") == null) {  
			ip = request.getRemoteAddr();  
	    }else{
	    	ip = request.getHeader("x-forwarded-for");  
	    }
		pd.put("USER_ID", USER_ID);
		pd.put("IP", ip);
		userService.saveIP(pd);
	}  
	
	/**查询法人
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/login_findC", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, ? extends Object> findC(HttpServletRequest request,
			HttpServletResponse response) {
		Map<String, Object> modelMap = new HashMap<String, Object>();
		//获取用户名
		PageData pd = this.getPageData();	
		if(!pd.getString("USERNAME").equals("super")){
			//根据用户名查询法人(多法人)
			List<PageData> userList=new ArrayList<PageData>();
			try {
				userList = userService.findCompCodeByUsername(pd);
			} catch (Exception e) {
				logger.error(e);
			}
			List<String> codeList = new ArrayList<String>();
			if(userList.size()>0){
				for(int i=0;i<userList.size();i++){
					codeList.add(userList.get(i).getString("COMPANY"));
				}
				try {
					List<PageData> companyList = companyService.findByCompCodeList(codeList);
					Map<String,String> map = new HashMap<String,String>();
					for(int i=0;i<companyList.size();i++){
						map.put(companyList.get(i).getString("COMP_CODE"), companyList.get(i).getString("COMP_NAME"));
					}
					modelMap.put("result", map);
				} catch (Exception e) {
					logger.error(e);
				}
			}
		}
		return modelMap;
	}
	public void checkUserValidity(PageData pd){
		//错误次数加1
		try {
			userService.addErrorTime(pd);
		} catch (Exception e) {
			logger.error(e);
		}
	}
	
	//清除session
	private void clearSession(Session session,String USERID){
		session.removeAttribute(USERID+Const.SESSION_LoginInfo);
		session.removeAttribute(Const.SESSION_USER);
		session.removeAttribute(USERID+Const.SESSION_ORG);
    	session.removeAttribute(USERID+Const.SESSION_ORGS);
		session.removeAttribute(USERID+Const.SESSION_ROLE_RIGHTS);
		session.removeAttribute(USERID+Const.SESSION_menuList);
		session.removeAttribute(USERID+Const.SESSION_QX);
		session.removeAttribute(USERID+Const.SESSION_userpds);
		session.removeAttribute(USERID+Const.SESSION_USERNAME);
		session.removeAttribute(USERID+Const.SESSION_USERROL);
		session.removeAttribute("changeMenu");
		//shiro销毁登录
		Subject subject = SecurityUtils.getSubject(); 
		subject.logout();
	}
	
	
	

	/**
	 * 重置密碼 gaoshenga
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/login_setUpPwd",produces="application/json;charset=UTF-8")
	@ResponseBody
	public Object login_setUpPwd() throws Exception {
		logBefore(logger, "重置密碼");
		// 创建返回集合
		Map<String, String> map = new HashMap<String, String>();
		//ModelAndView mv = this.getModelAndView();
		String errInfo = "success";
		String userid  = "";
		// 获取页面数据
		PageData pd = this.getPageData();
		String KEYDATA[] = pd.getString("KEYDATA").split(",dcits,");
		logger.debug("KEYDATA=================="+pd.getString("KEYDATA").toString());
		if(null!=KEYDATA){
		
			if(KEYDATA.length ==2 || KEYDATA.length == 3){
				String USERNAME = KEYDATA[0];	//登录过来的用户名
				String PHONE = KEYDATA[1];    //登录过来的电话号码
				try{
					pd.put("USERNAME", USERNAME);
					pd.put("PHONE", PHONE);
					User userInfo = userService.getUserByNameAndID(pd);
					if(userInfo != null){
						//查到用户返回用户id
						 userid= userInfo.getUSER_ID();
//						pd.put("USER_ID", userid);		
						System.out.println(userid);
					}else{
						
						errInfo = "false";
					}
				} catch(Exception e){
					errInfo = "false";
					logger.error(e.toString(), e);
				}
			}
		}
	
		map.put("result", errInfo);
		map.put("pd", userid);
//		map.put("pd", userid);
		return AppUtil.returnObject(new PageData(), map);
	}

	
	/**
	 * 重置用户密码
	 */
	@RequestMapping(value="/login_unLockPwd")
	@ResponseBody
	public Object unLockPwd(){
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
