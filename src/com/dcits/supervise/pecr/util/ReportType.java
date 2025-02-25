package com.dcits.supervise.pecr.util;

import java.util.ArrayList;
import java.util.List;

public class ReportType
{
  public static final String REPORT_110 = "110";
  public static final String REPORT_114 = "114";
  public static final String REPORT_120 = "120";
  public static final String REPORT_130 = "130";
  public static final String REPORT_134 = "134";
  public static final String REPORT_140 = "140";
  public static final String REPORT_210 = "210";
  public static final String REPORT_211 = "211";
  public static final String REPORT_212 = "212";
  public static final String REPORT_213 = "213";
  public static final String REPORT_214 = "214";
  public static final String REPORT_215 = "215";
  public static final String REPORT_220 = "220";
  public static final String REPORT_221 = "221";
  public static final String REPORT_222 = "222";
  public static final String REPORT_223 = "223";
  public static final String REPORT_224 = "224";
  public static final String REPORT_230 = "230";
  public static final String REPORT_231 = "231";
  public static final String REPORT_232 = "232";
  public static final String REPORT_233 = "233";
  public static final String REPORT_234 = "234";
  public static final String REPORT_310 = "310";
  public static final String REPORT_314 = "314";
  public static final String REPORT_340 = "340";
  public static final String REPORT_350 = "350";
  public static final String REPORT_410 = "410";
  public static final String REPORT_411 = "411";
  public static final String REPORT_412 = "412";
  public static final String REPORT_413 = "413";
  public static final String REPORT_414 = "414";
  public static final String REPORT_420 = "420";
  public static final String REPORT_421 = "421";
  public static final String REPORT_422 = "422";
  public static final String REPORT_423 = "423";
  public static final String REPORT_424 = "424";
  public static final String REPORT_440 = "440";
  public static final String REPORT_441 = "441";
  public static final String REPORT_442 = "442";
  public static final String REPORT_443 = "443";
  public static final String REPORT_444 = "444";
  public static final String REPORT_510 = "510";
  public static final String REPORT_511 = "511";
  public static final String REPORT_514 = "514";
  public static final String REPORT_610 = "610";
  public static final String REPORT_614 = "614";
  public static final String REPORT_620 = "620";
  public static final String REPORT_624 = "624";
  public static final String REPORT_630 = "630";
  public static final String REPORT_634 = "634";
  public static final String REPORT_640 = "640";
  public static final String REPORT_644 = "644";
  public static final String REPORT_650 = "650";
  public static final String REPORT_654 = "654";

