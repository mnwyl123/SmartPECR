package com.dcits.supervise.pecr.ent.service.dataRecode;

import java.util.List;
import java.util.Map;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.ent.entity.EntIncomeAndExpenseStatemeBs;

/**
 * 事业单位资产负债
 * @author 穆楠
 *
 */
public interface EntIncomeAndExpenseStatemeBsManager {

	/**
	 * 事业单位资产负债   列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<EntIncomeAndExpenseStatemeBs> getentIncomeAndExpenseStatemeList(Page page) throws Exception;

	
	/**
	 * 事业单位资产负债 债表段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getAcctInfSgmtById(PageData pd) throws Exception;
	
	/**
	 * 事业单位资产负债 在保责任信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getRepymtInfSgmtById(PageData pd) throws Exception;

	

	

	/**
	 * 查询 基础段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getAcctBsSgmtKey(Map<String, Object> map) throws Exception;

	/**
	 * 新增   基础段
	 * @param pd
	 * @throws Exception
	 */
	public void insertAcctBsSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 修改   基础段
	 * @param map
	 * @throws Exception
	 */
	public void updateAcctBsSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 删除   基础段  (同时会删除其他段)
	 * @param map
	 * @throws Exception
	 */
	public void deleteAcctBsSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 查询 债表段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getAcctInfoSgmtKey(Map<String, Object> map) throws Exception;
	
	/**
	 * 新增   债表段
	 * @param map
	 * @throws Exception
	 */
	public void insertAcctInfoSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 修改   债表段
	 * @param map
	 * @throws Exception
	 */
	public void updateAcctInfoSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 删除   债表段
	 * @param map
	 * @throws Exception
	 */
	public void delAcctInfoSgmt(Map<String, Object> map) throws Exception;
}
