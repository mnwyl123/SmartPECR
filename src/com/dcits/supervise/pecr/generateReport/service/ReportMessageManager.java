package com.dcits.supervise.pecr.generateReport.service;

import java.util.List;
import java.util.Map;

import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.generateReport.entity.IndvBsSgmtReportEntity;
import com.dcits.supervise.pecr.generateReport.entity.ReportAndBackMessageEnt;
import com.dcits.supervise.pecr.generateReport.entity.SerialNumberEntity;

public interface ReportMessageManager {
	
	/**
	 * 获取要生成的报文总条数
	 */
	public int getReportCount(Map<String, Object> map) throws Exception;
	/**
	 * 获取要生成的报文总条数
	 */
	public int getReportCountSps(Map<String, Object> map) throws Exception;
	
	/**
	 * 获取区构码  生成报文名 或 报文头使用 
	 */
	public List<Map<String, Object>> get14OrgCode(String company) throws Exception;
	
	/**
	 * 获取区构码  生成报文名 或 报文头使用 
	 * 后边需要删除
	 */
	public String getCcrcOrgCode(Map<String, Object> map) throws Exception;
	
	/**
	 * 获取流水表锁和数据
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public PageData getLock(PageData pd) throws Exception;
	/**
	 * 新增基本流水信息，进行先删后增
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public void insertSerivalNumber(PageData pd) throws Exception;
	/**
	 * 更新流水号
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public boolean updateSerivalNumber(PageData pd) throws Exception;

	//个人基本信息模块
	/**
	 * 个人基本信息生成报文数据查询
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<IndvBsSgmtReportEntity> queryBsSgmtRpData(Map<String, Object> pd) throws Exception;
	/**
	 * 个人基本信息一对多数据查询
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryBsIDSgmtRpData(List<String> pd) throws Exception;
	/**
	 * 个人基本信息数据状态更新
	 * @param pd
	 * @throws Exception
	 */
	public void updateBsSgmtRpDataStatus(Map<String, Object> pd) throws Exception;
	//个人家庭信息模块
	/**
	 * 个人家庭信息生成报文数据查询 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryInFalMmbRpData(Map<String, Object> pd) throws Exception;
	/**
	 * 个人家庭信息生成报文数据状态更新
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void updateInFalMmbRpDataStatus(Map<String, Object> pd) throws Exception;
	//个人证件有效信息模块
	/**
	 * 个人证件有效信息数据查询
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryInIDEfctRpData(Map<String, Object> pd) throws Exception;
	/**
	 * 个人证件有效信息数据状态更新
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void updateInIDEfctRpDataStatus(Map<String, Object> pd) throws Exception;

	/**
	 * 个人借贷特殊事件说明信息数据状态更新
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void updateInSpcEvtDscInfRpDataStatus(Map<String, Object> pd) throws Exception;

	
	//个人证件整合信息模块
	/**
	 * 个人证件整合信息生成报文数据查询 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryInCtfItgRpData(Map<String, Object> pd) throws Exception;
	/**
	 * 个人证件整合信息数据状态更新
	 * @param pd
	 * @throws Exception
	 */
	public void updateInCtfItgRpDataStatus(Map<String, Object> pd) throws Exception;
	//个人担保账户信息模块
	/**
	 * 个人担保账户信息生成报文数据查询 
	 * @param pd
	 * @throws Exception
	 */
	public List<Map<String, Object>> dataGuarAcctBsSgmtlist(Map<String, Object> pd) throws Exception;
	
	/**
	 * 个人担保账户信息生成报文数据查询 
	 * @param pd
	 * @throws Exception
	 */
	public List<Map<String, Object>> getlableCN(Map<String, Object> pd) throws Exception;
	
