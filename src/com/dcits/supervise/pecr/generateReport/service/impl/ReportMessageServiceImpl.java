package com.dcits.supervise.pecr.generateReport.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.generateReport.entity.IndvBsSgmtReportEntity;
import com.dcits.supervise.pecr.generateReport.entity.ReportAndBackMessageEnt;
import com.dcits.supervise.pecr.generateReport.entity.SerialNumberEntity;
import com.dcits.supervise.pecr.generateReport.service.ReportMessageManager;
import com.dcits.supervise.pecr.util.PecrConstantUtil;
import com.dcits.supervise.pecr.util.StringDateUtil;
import com.dcits.supervise.pecr.util.UUID;

@Repository
public class ReportMessageServiceImpl implements ReportMessageManager {
	@Resource(name = "daoSupportPecr")
	private DaoSupportPecr dao;

	@Override
	public int getReportCount(Map<String, Object> map) throws Exception {
		return (int) dao.findForObject("IndvInfoRpMapper.getReportCount", map);
	}
	@Override
	public int getReportCountSps(Map<String, Object> map) throws Exception {
		//
		return (int) dao.findForObject("IndvInfoRpMapper.getReportCountSps", map);
	}
	//穆楠 
	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> get14OrgCode(String company) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.getCcrcOrgCode", company);
	}
	
	public String getCcrcOrgCode(Map<String, Object> map) throws Exception {
		return "D10027910H0001";
	}
	
	@Override
	public void  insertSerivalNumber(PageData pd) throws Exception {
		dao.delete("ReportSerialNumberMapper.deleteSerivalNumber", pd);
		dao.save("ReportSerialNumberMapper.insertSerivalNumber", pd);
	}
	
	@Override
	public PageData getLock(PageData pd) throws Exception {
		return (PageData) dao.findForObject("ReportSerialNumberMapper.getLock", pd);
	}

	@Override
	public boolean updateSerivalNumber(PageData pd) throws Exception {
		Integer i = (Integer) dao.update("ReportSerialNumberMapper.updateSerivalNumber", pd);
		return i==1 ? true : false;
	}

	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<IndvBsSgmtReportEntity> queryBsSgmtRpData(Map<String, Object> pd) throws Exception {
		return (List<IndvBsSgmtReportEntity>) dao.findForList("IndvInfoRpMapper.dataBsSgmtlist", pd);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryBsIDSgmtRpData(List<String> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.getIDSgmtRpMsgByFactor", pd);
	}

	@Override
	public void updateBsSgmtRpDataStatus(Map<String, Object> pd) throws Exception {
		dao.update("IndvInfoRpMapper.updateDataBsSgmt", pd);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryInFalMmbRpData(Map<String, Object> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.queryInFalMmbRpData", pd);
	}

	@Override
	public void updateInFalMmbRpDataStatus(Map<String, Object> pd) throws Exception {
		dao.update("IndvInfoRpMapper.updateInFalMmbRpDataStatus", pd);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryInIDEfctRpData(Map<String, Object> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.queryInIDEfctRpData", pd);
	}

	@Override
	public void updateInIDEfctRpDataStatus(Map<String, Object> pd) throws Exception {
		dao.update("IndvInfoRpMapper.updateInIDEfctRpDataStatus", pd);
	}
	
	@Override
	public void updateInSpcEvtDscInfRpDataStatus(Map<String, Object> pd) throws Exception {
		dao.update("IndvInfoRpMapper.updateInSpcEvtDscInfRpDataStatus", pd);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryInCtfItgRpData(Map<String, Object> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.queryInCtfItgRpData", pd);
	}

	@Override
	public void updateInCtfItgRpDataStatus(Map<String, Object> pd) throws Exception {
		dao.update("IndvInfoRpMapper.updateInCtfItgRpDataStatus", pd);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> dataGuarAcctBsSgmtlist(Map<String, Object> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.dataGuarAcctBsSgmtlist", pd);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> getlableCN(Map<String, Object> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.getlableCN", pd);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> getGuarMccRpMsgByFactor(List<String> list) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.getGuarMccRpMsgByFactor", list);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> getRLTRepymtRpMsgByFactor(List<String> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.getRLTRepymtRpMsgByFactor", pd);
	}

	@Override
	public void updateGuarAcctBsDataStatus(Map<String, Object> pd) throws Exception {
		dao.update("IndvInfoRpMapper.updateGuarAcctBsDataStatus", pd);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryInCtrctInfRpData(Map<String, Object> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.queryInCtrctInfRpData", pd);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryInCtrctInfByRepID(Map<String, Object> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.queryInCtrctInfByRepID", pd);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryIndvBs(Map<String, Object> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.queryIndvBs", pd);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryFalBs(Map<String, Object> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.queryFalBs", pd);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryIDBs(Map<String, Object> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.queryIDBs", pd);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> querySecAcctTBs(Map<String, Object> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.querySecAcctTBs", pd);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryAcctSgmtBs(Map<String, Object> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.queryAcctSgmtBs", pd);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> querySpcBs(Map<String, Object> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.querySpcBs", pd);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryEBs(Map<String, Object> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.queryEBs", pd);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryIncomeBs(Map<String, Object> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.queryIncomeBs", pd);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> getCtrctCertRelRpMsgByFactor(List<String> pd) throws Exception {
		//List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> list  = (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.getCtrctCertRelRpMsgByFactor", pd);
		return list;
	}

	@Override
	public void updateInCtrctInfRpDataStatus(Map<String, Object> pd) throws Exception {
			dao.update("IndvInfoRpMapper.updateInCtrctInfRpDataStatus", pd);
	}
	//韦宗英 add 根据id修改授信信息状态
	@Override
	public void editInCtrctInfStatus(Map<String, Object> pd) throws Exception {
		//更新基础表数据状态
		dao.update("IndvInfoRpMapper.editInCtrctInfStatus2", pd);
		//利用基础表更新回执错误信息记录表中的主键存放字段
		dao.update("IndvInfoRpMapper.refreshRecodeIdByCols", pd);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryAcctBsSgmtRpData(Map<String, Object> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.queryAcctBsSgmtRpData", pd);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryIcdnBs(Map<String, Object> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.queryIcdnBs", pd);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryAcctBs(Map<String, Object> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.queryAcctBs", pd);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryGuarBs(Map<String, Object> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.queryGuarBs", pd);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryCtrctBs(Map<String, Object> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.queryCtrctBs", pd);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryBalanceBs(Map<String, Object> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.queryBalanceBs", pd);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryCashBs(Map<String, Object> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.queryCashBs", pd);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryIncodeBs(Map<String, Object> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.queryIncodeBs", pd);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryInstBs(Map<String, Object> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.queryInstBs", pd);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryLoanRltSgmtRpMsgByFactor(List<String> pd) throws Exception {
		//List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> list = (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.queryLoanRltSgmtRpMsgByFactor", pd);
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryMccSgmtRpRpMsgByFactor(List<String> pd) throws Exception {
		//List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> list = (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.queryMccSgmtRpRpMsgByFactor", pd);
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> querySpecSgmtRpRpMsgByFactor(List<String> pd) throws Exception {
		//List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> list = (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.querySpecSgmtRpRpMsgByFactor", pd);
		return list;
	}

	@Override
	public void updateAcctBsSgmtRpDataStatus(Map<String, Object> pd) throws Exception {
		dao.update("IndvInfoRpMapper.updateAcctBsSgmtRpDataStatus", pd);
	}
	@Override
	public void updateRepByRepName(Map<String, Object> pd) throws Exception {
		dao.update("IndvInfoRpMapper.updateRepByRepName", pd);
	}

	
	
	/**
	 * 企业基本信息
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryEntBsSgmtRpData(Map<String, Object> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.queryEntBsSgmtRpData", pd);
	}

	/**
	 * 企业基本信息 其他标识信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> getIDSgmtByFactor(List<String> list) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.getIDSgmtByFactor", list);
	}

	/**
	 * 企业基本信息主要组成人员段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> getMnMmbInfSgmtByFactor(List<String> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.getMnMmbInfSgmtByFactor", pd);
	}

	/**
	 * 企业基本信息注册资本及主要出资人段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> getMnShaHodInfSgmtByFactor(List<String> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.getMnShaHodInfSgmtByFactor", pd);
	}

	/**
	 * 企业基本信息实际控制人段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> getActuCotrlInfSgmtByFactor(List<String> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.getActuCotrlInfSgmtByFactor", pd);
	}

	/**
	 * 企业基本信息更新状态
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	public void updateGuarEntBsSgmtDataStatus(Map<String, Object> pd) throws Exception {
		dao.update("IndvInfoRpMapper.updateGuarEntBsSgmtDataStatus", pd);
	}

	/**
	 * 事业单位收入支出
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> getIncomeAndExpenseStatementBsSgmtByFactor(Map<String, Object> pd) throws Exception {
		return (List<Map<String, Object>>) dao
				.findForList("IndvInfoRpMapper.getIncomeAndExpenseStatementBsSgmtByFactor", pd);
	}

	/**
	 * 事业单位收入支出更新状态
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	public void updateIncomeAndExpenseStatementDataStatus(Map<String, Object> pd) throws Exception {
		dao.update("IndvInfoRpMapper.updateIncomeAndExpenseStatementDataStatus", pd);
	}

	/**
	 * 企业间关联关系信息
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> getEnIcdnRltpInfByFactor(Map<String, Object> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.getEnIcdnRltpInfByFactor", pd);
	}

	/**
	 * 企业间关联关系信息更新状态
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	public void updateEnIcdnRltpInfDataStatus(Map<String, Object> pd) throws Exception {
		dao.update("IndvInfoRpMapper.updateEnIcdnRltpInfDataStatus", pd);
	}

	/**
	 * 企业借贷账户交易
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> getEnAcctInfByFactor(Map<String,Object> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.getEnAcctInfByFactor", pd);
	}

	/**
	 * 企业借贷账户交易相关还款责任人段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> getRltRepymtInfSgmtByFactor(List<String> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.getRltRepymtInfSgmtByFactor", pd);
	}

	/**
	 * 企业借贷账户交易抵质押物信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> getMotgaCltalCtrctInfSgmtByFactor(List<String> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.getMotgaCltalCtrctInfSgmtByFactor", pd);
	}

	/**
	 * 企业借贷账户交易特定交易说明段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> getAcctSpecTrstDspnSgmtByFactor(List<String> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.getAcctSpecTrstDspnSgmtByFactor", pd);
	}

	/**
	 * 企业借贷账户交易更新状态
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	public void updateEnAcctInfDataStatus(Map<String, Object> pd) throws Exception {
		dao.update("IndvInfoRpMapper.updateEnAcctInfDataStatus", pd);
	}

	/**
	 * 企业担保账户信息
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> getGuarAcctBsSgmtByFactor(Map<String, Object> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.getGuarAcctBsSgmtByFactor", pd);
	}

	/**
	 * 企业担保账户信息相关还款责任人
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> getGuarRltRepymtInfSgmtByFactor(List<String> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.getGuarRltRepymtInfSgmtByFactor", pd);
	}

	/**
	 * 企业担保账户信息抵质押物信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> getGuarMotgaCltalCtrctInfSgmtByFactor(List<String> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.getGuarMotgaCltalCtrctInfSgmtByFactor",
				pd);
	}

	/**
	 * 企业担保账户信息更新状态
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	public void updateGuarAcctBsSgmtDataStatus(Map<String, Object> pd) throws Exception {
		dao.update("IndvInfoRpMapper.updateGuarAcctBsSgmtDataStatus", pd);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryEnCtrctInfRpData(Map<String, Object> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.queryEnCtrctInfRpData", pd);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryEntBsIDSgmtRpData(List<String> pd) throws Exception {
		//List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> list  = (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.queryEntBsIDSgmtRpData", pd);
		return list;
	}

	@Override
	/*穆楠 报文企业授信*/
	public void updateEnCtrctInfRpDataStatus(Map<String, Object> pd) throws Exception {
		dao.update("IndvInfoRpMapper.updateEnCtrctInfRpDataStatus", pd);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryEntBalanceSheetRpData(Map<String, Object> pd) throws Exception {
		//List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> list = (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.queryEntBalanceSheetRpData", pd);
		return list;
	}

	@Override
	public void updateEntBalanceSheetRpDataStatus(Map<String, Object> pd) throws Exception {
		dao.update("IndvInfoRpMapper.updateEntBalanceSheetRpDataStatus", pd);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryEntCashFlowsRpData(Map<String, Object> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.queryEntCashFlowsRpData", pd);
	}

	@Override
	public void updateEntCashFlowsRpDataStatus(Map<String, Object> pd) throws Exception {
		dao.update("IndvInfoRpMapper.updateEntCashFlowsRpDataStatus", pd);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryEntIncomeSPARpData(Map<String, Object> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.queryEntIncomeSPARpData", pd);
	}

	@Override
	public void updateEntIncomeSPARpDataStatus(Map<String, Object> pd) throws Exception {
		dao.update("IndvInfoRpMapper.updateEntIncomeSPARpDataStatus", pd);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryEntInstBalanceSheetRpData(Map<String, Object> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.queryEntInstBalanceSheetRpData", pd);
	}

	@Override
	public void updateEntInstBalanceSheetRpDataStatus(Map<String, Object> pd) throws Exception {
		dao.update("IndvInfoRpMapper.updateEntInstBalanceSheetRpDataStatus", pd);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryInEntDltRpData1(Map<String, Object> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.queryInEntDltRpData1", pd);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryInEntDltRpData2(Map<String, Object> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.queryInEntDltRpData2", pd);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryInEntDltRpData3(Map<String, Object> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.queryInEntDltRpData3", pd);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryInEntDltRpData4(Map<String, Object> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.queryInEntDltRpData4", pd);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryInEntDltRpData5(Map<String, Object> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.queryInEntDltRpData5", pd);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryMoCEntDltInfRpData(Map<String, Object> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.queryMoCEntDltInfRpData", pd);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryInDltRpData1(Map<String, Object> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.queryInDltRpData1", pd);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryInDltRpData2(Map<String, Object> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.queryInDltRpData2", pd);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryInDltRpData3(Map<String, Object> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.queryInDltRpData3", pd);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryInIDCagsInfRpData1(Map<String, Object> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.queryInIDCagsInfRpData1", pd);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryInIDCagsInfRpData2(Map<String, Object> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.queryInIDCagsInfRpData2", pd);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryInIDCagsInfRpData3(Map<String, Object> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.queryInIDCagsInfRpData3", pd);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryMoCIDCagsInfRpData(Map<String, Object> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.queryMoCIDCagsInfRpData", pd);
	}

	@Override
	public void updateInDltInfRpDataStatus(Map<String, Object> pd) throws Exception {
		dao.update("IndvInfoRpMapper.updateDltInfRpDataStatus", pd);
	}

	@Override
	public void updatenInEntDltInfRpDataStatus(Map<String, Object> pd) throws Exception {
		dao.update("IndvInfoRpMapper.updatenEntDltInfRpDataStatus", pd);
	}

	@Override
	public void updatenInIDCagsInfRpDataStatus(Map<String, Object> pd) throws Exception {
		dao.update("IndvInfoRpMapper.updatenIDCagsInfRpDataStatus", pd);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryEnDltRpData1(Map<String, Object> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.queryEnDltRpData1", pd);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryEnDltRpData2(Map<String, Object> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.queryEnDltRpData2", pd);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryEnDltRpData3(Map<String, Object> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.queryEnDltRpData3", pd);
	}

	@Override
	public void updateEnDltInfRpDataStatus(Map<String, Object> pd) throws Exception {
		dao.update("IndvInfoRpMapper.updateDltInfRpDataStatus", pd);
	}

	@Override
	public void updatenEnEntDltInfRpDataStatus(Map<String, Object> pd) throws Exception {
		dao.update("IndvInfoRpMapper.updatenEntDltInfRpDataStatus", pd);
	}

	@Override
	public void updatenEnIDCagsInfRpDataStatus(Map<String, Object> pd) throws Exception {
		dao.update("IndvInfoRpMapper.updatenIDCagsInfRpDataStatus", pd);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryEnEntDltRpData1(Map<String, Object> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.queryEnEntDltRpData1", pd);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryEnEntDltRpData2(Map<String, Object> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.queryEnEntDltRpData2", pd);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryEnEntDltRpData3(Map<String, Object> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.queryEnEntDltRpData3", pd);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryEnEntDltRpData4(Map<String, Object> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.queryEnEntDltRpData4", pd);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryEnEntDltRpData5(Map<String, Object> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.queryEnEntDltRpData5", pd);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryEnEntDltRpData7(Map<String, Object> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.queryEnEntDltRpData7", pd);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryEnEntDltRpData8(Map<String, Object> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.queryEnEntDltRpData8", pd);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryEnEntDltRpData9(Map<String, Object> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.queryEnEntDltRpData9", pd);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryEnEntDltRpData10(Map<String, Object> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.queryEnEntDltRpData10", pd);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryEnIDCagsInfRpData1(Map<String, Object> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.queryEnIDCagsInfRpData1", pd);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryEnIDCagsInfRpData2(Map<String, Object> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.queryEnIDCagsInfRpData2", pd);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryEnIDCagsInfRpData3(Map<String, Object> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.queryEnIDCagsInfRpData3", pd);
	}

	@Override
	public void updatenMoCIDCagsInfRpDataStatus(Map<String, Object> pd) throws Exception {
		dao.update("IndvInfoRpMapper.updatenIDCagsInfRpDataStatus", pd);		
	}

	@Override
	public void updatenMoCEntDltInfRpDataStatus(Map<String, Object> pd) throws Exception {
		dao.update("IndvInfoRpMapper.updatenEntDltInfRpDataStatus", pd);		
	}

	@Override
	public void insertReportNameForData(Map<String, Object> pd) throws Exception {
			 dao.update("IndvInfoRpMapper.insertReportNameForData", pd);
	}

	@Override
	public void insertReportMessage(List<ReportAndBackMessageEnt> list) throws Exception {
		Map<String, Object> map = new HashMap<String,Object>();
		for(ReportAndBackMessageEnt item :list){
			map.put("report_message_id",UUID.randomUUID().toString().replace("-", ""));
			map.put("report_message_file_name", item.getReport_message_file_name());
			map.put("report_message_type", item.getReport_message_type());
			map.put("report_message_status", item.getReport_message_status());
			map.put("txt_report_message_file_path", item.getTxt_report_message_file_path());
			map.put("enc_report_message_file_path", item.getEnc_report_message_file_path());
			map.put("zip_report_message_file_path", "");
			map.put("abnorm_reportmessage_filepath", "");
			map.put("create_success_time", "");
			map.put("org_code", "");
			map.put("description", "");
			map.put("record_num", item.getRecord_num());
			map.put("report_time", item.getReport_time());
			map.put("operator_user", item.getOperator_user());
			map.put("create_time", item.getCreate_time());
			map.put("company", item.getCompany());
			dao.insert("IndvInfoRpMapper.insertReportMessage", map);
		}
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryInSpcEvtDscInfRpData(Map<String, Object> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.queryInSpcEvtDscInfRpData", pd);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryMotgaCltalCtrctInfRpData(Map<String, Object> pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.queryMotgaCltalCtrctInfRpData", pd);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryComRecInfSgmtRpMsgByFactor(List<String> pd) throws Exception {
		//List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		//return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.queryComRecInfSgmtRpMsgByFactor", pd);
		List<Map<String, Object>> list = (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.queryComRecInfSgmtRpMsgByFactor", pd);
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryMotgaProptInfSgmtRpMsgByFactor(List<String> pd) throws Exception {
		//List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		//return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.queryMotgaProptInfSgmtRpMsgByFactor", pd);
		List<Map<String, Object>> list = (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.queryMotgaProptInfSgmtRpMsgByFactor", pd);
		return list;
	}

	
	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryCltalInfSgmtRpMsgByFactor(List<String> pd) throws Exception {
		//List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		//return (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.queryCltalInfSgmtRpMsgByFactor", pd);
		List<Map<String, Object>> list = (List<Map<String, Object>>) dao.findForList("IndvInfoRpMapper.queryCltalInfSgmtRpMsgByFactor", pd);
		return list;
	}
	
	@Override
	public void updateMotgaCltalCtrctInfRpDataStatus(Map<String, Object> pd) throws Exception {
		dao.update("IndvInfoRpMapper.updateMotgaCltalCtrctInfRpDataStatus", pd);
	}
	@Override
	public void updateReportDataStatus(Map<String, Object> pd) throws Exception {
		dao.update("IndvInfoRpMapper.updateReportDataStatus", pd);
	}

}
