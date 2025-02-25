package com.dcits.supervise.pecr.ent.service.seo.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.ent.entity.EntIncomeAndExpenseStatemeBs;
import com.dcits.supervise.pecr.ent.service.dataRecode.EntIncomeAndExpenseStatemeBsManager;
import com.dcits.supervise.pecr.ent.service.seo.EntIncomeAndExpenseStatemeBsSeoManager;

/**
 * 事业单位资产负债
 * @author wangyan
 *
 */
@Service("entIncomeAndExpenseStatemeBsSeo")
public class EntIncomeAndExpenseStatemeBsSeoService implements EntIncomeAndExpenseStatemeBsSeoManager{

	@Resource(name = "daoSupportPecr")
	private DaoSupportPecr dao;
	

	/**
   	 * 删除报文数据信息
   	 * 
   	 * @param pd
   	 * @return
   	 * @throws Exception
   	 */
	@Override
	public void deletedate(Map<String, Object> map) throws Exception {
		dao.delete("EntIncomeAndExpenseStatemeBsSeoMapper.deletedate", map);
	}
	/**
	 * 查询 中间表
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
    @SuppressWarnings("unchecked")
	@Override
    public List<PageData> dataList(Page page) throws Exception {
        return (List<PageData>) dao.findForList("EntIncomeAndExpenseStatemeBsSeoMapper.datalistPage", page);
    }
    /**
	 * 查询 当前表+历史表
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
    @SuppressWarnings("unchecked")
	@Override
    public List<EntIncomeAndExpenseStatemeBs> dataHistList(Page page) throws Exception {
        return (List<EntIncomeAndExpenseStatemeBs>) dao.findForList("EntIncomeAndExpenseStatemeBsSeoMapper.dataHistlistPage", page);
    }
    /**
   	 * 更新状态到10
   	 * 
   	 * @param pd
   	 * @return
   	 * @throws Exception
   	 */
	@Override
	public void updateStatus(Map<String, Object> map) throws Exception {
		dao.update("EntIncomeAndExpenseStatemeBsSeoMapper.updateStatus", map);		
	}
	/**
   	 * 更新状态到20
   	 * 
   	 * @param pd
   	 * @return
   	 * @throws Exception
   	 */
	@Override
	public void backdate(Map<String, Object> map) throws Exception {
		dao.update("EntIncomeAndExpenseStatemeBsSeoMapper.backdate", map);		
	}


	/**
	 * 事业单位资产负债 基本信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getAcctInfSgmtById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("EntIncomeAndExpenseStatemeBsSeoMapper.getAcctInfSgmtById", pd);
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
				"EntIncomeAndExpenseStatemeBsSeoMapper.getRepymtInfSgmtById", pd);
	}
}