	/**
	 * 个人担保账户信息生成报文一对多数据查询 
	 * @param pd
	 * @throws Exception
	 */
	public List<Map<String, Object>> getGuarMccRpMsgByFactor(List<String> pd) throws Exception;
	/**
	 * 个人担保账户信息生成报文一对多数据查询 
	 * @param pd
	 * @throws Exception
	 */
	public List<Map<String, Object>> getRLTRepymtRpMsgByFactor(List<String> pd) throws Exception;
	/**
	 * 个人担保账户信息数据状态更新
	 * @param pd
	 * @throws Exception
	 */
	public void updateGuarAcctBsDataStatus(Map<String, Object> pd) throws Exception;
	//个人授信信息模块
	/**
	 * 个人授信生成报文数据查询
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryInCtrctInfRpData(Map<String, Object> pd) throws Exception;
	
	//韦宗英  add 根据报文id获取个人授信信息模块
	/**
	 * 个人授信生成报文数据查询
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryInCtrctInfByRepID(Map<String, Object> pd) throws Exception;
	
	//韦宗英  add 根据报文id获取个人授信信息模块
	/**
	 * 个人授信生成报文数据查询
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryIndvBs(Map<String, Object> pd) throws Exception;
	//韦宗英  add 根据报文id获取个人授信信息模块
	/**
	 * 个人授信生成报文数据查询
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryFalBs(Map<String, Object> pd) throws Exception;
	
	//韦宗英  add 根据报文id获取个人授信信息模块
	/**
	 * 个人授信生成报文数据查询
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryIDBs(Map<String, Object> pd) throws Exception;
	//韦宗英  add 根据报文id获取个人授信信息模块
	/**
	 * 个人授信生成报文数据查询
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> querySecAcctTBs(Map<String, Object> pd) throws Exception;
	
	//韦宗英  add 根据报文id获取个人授信信息模块
	/**
	 * 个人授信生成报文数据查询
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryAcctSgmtBs(Map<String, Object> pd) throws Exception;
	
	//韦宗英  add 根据报文id获取个人授信信息模块
	/**
	 * 个人授信生成报文数据查询
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> querySpcBs(Map<String, Object> pd) throws Exception;
	
	//韦宗英  add 根据报文id获取个人授信信息模块
	/**
	 * 个人授信生成报文数据查询
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryEBs(Map<String, Object> pd) throws Exception;
	
	//韦宗英  add 根据报文id获取个人授信信息模块
	/**
	 * 个人授信生成报文数据查询
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryIncomeBs(Map<String, Object> pd) throws Exception;
	
	//韦宗英  add 根据报文id获取个人授信信息模块
	/**
	 * 个人授信生成报文数据查询
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryIcdnBs(Map<String, Object> pd) throws Exception;
	//韦宗英  add 根据报文id获取个人授信信息模块
	/**
	 * 个人授信生成报文数据查询
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryAcctBs(Map<String, Object> pd) throws Exception;
	//韦宗英  add 根据报文id获取个人授信信息模块
	/**
	 * 个人授信生成报文数据查询
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryGuarBs(Map<String, Object> pd) throws Exception;
	
	//韦宗英  add 根据报文id获取个人授信信息模块
	/**
	 * 个人授信生成报文数据查询
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryCtrctBs(Map<String, Object> pd) throws Exception;
	
	//韦宗英  add 根据报文id获取个人授信信息模块
	/**
	 * 个人授信生成报文数据查询
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryBalanceBs(Map<String, Object> pd) throws Exception;
	
	//韦宗英  add 根据报文id获取个人授信信息模块
	/**
	 * 个人授信生成报文数据查询
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryCashBs(Map<String, Object> pd) throws Exception;
	//韦宗英  add 根据报文id获取个人授信信息模块
	/**
	 * 个人授信生成报文数据查询
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryIncodeBs(Map<String, Object> pd) throws Exception;
	//韦宗英  add 根据报文id获取个人授信信息模块
	/**
	 * 个人授信生成报文数据查询
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryInstBs(Map<String, Object> pd) throws Exception;
	
	/**
	 * 个人授信一对多数据查询
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getCtrctCertRelRpMsgByFactor(List<String> pd) throws Exception;
	/**
	 * 个人授信数据状态更新
	 * @param pd
	 * @throws Exception
	 */
	public void updateInCtrctInfRpDataStatus(Map<String, Object> pd) throws Exception;
	
	/**
	 * 各个基础信息表中数据的数据状态更新
	 * 20201224以及顺便更新表：feed_back_report_err_message中的存放主键字段RECORD_ID，后续代码用到暂时放置近去。
	 * @param pd
	 * @throws Exception
	 */
	public void editInCtrctInfStatus(Map<String, Object> pd) throws Exception;
	
