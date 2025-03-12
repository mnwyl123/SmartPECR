package com.dcits.platform.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.system.Org;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.service.system.company.CompanyManager;
import com.dcits.platform.service.system.menu.MenuManager;
import com.dcits.platform.service.system.org.impl.OrgService;
import com.dcits.platform.service.system.role.RoleManager;
import com.dcits.platform.service.system.user.UserManager;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.tree.TreeEntity;

/**
 * 接入sso时，需要调用的入口
 * @author 穆楠
 *
 */
@Controller
public class UaAuthServlet extends BaseController {
	@Resource(name="userService")
	private UserManager userService;
	@Resource(name="menuService")
	private MenuManager menuService;
	@Resource(name="roleService")
	private RoleManager roleService;
	@Resource(name="companyService")
	private CompanyManager companyService;
	@Resource(name="orgService")
	private OrgService orgService;
	
	@RequestMapping(value = "/authEntry", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/json;charset=utf-8");
		String json="{\"result\":\"success\"}";
		try {
			String USERID = "";
			String USERNAME = "";
			String COMPANY = "" ;
			String PASSWORD = "" ;
			//得到传过来的用户编码
			USERNAME = request.getParameter("USERNAME");
			//登录过来的法人
			COMPANY = request.getParameter("COMPANY");
			// shiro加入身份验证
			Subject subject = SecurityUtils.getSubject();
			UsernamePasswordToken token = new UsernamePasswordToken(USERNAME, "1q_2w_3e_4r_");
			subject.login(token);
			Session session = subject.getSession();
			PageData pd = new PageData();
			pd.put("USERNAME", USERNAME);
			//查找密码
			List<Map<String, Object>> pd1 = userService.getUserPwd(pd);
			//清除登录验证码的session
			session.removeAttribute(Const.SESSION_SECURITY_CODE);	
			PASSWORD = (String) pd1.get(0).get("PASSWORD");
			pd.put("PASSWORD", PASSWORD);
			pd.put("COMPANY", COMPANY);
			User user = userService.getUserByNameAndPwd(pd); // 根据用户名和密码去读取用户信息
			if (user != null) {
				USERID = user.getUSER_ID().toString();
				USERNAME = user.getUSERNAME();
				session.setAttribute(USERID + Const.SESSION_COMPANY, COMPANY);
				session.setAttribute(USERID+Const.SESSION_USERNAME, USERNAME);  
				// 把用户信息放session中
				session.setAttribute(Const.SESSION_USER, user); 
				List<TreeEntity> menuList = menuService.getMenuByUserName(USERNAME, user.getCOMPANY());
				session.setAttribute(USERNAME + Const.SESSION_allmenuList,menuList);
				session.removeAttribute(Const.SESSION_SECURITY_CODE); // 清除登录验证码的session
				// 把用户角色加入session
				List<String> roleIds = menuService.getRoleIdsByUserName(user.getUSERNAME(),user.getCOMPANY());
				session.setAttribute(USERID + Const.SESSION_ROLE_RIGHTS, roleIds);
				pd.put("COMPANY", user.getCOMPANY());
				// 查询机构信息，通过USER_ID查到ORG_ID,再由ORG_ID和COMPANY查询机构名称
				List<Org> OrgList = orgService.getOrgByUserId(pd); // 根据用户名和密码去读取用户信息
				if (OrgList.size() > 0) {
					pd.put("ORG", OrgList.get(0).getName());
					session.setAttribute(USERID + Const.SESSION_ORG, OrgList.get(0));
					session.setAttribute(USERID + Const.SESSION_ORGS, OrgList);
					user.setOrg(OrgList.get(0));
				}
			}else
				json="{\"result\":\"user is not register\"}";
		} catch (Exception e) {
			e.printStackTrace();
			json="{\"result\":\"failt\"}";
		}			
		 
		 String jsonp="jsonpCallback("+json+")";
		 PrintWriter pw=response.getWriter();
		 System.out.println(jsonp);
		 pw.print(jsonp);
	}
}
