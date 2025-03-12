package com.dcits.supervise.pecr.ent.service.seo.impl;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.ent.entity.EntInstitutionBalance;
import com.dcits.supervise.pecr.ent.service.seo.EntInstitutionBalanceSeoManager;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;

import java.util.List;
import java.util.Map;

/**
 * 企业财务报表   事业单位资产负债表
 * @author 穆楠
 *
 */
@Service("entInstitutionBalanceSeoService")
public class EntInstitutionBalanceSeoService implements EntInstitutionBalanceSeoManager {
	
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
		return (List<EntInstitutionBalance>) dao.findForList("EntInstitutionBalanceSeoManager.insBalanceSheetBslistPage", page);
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
		return (Map<String, Object>) dao.findForObject("EntInstitutionBalanceSeoManager.getInstitutionInfoById", pd);
	}
	
	/**
	 * 事业单位资产负债表段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getInstitutionSheetById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("EntInstitutionBalanceSeoManager.getInstitutionSheetById", pd);
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
        return (List<PageData>) dao.findForList("EntInstitutionBalanceSeoManager.datalistPage", page);
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
    public List<EntInstitutionBalance> dataHistList(Page page) throws Exception {
        return (List<EntInstitutionBalance>) dao.findForList("EntInstitutionBalanceSeoManager.dataHistlistPage", page);
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
		dao.update("EntInstitutionBalanceSeoManager.updateStatus", map);		
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
		dao.update("EntInstitutionBalanceSeoManager.backdate", map);		
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
		dao.delete("EntInstitutionBalanceSeoManager.deletedate", map);
	}

}