  public static String getReportTypeBaseTable(String reportType)
  {
    switch (reportType) {
    case "110":
      return "I_BS";
    case "114":
      return "I_IN_BS_INF_DLT";
    case "120":
      return "I_IN_FAL_MMBS_INF";
    case "130":
      return "I_IN_ID_EFCT_INF";
    case "134":
      return "I_IN_ID_EFCT_INF_DLT";
    case "140":
      return "I_IN_CTF_ITG_INF";
    case "210":
      return "I_ACCT_BS";
    case "211":
      return "I_IN_ACCT_ID_CAGS_INF";
    case "212":
      return "I_ACCT_BS";
    case "213":
      return "I_IN_ACCT_DEL";
    case "214":
      return "I_IN_ACCT_ENT_DEL";
    case "215":
      return "I_IN_SPC_EVT_DSC_INF";
    case "220":
      return "I_CTRCT_BS";
    case "221":
      return "I_IN_CTRCTID_CAGS_INF";
    case "222":
      return "I_CTRCT_BS";
    case "223":
      return "I_IN_CTRCT_DEL";
    case "224":
      return "I_IN_CTRCT_ENT_DEL";
    case "230":
      return "I_GUAR_ACCT_BS";
    case "231":
      return "I_INSECACCTID_CAGSINF";
    case "232":
      return "I_GUAR_ACCT_BS";
    case "233":
      return "I_IN_SEC_ACCT_DEL";
    case "234":
      return "I_IN_SEC_ACCT_ENT_DEL";
    case "310":
      return "E_BS";
    case "340":
      return "E_CTFITG_INF";
    case "314":
      return "E_BS_INF_DLT";
    case "350":
      return "E_ICDN_RLTP_INF";
    case "410":
      return "E_ACCT_BS";
    case "411":
      return "E_ACCT_INF_ID_CAGS_INF";
    case "412":
      return "E_ACCT_BS";
    case "413":
      return "E_ACCT_INF_DEL";
    case "414":
      return "E_ACCT_INF_ENT_DEL";
    case "420":
      return "E_CTRCT_BS";
    case "421":
      return "E_CR_ACCT_ID_CAGS_INF";
    case "422":
      return "E_CTRCT_BS";
    case "423":
      return "E_CTRCT_INF_DEL";
    case "424":
      return "E_CTRCT_INF_ENT_DEL";
    case "440":
      return "E_GUAR_ACCT_BS";
    case "441":
      return "E_SEC_ACCT_ID_CAGS_INF";
    case "442":
      return "E_GUAR_ACCT_BS";
    case "443":
      return "E_SEC_ACCT_DEL";
    case "444":
      return "E_SEC_ACCT_ENT_DEL";
    case "510":
      return "MOTGA_CLTAL_CTRCT_BS";
    case "511":
      return "MOC_ID_CAGS_INF";
    case "514":
      return "MOC_ENT_DEL";
    case "610":
      return "E_BALANCE_SHEET_BS";
    case "614":
      return "E_BALANCE_SHEET_DLT";
    case "620":
      return "E_INCOME_STATEMENT";
    case "624":
      return "E_IN_COME_ENT_DEL";
    case "630":
      return "E_CASH_FLOWS_BS";
    case "634":
      return "E_CASH_FLOW_ENT_DEL";
    case "640":
      return "E_INSTITU_BALANCE_BS";
    case "644":
      return "E_ASSETS_DEBT_ENT_DEL";
    case "650":
      return "E_INCOME_EXPENSE_BS";
    case "654":
      return "E_IN_OUT_ENT_DEL";
    }
    return null;
  }

