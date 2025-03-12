package com.dcits.supervise.pecr.ent.service.seo.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.ent.entity.BalanceSheetDlt;
import com.dcits.supervise.pecr.ent.service.seo.entFinStaSeoManager;

/**
 * 企业财务报
 * @author 穆楠  
 * 
 *
 */
@Service("entFinStaSeoService")
public class entFinStaSeoService implements entFinStaSeoManager	 {
	
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
        return (List<PageData>) dao.findForList("BalanceSheetDltSeoMapper.datalistPage", page);
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
    public List<BalanceSheetDlt> dataHistList(Page page) throws Exception {
        return (List<BalanceSheetDlt>) dao.findForList("BalanceSheetDltSeoMapper.dataHistlistPage", page);
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
		dao.delete("BalanceSheetDltSeoMapper.deletedate", map);
	}
	@Override
	public void updateStatusBalance(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		dao.update("BalanceSheetDltSeoMapper.updateStatusBalance", map);
	}
	@Override
	public void updateStatusCash(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		dao.update("BalanceSheetDltSeoMapper.updateStatusCash", map);
	}
	@Override
	public void updateStatusIncome(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		dao.update("BalanceSheetDltSeoMapper.updateStatusIncome", map);
	}
	@Override
	public void updateStatusPabs(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		dao.update("BalanceSheetDltSeoMapper.updateStatusPabs", map);
	}
	@Override
	public void updateStatusInstitution(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		dao.update("BalanceSheetDltSeoMapper.updateStatusInstitution", map);
	}
	@Override
	public void backdateBalance(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		dao.update("BalanceSheetDltSeoMapper.backdateBalance", map);
	}
	@Override
	public void backdateCash(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		dao.update("BalanceSheetDltSeoMapper.backdateCash", map);
	}
	@Override
	public void backdateIncome(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		dao.update("BalanceSheetDltSeoMapper.backdateIncome", map);
	}
	@Override
	public void backdatePabs(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		dao.update("BalanceSheetDltSeoMapper.backdatePabs", map);
	}
	@Override
	public void backdateInstitution(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		dao.update("BalanceSheetDltSeoMapper.backdateInstitution", map);
	}
	@Override
	public PageData getBalanceById(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return (PageData) dao.findForObject("BalanceSheetDltMapper.getBalanceById", pd);
	}
	@Override
	public PageData getCashById(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return (PageData) dao.findForObject("BalanceSheetDltMapper.getCashById", pd);
	}
	@Override
	public PageData getIncomeById(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return (PageData) dao.findForObject("BalanceSheetDltMapper.getIncomeById", pd);
	}
	@Override
	public PageData getPabsById(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return (PageData) dao.findForObject("BalanceSheetDltMapper.getPabsById", pd);
	}
	@Override
	public PageData getInstitutionById(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return (PageData) dao.findForObject("BalanceSheetDltMapper.getInstitutionById", pd);
	}


}
