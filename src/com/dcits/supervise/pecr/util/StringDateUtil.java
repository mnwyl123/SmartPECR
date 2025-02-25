package com.dcits.supervise.pecr.util;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class StringDateUtil{
	/**
	 * 获取指定格式的时间
	 * @param format
	 * @return
	 */
	public static String getDateString(String format){
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		return sdf.format(new Date());
	}
	/**获取14位时间字符串 - yyyyMMddHHmmss;*/
	public static String getWorkDate(){
		return getDateString("yyyyMMddHHmmss");
	}
	
	/**
	 * 根据格式和Long型时间数据，生成String格式时间
	 * @param format
	 * @param date
	 * @return
	 */
	public static String getDateForFormat(String format,Long date){
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		return sdf.format(new Date(date));
	}

}
