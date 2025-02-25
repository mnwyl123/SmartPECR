package com.dcits.supervise.pecr.ent.controller.dataRecode;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.session.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dcits.supervise.pecr.ent.service.dataRecode.EntDelaccountDataManager;
import com.dcits.supervise.pecr.indv.entity.inDel;
import com.dcits.supervise.pecr.log.Operate;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;

@Controller
@RequestMapping(value = "/entDelAccount")
public class EntDelAccountDataController extends BaseController {
	@Resource(name = "EntDelAccountDataService")
	private EntDelaccountDataManager delAccountDataService;
	/**
	 * 数据列表界面
	 * @return
	 */
	@RequestMapping("/dataPage")
	public String dataPage() {
		return "pecr/ent/dataRecode/entDelAccountData_list";
	}
	

	@RequestMapping(value = "/delaccountdataList")
	@ResponseBody
	public Map<String, Object> listDelaccountData(Page page,HttpServletRequest request) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			PageData pd = this.getPageData();
			pd.put("COMPANY",company);
			pd.put("queryType", "APPLY");
			int pge = Integer.parseInt(pd.getString("page"));
			int limit = Integer.parseInt(pd.getString("limit"));
			page.setCurrentPage(pge);
			page.setShowCount(limit);
			page.setPd(pd);
			List<inDel> delaccountDataList = delAccountDataService.listDelaccountData(page);
			resultMap.put("data", delaccountDataList);
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
	@Operate(modulName = "企业按段删除请求记录--新增/修改")
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
				if(pd.get("infRecType").equals("413")) {
					delAccountDataService.saveLoan(pd);
				}else if(pd.get("infRecType").equals("443")) {
					delAccountDataService.saveGua(pd);
				}else if(pd.get("infRecType").equals("423")) {
					delAccountDataService.savePro(pd);
				}else if(pd.get("infRecType").equals("444")) {
					delAccountDataService.saveGuaEnt(pd);
				}else if(pd.get("infRecType").equals("414")) {
					delAccountDataService.saveLoanEnt(pd);
				}else if(pd.get("infRecType").equals("424")) {
					delAccountDataService.saveProEnt(pd);
				}else if(pd.get("infRecType").equals("314")) {
					delAccountDataService.saveBsEnt(pd);
				}else if(pd.get("infRecType").equals("614")) {
					delAccountDataService.saveBlanceEnt(pd);
				}else if(pd.get("infRecType").equals("624")) {
					delAccountDataService.saveInComeEnt(pd);
				}else if(pd.get("infRecType").equals("634")) {
					delAccountDataService.saveCashEnt(pd);
				}else if(pd.get("infRecType").equals("644")) {
					delAccountDataService.saveAssetsEnt(pd);
				}else if(pd.get("infRecType").equals("654")) {
					delAccountDataService.saveInOutEnt(pd);
				}
			}else {
				if(pd.get("infRecType").equals("413")) {
					delAccountDataService.updateLoan(pd);
				}else if(pd.get("infRecType").equals("443")) {
					delAccountDataService.updateGua(pd);
				}else if(pd.get("infRecType").equals("423")) {
					delAccountDataService.updatePro(pd);
				}else if(pd.get("infRecType").equals("444")) {
					delAccountDataService.updateGuaEnt(pd);
				}else if(pd.get("infRecType").equals("414")) {
					delAccountDataService.updateLoanEnt(pd);
				}else if(pd.get("infRecType").equals("424")) {
					delAccountDataService.updateProEnt(pd);
				}else if(pd.get("infRecType").equals("314")) {
					delAccountDataService.updateBsEnt(pd);
				}else if(pd.get("infRecType").equals("614")) {
					delAccountDataService.updateBlanceEnt(pd);
				}else if(pd.get("infRecType").equals("624")) {
					delAccountDataService.updateInComeEnt(pd);
				}else if(pd.get("infRecType").equals("634")) {
					delAccountDataService.updateCashEnt(pd);
				}else if(pd.get("infRecType").equals("644")) {
					delAccountDataService.updateAssetsEnt(pd);
				}else if(pd.get("infRecType").equals("654")) {
					delAccountDataService.updateInOutEnt(pd);
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
	 * @param page
	 * @return
	 */
	@Operate(modulName = "企业按段删除请求记录--删除")
	@RequestMapping(value = "/delete")
	@ResponseBody
	public Object delData(Page page) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("success", true);
		Session session = Jurisdiction.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			PageData pd = this.getPageData();
			pd.put("COMPANY", company);
			if(pd.get("infRecType").equals("413")) {
				delAccountDataService.delLoan(pd);
			}else if(pd.get("infRecType").equals("443")) {
				delAccountDataService.delGua(pd);
			}else if(pd.get("infRecType").equals("423")) {
				delAccountDataService.delPro(pd);
			}else if(pd.get("infRecType").equals("444")) {
				delAccountDataService.delGuaEnt(pd);
			}else if(pd.get("infRecType").equals("414")) {
				delAccountDataService.delLoanEnt(pd);
			}else if(pd.get("infRecType").equals("424")) {
				delAccountDataService.delProEnt(pd);
			}else if(pd.get("infRecType").equals("314")) {
				delAccountDataService.delBsEnt(pd);
			}else if(pd.get("infRecType").equals("614")) {
				delAccountDataService.delBlanceEnt(pd);
			}else if(pd.get("infRecType").equals("624")) {
				delAccountDataService.delInComeEnt(pd);
			}else if(pd.get("infRecType").equals("634")) {
				delAccountDataService.delCashEnt(pd);
			}else if(pd.get("infRecType").equals("644")) {
				delAccountDataService.delAssetsEnt(pd);
			}else if(pd.get("infRecType").equals("654")) {
				delAccountDataService.delInOutEnt(pd);
			}
		} catch (Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
		}
		return resultMap;
	}
}
