package com.dcits.supervise.pecr.generateReport.factory;


import java.util.Properties;

import com.dcits.supervise.pecr.generateReport.impl.*;
import org.apache.log4j.Logger;

import com.dcits.supervise.pecr.generateReport.entity.NeedReportDetail;
import com.dcits.supervise.pecr.generateReport.exceptions.NoSuchReportException;
import com.dcits.supervise.pecr.generateReport.interfaces.IReport;
import com.dcits.supervise.pecr.generateReport.interfaces.IgenerateReportFactory;
import com.dcits.supervise.pecr.generateReport.service.ReportMessageManager;
import com.dcits.supervise.pecr.util.PecrConstantUtil;

/**
 * 报文工厂类
 * @author munan
 *
 */
public class GenerateReportFactory implements IgenerateReportFactory{

	private final static Logger logger = Logger.getLogger(GenerateReportFactory.class);
	private String infRecType;
	
	private NeedReportDetail needReportDetail;
	
	IReport ip;
	/**
     * 获取对象
     * @return
     */
    public static GenerateReportFactory getGenerateReportFactory(){
        return new GenerateReportFactory();
    }
	@Override
	public IReport createReportClass(NeedReportDetail needReportDetail,Properties properties,ReportMessageManager reportMessageService) throws NoSuchReportException {
		logger.info("工厂创建具体报文生成实现类");
		this.needReportDetail=needReportDetail;
		infRecType=this.needReportDetail.getInfRecType();
		switch (infRecType) {
		case PecrConstantUtil.INDV_BS_SGMT:
			GenerateBsSgmtRp bsSgmtRp = new GenerateBsSgmtRp(properties,reportMessageService);
			ip = bsSgmtRp;
			break;
		case PecrConstantUtil.IN_FAL_MMBS_INF:
			GenerateInFALMmbsInfRp inFALMmbsInfRp = new GenerateInFALMmbsInfRp(properties,reportMessageService);
			ip = inFALMmbsInfRp;
			break;
		case PecrConstantUtil.IN_SPC_EVT_DSC_INF:
			GenerateInSpcEvtDscInfRp in_spc_evt_dsc_inf = new GenerateInSpcEvtDscInfRp(properties,reportMessageService);
			ip = in_spc_evt_dsc_inf;
			break;
		case PecrConstantUtil.IN_ID_EFCT_INF:
			GenerateInIdEfctInfRp inidefctinfrp = new GenerateInIdEfctInfRp(properties,reportMessageService);
			ip = inidefctinfrp;
			break;
		case PecrConstantUtil.IN_CTF_ITG_INF://西安银行不涉及，因此没有修改。
			GenerateInCtfItgInfRp inctfitginfrp = new GenerateInCtfItgInfRp(properties,reportMessageService);
			ip = inctfitginfrp;
			break;
		case PecrConstantUtil.ACCT_BS_SGMT:
			GenerateAcctBsSgmtRp acctbssgmtrp = new GenerateAcctBsSgmtRp(properties,reportMessageService);
			ip = acctbssgmtrp;
			break;
		case PecrConstantUtil.CTRCT_BS_SGMT:
			GenerateCtrctBsSgmtRp ctrctbssgmtrp = new GenerateCtrctBsSgmtRp(properties,reportMessageService);
			ip = ctrctbssgmtrp;
			break;
		case PecrConstantUtil.IN_SEC_ACCT_INF:
			GenerateInSecAcctInfRp guaracctbssgmtrp = new GenerateInSecAcctInfRp(properties,reportMessageService);
			ip = guaracctbssgmtrp;
			break;
		case PecrConstantUtil.ENT_BS_SGMT:
			GenerateEnBsSgmtrpRp entbssgmtrp = new GenerateEnBsSgmtrpRp(properties,reportMessageService);
			ip = entbssgmtrp;
			break;
		case PecrConstantUtil.ENT_INCOME_AND_EXPENSE_STATEME_BS:
			GenerateIncomeAndExpenseStatementtrpRp incomeandexpensestatement = new GenerateIncomeAndExpenseStatementtrpRp(properties,reportMessageService);
			ip = incomeandexpensestatement;
			break;
		case PecrConstantUtil.ENT_EN_ICDN_RLTP_INF:
			GenerateEnIcdnRltpInfrpRp enicdnrltpinf = new GenerateEnIcdnRltpInfrpRp(properties,reportMessageService);
			ip = enicdnrltpinf;
			break;
		case PecrConstantUtil.ENT_ACCT_BS_SGMT:
			GenerateEnAcctInfRp enacctinf = new GenerateEnAcctInfRp(properties,reportMessageService);
			ip = enacctinf;
			break;
		case PecrConstantUtil.ENT_GUAR_ACCT_BS_SGMT:
			GenerateEnSecAcctInfRp ensecacctinf = new GenerateEnSecAcctInfRp(properties,reportMessageService);
			ip = ensecacctinf;
			break;
		case PecrConstantUtil.ENT_EN_CTRCT_INF:
			GenerateEnCtrctInfRp enCtrctInf = new GenerateEnCtrctInfRp(properties,reportMessageService);
			ip = enCtrctInf;
			break;
		case PecrConstantUtil.ENT_BALANCE_SHEET:
			GenerateEntBalanceSheetRp entBalanceSheet = new GenerateEntBalanceSheetRp(properties,reportMessageService);
			ip = entBalanceSheet;
			break;
		case PecrConstantUtil.ENT_CASH_FLOWS:
			GenerateEntCashFlowsRp entCashFlowsRp = new GenerateEntCashFlowsRp(properties,reportMessageService);
			ip = entCashFlowsRp;
			break;
		case PecrConstantUtil.ENT_INCODE_STATE_PRO:
			GenerateEntIncomeSPARp entIncomeSPARp =new GenerateEntIncomeSPARp(properties,reportMessageService);
			ip = entIncomeSPARp;
			break;
		case PecrConstantUtil.ENT_INST_BALANCE:
			GenerateEntInstBalanceSheetRp entInstBalanceSheet = new GenerateEntInstBalanceSheetRp(properties,reportMessageService);
			ip = entInstBalanceSheet;
			break;
		case PecrConstantUtil.IN_BS_INF_DLT://个人基本信息整笔删除
			GenerateInEntDltInfRp inEntDlt1 = new GenerateInEntDltInfRp(properties,reportMessageService);
			ip = inEntDlt1;
			break;
		case PecrConstantUtil.IN_ID_EFCT_INF_DLT://个人证件有效期整笔删除
			GenerateInEntDltInfRp inEntDlt2 = new GenerateInEntDltInfRp(properties,reportMessageService);
			ip = inEntDlt2;
			break;
		case PecrConstantUtil.IN_ACCT_ENT_DEL://个人借贷账户整笔删除
			GenerateInEntDltInfRp inEntDlt3 = new GenerateInEntDltInfRp(properties,reportMessageService);
			ip = inEntDlt3;
			break;
		case PecrConstantUtil.IN_CTRCT_ENT_DEL://个人授信协议整笔删除
			GenerateInEntDltInfRp inEntDlt4 = new GenerateInEntDltInfRp(properties,reportMessageService);
			ip = inEntDlt4;
			break;
		case PecrConstantUtil.IN_SEC_ACCT_ENT_DEL://个人担保账户整笔删除
			GenerateInEntDltInfRp inEntDlt5 = new GenerateInEntDltInfRp(properties,reportMessageService);
			ip = inEntDlt5;
			break;
		case PecrConstantUtil.MOC_ENT_DEL://抵（质）押合同整笔删除
			GenerateMoCEntDltInfRp moCEntDlt6 = new GenerateMoCEntDltInfRp(properties,reportMessageService);
			ip = moCEntDlt6;
			break;
		case PecrConstantUtil.EN_ACCT_INF_MDFC:
			GenerateEnAcctInfMdfcRp generateEnAcctInfMdfcRp = new GenerateEnAcctInfMdfcRp(properties,reportMessageService);
			ip = generateEnAcctInfMdfcRp;
			break;
		case PecrConstantUtil.EN_CTRCT_INF_MDFC:
			GenerateEnCtrctInfMdfcRp generateEnCtrctInfMdfcRp = new GenerateEnCtrctInfMdfcRp(properties,reportMessageService);
			ip = generateEnCtrctInfMdfcRp;
			break;
		case PecrConstantUtil.EN_SEC_ACCT_MDFC:
			GenerateEnSecAcctMdfcRp generateEnSecAcctMdfcRp = new GenerateEnSecAcctMdfcRp(properties,reportMessageService);
			ip = generateEnSecAcctMdfcRp;
			break;
		case PecrConstantUtil.IN_ACCT_MDFC:
			GenerateInAcctMdfcRp generateInAcctMdfcRp = new GenerateInAcctMdfcRp(properties,reportMessageService);
			ip = generateInAcctMdfcRp;
			break;
		case PecrConstantUtil.IN_CTRCT_MDFC:
			GenerateInCtrctMdfcRp generateInCtrctMdfcRp = new GenerateInCtrctMdfcRp(properties,reportMessageService);
			ip = generateInCtrctMdfcRp;
			break;
		case PecrConstantUtil.IN_SEC_ACCT_MDFC:
			GenerateInSecAcctMdfcRp generateInSecAcctMdfcRp = new GenerateInSecAcctMdfcRp(properties,reportMessageService);
			ip = generateInSecAcctMdfcRp;
			break;
		case PecrConstantUtil.IN_ACCT_DEL://个人借贷账户按段删除
			GenerateInDltInfRp inDlt1 = new GenerateInDltInfRp(properties,reportMessageService);
			ip = inDlt1;
			break;
		case PecrConstantUtil.IN_CTRCT_DEL://个人授信协议按段删除
			GenerateInDltInfRp inDlt2 = new GenerateInDltInfRp(properties,reportMessageService);
			ip = inDlt2;
			break;
		case PecrConstantUtil.IN_SEC_ACCT_DEL://个人担保账户按段删除
			GenerateInDltInfRp inDlt3 = new GenerateInDltInfRp(properties,reportMessageService);
			ip = inDlt3;
			break;
		case PecrConstantUtil.IN_ACCT_ID_CAGS_INF://个人借贷账户标识变更
			GenerateInIDCagsInfRp inIDCagsInf1 = new GenerateInIDCagsInfRp(properties,reportMessageService);
			ip = inIDCagsInf1;
			break;
		case PecrConstantUtil.IN_CTRCT_ID_CAGS_INF://个人授信协议标识变更
			GenerateInIDCagsInfRp inIDCagsInf2 = new GenerateInIDCagsInfRp(properties,reportMessageService);
			ip = inIDCagsInf2;
			break;
		case PecrConstantUtil.IN_SEC_ACCT_ID_CAGS_INF://个人担保账户标识变更
			GenerateInIDCagsInfRp inIDCagsInf3 = new GenerateInIDCagsInfRp(properties,reportMessageService);
			ip = inIDCagsInf3;
			break;
		case PecrConstantUtil.MOC_ID_CAGS_INF://抵（质）押合同标识变更
			GenerateMoCIDCagsInfRp inMoCIDCagsInf = new GenerateMoCIDCagsInfRp(properties,reportMessageService);
			ip = inMoCIDCagsInf;
			break;
		case PecrConstantUtil.EN_ACCT_INF_ID_CAGS_INF://企业借贷账户信息标识变更请求记录
			GenerateEnIDCagsInfRp generateEnIDCagsInfRp = new GenerateEnIDCagsInfRp(properties, reportMessageService);
			ip = generateEnIDCagsInfRp;
			break;
		case PecrConstantUtil.EN_CTRCT_INF_ID_CAGS_INF://企业授信协议标识变更请求记录
			GenerateEnIDCagsInfRp generateEnIDCagsInfRp2 = new GenerateEnIDCagsInfRp(properties, reportMessageService);
			ip = generateEnIDCagsInfRp2;
			break;
		case PecrConstantUtil.EN_SEC_ACCT_ID_CAGS_INF://企业担保账户标识变更请求记录
			GenerateEnIDCagsInfRp generateEnIDCagsInfRp3 = new GenerateEnIDCagsInfRp(properties, reportMessageService);
			ip = generateEnIDCagsInfRp3;
			break;
		case PecrConstantUtil.EN_BS_INF_DLT://企业基本信息整笔删除请求记录
			GenerateEnEntDltInfRp generateEnEntDltInfRp1 = new GenerateEnEntDltInfRp(properties, reportMessageService);
			ip = generateEnEntDltInfRp1;
			break;
		case PecrConstantUtil.EN_ACCT_INF_ENT_DEL://企业基本信息整笔删除请求记录
			GenerateEnEntDltInfRp generateEnEntDltInfRp2 = new GenerateEnEntDltInfRp(properties, reportMessageService);
			ip = generateEnEntDltInfRp2;
			break;
		case PecrConstantUtil.EN_SEC_ACCT_ENT_DEL://企业担保账户整笔删除请求记录
			GenerateEnEntDltInfRp generateEnEntDltInfRp3 = new GenerateEnEntDltInfRp(properties, reportMessageService);
			ip = generateEnEntDltInfRp3;
			break;
		case PecrConstantUtil.ENT_INCOME_AND_EXPENSE_STATEME_BS_DLT://事业单位收入支出表整笔删除请求记录
			GenerateEnEntDltInfRp generateEnEntDltInfRp4 = new GenerateEnEntDltInfRp(properties, reportMessageService);
			ip = generateEnEntDltInfRp4;
			break;
		case PecrConstantUtil.ENT_INST_BALANCE_DLT://事业单位收入支出表整笔删除请求记录
			GenerateEnEntDltInfRp generateEnEntDltInfRp5 = new GenerateEnEntDltInfRp(properties, reportMessageService);
			ip = generateEnEntDltInfRp5;
			break;
		case PecrConstantUtil.ENT_CASH_FLOWS_DLT://企业现金流量表整笔删除请求记录
			GenerateEnEntDltInfRp generateEnEntDltInfRp6 = new GenerateEnEntDltInfRp(properties, reportMessageService);
			ip = generateEnEntDltInfRp6;
			break;
		case PecrConstantUtil.ENT_INCODE_STATE_PRO_DLT://企业利润及利润分配表整笔删除请求记录
			GenerateEnEntDltInfRp generateEnEntDltInfRp7 = new GenerateEnEntDltInfRp(properties, reportMessageService);
			ip = generateEnEntDltInfRp7;
			break;
		case PecrConstantUtil.ENT_BALANCE_SHEET_DLT://企业资产负债表整笔删除请求记录
			GenerateEnEntDltInfRp generateEnEntDltInfRp8 = new GenerateEnEntDltInfRp(properties, reportMessageService);
			ip = generateEnEntDltInfRp8;
			break;
		case PecrConstantUtil.EN_CTRCT_INF_ENT_DEL://企业授信协议整笔删除请求记录
			GenerateEnEntDltInfRp generateEnEntDltInfRp9 = new GenerateEnEntDltInfRp(properties, reportMessageService);
			ip = generateEnEntDltInfRp9;
			break;
		case PecrConstantUtil.EN_ACCT_INF_DEL://企业借贷账户按段删除请求类记录
			GenerateEnDltInfRp generateEnDltInfRp1 = new GenerateEnDltInfRp(properties, reportMessageService);
			ip = generateEnDltInfRp1;
			break;
		case PecrConstantUtil.EN_CTRCT_INF_DEL://企业授信协议按段删除请求记录
			GenerateEnDltInfRp generateEnDltInfRp2 = new GenerateEnDltInfRp(properties, reportMessageService);
			ip = generateEnDltInfRp2;
			break;
		case PecrConstantUtil.EN_SEC_ACCT_DEL://企业担保账户按段删除请求记录
			GenerateEnDltInfRp generateEnDltInfRp3 = new GenerateEnDltInfRp(properties, reportMessageService);
			ip = generateEnDltInfRp3;
			break;
		case PecrConstantUtil.MOTGA_CLTAL_CTRCT_INF://抵（质）押合同信息记录生成报文模块
			GenerateMotgaCltalCtrctInfRp generateMotgaCltalCtrctInfRp = new GenerateMotgaCltalCtrctInfRp(properties, reportMessageService);
			ip = generateMotgaCltalCtrctInfRp;
			break;
		default:
			break;
		}
		return ip;
	}
	

}
