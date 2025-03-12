package com.dcits.supervise.pecr.ent.service.dataRecode.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.ent.entity.EntIncomeAndExpenseStatemeBs;
import com.dcits.supervise.pecr.ent.service.dataRecode.EntIncomeAndExpenseStatemeBsManager;

/**
 * 事业单位资产负债
 * @author 穆楠
 *
 */
@Service("entIncomeAndExpenseStatemeBs")
public class EntIncomeAndExpenseStatemeBsService implements EntIncomeAndExpenseStatemeBsManager{

	@Resource(name = "daoSupportPecr")
	private DaoSupportPecr dao;
	
	/**
	 * 事业单位资产负债   列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<EntIncomeAndExpenseStatemeBs> getentIncomeAndExpenseStatemeList(Page page)
			throws Exception {
		return (List<EntIncomeAndExpenseStatemeBs>) dao.findForList("EntIncomeAndExpenseStatemeBsMapper.getlistPage", page);
	}


	/**
	 * 事业单位资产负债 基本信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getAcctInfSgmtById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("EntIncomeAndExpenseStatemeBsMapper.getAcctInfSgmtById", pd);
	}
	
	/**
	 * 事业单位资产负债 在保责任信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getRepymtInfSgmtById(PageData pd) throws Exception {
		return (PageData) dao.findForObject(
				"EntIncomeAndExpenseStatemeBsMapper.getRepymtInfSgmtById", pd);
	}
	
	/**
	 * 查询 基础段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getAcctBsSgmtKey(Map<String, Object> map) throws Exception{
		return (int) dao.findForObject("EntIncomeAndExpenseStatemeBsMapper.getAcctBsSgmtKey", map);
	}

	/**
	 * 新增   基础段
	 * @param pd
	 * @throws Exception
	 */
	public void insertAcctBsSgmt(Map<String, Object> map) throws Exception{
		dao.save("EntIncomeAndExpenseStatemeBsMapper.insertAcctBsSgmt", map);
	}
	
	/**
	 * 修改   基础段
	 * @param pd
	 * @throws Exception
	 */
	public void updateAcctBsSgmt(Map<String, Object> map) throws Exception{
		dao.update("EntIncomeAndExpenseStatemeBsMapper.updateAcctBsSgmt", map);
	}
	
	/**
	 * 删除   基础段  (同时会删除其他段)
	 * @param map
	 * @throws Exception
	 */
	public void deleteAcctBsSgmt(Map<String, Object> map) throws Exception{
		//基础段
		dao.delete("EntIncomeAndExpenseStatemeBsMapper.delAcctBsSgmtById", map);
		//基本信息段
		dao.delete("EntIncomeAndExpenseStatemeBsMapper.delAcctInfSgmtById", map);
	}
	
	/**
	 * 查询 基本信息段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getAcctInfoSgmtKey(Map<String, Object> map) throws Exception{
		return (int) dao.findForObject("EntIncomeAndExpenseStatemeBsMapper.getAcctInfoSgmtKey", map);
	}
	
	/**
	 * 新增   基本信息段
	 * @param map
	 * @throws Exception
	 */
	public void insertAcctInfoSgmt(Map<String, Object> map) throws Exception{
		dao.save("EntIncomeAndExpenseStatemeBsMapper.insertAcctInfoSgmt", map);
	}
	
	/**
	 * 修改   基本信息段
	 * @param map
	 * @throws Exception
	 */
	public void updateAcctInfoSgmt(Map<String, Object> map) throws Exception{
		dao.update("EntIncomeAndExpenseStatemeBsMapper.updateAcctInfoSgmt", map);
	}
	
	/**
	 * 删除   基本信息段
	 * @param map
	 * @throws Exception
	 */
	public void delAcctInfoSgmt(Map<String, Object> map) throws Exception{
		dao.delete("EntIncomeAndExpenseStatemeBsMapper.delAcctInfoSgmt", map);
	}
}
