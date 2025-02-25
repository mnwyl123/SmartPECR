package com.dcits.supervise.pecr.log;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
//运行阶段执行
@Retention(RetentionPolicy.RUNTIME)
//可作用在方法上
@Target({ElementType.METHOD})
@Documented
public @interface Operate {
	//模块名
	String modulName() default "";
	//操作内容
	String option() default "";
}
