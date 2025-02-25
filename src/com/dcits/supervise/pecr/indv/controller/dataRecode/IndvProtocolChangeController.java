package com.dcits.supervise.pecr.indv.controller.dataRecode;

import com.alibaba.druid.support.json.JSONUtils;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.FileDownload;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.PathUtil;
import com.dcits.supervise.pecr.common.service.GenerateUUIDMapper;
import com.dcits.supervise.pecr.indv.entity.GuarAcctBsSgmt;
import com.dcits.supervise.pecr.indv.entity.InCtrctInfCtrctBsSgmt;
import com.dcits.supervise.pecr.indv.entity.LoanAcctBsSgmt;
import com.dcits.supervise.pecr.indv.service.dataRecode.GuarAcctInfoManager;
import com.dcits.supervise.pecr.indv.service.dataRecode.InCtrctInfManager;
import com.dcits.supervise.pecr.indv.service.dataRecode.LoanAcctInfoManager;
import com.dcits.supervise.pecr.indv.service.dataRecode.UpDaccountDataManager;
import com.dcits.supervise.pecr.log.Operate;
import com.dcits.supervise.pecr.util.ImportExportData;
import com.dcits.supervise.pecr.validateData.model.ValidateErrorMessage;
import com.dcits.supervise.pecr.validateData.service.ValidateErrorMessageService;

import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
/**
 * 特殊报文按段更正控制器
 * @author wangyanaaa
 *
 */
@Controller
@RequestMapping(value = "/indvProtocol")
public class IndvProtocolChangeController extends BaseController{
	@Resource(name="upDaccountDataService")
	private UpDaccountDataManager  upDaccountDataService;
	@Autowired
	private InCtrctInfManager inCtrctInfService;	
	@Autowired
	private GuarAcctInfoManager guarAcctInfoService;	

	@Autowired
	private LoanAcctInfoManager loanAcctInfoService;
	@Autowired
	private ValidateErrorMessageService validateErrorMessageService;
	@Autowired
	private GenerateUUIDMapper generateUUIDService;
	
