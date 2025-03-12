package com.dcits.supervise.pecr.indv.controller.dataRecode;

import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.indv.entity.Accountchange;
import com.dcits.supervise.pecr.indv.service.dataRecode.AccountChangeManager;
import org.apache.shiro.session.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 报文管理  > 标识变更数据管理&标识变更报文管理
 * @author 穆楠
 *
 */
@Controller
@RequestMapping(value = "/accountchange")
public class AccountchangeController extends BaseController {
	@Resource(name = "accountChangeService")
	private AccountChangeManager accountChangeService;
	
	/**
	 * 数据列表界面
	 * @return
	 */
	@RequestMapping("/dataPage")
	public String dataPage() {
		return "pecr/indv/dataRecode/indvAccountChangeData_list";
	}
	
	
	/**
	 * 获取标识变更列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/dataList")
	@ResponseBody
	public Map<String, Object> listSingle(Page page) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
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
			List<Accountchange> dataList = accountChangeService.listaccount(page);
			resultMap.put("data", dataList);
			resultMap.put("code", 0);
			resultMap.put("count", page.getTotalResult());
			resultMap.put("msg", "");		
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("code", 1);
		}
		
		return resultMap;
	}
	/**
	 *     新增或修改数据
	 */
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
				if(pd.get("infRecType").equals("221")) {
					accountChangeService.proAccountChange(pd);
				}else if(pd.get("infRecType").equals("231")) {
					accountChangeService.guaAccountChange(pd);
				}else if(pd.get("infRecType").equals("211")) {
					accountChangeService.loanAccountChange(pd);
				}
					
			}else {
				if(pd.get("infRecType").equals("221")) {
					accountChangeService.updatePro(pd);
				}else if(pd.get("infRecType").equals("231")) {
					accountChangeService.updateGua(pd);
				}else if(pd.get("infRecType").equals("211")) {
					accountChangeService.updateLoan(pd);
				}
			}			
		} catch (Exception e) {
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
			logger.error(e.toString(), e);
		}
		    return resultMap;
	}

	/**
	    * 删除的方法
	 */
	@RequestMapping(value = "/delete")
	@ResponseBody
	public Map<String, Object> deleteNordatagram(Page page) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		resultMap.put("success", true);
		try {
			PageData pd = this.getPageData();
			pd.put("COMPANY", company);
			if(pd.get("infRecType").equals("221")) {
				accountChangeService.deletePro(pd);
			}else if(pd.get("infRecType").equals("211")) {
				accountChangeService.deleteLoan(pd);
			}else if(pd.get("infRecType").equals("231")) {
				accountChangeService.deleteGua(pd);
			}
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
		}
		return resultMap;
	}
}
