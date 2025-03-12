package com.dcits.supervise.pecr.ent.service.dataRecode;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.ent.entity.EntInstitutionBalance;

import java.util.List;
import java.util.Map;

/**
 * 企业财务报表   事业单位资产负债表  持久层
 * @author 穆楠
 *
 */
public interface EntInstitutionBalanceManager {
	
	/**
	 * 获取事业单位资产负债表  基础段  列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<EntInstitutionBalance> getBalanceSheetList(Page page) throws Exception;
	
	/**
	 * 事业单位资产负债表  基础段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getInstitutionInfoById(PageData pd) throws Exception;
	
	/**
	 * 事业单位资产负债表  02事业单位资产负债表段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getInstitutionSheetById(PageData pd) throws Exception;
	

	/**
	 * 查询 基础段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getInstitutionInfoBsKey(Map<String, Object> map) throws Exception;
	
	/**
	 * 新增   基础段
	 * @param pd
	 * @throws Exception
	 */
	public void insertInstitutionInfoBs(Map<String, Object> map) throws Exception;
	
	/**
	 * 修改   基础段
	 * @param map
	 * @throws Exception
	 */
	public void updateInstitutionInfoBs(Map<String, Object> map) throws Exception;
	
	/**
	 * 删除   基础段  (同时会删除其他段)
	 * @param map
	 * @throws Exception
	 */
	public void deleteInstitutionInfoBs(Map<String, Object> map) throws Exception;
	
	/**
	 * 查询  事业单位资产负债表段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getInsBalanceKey(Map<String, Object> map) throws Exception;
	
	/**
	 * 新增    事业单位资产负债表段
	 * @param map
	 * @throws Exception
	 */
	public void insertInsBalance(Map<String, Object> map) throws Exception;
	
	/**
	 * 修改    事业单位资产负债表段
	 * @param map
	 * @throws Exception
	 */
	public void updateInsBalance(Map<String, Object> map) throws Exception;
	
	/**
	 * 删除    事业单位资产负债表段
	 * @param map
	 * @throws Exception
	 */
	public void delInsBalance(Map<String, Object> map) throws Exception;
	
}
