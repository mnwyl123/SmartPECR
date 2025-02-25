package com.dcits.supervise.pecr.indv.controller.dataRecode;

import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.ent.entity.CashFlows;
import com.dcits.supervise.pecr.ent.entity.EnBasInf;
import com.dcits.supervise.pecr.ent.entity.EnIcdnRltpInf;
import com.dcits.supervise.pecr.ent.entity.EnSecAcctInf;
import com.dcits.supervise.pecr.ent.entity.EntAcctBsSgmt;
import com.dcits.supervise.pecr.ent.entity.EntBalanceSheetBsSgmt;
import com.dcits.supervise.pecr.ent.entity.EntIncomeAndExpenseStatemeBs;
import com.dcits.supervise.pecr.ent.entity.EntIncomeStatement;
import com.dcits.supervise.pecr.ent.entity.EntInstitutionBalance;
import com.dcits.supervise.pecr.ent.entity.MotgaCltalCtrctBsSgmt;
import com.dcits.supervise.pecr.ent.service.dataRecode.CashFlowsManager;
import com.dcits.supervise.pecr.ent.service.dataRecode.EnBasInfManager;
import com.dcits.supervise.pecr.ent.service.dataRecode.EnCtrctInfoManager;
import com.dcits.supervise.pecr.ent.service.dataRecode.EnIcdnRltpInfManager;
import com.dcits.supervise.pecr.ent.service.dataRecode.EnSecAcctInfManager;
import com.dcits.supervise.pecr.ent.service.dataRecode.EntAccountChangeManager;
import com.dcits.supervise.pecr.ent.service.dataRecode.EntBalanceSheetInfoManager;
import com.dcits.supervise.pecr.ent.service.dataRecode.EntDelaccountDataManager;
import com.dcits.supervise.pecr.ent.service.dataRecode.EntIncomeAndExpenseStatemeBsManager;
import com.dcits.supervise.pecr.ent.service.dataRecode.EntIncomePabsInfoManager;
import com.dcits.supervise.pecr.ent.service.dataRecode.EntInstitutionBalanceManager;
import com.dcits.supervise.pecr.ent.service.dataRecode.EntLoanAcctInfoManager;
import com.dcits.supervise.pecr.ent.service.dataRecode.MoChangeManager;
import com.dcits.supervise.pecr.ent.service.dataRecode.MoDelManager;
import com.dcits.supervise.pecr.ent.service.dataRecode.MotgaCltalBsInfoManager;
import com.dcits.supervise.pecr.indv.entity.Accountchange;
import com.dcits.supervise.pecr.indv.entity.GuarAcctBsSgmt;
import com.dcits.supervise.pecr.indv.entity.InCtrctInfCtrctBsSgmt;
import com.dcits.supervise.pecr.indv.entity.InFalMmbsInf;
import com.dcits.supervise.pecr.indv.entity.InIDEfctInf;
import com.dcits.supervise.pecr.indv.entity.InSpcEvtDscInf;
import com.dcits.supervise.pecr.indv.entity.LoanAcctBsSgmt;
import com.dcits.supervise.pecr.indv.entity.PecrIndvBsSgmt;
import com.dcits.supervise.pecr.indv.entity.inDel;
import com.dcits.supervise.pecr.indv.service.dataRecode.AccountChangeManager;
import com.dcits.supervise.pecr.indv.service.dataRecode.AuditingCommonManager;
import com.dcits.supervise.pecr.indv.service.dataRecode.DelaccountDataManager;
import com.dcits.supervise.pecr.indv.service.dataRecode.GuarAcctInfoManager;
import com.dcits.supervise.pecr.indv.service.dataRecode.InCtrctInfManager;
import com.dcits.supervise.pecr.indv.service.dataRecode.InFalMmbsInfManager;
import com.dcits.supervise.pecr.indv.service.dataRecode.InIDEfctInfManager;
import com.dcits.supervise.pecr.indv.service.dataRecode.InSpcEvtDscInfManager;
import com.dcits.supervise.pecr.indv.service.dataRecode.IndvBasicsInfoManager;
import com.dcits.supervise.pecr.indv.service.dataRecode.LoanAcctInfoManager;

import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

@Controller
@RequestMapping("/auditing")
public class AuditingController  extends BaseController{
	@Autowired
	private IndvBasicsInfoManager indvBasicsInfoService;
	@Autowired
	private AuditingCommonManager auditingCommonService;
	@Autowired
	private LoanAcctInfoManager loanAcctInfoService;
	@Autowired
	private InCtrctInfManager inCtrctInfService;
	@Autowired
	private InSpcEvtDscInfManager InSpcEvtDscInfService;
	@Autowired
	private InIDEfctInfManager InIDEfctInfService;
	@Autowired
	private InFalMmbsInfManager InFalMmbsInfService;
	@Autowired
	private GuarAcctInfoManager guarAcctInfoService;
	@Autowired
	private EnBasInfManager enBasInfService;
	@Autowired
	private EnIcdnRltpInfManager EnIcdnRltpInfService;
	@Autowired
	private EntLoanAcctInfoManager entLoanAcctInfoService;
	@Autowired
	private EnSecAcctInfManager enSecAcctInfService;
	@Autowired
	private EnCtrctInfoManager enCtrctInfoService;
	@Autowired
	private CashFlowsManager cashFlowsService;
	@Autowired
	private EntBalanceSheetInfoManager entBalanceSheetInfoService;
	@Autowired
	private EntIncomePabsInfoManager entIncomePabsInfoService;
	@Autowired
	private EntInstitutionBalanceManager entInstitutionBalanceService;
	@Autowired
	private EntIncomeAndExpenseStatemeBsManager entIncomeAndExpenseStatemeBs;
	@Autowired
	private MotgaCltalBsInfoManager motgaCltalBsInfoService;
	@Autowired
	private MoChangeManager moChangeService;
	
