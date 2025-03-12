package com.dcits.supervise.pecr.indv.controller.packet;

import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.feedbackreport.mapper.ReportFeedBackMessageMapper;
import com.dcits.supervise.pecr.generateReport.ThreadExcute.FeedReportAllSuccRunnable;
import com.dcits.supervise.pecr.indv.service.packet.IndvMessageDownLoadManager;
import com.dcits.supervise.pecr.util.ReportType;

import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

/**
 * 个人报文信息下载
 * @author 穆楠
 *
 */
@Controller
@RequestMapping("/indvMessageDownLoad")
public class IndvMessageDownLoadController extends BaseController{

	@Autowired
	private IndvMessageDownLoadManager indvMessageDownLoad;
	
	@Autowired
	private ReportFeedBackMessageMapper reportMessageMapper;
	
	private ThreadPoolExecutor executor = new ThreadPoolExecutor(5, 10, 1, TimeUnit.SECONDS, new ArrayBlockingQueue<Runnable>(1000));
	
	/**
	 *获取数据列表界面 
	 * @return
	 */
	@RequestMapping("/indvDataPage")
	public String indvPage() {
		return "pecr/indv/packet/indvMessageDownLoadList";
	}
	@RequestMapping("/entDataPage")
	public String entPage() {
		return "pecr/indv/packet/entMessageDownLoadList";
	}
	@RequestMapping("/indvSpDataPage")
	public String indvSpPage() {
		return "pecr/indv/packet/indvSpMessageDownLoadList";
	}
	@RequestMapping("/entSpDataPage")
	public String entSpPage() {
		return "pecr/indv/packet/entSpMessageDownLoadList";
	}
	@RequestMapping("/moDataPage")
	public String moPage() {
		return "pecr/indv/packet/moMessageDownLoadList";
	}
	@RequestMapping("/moSpDataPage")
	public String moSpPage() {
		return "pecr/indv/packet/moSpMessageDownLoadList";
	}
	
	/**
	 * 报文下载页面进行合并,20210324.
	 * @return
	 */
	@RequestMapping("/reportMessageDataPage")
	public String reportMessageDataPage() {
		return "pecr/indv/packet/reportMessageDownLoadList";
	}
	
