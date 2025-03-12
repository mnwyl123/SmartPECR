package com.dcits.supervise.pecr.ent.service.dataRecode;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.ent.entity.EntBalanceSheetBsSgmt;

import java.util.List;
import java.util.Map;

/**
 * 企业财务报表   企业资产负债表  持久层
 * @author 穆楠
 *
 */
public interface EntBalanceSheetInfoManager {
	
	/**
	 * 获取企业资产负债表  基础段  列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<EntBalanceSheetBsSgmt> getAssetsInfoList(Page page) throws Exception;
	
	/**
	 * 企业资产负债表  基础段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getBalanceBsSgmtById(PageData pd) throws Exception;
	
	/**
	 * 企业资产负债表  02企业资产负债表段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getBalanceSheet2002ById(PageData pd) throws Exception;
	
	/**
	 * 企业资产负债表  07企业资产负债表段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getBalanceSheet2007ById(PageData pd) throws Exception;

	/**
	 * 查询 基础段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getBalanceSheetSgmtKey(Map<String, Object> map) throws Exception;
	
	/**
	 * 新增   基础段
	 * @param pd
	 * @throws Exception
	 */
	public void insertBalanceSheetSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 修改   基础段
	 * @param map
	 * @throws Exception
	 */
	public void updateBalanceSheetSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 删除   基础段  (同时会删除其他段)
	 * @param map
	 * @throws Exception
	 */
	public void deleteBalanceSheetSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 查询 02企业资产负债表段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getSheet02SgmtKey(Map<String, Object> map) throws Exception;
	
	/**
	 * 新增   02企业资产负债表段
	 * @param map
	 * @throws Exception
	 */
	public void insertSheet02Sgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 修改   02企业资产负债表段
	 * @param map
	 * @throws Exception
	 */
	public void updateSheet02Sgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 删除   02企业资产负债表段
	 * @param map
	 * @throws Exception
	 */
	public void delSheet02Sgmt(Map<String, Object> map) throws Exception;
	
	
	/**
	 * 查询 07企业资产负债表段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getSheet07SgmtKey(Map<String, Object> map) throws Exception;
	
	/**
	 * 新增   07企业资产负债表段
	 * @param map
	 * @throws Exception
	 */
	public void insertSheet07Sgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 修改   07企业资产负债表段
	 * @param map
	 * @throws Exception
	 */
	public void updateSheet07Sgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 删除   07企业资产负债表段
	 * @param map
	 * @throws Exception
	 */
	public void delSheet07Sgmt(Map<String, Object> map) throws Exception;
	
}
