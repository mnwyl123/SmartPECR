package com.dcits.supervise.pecr.log;


import org.apache.log4j.Logger;
import org.apache.shiro.session.Session;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.aspectj.lang.reflect.MethodSignature;

import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.dcits.platform.entity.system.User;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.UuidUtil;
import com.dcits.supervise.pecr.log.service.CurdOperationMapper;
import com.google.gson.Gson;


/**
 * 增删改查操作日志切面类
 * 
 * @author CCAB
 *
 */
@Aspect
@Component
public class CurdOperationLogAspect {
	private final static Logger logger = Logger.getLogger(CurdOperationLogAspect.class);
	
	@Autowired
	private CurdOperationMapper curdOperationService;

	@Pointcut("@annotation(com.dcits.supervise.pecr.log.Operate)")
	public void logPoinCut() {
	}

	@AfterReturning(value = "logPoinCut()",returning = "returnValue")
	public void saveSysLog(JoinPoint joinPoint,Object returnValue) {
		try {
			// 保存日志
			//HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
			//		.getRequest();
			Session session = Jurisdiction.getSession();
			User user = (User) session.getAttribute(Const.SESSION_USER);
			String USERID = user.getUSER_ID();
			PageData oper = (PageData) session.getAttribute(USERID + Const.SESSION_LoginInfo);
			oper.put("CREATE_TIME", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
			oper.put("LOG_ID", UuidUtil.get32UUID());
			// 从切面织入点处通过反射机制获取织入点处的方法
			MethodSignature signature = (MethodSignature) joinPoint.getSignature();
			// 获取切入点所在的方法
			Method method = signature.getMethod();
			// 获取操作
			Operate operate = method.getAnnotation(Operate.class);
	
			if (operate != null) {
				String name = operate.modulName();
				oper.put("DESCRIPTION", name);// 保存获取的操作
			}
			// 获取操作结果（成功/失败）
			oper.put("RESULT", returnValue);
			//Object result = joinPoint.proceed();
			//Gson gson = new Gson();
			//if (request != null) {
				//oper.put("RESULT", gson.toJson(result));
			//}
			// 获取请求的类名
			String className = joinPoint.getTarget().getClass().getName();
			// 获取请求的方法名
			String methodName = method.getName();
			oper.put("ACTION", className + "." + methodName);
			// 获取用户名
			oper.put("OPERATION_NAME", user.getNAME());
			// 获取用户机构
			oper.put("SYS_ORG_NAME", user.getOrg());
			// 获取法人
			oper.put("LEGAL_PERSON_NAME", user.getCOMPANY());
	
			System.out.println("记录日志到数据库...");
			curdOperationService.addLog(oper);
			
		} catch (Throwable e) {
			e.printStackTrace();
		}
	}
	
}