	//个人借贷信息、
	/**
	 * 个人借贷生成报文数据查询
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryAcctBsSgmtRpData(Map<String, Object> pd) throws Exception;
	/**
	 * 个人借贷一对多数据查询
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryLoanRltSgmtRpMsgByFactor(List<String> pd) throws Exception;
	/**
	 * 个人借贷一对多数据查询
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryMccSgmtRpRpMsgByFactor(List<String> pd) throws Exception;
	/**
	 * 个人借贷一对多数据查询
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> querySpecSgmtRpRpMsgByFactor(List<String> pd) throws Exception;
	/**
	 * 个人借贷更新状态
	 * @param pd
	 * @throws Exception
	 */
	public void updateAcctBsSgmtRpDataStatus(Map<String, Object> pd) throws Exception;
	
	/**
	 * 更新报文状态
	 * @param pd
	 * @throws Exception
	 */
	public void updateRepByRepName(Map<String, Object> pd) throws Exception;
	/**
	 * 企业基本信息 
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryEntBsSgmtRpData(Map<String, Object> pd) throws Exception;
	/**
	 * 企业基本信息 其他标识信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getIDSgmtByFactor(List<String> pd) throws Exception;
	/**
	 * 企业基本信息主要组成人员段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getMnMmbInfSgmtByFactor(List<String> pd) throws Exception;
	/**
	 * 企业基本信息注册资本及主要出资人段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getMnShaHodInfSgmtByFactor(List<String> pd) throws Exception;
	/**
	 * 企业基本信息实际控制人段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getActuCotrlInfSgmtByFactor(List<String> pd) throws Exception;
	/**
	 * 企业基本信息更新状态
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void updateGuarEntBsSgmtDataStatus(Map<String, Object> pd) throws Exception;
	/**
	 * 事业单位收入支出
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getIncomeAndExpenseStatementBsSgmtByFactor(Map<String, Object> pd) throws Exception;
	/**
	 * 事业单位收入支出更新状态
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void updateIncomeAndExpenseStatementDataStatus(Map<String, Object> pd) throws Exception;
	/**
	 * 企业间关联关系信息
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getEnIcdnRltpInfByFactor(Map<String, Object> pd) throws Exception;
	/**
	 * 企业间关联关系信息更新状态
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void updateEnIcdnRltpInfDataStatus(Map<String, Object> pd) throws Exception;
	/**
	 * 企业借贷账户交易
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getEnAcctInfByFactor(Map<String, Object> pd) throws Exception;
	/**
	 * 企业借贷账户交易 相关还款责任人段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getRltRepymtInfSgmtByFactor(List<String> pd) throws Exception;
	/**
	 * 企业借贷账户交易抵质押物信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getMotgaCltalCtrctInfSgmtByFactor(List<String> pd) throws Exception;
	/**
	 * 企业借贷账户交易特定交易说明段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getAcctSpecTrstDspnSgmtByFactor(List<String> pd) throws Exception;
	/**
	 * 企业借贷账户交易更新状态
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void updateEnAcctInfDataStatus(Map<String, Object> pd) throws Exception;
	/**
	 * 企业担保账户信息
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getGuarAcctBsSgmtByFactor(Map<String, Object> pd) throws Exception;
	/**
	 * 企业担保账户信息相关还款责任人
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getGuarRltRepymtInfSgmtByFactor(List<String> pd) throws Exception;
	/**
	 * 企业担保账户信息抵质押物信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getGuarMotgaCltalCtrctInfSgmtByFactor(List<String> pd) throws Exception;
	/**
	 * 企业担保账户信息更新状态
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void updateGuarAcctBsSgmtDataStatus(Map<String, Object> pd) throws Exception;


	/**
	 * 企业授信信息
	 *
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryEnCtrctInfRpData(Map<String, Object> pd) throws Exception;

	/**
	 * 企业授信一对多数据查询
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryEntBsIDSgmtRpData(List<String> pd) throws Exception;

	/**
	 * 企业授信信息数据状态更新 
	 * @param pd
	 * @throws Exception
	 */
	public void updateEnCtrctInfRpDataStatus(Map<String, Object> pd) throws Exception;
	/**
	 * 企业资产负债表
	 *
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryEntBalanceSheetRpData(Map<String, Object> pd) throws Exception;

	/**
	 * 企业资产负债表数据状态更正
	 * @param pd
	 * @throws Exception
	 */
	public void updateEntBalanceSheetRpDataStatus(Map<String, Object> pd) throws Exception;
	/**
	 * 企业现金流量表
	 *
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryEntCashFlowsRpData(Map<String, Object> pd) throws Exception;

	/**
	 * 企业现金流表数据状态更新
	 * @param pd
	 * @throws Exception
	 */
	public void updateEntCashFlowsRpDataStatus(Map<String, Object> pd) throws Exception;

