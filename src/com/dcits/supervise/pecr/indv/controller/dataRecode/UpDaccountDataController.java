package com.dcits.supervise.pecr.indv.controller.dataRecode;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dcits.supervise.pecr.indv.entity.LoanAcctBsSgmt;
import com.dcits.supervise.pecr.indv.service.dataRecode.LoanAcctInfoManager;
import com.dcits.supervise.pecr.indv.service.dataRecode.UpDaccountDataManager;
import com.dcits.supervise.pecr.log.Operate;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;
/**
 * 特殊报文按段更正控制器
 * @author 穆楠
 *
 */
@Controller
@RequestMapping(value = "/upDaccountData")
public class UpDaccountDataController extends BaseController{
	@Resource(name="upDaccountDataService")
	private UpDaccountDataManager  upDaccountDataService;
	@Autowired
	private LoanAcctInfoManager loanAcctInfoService;
		/**
		 * 数据列表界面
		 * @return
		 */
		@RequestMapping("/dataPage")
		public String dataPage() {
			return "pecr/indv/dataRecode/indvUpdAccountData_list";
		}
		
		
		/**
		 * 获取表格数据列表
		 * @param page
		 * @return
		 */
		@RequestMapping("/acctInfoList")
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
				List<LoanAcctBsSgmt> dataList = loanAcctInfoService.getLoanAcctUpdateBsSgmtList(page);
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
		@Operate(modulName = "个人特殊报文按段更正--新增/修改")
		@RequestMapping(value = "/addOrUpdateUser")
		@ResponseBody
		public Object add(Page page) {
			Map<String, Object> resultMap = new HashMap<String, Object>();
			resultMap.put("success", true);
			PageData pd = this.getPageData();
			Session session = Jurisdiction.getSession();
			User user = (User) session.getAttribute(Const.SESSION_USER);
			try {
				pd.put("operatorUser", user.getUSERNAME());			
				String addOrUpdate = pd.getString("addOrUpdate");
				if("add".equalsIgnoreCase(addOrUpdate)) {
					upDaccountDataService.inseretUpDaccountData(pd);
				}else {
					upDaccountDataService.update(pd);;
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
		@Operate(modulName = "个人借贷特殊报文按段更正--删除")
		@RequestMapping(value = "/delete")
		@ResponseBody
		public Map<String, Object> deleteNordatagram(Page page) {
			Map<String, Object> resultMap = new HashMap<String, Object>();
			resultMap.put("success", true);
			try {
				PageData pd = this.getPageData();
				upDaccountDataService.deleteUpDaccountData(pd);
			}catch(Exception e) {
				logger.error(e.getMessage());
				resultMap.put("success", false);
				resultMap.put("msg", e.getMessage());
			}
			return resultMap;
		}
	}

