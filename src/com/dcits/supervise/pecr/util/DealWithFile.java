package com.dcits.supervise.pecr.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;


import org.apache.http.entity.ContentType;
import org.apache.log4j.Logger;
import org.pbccrc.collectclient.preprocess.BizType;
import org.pbccrc.collectclient.preprocess.FileProcComponent;
import org.pbccrc.collectclient.preprocess.GzipProcResult;
import org.pbccrc.collectclient.preprocess.Sm4ProcResult;
import org.pbccrc.collectclient.preprocess.VerifyResult;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.web.multipart.MultipartFile;
import com.dcits.supervise.pecr.feedbackreport.service.ReportFeedBackMessageService;
import com.dcits.supervise.pecr.generateReport.service.ReportMessageManager;

public class DealWithFile {
	private static final Logger logger = Logger.getLogger(DealWithFile.class);

	/**
	 * 报文预校验
	 */
	public static String verifyFile(String saveDir, String fileName,String feedbackDir,ReportFeedBackMessageService reportMessageService,ReportMessageManager reportMessageService2,String company) throws Exception{
		String repStatus = "";
		//report_message中 repName 不带后缀
		String repName = fileName.substring(0,fileName.length()-4);
		Map<String, Object> conditionMap = new HashMap<>();
		// 定义待进行格式校验处理的文件对象
        File txtFile = new File(saveDir + File.separator+fileName);
        // 调用处理组件实例的加压解压方法进行加压处理
        logger.info("调用处理组件实例的校验方法进行校验处理开始.......................................fileName:"+fileName+new Date().toString());
        VerifyResult result = FileProcComponent.verifyFile(txtFile,BizType.COLLECT, feedbackDir);
        logger.info("调用处理组件实例的校验方法进行校验处理结束.......................................fileName:"+fileName+new Date().toString());
        //得到处理状态
        String status = result.getStatus();
        logger.info("报文名为："+fileName+"的校验状态："+status);
        //得到文件记录数
        Integer totalCount = result.getTotalCount();
        //得到出错记录数
        Integer wrongCount = result.getWrongCount();
        //得到数据反馈文件存储路径
        String fbFileSavePath = result.getFeedbackFilePath(); 
        FileInputStream fileInputStream = null;
        if("SUCCESS".equals(status) && fbFileSavePath == null){
        	//预处理通过
        	conditionMap.put("repName", repName);
			conditionMap.put("repStatus",PecrConstantUtil.REPORT_STATUS_CHECK_OK );//PecrConstantUtil.BUSINESS_STATUS_50
			reportMessageService2.updateRepByRepName(conditionMap);
        }
        //过滤由于文件级别的错误导致校验失败
        else if(fbFileSavePath != null){
        	try {
            	boolean isLocal = true;
            	MultipartFile[] checkFile =new MultipartFile[1];
                File file = new File(fbFileSavePath);
                fileInputStream = new FileInputStream(file);
                //此处模拟文件上传的文件流，设置上传文件名和原上传文件名为生成的 报文名.txt，实际文件内容为校验存在错误生成的.bad文件
                MultipartFile  file1 = new MockMultipartFile(fileName, fileName, ContentType.APPLICATION_OCTET_STREAM.toString(), fileInputStream);
                
                checkFile[0] = file1;
                Map<String,Object> paramMap = new HashMap<String,Object>();
                paramMap.put("feedFilePath", fbFileSavePath);
                paramMap.put("company", company);
                String errMsg = reportMessageService.importFeedBackReport(paramMap,checkFile ,isLocal);
                //全部出错
                if(wrongCount==totalCount){
                	repStatus=PecrConstantUtil.REPORT_STATUS_CHECK_ALL_ERROR;
                }else{ //预处理部分失败
                	repStatus=PecrConstantUtil.REPORT_STATUS_CHECK_PORT_ERROR;
                }
        		conditionMap.put("repName", repName);
    			conditionMap.put("repStatus",repStatus );//PecrConstantUtil.BUSINESS_STATUS_50
    			reportMessageService2.updateRepByRepName(conditionMap);
            }catch(Exception e) {
            	logger.error("解析报文校验生成的.bad文件部分异常。", e);
            }finally{
            	if(fileInputStream != null){
            		fileInputStream.close();
            	}
            }
        }else{
        	//属于文件层级的校验错误，将其错误状态给位全部错误
        	conditionMap.put("repName", repName);
			conditionMap.put("repStatus",PecrConstantUtil.REPORT_STATUS_CHECK_ALL_ERROR );
			reportMessageService2.updateRepByRepName(conditionMap);
        }
        return status;
	}
    /**
     * 报文压缩
     */
    public static ArrayList<String> messageCompress(String saveDir, String fileName) throws IOException {
        ArrayList<String> compressErrorMessage = new ArrayList<String>();
        File file = new File(saveDir + File.separator + fileName);
        //String status = "SUCCESS";
        String errorMsg = null;
        if (!file.exists()) {
            compressErrorMessage.add("压缩输入的文件路径有误");
            return compressErrorMessage;
        }
        GzipProcResult gzipResult = FileProcComponent.gzip(file, FileProcComponent.COMPRESS, saveDir);
        String status = gzipResult.getStatus();
        if ("FAIL".equals(status)) {
            errorMsg = gzipResult.getErrorMsg();
            compressErrorMessage.add(fileName + " 压缩出错，错误码为：" + errorMsg);
        }
        return compressErrorMessage;
    }