  public static String getReportTypePrimaryKey(String reportType)
  {
    switch (reportType) {
    case "110":
      return "PAA_BS_SGMT_ID";
    case "114":
      return "PAY_IN_BS_INF_DLT_ID";
    case "120":
      return "PAJ_IN_FAL_MMBS_INF_ID";
    case "130":
      return "PAK_IN_ID_EFCT_INF_ID";
    case "134":
      return "PAZ_IN_ID_EFCT_INF_DLT_ID";
    case "140":
      return "PAL_IN_CTF_ITG_INF_ID";
    case "210":
      return "PBA_ACCT_BS_SGMT_ID";
    case "211":
      return "PBW_IN_ACCT_ID_CAGS_INF_ID";
    case "212":
      return "PBA_ACCT_BS_SGMT_ID";
    case "213":
      return "PBY_IN_ACCT_DEL_ID";
    case "214":
      return "PBZ_IN_ACCT_ENT_DEL_ID";
    case "215":
      return "PBK_IN_SPC_EVT_DSC_INF_ID";
    case "220":
      return "PCA_CTRCT_BS_SGMT_ID";
    case "221":
      return "PCW_IN_CTRCTID_CAGS_INF_ID";
    case "222":
      return "PCA_CTRCT_BS_SGMT_ID";
    case "223":
      return "PCY_IN_CTRCT_DEL_ID";
    case "224":
      return "PCZ_IN_CTRCT_ENT_DEL_ID";
    case "230":
      return "PDA_GUAR_ACCT_BS_SGMT_ID";
    case "231":
      return "PDW_INSECACCTID_CAGSINF_ID";
    case "232":
      return "PDA_GUAR_ACCT_BS_SGMT_ID";
    case "233":
      return "PDY_IN_SEC_ACCT_DEL_ID";
    case "234":
      return "PDZ_IN_SEC_ACCT_ENT_DEL_ID";
    case "310":
      return "EAA_BS_SGMT_ID";
    case "314":
      return "EAZ_EN_BS_INF_DLT_ID";
    case "340":
      return "EBA_EN_CTFITG_INF_ID";
    case "350":
      return "ECA_EN_ICDN_RLTP_INF_ID";
    case "410":
      return "EDA_ACCT_BS_SGMT_ID";
    case "411":
      return "EDW_EN_ACCT_INF_ID_CAGS_INF_ID";
    case "412":
      return "EDA_ACCT_BS_SGMT_ID";
    case "413":
      return "EDY_EN_ACCT_INF_DEL_ID";
    case "414":
      return "EDZ_EN_ACCT_INF_ENT_DEL_ID";
    case "420":
      return "EGA_CTRCT_BS_SGMT_ID";
    case "421":
      return "EGW_EN_ACCT_INF_ID_CAGS_INF_ID";
    case "422":
      return "EGA_CTRCT_BS_SGMT_ID";
    case "423":
      return "EGY_EN_CTRCT_INF_DEL_ID";
    case "424":
      return "EGZ_EN_CTRCT_INF_ENT_DEL_ID";
    case "440":
      return "EEA_GUAR_ACCT_BS_SGMT_ID";
    case "441":
      return "EEW_EN_SEC_ACCT_ID_CAGS_INF_ID";
    case "442":
      return "EEA_GUAR_ACCT_BS_SGMT_ID";
    case "443":
      return "EEY_EN_SEC_ACCT_DEL_ID";
    case "444":
      return "EEZ_EN_SEC_ACCT_ENT_DEL_SG_ID";
    case "510":
      return "EFA_MOTGA_CLTAL_CTRCT_BS_ID";
    case "511":
      return "EFW_MOC_ID_CAGS_INF_ID";
    case "514":
      return "EFZ_MOC_ENT_DEL_ID";
    case "610":
      return "EHA_BALANCE_SHEET_BS_SGMT_ID";
    case "614":
      return "EMZ_BALANCE_SHEET_DLT_ID";
    case "620":
      return "EIA_INCOME_STATEMENT_PROFIT_ID";
    case "624":
      return "E_IN_COME_ENT_DEL_ID";
    case "630":
      return "EJA_CASH_FLOWS_BS_SGMT_ID";
    case "634":
      return "E_CASH_FLOW_ENT_DEL_ID";
    case "640":
      return "EKA_INSTITUTION_BALANCE_SHT_ID";
    case "644":
      return "E_ASSETS_DEBT_ENT_DEL_ID";
    case "650":
      return "ELA_INCOME_AND_EXPENSE_STAT_ID";
    case "654":
      return "E_IN_OUT_ENT_DEL_ID";
    }
    return null;
  }
  
  public static String getReportTypeBusinessPrimaryKey(String reportType)
  {
    switch (reportType) {
    case "110":
      return "ID_TYPE"+",ID_NUM";
    case "120":
      return "ID_TYPE"+",ID_NUM";
    case "130":
      return "ID_TYPE"+",ID_NUM";
    case "140":
      return "ID_TYPE"+",ID_NUM";
    case "210":
      return "ACCT_TYPE"+",ACCT_CODE";
    case "215":
      return "ACCT_TYPE"+",ACCT_CODE";
    case "220":
      return "CONTRACT_CODE";
    case "230":
      return "ACCT_TYPE"+",ACCT_CODE";
    case "310":
      return "ENT_CERT_TYPE"+",ENT_CERT_NUM";
    case "340":
      return "ENT_CERT_TYPE"+",ENT_CERT_NUM";
    case "350":
      return "ENT_CERT_TYPE"+",ENT_CERT_NUM";
    case "410":
      return "ACCT_TYPE"+",ACCT_CODE";
    case "420":
      return "CONTRACT_CODE";
    case "440":
      return "ACCT_TYPE"+",ACCT_CODE";
    case "510":
      return "CC_CODE";
    case "610":
      return "ENT_CERT_TYPE"+",ENT_CERT_NUM";
    case "620":
      return "ENT_CERT_TYPE"+",ENT_CERT_NUM";
    case "630":
      return "ENT_CERT_TYPE"+",ENT_CERT_NUM";
    case "640":
      return "ENT_CERT_TYPE"+",ENT_CERT_NUM";
    case "650":
      return "ENT_CERT_TYPE"+",ENT_CERT_NUM";
    }
    return null;
  }
  