	//20210205，个人数据更正类特殊报文
	@Resource(name = "accountChangeService")
	private AccountChangeManager accountChangeService;
	
	@Resource(name = "delaccountDataService")
	private DelaccountDataManager delAccountDataService;
	
	@Autowired
	private MoDelManager moDelService;
	
	@Resource(name = "EntAccountChangeService")
	private EntAccountChangeManager entAccountChangeService;
	
	@Resource(name = "EntDelAccountDataService")
	private EntDelaccountDataManager entDelAccountDataService;
	
	/**
	 * 个人基本信息表界面
	 * @return
	 */
	@RequestMapping("/listPage")
	public String dataPage() {
		return "pecr/indv/dataRecode/auditingList";
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
			pd.put("COMPANY", company);
			pd.put("queryType", "CHECK");
			int pge = Integer.parseInt(pd.getString("page"));
			int limit = Integer.parseInt(pd.getString("limit"));
			page.setCurrentPage(pge);
			page.setShowCount(limit);
			page.setPd(pd);
			List<PecrIndvBsSgmt> dataList = indvBasicsInfoService.dataBsSgmtList(page);
			resultMap.put("code", 0);
			resultMap.put("msg","");
			resultMap.put("count", page.getTotalResult());
			resultMap.put("data", dataList);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("code", 1);
		}
		return resultMap;
	}
	/**
	 * 个人借贷审核
	 * @return
	 */
	@RequestMapping("/auditLoanAcct")
	public String loanAcctPage() {
		return "pecr/indv/dataRecode/audtingLoanAcct";
	}
	/**
	 * 获取表格数据列表
	 * @param page
	 * @return
	 */
	@RequestMapping("/dataLoanAcct")
	@ResponseBody
	public Map<String, Object> dataLoanAcct(Page page){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			PageData pd = this.getPageData();
			pd.put("COMPANY", company);
			pd.put("queryType", "CHECK");
			int pge = Integer.parseInt(pd.getString("page"));
			int limit = Integer.parseInt(pd.getString("limit"));
			page.setCurrentPage(pge);
			page.setShowCount(limit);
			page.setPd(pd);
			List<LoanAcctBsSgmt> dataList = loanAcctInfoService.getLoanAcctBsSgmtList(page);
			resultMap.put("code", 0);
			resultMap.put("msg","");
			resultMap.put("count", page.getTotalResult());
			resultMap.put("data", dataList);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("code", 1);
		}
		return resultMap;
	}
	/**
	 * 个人授信审核
	 * @return
	 */
	@RequestMapping("/auditInCtrctInfo")
	public String inCtrctInfo() {
		return "pecr/indv/dataRecode/audtingInCtrctInfo";
	}
	/**
	 * 获取表格数据列表
	 * @param page
	 * @return
	 */
	@RequestMapping("/dataInCtrctInfo")
	@ResponseBody
	public Map<String, Object> dataInCtrctInfo(Page page){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			PageData pd = this.getPageData();
			pd.put("COMPANY", company);
			pd.put("queryType", "CHECK");
			int pge = Integer.parseInt(pd.getString("page"));
			int limit = Integer.parseInt(pd.getString("limit"));
			page.setCurrentPage(pge);
			page.setShowCount(limit);
			page.setPd(pd);
			List<InCtrctInfCtrctBsSgmt> dataList = inCtrctInfService.dataCtrctBsSgmtList(page);
			resultMap.put("code", 0);
			resultMap.put("msg","");
			resultMap.put("count", page.getTotalResult());
			resultMap.put("data", dataList);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("code", 1);
		}
		return resultMap;
	}
	/**
	 * 个人担保审核
	 * @return
	 */
	@RequestMapping("/guarAcctInfo")
	public String guarAcctInfo() {
		return "pecr/indv/dataRecode/audtingGuarAcctInfo";
	}
	/**
	 * 获取表格数据列表
	 * @param page
	 * @return
	 */
	@RequestMapping("/dataGuarAcctInfo")
	@ResponseBody
	public Map<String, Object> dataGuarAcctInfo(Page page){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			PageData pd = this.getPageData();
			pd.put("COMPANY", company);
			pd.put("queryType", "CHECK");
			int pge = Integer.parseInt(pd.getString("page"));
			int limit = Integer.parseInt(pd.getString("limit"));
			page.setCurrentPage(pge);
			page.setShowCount(limit);
			page.setPd(pd);
			List<GuarAcctBsSgmt> dataList = guarAcctInfoService.getGuarAcctBsSgmtList(page);
			resultMap.put("code", 0);
			resultMap.put("msg","");
			resultMap.put("count", page.getTotalResult());
			resultMap.put("data", dataList);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("code", 1);
		}
		return resultMap;
	}
	/**
	 * 借贷特殊事件审核数据列表界面
	 * @return
	 */
	@RequestMapping("/inSpcEvtDscPage")
	public String InSpcEvtDscPage() {
		return "pecr/indv/dataRecode/auditingInSpcEvtDscList";
	}
	/**
	 * 获取表格数据列表
	 * @param page
	 * @return
	 */
	@RequestMapping("/dataInSpcEvtDscList")
	@ResponseBody
	public Map<String, Object> dataInSpcEvtDscList(Page page){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			PageData pd = this.getPageData();
			pd.put("COMPANY", company);
			pd.put("queryType", "CHECK");
			int pge = Integer.parseInt(pd.getString("page"));
			int limit = Integer.parseInt(pd.getString("limit"));
			page.setCurrentPage(pge);
			page.setShowCount(limit);
			page.setPd(pd);
			List<InSpcEvtDscInf> dataList = InSpcEvtDscInfService.List(page);
			resultMap.put("code", 0);
			resultMap.put("msg","");
			resultMap.put("count", page.getTotalResult());
			resultMap.put("data", dataList);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("code", 1);
		}
		return resultMap;
	}
	/**
	 * 个人证件数据列表界面
	 * @return
	 */
	@RequestMapping("/inIDEfctPage")
	public String InIDEfctPage() {
		return "pecr/indv/dataRecode/auditingInIDEfctList";
	}
	/**
	 * 获取表格数据列表
	 * @param page
	 * @return
	 */
	@RequestMapping("/dataInIDEfctList")
	@ResponseBody
	public Map<String, Object> dataInIDEfctList(Page page){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			PageData pd = this.getPageData();
			pd.put("COMPANY", company);
			pd.put("queryType", "CHECK");
			int pge = Integer.parseInt(pd.getString("page"));
			int limit = Integer.parseInt(pd.getString("limit"));
			page.setCurrentPage(pge);
			page.setShowCount(limit);
			page.setPd(pd);
			List<InIDEfctInf> dataList = InIDEfctInfService.List(page);
			resultMap.put("code", 0);
			resultMap.put("msg","");
			resultMap.put("count", page.getTotalResult());
			resultMap.put("data", dataList);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("code", 1);
		}
		return resultMap;
	}
	/**
	 * 家庭关系信息审核数据列表界面
	 * @return
	 */
	@RequestMapping("/inFalMmbsPage")
	public String InFalMmbsPage() {
		return "pecr/indv/dataRecode/auditingInFalMmbsList";
	}
	/**
	 * 获取表格数据列表
	 * @param page
	 * @return
	 */
	@RequestMapping("/dataInFalMmbsList")
	@ResponseBody
	public Map<String, Object> dataInFalMmbsList(Page page){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			PageData pd = this.getPageData();
			pd.put("COMPANY", company);
			pd.put("queryType", "CHECK");
			int pge = Integer.parseInt(pd.getString("page"));
			int limit = Integer.parseInt(pd.getString("limit"));
			page.setCurrentPage(pge);
			page.setShowCount(limit);
			page.setPd(pd);
			List<InFalMmbsInf> dataList = InFalMmbsInfService.List(page);
			resultMap.put("code", 0);
			resultMap.put("msg","");
			resultMap.put("count", page.getTotalResult());
			resultMap.put("data", dataList);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("code", 1);
		}
		return resultMap;
	}
	/**
	 * 企业基本审核
	 * @return
	 */
	@RequestMapping("/auditEnBasInf")
	public String enBasInf() {
		return "pecr/ent/dataRecode/auditEnBasInf";
	}
	/**
	 * 获取表格数据列表
	 * @param page
	 * @return
	 */
	@RequestMapping("/dataEnBasInf")
	@ResponseBody
	public Map<String, Object> dataEnBasInf(Page page){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			PageData pd = this.getPageData();
			pd.put("COMPANY", company);
			pd.put("queryType", "CHECK");
			int pge = Integer.parseInt(pd.getString("page"));
			int limit = Integer.parseInt(pd.getString("limit"));
			page.setCurrentPage(pge);
			page.setShowCount(limit);
			page.setPd(pd);
			List<EnBasInf> dataList = enBasInfService.List(page);
			resultMap.put("code", 0);
			resultMap.put("msg","");
			resultMap.put("count", page.getTotalResult());
			resultMap.put("data", dataList);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("code", 1);
		}
		return resultMap;
	}
	/**
	 * 企业关联关系审核数据列表界面
	 * @return
	 */
	@RequestMapping("/enIcdnRltpPage")
	public String EnIcdnRltpPage() {
		return "pecr/indv/dataRecode/auditingEnIcdnRltpList";
	}
	/**
	 * 获取表格数据列表
	 * @param page
	 * @return
	 */
	@RequestMapping("/dataEnIcdnRltpList")
	@ResponseBody
	public Map<String, Object> dataEnIcdnRltpList(Page page){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			PageData pd = this.getPageData();
			pd.put("COMPANY", company);
			pd.put("queryType", "CHECK");
			int pge = Integer.parseInt(pd.getString("page"));
			int limit = Integer.parseInt(pd.getString("limit"));
			page.setCurrentPage(pge);
			page.setShowCount(limit);
			page.setPd(pd);
			List<EnIcdnRltpInf> dataList = EnIcdnRltpInfService.List(page);
			resultMap.put("code", 0);
			resultMap.put("msg","");
			resultMap.put("count", page.getTotalResult());
			resultMap.put("data", dataList);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("code", 1);
		}
		return resultMap;
	}
	/**
	 * 企业借贷审核
	 * @return
	 */
	@RequestMapping("/auditEntLoanAcct")
	public String entLoanAcctInfo() {
		return "pecr/ent/dataRecode/auditEntLoanAcctInfo";
	}
	/**
	 * 获取表格数据列表
	 * @param page
	 * @return
	 */
	@RequestMapping("/dataEntLoanAcctInfo")
	@ResponseBody
	public Map<String, Object> dataEntLoanAcctInfo(Page page){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			PageData pd = this.getPageData();
			pd.put("COMPANY", company);
			pd.put("queryType", "CHECK");
			int pge = Integer.parseInt(pd.getString("page"));
			int limit = Integer.parseInt(pd.getString("limit"));
			page.setCurrentPage(pge);
			page.setShowCount(limit);
			page.setPd(pd);
			List<EntAcctBsSgmt> dataList = entLoanAcctInfoService.getLoanAcctBsSgmtList(page);
			resultMap.put("code", 0);
			resultMap.put("msg","");
			resultMap.put("count", page.getTotalResult());
			resultMap.put("data", dataList);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("code", 1);
		}
		return resultMap;
	}
	/**
	 * 企业担保审核
	 * @return
	 */
	@RequestMapping("/auditEnSecAcct")
	public String entSecAcctInfo() {
		return "pecr/ent/dataRecode/auditEnSecAcctInfo";
	}
	/**
	 * 获取表格数据列表
	 * @param page
	 * @return
	 */
	@RequestMapping("/dataEnSecAcctInfo")
	@ResponseBody
	public Map<String, Object> dataEnSecAcctInfo(Page page){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			PageData pd = this.getPageData();
			pd.put("COMPANY", company);
			pd.put("queryType", "CHECK");
			int pge = Integer.parseInt(pd.getString("page"));
			int limit = Integer.parseInt(pd.getString("limit"));
			page.setCurrentPage(pge);
			page.setShowCount(limit);
			page.setPd(pd);
			List<EnSecAcctInf> dataList = enSecAcctInfService.getenSecAcctInfList(page);
			resultMap.put("code", 0);
			resultMap.put("msg","");
			resultMap.put("count", page.getTotalResult());
			resultMap.put("data", dataList);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("code", 1);
		}
		return resultMap;
	}
	/**
	 *企业现金流量审核
	 * @return
	 */
	@RequestMapping("/auditCashFlows")
	public String cashFlows() {
		return "pecr/ent/dataRecode/auditCashFlows";
	}
	/**
	 * 获取表格数据列表
	 * @param page
	 * @return
	 */
	@RequestMapping("/dataCashFlows")
	@ResponseBody
	public Map<String, Object> dataCashFlows(Page page){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			PageData pd = this.getPageData();
			pd.put("COMPANY", company);
			pd.put("queryType", "CHECK");
			int pge = Integer.parseInt(pd.getString("page"));
			int limit = Integer.parseInt(pd.getString("limit"));
			page.setCurrentPage(pge);
			page.setShowCount(limit);
			page.setPd(pd);
			List<CashFlows> dataList = cashFlowsService.getcashFlowsList(page);
			resultMap.put("code", 0);
			resultMap.put("msg","");
			resultMap.put("count", page.getTotalResult());
			resultMap.put("data", dataList);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("code", 1);
		}
		return resultMap;
	}
	/**
	 *企业资产负债审核
	 * @return
	 */
	@RequestMapping("/auditEntBalanceInfo")
	public String entBalanceInfo() {
		return "pecr/ent/dataRecode/auditEntBalanceInfo";
	}
	/**
	 * 获取表格数据列表
	 * @param page
	 * @return
	 */
	@RequestMapping("/dataEntBalanceInfo")
	@ResponseBody
	public Map<String, Object> dataEntBalanceInfo(Page page){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			PageData pd = this.getPageData();
			pd.put("COMPANY", company);
			pd.put("queryType", "CHECK");
			int pge = Integer.parseInt(pd.getString("page"));
			int limit = Integer.parseInt(pd.getString("limit"));
			page.setCurrentPage(pge);
			page.setShowCount(limit);
			page.setPd(pd);
			List<EntBalanceSheetBsSgmt> dataList = entBalanceSheetInfoService.getAssetsInfoList(page);
			resultMap.put("code", 0);
			resultMap.put("msg","");
			resultMap.put("count", page.getTotalResult());
			resultMap.put("data", dataList);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("code", 1);
		}
		return resultMap;
	}
	/**
	 *企业利润及利润分配审核
	 * @return
	 */
	@RequestMapping("/auditEntIncomeInfo")
	public String entIncomeInfo() {
		return "pecr/ent/dataRecode/auditEntIncomeInfo";
	}
	/**
	 * 获取表格数据列表
	 * @param page
	 * @return
	 */
	@RequestMapping("/dataEntIncomeInfo")
	@ResponseBody
	public Map<String, Object> dataEntIncomeInfo(Page page){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			PageData pd = this.getPageData();
			pd.put("COMPANY", company);
			pd.put("queryType", "CHECK");
			int pge = Integer.parseInt(pd.getString("page"));
			int limit = Integer.parseInt(pd.getString("limit"));
			page.setCurrentPage(pge);
			page.setShowCount(limit);
			page.setPd(pd);
			List<EntIncomeStatement> dataList = entIncomePabsInfoService.getIncomeInfoList(page);
			resultMap.put("code", 0);
			resultMap.put("msg","");
			resultMap.put("count", page.getTotalResult());
			resultMap.put("data", dataList);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("code", 1);
		}
		return resultMap;
	}
	/**
	 *事业单位资产负债审核
	 * @return
	 */
	@RequestMapping("/auditEntInstitutionInfo")
	public String entInstitutionInfo() {
		return "pecr/ent/dataRecode/auditEntInstitutionInfo";
	}
	/**
	 * 获取表格数据列表
	 * @param page
	 * @return
	 */
	@RequestMapping("/dataEntInstitutionInfo")
	@ResponseBody
	public Map<String, Object> dataEntInstitutionInfo(Page page){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			PageData pd = this.getPageData();
			pd.put("COMPANY", company);
			pd.put("queryType", "CHECK");
			int pge = Integer.parseInt(pd.getString("page"));
			int limit = Integer.parseInt(pd.getString("limit"));
			page.setCurrentPage(pge);
			page.setShowCount(limit);
			page.setPd(pd);
			List<EntInstitutionBalance> dataList = entInstitutionBalanceService.getBalanceSheetList(page);
			resultMap.put("code", 0);
			resultMap.put("msg","");
			resultMap.put("count", page.getTotalResult());
			resultMap.put("data", dataList);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("code", 1);
		}
		return resultMap;
	}
	/**
	 *事业单位收入支出审核
	 * @return
	 */
	@RequestMapping("/auditEntIncomeStatemeBs")
	public String entIncomeStatemeBs() {
		return "pecr/ent/dataRecode/auditEntIncomeStatemeBs";
	}
	/**
	 * 获取表格数据列表
	 * @param page
	 * @return
	 */
	@RequestMapping("/dataEntIncomeStatemeBs")
	@ResponseBody
	public Map<String, Object> dataEntIncomeStatemeBs(Page page){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			PageData pd = this.getPageData();
			pd.put("COMPANY", company);
			pd.put("queryType", "CHECK");
			int pge = Integer.parseInt(pd.getString("page"));
			int limit = Integer.parseInt(pd.getString("limit"));
			page.setCurrentPage(pge);
			page.setShowCount(limit);
			page.setPd(pd);
			List<EntIncomeAndExpenseStatemeBs> dataList = entIncomeAndExpenseStatemeBs.getentIncomeAndExpenseStatemeList(page);
			resultMap.put("code", 0);
			resultMap.put("msg","");
			resultMap.put("count", page.getTotalResult());
			resultMap.put("data", dataList);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("code", 1);
		}
		return resultMap;
	}
	/**
	 * 企业授信审核
	 * @return
	 */
	@RequestMapping("/auditEnCtrctInfo")
	public String enCtrctInfo() {
		return "pecr/ent/dataRecode/auditEnCtrctInfo";
	}
	/**
	 * 获取表格数据列表
	 * @param page
	 * @return
	 */
	@RequestMapping("/dataEnCtrctInfo")
	@ResponseBody
	public Map<String, Object> dataEnCtrctInfo(Page page){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			PageData pd = this.getPageData();
			pd.put("COMPANY", company);
			pd.put("queryType", "CHECK");
			int pge = Integer.parseInt(pd.getString("page"));
			int limit = Integer.parseInt(pd.getString("limit"));
			page.setCurrentPage(pge);
			page.setShowCount(limit);
			page.setPd(pd);
			List<Map<String, Object>> dataList = enCtrctInfoService.getctrctBsSgmtList(page);
			resultMap.put("code", 0);
			resultMap.put("msg","");
			resultMap.put("count", page.getTotalResult());
			resultMap.put("data", dataList);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("code", 1);
		}
		return resultMap;
	}
	/**
	 * 抵质押审核
	 * @return
	 */
	@RequestMapping("/motgaCltalBsPage")
	public String motgaCltalBsPage() {
		return "pecr/mortgage/auditMotgaCltalBsPage";
	}
	/**
	 * 获取表格数据列表
	 * @param page
	 * @return
	 */
	@RequestMapping("/dataMotgaCltalBsPage")
	@ResponseBody
	public Map<String, Object> dataMotgaCltalBsPage(Page page){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			PageData pd = this.getPageData();
			pd.put("COMPANY", company);
			pd.put("queryType", "CHECK");
			int pge = Integer.parseInt(pd.getString("page"));
			int limit = Integer.parseInt(pd.getString("limit"));
			page.setCurrentPage(pge);
			page.setShowCount(limit);
			page.setPd(pd);
			List<MotgaCltalCtrctBsSgmt> dataList = motgaCltalBsInfoService.getMotgaContractInfoList(page);
			resultMap.put("code", 0);
			resultMap.put("msg","");
			resultMap.put("count", page.getTotalResult());
			resultMap.put("data", dataList);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("code", 1);
		}
		return resultMap;
	}
	/**
	 * 审批页面公共
	 * @param page
	 * @return
	 */
	@RequestMapping("/isAuditing")
	@ResponseBody
	public Map<String, Object> auditok(Page page){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			PageData pd = this.getPageData();
			String strIds = pd.getString("strIds");
			String[] ids = strIds.split(",");
			pd.put("ids", ids);
			pd.put("COMPANY", company);
			String LAST_UPDATE_TIME = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
			pd.put("LAST_UPDATE_TIME", LAST_UPDATE_TIME);
			pd.put("OPERATOR_USER", user.getUSERNAME());
			auditingCommonService.updateAuditing(pd);
			resultMap.put("msg","操作成功");
		}catch(Exception e) {
			logger.error("审批页面公共错误：",e);
			resultMap.put("msg","操作失败");
		}
		return resultMap;
	}
	
	
	/**
	 * 个人标识变更
	 * @return
	 */
	@RequestMapping("/accounChangePage")
	public String accounChangePage() {
		return "pecr/indv/dataRecode/auditAccounChangePage";
	}
	/**
	 * 获取表格数据列表
	 * @param page
	 * @return
	 */
	@RequestMapping("/dataAccounChangePage")
	@ResponseBody
	public Map<String, Object> dataAccounChangePage(Page page){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			PageData pd = this.getPageData();
			pd.put("COMPANY", company);
			pd.put("queryType", "CHECK");
			int pge = Integer.parseInt(pd.getString("page"));
			int limit = Integer.parseInt(pd.getString("limit"));
			page.setCurrentPage(pge);
			page.setShowCount(limit);
			page.setPd(pd);
			List<Accountchange> dataList = accountChangeService.listaccount(page);
			resultMap.put("code", 0);
			resultMap.put("msg","");
			resultMap.put("count", page.getTotalResult());
			resultMap.put("data", dataList);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("code", 1);
		}
		return resultMap;
	}
	
	
	/**
	 * 个人按段/整笔删除审核页面
	 * @return
	 */
	@RequestMapping("/auditDelAccounChangePage")
	public String auditDelAccounChangePage() {
		return "pecr/indv/dataRecode/auditDelAccounChangePage";
	}
	/**
	 * 获取表格数据列表
	 * @param page
	 * @return
	 */
	@RequestMapping("/dataDelAccounChangePage")
	@ResponseBody
	public Map<String, Object> dataDelAccounChangePage(Page page){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			PageData pd = this.getPageData();
			pd.put("COMPANY", company);
			pd.put("queryType", "CHECK");
			int pge = Integer.parseInt(pd.getString("page"));
			int limit = Integer.parseInt(pd.getString("limit"));
			page.setCurrentPage(pge);
			page.setShowCount(limit);
			page.setPd(pd);
			List<inDel> delaccountDataList = delAccountDataService.listDelaccountData(page);
			resultMap.put("code", 0);
			resultMap.put("msg","");
			resultMap.put("count", page.getTotalResult());
			resultMap.put("data", delaccountDataList);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("code", 1);
		}
		return resultMap;
	}
	
	/**
	 * 个人借贷按段更正审核页面
	 * @return
	 */
	@RequestMapping("/auditIndvLoanChangePage")
	public String auditIndvLoanChangePage() {
		return "pecr/indv/dataRecode/auditIndvLoanChangePage";
	}
	/**
	 * 获取表格数据列表
	 * @param page
	 * @return
	 */
	@RequestMapping("/dataIndvLoanChangePage")
	@ResponseBody
	public Map<String, Object> dataIndvLoanChangePage(Page page){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			PageData pd = this.getPageData();
			pd.put("COMPANY", company);
			pd.put("queryType", "CHECK");
			int pge = Integer.parseInt(pd.getString("page"));
			int limit = Integer.parseInt(pd.getString("limit"));
			page.setCurrentPage(pge);
			page.setShowCount(limit);
			page.setPd(pd);
			List<LoanAcctBsSgmt> dataList = loanAcctInfoService.getLoanAcctUpdateBsSgmtList(page);
			resultMap.put("code", 0);
			resultMap.put("msg","");
			resultMap.put("count", page.getTotalResult());
			resultMap.put("data", dataList);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("code", 1);
		}
		return resultMap;
	}
	
	/**
	 * 个人授信协议按段更正审核页面
	 * @return
	 */
	@RequestMapping("/auditIndvProtocolChangePage")
	public String auditIndvProtocolChangePage() {
		return "pecr/indv/dataRecode/auditIndvProtocolChangePage";
	}
	/**
	 * 获取表格数据列表
	 * @param page
	 * @return
	 */
	@RequestMapping("/dataIndvProtocolChangePage")
	@ResponseBody
	public Map<String, Object> dataIndvProtocolChangePage(Page page){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			PageData pd = this.getPageData();
			pd.put("COMPANY", company);
			pd.put("queryType", "CHECK");
			int pge = Integer.parseInt(pd.getString("page"));
			int limit = Integer.parseInt(pd.getString("limit"));
			page.setCurrentPage(pge);
			page.setShowCount(limit);
			page.setPd(pd);
			List<InCtrctInfCtrctBsSgmt> dataCtrctBsSgmtList = inCtrctInfService.dataUpdateCtrctBsSgmtsList(page);
			resultMap.put("code", 0);
			resultMap.put("msg","");
			resultMap.put("count", page.getTotalResult());
			resultMap.put("data", dataCtrctBsSgmtList);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("code", 1);
		}
		return resultMap;
	}
	
	
	/**
	 * 个人担保按段更正审核页面
	 * @return
	 */
	@RequestMapping("/auditIndvGuaranteeChange")
	public String auditIndvGuaranteeChange() {
		return "pecr/indv/dataRecode/auditIndvGuaranteeChange";
	}
	/**
	 * 获取表格数据列表
	 * @param page
	 * @return
	 */
	@RequestMapping("/dataIndvGuaranteeChange")
	@ResponseBody
	public Map<String, Object> dataIndvGuaranteeChange(Page page){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			PageData pd = this.getPageData();
			pd.put("COMPANY", company);
			pd.put("queryType", "CHECK");
			int pge = Integer.parseInt(pd.getString("page"));
			int limit = Integer.parseInt(pd.getString("limit"));
			page.setCurrentPage(pge);
			page.setShowCount(limit);
			page.setPd(pd);
			List<GuarAcctBsSgmt> dataList = guarAcctInfoService.getGuarUpdateAcctBsSgmtList(page);
			resultMap.put("code", 0);
			resultMap.put("msg","");
			resultMap.put("count", page.getTotalResult());
			resultMap.put("data", dataList);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("code", 1);
		}
		return resultMap;
	}
	
	
	/**
	 * 抵質押物标识码变更
	 * @return
	 */
	@RequestMapping("/auditMotgaChange")
	public String auditMotgaChange() {
		return "pecr/mortgage/auditMotgaChange";
	}
	/**
	 * 获取表格数据列表
	 * @param page
	 * @return
	 */
	@RequestMapping("/dataMotgaChange")
	@ResponseBody
	public Map<String, Object> dataMotgaChange(Page page){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			PageData pd = this.getPageData();
			pd.put("COMPANY", company);
			pd.put("queryType", "CHECK");
			int pge = Integer.parseInt(pd.getString("page"));
			int limit = Integer.parseInt(pd.getString("limit"));
			page.setCurrentPage(pge);
			page.setShowCount(limit);
			page.setPd(pd);
			List<MotgaCltalCtrctBsSgmt> dataList = moChangeService.getMotgaContractInfoList(page);
			resultMap.put("code", 0);
			resultMap.put("msg","");
			resultMap.put("count", page.getTotalResult());
			resultMap.put("data", dataList);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("code", 1);
		}
		return resultMap;
	}
	
	
	
	/**
	 * 抵質押物整笔删除
	 * @return
	 */
	@RequestMapping("/auditMotgaDel")
	public String auditMotgaDel() {
		return "pecr/mortgage/auditMotgaDel";
	}
	/**
	 * 获取表格数据列表
	 * @param page
	 * @return
	 */
	@RequestMapping("/dataMotgaDel")
	@ResponseBody
	public Map<String, Object> dataMotgaDel(Page page){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			PageData pd = this.getPageData();
			pd.put("COMPANY", company);
			pd.put("queryType", "CHECK");
			int pge = Integer.parseInt(pd.getString("page"));
			int limit = Integer.parseInt(pd.getString("limit"));
			page.setCurrentPage(pge);
			page.setShowCount(limit);
			page.setPd(pd);
			List<MotgaCltalCtrctBsSgmt> dataList = moDelService.getMotgaContractInfoList(page);
			resultMap.put("code", 0);
			resultMap.put("msg","");
			resultMap.put("count", page.getTotalResult());
			resultMap.put("data", dataList);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("code", 1);
		}
		return resultMap;
	}
	
	
	/**
	 * 企业标识变更
	 * @return
	 */
	@RequestMapping("/auditEntAccounChangePage")
	public String entAccounChangePage() {
		return "pecr/ent/dataRecode/auditEntAccounChangePage";
	}
	/**
	 * 获取表格数据列表
	 * @param page
	 * @return
	 */
	@RequestMapping("/dataEntAccounChangePage")
	@ResponseBody
	public Map<String, Object> dataEntAccounChangePage(Page page){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			PageData pd = this.getPageData();
			pd.put("COMPANY", company);
			pd.put("queryType", "CHECK");
			int pge = Integer.parseInt(pd.getString("page"));
			int limit = Integer.parseInt(pd.getString("limit"));
			page.setCurrentPage(pge);
			page.setShowCount(limit);
			page.setPd(pd);
			List<Accountchange> dataList = entAccountChangeService.listaccount(page);
			resultMap.put("code", 0);
			resultMap.put("msg","");
			resultMap.put("count", page.getTotalResult());
			resultMap.put("data", dataList);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("code", 1);
		}
		return resultMap;
	}
	
	
	/**
	 * 企业按段/整笔删除审核页面
	 * @return
	 */
	@RequestMapping("/auditEntDelAccounChangePage")
	public String auditEntDelAccounChangePage() {
		return "pecr/ent/dataRecode/auditEntDelAccounChangePage";
	}
	/**
	 * 获取表格数据列表
	 * @param page
	 * @return
	 */
	@RequestMapping("/dataEntDelAccounChangePage")
	@ResponseBody
	public Map<String, Object> dataEntDelAccounChangePage(Page page){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			PageData pd = this.getPageData();
			pd.put("COMPANY", company);
			pd.put("queryType", "CHECK");
			int pge = Integer.parseInt(pd.getString("page"));
			int limit = Integer.parseInt(pd.getString("limit"));
			page.setCurrentPage(pge);
			page.setShowCount(limit);
			page.setPd(pd);
			List<inDel> delaccountDataList = entDelAccountDataService.listDelaccountData(page);
			resultMap.put("code", 0);
			resultMap.put("msg","");
			resultMap.put("count", page.getTotalResult());
			resultMap.put("data", delaccountDataList);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("code", 1);
		}
		return resultMap;
	}
	
	
	/**
	 * 企业借贷按段更正审核页面
	 * @return
	 */
	@RequestMapping("/auditEntLoanChangePage")
	public String auditEntLoanChangePage() {
		return "pecr/ent/dataRecode/auditEntLoanChangePage";
	}
	/**
	 * 获取表格数据列表
	 * @param page
	 * @return
	 */
	@RequestMapping("/dataEntLoanChangePage")
	@ResponseBody
	public Map<String, Object> dataEntLoanChangePage(Page page){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			PageData pd = this.getPageData();
			pd.put("COMPANY", company);
			pd.put("queryType", "CHECK");
			int pge = Integer.parseInt(pd.getString("page"));
			int limit = Integer.parseInt(pd.getString("limit"));
			page.setCurrentPage(pge);
			page.setShowCount(limit);
			page.setPd(pd);
			List<EntAcctBsSgmt> entDataList = entLoanAcctInfoService.getUpLoanAcctBsSgmtList(page);
			resultMap.put("code", 0);
			resultMap.put("msg","");
			resultMap.put("count", page.getTotalResult());
			resultMap.put("data", entDataList);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("code", 1);
		}
		return resultMap;
	}
	
	
	/**
	 * 企业授信协议按段更正审核页面
	 * @return
	 */
	@RequestMapping("/auditEntCtrctChangePage")
	public String auditEntCtrctChangePage() {
		return "pecr/ent/dataRecode/auditEntCtrctChangePage";
	}
	/**
	 * 获取表格数据列表
	 * @param page
	 * @return
	 */
	@RequestMapping("/dataEntCtrctChangePage")
	@ResponseBody
	public Map<String, Object> dataEntCtrctChangePage(Page page){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			PageData pd = this.getPageData();
			pd.put("COMPANY", company);
			pd.put("queryType", "CHECK");
			int pge = Integer.parseInt(pd.getString("page"));
			int limit = Integer.parseInt(pd.getString("limit"));
			page.setCurrentPage(pge);
			page.setShowCount(limit);
			page.setPd(pd);
			List<Map<String, Object>> entDataList = enCtrctInfoService.getCtrctChangeBsSgmtList(page);
			resultMap.put("code", 0);
			resultMap.put("msg","");
			resultMap.put("count", page.getTotalResult());
			resultMap.put("data", entDataList);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("code", 1);
		}
		return resultMap;
	}
	
	
	/**
	 * 企业授信协议按段更正审核页面
	 * @return
	 */
	@RequestMapping("/auditEntSecAcctChangePage")
	public String auditEntSecAcctChangePage() {
		return "pecr/ent/dataRecode/auditEntSecAcctChangePage";
	}
	/**
	 * 获取表格数据列表
	 * @param page
	 * @return
	 */
	@RequestMapping("/dataEntSecAcctChangePage")
	@ResponseBody
	public Map<String, Object> dataEntSecAcctChangePage(Page page){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			PageData pd = this.getPageData();
			pd.put("COMPANY", company);
			pd.put("queryType", "CHECK");
			int pge = Integer.parseInt(pd.getString("page"));
			int limit = Integer.parseInt(pd.getString("limit"));
			page.setCurrentPage(pge);
			page.setShowCount(limit);
			page.setPd(pd);
			List<EnSecAcctInf> entDataList = enSecAcctInfService.getEnList(page);
			resultMap.put("code", 0);
			resultMap.put("msg","");
			resultMap.put("count", page.getTotalResult());
			resultMap.put("data", entDataList);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("code", 1);
		}
		return resultMap;
	}
	
}
