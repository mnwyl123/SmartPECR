package com.dcits.supervise.pecr.motga.controller;

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
import com.dcits.supervise.pecr.ent.entity.MotgaCltalCtrctBsSgmt;
import com.dcits.supervise.pecr.ent.service.dataRecode.MoDelManager;
import com.dcits.supervise.pecr.log.Operate;

@Controller
@RequestMapping("/moDel")
public class MoDelController extends BaseController {
	
	@Autowired
	private MoDelManager motgaCltalBsInfoService;
	
	/**
	 * 数据列表界面
	 * @return
	 */
	@RequestMapping("/dataPage")
	public ModelAndView dataPage(Page page) {
		//PageData pd = this.getPageData();
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("pecr/mortgage/moDel");
		return mv;
	}
	
	/**
	 * 删除 列表数据
	 * @param page
	 * @return
	 */
	@Operate(modulName = "抵质押合同信息整笔删除")
	@RequestMapping("/delMotgaContractInfo") 
	@ResponseBody
	public Map<String, Object> delMotgaContractInfo(Page page){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			PageData pd = this.getPageData();
			pd.put("COMPANY", company);
			motgaCltalBsInfoService.deleteMotgaCltalBsSgmt(pd);
			resultMap.put("success", true);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
		}
		return resultMap;
	}
	
	/**
	 * 获取表格数据列表
	 * @param page
	 * @return
	 */
	@RequestMapping("/motgaContractInfoList")
	@ResponseBody
	public Map<String, Object> motgaContractInfoList(Page page){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			PageData pd = this.getPageData();
			pd.put("COMPANY", company);
			pd.put("queryType", "APPLY");
			int pge = Integer.parseInt(pd.getString("page"));
			int limit = Integer.parseInt(pd.getString("limit"));
			page.setCurrentPage(pge);
			page.setShowCount(limit);
			page.setPd(pd);
			List<MotgaCltalCtrctBsSgmt> dataList = motgaCltalBsInfoService.getMotgaContractInfoList(page);
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
	 *     新增或修改数据
	 */
	@Operate(modulName = "新增/修改抵质押合同整笔删除信息")
	@RequestMapping(value = "/addOrUpdateUser")
	@ResponseBody
	public Object add(Page page) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("success", true);
		PageData pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			pd.put("operatorUser", user.getUSERNAME());	
			pd.put("COMPANY", company);
			String addOrUpdate = pd.getString("addOrUpdate");
				if("add".equalsIgnoreCase(addOrUpdate)) {
					motgaCltalBsInfoService.insertMotgaCltalInfo(pd);
				}else {
					motgaCltalBsInfoService.updateMotgaCltalInfo(pd);
				}			
		} catch (Exception e) {
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
			logger.error(e.toString(), e);
		}
		    return resultMap;
	}
	
}
