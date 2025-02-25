package com.dcits.supervise.pecr.ent.service.dataRecode.impl;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.ent.entity.EntIncomeStatement;
import com.dcits.supervise.pecr.ent.service.dataRecode.EntIncomePabsInfoManager;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;

import java.util.List;
import java.util.Map;

/**
 * 企业财务报表   企业利润及利润分配表
 * @author leizx
 *
 */
@Service("entIncomePabsInfoService")
public class EntIncomePabsInfoService implements EntIncomePabsInfoManager {
	
	@Resource(name = "daoSupportPecr")
	private DaoSupportPecr dao;

	/**
	 * 企业利润及利润分配表  基础段  列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<EntIncomeStatement> getIncomeInfoList(Page page) throws Exception{
		return (List<EntIncomeStatement>) dao.findForList("EntIncomeInfoManager.incomeInfolistPage", page);
	}
	
	/**
	 * 企业利润及利润分配表   基础段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> getIncomeStatementById(PageData pd) throws Exception {
		return (Map<String, Object>) dao.findForObject("EntIncomeInfoManager.getIncomeStatementById", pd);
	}
	
	/**
	 * 企业利润及利润分配表  02企业利润及利润分配表段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getIncomeStatement02ById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("EntIncomeInfoManager.getIncomeStatement02ById", pd);
	}
	
	/**
	 * 企业利润及利润分配表  07企业利润及利润分配表段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getIncomeStatement07ById(PageData pd) throws Exception{
		return (PageData) dao.findForObject("EntIncomeInfoManager.getIncomeStatement07ById", pd);
	}
	
	/**
	 * 查询 基础段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getIncomeStatementKey(Map<String, Object> map) throws Exception{
		return (int) dao.findForObject("EntIncomeInfoManager.getIncomeStatementKey", map);
	}

	/**
	 * 新增   基础段
	 * @param pd
	 * @throws Exception
	 */
	public void insertIncomeStatement(Map<String, Object> map) throws Exception{
		dao.save("EntIncomeInfoManager.insertIncomeStatement", map);
	}
	
	/**
	 * 修改   基础段
	 * @param pd
	 * @throws Exception
	 */
	public void updateIncomeStatement(Map<String, Object> map) throws Exception{
		dao.update("EntIncomeInfoManager.updateIncomeStatement", map);
	}
	
	/**
	 * 删除   基础段  (同时会删除其他段)
	 * @param map
	 * @throws Exception
	 */
	public void deleteIncomeStatement(Map<String, Object> map) throws Exception{
		//基础段
		dao.delete("EntIncomeInfoManager.delIncomeStateById", map);
		//02 企业利润及利润分配表段
		dao.delete("EntIncomeInfoManager.delIncomeState02ById", map);
		//07 企业利润及利润分配表段
		dao.delete("EntIncomeInfoManager.delIncomeState07ById", map);
	}
	
	/**
	 * 查询 02企业利润及利润分配表段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getIncome2002Key(Map<String, Object> map) throws Exception{
		return (int) dao.findForObject("EntIncomeInfoManager.getIncome2002Key", map);
	}
	
	/**
	 * 新增   02企业利润及利润分配表段
	 * @param map
	 * @throws Exception
	 */
	public void insertIncome2002(Map<String, Object> map) throws Exception{
		dao.save("EntIncomeInfoManager.insertIncome2002", map);
	}
	
	/**
	 * 修改   02企业利润及利润分配表段
	 * @param map
	 * @throws Exception
	 */
	public void updateIncome2002(Map<String, Object> map) throws Exception{
		dao.update("EntIncomeInfoManager.updateIncome2002", map);
	}
	
	/**
	 * 删除   02企业利润及利润分配表段
	 * @param map
	 * @throws Exception
	 */
	public void delIncome2002(Map<String, Object> map) throws Exception{
		dao.delete("EntIncomeInfoManager.delIncome2002", map);
	}
	
	/**
	 * 查询 07企业利润及利润分配表段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getIncomeState2007Key(Map<String, Object> map) throws Exception{
		return (int) dao.findForObject("EntIncomeInfoManager.getIncomeState2007Key", map);
	}
	
	/**
	 * 新增   07企业利润及利润分配表段
	 * @param map
	 * @throws Exception
	 */
	public void insertIncomeState2007(Map<String, Object> map) throws Exception{
		dao.save("EntIncomeInfoManager.insertIncomeState2007", map);
	}
	
	/**
	 * 修改   07企业利润及利润分配表段
	 * @param map
	 * @throws Exception
	 */
	public void updateIncomeState2007(Map<String, Object> map) throws Exception{
		dao.update("EntIncomeInfoManager.updateIncomeState2007", map);
	}
	
	/**
	 * 删除   07企业利润及利润分配表段
	 * @param map
	 * @throws Exception
	 */
	public void delIncomeState2007(Map<String, Object> map) throws Exception{
		dao.delete("EntIncomeInfoManager.delIncomeState2007", map);
	}
	
}
