package com.dcits.platform.util;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import Decoder.BASE64Decoder;
import Decoder.BASE64Encoder;

/** 
 * 说明：BASE64处理
 * 创建人：  
 * 修改时间：2015年11月24日
 * @version
 */
public class ImageAnd64Binary {
    public static void main(String[] args){
    	
		String imgSrcPath 	 = "d:/abc/123.jpg";     //生成64编码的图片的路径
		String imgCreatePath = "E:\\apache-tomcat-6.0.37\\webapps/pro/ueditor2/jsp/upload1/20140318/480ace2bfc6e44608595bd4adbdeb067.jpg";     //将64编码生成图片的路径
		imgCreatePath=imgCreatePath.replaceAll("\\\\", "/");
		System.out.println(imgCreatePath);
    	String strImg = getImageStr(imgSrcPath);
    	System.out.println(strImg);
        generateImage(strImg, imgCreatePath);
    }
    
   /**
     * 将图片文件转化为字节数组字符串，并对其进行Base64编码处理
     * @param imgSrcPath 生成64编码的图片的路径
     * @return
     */
    @SuppressWarnings("unused")
	public static String getImageStr(String imgSrcPath){
        InputStream in = null;
        byte[] data = null;
        int i=0;
        //读取图片字节数组
        try {
            in = new FileInputStream(imgSrcPath);        
            data = new byte[in.available()];
            in.read(data);
            while (( i = in.read(data))!=-1){   
            	
            } 
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
        	if(in != null) {
        		try {
					in.close();
				} catch (IOException e) {
				}
        	}
        	
        }
        
        //对字节数组Base64编码
        BASE64Encoder encoder = new BASE64Encoder();
        
        return encoder.encode(data);//返回Base64编码过的字节数组字符串
    }
    
    /**
     * 对字节数组字符串进行Base64解码并生成图片
     * @param imgStr            转换为图片的字符串
     * @param imgCreatePath     将64编码生成图片的路径
     * @return
     */
    public static boolean generateImage(String imgStr, String imgCreatePath){
        if (imgStr == null) //图像数据为空
            return false;
        BASE64Decoder decoder = new BASE64Decoder();
        OutputStream out = null;
        try {
            //Base64解码
            byte[] b = decoder.decodeBuffer(imgStr);
            for(int i=0;i<b.length;++i) {
                if(b[i]<0) {//调整异常数据
                    b[i]+=256;
                }
            }
            out = new FileOutputStream(imgCreatePath);    
            out.write(b);
            out.flush();
           
            return true;
        } catch (Exception e){
            return false;
        }finally {
        	if(out != null) {
        		try {
					out.close();
				} catch (IOException e) {
				}
        	}
        }
    }
    
}