package com.dcits.supervise.pecr.ent.controller.dataRecode;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dcits.supervise.pecr.common.service.GenerateUUIDMapper;
import com.dcits.supervise.pecr.ent.entity.EnSecAcctInf;
import com.dcits.supervise.pecr.ent.entity.EntAcctBsSgmt;
import com.dcits.supervise.pecr.ent.service.dataRecode.EnCtrctInfoManager;
import com.dcits.supervise.pecr.ent.service.dataRecode.EnSecAcctInfManager;
import com.dcits.supervise.pecr.ent.service.dataRecode.EntLoanAcctInfoManager;
import com.dcits.supervise.pecr.ent.service.dataRecode.EntUpDaccountDataManager;
import com.dcits.supervise.pecr.indv.entity.LoanAcctBsSgmt;
import com.dcits.supervise.pecr.indv.entity.inDel;
import com.dcits.supervise.pecr.validateData.model.ValidateErrorMessage;
import com.dcits.supervise.pecr.validateData.service.ValidateErrorMessageService;
import com.alibaba.druid.support.json.JSONUtils;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.UuidUtil;
/**
 * 特殊报文按段更正控制器
 * @author wangyanaaa
 *
 */
@Controller
@RequestMapping(value = "/entUpDaccountData")
public class EntUpDaccountDataController extends BaseController{
	@Resource(name="EntUpDaccountDataService")
	private EntUpDaccountDataManager  upDaccountDataService;

	@Autowired
	private   EnCtrctInfoManager enCtrctInfoService;
	@Autowired
	private EntLoanAcctInfoManager entLoanAcctInfoService;

	@Autowired
	private EnSecAcctInfManager enSecAcctInfService;
	@Autowired
	private ValidateErrorMessageService validateErrorMessageService;
	@Autowired
	private GenerateUUIDMapper generateUUIDService;
		/**
		 * 获取授信 页面
		 * @return
		 */
		@RequestMapping("/entProtocolChange")
		public String entProtocolChange() {
			return "pecr/ent/dataRecode/entProtocolChange";
		}
		
