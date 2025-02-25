package com.dcits.supervise.pecr.common.controller;

import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.supervise.pecr.common.service.GenerateUUIDMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * 生成UUID 提供信息段的主键
 * 
 * 注意：mysql批量时会生成重复的uuid，直接调用uuid()函数会生成带有‘-’的字符串，且长度位36位
 *     可以使用MD5函数对其加密，直接返回32位的字符串
 * @author leizx
 *
 */
@Controller
@RequestMapping(value = "/generateUUID")
public class GenerateUUIDController extends BaseController{
	
	@Autowired
	private GenerateUUIDMapper generateUUIDService;
	
	/**
	 * 生成UUID
	 * @param page
	 * @return
	 */
	@RequestMapping("/id")
	@ResponseBody
	public Map<String, Object> getId(Page page){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			String uuid = generateUUIDService.generateUUID(page);
			resultMap.put("result", uuid);
			resultMap.put("success", true);
			resultMap.put("msg", "成功生成UUID");
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("msg", e.getMessage());
			resultMap.put("success", false);
		}
		return resultMap;
	}
}
