package com.dcits.supervise.pecr.common.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.omg.Dynamic.Parameter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.UuidUtil;
import com.dcits.supervise.pecr.common.service.GenerateUUIDMapper;
import com.dcits.supervise.pecr.common.service.RuleMapper;
import com.dcits.supervise.pecr.exceptions.BusinessException;
import com.dcits.supervise.pecr.feedbackreport.entity.FeedBackReportCode;
import com.dcits.supervise.pecr.feedbackreport.entity.FeedBackReportErrorMessage;
import com.dcits.supervise.pecr.feedbackreport.mapper.ReportFeedBackMessageMapper;
import com.dcits.supervise.pecr.generateReport.entity.ReportAndBackMessageEnt;
import com.dcits.supervise.pecr.indv.service.dataRecode.InCtrctInfManager;
import com.dcits.supervise.pecr.indv.service.dataRecode.InIDEfctInfManager;
import com.dcits.supervise.pecr.indv.service.dataRecode.LoanAcctInfoManager;
import com.dcits.supervise.pecr.indv.service.dataRecode.impl.IndvBasicsInfoService;
import com.dcits.supervise.pecr.util.PecrConstantUtil;
import com.dcits.supervise.pecr.util.StringDateUtil;

/**
 * 回执规则配置管理
 * @author 穆楠  
 *
 */
@Controller
@RequestMapping("/Rule")
public class RuleController extends BaseController{

	
	
	
	@Autowired
	private ReportFeedBackMessageMapper reportFeedBackMessageManageService;
	@Autowired
	private IndvBasicsInfoService indvBasicsInfoService;
	@Autowired
	private GenerateUUIDMapper generateUUIDService;
	@Autowired
	private InIDEfctInfManager InIDEfctInfService; 
	@Autowired
	private InCtrctInfManager inCtrctInfService;
	

	@Autowired
	private LoanAcctInfoManager loanAcctInfoService;
	@Autowired
	private RuleMapper checkRuleService;
	