	/**
	 * 获取授信 页面
	 * @return
	 */
	@RequestMapping("/indvProtocolChange")
	public String indvProtocolChange() {
		return "pecr/indv/dataRecode/indvProtocolChange";
	}
	@RequestMapping("/ctrctList")
	@ResponseBody
	public Map<String, Object> dataCtrctBsSgmtList(Page page){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			PageData pd = this.getPageData();
			Session session = Jurisdiction.getSession();
			User user = (User)session.getAttribute(Const.SESSION_USER);
			pd.put("COMPANY", user.getCOMPANY());
			pd.put("queryType", "APPLY");
			int pge = Integer.parseInt(pd.getString("page"));
			int limit = Integer.parseInt(pd.getString("limit"));
			page.setCurrentPage(pge);
			page.setShowCount(limit);
			page.setPd(pd);
			List<InCtrctInfCtrctBsSgmt> dataCtrctBsSgmtList = inCtrctInfService.dataUpdateCtrctBsSgmtsList(page);
			resultMap.put("data", dataCtrctBsSgmtList);
			resultMap.put("code", 0);
			resultMap.put("count", page.getTotalResult());
		}catch(Exception e) {
			logger.error(e.getMessage(),e);
			resultMap.put("code", 1);
		}
		return resultMap;
	}
	/**
	 * 获取授信协议按段待更正数据并且插入更正数据
	 * @param page
	 * @return
	 */
	@RequestMapping("/selectIndvProtocolChangeEdit")
	@ResponseBody
	public Map<String, Object> selectIndvProtocolChangeEdit(Page page){
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
			String oldPcaCtrctBsSgmtId = pd.getString("pcaCtrctBsSgmtId");//获取历史表中基础段的主键
			String pcaCtrctBsSgmtId=generateUUIDService.generateUUID(page);//获取新的主键
			map.put("oldPcaCtrctBsSgmtId", oldPcaCtrctBsSgmtId);
			map.put("pcaCtrctBsSgmtId", pcaCtrctBsSgmtId);
			map.put("mdfcSgmtCode",mdfcSgmtCode);
			map.put("COMPANY", company);
			map.put("operator_user", user.getUSERNAME());
			//插入基础段信息
			inCtrctInfService.saveCtrctBsSgmt(map);
			if(mdfcSgmtCode.equals("C")){
				inCtrctInfService.addCertRelSgmt(map);
			}
			if(mdfcSgmtCode.equals("D")){
				inCtrctInfService.saveCreditLimSgmt(map);
			}
			resultMap.put("success", true);
			resultMap.put("count", page.getTotalResult());
			resultMap.put("code", 0);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("code", 1);
		}
		return resultMap;
	}
	/**
	 * 获取授信 编辑页面
	 * @return
	 */
	@RequestMapping("/indvProtocolChangeEdit")
	public ModelAndView indvProtocolChangeEdit() {
		//List<PageData> ctrctCertRelSgmtList = null;
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
				PageData CtrctBsSgmt = inCtrctInfService.getCtrctBsSgmtData(pd);
				//额度信息段
				PageData  creditLimSgmt = inCtrctInfService.getCreditLimSgmtData(pd);
				String PK = pd.getString("pcaCtrctBsSgmtId");
				List<ValidateErrorMessage> validateErrors  = validateErrorMessageService.selectErrorMessageByMasterTablePK(PK);
				mv.addObject("CtrctBsSgmt", JSONUtils.toJSONString(CtrctBsSgmt));
				mv.addObject("CreditLimSgmt", JSONUtils.toJSONString(creditLimSgmt));
				mv.addObject("feedBackErrorSgmt", validateErrors);
			}
			mv.addObject("pd", pd);
			mv.setViewName("pecr/indv/dataRecode/indvProtocolChangeEdit");
		}catch(Exception e) {
			logger.error(e.getMessage(),e);
		}
		return mv;
	}

	/**
	 * 删除 列表数据
	 * @param page
	 * @return
	 */
	@Operate(modulName = "个人特殊报文按段更正--删除")
	@RequestMapping("/delBasicsInfo") 
	@ResponseBody
	public Map<String, Object> delLoanAcctInfo(Page page){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			PageData pd = this.getPageData();
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("COMPANY", company);
			map.put("pdaGuarAcctBsSgmtId", pd.getString("pdaGuarAcctBsSgmtId"));
			guarAcctInfoService.deleteAcctBsSgmt(map);
			resultMap.put("success", true); 
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
		}
		return resultMap;
	}
	
	
	/**
	 * 获取担保表格数据列表
	 * @param page
	 * @return
	 */
	@RequestMapping("/guarList")
	@ResponseBody
	public Map<String, Object> guarList(Page page){
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
			List<GuarAcctBsSgmt> dataList = guarAcctInfoService.getGuarUpdateAcctBsSgmtList(page);
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
		 * 获取担保 页面
		 * @return
		 */
		@RequestMapping("/indvGuaranteeChange")
		public String indvGuaranteeChange() {
			return "pecr/indv/dataRecode/indvGuaranteeChange";
		}
		/**
		 * 获取个人担保按段更正数据以及插入待更正信息
		 * @param page
		 * @return
		 */
		@RequestMapping("/selectIndvGuaranteeChangeEdit")
		@ResponseBody
		public Map<String, Object> selectIndvGuaranteeChangeEdit(Page page){
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
				String oldPdaGuarAcctBsSgmtId = pd.getString("pdaGuarAcctBsSgmtId");
				String pdaGuarAcctBsSgmtId = generateUUIDService.generateUUID(page);
				map.put("mdfcSgmtCode", mdfcSgmtCode);
				map.put("oldPdaGuarAcctBsSgmtId", oldPdaGuarAcctBsSgmtId);
				map.put("pdaGuarAcctBsSgmtId", pdaGuarAcctBsSgmtId);
				map.put("COMPANY", company);
				map.put("operator_user", user.getUSERNAME());
				//新增基础段
				guarAcctInfoService.saveAcctBsSgmt(map);
				if(mdfcSgmtCode.equals("C")){
					guarAcctInfoService.saveAcctInfoSgmt(map);
				}
				if(mdfcSgmtCode.equals("D")){
					guarAcctInfoService.saveRepymtInfSgmt(map);
				}
				if(mdfcSgmtCode.equals("E")){
					guarAcctInfoService.saveRltRepymtInf(map);
				}
				if(mdfcSgmtCode.equals("F")){
					guarAcctInfoService.saveMccInf(map);
				}
				Map<String, Object> data = guarAcctInfoService.getAcctBsSgmtByIdType(pd);
				resultMap.put("data", data);
				resultMap.put("pdaGuarAcctBsSgmtId", data.get("PDA_GUAR_ACCT_BS_SGMT_ID").toString());
				resultMap.put("success", true);
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
		@RequestMapping("/indvGuaranteeChangeEdit")
		public ModelAndView Detail(Page page) {
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
					Map<String, Object> acctBsSgmt = guarAcctInfoService.getAcctBsSgmtById(pd);
					//基本信息段
					PageData acctInfSgmt = guarAcctInfoService.getAcctInfSgmtById(pd);
					//在保责任信息段
					PageData repymtInfSgmt = guarAcctInfoService.getRepymtInfSgmtById(pd);
					String PK = pd.getString("pdaGuarAcctBsSgmtId");
					List<ValidateErrorMessage> validateErrors  = validateErrorMessageService.selectErrorMessageByMasterTablePK(PK);
					mv.addObject("acctBsSgmt", JSONUtils.toJSONString(acctBsSgmt));
					mv.addObject("acctInfSgmt", JSONUtils.toJSONString(acctInfSgmt));
					mv.addObject("repymtInfSgmt", JSONUtils.toJSONString(repymtInfSgmt));
					mv.addObject("feedBackErrorSgmt", validateErrors);
				}
				mv.addObject("pd", pd);
			}catch(Exception e) {
				logger.error(e.getMessage());
			}
			mv.setViewName("pecr/indv/dataRecode/indvGuaranteeChangeEdit");
			return mv;
		}
		
		
		/**
		 * 获取借贷 页面
		 * @return
		 */
		@RequestMapping("/indvLoanChange")
		public String indvLoanChange() {
			return "pecr/indv/dataRecode/indvLoanChange";
			
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
		 * 获取借贷按段待更正数据，以及插入带更正数据
		 * @param page
		 * @return
		 */
		@RequestMapping("/selectIndvLoanChangeEdit")
		@ResponseBody
		public Map<String, Object> selectIndvLoanChangeEdit(Page page){
			Map<String, Object> resultMap = new HashMap<String, Object>();
			Map<String, Object> map = new HashMap<String, Object>();
			Session session = Jurisdiction.getSession();
			User user = (User)session.getAttribute(Const.SESSION_USER);
			String company = user.getCOMPANY();
			try {
				PageData pd = this.getPageData();
				pd.put("COMPANY", company);
				page.setPd(pd);
				String oldPbaAcctBsSgmtId = pd.getString("pbaAcctBsSgmtId");
				String mdfcSgmtCode = pd.getString("mdfcSgmtCode");
				String pbaAcctBsSgmtId = generateUUIDService.generateUUID(page);
				map.put("mdfcSgmtCode", mdfcSgmtCode);
				map.put("oldPbaAcctBsSgmtId", oldPbaAcctBsSgmtId);
				map.put("pbaAcctBsSgmtId", pbaAcctBsSgmtId);
				map.put("COMPANY", company);
				map.put("operator_user", user.getUSERNAME());
				//插入基础信息
				loanAcctInfoService.saveAcctBsSgmt(map);
				if(mdfcSgmtCode.equals("C")){
					loanAcctInfoService.saveAcctBsInfoSgmt(map);
				}
				if(mdfcSgmtCode.equals("D")){
					loanAcctInfoService.saveRltRepymtInf(map);
				}
				if(mdfcSgmtCode.equals("E")){
					loanAcctInfoService.saveMccInf(map);
				}
				if(mdfcSgmtCode.equals("F")){
					loanAcctInfoService.saveAcctCredSgmt(map);
				}
				if(mdfcSgmtCode.equals("G")){
					loanAcctInfoService.saveOcInfSgmt(map);
				}
				if(mdfcSgmtCode.equals("H")){
					loanAcctInfoService.saveAmblgInfSgmt(map);
				}
				if(mdfcSgmtCode.equals("I")){
					loanAcctInfoService.saveSpecPrdSgmt(map);
				}
				if(mdfcSgmtCode.equals("J")){
					loanAcctInfoService.saveAcctDbtInfSgmt(map);
				}
				if(mdfcSgmtCode.equals("K")){
					loanAcctInfoService.saveTrstDspn(map);
				}
				resultMap.put("count", page.getTotalResult());
				resultMap.put("code", 0);
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
		@RequestMapping("/indvLoanChangeEdit")
		public ModelAndView dataDetail(Page page) {
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
					Map<String, Object> acctBsSgmt = loanAcctInfoService.getAcctBsSgmtById(pd);
					//基本信息段
					PageData acctBsInfSgmt = loanAcctInfoService.getAcctBsInfSgmtById(pd);
					//授信额度信息段
					PageData acctCredSgmt = loanAcctInfoService.getAcctCredSgmtById(pd);
					//初始债权说明段
					PageData ocInfoSgmt = loanAcctInfoService.getOcInfoSgmtById(pd);
					//月度表现信息段
					PageData amblgInfoSgmt = loanAcctInfoService.getAmblgInfoSgmtById(pd);
					//大额专项分期信息段
					PageData specPrdSgmt = loanAcctInfoService.getSpecPrdSgmtById(pd);
					//非月度表现信息段
					PageData acctDbtInfSgmt = loanAcctInfoService.getAcctDbtInfSgmtById(pd);
					String PK = pd.getString("pbaAcctBsSgmtId");
					
					List<ValidateErrorMessage> validateErrors  = validateErrorMessageService.selectErrorMessageByMasterTablePK(PK);
					mv.addObject("acctBsSgmt", JSONUtils.toJSONString(acctBsSgmt));
					mv.addObject("acctBsInfSgmt", JSONUtils.toJSONString(acctBsInfSgmt));
					mv.addObject("acctCredSgmt", JSONUtils.toJSONString(acctCredSgmt));
					mv.addObject("ocInfoSgmt", JSONUtils.toJSONString(ocInfoSgmt));
					mv.addObject("amblgInfoSgmt", JSONUtils.toJSONString(amblgInfoSgmt));
					mv.addObject("specPrdSgmt", JSONUtils.toJSONString(specPrdSgmt));
					mv.addObject("acctDbtInfSgmt", JSONUtils.toJSONString(acctDbtInfSgmt));
					mv.addObject("feedBackErrorSgmt", validateErrors);
				}
				mv.addObject("pd", pd);
			}catch(Exception e) {
				logger.error(e.getMessage());
			}
			mv.setViewName("pecr/indv/dataRecode/indvLoanChangeEdit");
			return mv;
		}
		/**
		 * 获取D1 页面
		 * @return
		 */
		@RequestMapping("/indvLoanChangeEditD1")
		public String indvLoanChangeEditD1() {
			return "pecr/indv/dataRecode/indvLoanChangeEditD1";
		}
		
		/**
		 * 获取R1 页面
		 * @return
		 */
		@RequestMapping("/indvLoanChangeEditR1")
		public String indvLoanChangeEditR1() {
			return "pecr/indv/dataRecode/indvLoanChangeEditR1";
		}
		/**
		 * 获取R2 页面
		 * @return
		 */
		@RequestMapping("/indvLoanChangeEditR2")
		public String indvLoanChangeEditR2() {
			return "pecr/indv/dataRecode/indvLoanChangeEditR2";
		}
		/**
		 * 获取R3 页面
		 * @return
		 */
		@RequestMapping("/indvLoanChangeEditR3")
		public String indvLoanChangeEditR3() {
			return "pecr/indv/dataRecode/indvLoanChangeEditR3";
		}
		/**
		 * 获取R4 页面
		 * @return
		 */
		@RequestMapping("/indvLoanChangeEditR4")
		public String indvLoanChangeEditR4() {
			return "pecr/indv/dataRecode/indvLoanChangeEditR4";
		}
		/**
		 * 获取C1 页面
		 * @return
		 */
		@RequestMapping("/indvLoanChangeEditC1")
		public String indvLoanChangeEditC1() {
			return "pecr/indv/dataRecode/indvLoanChangeEditC1";
		}
		/**
		 * 去借贷交易查询页面
		 * @return
		 */
		@RequestMapping("/goIndvLoanSearch")
		public String goIndvLoanSearch() {
			return "pecr/indv/dataRecode/indvLoanSearch";
		}
		
		/**
		 * 获取借贷按段更正数据
		 * 根据前端获取的姓名，证件号码，证件类型，账户类型，待更正段段标，去查询对应的历史数据
		 * 规则： 1、对于个人借贷账户信息记录的基础段、相关还款责任人段、授信额度信息段、抵质押物信息段、初始债权说明段，仅需更正已经报送过的最新的信息
		 * 	    2、对于个人借贷账户信息记录的基本信息段、非月度表现信息段、大额专项分期信息段、特殊交易段，可更正已经报送过的全部信息
		 * 原则上我们是不用关心那些信息段更正已报送过最新的数据，那些可报送已报送过全部数据，我们经其全部展示出来即可，页面可给出响应的规则提示。
		 * @param page
		 * @return
		 */
		@RequestMapping("/getHistIndivAcctLists")
		@ResponseBody
		public Map<String, Object> getHistIndivAcctLists(Page page){
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
				List<PageData> lists = upDaccountDataService.findHistIndivAcctList(page);
				resultMap.put("data", lists);
				resultMap.put("code", 0);
				resultMap.put("count", page.getTotalResult());
			} catch (Exception e) {
				logger.error("借贷按段更正：根据前端获取的姓名，证件号码，证件类型，账户类型，待更正段段标，去查询对应的历史数据异常。", e);
				resultMap.put("code", 1);
			}
			return resultMap;
		}
		
		
		/**
		 * 去授信信息查询页面
		 * @return
		 */
		@RequestMapping("/goProtocolSearch")
		public String goProtocolSearch() {
			return "pecr/indv/dataRecode/indvProtocolSearch";
		}
		
		/**
		 * 获取授信按段更正数据
		 * 根据前端获取的姓名，证件号码，证件类型，待更正段段标，去查询对应的历史数据
		 * 规则： 1：个人授信协议信息记录的基础段、共同受信人信息段，仅需更正已经报送过的最新的信息。
		 * 		2：个人授信协议信息记录的 额度信息段，可更正已经报送过的全部信息。
		 * 原则上我们是不用关心那些信息段更正已报送过最新的数据，那些可报送已报送过全部数据，我们经其全部展示出来即可，页面可给出响应的规则提示。
		 * @param page
		 * @return
		 */
		@RequestMapping("/getHistIndivProtocolLists")
		@ResponseBody
		public Map<String, Object> getHistIndivProtocolLists(Page page){
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
				List<PageData> lists = upDaccountDataService.findHistIndivProtocolList(page);
				resultMap.put("data", lists);
				resultMap.put("code", 0);
				resultMap.put("count", page.getTotalResult());
			} catch (Exception e) {
				logger.error("授信按段更正：根据前端获取的姓名，证件号码，证件类型，待更正段段标，去查询对应的历史数据异常。", e);
				resultMap.put("code", 1);
			}
			return resultMap;
		}
		
		
		/**
		 * 去担保信息查询页面
		 * @return
		 */
		@RequestMapping("/goIndvGuaranteeSearch")
		public String goIndvGuaranteeSearch() {
			return "pecr/indv/dataRecode/indvGuaranteeSearch";
		}
		
		
		/**
		 * 获取授信按段更正数据
		 * 根据前端获取的姓名，证件号码，证件类型，账户类型，待更正段段标，去查询对应的历史数据
		 * 规则： 1：对于个人担保账户信息记录的基础段、相关还款责任人段、抵质押物信息段，仅需更正已经报送过的最新的信息。
		 * 		2：对于个人担保账户信息记录的基本信息段、在保责任信息段，可更正已经报送过的全部信息。
		 * 原则上我们是不用关心那些信息段更正已报送过最新的数据，那些可报送已报送过全部数据，我们经其全部展示出来即可，页面可给出响应的规则提示。
		 * @param page
		 * @return
		 */
		@RequestMapping("/getHistIndivGuaranteeLists")
		@ResponseBody
		public Map<String, Object> getHistIndivGuaranteeLists(Page page){
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
				List<PageData> lists = upDaccountDataService.findHistIndivGuaranteeList(page);
				resultMap.put("data", lists);
				resultMap.put("code", 0);
				resultMap.put("count", page.getTotalResult());
			} catch (Exception e) {
				logger.error("授信按段更正：根据前端获取的姓名，证件号码，证件类型，待更正段段标，去查询对应的历史数据异常。", e);
				resultMap.put("code", 1);
			}
			return resultMap;
		}
		
		
		/**下载模版
		 * @param response
		 * @throws Exception
		 */
		@RequestMapping(value="/downExcel")
		public void downExcel(HttpServletResponse response)throws Exception{
			FileDownload.fileDownload(response, PathUtil.getClasspath1() + Const.FILEPATHFILE + "perAcctAmblgChange.xlsx", "个人借贷月度表现段更正.xlsx");
		}
		
		/**
		 * /**从EXCEL导入到数据库
		 * 
		 * @param file
		 * @return
		 * @throws Exception
		 */
		@RequestMapping(value = "/readExcel")
		@ResponseBody
		public Object readExcel(@RequestParam(value = "excel", required = false) MultipartFile file) {
			Map<String, Object> map = new HashMap<String, Object>();
			Session session = Jurisdiction.getSession();
			User userInfo = (User) Jurisdiction.getSession().getAttribute("sessionUser");
			String USERID = userInfo.getUSER_ID();
			String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
			PageData pd = new PageData();
			pd.put("COMPANY", company);
			try {
				String filename = file.getOriginalFilename();
				String fileType = filename.substring(filename.lastIndexOf(".")+1,filename.length());
				if("xlsx".equals(fileType)){
					CommonsMultipartFile cf = (CommonsMultipartFile) file;
					DiskFileItem fi = (DiskFileItem) cf.getFileItem();
					File ff = fi.getStoreLocation();
					Map<String,Object> resultMap = new ImportExportData(ff,loanAcctInfoService,company).getData();
					if("SUCC".equals(resultMap.get("RESULT").toString())){
						int nums = loanAcctInfoService.saveChangeAmblgByListInfo(pd);
						map.put("msg", "Excel批量成功导入："+ nums +"条记录！");
						map.put("result", "SUCCESS");
					}else{
						map.put("msg", "Excel批量解析失败！！！");
						map.put("result", "FAIL");
					}
					String path = ff.getAbsolutePath()+File.separator+ff.getName();
					//删除临时文件
					try{
						File txt = new File(path);
						txt.delete();
					}catch(Exception e){
						logger.error("临时文件删除失败："+e.getMessage(), e);
					}
				}else{
					logger.error("读取的不是excel文件");
					map.put("msg", "读取的不是excel文件");
					map.put("result", "FAIL");
				}
				
			} catch (Exception e) {
				logger.error(e.getMessage(),e);
				map.put("msg", "系统异常，请联系管理员！");
				map.put("result", "FAIL");
			}
			return map;
		}
		
		
}

