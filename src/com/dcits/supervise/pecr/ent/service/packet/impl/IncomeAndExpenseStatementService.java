package com.dcits.supervise.pecr.ent.service.packet.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.ent.entity.IncomeAndExpenseStatementDlt;
import com.dcits.supervise.pecr.ent.service.packet.IncomeAndExpenseStatementManager;

/**
 * 个人担保账户信息
 * @author 穆楠
 *
 */
@Service("incomeAndExpenseStatement")
public class IncomeAndExpenseStatementService implements IncomeAndExpenseStatementManager{

	@Resource(name = "daoSupportPecr")
	private DaoSupportPecr dao;

	/**
	 * 个人担保基础段   列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<IncomeAndExpenseStatementDlt> getList(Page page)
			throws Exception {
		return (List<IncomeAndExpenseStatementDlt>) dao.findForList("IncomeAndExpenseStatementMapper.getlistPage", page);
	}
	/**
	 * 事业单位收入支出表整笔删除请求记录段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getAcctInfSgmtById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("IncomeAndExpenseStatementMapper.getAcctInfSgmtById", pd);
	}
	/**
	 * 查询 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getAcctBsSgmtKey(Map<String, Object> map) throws Exception{
		return (int) dao.findForObject("IncomeAndExpenseStatementMapper.getAcctBsSgmtKey", map);
	}

	/**
	 * 新增   
	 * @param pd
	 * @throws Exception
	 */
	public void insertAcctBsSgmt(Map<String, Object> map) throws Exception{
		dao.save("IncomeAndExpenseStatementMapper.insertAcctBsSgmt", map);
	}
	
	/**
	 * 修改   
	 * @param pd
	 * @throws Exception
	 */
	public void updateAcctBsSgmt(Map<String, Object> map) throws Exception{
		dao.update("IncomeAndExpenseStatementMapper.updateAcctBsSgmt", map);
	}
	
	/**
	 * 删除   
	 * @param map
	 * @throws Exception
	 */
	public void deleteAcctBsSgmt(Map<String, Object> map) throws Exception{
		dao.delete("IncomeAndExpenseStatementMapper.delAcctBsSgmtById", map);
	}
}
