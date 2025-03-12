package com.dcits.supervise.pecr.whiteList.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.common.entity.SystemCodeTypeValue;
import com.dcits.supervise.pecr.whiteList.service.WhiteMsgConfigManager;
/**
 * 征信报送白名单配置
 * @author
 *
 */
@Controller
@RequestMapping("/whiteMsgConfig")
public class WhiteMsgConfigController extends BaseController{

	@Autowired
	private WhiteMsgConfigManager whiteMsgConfigService; 
	

	/**
	 * 数据列表界面
	 * @return
	 */
	@RequestMapping("/dataPage")
	public String dataPageProduct() {
		return "pecr/whiteList/whiteMsgConfig";
	}

	
	/**
	 * 获取表格数据列表
	 * @param page
	 * @return
	 */
	@RequestMapping("/msgConfig_list")
	@ResponseBody
	public Map<String, Object> msgConfigList(Page page){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			PageData pd = this.getPageData();
			//String type = pd.getString("type");
			int pge = Integer.parseInt(pd.getString("page"));
			int limit = Integer.parseInt(pd.getString("limit"));
			page.setCurrentPage(pge);
			page.setShowCount(limit);
			page.setPd(pd);
			List<PageData> list = whiteMsgConfigService.msgConfigList(page);
			
				
			resultMap.put("data", list);
			resultMap.put("code", 0);
			resultMap.put("count", page.getTotalResult());
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("code", 1);
		}
		return resultMap;
	}

	
	/**
	 * 保存修改,新增,根据flag判断
	 * 
	 * @param page
	 * @return
	 */
	@RequestMapping("/msgConfig_save")
	@ResponseBody
	public Map<String, Object> msgConfigSave(Page page) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			PageData pd = this.getPageData();
			String flag = pd.getString("addOrSave");
			
			if("add".equals(flag)){
				whiteMsgConfigService.insertWhiteMsgConfig(pd);
				resultMap.put("success", true);
			}else if("save".equals(flag)){
				whiteMsgConfigService.updateWhiteMsgConfig(pd);
				resultMap.put("success", true);
				
			}else{
				resultMap.put("success", false);
				resultMap.put("msg", "方法异常,请联系管理员!");	
			}
				
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());		
//			resultMap.put("code", 1);
		}
		return resultMap;
	}
	

	/**
	 * 修改,删除,根据flag判断
	 * 
	 * @param page
	 * @return
	 */
	@RequestMapping("/msgConfig_delete")
	@ResponseBody
	public Map<String, Object> msgConfigDelete(Page page) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			PageData pd = this.getPageData();
			
				
			whiteMsgConfigService.deleteWhiteMsgConfig(pd);
			resultMap.put("success", true);
					
				
				
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());		
//			resultMap.put("code", 1);
		}
		return resultMap;
	}
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/selectWhiteMsgCodeDict")
	@ResponseBody
	public Map<String, Object> selectWhiteMsgCodeDict(Model model,
			HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			ObjectMapper mapper = new ObjectMapper();
			// 得到页面唯独列表
			String jsonSetMap = ServletRequestUtils.getStringParameter(request,
					"DATA_IDS", "");
			jsonSetMap = java.net.URLDecoder.decode(jsonSetMap, "UTF-8");
			List<Map<String, Object>> mapList = mapper.readValue(jsonSetMap,List.class);
			List<Map<String, Object>> sysCodeList = null;
			if(mapList != null && mapList.size() > 0 ){
				sysCodeList = whiteMsgConfigService.selectWhiteMsgCodeDict(mapList);
			}
			resultMap.put("result", sysCodeList);
			resultMap.put("code", 0);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("code", 1);
		}
		return resultMap;
	}
	

	
	/**
	 * 联动查询客户身份信息类型
	 * @param page
	 * @return
	 */
	@RequestMapping("/selectCustomerIdTypeDict")
	@ResponseBody
	public Map<String, Object> selectCustomerIdTypeDict(Model model,
			HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			String uperId = request.getParameter("uperValue");
			List<SystemCodeTypeValue> sysCodeList = whiteMsgConfigService.selectCustomerIdTypeDict(uperId);
			resultMap.put("result", sysCodeList);
			resultMap.put("code", 0);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("code", 1);
		}
		return resultMap;
	}
	/**
	 * 联动查询客户身份号码
	 * @param page
	 * @return
	 */
	@RequestMapping("/selectCustomerIdNumDict")
	@ResponseBody
	public Map<String, Object> selectCustomerIdNumDict(Model model,
			HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			String uperId = request.getParameter("uperValue");
			List<SystemCodeTypeValue> sysCodeList = whiteMsgConfigService.selectCustomerIdNumDict(uperId);
			resultMap.put("result", sysCodeList);
			resultMap.put("code", 0);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("code", 1);
		}
		return resultMap;
	}
	
	
	/**
	 * 联动查询接口代码
	 * @param page
	 * @return
	 */
	@RequestMapping("/selectBusinessCodeDict")
	@ResponseBody
	public Map<String, Object> selectBusinessCodeDict(Model model,
			HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			String uperId = request.getParameter("uperValue");
			List<SystemCodeTypeValue> sysCodeList = whiteMsgConfigService.selectBusinessCodeDict(uperId);
			resultMap.put("result", sysCodeList);
			resultMap.put("code", 0);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("code", 1);
		}
		return resultMap;
	}
	
	



	
	
}



