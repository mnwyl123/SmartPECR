package com.dcits.platform.pdf;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.MalformedURLException;
import java.util.Date;

import org.xhtmlrenderer.pdf.ITextFontResolver;
import org.xhtmlrenderer.pdf.ITextRenderer;

import com.dcits.platform.util.GenerateSequenceUtil;
import com.lowagie.text.DocumentException;
import com.lowagie.text.pdf.BaseFont;

public class ITextRendererUtil {
	private org.apache.log4j.Logger logger;
	public String createPDF(String htmlPath, String exportPath, String fontPath) {
		
		String pdfName = null;
		OutputStream os = null;
		try {
			String url = new File(htmlPath).toURI().toURL().toString();
			pdfName = GenerateSequenceUtil.generateSequenceNo(new Date()) + ".pdf";

			os = new FileOutputStream(exportPath + File.separator + pdfName);
			ITextRenderer renderer = new ITextRenderer();
			renderer.setDocument(url);

			ITextFontResolver fontResolver = renderer.getFontResolver();
			fontResolver.addFont(fontPath + File.separator + "simsun.ttc", 
					BaseFont.IDENTITY_H, BaseFont.NOT_EMBEDDED);
			renderer.layout();
			renderer.createPDF(os);

			
			File tempfile = new File(htmlPath);
			if(tempfile.exists()) {
				tempfile.delete();
			}
		} catch (MalformedURLException e) {
			//e.printStackTrace();
			logger.error(e);
		} catch (FileNotFoundException e) {
			//e.printStackTrace();
			logger.error(e);
		} catch (DocumentException e) {
			//e.printStackTrace();
			logger.error(e);
		} catch (IOException e) {
			//e.printStackTrace();
			logger.error(e);
		}finally {
			if(os != null) {
				try {
					os.close();
				} catch (IOException e) {
				}
			}
			
		}
		return pdfName;
	}
}
