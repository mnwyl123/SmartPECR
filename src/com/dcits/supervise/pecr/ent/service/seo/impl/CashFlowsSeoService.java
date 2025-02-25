package com.dcits.supervise.pecr.ent.service.seo.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.ent.entity.CashFlows;
import com.dcits.supervise.pecr.ent.service.seo.CashFlowsSeoManager;

@Service("cashFlowsSeoService")
public class CashFlowsSeoService implements CashFlowsSeoManager{

	
	@Resource(name = "daoSupportPecr")
    private DaoSupportPecr dao;
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
        return (List<PageData>) dao.findForList("CashFlowsSeoMapper.datalistPage", page);
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
    public List<CashFlows> dataHistList(Page page) throws Exception {
        return (List<CashFlows>) dao.findForList("CashFlowsSeoMapper.dataHistlistPage", page);
    }
    /**
   	 * 更新状态到11
   	 * 
   	 * @param pd
   	 * @return
   	 * @throws Exception
   	 */
	@Override
	public void updateStatus(Map<String, Object> map) throws Exception {
		dao.update("CashFlowsSeoMapper.updateStatus", map);		
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
		dao.update("CashFlowsSeoMapper.backdate", map);		
	}
	/**
   	 * 删除报文数据信息
   	 * 
   	 * @param pd
   	 * @return
   	 * @throws Exception
   	 */
	@Override
	public void deletedate(Map<String, Object> map) throws Exception {
		dao.delete("CashFlowsSeoMapper.deletedate", map);
	}

	@Override
	public PageData getCashFlows2002SgmtById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("CashFlowsSeoMapper.getCashFlows2002SgmtById", pd);
	}

	@Override
	public PageData getCashFlows2007SgmtById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("CashFlowsSeoMapper.getCashFlows2007SgmtById", pd);
	}

	@SuppressWarnings("unchecked")
	@Override
	public Map<String, Object> getCashFlowsBsSgmtById(PageData pd) throws Exception {
		return (Map<String, Object>) dao.findForObject("CashFlowsSeoMapper.getCashFlowsBsSgmtById", pd);
	}

}
