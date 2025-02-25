package com.dcits.supervise.pecr.generateReport;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.RejectedExecutionException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.ent.service.packet.EntNormalMessageManager;
import com.dcits.supervise.pecr.generateReport.ThreadExcute.MySmartLifecycle;
import com.dcits.supervise.pecr.generateReport.entity.NeedReportDetail;
import com.dcits.supervise.pecr.indv.service.packet.IndvNormalMessageManager;
import com.dcits.supervise.pecr.motga.service.MotgaNormalMessageManager;
import com.dcits.supervise.pecr.util.PecrConstantUtil;

import net.sf.json.JSONObject;

/**
 * 生成报文Controller
 * @author munan
 *
 */
@Controller
@RequestMapping("/generateMessageCt")
public class GenerateMessageController extends BaseController{

	private final static Logger logger = Logger.getLogger(GenerateMessageController.class);
	
	@Autowired
	private MySmartLifecycle mySmartLifecycle;
	
	//20210311,开发调度批量生成报文接口
	@Autowired
	private IndvNormalMessageManager indvNormalMessageService;
	@Autowired
	private EntNormalMessageManager entNormalMessageService;
	@Autowired
	private MotgaNormalMessageManager motgaNormalMessageService;
	
	@ResponseBody
	@RequestMapping("/generateMessage")
	public Map<String, Object> generateMessage(Page page,HttpServletRequest request, HttpServletResponse response){
		Session session = Jurisdiction.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		String name = user.getUSERNAME();
		Map<String, Object> map = new HashMap<String,Object>(3); 
		try{
			PageData pd = this.getPageData();
			String normalOrAbnormal = pd.get("normalOrAbnormal").toString();
			String str = pd.get("str").toString();
			//校验值
			if(str.isEmpty()||normalOrAbnormal.isEmpty()){
				logger.info("报文整体类型为空");
				map.put("success", false);
				map.put("msg", "报文整体类型为空");
				return map;
			}
			String[] strs = str.split(";");
			List<NeedReportDetail> list = toList(normalOrAbnormal, strs);
			if(list.size()==0){
				logger.info("请求对象为空，请重新请求");
				map.put("success", false);
				map.put("msg", "请求对象为空，请重新请求");
				return map;
			}
			for (NeedReportDetail needReportDetail2 : list) {
				mySmartLifecycle.generateThread(needReportDetail2,name);
			}
			logger.info("正在生成报文，请稍后查看");
			map.put("success", true);
			map.put("msg", "正在生成报文，请稍后查看");
			return map;
		}catch(RejectedExecutionException e){
			logger.info("生成报文任务繁忙，请稍后再试",e);
			map.put("success", false);
			map.put("msg", "生成报文任务繁忙，请稍后再试");
			return map;
		}catch(IllegalStateException e){
			logger.info("生成报文任务错误，请稍后再试",e);
			map.put("success", false);
			map.put("msg", "生成报文任务错误，请稍后再试");
			return map;
		}catch(Exception e){
			logger.info("生成报文任务错误，请联系管理员",e);
			map.put("success", false);
			map.put("msg", "生成报文任务错误，请联系管理员");
			return map;
		}
	}
	
