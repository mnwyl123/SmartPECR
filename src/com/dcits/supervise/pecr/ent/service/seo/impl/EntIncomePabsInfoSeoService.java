package com.dcits.supervise.pecr.ent.service.seo.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.ent.entity.EntIncomeStatement;
import com.dcits.supervise.pecr.ent.service.seo.EntIncomePabsInfoSeoManager;

@Service("entIncomePabsInfoSeoService")
public class EntIncomePabsInfoSeoService  implements EntIncomePabsInfoSeoManager {
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
        return (List<PageData>) dao.findForList("EntIncomeInfoSeoManager.datalistPage", page);
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
    public List<EntIncomeStatement> dataHistList(Page page) throws Exception {
        return (List<EntIncomeStatement>) dao.findForList("EntIncomeInfoSeoManager.dataHistlistPage", page);
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
		dao.update("EntIncomeInfoSeoManager.updateStatus", map);		
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
		dao.update("EntIncomeInfoSeoManager.backdate", map);		
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
		dao.delete("EntIncomeInfoSeoManager.deletedate", map);
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
		return (Map<String, Object>) dao.findForObject("EntIncomeInfoSeoManager.getIncomeStatementById", pd);
	}
	
	/**
	 * 企业利润及利润分配表  02企业利润及利润分配表段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getIncomeStatement02ById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("EntIncomeInfoSeoManager.getIncomeStatement02ById", pd);
	}
	
	/**
	 * 企业利润及利润分配表  07企业利润及利润分配表段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getIncomeStatement07ById(PageData pd) throws Exception{
		return (PageData) dao.findForObject("EntIncomeInfoSeoManager.getIncomeStatement07ById", pd);
	}
}
