package com.dcits.supervise.pecr.feedbackreport;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.feedbackreport.entity.FeedBackReportErrorMessage;
import com.dcits.supervise.pecr.feedbackreport.service.FeedbackMessageManager;


/**
 * 报文反馈信息详情
 * @author zhanggym
 *
 */
@Controller
@RequestMapping("/feedbackMessage")
public class FeedbackMessageController extends BaseController{
		
	
	@Autowired
	private FeedbackMessageManager feedbackMessage;
	
	/**
	 * 数据列表界面
	 * @return
	 */
	@RequestMapping("/dataPage")
	public String dataPage() {
		return "pecr/indv/packet/feedbackShow";
	}
	
	
	@RequestMapping("/dataErrorInfoPage")
	public String dataErrorInfoPage() {
		return "pecr/indv/packet/feedbackShowList";
	}
	
	
	/**
	 * 获取表格数据列表
	 * @param page
	 * @return
	 */
	@RequestMapping("/dataList")
	@ResponseBody
	public Map<String, Object> dataList(Page page){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			PageData pd = this.getPageData();
			//做默认值处理
			if(pd.get("isCheck") == null || "".equals(pd.get("isCheck").toString())){
				pd.put("isCheck", "1");
			}
			pd.put("COMPANY", company);
			int pge = Integer.parseInt(pd.getString("page"));
			int limit = Integer.parseInt(pd.getString("limit"));
			page.setCurrentPage(pge);
			page.setShowCount(limit);
			page.setPd(pd);
			List<Map<String, String>> dataList = feedbackMessage.getFeedbackReportNameList(page);
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
	 * 获取表格数据列表
	 * @param page
	 * @return
	 */
	@RequestMapping("/dataErrorList")
	@ResponseBody
	public Map<String, Object> dataErrorList(Page page){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			PageData pd = this.getPageData();
			pd.put("COMPANY", company);
			Boolean flag = (Boolean) session.getAttribute(user.getUSER_ID()+"isCompany");
			pd.put("managerId",flag?"":user.getUSERNAME());
			int pge = Integer.parseInt(pd.getString("page"));
			int limit = Integer.parseInt(pd.getString("limit"));
			page.setCurrentPage(pge);
			page.setShowCount(limit);
			page.setPd(pd);
			List<Map<String, Object>> dataList = feedbackMessage.getFeedbackMsgList(page);
			resultMap.put("data", dataList);
			resultMap.put("code", 0);
			resultMap.put("count", page.getTotalResult());
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("code", 1);
		}
		return resultMap;
	}
	
	@RequestMapping(value="/getFeedBackMessage")
	@ResponseBody
	public Map<String, Object> getFeedBackMessage(Page page) {
		Map<String, Object> map = new HashMap<>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		StringBuffer sb = new StringBuffer();
		PageData pd = this.getPageData();
		Map<String, Object> conditionMap = new HashMap<>();
		conditionMap.put("pk", pd.get("pk").toString());
		conditionMap.put("COMPANY",company);
		List<FeedBackReportErrorMessage> list = new ArrayList<>();
		try {
			list = feedbackMessage.getFeedBackErrorMessageByPk(conditionMap);
			if(list.size()>0){
				for (FeedBackReportErrorMessage feedBackReportErrorMessage : list) {
					sb.append(feedBackReportErrorMessage.getErrorMessage());
					sb.append(";");
				}
			}
			map.put("success", true);
			map.put("msg", "获取反馈回执信息成功");
			map.put("errorData", sb.toString());
		} catch (Exception e) {
			logger.error(e.getMessage());
			map.put("success", false);
			map.put("msg", "获取反馈回执信息失败");
			map.put("errorData", null);
			return map;
		}
		return map;
	}
	
}