	/**
	 * 数据列表界面
	 * @return
	 */
	@RequestMapping("/dataPage")
	public String dataPage() {
		return "pecr/Rule/RuleManagerList";
	}
	
	
	@RequestMapping("/test")
	@ResponseBody
	public Map<String, Object> importFeedBackReport(@RequestParam(value="file", required = false) MultipartFile[] files,Boolean isLocal) throws Exception {
		Map<String, Object> mapresult = new HashMap<String, Object>(3);
		for (MultipartFile file : files) {
			int lineNum = 0;
			String header = "";
			BufferedReader readerBack = new BufferedReader(new InputStreamReader(file.getInputStream()));

			List<String> fileBody = new ArrayList<>();
			
			String line = null;
			
			while ((line = readerBack.readLine()) != null) {
				if (++lineNum != 1) {
					fileBody.add(line);
					//break;
				}
				//header = line;
				if(lineNum == 1){
					header = line.toString().substring(14);
				}
				
			}
			readerBack.close();
			if(generateUUIDService.getXmlLog(header)<=0){
				for(String str : fileBody){
					Page page = new Page();
					String uuid = generateUUIDService.generateUUID(page);
					Document document = DocumentHelper.parseText(str);
					Element rootElt = document.getRootElement();
					List<Element> isEle = rootElt.elements();
					
					//个人基本信息
					if(isEle.get(0).getName().equals("InBasInf")){
						Element InBasInf = rootElt.element("InBasInf");
						System.out.println("个人基本信息");
						List<Element> InBasInfs = InBasInf.elements();
						String rpt_date = "";
						for(Element InBasInfiten: InBasInfs){
							Map map = new HashMap<>();
							//个人基本信息 基础段
							if(InBasInfiten.getName().equals("BsSgmt")){
								map.put("paaBsSmgtId", uuid);
								//map.put("InfRecType", InBasInfiten.element("InfRecType"));
								map.put("name", InBasInfiten.element("Name").getStringValue());
								map.put("idType", InBasInfiten.element("IDType").getStringValue());
								map.put("idNum", InBasInfiten.element("IDNum").getStringValue());
								map.put("infSurcCode", InBasInfiten.element("InfSurcCode").getStringValue());
								map.put("rptDate", InBasInfiten.element("RptDate").getStringValue());
								map.put("rptDateCode", InBasInfiten.element("RptDateCode").getStringValue());
								map.put("cimoc", InBasInfiten.element("Cimoc").getStringValue());
								map.put("customerType", InBasInfiten.element("CustomerType").getStringValue());
								indvBasicsInfoService.insertPcBasBsSgmt(map);
								rpt_date = InBasInfiten.element("RptDate").getStringValue();
							}else if(InBasInfiten.getName().equals("FcsInfSgmt")){
								String uuid2 = generateUUIDService.generateUUID(page);
								map.put("pacFcsInfSgmtId", uuid2);
								map.put("paaBsSmgtId", uuid);
								//map.put("InfRecType", InBasInfiten.element("InfRecType"));
								map.put("sex", InBasInfiten.element("Sex").getStringValue());
								map.put("dob", InBasInfiten.element("DOB").getStringValue());
								map.put("nation", InBasInfiten.element("Nation").getStringValue());
								map.put("houseAdd", InBasInfiten.element("HouseAdd").getStringValue());
								map.put("hhDist", InBasInfiten.element("HhDist").getStringValue());
								map.put("cellPhone", InBasInfiten.element("CellPhone").getStringValue());
								map.put("email", InBasInfiten.element("Email").getStringValue());
								map.put("fcsInfoUpDate", InBasInfiten.element("FcsInfoUpDate").getStringValue());
								map.put("rptDate", rpt_date);
								indvBasicsInfoService.insertPcBasFcsInfSgmt(map);
							}else if(InBasInfiten.getName().equals("SpsInfSgmt")){
								String uuid2 = generateUUIDService.generateUUID(page);
								map.put("pahSpsInfSgmtId", uuid2);
								map.put("paaBsSmgtId", uuid);
								map.put("mariStatus", InBasInfiten.element("MariStatus").getStringValue());
								map.put("spsInfoUpDate", InBasInfiten.element("SpsInfoUpDate").getStringValue());
								System.out.println(InBasInfiten.element("SpoName"));
								map.put("spoName", InBasInfiten.element("SpoName")!=null?InBasInfiten.element("SpoName").getStringValue():"");
								map.put("spoIdType", InBasInfiten.element("SpoIdType")!=null?InBasInfiten.element("SpoIdType").getStringValue():"");
								map.put("spoIdNum", InBasInfiten.element("SpoIdNum")!=null?InBasInfiten.element("SpoIdNum").getStringValue():"");
								map.put("spoTel", InBasInfiten.element("SpoTel")!=null?InBasInfiten.element("SpoTel").getStringValue():"");
								map.put("spsCmpyNm", InBasInfiten.element("SpsCmpyNm")!=null?InBasInfiten.element("SpsCmpyNm").getStringValue():"");
								
								map.put("rptDate", rpt_date);
								indvBasicsInfoService.insertPcBasSpsInfSgmt(map);
							}else if(InBasInfiten.getName().equals("EduInfSgmt")){
								String uuid2 = generateUUIDService.generateUUID(page);
								map.put("padEduInfSgmtId", uuid2);
								map.put("paaBsSmgtId", uuid);
								map.put("rptDate", rpt_date);
								
								map.put("eduLevel", InBasInfiten.element("EduLevel").getStringValue());
								map.put("acaDegree", InBasInfiten.element("AcaDegree").getStringValue());
								map.put("eduInfoUpDate", InBasInfiten.element("EduInfoUpDate").getStringValue());
								
								indvBasicsInfoService.insertPcBasEduInfSgmt(map);
							}else if(InBasInfiten.getName().equals("OctpnInfSgmt")){
								String uuid2 = generateUUIDService.generateUUID(page);
								map.put("paeOctpnInfSgmtId", uuid2);
								map.put("paaBsSmgtId", uuid);
								
								map.put("empStatus", InBasInfiten.element("EmpStatus").getStringValue());
								map.put("octpnInfoUpDate", InBasInfiten.element("OctpnInfoUpDate").getStringValue());
								
								map.put("cpnName", InBasInfiten.element("CpnName")!=null?InBasInfiten.element("CpnName").getStringValue():"");
								map.put("cpnType", InBasInfiten.element("CpnType")!=null?InBasInfiten.element("CpnType").getStringValue():"");
								map.put("spoIdNum", InBasInfiten.element("SpoIdNum")!=null?InBasInfiten.element("SpoIdNum").getStringValue():"");
								map.put("industry", InBasInfiten.element("Industry")!=null?InBasInfiten.element("Industry").getStringValue():"");
								map.put("cpnAddr", InBasInfiten.element("CpnAddr")!=null?InBasInfiten.element("CpnAddr").getStringValue():"");
								map.put("cpnPc", InBasInfiten.element("CpnPc")!=null?InBasInfiten.element("CpnPc").getStringValue():"");
								map.put("cpnDist", InBasInfiten.element("CpnDist")!=null?InBasInfiten.element("CpnDist").getStringValue():"");
								map.put("cpnTEL", InBasInfiten.element("CpnTEL")!=null?InBasInfiten.element("CpnTEL").getStringValue():"");
								map.put("occupation", InBasInfiten.element("Occupation")!=null?InBasInfiten.element("Occupation").getStringValue():"");
								map.put("cpnTEL", InBasInfiten.element("CpnTEL")!=null?InBasInfiten.element("CpnTEL").getStringValue():"");
								map.put("title", InBasInfiten.element("Title")!=null?InBasInfiten.element("Title").getStringValue():"");
								map.put("workStartDate", InBasInfiten.element("WorkStartDate")!=null?InBasInfiten.element("WorkStartDate").getStringValue():"");
								
								map.put("rptDate", rpt_date);
								indvBasicsInfoService.insertPcBasOctpnInfSgmt(map);
							}else if(InBasInfiten.getName().equals("RedncInfSgmt")){
								String uuid2 = generateUUIDService.generateUUID(page);
								map.put("pafRedncInfSgmtId", uuid2);
								map.put("paaBsSmgtId", uuid);
								
								map.put("resiStatus", InBasInfiten.element("ResiStatus").getStringValue());
								map.put("resiAddr", InBasInfiten.element("ResiAddr").getStringValue());
								map.put("resiPc", InBasInfiten.element("ResiPc").getStringValue());
								map.put("resiDist", InBasInfiten.element("ResiDist").getStringValue());
								map.put("homeTel", InBasInfiten.element("HomeTel").getStringValue());
								map.put("resiInfoUpDate", InBasInfiten.element("ResiInfoUpDate").getStringValue());
								
								map.put("rptDate", rpt_date);
								indvBasicsInfoService.insertPcBasRedncInfSgmt(map);
							}else if(InBasInfiten.getName().equals("MlgInfSgmt")){
								String uuid2 = generateUUIDService.generateUUID(page);
								map.put("pagMlgInfSgmtId", uuid2);
								map.put("paaBsSmgtId", uuid);
								
								map.put("mailAddr", InBasInfiten.element("MailAddr").getStringValue());
								map.put("mailPc", InBasInfiten.element("MailPc").getStringValue());
								map.put("mailDist", InBasInfiten.element("MailDist").getStringValue());
								map.put("mlgInfoUpDate", InBasInfiten.element("MlgInfoUpDate").getStringValue());
								
								map.put("rptDate", rpt_date);
								indvBasicsInfoService.insertPcBasMlgInfSgmt(map);
							}
						}
					//个人证件有效期信息
					}else if(isEle.get(0).getName().equals("InIDEfctInf")){
						Element InIDEfctInf = rootElt.element("InIDEfctInf");
						System.out.println("个人证件有效期信息");
						//String rpt_date = "";
							PageData pd = this.getPageData();
								pd.put("pakInIdEfctInfId", uuid);
								pd.put("infRecType", InIDEfctInf.element("InfRecType").getStringValue());
								pd.put("name", InIDEfctInf.element("Name").getStringValue());
								pd.put("idType", InIDEfctInf.element("IDType").getStringValue());
								pd.put("idNum", InIDEfctInf.element("IDNum").getStringValue());
								pd.put("infSurcCode", InIDEfctInf.element("InfSurcCode").getStringValue());
								pd.put("idEfctDate", InIDEfctInf.element("IDEfctDate").getStringValue());
								pd.put("idDueDate", InIDEfctInf.element("IDDueDate").getStringValue());
								pd.put("idOrgName", InIDEfctInf.element("IDOrgName").getStringValue());
								pd.put("idDist", InIDEfctInf.element("IDDist").getStringValue());
								pd.put("cimoc", InIDEfctInf.element("Cimoc").getStringValue());
								pd.put("rptDate", InIDEfctInf.element("RptDate").getStringValue());
								InIDEfctInfService.addData(pd);
								//rpt_date = InIDEfctInf.element("RptDate").getStringValue();
					//个人借贷
					}else if(isEle.get(0).getName().equals("InAcctInf")){
						
						Element InBasInf = rootElt.element("InAcctInf");
						System.out.println("个人借贷");
						List<Element> InBasInfs = InBasInf.elements();
						String rpt_date = "";
						for(Element InBasInfiten: InBasInfs){
							Map map = new HashMap<>();
							//个人借贷 基础段
							if(InBasInfiten.getName().equals("AcctBsSgmt")){
								map.put("pbaAcctBsSgmtId", uuid);
								//map.put("InfRecType", InBasInfiten.element("InfRecType"));
								map.put("infRecType", InBasInfiten.element("InfRecType").getStringValue());
								map.put("acctType", InBasInfiten.element("AcctType").getStringValue());
								map.put("acctCode", InBasInfiten.element("AcctCode").getStringValue());
								map.put("rptDate", InBasInfiten.element("RptDate").getStringValue());
								map.put("rptDateCode", InBasInfiten.element("RptDateCode").getStringValue());
								map.put("name", InBasInfiten.element("Name").getStringValue());
								map.put("idType", InBasInfiten.element("IDType").getStringValue());
								map.put("idNum", InBasInfiten.element("IDNum").getStringValue());
								map.put("mngmtOrgCode", InBasInfiten.element("MngmtOrgCode").getStringValue());
								
								loanAcctInfoService.insertAcctBsSgmt(map);
								rpt_date = InBasInfiten.element("RptDate").getStringValue();
							}else if(InBasInfiten.getName().equals("AcctBsInfSgmt")){
								String uuid2 = generateUUIDService.generateUUID(page);
								map.put("pbaAcctBsSgmtId", uuid);
								map.put("pbbAcctBsInfSgmtId", uuid2);
								//map.put("InfRecType", InBasInfiten.element("InfRecType"));
								map.put("busiLines", InBasInfiten.element("BusiLines").getStringValue());
								map.put("busiDtlLines", InBasInfiten.element("BusiDtlLines").getStringValue());
								map.put("openDate", InBasInfiten.element("OpenDate").getStringValue());
								map.put("cy", InBasInfiten.element("Cy").getStringValue());
								map.put("acctCredLine", InBasInfiten.element("AcctCredLine").getStringValue());
								map.put("dueDate", InBasInfiten.element("DueDate").getStringValue());
								map.put("applyBusiDist", InBasInfiten.element("ApplyBusiDist").getStringValue());
								map.put("guarMode", InBasInfiten.element("GuarMode").getStringValue());
								map.put("othRepyGuarWay", InBasInfiten.element("OthRepyGuarWay").getStringValue());
								map.put("assetTrandFlag", InBasInfiten.element("AssetTrandFlag").getStringValue());
								map.put("fundSou", InBasInfiten.element("FundSou").getStringValue());
								map.put("loanForm", InBasInfiten.element("LoanForm").getStringValue());
								map.put("creditID", InBasInfiten.element("CreditID").getStringValue());
								map.put("rptDate",rpt_date);
								
								loanAcctInfoService.insertAcctBsInfoSgmt(map);
							}else if(InBasInfiten.getName().equals("RltRepymtInfSgmt")){
								
								int i = Integer.decode(InBasInfiten.element("RltRepymtNm").getStringValue());
								if(i>0){
									map.put("pbaAcctBsSgmtId", uuid);
									
									List<Element> rltRepymtInfs = InBasInfiten.elements();
									map.put("rptDate",rpt_date);
									for(Element rltRepymtInf : rltRepymtInfs){
										String uuid2 = generateUUIDService.generateUUID(page);
										map.put("pbbAcctBsInfSgmtId", uuid2);
										map.put("infoIDType", rltRepymtInf.element("InfoIDType")!=null?InBasInfiten.element("InfoIDType").getStringValue():"");
										map.put("arlpName", rltRepymtInf.element("ArlpName")!=null?InBasInfiten.element("ArlpName").getStringValue():"");
										map.put("arlpCertType", rltRepymtInf.element("ArlpCertType")!=null?InBasInfiten.element("ArlpCertType").getStringValue():"");
										map.put("arlpCertNum", rltRepymtInf.element("ArlpCertNum")!=null?InBasInfiten.element("ArlpCertNum").getStringValue():"");
										map.put("arlpType", rltRepymtInf.element("ArlpType")!=null?InBasInfiten.element("ArlpType").getStringValue():"");
										map.put("arlpAmt", rltRepymtInf.element("ArlpAmt")!=null?InBasInfiten.element("ArlpAmt").getStringValue():"");
										map.put("wartySign", rltRepymtInf.element("WartySign")!=null?InBasInfiten.element("WartySign").getStringValue():"");
										map.put("maxGuarMcc", rltRepymtInf.element("MaxGuarMcc")!=null?InBasInfiten.element("MaxGuarMcc").getStringValue():""); 
										loanAcctInfoService.insertRltRepymtInf(map);
									}	
									
								}
								
							}else if(InBasInfiten.getName().equals("AcctCredSgmt")){
								String uuid2 = generateUUIDService.generateUUID(page);
								map.put("pbaAcctBsSgmtId", uuid);
								map.put("pbeAcctCredSgmtId", uuid2);
								//map.put("InfRecType", InBasInfiten.element("InfRecType"));
								map.put("mcc", InBasInfiten.element("Mcc").getStringValue());
								map.put("rptDate",rpt_date);
								
								loanAcctInfoService.insertAcctCredSgmt(map);
							}else if(InBasInfiten.getName().equals("AcctMthlyBlgInfSgmt")){
								String uuid2 = generateUUIDService.generateUUID(page);
								map.put("pbaAcctBsSgmtId", uuid);
								map.put("pbgAmblgInfSgmtId", uuid2);
								//map.put("InfRecType", InBasInfiten.element("InfRecType"));
								map.put("month", InBasInfiten.element("Month").getStringValue());
								map.put("settDate", InBasInfiten.element("SettDate").getStringValue());
								map.put("acctStatus", InBasInfiten.element("AcctStatus").getStringValue());
								map.put("acctBal", InBasInfiten.element("AcctBal").getStringValue());
								map.put("pridAcctBal", InBasInfiten.element("PridAcctBal").getStringValue());
								map.put("usedAmt", InBasInfiten.element("UsedAmt").getStringValue());
								map.put("notIsuBal", InBasInfiten.element("NotIsuBal").getStringValue());
								map.put("remRepPrd", InBasInfiten.element("RemRepPrd").getStringValue());
								map.put("fiveCate", InBasInfiten.element("FiveCate").getStringValue());
								map.put("fiveCateAdjDate", InBasInfiten.element("FiveCateAdjDate").getStringValue());
								map.put("rpyStatus", InBasInfiten.element("RpyStatus").getStringValue());
								map.put("rpyPrct", InBasInfiten.element("RpyPrct").getStringValue());
								map.put("overdPrd", InBasInfiten.element("OverdPrd").getStringValue());
								map.put("totOverd", InBasInfiten.element("TotOverd").getStringValue());
								map.put("curRpyAmt", InBasInfiten.element("CurRpyAmt").getStringValue());
								map.put("actRpyAmt", InBasInfiten.element("ActRpyAmt").getStringValue());
								map.put("latRpyDate", InBasInfiten.element("LatRpyDate").getStringValue());
								map.put("closeDate", InBasInfiten.element("CloseDate").getStringValue());
								map.put("rptDate",rpt_date);
								
								loanAcctInfoService.insertAmblgInfSgmt(map);
							}
						}
					//个人授信协议
					}else if(isEle.get(0).getName().equals("InCtrctInf")){
						
						Element InBasInf = rootElt.element("InCtrctInf");
						System.out.println("个人授信协议");
						List<Element> InBasInfs = InBasInf.elements();
						String rpt_date = "";
						for(Element InBasInfiten: InBasInfs){
							Map map = new HashMap<>();
							//个人授信协议 基础段
							if(InBasInfiten.getName().equals("CtrctBsSgmt")){
								map.put("pcaCtrctBsSgmtId", uuid);
								
								map.put("infRecType", InBasInfiten.element("InfRecType").getStringValue());
								map.put("contractCode", InBasInfiten.element("ContractCode").getStringValue());
								map.put("rptDate", InBasInfiten.element("RptDate").getStringValue());
								map.put("rptDateCode", InBasInfiten.element("RptDateCode").getStringValue());
								map.put("name", InBasInfiten.element("Name").getStringValue());
								map.put("iDType", InBasInfiten.element("IDType").getStringValue());
								map.put("iDNum", InBasInfiten.element("IDNum").getStringValue());
								map.put("mngmtOrgCode", InBasInfiten.element("MngmtOrgCode").getStringValue());
								
								inCtrctInfService.insertCtrctBsSgmt(map);
								rpt_date = InBasInfiten.element("RptDate").getStringValue();
							}else if(InBasInfiten.getName().equals("CreditLimSgmt")){
								String uuid2 = generateUUIDService.generateUUID(page);
								map.put("pcaCtrctBsSgmtId", uuid);
								map.put("pccCreditLimSgmtId", uuid2);
								
								map.put("creditLimType", InBasInfiten.element("CreditLimType").getStringValue());
								map.put("limLoopFlg", InBasInfiten.element("LimLoopFlg").getStringValue());
								map.put("creditLim", InBasInfiten.element("CreditLim").getStringValue());
								map.put("cy", InBasInfiten.element("Cy").getStringValue());
								map.put("conEffDate", InBasInfiten.element("ConEffDate").getStringValue());
								map.put("conExpDate", InBasInfiten.element("ConExpDate").getStringValue());
								map.put("conStatus", InBasInfiten.element("ConStatus").getStringValue());
								map.put("rptDate",rpt_date);
								
								inCtrctInfService.insertCreditLimSgmt(map);
							}
						}
						
					}
					
				}
				generateUUIDService.insertXmlLog(header);
			}
			
        }
		mapresult.put("success", true);
		mapresult.put("msg", "解析完成");
        return mapresult;
		
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
		try {
			PageData pd = this.getPageData();
			int pge = Integer.parseInt(pd.getString("page"));
			int limit = Integer.parseInt(pd.getString("limit"));
			page.setCurrentPage(pge);
			page.setShowCount(limit);
			page.setPd(pd);
			List<PageData> dataList = checkRuleService.queryCheckRule(page);
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
	 * 新增或修改
	 * @param page
	 * @return
	 */
	@RequestMapping("/addOrUpdate")
	@ResponseBody
	public Map<String, Object> addOrUpdateRule(Page page){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			PageData pd = this.getPageData();
			String addOrUpdate = pd.getString("addOrUpdate");
			pd.put("UUID", UuidUtil.get32UUID());
			if("add".equalsIgnoreCase(addOrUpdate)) {
				
					checkRuleService.addCheckRules(pd);
				
			}else {
				checkRuleService.updateCheckRules(pd);
			}
			resultMap.put("success", true);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
		}
		return resultMap;
	}

}
