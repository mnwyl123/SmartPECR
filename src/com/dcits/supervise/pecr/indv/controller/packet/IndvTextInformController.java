package com.dcits.supervise.pecr.indv.controller.packet;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.indv.service.packet.IndvTextMsgInformManager;
import com.dcits.supervise.pecr.indv.service.packet.impl.IndvTextMsgInformDoItService;

/**
 * 个人报文逾期记录短信通知
 * 
 * @author 穆楠  
 * 
 */
@Controller
@RequestMapping("/indvTextMsgInform")
public class IndvTextInformController extends BaseController {

	@Autowired
	private IndvTextMsgInformManager textMsgInform;

	@Autowired
	private IndvTextMsgInformDoItService textMsgInformDoIt;

	/**
	 * 数据列表界面
	 * 
	 * @return
	 */
	@RequestMapping("/dataPage")
	public String dataPage() {
		return "pecr/indv/packet/IndvTextInformList";
	}

	/**
	 * 获取表格数据列表
	 * 
	 * @param page
	 * @return
	 */
	@RequestMapping("/dataList")
	@ResponseBody
	public Map<String, Object> acctInfoList(Page page) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			PageData pd = this.getPageData();
			pd.put("COMPANY", company);
			int pge = Integer.parseInt(pd.getString("page"));
			int limit = Integer.parseInt(pd.getString("limit"));
			page.setCurrentPage(pge);
			page.setShowCount(limit);
			page.setPd(pd);
			List<Map<String, Object>> dataList = textMsgInform
					.selectInformInfo(page);
			resultMap.put("data", dataList);
			resultMap.put("code", 0);
			resultMap.put("count", page.getTotalResult());
		} catch (Exception e) {
			logger.error(e.getMessage());
			resultMap.put("code", 1);
		}
		return resultMap;
	}

	/**
	 * 调用短信通知功能
	 * 
	 * @param page
	 * @return
	 */
	@RequestMapping("/generateMsgInform")
	@ResponseBody
	public Map<String, Object> generateMsgInform(Page page) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			PageData msgData = this.getPageData();

			// 查找短信信息表,如果没有发送过短信,那么发送,如果已经发送短信,那么结束
			int informCount = textMsgInform.selectInformCount(msgData);

			if (informCount == 0) {
				msgData.put("VISE_TYPE", "textMsgInform");
				List<Map<String, Object>> sendMsgPmtList = textMsgInform
						.getPecrSendMsgPmt(msgData);

				Map<String, Object> endMap = textMsgInformDoIt
						.textMsgInformProcess(textMsgInform, sendMsgPmtList,
								msgData);
				resultMap.put("success", endMap.get("success"));
				resultMap.put("message", endMap.get("message"));

			} else {
				// 获取返回结果
				resultMap.put("success", true);
				resultMap.put("message", "重复提示");
			}
			resultMap.put("success", true);
		} catch (Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
		}
		return resultMap;
	}

	/**
	 * 调用短信通知功能
	 * 
	 * @param page
	 * @return
	 */
	@RequestMapping("/copyGenerateMsgInform")
	@ResponseBody
	public Map<String, Object> copyGenerateMsgInform(Page page) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			PageData msgData = this.getPageData();

			int sendCount = textMsgInform.selectSendViewCount(msgData);

			if (sendCount == 0) {
				resultMap.put("success", false);
				resultMap.put("message", "该条报文中没有需要进行短信通知的逾期客户!");
				return resultMap;
			} else {
				textMsgInform.deleteSendTextInfo(msgData);
				msgData.put("VISE_TYPE", "textMsgInform");
				List<Map<String, Object>> sendMsgPmtList = textMsgInform
						.getPecrSendMsgPmt(msgData);

				Map<String, Object> endMap = textMsgInformDoIt
						.textMsgInformProcess(textMsgInform, sendMsgPmtList,
								msgData);

				resultMap.put("success", endMap.get("success"));
				resultMap.put("message", endMap.get("message"));
			}

			return resultMap;
		} catch (Exception e) {
			resultMap.put("success", false);
			resultMap.put("message", "重复通知短信方法错误!");
			e.printStackTrace();
		}
		return resultMap;
	}

	/**
	 * 短信通知详情页面,对固定报文发送状态进行重新通知时,先查询通知条数,用户确认操作后再进行短信通知
	 * 
	 * @param model
	 * @param cmd
	 * @param request
	 * @return
	 */

	@RequestMapping("/sendInformGivenStatusCount")
	@ResponseBody
	public Map<String, Object> sendInformGivenStatusCount(Page page) {
		Map<String, Object> modelMap = new HashMap<String, Object>();
		try {
			PageData msgData = this.getPageData();

			// 查找短信信息表,如果没有该状态的报文,前台提示没有该状态的报文
			String reportFileName = (String) msgData.get("REPORT_MESSAGE_NAME");
			String feedbackStateList = (String) msgData
					.get("SEND_FEEDBACK_STATE");

			if ((reportFileName != null) && (!reportFileName.equals(""))
					&& (feedbackStateList != null)
					&& (!feedbackStateList.equals(""))) {
				String[] feedbackStateArray = feedbackStateList.split(",");
				String stateValue = "(";
				for (int i = 0; i < feedbackStateArray.length; i++) {
					if (i != feedbackStateArray.length - 1) {
						stateValue = stateValue + "'" + feedbackStateArray[i]
								+ "',";
					} else {
						stateValue = stateValue + "'" + feedbackStateArray[i]
								+ "')";
					}
				}
				msgData.put("SEND_FEEDBACK_STATE", stateValue);
				int stateCount = textMsgInform.selectInformStateCount(msgData);
				if (stateCount <= 0) {
					modelMap.put("success", false);
					modelMap.put("message", "没有所选状态的短信条目!");
				} else {
					modelMap.put("success", true);
					modelMap.put("message", "所选状态条目为" + stateCount
							+ "条,请确认是否继续短信通知?");
				}
			} else {
				modelMap.put("success", false);
				modelMap.put("message", "调用传参空值失败!");
			}
			return modelMap;
		} catch (Exception e) {
			modelMap.put("success", false);
			modelMap.put("message", "短信特定状态通知方法错误!");
			e.printStackTrace();
		}
		return modelMap;
	}

	/**
	 * 短信通知详情页面,对固定报文的某些状态的数据进行短信通知,一般用于失败状态短信再次通知
	 * 
	 * @param model
	 * @param cmd
	 * @param request
	 * @return
	 */
	@RequestMapping("/sendInformGivenStatus")
	@ResponseBody
	public Map<String, Object> sendInformGivenStatus(Page page) {
		Map<String, Object> modelMap = new HashMap<String, Object>();
		try {
			PageData msgData = this.getPageData();
			msgData.put("VISE_TYPE", "textMsgInform");
			List<Map<String, Object>> sendMsgPmtList = textMsgInform
					.getPecrSendMsgPmt(msgData);

			Map<String, Object> endMap = textMsgInformDoIt
					.sendInformGivenStatusProcess(textMsgInform,
							sendMsgPmtList, msgData);
			modelMap.put("success", endMap.get("success"));
			modelMap.put("message", endMap.get("message"));
			return modelMap;
		} catch (Exception e) {
			modelMap.put("success", false);
			modelMap.put("message", "短信特定状态通知方法错误!");
			e.printStackTrace();
		}
		return modelMap;
	}

	/**
	 * 跳到选中报文的逾期短信通知详情页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/selectInformInfo")
	public ModelAndView selectInformInfo(Page page) {
		ModelAndView mv = this.getModelAndView();
		try {
			PageData pd = this.getPageData();
			mv.addObject("messageNamePd", pd);
			mv.setViewName("pecr/indv/packet/IndvTextInformList");
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return mv;
	}

	/**
	 * 跳到报文重发状态选择页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/showSendGivenStatus")
	public ModelAndView showSendGivenStatus(Page page) {
		ModelAndView mv = this.getModelAndView();
		try {
			PageData pd = this.getPageData();
			mv.addObject("messageNamePd", pd);
			mv.setViewName("pecr/indv/packet/showSendGivenStatus");
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return mv;
	}

}