	/**
	 * 获取表格数据列表
	 * @param page
	 * @return
	 */
	@RequestMapping("/dataList")
	@ResponseBody
	public Map<String, Object> acctInfoList(Page page){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			PageData pd = this.getPageData();
			pd.put("COMPANY",company);
			int pge = Integer.parseInt(pd.getString("page"));
			int limit = Integer.parseInt(pd.getString("limit"));
			page.setCurrentPage(pge);
			page.setShowCount(limit);
			page.setPd(pd);
			/*String type = pd.get("type").toString();
			List<Map<String, Object>> dataList =null;
			if(type.equalsIgnoreCase("indv")) {
		        dataList = indvMessageDownLoad.getIndvMessageDownLoad(page);
			}else if(type.equalsIgnoreCase("indvSp")) {
		        dataList = indvMessageDownLoad.getIndvSpMessageDownLoad(page);
			}else if(type.equalsIgnoreCase("ent")) {
		        dataList = indvMessageDownLoad.getEntMessageDownLoad(page);
			}else if(type.equalsIgnoreCase("entSp")) {
		        dataList = indvMessageDownLoad.getEntSpMessageDownLoad(page);
			}else if(type.equalsIgnoreCase("mo")) {
		        dataList = indvMessageDownLoad.getMoMessageDownLoad(page);
			}else if(type.equalsIgnoreCase("moSp")) {
		        dataList = indvMessageDownLoad.getMoSpMessageDownLoad(page);
			}*/
			List<Map<String, Object>> dataList = indvMessageDownLoad.getReportMessageDataPage(page);
			resultMap.put("data", dataList);
			resultMap.put("code", 0);
			resultMap.put("count", page.getTotalResult());
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("code", 1);
		}
		return resultMap;
	}
	
	/**
	 * 报文下载
	 * 
	 * @param response
	 */
	@RequestMapping(value = "/download", method = RequestMethod.GET)
	public void download(HttpServletResponse response) {
		List<String> reportTxtFileNames=new ArrayList<>();
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String zipfileName = sdf.format(date) + ".zip";
		response.setContentType("application/x-msdownload");
		response.setHeader("Content-disposition", "attachment; filename=\""
				+ zipfileName + "\"");
		OutputStream out = null;
		ZipOutputStream zipOut = null;
		try {
			PageData pd = this.getPageData();
			String dataFile = pd.getString("DATA_IDS");
			if (null != dataFile && dataFile.length() > 0) {
				//文件存放路径数组
				String[] arrayPacket = dataFile.split(";");
				//20220622,此处是为了解决报文下载时路径中的\\不被Tomcat识别引起的问题
				String[]files = new String[arrayPacket.length];
				for(int i=0;i<arrayPacket.length;i++) {
					files[i] = arrayPacket[i].replace("3tf55yh656jj644", "\\"); 
				}
					

				out = response.getOutputStream();
				zipOut = new ZipOutputStream(out);
				
				/** 获取文件数据并写出到response的响应流中 **/
				put(files, zipOut);
				out.flush(); 
				zipOut.flush();
			}
		} catch (Exception e) {
			logger.error("下载报文文件异常",e);
		}finally{
			try {
				if(zipOut != null){
					zipOut.close();
				}
				if(out != null){
					out.close();
				}
			}catch (Exception e) {
				logger.error("下载报文文件流关闭异常",e);
			}
		}
	}
	public String put(String[] files, ZipOutputStream zipOut) throws IOException{
		String errorMsg ="";
		InputStream in = null;
		try {
			ZipEntry zipEntry = null;
			for (int i = 0; i < files.length; i++) {
				String filePath = files[i];
				String fileName = filePath.substring(filePath.lastIndexOf(File.separator)+ 1, filePath.length());
				in = new FileInputStream(filePath);
				zipEntry = new ZipEntry(fileName);
				zipOut.putNextEntry(zipEntry);

				byte []b = new byte[1024];
				int length = -1;
				while ((length = in.read(b)) != -1) {
					zipOut.write(b, 0, length);
				}
				in.close();
			}
		} catch (Exception ex) {
			logger.error("将下载文件写入压缩文件异常",ex);
		}finally{
			if (in != null){
				in.close();
			}
		}
		return errorMsg;
	}
	
	/**
	 * 数据列表界面
	 * @return
	 */
	@RequestMapping("/generateUploadView")
	public String generateUploadView() {
		return "pecr/indv/packet/generateUploadView";
	}
	
	/**
	 * 
	 * 获取新增、修改或者详情页面，以标识区分，前端进行样式控制
	 * 
	 * @param page
	 * @return
	 */
	@RequestMapping("/feedbackShow")
	public void feedbackShow(HttpServletResponse response) {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String zipfileName = sdf.format(date) + "feedBack.zip";
		response.setContentType("application/x-msdownload");
		response.setHeader("Content-disposition", "attachment; filename=\""
				+ zipfileName + "\"");
		OutputStream out = null;
		ZipOutputStream zipOut = null;
		try {
			PageData pd = this.getPageData();
			String filePath = pd.getString("FEEDBACK_MESSAGE_FILE_PATH");
			if (null != filePath && filePath.length() > 0) {
				//文件存放路径数组,现将下载enc文件改为txt文件
				filePath = filePath.replace(".enc", ".txt");
				String[] arrayPacket = {filePath};

				out = response.getOutputStream();
				zipOut = new ZipOutputStream(out);
				
				/** 获取文件数据并写出到response的响应流中 **/
				put(arrayPacket, zipOut);
				out.flush(); 
				zipOut.flush();
			}
		} catch (Exception e) {
			logger.error("下载报文反馈文件异常",e);
		}finally{
			try {
				if(zipOut != null){
					zipOut.close();
				}
				if(out != null){
					out.close();
				}
			}catch (Exception e) {
				logger.error("下载报文反馈文件流关闭异常",e);
			}
		}
	}
	
	
	/**
	 * 首先根据选中的报文信息，更改报文记录数据状态。
	 * 前端进行多选的时候需要卡一下，只要预处理成功的才能进行该操作
	 * 后台获取到数据：报文类型+报文名称，首先更改报文记录的状态，然后判断在对应报文类型基础表中确实存在的报文才会进行多线程处理数据。
	 */
	@RequestMapping("/changeReportStatusAllSucc")
	@ResponseBody
	public Map<String, Object> changeReportStatusAllSucc(Page page){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		PageData pd = this.getPageData();
		String str = pd.get("str").toString();
		//校验值
		if(str.isEmpty()){
			logger.info("报文类型和报文名为空");
			resultMap.put("result", "fail");
			resultMap.put("msg", "报文类型和报文名为空");
			return resultMap;
		}
		String[] strs = str.split(";");
		List<Map<String,String>> listMaps = new ArrayList<Map<String,String>>();
		for (String typeAndName : strs) {
			Map<String,String> tempMap = new HashMap<String,String>();
			String[] temp = typeAndName.split(",");
			tempMap.put("REPORT_MESSAGE_TYPE", temp[0]);
			tempMap.put("REPORT_MESSAGE_FILE_NAME", temp[1]);
			String tableName = ReportType.getReportTypeBaseTable(temp[0]);
			tempMap.put("tableName", tableName);
			listMaps.add(tempMap);
		}
		try {
			indvMessageDownLoad.updateReportStatus(listMaps);
			for (Map<String, String> map : listMaps) {
				int num = indvMessageDownLoad.getNumByReportTypeAndName(map);
				if(num > 0){
					FeedReportAllSuccRunnable feedReportAllSuccRunnable = new FeedReportAllSuccRunnable(reportMessageMapper,map);
					executor.execute(feedReportAllSuccRunnable);
				}
			}
			resultMap.put("result", "succ");
			resultMap.put("msg", "修改报文状态成功！");
			return resultMap;
		} catch (Exception e) {
			logger.error("修改报文状态失败！！！", e);
			resultMap.put("result", "fail");
			resultMap.put("msg", "修改报文状态失败！");
			return resultMap;
		}
	}
	
}
