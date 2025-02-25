package com.dcits.platform.interceptor;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.service.system.operation.OperationManager;
import com.dcits.platform.service.system.operation.impl.OperationService;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.dynsource.DbContextHolder;
/**
 * 
* 类名称：登录过滤，权限验证
* 类描述： 
* @author pengyj pengyj
* 作者单位： 
* 联系方式：
* 创建时间：2015年11月2日
* @version 1.6
 */
public class LoginHandlerInterceptor extends HandlerInterceptorAdapter{
	private org.apache.log4j.Logger logger;
	@Resource(name="operationService")
	private OperationManager operationService;
	
	private String[] ignoreNameStr = new String[]{".js",".css",".jpg",".gif",".png",".jar",".swf"};
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		String path = request.getServletPath();
		String queryUrl = request.getQueryString();
		if(null!=queryUrl){
			path += "?"+queryUrl ;
		}
		User user = (User)Jurisdiction.getSession().getAttribute(Const.SESSION_USER);
		
		if(null != user ){
			
			 /**pengyj 多法人支持
			 * 根据用户所属法人机构设置动态数据源 20180817 
			 */
			DbContextHolder.setDbType(user.getCOMPANY() == null?"":user.getCOMPANY());
			//END
			
			if(null!=path && path.length()>0 && isFilter(path)){
				path = path.substring(1, path.length());
				//记录操作日志
				if(!path.equals("cache/getCache.do")){
					PageData pd = new PageData();
					BaseController bc = new BaseController();
					//LOG_ID
					pd.put("LOG_ID", bc.get32UUID());
					//USER_ID
					pd.put("USER_ID", user.getUSER_ID());
					//USERNAME
					pd.put("USERNAME", user.getUSERNAME());
					//NAME
					pd.put("NAME", user.getNAME());
					//ORG
					if(null!=user.getOrg()){
						pd.put("ORG", user.getOrg().getName());
					}
					//IP
					pd.put("IP", user.getIP());
					//MAC
					OperationService OS = new OperationService();
					pd.put("MAC", OS.getMac());
					//OPERATION_URL
					pd.put("OPERATION_URL", path);
					//OPERATION_TIME
					pd.put("OPERATION_TIME", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
					//OPERATION_DESC 根据URL和菜单表匹配
					if(null!=operationService.getmenuname(pd)){
						pd.put("OPERATION_DESC", operationService.getmenuname(pd));
					}
					
					try {
						operationService.addLog(pd);
					} catch (Exception e) {
						//e.printStackTrace();
						logger.error(e);
					}
				}
				
			}
		}
		
		return true;
	}

	/**
	 * 判断是否过滤
	 * <p> true-过滤; false-不过滤 </p>
	 * @param name
	 * @return
	 */
	private boolean isFilter(String name) {
		boolean flag = true;
		String lowerName = name.toLowerCase();
		
		int length = ignoreNameStr.length;
		for(int i=0; i<length; i++){
			String ignoreName = ignoreNameStr[i];
			if(lowerName.endsWith(ignoreName)){
				flag = false;
				break;
			}
		}
		return flag;
	}
	
	private void get32UUID() {
		// TODO Auto-generated method stub
		
	}
	
}
