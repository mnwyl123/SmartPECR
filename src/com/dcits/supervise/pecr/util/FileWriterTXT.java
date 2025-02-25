package com.dcits.supervise.pecr.util;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class FileWriterTXT {
	
	private static Logger logger = LoggerFactory.getLogger(FileWriterTXT.class);
	
	public static void writeTOFile(StringBuffer content,String filePath,String filaName){
		FileWriter fw = null;
		BufferedWriter bw = null;
		
		try {
			File file = new File(createFilePath(filePath,filaName));
			if (!file.getParentFile().exists()){
				if (!file.getParentFile().mkdirs()){
					logger.info("创建文件所在目录失败！");
				}
			}
			if (!file.exists()){
				if (!file.createNewFile()){
					logger.info("创建文件失败！");
				}
			}
			fw = new FileWriter(file,true);
			bw = new BufferedWriter(fw);
			bw.write(content.toString());
//			bw.write(System.getProperty("line.separator"));
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if(bw != null) {
				try {
					bw.close();
				} catch (IOException e) {
				}
			}
			if(fw != null) {
				try {
					fw.close();
				} catch (IOException e) {
				}
			}
		}
	}
	
	
	//韦宗英 add 追加写文件
	public static void appentWriteTOFile(StringBuffer content,String filePath,String filaName){
		FileWriter fw = null;
		BufferedWriter bw = null;
		
		try {
			File file = new File(createFilePath(filePath,filaName));
			if (!file.getParentFile().exists()){
				if (!file.getParentFile().mkdirs()){
					logger.info("创建文件所在目录失败！");
				}
			}
			if (!file.exists()){
				if (!file.createNewFile()){
					logger.info("创建文件失败！");
				}
			}
			fw = new FileWriter(file,true);
			bw = new BufferedWriter(fw);
			bw.write(content.toString());
//			bw.write(System.getProperty("line.separator"));
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if(bw != null) {
				try {
					bw.close();
				} catch (IOException e) {
				}
			}
			if(fw != null) {
				try {
					fw.close();
				} catch (IOException e) {
				}
			}
		}
	}
	
	public static String createFilePath(String filePath,String filaName){
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");  
		String dates = formatter.format(date).toString();
		return filePath+File.separator+dates+File.separator+filaName;
	}
}
