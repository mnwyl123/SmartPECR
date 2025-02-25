package com.dcits.supervise.pecr.feedbackreport.service;

import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

public interface ReportFeedBackMessageService {

	 public abstract String importFeedBackReport(Map<String,Object> paramString, MultipartFile[] paramArrayOfMultipartFile,Boolean isLocal)
			    throws Exception;
}
