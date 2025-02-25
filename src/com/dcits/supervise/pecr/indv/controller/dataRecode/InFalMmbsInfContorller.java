package com.dcits.supervise.pecr.indv.controller.dataRecode;

import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.common.service.MiddleDataChangeService;
import com.dcits.supervise.pecr.indv.entity.InFalMmbsInf;
import com.dcits.supervise.pecr.indv.service.dataRecode.InFalMmbsInfManager;
import com.dcits.supervise.pecr.log.Operate;

import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
/**
 * 家族关系信息
 * @author leizx
 *
 */
@Controller
@RequestMapping("/inFalMmbsInf")
public class InFalMmbsInfContorller extends BaseController{

	@Autowired
	private InFalMmbsInfManager InFalMmbsInfService;
	@Autowired
	private MiddleDataChangeService middleDataChangeService;
	/**
	 * 数据列表界面
	 * @return
	 */
	@RequestMapping("/dataPage")
	public String dataPage() {
		return "pecr/indv/dataRecode/inFalMmbsInf_list";
	}
	
	/**
	 * 获取表格数据列表
	 * @param page
	 * @return
	 */
	@RequestMapping("/List")
	@ResponseBody
	public Map<String, Object> List(Page page){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			PageData pd = this.getPageData();
			pd.put("COMPANY", company);
			pd.put("queryType", "APPLY");
			Boolean flag = (Boolean) session.getAttribute(user.getUSER_ID()+"isCompany");
			pd.put("managerId",flag?"":user.getUSERNAME());
			int pge = Integer.parseInt(pd.getString("page"));
			int limit = Integer.parseInt(pd.getString("limit"));
			page.setCurrentPage(pge);
			page.setShowCount(limit);
			page.setPd(pd);
			List<InFalMmbsInf> List = InFalMmbsInfService.List(page);
			resultMap.put("data", List);
			resultMap.put("code", 0);
			resultMap.put("count", page.getTotalResult());
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("code", 1);
		}
		return resultMap;
	}
	/**
	 * 修改,新增，更新状态，根据flag判断
	 * @param page
	 * @return
	 */
	@Operate(modulName = "个人--家族关系信息--增/删/改")
	@RequestMapping("/updatedate")
	@ResponseBody
	public Map<String, Object> addOrUpdateUser(Page page){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String company = user.getCOMPANY(); 
		resultMap.put("success", true);
		try {
			PageData pd = this.getPageData();
			pd.put("COMPANY", company);
			pd.put("USERID",USERID);
			String flag = pd.getString("addOrUpdate");
			if("save".equalsIgnoreCase(flag)){ 
				InFalMmbsInfService.addData(pd);
				middleDataChangeService.changeMiddleDataMCom("120",pd.get("pajInFalMmbsInfId").toString(),"add",company);
			}
			if("delete".equalsIgnoreCase(flag)){//删除
				middleDataChangeService.changeMiddleDataMCom("120",pd.get("pajInFalMmbsInfId").toString(),"delete",company);
				InFalMmbsInfService.deleteData(pd);
			}
			if("update".equalsIgnoreCase(flag)){
				InFalMmbsInfService.updateData(pd);
				middleDataChangeService.changeMiddleDataMCom("120",pd.get("pajInFalMmbsInfId").toString(),"update",company);
			}
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
		}
		return resultMap;
	}
}
