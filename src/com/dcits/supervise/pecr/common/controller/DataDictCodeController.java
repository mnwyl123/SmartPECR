package com.dcits.supervise.pecr.common.controller;

import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.common.entity.OrgCode;
import com.dcits.supervise.pecr.common.entity.SystemCodeTypeValue;
import com.dcits.supervise.pecr.common.entity.SystemStateValue;
import com.dcits.supervise.pecr.common.service.DataDictCodeMapper;
import org.apache.shiro.session.Session;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 数据字典  下拉框   码值获取
 * @author leizx
 *
 */
@Controller
@RequestMapping(value = "/dataDictCode")
public class DataDictCodeController  extends BaseController{
	
	@Autowired
	private DataDictCodeMapper dataDictCodeService;
	
	/**
	 * 获取系统码值
	 * @param page
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/selectCodeTypeList")
	@ResponseBody
	public Map<String, Object> selectCodeTypeList(Model model,
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
				sysCodeList = dataDictCodeService.selectCodeValueList(mapList);
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
	 * wzy
	 * 获取机构码值
	 * @param page
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/selectSysCodeTypeList")
	@ResponseBody
	public Map<String, Object> selectSysCodeTypeList(Model model,
			HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			PageData pd = this.getPageData();
			Session session = Jurisdiction.getSession();
			User user = (User)session.getAttribute(Const.SESSION_USER);
			pd.put("COMPANY", user.getCOMPANY());
			List<Map<String, Object>> sysCodeList = null;
			sysCodeList = dataDictCodeService.selectSysCodeValueList(pd);
			resultMap.put("result", sysCodeList);
			resultMap.put("code", 0);
		}catch(Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			resultMap.put("code", 1);
		}
		return resultMap;
	}

	
	/**
	 * 根据上级码值  查询下级码值  联动
	 * @param page
	 * @return
	 */
	@RequestMapping("/selectCodeListByUperId")
	@ResponseBody
	public Map<String, Object> selectCodeListByUperId(Model model,
			HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			String uperId = request.getParameter("uperId");
			List<SystemCodeTypeValue> sysCodeList = dataDictCodeService.selectCodeValueListByUperId(uperId);
			resultMap.put("result", sysCodeList);
			resultMap.put("code", 0);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("code", 1);
		}
		return resultMap;
	}
	
	/**
	 * 根据上级码值  查询下级码值  联动  李继坤  校验结果
	 * @param page
	 * @return
	 */
	@RequestMapping("/selectTableListByUperId")
	@ResponseBody
	public Map<String, Object> selectTableListByUperId(Model model,
			HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			String uperId = request.getParameter("uperId");
			List<SystemCodeTypeValue> sysCodeList = dataDictCodeService.selectTableValueListByUperId(uperId);
			resultMap.put("result", sysCodeList);
			resultMap.put("code", 0);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("code", 1);
		}
		return resultMap;
	}
	
	/**
	 * 查询所属机构
	 * @param page
	 * @return
	 */
	@RequestMapping("/selectOrgList")
	@ResponseBody
	public Map<String, Object> selectOrgList(){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			List<OrgCode> orgCodeList = dataDictCodeService.selectOrgList("");
			resultMap.put("result", orgCodeList);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("result", null);
		}
		return resultMap;
	}
	
	/**
	 * 查询数据状态	/报文状态
	 * @param page
	 * @return
	 */
	@RequestMapping("/getSystemStateList")
	@ResponseBody
	public Map<String, Object> getSystemStateList(@RequestBody List<Map<String,String>> list){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			List<SystemStateValue> systemStateList = dataDictCodeService.getSystemStateList(list.get(0).get("systemStateType"));
			resultMap.put("result", systemStateList);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("result", null);
		}
		return resultMap;
	}
	
	/**
	 * 查询系统码值
	 * @param page
	 * @return
	 */
	@RequestMapping("/sysCodeTypeList")
	@ResponseBody
	public Map<String, Object> sysCodeTypeList(@RequestBody Map<String,String> map){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			List<OrgCode> sysCodeList = dataDictCodeService.getSysCodeTypeList(map.get("systemCodeType"));
			resultMap.put("result", sysCodeList);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("result", null);
		}
		return resultMap;
	}

	/**
	 * 根据上级码值  查询多个下级码值  联动
	 * @param page
	 * @return
	 */
	@RequestMapping("/selectCodesListByUperId")
	@ResponseBody
	public Map<String, Object> selectCodesListByUperId(Model model,
			HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> returnMap = new HashMap<String, Object>();
		List<Map<String, Object>> codeValueList = new ArrayList<>();
		try {
			PageData pd = this.getPageData();
			pd.put("uperId", request.getParameter("uperId"));
			pd.put("codeLevel","1");
			List<SystemCodeTypeValue> sysCodeList = dataDictCodeService.selectCodesValueListByUperId(pd);
			returnMap.put("COLUMN",sysCodeList);
			pd.put("codeLevel","2");
			sysCodeList = dataDictCodeService.selectCodesValueListByUperId(pd);
			returnMap.put("ACCT",sysCodeList);
			codeValueList.add(returnMap);
			resultMap.put("result", codeValueList);
			resultMap.put("code", 0);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("code", 1);
		}
		return resultMap;
	}
	
}
