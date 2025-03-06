package com.dcits.supervise.pecr.validateData.controller;

import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.validateData.service.ValidateErrorMessageService;
import com.dcits.supervise.pecr.validateData.service.ValidateService;
import com.dcits.supervise.pecr.validateData.vo.ValidateDataVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

/**
 * "系统校验接口"
 * 
 * @author munan
 *
 */
@Controller
@RequestMapping("/validate")
public class ValidateController extends BaseController {

	@Autowired
	private ValidateService validateService;

	@Autowired
	private ValidateErrorMessageService validateErrorMessageService;

	/**
	 * 全表校验接口
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/data")
	@ResponseBody
	public Map<String, Object> validateTable(Page page) throws Exception {
		PageData pd = this.getPageData();
		List<ValidateDataVo> validateDataVoList = new ArrayList<>();
		ValidateDataVo validateDataVo=null;
		String[] tableNames = pd.get("tableName").toString().split(",");
		String[] tablePks = pd.get("pk").toString().split(",");
		for (int i=0;i<tableNames.length;i++) {
			validateDataVo = new ValidateDataVo();
			validateDataVo.setTableName(tableNames[i].toString());
			validateDataVo.setPk(tablePks[i].toString());
			validateDataVoList.add(validateDataVo);
		}
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, String> publicParametersMap = new HashMap<>(16);
		List<Map<Object, Object>> list = validateService.validationData(validateDataVoList, publicParametersMap, true);
		resultMap.put("success", true);
		resultMap.put("msg", "接口调用成功");
		resultMap.put("result", list);
		return resultMap;
	}

	/**
	 * 单条数据校验接口
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/singleCheck")
	@ResponseBody
	public Map<String, Object> singleCheck(Page page) throws Exception {
		PageData pd = this.getPageData();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, String> publicParametersMap = new HashMap<>(16);
		List<ValidateDataVo> validateDataVoList = new ArrayList<>();
		ValidateDataVo validateDataVo = new ValidateDataVo();
		validateDataVo.setTableName(pd.getString("tableName"));
		validateDataVo.setPk(pd.getString("pk"));
		validateDataVoList.add(validateDataVo);
		validateService.validationData(validateDataVoList, publicParametersMap, false);
		List<LinkedHashMap<String, Object>> list = validateErrorMessageService
				.getValidateErrorMessage(validateDataVoList);
		resultMap.put("success", true);
		resultMap.put("msg", "接口调用成功");
		resultMap.put("result", list);
		return resultMap;
	}

	/**
	 * 获取校验错误信息接口
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/getErrorMessage")
	@ResponseBody
	public Map<String, Object> getErrorMessage(Page page) throws Exception {
		PageData pd = this.getPageData();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<ValidateDataVo> validateDataVoList = new ArrayList<>();
		ValidateDataVo validateDataVo = new ValidateDataVo();
		validateDataVo.setTableName(pd.getString("tableName"));
		validateDataVo.setPk(pd.getString("pk"));
		validateDataVoList.add(validateDataVo);
		List<LinkedHashMap<String, Object>> list = validateErrorMessageService
				.getValidateErrorMessage(validateDataVoList);
		resultMap.put("success", true);
		resultMap.put("msg", "接口调用成功");
		resultMap.put("result", list);
		return resultMap;
	}
}
