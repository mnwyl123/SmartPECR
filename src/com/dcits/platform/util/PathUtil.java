package com.dcits.platform.util;

import java.io.File;
import java.net.URISyntaxException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

/** 
 * 说明：路径工具类
 * 创建人：  
 * 修改时间：2014年9月20日
 * @version
 */
public class PathUtil {

	/**
	 * 图片访问路径
	 * @param pathType
	 *            图片类型 visit-访问；save-保存
	 * @param pathCategory
	 *            图片类别，如：话题图片-topic、话题回复图片-reply、商家图片
	 * @return
	 */
	public static String getPicturePath(String pathType, String pathCategory) {
		String strResult = "";
		//HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder
		//		.getRequestAttributes()).getRequest();
		StringBuffer strBuf = new StringBuffer();
		if ("visit".equals(pathType)) {
		} else if ("save".equals(pathType)) {
			String projectPath = PublicUtil.getPorjectPath().replaceAll("\\\\",
					"/");
			projectPath = splitString(projectPath, "bin/");

			strBuf.append(projectPath);
			strBuf.append("webapps/ROOT/");
		}

		strResult = strBuf.toString();

		return strResult;
	}

	private static String splitString(String str, String param) {
		String result = str;

		if (str.contains(param)) {
			int start = str.indexOf(param);
			result = str.substring(0, start);
		}

		return result;
	}
	
	/*
	 * 获取classpath1
	 */
	public static String getClasspath(){
		//String path = (String.valueOf(Thread.currentThread().getContextClassLoader().getResource(""))+"../../").replaceAll("file:/", "").replaceAll("%20", " ").trim();	
		String filePath = "" ;
		filePath =	Tools.class.getClassLoader().getResource(File.separator).getPath();
		if(!filePath.endsWith("WEB-INF"+File.separator+"classes"+File.separator)){
			try {
				filePath = PathUtil.class.getClassLoader().getResource("").toURI().getPath();
			} catch (URISyntaxException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	
		filePath = filePath.replace("WEB-INF"+File.separator+"classes"+File.separator, "");
		filePath = filePath.replaceAll("%20", " ");
		if(filePath.indexOf(":") != 1){
			return File.separator + filePath;
		}else{
			return filePath;
		}
	}
	
	/**
	 * 获取classpath
	 * @return
	 */
	public static String getClasspath1(){
		String path = (String.valueOf(Thread.currentThread().getContextClassLoader().getResource(""))+"../../").replaceAll("file:/", "").replaceAll("%20", " ").trim();	
		if(path.indexOf(":") != 1){
			return File.separator + path;
		}else{
			return path;
		}
	}
	
	
	/*
	 * 获取classpath1
	 */
	public static String getBcrClasspath(){
		//String path = (String.valueOf(Thread.currentThread().getContextClassLoader().getResource(""))+"../../").replaceAll("file:/", "").replaceAll("%20", " ").trim();	
		String filePath = "" ;
		filePath =	Tools.class.getClassLoader().getResource(File.separator).getPath();
		if(!filePath.endsWith("WEB-INF"+File.separator+"classes"+File.separator)){
			try {
				filePath = PathUtil.class.getClassLoader().getResource("").toURI().getPath();
			} catch (URISyntaxException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		String temp ="WEB-INF"+File.separator+"classes"+File.separator;
		temp = temp.replace("\\","/");
		filePath = filePath.replaceAll(temp, "");
		if(filePath.indexOf(":") != 1){
			return File.separator + filePath;
		}else{
			return filePath;
		}
	}
	/*
	 * 获取classpath2
	 */
	public static String getClassResources(){
		String path =  (String.valueOf(Thread.currentThread().getContextClassLoader().getResource(""))).replaceAll("file:/", "").replaceAll("%20", " ").trim();	
		if(path.indexOf(":") != 1){
			return File.separator + path;
		}else{
			return path;
		}
	}
	
	public static String PathAddress() {
		String strResult = "";
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder
				.getRequestAttributes()).getRequest();

		StringBuffer strBuf = new StringBuffer();

		strBuf.append(request.getScheme() + "://");
		strBuf.append(request.getServerName() + ":");
		strBuf.append(request.getServerPort() + "");

		strBuf.append(request.getContextPath() + "/");

		strResult = strBuf.toString();// +"ss/";//加入项目的名称

		return strResult;
	}
	
}
