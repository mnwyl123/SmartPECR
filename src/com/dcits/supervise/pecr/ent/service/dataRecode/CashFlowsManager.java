package com.dcits.supervise.pecr.ent.service.dataRecode;

import java.util.List;
import java.util.Map;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.ent.entity.CashFlows;

public interface CashFlowsManager {

	/**
	 * 企业现金流量   列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<CashFlows> getcashFlowsList(Page page) throws Exception;
	
	/**
	 * 基础段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getCashFlowsBsSgmtById(PageData pd) throws Exception;
	
	/**
	 * 企业现金流量表02现金流量表段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getCashFlows2002SgmtById(PageData pd) throws Exception;
	
	/**
	 * 企业现金流量表07现金流量表段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getCashFlows2007SgmtById(PageData pd) throws Exception;
	
	/**
	 * 查询 基础段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getCashFlowsBsSgmtKey(Map<String, Object> map) throws Exception;

	/**
	 * 新增   基础段
	 * @param pd
	 * @throws Exception
	 */
	public void insertCashFlowsBsSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 修改   基础段
	 * @param map
	 * @throws Exception
	 */
	public void updateCashFlowsBsSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 删除   基础段  (同时会删除其他段)
	 * @param map
	 * @throws Exception
	 */
	public void delCashFlowsBsSgmtById(Map<String, Object> map) throws Exception;
	
	/**
	 * 查询 企业现金流量表02现金流量表段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int get2002SgmtKey(Map<String, Object> map) throws Exception;

	/**
	 * 新增   企业现金流量表02现金流量表段
	 * @param pd
	 * @throws Exception
	 */
	public void insert2002Sgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 修改   企业现金流量表02现金流量表段
	 * @param map
	 * @throws Exception
	 */
	public void update2002Sgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 删除  企业现金流量表02现金流量表段
	 * @param map
	 * @throws Exception
	 */
	public void del2002SgmtById(Map<String, Object> map) throws Exception;
	
	/**
	 * 查询 企业现金流量表07现金流量表段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int get2007SgmtKey(Map<String, Object> map) throws Exception;

	/**
	 * 新增   企业现金流量表07现金流量表段
	 * @param pd
	 * @throws Exception
	 */
	public void insert2007Sgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 修改   企业现金流量表07现金流量表段
	 * @param map
	 * @throws Exception
	 */
	public void update2007Sgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 删除  企业现金流量表07现金流量表段
	 * @param map
	 * @throws Exception
	 */
	public void del2007SgmtById(Map<String, Object> map) throws Exception;
}