    /**
     * 压缩后加密
     */
    public static ArrayList<String> messageEncrypt(String saveDir, String fileName) throws IOException {
        ArrayList<String> encryptErrorMessage = new ArrayList<>();
        File file = new File(saveDir + File.separator + fileName + ".zip");
        //String status = "SUCCESS";
        String errorMsg = null;
        if (!file.exists()) {
            encryptErrorMessage.add("加密输入的文件路径有误");
            return encryptErrorMessage;
        }
        Sm4ProcResult sm4ProcResult = FileProcComponent.sm4(file, FileProcComponent.ENCRYPT, saveDir);
        String status = sm4ProcResult.getStatus();
        if ("FAIL".equals(status)) {
            errorMsg = sm4ProcResult.getErrorMsg();
            encryptErrorMessage.add(fileName + " 加密出错，错误码为：" + errorMsg);
        }
        return encryptErrorMessage;
    }

    /**
     * 回执报文解密
     */
    public static ArrayList<String> feedBackDecrypt(String saveDir, ArrayList<String> fileNames) throws IOException {
        ArrayList<String> decryptErrorMessage = new ArrayList<>();
        //String status = "SUCCESS";
        String errorMsg = null;
        File file = null;
        for (String fileName : fileNames) {
            file = new File(saveDir, fileName);
            Sm4ProcResult sm4ProcResult = FileProcComponent.sm4(file, FileProcComponent.DECRYPT, saveDir);
            String status = sm4ProcResult.getStatus();
            if ("FAIL".equals(status)) {
                errorMsg = sm4ProcResult.getErrorMsg();
                decryptErrorMessage.add(fileName + " 解密出错，错误码为：" + errorMsg);
            }
        }
        return decryptErrorMessage;
    }

    /**
     * 回执报文解压
     */
    public static ArrayList<String> feedBackDecompress(String saveDir, ArrayList<String> fileNames) throws IOException {
        ArrayList<String> decompressErrorMessage = new ArrayList<>();
        //String status = "SUCCESS";
        String errorMsg = null;
        File file = null;
        for (String fileName : fileNames) {
            file = new File(saveDir, fileName.replace("enc", "txt.zip"));
            GzipProcResult sm4ProcResult = FileProcComponent.gzip(file, FileProcComponent.DECOMPRESS, saveDir);
            String status = sm4ProcResult.getStatus();
            if ("FAIL".equals(status)) {
                errorMsg = sm4ProcResult.getErrorMsg();
                decompressErrorMessage.add(file.getName() + " 解压出错，错误码为：" + errorMsg);
            }
        }
        return decompressErrorMessage;
    }

}
