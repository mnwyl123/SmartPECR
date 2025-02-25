package com.dcits.common;

import java.io.File;
import java.util.ArrayList;
import java.util.Properties;
import java.util.concurrent.Semaphore;

import org.apache.log4j.Logger;

import com.dcits.supervise.pecr.feedbackreport.service.ReportFeedBackMessageService;
import com.dcits.supervise.pecr.generateReport.ThreadExcute.ServiceHandleExcutor;
import com.dcits.supervise.pecr.util.DealWithFile;
import com.dcits.supervise.pecr.util.StringDateUtil;

public class MyThreadTo  extends Thread{

	@Override
	public void run() {
		try {
			this.sleep(100000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	

}