	    /**
	     * 获取按段更正表格数据列表
	     * @param page
	     * @return
	     */
	    @RequestMapping("/ctrctChangeBsSgmtList")
	    @ResponseBody
	    public Map<String, Object> ctrctChangeBsSgmtList(Page page){
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
	            List<Map<String, Object>> dataList = enCtrctInfoService.getCtrctChangeBsSgmtList(page);
	            resultMap.put("data", dataList);
	            resultMap.put("code", 0);
	            resultMap.put("count", page.getTotalResult());
	        }catch(Exception e) {
	            logger.error(e.getMessage(),e);
	            resultMap.put("code", 1);
	        }
	        return resultMap;
	    }
		
		
		/**
		 * 获取企业授信按段更正数据
		 * @param page
		 * @return
		 */
		@RequestMapping("/selectEntProtocolChangeEdit")
		@ResponseBody
		public Map<String, Object> selectEntProtocolChangeEdit(Page page){
			Map<String, Object> resultMap = new HashMap<String, Object>();
			Map<String, Object> map = new HashMap<String, Object>();
			Session session = Jurisdiction.getSession();
			User user = (User)session.getAttribute(Const.SESSION_USER);
			String company = user.getCOMPANY();
			try {
				PageData pd = this.getPageData();
				pd.put("COMPANY", company);
				page.setPd(pd);
				String mdfcSgmtCode = pd.getString("mdfcSgmtCode");
				String oldEgaCtrctBsSgmtId = pd.getString("id");
				String egaCtrctBsSgmtId = generateUUIDService.generateUUID(page);
				map.put("COMPANY", company);
				map.put("mdfcSgmtCode", mdfcSgmtCode);
				map.put("oldEgaCtrctBsSgmtId",oldEgaCtrctBsSgmtId);
				map.put("egaCtrctBsSgmtId", egaCtrctBsSgmtId);
				map.put("operator_user", user.getUSERNAME());
				enCtrctInfoService.saveCtrctBsSgmt(map);
				if(mdfcSgmtCode.equals("C")){
					enCtrctInfoService.saveCertRelSgmt(map);
				}
				if(mdfcSgmtCode.equals("D")){
					enCtrctInfoService.saveCreditLimSgmt(map);
				}
				resultMap.put("success", true);
				resultMap.put("code", 0);
				resultMap.put("count", page.getTotalResult());
			}catch(Exception e) {
				logger.error(e.getMessage());
				resultMap.put("code", 1);
			}
			return resultMap;
		}
		/**
		 * 获取授信新增 页面
		 * @return
		 */
		@RequestMapping("/entProtocolChangeEdit")
		 public ModelAndView dataProDetail(Page page) {
	        ModelAndView mv = this.getModelAndView();
	        Session session = Jurisdiction.getSession();
			User user = (User)session.getAttribute(Const.SESSION_USER);
			String company = user.getCOMPANY();
	        try {
	            PageData pd = this.getPageData();
	            pd.put("COMPANY", company);
	            String addOrUpdate = pd.getString("addOrUpdate");
	            if (addOrUpdate != null) {
	                Map<String, Object> ctrctBsSgmt = enCtrctInfoService.getCtrctBsSgmtById(pd);
	                PageData creditLimSgmt = enCtrctInfoService.getCreditLimSgmtById(pd);
	                String PK = pd.getString("egaCtrctBsSgmtId");
					List<ValidateErrorMessage> validateErrors  = validateErrorMessageService.selectErrorMessageByMasterTablePK(PK);
	                mv.addObject("ctrctBsSgmt", JSONUtils.toJSONString(ctrctBsSgmt));
	                mv.addObject("creditLimSgmt", JSONUtils.toJSONString(creditLimSgmt));
	                mv.addObject("feedBackErrorSgmt", validateErrors);
	            }
	            mv.addObject("pd", pd);
	        } catch (Exception e) {
	            logger.error(e.getMessage());
	        }
	        mv.setViewName("pecr/ent/dataRecode/entProtocolChangeEdit");
	        return mv;
	    }
		/**
		 * 获取借贷表格数据列表
		 * @param page
		 * @return
		 */
		@RequestMapping("/loanList")
		@ResponseBody
		public Map<String, Object> acctInfoList(Page page){
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
				List<EntAcctBsSgmt> dataList = entLoanAcctInfoService.getUpLoanAcctBsSgmtList(page);
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
		 * 获取企业借贷按段更正数据
		 * @param page
		 * @return
		 */
		@RequestMapping("/selectEntLoanChangeEdit")
		@ResponseBody
		public Map<String, Object> selectEntLoanChangeEdit(Page page){
			Map<String, Object> resultMap = new HashMap<String, Object>();
			Map<String, Object> map = new HashMap<String, Object>();
			Session session = Jurisdiction.getSession();
			User user = (User)session.getAttribute(Const.SESSION_USER);
			String company = user.getCOMPANY();
			try {
				PageData pd = this.getPageData();
				pd.put("COMPANY", company);
				page.setPd(pd);
				String mdfcSgmtCode = pd.getString("mdfcSgmtCode");
				String oldEdaAcctBsSgmtId = pd.getString("id");
				String edaAcctBsSgmtId = generateUUIDService.generateUUID(page);
				map.put("mdfcSgmtCode", mdfcSgmtCode);
				map.put("oldEdaAcctBsSgmtId", oldEdaAcctBsSgmtId);
				map.put("edaAcctBsSgmtId", edaAcctBsSgmtId);
				map.put("COMPANY",company);
				map.put("operator_user", user.getUSERNAME());
				entLoanAcctInfoService.saveAcctBsSgmt(map);
				if(mdfcSgmtCode.equals("C")){
					entLoanAcctInfoService.saveAcctBsInfoSgmt(map);
				}
				if(mdfcSgmtCode.equals("D")){
					entLoanAcctInfoService.saveRltRepymtInf(map);
				}
				if(mdfcSgmtCode.equals("E")){
					entLoanAcctInfoService.saveMccInf(map);
				}
				if(mdfcSgmtCode.equals("F")){
					entLoanAcctInfoService.saveAcctCredSgmt(map);
				}
				if(mdfcSgmtCode.equals("G")){
					entLoanAcctInfoService.saveOcInfSgmt(map);
				}
				if(mdfcSgmtCode.equals("H")){
					entLoanAcctInfoService.saveLbltyInfSgmt(map);
				}
				if(mdfcSgmtCode.equals("I")){
					entLoanAcctInfoService.saveTrstDspn(map);
				}
				resultMap.put("success", true);
				resultMap.put("code", 0);
				resultMap.put("count", page.getTotalResult());
			}catch(Exception e) {
				logger.error(e.getMessage());
				resultMap.put("code", 1);
			}
			return resultMap;
		}

		/**
		 * 获取担保 页面
		 * @return
		 */
		@RequestMapping("/entGuaranteeChange")
		public String entGuaranteeChange() {
			return "pecr/ent/dataRecode/entGuaranteeChange";
		}
		
		
		/**
		 * 获取表格按段更正数据列表
		 * @param page
		 * @return
		 */
		@RequestMapping("/entGuaranteeChangeLists")
		@ResponseBody
		public Map<String, Object> entGuaranteeChangeLists(Page page){
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
				List<EnSecAcctInf> dataList = enSecAcctInfService.getEnList(page);
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
		 * 获取企业担保按按段更正数据
		 * @param page
		 * @return
		 */
		@RequestMapping("/selectEntGuaranteeChangeEdit")
		@ResponseBody
		public Map<String, Object> selectEntGuaranteeChangeEdit(Page page){
			Map<String, Object> resultMap = new HashMap<String, Object>();
			Map<String, Object> map = new HashMap<String, Object>();
			Session session = Jurisdiction.getSession();
			User user = (User)session.getAttribute(Const.SESSION_USER);
			String company = user.getCOMPANY();
			try {
				PageData pd = this.getPageData();
				pd.put("COMPANY", company);
				page.setPd(pd);
				String mdfcSgmtCode = pd.getString("mdfcSgmtCode");
				String oldEeaGuarAcctBsSgmtId = pd.getString("id");
				String eeaGuarAcctBsSgmtId = generateUUIDService.generateUUID(page);
				map.put("mdfcSgmtCode", mdfcSgmtCode);
				map.put("oldEeaGuarAcctBsSgmtId", oldEeaGuarAcctBsSgmtId);
				map.put("eeaGuarAcctBsSgmtId", eeaGuarAcctBsSgmtId);
				map.put("COMPANY", company);
				map.put("operator_user", user.getUSERNAME());
				enSecAcctInfService.saveEnSecAcctInf(map);
				if(mdfcSgmtCode.equals("C")){
					enSecAcctInfService.saveGuarAcctBsInfSgmt(map);
				}
				if(mdfcSgmtCode.equals("D")){
					enSecAcctInfService.saveRepymtInfSgmt(map);
				}
				if(mdfcSgmtCode.equals("E")){
					enSecAcctInfService.saveRltRepymtInf(map);
				}
				if(mdfcSgmtCode.equals("F")){
					enSecAcctInfService.saveMccInf(map);
				}
				if(mdfcSgmtCode.equals("G")){
					enSecAcctInfService.saveAcctCredSgmt(map);
				}
				resultMap.put("success", true);
				resultMap.put("code",0);
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
		@RequestMapping("/entGuaranteeChangeEdit")
		public ModelAndView baseDataDetail(Page page) {
			ModelAndView mv = this.getModelAndView();
			Session session = Jurisdiction.getSession();
			User user = (User)session.getAttribute(Const.SESSION_USER);
			String company = user.getCOMPANY();
			try {
				PageData pd = this.getPageData();
				pd.put("COMPANY", company);
				String addOrUpdate = pd.getString("addOrUpdate");
				if(addOrUpdate != null){
					//基础段
					Map<String, Object> enSecAcctInf = enSecAcctInfService.getenSecAcctInfById(pd);
					//基本信息段
					PageData guarAcctBsInfSgmt = enSecAcctInfService.getGuarAcctBsInfSgmtById(pd);
					//账户信息授信额度信息段
					PageData acctCredSgmt = enSecAcctInfService.getacctCredSgmtById(pd);
					//在保责任信息段
					PageData repymtInfSgmt = enSecAcctInfService.getRepymtInfSgmtById(pd);
					String PK = pd.getString("eeaGuarAcctBsSgmtId");
					List<ValidateErrorMessage> validateErrors  = validateErrorMessageService.selectErrorMessageByMasterTablePK(PK);
					mv.addObject("enSecAcctInf", JSONUtils.toJSONString(enSecAcctInf));
					mv.addObject("guarAcctBsInfSgmt", JSONUtils.toJSONString(guarAcctBsInfSgmt));
					mv.addObject("acctCredSgmt", JSONUtils.toJSONString(acctCredSgmt));
					mv.addObject("repymtInfSgmt", JSONUtils.toJSONString(repymtInfSgmt));
					mv.addObject("feedBackErrorSgmt", validateErrors);
				}
				mv.addObject("pd", pd);
			}catch(Exception e) {
				logger.error(e.getMessage());
			}
			mv.setViewName("pecr/ent/dataRecode/entGuaranteeChangeEdit");
			return mv;
		}
		/**
		 * 获取借贷 页面
		 * @return
		 */
		@RequestMapping("/entLoanChangeList")
		public String entLoanChange() {
			return "pecr/ent/dataRecode/entLoanChangeList";
			
		}
		
		/**
		 * 
		 * 获取新增、修改或者详情页面，以标识区分，前端进行样式控制
		 * 
		 * @param page
		 * @return
		 */
		@RequestMapping("/entLoanChangeEdit")
		public ModelAndView loanDataDetail(Page page) {
			ModelAndView mv = this.getModelAndView();
			Session session = Jurisdiction.getSession();
			User user = (User)session.getAttribute(Const.SESSION_USER);
			String company = user.getCOMPANY();
			try {
				PageData pd = this.getPageData();
				pd.put("COMPANY", company);
				String addOrUpdate = pd.getString("addOrUpdate");
				if(addOrUpdate != null){
					//基础段
					Map<String, Object> acctBsSgmt = entLoanAcctInfoService.getAcctBsSgmtById(pd);
					//基本信息段
					PageData acctBsInfSgmt = entLoanAcctInfoService.getAcctBsInfSgmtById(pd);
					//授信额度信息段
					PageData acctCredSgmt = entLoanAcctInfoService.getAcctCredSgmtById(pd);
					//初始债权说明段
					PageData creditorInfSgmt = entLoanAcctInfoService.getCreditorInfSgmtById(pd);
					//还款表现信息段
					PageData lbltyInfSgmt = entLoanAcctInfoService.getLbltyInfSgmtById(pd);
					String PK = pd.getString("edaAcctBsSgmtId");
					
					List<ValidateErrorMessage> validateErrors  = validateErrorMessageService.selectErrorMessageByMasterTablePK(PK);
					mv.addObject("acctBsSgmt", JSONUtils.toJSONString(acctBsSgmt));
					mv.addObject("acctBsInfSgmt", JSONUtils.toJSONString(acctBsInfSgmt));
					mv.addObject("acctCredSgmt", JSONUtils.toJSONString(acctCredSgmt));
					mv.addObject("creditorInfSgmt", JSONUtils.toJSONString(creditorInfSgmt));
					mv.addObject("lbltyInfSgmt", JSONUtils.toJSONString(lbltyInfSgmt));
					mv.addObject("feedBackErrorSgmt", validateErrors);
				}
				mv.addObject("pd", pd);
			}catch(Exception e) {
				logger.error(e.getMessage());
			}
			mv.setViewName("pecr/ent/dataRecode/entLoanChangeEdit");
			return mv;
		}
		
		
		/**
		 * 获取D1 页面
		 * @return
		 */
		@RequestMapping("/entLoanChangeEditD1")
		public String entLoanChangeEditD1() {
			return "pecr/ent/dataRecode/entLoanChangeEditD1";
		}
		
		/**
		 * 获取D2 页面
		 * @return
		 */
		@RequestMapping("/entLoanChangeEditD2")
		public String entLoanChangeEditD2() {
			return "pecr/ent/dataRecode/entLoanChangeEditD2";
		}
		/**
		 * 获取R1 页面
		 * @return
		 */
		@RequestMapping("/entLoanChangeEditR1")
		public String entLoanChangeEditR1() {
			return "pecr/ent/dataRecode/entLoanChangeEditR1";
		}
		/**
		 * 获取R4 页面
		 * @return
		 */
		@RequestMapping("/entLoanChangeEditR4")
		public String entLoanChangeEditR4() {
			return "pecr/ent/dataRecode/entLoanChangeEditR4";
		}
		/**
		 * 获取C1 页面
		 * @return
		 */
		@RequestMapping("/entLoanChangeEditC1")
		public String entLoanChangeEditC1() {
			return "pecr/ent/dataRecode/entLoanChangeEditC1";
		}
		
		
		/**
		 * 去企业借贷交易查询页面
		 * @return
		 */
		@RequestMapping("/goEntLoanSearch")
		public String goEntLoanSearch() {
			return "pecr/ent/dataRecode/entLoanSearch";
		}
		
		
		/**
		 * 根据账户标识码和待更正段获取其对应的上报历史信息
		 * @param page
		 * @return
		 */
		@RequestMapping("/getHistEntAcctLists")
		@ResponseBody
		public Map<String, Object> getHistEntAcctLists(Page page){
			Map<String, Object> resultMap = new HashMap<String, Object>();
			Session session = Jurisdiction.getSession();
			User user = (User)session.getAttribute(Const.SESSION_USER);
			String company = user.getCOMPANY();
			PageData pd = this.getPageData();
			pd.put("COMPANY", company);
			int pge = Integer.parseInt(pd.getString("page"));
			int limit = Integer.parseInt(pd.getString("limit"));
			page.setCurrentPage(pge);
			page.setShowCount(limit);
			try {
				page.setPd(pd);
				List<PageData> lists = entLoanAcctInfoService.findHistEntAcctList(page);
				resultMap.put("data", lists);
				resultMap.put("code", 0);
				resultMap.put("count", page.getTotalResult());
			} catch (Exception e) {
				logger.error("借贷按段更正：根据前端获取的账户标识码，待更正段段标，去查询对应的历史数据异常。", e);
				resultMap.put("code", 1);
			}
			return resultMap;
		}
		
		
		/**
		 * 去企业授信协议查询页面
		 * @return
		 */
		@RequestMapping("/goEntProtocolSearch")
		public String goEntProtocolSearch() {
			return "pecr/ent/dataRecode/entProtocolSearch";
		}
		
		
		/**
		 * 根据账户标识码和待更正段获取其对应的上报历史信息
		 * @param page
		 * @return
		 */
		@RequestMapping("/getHistEntProtocolLists")
		@ResponseBody
		public Map<String, Object> getHistEntProtocolLists(Page page){
			Map<String, Object> resultMap = new HashMap<String, Object>();
			Session session = Jurisdiction.getSession();
			User user = (User)session.getAttribute(Const.SESSION_USER);
			String company = user.getCOMPANY();
			PageData pd = this.getPageData();
			pd.put("COMPANY", company);
			int pge = Integer.parseInt(pd.getString("page"));
			int limit = Integer.parseInt(pd.getString("limit"));
			page.setCurrentPage(pge);
			page.setShowCount(limit);
			try {
				page.setPd(pd);
				List<PageData> lists = enCtrctInfoService.findHistEntProtocolList(page);
				resultMap.put("data", lists);
				resultMap.put("code", 0);
				resultMap.put("count", page.getTotalResult());
			} catch (Exception e) {
				logger.error("授信按段更正：根据前端获取的授信协议标识码，待更正段段标，去查询对应的历史数据异常。", e);
				resultMap.put("code", 1);
			}
			return resultMap;
		}
		
		
		/**
		 * 去企业担保交易查询页面
		 * @return
		 */
		@RequestMapping("/goEntGuaranteeSearch")
		public String goEntGuaranteeSearch() {
			return "pecr/ent/dataRecode/entGuaranteeSearch";
		}
		
		
		/**
		 * 根据账户标识码和待更正段获取其对应的上报历史信息
		 * @param page
		 * @return
		 */
		@RequestMapping("/getHistEntGuaranteeLists")
		@ResponseBody
		public Map<String, Object> getHistEntGuaranteeLists(Page page){
			Map<String, Object> resultMap = new HashMap<String, Object>();
			Session session = Jurisdiction.getSession();
			User user = (User)session.getAttribute(Const.SESSION_USER);
			String company = user.getCOMPANY();
			PageData pd = this.getPageData();
			pd.put("COMPANY", company);
			int pge = Integer.parseInt(pd.getString("page"));
			int limit = Integer.parseInt(pd.getString("limit"));
			page.setCurrentPage(pge);
			page.setShowCount(limit);
			try {
				page.setPd(pd);
				List<PageData> lists = enSecAcctInfService.findHistEntGuaranteeList(page);
				resultMap.put("data", lists);
				resultMap.put("code", 0);
				resultMap.put("count", page.getTotalResult());
			} catch (Exception e) {
				logger.error("授信按段更正：根据前端获取的担保交易标识码，待更正段段标，去查询对应的历史数据异常。", e);
				resultMap.put("code", 1);
			}
			return resultMap;
		}
}