  public static List<String> getReportTypeBusinessRealTables(String reportType){
	  List<String> resultList = new ArrayList<String>();
	  switch (reportType) {
	    case "110":
	    	resultList.add(0, "I_FCS_INF");
	    	resultList.add(1, "I_ID");
	    	resultList.add(2, "I_INC_INF");
	    	resultList.add(3, "I_MLG_INF");
	    	resultList.add(4, "I_OCTPN_INF");
	    	resultList.add(5, "I_REDNC_INF");
	    	resultList.add(6, "I_SPS_INF");
	      return resultList;
	    case "114":
	        return resultList;
	      case "120":
	        return resultList;
	      case "130":
	        return resultList;
	      case "134":
	        return resultList;
	      case "140":
	        return resultList;
	      case "210":
	    	resultList.add(0, "I_ACCT_BS_INF");
	    	resultList.add(1, "I_ACCT_CRED");
	    	resultList.add(2, "I_ACCT_DBT_INF");
	    	resultList.add(3, "I_AMBLG_INF");
	    	resultList.add(4, "I_AS_TRST_DSPN");
	    	resultList.add(5, "I_LOAN_RLT_REPYMT_INF");
	    	resultList.add(6, "I_MCC_INF");
	    	resultList.add(7, "I_OC_INF");
	    	resultList.add(8, "I_SPEC_PRD");
	        return resultList;
	      case "211":
	        return resultList;
	      case "212":
	    	resultList.add(0, "I_ACCT_BS_INF");
	    	resultList.add(1, "I_ACCT_CRED");
	    	resultList.add(2, "I_ACCT_DBT_INF");
	    	resultList.add(3, "I_AMBLG_INF");
	    	resultList.add(4, "I_AS_TRST_DSPN");
	    	resultList.add(5, "I_LOAN_RLT_REPYMT_INF");
	    	resultList.add(6, "I_MCC_INF");
	    	resultList.add(7, "I_OC_INF");
	    	resultList.add(8, "I_SPEC_PRD");
	        return resultList;
	      case "213":
	        return resultList;
	      case "214":
	        return resultList;
	      case "215":
	        return resultList;
	      case "220":
	    	resultList.add(0, "I_CREDIT_LIM");
	    	resultList.add(1, "I_CTRCT_CERT_REL");
	        return resultList;
	      case "221":
	        return resultList;
	      case "222":
	    	resultList.add(0, "I_CREDIT_LIM");
	    	resultList.add(1, "I_CTRCT_CERT_REL");
	        return resultList;
	      case "223":
	        return resultList;
	      case "224":
	        return resultList;
	      case "230":
	    	resultList.add(0, "I_GUAR_ACCT_INF");
	    	resultList.add(1, "I_GUAR_MCC_INF");
	    	resultList.add(2, "I_GUAR_RLT_REPYMT_INF");
	    	resultList.add(3, "I_GR_REPYMT_INF");
	        return resultList;
	      case "231":
	        return resultList;
	      case "232":
	    	resultList.add(0, "I_GUAR_ACCT_INF");
	    	resultList.add(1, "I_GUAR_MCC_INF");
	    	resultList.add(2, "I_GUAR_RLT_REPYMT_INF");
	    	resultList.add(3, "I_GR_REPYMT_INF");
	        return resultList;
	      case "233":
	        return resultList;
	      case "234":
	        return resultList;
	      case "310":
		    	resultList.add(0, "E_ACTU_COTRL_INF");
		    	resultList.add(1, "E_COTA_INF");
		    	resultList.add(2, "E_FCS_INF");
		    	resultList.add(3, "E_ID");
		    	resultList.add(4, "E_MN_MMB_INF");
		    	resultList.add(5, "E_MN_SHA_HOD_INF");
		    	resultList.add(6, "E_SPVSG_ATHRTY_INF");
		        return resultList;
	      case "340":
	        return resultList;
	      case "314":
	        return resultList;
	      case "350":
	        return resultList;
	      case "410":
		    	resultList.add(0, "E_ACCT_BS_INF");
		    	resultList.add(1, "E_ACCT_CRED");
		    	resultList.add(2, "E_ACCT_SPEC_TRST");
		    	resultList.add(3, "E_ACT_LBLTY_INF");
		    	resultList.add(4, "E_MOTGA_CLTAL_CTRCT_INF");
		    	resultList.add(5, "E_ORIG_CREDITOR_INF");
		    	resultList.add(6, "E_RLT_REPYMT_INF");
		        return resultList;
	      case "411":
	        return resultList;
	      case "412":
		    	resultList.add(0, "E_ACCT_BS_INF");
		    	resultList.add(1, "E_ACCT_CRED");
		    	resultList.add(2, "E_ACCT_SPEC_TRST");
		    	resultList.add(3, "E_ACT_LBLTY_INF");
		    	resultList.add(4, "E_MOTGA_CLTAL_CTRCT_INF");
		    	resultList.add(5, "E_ORIG_CREDITOR_INF");
		    	resultList.add(6, "E_RLT_REPYMT_INF");
		        return resultList;
	      case "413":
	        return resultList;
	      case "414":
	        return resultList;
	      case "420":
		    	resultList.add(0, "E_CREDIT_LIM");
		    	resultList.add(1, "E_CTRCT_CERT_REL");
		        return resultList;
	      case "421":
	        return resultList;
	      case "422":
		    	resultList.add(0, "E_CREDIT_LIM");
		    	resultList.add(1, "E_CTRCT_CERT_REL");
		        return resultList;
	      case "423":
	        return resultList;
	      case "424":
	        return resultList;
	      case "440":
		    	resultList.add(0, "E_GUAR_ACCT_BS_INF");
		    	resultList.add(1, "E_GUAR_ACCT_CRED");
		    	resultList.add(2, "E_GUAR_INSURANCE_INF");
		    	resultList.add(3, "E_GUAR_MOTGA_CLTAL_INF");
		    	resultList.add(4, "E_SEC_RLT_REPYMT_INF");
		        return resultList;
	      case "441":
	        return resultList;
	      case "442":
		    	resultList.add(0, "E_GUAR_ACCT_BS_INF");
		    	resultList.add(1, "E_GUAR_ACCT_CRED");
		    	resultList.add(2, "E_GUAR_INSURANCE_INF");
		    	resultList.add(3, "E_GUAR_MOTGA_CLTAL_INF");
		    	resultList.add(4, "E_SEC_RLT_REPYMT_INF");
		        return resultList;
	      case "443":
	        return resultList;
	      case "444":
	        return resultList;
	      case "510":
		    	resultList.add(0, "MOTGA_CLTAL_BS_INF");
		    	resultList.add(1, "MOTGA_CLTAL_INF");
		    	resultList.add(2, "MOTGA_COM_REC_INF");
		    	resultList.add(3, "MOTGA_PROPT_INF");
		        return resultList;
	      case "511":
	        return resultList;
	      case "514":
	        return resultList;
	      case "610":
		    	resultList.add(0, "E_BALANCE_SHEET02");
		    	resultList.add(1, "E_BALANCE_SHEET07");
		        return resultList;
	      case "614":
	        return resultList;
	      case "620":
		    	resultList.add(0, "E_INCOME_STATEMENT_02");
		    	resultList.add(1, "E_INCOME_STATEMENT_07");
		        return resultList;
	      case "624":
	        return resultList;
	      case "630":
		    	resultList.add(0, "E_CASH_FLOWS2002");
		    	resultList.add(1, "E_CASH_FLOWS2007");
		        return resultList;
	      case "634":
	        return resultList;
	      case "640":
		    	resultList.add(0, "E_INSTITU_BALANCE");
		        return resultList;
	      case "644":
	        return resultList;
	      case "650":
		    	resultList.add(0, "E_INCOME_EXPENSE");
		        return resultList;
	      case "654":
	        return resultList;
	      }
	  return null;
  }
}
