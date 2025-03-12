package com.dcits.supervise.pecr.sendSMS;

import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.sendSMS.mapper.SendSMSMapper;

/**
 * 逾期短信发送Controller
 * @author
 *
 */
@Controller
@RequestMapping("/sendSMS")
public class SendSMSController extends BaseController{
	
	private final static Logger logger = Logger.getLogger(SendSMSController.class);
	
	@Autowired
	private SendSMSMapper service;
	
	/**
	 * 短信数据同步
	 * @param page
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getMessage")
	public Map<String, Object> getMessage(Page page){
		PageData pd = this.getPageData();
		Map<String, Object> map = new HashMap<String,Object>();
		try {
			service.getMessageTo(pd);
			map.put("msg", "");
			map.put("success", true);
		}catch(Exception e){
			logger.error("SendSMSController getMessage is fail", e);
			map.put("msg", e.getMessage());
			map.put("success", false);
		}
		return map;
	}
	
	/**
	 * 发送短信
	 * @param page
	 */
	@ResponseBody
	@RequestMapping("/sendMessage")
	public void sendMessage(Page page) {
		
		
	}
	
}
