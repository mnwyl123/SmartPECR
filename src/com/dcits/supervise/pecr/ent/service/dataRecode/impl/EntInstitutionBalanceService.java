package com.dcits.supervise.pecr.ent.service.dataRecode.impl;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.ent.entity.EntInstitutionBalance;
import com.dcits.supervise.pecr.ent.service.dataRecode.EntInstitutionBalanceManager;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;

import java.util.List;
import java.util.Map;

/**
 * 企业财务报表   事业单位资产负债表
 * @author 穆楠
 *
 */
@Service("entInstitutionBalanceService")
public class EntInstitutionBalanceService implements EntInstitutionBalanceManager {
	
	@Resource(name = "daoSupportPecr")
	private DaoSupportPecr dao;

	/**
	 * 事业单位资产负债表  基础段  列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<EntInstitutionBalance> getBalanceSheetList(Page page) throws Exception{
		return (List<EntInstitutionBalance>) dao.findForList("EntInstitutionBalanceManager.insBalanceSheetBslistPage", page);
	}
	
	/**
	 * 事业单位资产负债表   基础段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> getInstitutionInfoById(PageData pd) throws Exception {
		return (Map<String, Object>) dao.findForObject("EntInstitutionBalanceManager.getInstitutionInfoById", pd);
	}
	
	/**
	 * 事业单位资产负债表段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getInstitutionSheetById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("EntInstitutionBalanceManager.getInstitutionSheetById", pd);
	}
	
	/**
	 * 查询 基础段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getInstitutionInfoBsKey(Map<String, Object> map) throws Exception{
		return (int) dao.findForObject("EntInstitutionBalanceManager.getInstitutionInfoBsKey", map);
	}

	/**
	 * 新增   基础段
	 * @param pd
	 * @throws Exception
	 */
	public void insertInstitutionInfoBs(Map<String, Object> map) throws Exception{
		dao.save("EntInstitutionBalanceManager.insertInstitutionInfoBs", map);
	}
	
	/**
	 * 修改   基础段
	 * @param pd
	 * @throws Exception
	 */
	public void updateInstitutionInfoBs(Map<String, Object> map) throws Exception{
		dao.update("EntInstitutionBalanceManager.updateInstitutionInfoBs", map);
	}
	
	/**
	 * 删除   基础段  (同时会删除其他段)
	 * @param map
	 * @throws Exception
	 */
	public void deleteInstitutionInfoBs(Map<String, Object> map) throws Exception{
		//基础段
		dao.delete("EntInstitutionBalanceManager.delInstitutionInfoById", map);
		//事业单位资产负债表段
		dao.delete("EntInstitutionBalanceManager.delInstitutionSheetById", map);
	}
	
	/**
	 * 查询   事业单位资产负债表段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getInsBalanceKey(Map<String, Object> map) throws Exception{
		return (int) dao.findForObject("EntInstitutionBalanceManager.getInsBalanceKey", map);
	}
	
	/**
	 * 新增   事业单位资产负债表段
	 * @param map
	 * @throws Exception
	 */
	public void insertInsBalance(Map<String, Object> map) throws Exception{
		dao.save("EntInstitutionBalanceManager.insertInsBalance", map);
	}
	
	/**
	 * 修改   事业单位资产负债表段
	 * @param map
	 * @throws Exception
	 */
	public void updateInsBalance(Map<String, Object> map) throws Exception{
		dao.update("EntInstitutionBalanceManager.updateInsBalance", map);
	}
	
	/**
	 * 删除   事业单位资产负债表段
	 * @param map
	 * @throws Exception
	 */
	public void delInsBalance(Map<String, Object> map) throws Exception{
		dao.delete("EntInstitutionBalanceManager.delInsBalance", map);
	}
	
}
