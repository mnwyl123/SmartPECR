package com.dcits.supervise.pecr.ent.service.seo.impl;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.ent.entity.EntBalanceSheetBsSgmt;
import com.dcits.supervise.pecr.ent.service.dataRecode.EntBalanceSheetInfoManager;
import com.dcits.supervise.pecr.ent.service.seo.EntBalanceSheetInfoSeoManager;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;

import java.util.List;
import java.util.Map;

/**
 * 企业财务报表   企业资产负债表
 * @author leizx
 *
 */
@Service("entBalanceSheetInfoSeoService")
public  class EntBalanceSheetInfoSeoService implements EntBalanceSheetInfoSeoManager {
	
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
        return (List<PageData>) dao.findForList("EntBalanceSheetInfoSeoManager.datalistPage", page);
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
    public List<EntBalanceSheetBsSgmt> dataHistList(Page page) throws Exception {
        return (List<EntBalanceSheetBsSgmt>) dao.findForList("EntBalanceSheetInfoSeoManager.dataHistlistPage", page);
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
		dao.update("EntBalanceSheetInfoSeoManager.updateStatus", map);		
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
		dao.update("EntBalanceSheetInfoSeoManager.backdate", map);		
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
		dao.delete("EntBalanceSheetInfoSeoManager.deletedate", map);
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
		return (Map<String, Object>) dao.findForObject("EntBalanceSheetInfoSeoManager.getBalanceBsSgmtById", pd);
	}
	
	/**
	 * 企业资产负债表  02企业资产负债表段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getBalanceSheet2002ById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("EntBalanceSheetInfoSeoManager.getBalanceSheet2002ById", pd);
	}
	
	/**
	 * 企业资产负债表  07企业资产负债表段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getBalanceSheet2007ById(PageData pd) throws Exception{
		return (PageData) dao.findForObject("EntBalanceSheetInfoSeoManager.getBalanceSheet2007ById", pd);
	}
	
	



	
}
