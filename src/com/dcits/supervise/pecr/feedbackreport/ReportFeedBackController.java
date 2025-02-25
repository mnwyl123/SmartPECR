package com.dcits.supervise.pecr.feedbackreport;

import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.supervise.pecr.feedbackreport.service.ReportFeedBackMessageService;
import com.dcits.supervise.pecr.util.DealWithFile;
import com.dcits.supervise.pecr.util.StringDateUtil;
import org.apache.commons.io.IOUtils;
import org.apache.http.entity.ContentType;
import org.apache.shiro.session.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

@Controller
@RequestMapping("/reportFeedBack")

public class ReportFeedBackController extends BaseController {
    private static final Logger logger = LoggerFactory.getLogger(ReportFeedBackController.class);
    @Autowired
    private ReportFeedBackMessageService reportMessageService;


    @RequestMapping("/importFeedBackReport")
    @ResponseBody
	public Map<String, Object> importFeedBackReport(
			@RequestParam(value = "file", required = false) MultipartFile[] files, Boolean isLocal) {
    	Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
    	isLocal = false;
		Map<String, Object> map = new HashMap<String, Object>(3);
		// 上传文件到服务器指定路径
		// 定义一个List存储文件名，用于解密解压操作
		int length = files.length;
		ArrayList<String> backReportNames = new ArrayList<>(length);
		String errMsg = null;
		FileInputStream fileInputStream =null;
    	try{
    		if (!isLocal) {
    			String dateString = StringDateUtil.getDateString("yyyy-MM-dd");
    			String saveBackReportPath = getPropertieValue("saveBackReportPath");
    			if (null == saveBackReportPath || "".equals(saveBackReportPath)) {
    				map.put("success", false);
    				map.put("msg", "配置文件中反馈报文路径为空，请检查");
    				return map;
    			}
    			String realPath = saveBackReportPath + File.separator + dateString;
    			File realFile = new File(realPath);
    			if (!realFile.exists()) {
    				realFile.mkdirs();
    			}
    			for (MultipartFile file : files) {
    				String fileName = file.getOriginalFilename();
    				backReportNames.add(fileName);
    				File backReportFile = new File(realPath, fileName);
    				FileOutputStream outputStream = null;
    				InputStream inputStream = null;
    				try {
    					outputStream = new FileOutputStream(backReportFile);
        				inputStream = file.getInputStream();
        				IOUtils.copy(inputStream, outputStream);
					}catch(Exception e){
						map.put("success", false);
	    				map.put("msg", " - 保留上传文件失败，请联系系统管理员！");
	    				return map;
					}finally {
						if(inputStream != null){
							inputStream.close();
						}
						if(outputStream != null){
							outputStream.close();
						}
					}
    			}
    			logger.info("开始解密解压回执");
    			// 解密
    			ArrayList<String> decryptErrorMessage = DealWithFile.feedBackDecrypt(realPath, backReportNames);
    			// 解密失败
    			if (decryptErrorMessage.size() != 0) {
    				map.put("success", false);
    				map.put("msg", " - 解密失败，请联系系统管理员！");
    				logger.error("解密失败，具体信息为： " + decryptErrorMessage.toString());
    				return map;
    			}
    			// 解压
    			ArrayList<String> decompressErrorMessage = DealWithFile.feedBackDecompress(realPath, backReportNames);
    			// 解压失败
    			if (decompressErrorMessage.size() != 0) {
    				map.put("success", false);
    				map.put("msg", " - 解压失败，请联系系统管理员！");
    				logger.error("解压失败，具体信息为： " + decompressErrorMessage.toString());
    				return map;
    			}

    			logger.info("开始解析回执");
    			MultipartFile[] reFiles = new MultipartFile[length];
    			for (int i = 0; i < backReportNames.size(); i++) {
    				String fileNameEnc = backReportNames.get(i);
    				String fileNametxt = fileNameEnc.replace(".enc", ".txt");
    				File file = new File(realPath, fileNametxt);
    				if (file.exists()) {
    					fileInputStream = new FileInputStream(file);
    					
    					// 此处模拟文件上传的文件流，设置上传文件名和原上传文件名为 解密解压后的.txt文件
    					MultipartFile multiFile = new MockMultipartFile(fileNametxt, fileNametxt,
    							ContentType.APPLICATION_OCTET_STREAM.toString(), fileInputStream);
    					reFiles[i] = multiFile;
    					//20210113,将此处的文件后缀改成txt,因此后续下载反馈文件的时候下载的也是同路径下的txt文件，而不是enc文件。
    					Map<String,Object> paramMap = new HashMap<String,Object>();
    	                paramMap.put("feedFilePath", realPath+File.separator+fileNametxt);
    	                paramMap.put("company", company);
    					errMsg = reportMessageService.importFeedBackReport(paramMap, reFiles, isLocal);
    				}
    			}
    		}
    	}catch(Exception e){
    		logger.error("回执解析失败：", e);
    		map.put("success", false);
    		map.put("msg", e.getMessage());
    	}finally {
    		if(fileInputStream != null) {
    			try {
					fileInputStream.close();
				} catch (IOException e) {
				}
    		}
		}
		if ("success".equals(errMsg) && errMsg != null) {
			map.put("success", true);
			map.put("msg", "回执解析成功");
			logger.info("回执解析成功");
			return map;
		}
		map.put("success", false);
		map.put("msg", errMsg);
		logger.info("回执解析失败：" + errMsg);
		return map;
	}

    /**
     * 获取配置文件信息
     *
     * @param key
     * @return
     * @throws IOException
     */
    private String getPropertieValue(String key) throws IOException {
        Properties properties = new Properties();
        properties.load(BaseController.class.getClassLoader().getResourceAsStream("serverThread.properties"));
        return (String) properties.get(key);
    }
}
