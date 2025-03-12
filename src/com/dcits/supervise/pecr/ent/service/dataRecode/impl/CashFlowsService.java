package com.dcits.supervise.pecr.ent.service.dataRecode.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.ent.entity.CashFlows;
import com.dcits.supervise.pecr.ent.service.dataRecode.CashFlowsManager;

/**
 * 企业现金流量
 * @author 穆楠
 *
 */
@Service("cashFlowsService")
public class CashFlowsService implements CashFlowsManager{

	@Resource(name = "daoSupportPecr")
	private DaoSupportPecr dao;

	/**
	 * 担保基础段   列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<CashFlows> getcashFlowsList(Page page)
			throws Exception {
		return (List<CashFlows>) dao.findForList("CashFlowsMapper.getcashFlowsList", page);
	}
	
	/**
	 *  基础段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> getCashFlowsBsSgmtById(PageData pd) throws Exception {
		return (Map<String, Object>) dao.findForObject("CashFlowsMapper.getCashFlowsBsSgmtById", pd);
	}
	
	/**
	 * 企业现金流量表02现金流量表段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getCashFlows2002SgmtById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("CashFlowsMapper.getCashFlows2002SgmtById", pd);
	}
	
	/**
	 * 企业现金流量表07现金流量表段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getCashFlows2007SgmtById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("CashFlowsMapper.getCashFlows2007SgmtById", pd);
	}
	
	/**
	 * 查询 基础段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getCashFlowsBsSgmtKey(Map<String, Object> map) throws Exception{
		return (int) dao.findForObject("CashFlowsMapper.getCashFlowsBsSgmtKey", map);
	}

	/**
	 * 新增   基础段
	 * @param pd
	 * @throws Exception
	 */
	public void insertCashFlowsBsSgmt(Map<String, Object> map) throws Exception{
		dao.save("CashFlowsMapper.insertCashFlowsBsSgmt", map);
	}
	
	/**
	 * 修改   基础段
	 * @param pd
	 * @throws Exception
	 */
	public void updateCashFlowsBsSgmt(Map<String, Object> map) throws Exception{
		dao.update("CashFlowsMapper.updateCashFlowsBsSgmt", map);
	}
	
	/**
	 * 删除   基础段  (同时会删除其他段)
	 * @param map
	 * @throws Exception
	 */
	public void delCashFlowsBsSgmtById(Map<String, Object> map) throws Exception{
		//基础段
		dao.delete("CashFlowsMapper.delCashFlowsBsSgmtById", map);
		//基本信息段
		dao.delete("CashFlowsMapper.del2002SgmtById", map);
		//相关还款责任人
		dao.delete("CashFlowsMapper.del2007SgmtById", map);
	}
	
	/**
	 * 查询 企业现金流量表02现金流量表段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int get2002SgmtKey(Map<String, Object> map) throws Exception{
		return (int) dao.findForObject("CashFlowsMapper.get2002SgmtKey", map);
	}

	/**
	 * 新增  企业现金流量表02现金流量表段
	 * @param pd
	 * @throws Exception
	 */
	public void insert2002Sgmt(Map<String, Object> map) throws Exception{
		dao.save("CashFlowsMapper.insert2002Sgmt", map);
	}
	
	/**
	 * 修改   企业现金流量表02现金流量表段
	 * @param pd
	 * @throws Exception
	 */
	public void update2002Sgmt(Map<String, Object> map) throws Exception{
		dao.update("CashFlowsMapper.update2002Sgmt", map);
	}
	
	/**
	 * 删除   企业现金流量表02现金流量表段  (同时会删除其他段)
	 * @param map
	 * @throws Exception
	 */
	public void del2002SgmtById(Map<String, Object> map) throws Exception{
		dao.delete("CashFlowsMapper.del2002SgmtById", map);
	}
	
	/**
	 * 查询 企业现金流量表07现金流量表段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int get2007SgmtKey(Map<String, Object> map) throws Exception{
		return (int) dao.findForObject("CashFlowsMapper.get2007SgmtKey", map);
	}

	/**
	 * 新增  企业现金流量表07现金流量表段
	 * @param pd
	 * @throws Exception
	 */
	public void insert2007Sgmt(Map<String, Object> map) throws Exception{
		dao.save("CashFlowsMapper.insert2007Sgmt", map);
	}
	
	/**
	 * 修改   企业现金流量表02现金流量表段
	 * @param pd
	 * @throws Exception
	 */
	public void update2007Sgmt(Map<String, Object> map) throws Exception{
		dao.update("CashFlowsMapper.update2007Sgmt", map);
	}
	
	/**
	 * 删除   企业现金流量表02现金流量表段  (同时会删除其他段)
	 * @param map
	 * @throws Exception
	 */
	public void del2007SgmtById(Map<String, Object> map) throws Exception{
		dao.delete("CashFlowsMapper.del2007SgmtById", map);
	}
}
