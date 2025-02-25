package com.dcits.platform.pdf;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.Date;
import java.util.Map;

import com.dcits.platform.util.GenerateSequenceUtil;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

public class FreemarkerUtil {
	private org.apache.log4j.Logger logger;
	public Template getTemplate(String templeteName, String templetePath) {
		Template temp = null;
		try {
			Configuration cfg = new Configuration();
			cfg.setDefaultEncoding("UTF-8");
			cfg.setDirectoryForTemplateLoading(new File(templetePath));
			temp = cfg.getTemplate(templeteName);
		} catch (IOException e) {
			//e.printStackTrace();
			logger.error(e);
		}
		return temp;
	}

	public String exportHtml(String templeteName, String templetePath, String tempPath,
			Map<String, Object> data) {
		
		FileOutputStream out = null;
		String htmlPath = null;
		BufferedWriter bw = null;
		OutputStreamWriter osw = null;
		try {
			htmlPath = tempPath + File.separator + 
					GenerateSequenceUtil.generateSequenceNo(new Date()) + ".html";
			out = new FileOutputStream(new File(htmlPath));
			osw = new OutputStreamWriter(out, "UTF-8");
			bw = new BufferedWriter(osw, 1024);
			Template template = this.getTemplate(templeteName, templetePath);
			template.process(data, bw);
			
			bw.flush();
			
		} catch (TemplateException e) {
			//e.printStackTrace();
			logger.error(e);
		} catch (IOException e) {
			//e.printStackTrace();
			logger.error(e);
		}finally {
			if(bw != null) {
				try {
					bw.close();
				} catch (IOException e) {
				}
			}
			if(osw != null) {
				try {
					osw.close();
				} catch (IOException e) {
				}
			}if(out != null) {
				try {
					out.close();
				} catch (IOException e) {
				}
			}
		}
		return htmlPath;
	}
}