	/**
	 * 企业利润及利润分配表
	 *
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryEntIncomeSPARpData(Map<String, Object> pd) throws Exception;

	/**
	 * 企业利润及利润分配表数据状态更新
	 * @param pd
	 * @throws Exception
	 */
	public void updateEntIncomeSPARpDataStatus(Map<String, Object> pd) throws Exception;

	/**
	 * 事业单位资产负债表
	 *
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryEntInstBalanceSheetRpData(Map<String, Object> pd) throws Exception;
	/**
	 * 事业单位资产负债表基础段数据状态更新
	 * 
	 * 生成报文中：90
	 * 数据校验成功：20
	 * 50 ：已生成报文
	 * @param needReportDetail
	 * @param flag
	 * @return
	 * @throws Exception
	 */
	public void updateEntInstBalanceSheetRpDataStatus(Map<String, Object> pd) throws Exception;

	/**
	 * 整笔删除信息
	 *
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	/**
	 * 个人基本信息整笔删除请求记录表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryInEntDltRpData1(Map<String, Object> pd) throws Exception;

	/**
	 * 134-个人证件有效期信息整笔删除请求记录表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryInEntDltRpData2(Map<String, Object> pd) throws Exception;

	/**
	 * 214-个人借贷账户整笔删除请求记录表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryInEntDltRpData3(Map<String, Object> pd) throws Exception;

	/**
	 * 224-个人授信协议整笔删除请求记录表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryInEntDltRpData4(Map<String, Object> pd) throws Exception;

	/**
	 * 224-个人授信协议整笔删除请求记录表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryInEntDltRpData5(Map<String, Object> pd) throws Exception;

	/**
	 * 抵质押合同整笔删除
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryMoCEntDltInfRpData(Map<String, Object> pd) throws Exception;
	
	/**
	 * 314-企业基本信息整笔删除请求记录
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryEnEntDltRpData1(Map<String, Object> pd) throws Exception;

	/**
	 * 414-企业借贷账户整笔删除请求类记录
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryEnEntDltRpData2(Map<String, Object> pd) throws Exception;

	/**
	 *444-企业担保账户整笔删除请求记录
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryEnEntDltRpData3(Map<String, Object> pd) throws Exception;

	/**
	 * 654-事业单位收入支出表整笔删除请求记录
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryEnEntDltRpData4(Map<String, Object> pd) throws Exception;

	/**
	 * 644-事业单位资产负债表整笔删除请求记录
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryEnEntDltRpData5(Map<String, Object> pd) throws Exception;
	/**
	 * 634-企业现金流量表整笔删除请求记录
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryEnEntDltRpData7(Map<String, Object> pd) throws Exception;

	/**
	 * 624-企业利润及利润分配表整笔删除请求记录
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryEnEntDltRpData8(Map<String, Object> pd) throws Exception;

	/**
	 * 614-企业资产负债表整笔删除请求记录
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryEnEntDltRpData9(Map<String, Object> pd) throws Exception;

	/**
	 * 424-企业授信协议整笔删除请求记录
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryEnEntDltRpData10(Map<String, Object> pd) throws Exception;

	/**
	 * 个人模块按段删除
	 * @param pd
	 * @throws Exception
	 */
	public void updateInDltInfRpDataStatus(Map<String, Object> pd) throws Exception;
	/**
	 * 个人模块整笔删除信息
	 *
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void updatenInEntDltInfRpDataStatus(Map<String, Object> pd) throws Exception;
	/**
	 * 个人模块标识变更信息
	 *
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void updatenInIDCagsInfRpDataStatus(Map<String, Object> pd) throws Exception;
	/**
	 * 个人借贷账户按段删除请求记录表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryInDltRpData1(Map<String, Object> pd) throws Exception;
	/**
	 * 个人授信协议按段删除请求记录表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryInDltRpData2(Map<String, Object> pd) throws Exception;
	/**
	 * 个人借贷账户按段删除请求记录表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryInDltRpData3(Map<String, Object> pd) throws Exception;

	/**
	 * 标识变更信息
	 *
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	/**
	 * 个人借贷账户标识变更请求记录表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryInIDCagsInfRpData1(Map<String, Object> pd) throws Exception;

	/**
	 * 个人借贷账户标识变更请求记录表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryInIDCagsInfRpData2(Map<String, Object> pd) throws Exception;

	/**
	 * 个人担保账户标识变更请求记录表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryInIDCagsInfRpData3(Map<String, Object> pd) throws Exception;

	/**
	 * 抵（质）押合同标识变更
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryMoCIDCagsInfRpData(Map<String, Object> pd) throws Exception;
	/**
	 * 企业借贷账户标识变更请求记录表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryEnIDCagsInfRpData1(Map<String, Object> pd) throws Exception;

	/**
	 * 企业借贷账户标识变更请求记录表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryEnIDCagsInfRpData2(Map<String, Object> pd) throws Exception;

	/**
	 * 企业担保账户标识变更请求记录表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryEnIDCagsInfRpData3(Map<String, Object> pd) throws Exception;

	/**
	 * 企业借贷账户按段删除请求记录表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryEnDltRpData1(Map<String, Object> pd) throws Exception;
	/**
	 * 企业授信协议按段删除请求记录表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryEnDltRpData2(Map<String, Object> pd) throws Exception;
	/**
	 * 企业借贷账户按段删除请求记录表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryEnDltRpData3(Map<String, Object> pd) throws Exception;
	/**
	 * 企业模块按段删除
	 * @param pd
	 * @throws Exception
	 */
	public void updateEnDltInfRpDataStatus(Map<String, Object> pd) throws Exception;
	/**
	 * 企业模块整笔删除信息
	 *
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void updatenEnEntDltInfRpDataStatus(Map<String, Object> pd) throws Exception;
	/**
	 * 企业模块标识变更信息
	 *
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void updatenEnIDCagsInfRpDataStatus(Map<String, Object> pd) throws Exception;

	/**
	 * 抵质押合同模块标识变更信息
	 *
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void updatenMoCIDCagsInfRpDataStatus(Map<String, Object> pd) throws Exception;
	

	/**
	 * 抵质押模合同块整笔删除信息
	 *
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void updatenMoCEntDltInfRpDataStatus(Map<String, Object> pd) throws Exception;
	
	/**
	 * 生成报文后向数据中插入报文名
	 *
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void insertReportNameForData(Map<String, Object> pd) throws Exception;
	
	/**
	 * 生成报文后插入报文数据
	 *
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void insertReportMessage(List<ReportAndBackMessageEnt> list) throws Exception;
	
	/**
	 * 510-抵（质）押合同信息数据
	 *
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryInSpcEvtDscInfRpData(Map<String, Object> pd) throws Exception;
	
	/**
	 * 抵（质）押合同信息其他债务人信息一对多数据
	 *
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryMotgaCltalCtrctInfRpData(Map<String, Object> pd) throws Exception;
	
	/**
	 * 个人借贷特殊事件说明
	 *
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryComRecInfSgmtRpMsgByFactor(List<String> pd) throws Exception;
	
	/**
	 * 抵（质）押合同信息抵押物信息一对多数据
	 *
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryMotgaProptInfSgmtRpMsgByFactor(List<String> pd) throws Exception;
	
	/**
	 * 抵（质）押合同信息质押物信息一对多数据
	 *
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryCltalInfSgmtRpMsgByFactor(List<String> pd) throws Exception;
	
	/**
	 * 抵（质）押合同信息记录数据状态更新
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void updateMotgaCltalCtrctInfRpDataStatus(Map<String, Object> pd) throws Exception;
	
	/**
	 * 公共方法，获取到待生成报文中审核成功之后先改变其数据所有状态：30-->85
	 * @param pd
	 * @throws Exception
	 */
	public void updateReportDataStatus(Map<String, Object> pd) throws Exception;

}

