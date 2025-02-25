package com.dcits.supervise.pecr.scheduler.job;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.support.PropertiesLoaderUtils;

import com.dcits.platform.util.UuidUtil;
import com.dcits.supervise.pecr.sendSMS.SmsUtil;
import com.dcits.supervise.pecr.sendSMS.mapper.SendSMSMapper;

public class SMSTaskJob {
	private final static Logger logger = Logger.getLogger(SMSTaskJob.class);
	
	@Autowired
	private SendSMSMapper service;
	
	public void sendSms() {
		System.out.println("=============进来了"+ new Date());
		int count = 0;
		String uuid = UuidUtil.get32UUID();
		try {
			count = service.updateStatus(uuid);
		} catch (Exception e) {
			logger.error("SMSTaskJob updateStatus is fail",e);
			return;
		}
		//短信存在记录
		if(count > 0) {
			sendSmsRun(uuid);
		}else {
			logger.debug("sendSms ============= not data");
		}
	}
	
	public void sendSmsRun(String uuid) {
		logger.debug("sendSms ========== start");
		try {
			Properties properties = PropertiesLoaderUtils.loadAllProperties("smsParams.properties");
			String ip = (String) properties.get("smsIP");
			int port = Integer.parseInt(properties.get("smsPort").toString());
			int timeout =  Integer.parseInt(properties.get("smsTimeOut").toString());
			String countTemp = (String) properties.get("smsCount");
			String countJBTemp = (String)properties.get("smsJBCount");
			SmsUtil smsUtil = new SmsUtil(ip,port,timeout);
			List<Map<String, Object>> rec =  service.queryRec(uuid);
			for(Map<String, Object> map : rec) {
				String phoneNum = map.get("MOBILE").toString();
				String nameCust = map.get("CUST_NAME").toString();
				String date = map.get("REPORT_DATE").toString();
				//对借呗的数据进行区分
				String msgContent = null;
				if("jiebei".equals(nameCust)) {
					msgContent = countJBTemp;
				}else {
					msgContent =String.format(countTemp, nameCust, date);
				}
				
				boolean bool = smsUtil.sendMsg(phoneNum, msgContent, true,map);
				map.put("STATUS", bool?"1":"0");
				insertRecprd(map);
			}
		} catch (Exception e) {
			logger.error(e);
		}
		
		logger.debug("sendSms ========== end");
	}
	
	public void insertRecprd(Map<String, Object> map) {
		try {
			String uuid = UuidUtil.get32UUID(); 
			map.put("UUID", uuid);
			service.insertRecprd(map);
		}catch(Exception e) {
			logger.error("updateStatus is fail", e);
		}
	}
}
