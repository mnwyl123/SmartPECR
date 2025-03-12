package com.dcits.supervise.pecr.ent.controller.packet;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.session.Session;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.druid.support.json.JSONUtils;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.ent.entity.IncomeAndExpenseStatementDlt;
import com.dcits.supervise.pecr.ent.service.packet.IncomeAndExpenseStatementManager;

/**
 * 事业单位收入支出表整笔删除请求记录
 * @author 穆楠
 *
 */
@Controller
@RequestMapping("/incomeAndExpenseStatementDlt")
public class IncomeAndExpenseStatementDltController extends BaseController{

	@Autowired
	private IncomeAndExpenseStatementManager incomeAndExpenseStatement;
	
	/**
	 * 数据列表界面
	 * @return
	 */
	@RequestMapping("/dataPage")
	public String dataPage() {
		return "pecr/ent/packet/incomeAndExpenseStatementDlt/incomeAndExpenseStatementDltList";
	}
	
	/**
	 * 获取表格数据列表
	 * @param page
	 * @return
	 */
	@RequestMapping("/List")
	@ResponseBody
	public Map<String, Object> acctInfoList(Page page){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			PageData pd = this.getPageData();
			int pge = Integer.parseInt(pd.getString("page"));
			int limit = Integer.parseInt(pd.getString("limit"));
			page.setCurrentPage(pge);
			page.setShowCount(limit);
			page.setPd(pd);
			List<IncomeAndExpenseStatementDlt> dataList = incomeAndExpenseStatement.getList(page);
			resultMap.put("data", dataList);
			resultMap.put("code", 0);
			resultMap.put("count", page.getTotalResult());
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("code", 1);
		}
		return resultMap;
	}
	/**
	 * 
	 * 获取新增、修改或者详情页面，以标识区分，前端进行样式控制
	 * 
	 * @param page
	 * @return
	 */
	@RequestMapping("/guarAcctInfoEdit")
	public ModelAndView dataDetail(Page page) {
		ModelAndView mv = this.getModelAndView();
		try {
			PageData pd = this.getPageData();
			String addOrUpdate = pd.getString("addOrUpdate");
			if(addOrUpdate != null && !"add".equals(addOrUpdate)){
				
				PageData acctBsSgmt = incomeAndExpenseStatement.getAcctInfSgmtById(pd);
				mv.addObject("acctBsSgmt", JSONUtils.toJSONString(acctBsSgmt));
			}
			mv.addObject("pd", pd);
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		mv.setViewName("pecr/ent/packet/incomeAndExpenseStatementDlt/incomeAndExpenseStatementDltEdit");
		return mv;
	}
	/**
	 * 基础段
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/saveAcctBsSgmt")
	@ResponseBody
	public Map<String, Object> saveAcctBsSgmt(Model model,
			HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			Session session = Jurisdiction.getSession();
			User user = (User)session.getAttribute(Const.SESSION_USER);
			String userName = user.getUSERNAME();//登录用户名
			ObjectMapper mapper = new ObjectMapper();
			String pageType = request.getParameter("pageType");
			String jsonSetMap = ServletRequestUtils.getStringParameter(request,
					"str", "");
			jsonSetMap = java.net.URLDecoder.decode(jsonSetMap, "UTF-8");
			Map<String, Object> map = mapper.readValue(jsonSetMap,Map.class);
			map.put("operationUser",userName);
			if(pageType != null && "add".equals(pageType)){
				if(incomeAndExpenseStatement.getAcctBsSgmtKey(map) > 0) {
					resultMap.put("msg", "主键重复!请将该信息删除后,重新添加数据信息!");
					resultMap.put("success", false);
				}else {
					//新增
					incomeAndExpenseStatement.insertAcctBsSgmt(map);;
				}
			}else if(pageType != null && "edit".equals(pageType)){
				//修改
				incomeAndExpenseStatement.updateAcctBsSgmt(map);
			}
			resultMap.put("success", true);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
		}
		return resultMap;
	}
	
	/**
	 * 删除
	 * @param page
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/delAcctBsSgmt") 
	@ResponseBody
	public Map<String, Object> delAcctBsSgmt(Model model,
			HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		try {
			ObjectMapper mapper = new ObjectMapper();
			String jsonSetMap = ServletRequestUtils.getStringParameter(request,
					"str", "");
			jsonSetMap = java.net.URLDecoder.decode(jsonSetMap, "UTF-8");
			Map<String, Object> map = mapper.readValue(jsonSetMap,Map.class);
			incomeAndExpenseStatement.deleteAcctBsSgmt(map);
			resultMap.put("success", true);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
		}
		return resultMap;
	}
}
