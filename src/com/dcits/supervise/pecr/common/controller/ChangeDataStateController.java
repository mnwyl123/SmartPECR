package com.dcits.supervise.pecr.common.controller;

import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.common.service.ChangeDataStateService;
import com.dcits.supervise.pecr.util.PecrConstantUtil;
import com.dcits.supervise.pecr.util.ReportType;

import org.apache.shiro.session.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;


@Controller
@RequestMapping("/changeDataState")
public class ChangeDataStateController extends BaseController{

	private Logger logger = LoggerFactory.getLogger(ChangeDataStateController.class);
	@Autowired
	private ChangeDataStateService changeDataStateService;
	
	@RequestMapping(value="/changeDataStateByConditon")
	@ResponseBody
	public Map<String, Object> updateBusinessStateByCondition(Page page){
		Map<String, Object> map = new HashMap<>(5);
		PageData pd = this.getPageData();
		Map<String, Object> conditionMap = getConditionMap(pd);
		try {
			//20210307，强制提交中的方法新增逻辑，修改feed_back_report_err_message中数据的数据状态
			changeDataStateService.updateBusinessStateByCondition(conditionMap);
		} catch (Exception e) {
			logger.error(e.getMessage());
			map.put("success", false);
			map.put("msg", "操作失败");
			return map;
		}
		map.put("success", true);
		map.put("msg", "操作成功");
		return map;
	}
	
	//韦宗英
	@RequestMapping(value="/updateBaseAudit")
	@ResponseBody
	public Map<String, Object> updateBaseAudit(Page page,HttpServletRequest request){
		Map<String, Object> map = new HashMap<>(5);
		PageData pd = this.getPageData();
		String table_name = request.getParameter("table_name");
		String businessStates = request.getParameter("businessStates");
		String rejectReason = request.getParameter("rejectReason");
		String paaBsSmgtId = request.getParameter("paaBsSmgtId");
		Session session = Jurisdiction.getSession();
        User user = (User)session.getAttribute(Const.SESSION_USER);
        String company =user.getCOMPANY();
        
		
		String[] arr = paaBsSmgtId.split(",");
		Map<String, Object> conditionMap = new HashMap<>();
		conditionMap.put("company", company);
		conditionMap.put("table_name", table_name);
		conditionMap.put("businessStates", businessStates);
		conditionMap.put("rejectReason", rejectReason);
		conditionMap.put("paaBsSmgtId", paaBsSmgtId);
		try {
			for (String string : arr) {
				conditionMap.put("paaBsSmgtId", string);
				changeDataStateService.updateBaseAudit(conditionMap);
			}
		} catch (Exception e) {
			logger.error(e.getMessage());
			map.put("success", false);
			map.put("msg", "操作失败");
			return map;
		}
		map.put("success", true);
		map.put("msg", "操作成功");
		return map;
	}
	
	public Map<String, Object> getConditionMap(PageData pd){
		Map<String, Object> conditionMap = new HashMap<>();
		String type = pd.get("type").toString();
		conditionMap.put("infRecType", pd.get("infRecType"));
		conditionMap.put("rptDate", pd.get("rptDate"));
		String table_name = ReportType.getReportTypeBaseTable(pd.get("infRecType").toString());
		String primaryKey = ReportType.getReportTypePrimaryKey(pd.get("infRecType").toString());
		conditionMap.put("table_name", table_name);
		conditionMap.put("primaryKey", primaryKey);
		String str = pd.get("str").toString();
		//20210226,新增逻辑，如果str存在则优先处理str（页面选中的数据），其次再查询以日期和信息记录类型为条件查询的数据
		if(str != null && !"".equals(str)){
			if(",".equals(str.substring(str.length()-1, str.length()))){
				str=str.substring(0, str.length()-1);
			}
			String [] strs  = str.split(",");
			List<String> listPk = Arrays.asList(strs);
			conditionMap.put("listPk", listPk);
		}else{
			conditionMap.put("str", "");
		}
		
		String old_business_state = "";
		String new_business_state = "";
		switch (type) {
		case "submit":
			old_business_state=PecrConstantUtil.BUSINESS_STATUS_10;
			new_business_state=PecrConstantUtil.BUSINESS_STATUS_20;
			break;
		case "toExamine":
			old_business_state=PecrConstantUtil.BUSINESS_STATUS_20;
			new_business_state=PecrConstantUtil.BUSINESS_STATUS_100;
			break;
		case "passExamine":
			old_business_state=PecrConstantUtil.BUSINESS_STATUS_100;
			new_business_state=PecrConstantUtil.BUSINESS_STATUS_30;
			break;
		case "failExamine":
			old_business_state=PecrConstantUtil.BUSINESS_STATUS_100;
			new_business_state=PecrConstantUtil.BUSINESS_STATUS_40;
			break;
		default:
			break;
		}
		conditionMap.put("old_business_state", old_business_state);
		conditionMap.put("new_business_state", new_business_state);
		return conditionMap;
	}
}
