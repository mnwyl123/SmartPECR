package com.dcits.supervise.pecr.util;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.ParserConfigurationException;

import org.apache.log4j.Logger;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.openxml4j.opc.PackageAccess;
import org.apache.poi.util.SAXHelper;
import org.apache.poi.xssf.eventusermodel.ReadOnlySharedStringsTable;
import org.apache.poi.xssf.eventusermodel.XSSFReader;
import org.apache.poi.xssf.eventusermodel.XSSFSheetXMLHandler;
import org.apache.poi.xssf.eventusermodel.XSSFSheetXMLHandler.SheetContentsHandler;
import org.apache.poi.xssf.model.StylesTable;
import org.apache.poi.xssf.usermodel.XSSFComment;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;
import org.xml.sax.XMLReader;

import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.indv.service.dataRecode.DelaccountDataManager;

/**
 * 读取excel中数据
 * @author 
 *
 */
public class ImportExportDataPerDel {
	
	private static Logger logger = Logger.getLogger(ImportExportDataPerDel.class);
	
	 	private File file;  //源文件
	 	private DelaccountDataManager delAccountDataService;
	 	private PageData pd;
	    private SheetContentsHandler handler; 
	    private List<List<String>> listData = new ArrayList<List<String>>();   //记录读取的数据
	    private Map<String,Object> resultMap = new HashMap<String,Object>();
	    private int num;
	      
	    public ImportExportDataPerDel(File file,DelaccountDataManager delAccountDataService,PageData pd){  
	        this.file = file; 
	        this.delAccountDataService = delAccountDataService;
	        this.pd = pd;
	    }  
	      
	    public ImportExportDataPerDel setHandler(SheetContentsHandler handler) {  
	        this.handler = handler;  
	        return this;  
	    }  
	    
	    public Map<String,Object> getData(){
	    	final List<String> fields = new ArrayList<String>();//记录标题字段
	    	 setHandler(new SimpleSheetContentsHandler(){
			        @Override  
			        public void endRow(int rowNum) {
			        	if(rowNum == 2){
			        		// 第2行字段 ,字段名，后续Map集合中的key值
			            	fields.addAll(row);
			            }
			            if(rowNum > 2){
			                // 数据 
		            		listData.add(row);
			            }
			            if(listData.size()>=1000){
			            	//调用数据入库方法
			            	try {
								InsertData(listData,fields,delAccountDataService,pd);
							} catch (Exception e) {
								logger.error("Excel批量导入，个人按段或整笔删除信息出错！",e);
								resultMap.put("NUM", num);
						    	resultMap.put("RESULT", "FAIL");
						    	return ;
							}
			            	num = num + 1000;
			            	listData.clear();
			            }
			        }
			    }).parse(); 
	    	 if(listData.size()>0){
	    		//数据入库
	    		 num = num + listData.size();
	    		 try {
					InsertData(listData,fields,delAccountDataService,pd);
				} catch (Exception e) {
					logger.error("Excel批量导入，个人按段或整笔删除信息出错！",e);
					resultMap.put("NUM", num);
			    	resultMap.put("RESULT", "FAIL");
			    	return resultMap;
				}
	    		 listData.clear();
	    	 }
	    	 resultMap.put("NUM", num);
	    	 resultMap.put("RESULT", "SUCC");
	    	 return resultMap;
	    }
	    
	    
	    public void parse(){  
	        OPCPackage pkg = null;  
	        InputStream sheetInputStream = null;  
	          
	        try {  
	            pkg = OPCPackage.open(file,PackageAccess.READ);  
	            XSSFReader xssfReader = new XSSFReader(pkg);  
	              
	            StylesTable styles = xssfReader.getStylesTable();   
	            ReadOnlySharedStringsTable strings = new ReadOnlySharedStringsTable(pkg);  
	            sheetInputStream = xssfReader.getSheetsData().next();  
	              
	            processSheet(styles, strings, sheetInputStream);  
	        } catch (Exception e) {  
	            throw new RuntimeException(e.getMessage(), e);  
	        }finally {  
	            if(sheetInputStream != null){  
	                try {  
	                    sheetInputStream.close();  
	                } catch (IOException e) {  
	                }  
	            }  
	            if(pkg != null){  
	                try {  
	                    pkg.close();  
	                } catch (IOException e) {  
	                }  
	            }  
	        }  
	    }  
	      
	    private void processSheet(StylesTable styles, ReadOnlySharedStringsTable strings, InputStream sheetInputStream) throws SAXException, ParserConfigurationException, IOException{  
	        XMLReader sheetParser = SAXHelper.newXMLReader();   
	          
	        if(handler != null){  
	            sheetParser.setContentHandler(new XSSFSheetXMLHandler(styles, strings, handler, false));  
	        }else{  
	            sheetParser.setContentHandler(new XSSFSheetXMLHandler(styles, strings, new SimpleSheetContentsHandler(), false));  
	        }  
	          
	        sheetParser.parse(new InputSource(sheetInputStream));  
	    }  
	      
	    public static class SimpleSheetContentsHandler implements SheetContentsHandler{  
	        protected List<String> row = new LinkedList<>();  
	          
	        @Override  
	        public void startRow(int rowNum) {  
	        	row = new LinkedList<>();    
	        }  
	  
	        @Override  
	        public void endRow(int rowNum) {  
	            System.err.println(rowNum + " : " + row);  
	        }  
	  
	        @Override  
	        public void cell(String cellReference, String formattedValue, XSSFComment comment) {  
	            row.add(formattedValue);  
	        }  
	  
	        @Override  
	        public void headerFooter(String text, boolean isHeader, String tagName) {  
	              
	        }  
	    }
	    
	    public void InsertData(List<List<String>> listData,List<String> fields,DelaccountDataManager delAccountDataService,PageData pd) throws Exception{
	    	//组织插入数据
	    	List<Map<String,String>> dataMapList = new ArrayList<Map<String,String>>(1000);
	    	for(int i=0;i<listData.size();i++){
	    		List<String> list = listData.get(i);
	    		Map<String,String> tempMap = new HashMap<String,String>();
	    		for(int j=0;j<list.size();j++){
	    			tempMap.put(fields.get(j).trim(), list.get(j).trim());
	    		}
	    		tempMap.put("COMPANY", pd.getString("COMPANY"));
	    		tempMap.put("INF_REC_TYPE", pd.getString("INF_REC_TYPE"));
	    		dataMapList.add(tempMap);
	    	}
			//入库
			delAccountDataService.saveIDelBatchInfo(dataMapList);
	    }
}
