package com.dcits.supervise.pecr.ent.service.dataRecode.impl;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.ent.entity.EntBalanceSheetBsSgmt;
import com.dcits.supervise.pecr.ent.service.dataRecode.EntBalanceSheetInfoManager;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;

import java.util.List;
import java.util.Map;

/**
 * 企业财务报表   企业资产负债表
 * @author leizx
 *
 */
@Service("entBalanceSheetInfoService")
public class EntBalanceSheetInfoService implements EntBalanceSheetInfoManager {
	
	@Resource(name = "daoSupportPecr")
	private DaoSupportPecr dao;

	/**
	 * 企业资产负债表  基础段  列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<EntBalanceSheetBsSgmt> getAssetsInfoList(Page page) throws Exception{
		return (List<EntBalanceSheetBsSgmt>) dao.findForList("EntBalanceSheetInfoManager.assetsInfolistPage", page);
	}
	
	/**
	 * 企业资产负债表   基础段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> getBalanceBsSgmtById(PageData pd) throws Exception {
		return (Map<String, Object>) dao.findForObject("EntBalanceSheetInfoManager.getBalanceBsSgmtById", pd);
	}
	
	/**
	 * 企业资产负债表  02企业资产负债表段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getBalanceSheet2002ById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("EntBalanceSheetInfoManager.getBalanceSheet2002ById", pd);
	}
	
	/**
	 * 企业资产负债表  07企业资产负债表段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getBalanceSheet2007ById(PageData pd) throws Exception{
		return (PageData) dao.findForObject("EntBalanceSheetInfoManager.getBalanceSheet2007ById", pd);
	}
	
	/**
	 * 查询 基础段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getBalanceSheetSgmtKey(Map<String, Object> map) throws Exception{
		return (int) dao.findForObject("EntBalanceSheetInfoManager.getBalanceSheetSgmtKey", map);
	}

	/**
	 * 新增   基础段
	 * @param pd
	 * @throws Exception
	 */
	public void insertBalanceSheetSgmt(Map<String, Object> map) throws Exception{
		dao.save("EntBalanceSheetInfoManager.insertBalanceSheetSgmt", map);
	}
	
	/**
	 * 修改   基础段
	 * @param pd
	 * @throws Exception
	 */
	public void updateBalanceSheetSgmt(Map<String, Object> map) throws Exception{
		dao.update("EntBalanceSheetInfoManager.updateBalanceSheetSgmt", map);
	}
	
	/**
	 * 删除   基础段  (同时会删除其他段)
	 * @param map
	 * @throws Exception
	 */
	public void deleteBalanceSheetSgmt(Map<String, Object> map) throws Exception{
		//基础段
		dao.delete("EntBalanceSheetInfoManager.delBalanceSheetById", map);
		//02企业资产负债表段
		dao.delete("EntBalanceSheetInfoManager.delSheet2002ById", map);
		//07企业资产负债表段
		dao.delete("EntBalanceSheetInfoManager.delSheet2007ById", map);
	}
	
	/**
	 * 查询 02企业资产负债表段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getSheet02SgmtKey(Map<String, Object> map) throws Exception{
		return (int) dao.findForObject("EntBalanceSheetInfoManager.getSheet02SgmtKey", map);
	}
	
	/**
	 * 新增   02企业资产负债表段
	 * @param map
	 * @throws Exception
	 */
	public void insertSheet02Sgmt(Map<String, Object> map) throws Exception{
		dao.save("EntBalanceSheetInfoManager.insertSheet02Sgmt", map);
	}
	
	/**
	 * 修改   02企业资产负债表段
	 * @param map
	 * @throws Exception
	 */
	public void updateSheet02Sgmt(Map<String, Object> map) throws Exception{
		dao.update("EntBalanceSheetInfoManager.updateSheet02Sgmt", map);
	}
	
	/**
	 * 删除   02企业资产负债表段
	 * @param map
	 * @throws Exception
	 */
	public void delSheet02Sgmt(Map<String, Object> map) throws Exception{
		dao.delete("EntBalanceSheetInfoManager.delSheet02Sgmt", map);
	}
	
	/**
	 * 查询 07企业资产负债表段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getSheet07SgmtKey(Map<String, Object> map) throws Exception{
		return (int) dao.findForObject("EntBalanceSheetInfoManager.getSheet07SgmtKey", map);
	}
	
	/**
	 * 新增   07企业资产负债表段
	 * @param map
	 * @throws Exception
	 */
	public void insertSheet07Sgmt(Map<String, Object> map) throws Exception{
		dao.save("EntBalanceSheetInfoManager.insertSheet07Sgmt", map);
	}
	
	/**
	 * 修改   07企业资产负债表段
	 * @param map
	 * @throws Exception
	 */
	public void updateSheet07Sgmt(Map<String, Object> map) throws Exception{
		dao.update("EntBalanceSheetInfoManager.updateSheet07Sgmt", map);
	}
	
	/**
	 * 删除   07企业资产负债表段
	 * @param map
	 * @throws Exception
	 */
	public void delSheet07Sgmt(Map<String, Object> map) throws Exception{
		dao.delete("EntBalanceSheetInfoManager.delSheet07Sgmt", map);
	}
	
}
