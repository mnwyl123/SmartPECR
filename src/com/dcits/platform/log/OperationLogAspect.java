package com.dcits.platform.log;

import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.dcits.platform.service.system.operation.impl.OperationService;

/**
 * 处理用户操作日志切面类
 * @author liuylt
 *
 */
@Aspect  
@Component
public class OperationLogAspect {
	
	@Autowired
	private OperationService operationService;
	    
    @Pointcut("@annotation(com.dcits.platform.log.UserOperate)")  
    public void controllerAspecta(){}
    
    @After(value = "controllerAspecta()&& @annotation(annotation) ", argNames = "annotation")
    public void interceptorApplogicA(UserOperate annotation) {
        	HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        	
        	String url = request.getRequestURI();
        	String module = annotation.moduleName();
        	String option = annotation.option();
        	Map<String, String[]> paraMap = request.getParameterMap();
        	StringBuffer paraSb = new StringBuffer();
        	Set<String> keys = paraMap.keySet();
        	for(String key:keys){
        		String name = key;
        		String[] values =  paraMap.get(key);
        		for(int i =0;i<values.length;i++){
        			String value = values[i]!=null?values[i].toString():"null";
        			paraSb.append(name+":"+value+"; ");
        		}
        	}
        	String operation=String.format("模块：%s | 操作：%s | 参数：{%s}", module,option,paraSb.toString());
        	operationService.operationLog(url, operation);
    }
}