	public List<NeedReportDetail> toList(String normalOrAbnormal, String[] strs) {
		List<NeedReportDetail> list = new ArrayList<NeedReportDetail>();
		if (normalOrAbnormal.equals(PecrConstantUtil.INDV_NORMAL)) {
			List<String> indv_bs_sgmt = new ArrayList<String>();
			List<String> in_fal_mmbs_inf = new ArrayList<String>();
			List<String> in_id_efct_inf = new ArrayList<String>();
			List<String> in_ctf_itg_inf = new ArrayList<String>();
			List<String> acct_bs_sgmt = new ArrayList<String>();
			List<String> ctrct_bs_sgmt = new ArrayList<String>();
			List<String> guar_acct_bs_sgmt = new ArrayList<String>();
			List<String> in_spc_evt_dsc_inf = new ArrayList<String>();
		//	李继坤
			List<String> companyLists = new ArrayList<String>();
			for (String str : strs) {
				String[] temp = str.split(",");
				String infType = temp[0];
				String rptDate = temp[1];
				String company = temp[2];
				//只想让其插入一次
				if(company != null && !"".equals(company) && companyLists.size() < 1){
					companyLists.add(company);
				}
				switch (infType) {
				case PecrConstantUtil.INDV_BS_SGMT:
					indv_bs_sgmt.add(rptDate);
					break;
				case PecrConstantUtil.IN_FAL_MMBS_INF:
					in_fal_mmbs_inf.add(rptDate);
					break;
				case PecrConstantUtil.IN_ID_EFCT_INF:
					in_id_efct_inf.add(rptDate);
					break;
				case PecrConstantUtil.IN_CTF_ITG_INF:
					in_ctf_itg_inf.add(rptDate);
					break;
				case PecrConstantUtil.ACCT_BS_SGMT:
					acct_bs_sgmt.add(rptDate);
					break;
				case PecrConstantUtil.CTRCT_BS_SGMT:
					ctrct_bs_sgmt.add(rptDate);
					break;
				case PecrConstantUtil.IN_SEC_ACCT_INF:
					guar_acct_bs_sgmt.add(rptDate);
					break;
				case PecrConstantUtil.IN_SPC_EVT_DSC_INF:
					in_spc_evt_dsc_inf.add(rptDate);
					break;
				default:
					break;
				}
			}
			if(in_spc_evt_dsc_inf.size()!=0)
				list.add(new NeedReportDetail(PecrConstantUtil.IN_SPC_EVT_DSC_INF, in_spc_evt_dsc_inf,companyLists, null));
			if(guar_acct_bs_sgmt.size()!=0)
				list.add(new NeedReportDetail(PecrConstantUtil.IN_SEC_ACCT_INF, guar_acct_bs_sgmt,companyLists, null));
			if(ctrct_bs_sgmt.size()!=0)
				list.add(new NeedReportDetail(PecrConstantUtil.CTRCT_BS_SGMT, ctrct_bs_sgmt,companyLists, null));
			if(acct_bs_sgmt.size()!=0)
				list.add(new NeedReportDetail(PecrConstantUtil.ACCT_BS_SGMT, acct_bs_sgmt,companyLists, null));
			if(in_ctf_itg_inf.size()!=0)
				list.add(new NeedReportDetail(PecrConstantUtil.IN_CTF_ITG_INF, in_ctf_itg_inf,companyLists, null));
			if(in_id_efct_inf.size()!=0)
				list.add(new NeedReportDetail(PecrConstantUtil.IN_ID_EFCT_INF, in_id_efct_inf,companyLists, null));
			if(in_fal_mmbs_inf.size()!=0)
				list.add(new NeedReportDetail(PecrConstantUtil.IN_FAL_MMBS_INF, in_fal_mmbs_inf,companyLists, null));
			if(indv_bs_sgmt.size()!=0)
				list.add(new NeedReportDetail(PecrConstantUtil.INDV_BS_SGMT, indv_bs_sgmt,companyLists,null));
			return list;
		} else if (normalOrAbnormal.equals(PecrConstantUtil.INDV_ABNORMAL)) {
			List<String> IN_BS_INF_DLT = new ArrayList<String>();
			List<String> IN_SEC_ACCT_MDFC = new ArrayList<String>();
			List<String> IN_ID_EFCT_INF_DLT = new ArrayList<String>();
			List<String> IN_ACCT_ID_CAGS_INF = new ArrayList<String>();
			List<String> IN_ACCT_MDFC = new ArrayList<String>();
			List<String> IN_ACCT_DEL = new ArrayList<String>();
			List<String> IN_ACCT_ENT_DEL = new ArrayList<String>();
			List<String> IN_CTRCT_ID_CAGS_INF = new ArrayList<String>();
			List<String> IN_CTRCT_MDFC = new ArrayList<String>();
			List<String> IN_CTRCT_DEL = new ArrayList<String>();
			List<String> IN_CTRCT_ENT_DEL = new ArrayList<String>();
			List<String> IN_SEC_ACCT_ID_CAGS_INF = new ArrayList<String>();
			List<String> IN_SEC_ACCT_DEL = new ArrayList<String>();
			List<String> IN_SEC_ACCT_ENT_DEL = new ArrayList<String>();
			List<String> companyLists = new ArrayList<String>();
			for (String str : strs) {
				String[] temp = str.split(",");
				String infType = temp[0];
				String company=temp[1];
				String rptDateItem=temp[2];
				if(company != null && !"".equals(company) && companyLists.size() < 1){
					companyLists.add(company);
				}
				switch (infType) {
				case PecrConstantUtil.IN_BS_INF_DLT:
					IN_BS_INF_DLT.add(rptDateItem);
					break;
				case PecrConstantUtil.IN_ID_EFCT_INF_DLT:
					IN_ID_EFCT_INF_DLT.add(rptDateItem);
					break;
				case PecrConstantUtil.IN_ACCT_ID_CAGS_INF:
					IN_ACCT_ID_CAGS_INF.add(rptDateItem);
					break;
				case PecrConstantUtil.IN_ACCT_MDFC:
					IN_ACCT_MDFC.add(rptDateItem);
					break;
				case PecrConstantUtil.IN_ACCT_DEL:
					IN_ACCT_DEL.add(rptDateItem);
					break;
				case PecrConstantUtil.IN_ACCT_ENT_DEL:
					IN_ACCT_ENT_DEL.add(rptDateItem);
					break;
				case PecrConstantUtil.IN_CTRCT_ID_CAGS_INF:
					IN_CTRCT_ID_CAGS_INF.add(rptDateItem);
					break;
				case PecrConstantUtil.IN_CTRCT_MDFC:
					IN_CTRCT_MDFC.add(rptDateItem);
					break;
				case PecrConstantUtil.IN_CTRCT_DEL:
					IN_CTRCT_DEL.add(rptDateItem);
					break;
				case PecrConstantUtil.IN_CTRCT_ENT_DEL:
					IN_CTRCT_ENT_DEL.add(rptDateItem);
					break;
				case PecrConstantUtil.IN_SEC_ACCT_ID_CAGS_INF:
					IN_SEC_ACCT_ID_CAGS_INF.add(rptDateItem);
					break;
				case PecrConstantUtil.IN_SEC_ACCT_DEL:
					IN_SEC_ACCT_DEL.add(rptDateItem);
					break;
				case PecrConstantUtil.IN_SEC_ACCT_ENT_DEL:
					IN_SEC_ACCT_ENT_DEL.add(rptDateItem);
					break;
				case PecrConstantUtil.IN_SEC_ACCT_MDFC:
					IN_SEC_ACCT_MDFC.add(rptDateItem);
					break;
				default:
					break;
				}
			}
			if(IN_BS_INF_DLT.size()!=0)
				list.add(new NeedReportDetail(PecrConstantUtil.IN_BS_INF_DLT, IN_BS_INF_DLT,companyLists, null));
			if(IN_ID_EFCT_INF_DLT.size()!=0)
				list.add(new NeedReportDetail(PecrConstantUtil.IN_ID_EFCT_INF_DLT, IN_ID_EFCT_INF_DLT,companyLists, null));
			if(IN_ACCT_ID_CAGS_INF.size()!=0)
				list.add(new NeedReportDetail(PecrConstantUtil.IN_ACCT_ID_CAGS_INF, IN_ACCT_ID_CAGS_INF,companyLists, null));
			if(IN_ACCT_MDFC.size()!=0)
				list.add(new NeedReportDetail(PecrConstantUtil.IN_ACCT_MDFC, IN_ACCT_MDFC,companyLists, null));
			if(IN_ACCT_DEL.size()!=0)
				list.add(new NeedReportDetail(PecrConstantUtil.IN_ACCT_DEL, IN_ACCT_DEL,companyLists, null));
			if(IN_CTRCT_ID_CAGS_INF.size()!=0)
				list.add(new NeedReportDetail(PecrConstantUtil.IN_CTRCT_ID_CAGS_INF, IN_CTRCT_ID_CAGS_INF,companyLists, null));
			if(IN_CTRCT_MDFC.size()!=0)
				list.add(new NeedReportDetail(PecrConstantUtil.IN_CTRCT_MDFC, IN_CTRCT_MDFC,companyLists, null));
			if(IN_CTRCT_DEL.size()!=0)
				list.add(new NeedReportDetail(PecrConstantUtil.IN_CTRCT_DEL, IN_CTRCT_DEL,companyLists, null));
			if(IN_SEC_ACCT_ID_CAGS_INF.size()!=0)
				list.add(new NeedReportDetail(PecrConstantUtil.IN_SEC_ACCT_ID_CAGS_INF, IN_SEC_ACCT_ID_CAGS_INF,companyLists, null));
			if(IN_SEC_ACCT_DEL.size()!=0)
				list.add(new NeedReportDetail(PecrConstantUtil.IN_SEC_ACCT_DEL, IN_SEC_ACCT_DEL,companyLists, null));
			if(IN_SEC_ACCT_MDFC.size()!=0){
				list.add(new NeedReportDetail(PecrConstantUtil.IN_SEC_ACCT_MDFC, IN_SEC_ACCT_MDFC,companyLists, null));
			}
			if(IN_ACCT_ENT_DEL.size()!=0){
				list.add(new NeedReportDetail(PecrConstantUtil.IN_ACCT_ENT_DEL, IN_ACCT_ENT_DEL,companyLists, null));
			}
			if(IN_CTRCT_ENT_DEL.size()!=0){
				list.add(new NeedReportDetail(PecrConstantUtil.IN_CTRCT_ENT_DEL, IN_CTRCT_ENT_DEL,companyLists, null));
			}
			if(IN_SEC_ACCT_ENT_DEL.size()!=0){
				list.add(new NeedReportDetail(PecrConstantUtil.IN_SEC_ACCT_ENT_DEL, IN_SEC_ACCT_ENT_DEL,companyLists, null));
			}
			return list;

		} else if (normalOrAbnormal.equals(PecrConstantUtil.ENT_NORMAL)) {
			List<String> ent_bs_sgmt = new ArrayList<String>();
			List<String> ent_income_and_expense_stateme_bs = new ArrayList<String>();
			List<String> ENT_EN_ICDN_RLTP_INF = new ArrayList<String>();
			List<String> ENT_ACCT_BS_SGMT = new ArrayList<String>();
			List<String> ENT_GUAR_ACCT_BS_SGMT = new ArrayList<String>();
			List<String> ENT_EN_CTRCT_INF = new ArrayList<String>();
			List<String> ENT_BALANCE_SHEET = new ArrayList<String>();
			List<String> ENT_CASH_FLOWS = new ArrayList<String>();
			List<String> ENT_INCODE_STATE_PRO = new ArrayList<String>();
			List<String> ENT_INST_BALANCE = new ArrayList<String>();
			List<String> companyLists = new ArrayList<String>();
			for (String str : strs) {
				String[] temp = str.split(",");
				String infType = temp[0];
				String rptDate = temp[1];
				String company=temp[2];
				if(company != null && !"".equals(company) && companyLists.size() < 1){
					companyLists.add(company);
				}
				switch (infType) {
				case PecrConstantUtil.ENT_BS_SGMT:
					ent_bs_sgmt.add(rptDate);
					break;
				case PecrConstantUtil.ENT_INCOME_AND_EXPENSE_STATEME_BS:
					ent_income_and_expense_stateme_bs.add(rptDate);
					break;
				case PecrConstantUtil.ENT_EN_ICDN_RLTP_INF:
					ENT_EN_ICDN_RLTP_INF.add(rptDate);
					break;
				case PecrConstantUtil.ENT_ACCT_BS_SGMT:
					ENT_ACCT_BS_SGMT.add(rptDate);
					break;
				case PecrConstantUtil.ENT_GUAR_ACCT_BS_SGMT:
					ENT_GUAR_ACCT_BS_SGMT.add(rptDate);
					break;
				case PecrConstantUtil.ENT_EN_CTRCT_INF:
					ENT_EN_CTRCT_INF.add(rptDate);
					break;
				case PecrConstantUtil.ENT_BALANCE_SHEET:
					ENT_BALANCE_SHEET.add(rptDate);
					break;
				case PecrConstantUtil.ENT_CASH_FLOWS:
					ENT_CASH_FLOWS.add(rptDate);
					break;
				case PecrConstantUtil.ENT_INCODE_STATE_PRO:
					ENT_INCODE_STATE_PRO.add(rptDate);
					break;
				case PecrConstantUtil.ENT_INST_BALANCE:
					ENT_INST_BALANCE.add(rptDate);
					break;
				default:
					break;
				}
			}
			if(ent_bs_sgmt.size()!=0)
				list.add(new NeedReportDetail(PecrConstantUtil.ENT_BS_SGMT, ent_bs_sgmt,companyLists, null));
			if(ent_income_and_expense_stateme_bs.size()!=0)
				list.add(new NeedReportDetail(PecrConstantUtil.ENT_INCOME_AND_EXPENSE_STATEME_BS, ent_income_and_expense_stateme_bs,companyLists, null));
			if(ENT_EN_ICDN_RLTP_INF.size()!=0)
				list.add(new NeedReportDetail(PecrConstantUtil.ENT_EN_ICDN_RLTP_INF, ENT_EN_ICDN_RLTP_INF,companyLists, null));
			if(ENT_ACCT_BS_SGMT.size()!=0)
				list.add(new NeedReportDetail(PecrConstantUtil.ENT_ACCT_BS_SGMT, ENT_ACCT_BS_SGMT,companyLists, null));
			if(ENT_GUAR_ACCT_BS_SGMT.size()!=0)
				list.add(new NeedReportDetail(PecrConstantUtil.ENT_GUAR_ACCT_BS_SGMT, ENT_GUAR_ACCT_BS_SGMT,companyLists, null));
			if(ENT_EN_CTRCT_INF.size()!=0)
				list.add(new NeedReportDetail(PecrConstantUtil.ENT_EN_CTRCT_INF, ENT_EN_CTRCT_INF,companyLists, null));
			if(ENT_BALANCE_SHEET.size()!=0)
				list.add(new NeedReportDetail(PecrConstantUtil.ENT_BALANCE_SHEET, ENT_BALANCE_SHEET,companyLists, null));
			if(ENT_CASH_FLOWS.size()!=0)
				list.add(new NeedReportDetail(PecrConstantUtil.ENT_CASH_FLOWS, ENT_CASH_FLOWS,companyLists, null));
			if(ENT_INCODE_STATE_PRO.size()!=0)
				list.add(new NeedReportDetail(PecrConstantUtil.ENT_INCODE_STATE_PRO, ENT_INCODE_STATE_PRO,companyLists, null));
			if(ENT_INST_BALANCE.size()!=0)
				list.add(new NeedReportDetail(PecrConstantUtil.ENT_INST_BALANCE, ENT_INST_BALANCE,companyLists, null));
			return list;

		} else if (normalOrAbnormal.equals(PecrConstantUtil.ENT_ABNORMAL)) {
			List<String> ENT_BALANCE_SHEET_DLT = new ArrayList<String>();
			List<String> ENT_INCODE_STATE_PRO_DLT = new ArrayList<String>();
			List<String> ENT_CASH_FLOWS_DLT = new ArrayList<String>();
			List<String> ENT_INST_BALANCE_DLT = new ArrayList<String>();
			List<String> ENT_INCOME_AND_EXPENSE_STATEME_BS_DLT = new ArrayList<String>();
			List<String> EN_SEC_ACCT_ID_CAGS_INF = new ArrayList<String>();
			List<String> EN_SEC_ACCT_MDFC = new ArrayList<String>();
			List<String> EN_SEC_ACCT_DEL = new ArrayList<String>();
			List<String> EN_SEC_ACCT_ENT_DEL = new ArrayList<String>();
			List<String> EN_BS_INF_DLT = new ArrayList<String>();
			List<String> EN_ACCT_INF_ID_CAGS_INF = new ArrayList<String>();
			List<String> EN_ACCT_INF_MDFC = new ArrayList<String>();
			List<String> EN_ACCT_INF_DEL = new ArrayList<String>();
			List<String> EN_ACCT_INF_ENT_DEL = new ArrayList<String>();
			List<String> EN_CTRCT_INF_ID_CAGS_INF = new ArrayList<String>();
			List<String> EN_CTRCT_INF_MDFC = new ArrayList<String>();
			List<String> EN_CTRCT_INF_DEL = new ArrayList<String>();
			List<String> EN_CTRCT_INF_ENT_DEL = new ArrayList<String>();
			List<String> companyLists = new ArrayList<String>();
			for (String str : strs) {
				String[] temp = str.split(",");
				String infType = temp[0];
				String rptDate = temp[1];
				String company=temp[2];
				if(company != null && !"".equals(company) && companyLists.size() < 1){
					companyLists.add(company);
				}
				switch (infType) {
				case PecrConstantUtil.ENT_BALANCE_SHEET_DLT:
					ENT_BALANCE_SHEET_DLT.add(rptDate);
					break;
				case PecrConstantUtil.ENT_INCODE_STATE_PRO_DLT:
					ENT_INCODE_STATE_PRO_DLT.add(rptDate);
					break;
				case PecrConstantUtil.ENT_CASH_FLOWS_DLT:
					ENT_CASH_FLOWS_DLT.add(rptDate);
					break;
				case PecrConstantUtil.ENT_INST_BALANCE_DLT:
					ENT_INST_BALANCE_DLT.add(rptDate);
					break;
				case PecrConstantUtil.ENT_INCOME_AND_EXPENSE_STATEME_BS_DLT:
					ENT_INCOME_AND_EXPENSE_STATEME_BS_DLT.add(rptDate);
					break;
				case PecrConstantUtil.EN_SEC_ACCT_ID_CAGS_INF:
					EN_SEC_ACCT_ID_CAGS_INF.add(rptDate);
					break;
				case PecrConstantUtil.EN_SEC_ACCT_MDFC:
					EN_SEC_ACCT_MDFC.add(rptDate);
					break;
				case PecrConstantUtil.EN_SEC_ACCT_DEL:
					EN_SEC_ACCT_DEL.add(rptDate);
					break;
				case PecrConstantUtil.EN_SEC_ACCT_ENT_DEL:
					EN_SEC_ACCT_ENT_DEL.add(rptDate);
					break;
				case PecrConstantUtil.EN_BS_INF_DLT:
					EN_BS_INF_DLT.add(rptDate);
					break;
				case PecrConstantUtil.EN_ACCT_INF_ID_CAGS_INF:
					EN_ACCT_INF_ID_CAGS_INF.add(rptDate);
					break;
				case PecrConstantUtil.EN_ACCT_INF_MDFC:
					EN_ACCT_INF_MDFC.add(rptDate);
					break;
				case PecrConstantUtil.EN_ACCT_INF_DEL:
					EN_ACCT_INF_DEL.add(rptDate);
					break;
				case PecrConstantUtil.EN_ACCT_INF_ENT_DEL:
					EN_ACCT_INF_ENT_DEL.add(rptDate);
					break;
				case PecrConstantUtil.EN_CTRCT_INF_ID_CAGS_INF:
					EN_CTRCT_INF_ID_CAGS_INF.add(rptDate);
					break;
				case PecrConstantUtil.EN_CTRCT_INF_MDFC:
					EN_CTRCT_INF_MDFC.add(rptDate);
					break;
				case PecrConstantUtil.EN_CTRCT_INF_DEL:
					EN_CTRCT_INF_DEL.add(rptDate);
					break;
				case PecrConstantUtil.EN_CTRCT_INF_ENT_DEL:
					EN_CTRCT_INF_ENT_DEL.add(rptDate);
					break;
				default:
					break;
				}
			}
			if(ENT_BALANCE_SHEET_DLT.size()!=0)
				list.add(new NeedReportDetail(PecrConstantUtil.ENT_BALANCE_SHEET_DLT, ENT_BALANCE_SHEET_DLT,companyLists,null ));
			if(ENT_INCODE_STATE_PRO_DLT.size()!=0)
				list.add(new NeedReportDetail(PecrConstantUtil.ENT_INCODE_STATE_PRO_DLT, ENT_INCODE_STATE_PRO_DLT,companyLists,null ));
			if(ENT_CASH_FLOWS_DLT.size()!=0)
				list.add(new NeedReportDetail(PecrConstantUtil.ENT_CASH_FLOWS_DLT, ENT_CASH_FLOWS_DLT,companyLists, null));
			if(ENT_INST_BALANCE_DLT.size()!=0)
				list.add(new NeedReportDetail(PecrConstantUtil.ENT_INST_BALANCE_DLT, ENT_INST_BALANCE_DLT,companyLists, null));
			if(ENT_INCOME_AND_EXPENSE_STATEME_BS_DLT.size()!=0)
				list.add(new NeedReportDetail(PecrConstantUtil.ENT_INCOME_AND_EXPENSE_STATEME_BS_DLT, ENT_INCOME_AND_EXPENSE_STATEME_BS_DLT,companyLists, null));
			if(EN_SEC_ACCT_ID_CAGS_INF.size()!=0)
				list.add(new NeedReportDetail(PecrConstantUtil.EN_SEC_ACCT_ID_CAGS_INF, EN_SEC_ACCT_ID_CAGS_INF,companyLists,null ));
			if(EN_SEC_ACCT_MDFC.size()!=0)
				list.add(new NeedReportDetail(PecrConstantUtil.EN_SEC_ACCT_MDFC, EN_SEC_ACCT_MDFC,companyLists,null ));
			if(EN_SEC_ACCT_DEL.size()!=0)
				list.add(new NeedReportDetail(PecrConstantUtil.EN_SEC_ACCT_DEL, EN_SEC_ACCT_DEL,companyLists, null));
			if(EN_SEC_ACCT_ENT_DEL.size()!=0)
				list.add(new NeedReportDetail(PecrConstantUtil.EN_SEC_ACCT_ENT_DEL, EN_SEC_ACCT_ENT_DEL,companyLists, null));
			if(EN_BS_INF_DLT.size()!=0)
				list.add(new NeedReportDetail(PecrConstantUtil.EN_BS_INF_DLT, EN_BS_INF_DLT,companyLists, null));
			if(EN_ACCT_INF_ID_CAGS_INF.size()!=0)
				list.add(new NeedReportDetail(PecrConstantUtil.EN_ACCT_INF_ID_CAGS_INF, EN_ACCT_INF_ID_CAGS_INF,companyLists, null));
			if(EN_ACCT_INF_MDFC.size()!=0)
				list.add(new NeedReportDetail(PecrConstantUtil.EN_ACCT_INF_MDFC, EN_ACCT_INF_MDFC,companyLists, null));
			if(EN_ACCT_INF_DEL.size()!=0)
				list.add(new NeedReportDetail(PecrConstantUtil.EN_ACCT_INF_DEL, EN_ACCT_INF_DEL,companyLists, null));
			if(EN_ACCT_INF_ENT_DEL.size()!=0)
				list.add(new NeedReportDetail(PecrConstantUtil.EN_ACCT_INF_ENT_DEL, EN_ACCT_INF_ENT_DEL,companyLists, null));
			if(EN_CTRCT_INF_ID_CAGS_INF.size()!=0)
				list.add(new NeedReportDetail(PecrConstantUtil.EN_CTRCT_INF_ID_CAGS_INF, EN_CTRCT_INF_ID_CAGS_INF,companyLists, null));
			if(EN_CTRCT_INF_MDFC.size()!=0)
				list.add(new NeedReportDetail(PecrConstantUtil.EN_CTRCT_INF_MDFC, EN_CTRCT_INF_MDFC,companyLists, null));
			if(EN_CTRCT_INF_DEL.size()!=0)
				list.add(new NeedReportDetail(PecrConstantUtil.EN_CTRCT_INF_DEL, EN_CTRCT_INF_DEL,companyLists, null));
			if(EN_CTRCT_INF_ENT_DEL.size()!=0)
				list.add(new NeedReportDetail(PecrConstantUtil.EN_CTRCT_INF_ENT_DEL, EN_CTRCT_INF_ENT_DEL,companyLists, null));
			return list;
		}else if (normalOrAbnormal.equals(PecrConstantUtil.MCC_NORMAL)) {
			List<String> MOTGA_CLTAL_CTRCT_INF = new ArrayList<String>();
			List<String> companyLists = new ArrayList<String>();
			for (String str : strs) {
				String[] temp = str.split(",");
				String infType = temp[0];
				String rptDate = temp[1];
				String company=temp[2];
				if(company != null && !"".equals(company) && companyLists.size() < 1){
					companyLists.add(company);
				}
				switch (infType) {
				case PecrConstantUtil.MOTGA_CLTAL_CTRCT_INF:
					MOTGA_CLTAL_CTRCT_INF.add(rptDate);
					break;
				default:
					break;
				}
			}
			if(MOTGA_CLTAL_CTRCT_INF.size() > 0){
				list.add(new NeedReportDetail(PecrConstantUtil.MOTGA_CLTAL_CTRCT_INF, MOTGA_CLTAL_CTRCT_INF,companyLists,null));
			}
			return list;
		}else if (normalOrAbnormal.equals(PecrConstantUtil.MCC_ABNORMAL)) {
			List<String> MOC_ID_CAGS_INF = new ArrayList<String>();
			List<String> MOC_ENT_DEL= new ArrayList<String>();
			List<String> companyLists = new ArrayList<String>();
			for (String str : strs) {
				String[] temp = str.split(",");
				String infType = temp[0];
				String rptDateItem=temp[1];
				String company=temp[2];
				if(company != null && !"".equals(company) && companyLists.size() < 1){
					companyLists.add(company);
				}
				switch (infType) {
				case PecrConstantUtil.MOC_ID_CAGS_INF:
					MOC_ID_CAGS_INF.add(rptDateItem);
					break;
				case PecrConstantUtil.MOC_ENT_DEL:
					MOC_ENT_DEL.add(rptDateItem);
					break;
				}
			}
			if(MOC_ID_CAGS_INF.size()!=0)
				list.add(new NeedReportDetail(PecrConstantUtil.MOC_ID_CAGS_INF, MOC_ID_CAGS_INF,companyLists,null));
			if(MOC_ENT_DEL.size()!=0)
				list.add(new NeedReportDetail(PecrConstantUtil.MOC_ENT_DEL, MOC_ENT_DEL,companyLists,null));
			return list;
		}
		return null;
	}
	
	
	/**
	 * 报文类型：REPORT_TYPE(indvnormal,entnormal,mccnormal)
	 * 用户参数：USERNAME(adminxayh)
	 * 法人参数：COMPANY(xayh)
	 * 批量日期（根据现场场景即为：RPT_DATE(当天信贷的T-1数据以及网贷的T-1和T-2)）:RPT_DATE(20210311)
	 * @param page
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/autoControlGenerateMessage")
	public Map<String, Object> autoControlGenerateMessage(Page page,InputStream is){
		//尽可能少的改动量以及共用代码，这里将ShowCount设置为40，肯定满足批量使用。
		page.setCurrentPage(1);
		page.setShowCount(40);
		Map<String, Object> map = new HashMap<String,Object>(3);
		PageData pd =new PageData();
		JSONObject json = new JSONObject();
		try {
			BufferedReader br = new BufferedReader(new InputStreamReader(is, "utf-8"));
			String lines = br.readLine();
			json = JSONObject.fromObject(lines);
			if(json.get("REPORT_TYPE") == null || "".equals(json.get("REPORT_TYPE"))){
				logger.info("接口REPORT_TYPE参数为空，请重新请求！");
				map.put("success", false);
				map.put("msg", "接口REPORT_TYPE参数为空，请重新请求！");
				return map;
			}else{
				pd.put("REPORT_TYPE", json.get("REPORT_TYPE"));
			}
			if(json.get("COMPANY") == null || "".equals(json.get("COMPANY"))){
				logger.info("接口COMPANY参数为空，请重新请求！");
				map.put("success", false);
				map.put("msg", "接口COMPANY参数为空，请重新请求！");
				return map;
			}else{
				pd.put("COMPANY", json.get("COMPANY"));
			}
			if(json.get("RPT_DATE") == null || "".equals(json.get("RPT_DATE"))){
				logger.info("接口RPT_DATE参数为空，请重新请求！");
				map.put("success", false);
				map.put("msg", "接口RPT_DATE参数为空，请重新请求！");
				return map;
			}else{
				pd.put("RPT_DATE", json.get("RPT_DATE"));
			}
			if(json.get("USERNAME") == null || "".equals(json.get("USERNAME"))){
				logger.info("接口USERNAME参数为空，请重新请求！");
				map.put("success", false);
				map.put("msg", "接口USERNAME参数为空，请重新请求！");
				return map;
			}else{
				pd.put("USERNAME", json.get("USERNAME"));
			}
			String name = pd.getString("USERNAME");
			String rpt_date = pd.getString("RPT_DATE");
			String reportType = pd.getString("REPORT_TYPE");
			//仿照页面进行rptDate参数拼接：2021-03-02 - 2021-03-03
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			SimpleDateFormat sdfSp = new SimpleDateFormat("yyyy-MM-dd");
			Calendar calendar =  Calendar.getInstance();
			calendar.setTime(sdf.parse(rpt_date));
			String endDate = sdfSp.format(calendar.getTime());
			//此处 endDate 相当于当天的正常需要报送的报文数据； startDate 相当于处理昨天预处理错误或者人行反馈错误处理了的数据记录，将其生成报文。
			calendar.add(Calendar.DAY_OF_YEAR, -1);
			String startDate = sdfSp.format(calendar.getTime());
			String rptDate = startDate+" - "+endDate;
			pd.put("rptDate", rptDate);
			page.setPd(pd);
			String[] arrayStr = null;
			if(reportType.equals(PecrConstantUtil.INDV_NORMAL)){
				List<Map<String, Object>> indvNormalList = indvNormalMessageService.autoNormalMessage(page);
				//模仿前端进行数据组装
				//checkStatus.data[i].INFRECTYPE+","+checkStatus.data[i].RPTDATE+","+checkStatus.data[i].COMPANY+";"
				List<String> indivList = new ArrayList<String>();
				for (Map<String, Object> temp : indvNormalList) {
					String str = temp.get("INFRECTYPE").toString()+","+temp.get("RPTDATE").toString()+","+temp.get("COMPANY").toString();
					indivList.add(str);
				}
				arrayStr = indivList.toArray(new String[indvNormalList.size()]);
			}else if(reportType.equals(PecrConstantUtil.ENT_NORMAL)){
				List<Map<String, Object>> entNormalList = entNormalMessageService.autoNormalMessage(page);
				//模仿前端进行数据组装
				//checkStatus.data[i].INFRECTYPE+","+checkStatus.data[i].RPTDATE+","+checkStatus.data[i].COMPANY+";"
				List<String> entList = new ArrayList<String>();
				for (Map<String, Object> temp : entNormalList) {
					String str = temp.get("INFRECTYPE").toString()+","+temp.get("RPTDATE").toString()+","+temp.get("COMPANY").toString();
					entList.add(str);
				}
				arrayStr = entList.toArray(new String[entNormalList.size()]);
			}else if(reportType.equals(PecrConstantUtil.MCC_NORMAL)){
				List<Map<String, Object>> motgaNormalList = motgaNormalMessageService.autoNormalMessage(page);
				//模仿前端进行数据组装
				//checkStatus.data[i].INFRECTYPE+","+checkStatus.data[i].RPTDATE+","+checkStatus.data[i].COMPANY+";"
				List<String> motgaList = new ArrayList<String>();
				for (Map<String, Object> temp : motgaNormalList) {
					String str = temp.get("INFRECTYPE").toString()+","+temp.get("RPTDATE").toString()+","+temp.get("COMPANY").toString();
					motgaList.add(str);
				}
				arrayStr = motgaList.toArray(new String[motgaNormalList.size()]);
			}else{
				logger.info("接口REPORT_TYPE参数枚举值不符合约定，请重新请求！");
				map.put("success", false);
				map.put("msg", "接口REPORT_TYPE参数枚举值不符合约定，请重新请求！");
				return map;
			}
			//校验值
			if(arrayStr == null || arrayStr.length == 0){
				logger.info("没有可以生成报文的数据！");
				map.put("success", true);
				map.put("msg", "没有可以生成报文的数据！");
				return map;
			}
			List<NeedReportDetail> list = toList(reportType, arrayStr);
			if(list.size()==0){
				logger.info("没有可以生成报文的数据！请管理员核对信息记录类型映射");
				map.put("success", true);
				map.put("msg", "没有可以生成报文的数据！请管理员核对信息记录类型映射");
				return map;
			}
			for (NeedReportDetail needReportDetail : list) {
				mySmartLifecycle.generateThread(needReportDetail,name);
			}
			logger.info("正在生成报文，请稍后查看");
			map.put("success", true);
			map.put("msg", "正在生成报文，请稍后查看");
			return map;
		}catch(RejectedExecutionException e){
			logger.info("生成报文任务繁忙，请稍后再试",e);
			map.put("success", false);
			map.put("msg", "生成报文任务繁忙，请稍后再试");
			return map;
		}catch(IllegalStateException e){
			logger.info("生成报文任务错误，请稍后再试",e);
			map.put("success", false);
			map.put("msg", "生成报文任务错误，请稍后再试");
			return map;
		}catch(Exception e){
			logger.info("生成报文任务错误，请联系管理员",e);
			map.put("success", false);
			map.put("msg", "生成报文任务错误，请联系管理员");
			return map;
		}
	}
	
	
	
	/**
	 * 目的是获取当前rpt_date生成的报文中状态为：预处理部分失败（存在数据记录校验不通过）的报文记录，将其校验成功的部分重新生成报文--enc文件
	 * 用户参数：USERNAME(adminxayh)
	 * 法人参数：COMPANY(xayh)
	 * 批量日期：RPT_DATE(20210311)
	 * 参数值均同自动批量接口参数
	 * @param page
	 * @param is
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/checkReportStatusIntf")
	public Map<String, Object> checkReportStatusIntf(Page page,InputStream is){
		Map<String, Object> map = new HashMap<String,Object>(3);
		PageData pd =new PageData();
		JSONObject json = new JSONObject();
		try {
			BufferedReader br = new BufferedReader(new InputStreamReader(is, "utf-8"));
			String lines = br.readLine();
			json = JSONObject.fromObject(lines);
			if(json.get("COMPANY") == null || "".equals(json.get("COMPANY"))){
				logger.info("接口COMPANY参数为空，请重新请求！");
				map.put("success", false);
				map.put("msg", "接口COMPANY参数为空，请重新请求！");
				return map;
			}else{
				pd.put("COMPANY", json.get("COMPANY"));
			}
			if(json.get("RPT_DATE") == null || "".equals(json.get("RPT_DATE"))){
				logger.info("接口RPT_DATE参数为空，请重新请求！");
				map.put("success", false);
				map.put("msg", "接口RPT_DATE参数为空，请重新请求！");
				return map;
			}else{
				pd.put("RPT_DATE", json.get("RPT_DATE"));
			}
			if(json.get("USERNAME") == null || "".equals(json.get("USERNAME"))){
				logger.info("接口USERNAME参数为空，请重新请求！");
				map.put("success", false);
				map.put("msg", "接口USERNAME参数为空，请重新请求！");
				return map; 
			}else{
				pd.put("USERNAME", json.get("USERNAME"));
			}
//			如果当两者的数量相等，可以认为是轮询作业完成的标志！（轮询任务20分钟一次）报文装态不为20与报文状态为60比较
//			如果上面两者数量不相等，则：
//			查询RPT_DATE 日期：报文状态是：80--预处理部分失败。
//			处理逻辑是查询出来一个处理一个，将其原报文信息记录状态修改为20--已弃用，再次生成报文的时候不用进行预处理校验，直接进行加密加压出来（我觉得这样可以）。
			//处理日期将8位转10位：20210302  2021-03-02
			String rpt_date = pd.getString("RPT_DATE");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			SimpleDateFormat sdfSp = new SimpleDateFormat("yyyy-MM-dd");
			Date tmpDate = sdf.parse(rpt_date);
			String rptDate10 = sdfSp.format(tmpDate);
			pd.put("RPT_DATE", rptDate10);
			boolean checkFlag = indvNormalMessageService.checkReportStatusNumEqu(pd);
			if(checkFlag){
				map.put("success", true);
				map.put("msg", "报文预处理全部成功！");
				return map;
			}else{
				List<NeedReportDetail> lists = indvNormalMessageService.getReport80StatusNum(pd);
				if(lists != null && lists.size() > 0){
					for (NeedReportDetail needReportDetail : lists) {
						logger.info("针对校验程序校验通过的数据正在生成报文，请稍后查看！"+needReportDetail.getInfRecType()+needReportDetail.getRptDate());
						mySmartLifecycle.generateThread(needReportDetail,pd.getString("USERNAME"),"noVerify");
					}
					map.put("success", false);
					map.put("msg", "报文预处理部分出错，正在重新生成报文！");
					return map;
				}else{
					map.put("success", false);
					map.put("msg", "报文预处理部分出错,且没有可以重新生成的报文！");
					return map;
				}
				
			}

		}catch(Exception e){
			logger.info("查询报文预处理情况异常，请联系管理员！",e);
			map.put("success", false);
			map.put("msg", "查询报文预处理情况异常，请联系管理员！");
			return map;
		}
		
	}
	
}
