package com.dcits.common;



import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

import org.apache.commons.io.FileUtils;
import org.bouncycastle.jce.ProviderConfigurationPermission;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.pbccrc.collectclient.preprocess.BizType;
import org.pbccrc.collectclient.preprocess.FileProcComponent;
import org.pbccrc.collectclient.preprocess.VerifyResult;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.web.multipart.MultipartFile;

import com.dcits.supervise.pecr.exceptions.BusinessException;
import com.dcits.supervise.pecr.feedbackreport.entity.FeedBackReportCode;
import com.dcits.supervise.pecr.feedbackreport.entity.FeedBackReportErrorMessage;
import com.dcits.supervise.pecr.generateReport.entity.ReportAndBackMessageEnt;
import com.dcits.supervise.pecr.util.Base64;
import com.dcits.supervise.pecr.util.PecrConstantUtil;
import com.dcits.supervise.pecr.util.StringDateUtil;

public class MainTest {

	
	public static void main(String[] args) {
		Double d = Double.parseDouble("3.14");
		DecimalFormat decimalFormat = new DecimalFormat("0.00");
		String a = decimalFormat.format(d);
		System.out.println(a);
		
	}

	
	
}



