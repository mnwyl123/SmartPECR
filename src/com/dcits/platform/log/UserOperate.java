package com.dcits.platform.log;

import java.lang.annotation.Retention;
import java.lang.annotation.Target;
import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.RetentionPolicy; 
 
@Retention(RetentionPolicy.RUNTIME)  
@Target({ElementType.METHOD})
@Documented
public @interface UserOperate {
 
	//模块名  
    String moduleName() default "";  
    //操作内容  
    String option() default "";  
}