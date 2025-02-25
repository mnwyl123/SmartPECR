package com.dcits.supervise.pecr.ent.service.seo.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.ent.service.seo.EntDelaccountDataSeoManager;
import com.dcits.supervise.pecr.indv.entity.inDel;
@Service("EntDelAccountDataSeoService")
public class DelaccountDataSeoService implements EntDelaccountDataSeoManager{
	@Resource(name="daoSupportPecr")
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
        return (List<PageData>) dao.findForList("EntDelaccountDataSeoMapper.datalistPage", page);
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
    public List<inDel> dataHistList(Page page) throws Exception {
        return (List<inDel>) dao.findForList("EntDelaccountDataSeoMapper.dataHistlistPage", page);
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
		dao.delete("EntDelaccountDataSeoMapper.deletedate", map);
	}
	@Override
	public void updateStatusPro(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		dao.update("EntDelaccountDataSeoMapper.updateStatusPro", map);	
	}
	@Override
	public void updateStatusGuar(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		dao.update("EntDelaccountDataSeoMapper.updateStatusGuar", map);	
	}
	@Override
	public void updateStatusLoan(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		dao.update("EntDelaccountDataSeoMapper.updateStatusLoan", map);	
	}
	@Override
	public void updateStatusProEnt(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		dao.update("EntDelaccountDataSeoMapper.updateStatusProEnt", map);	
	}
	@Override
	public void updateStatusGuarEnt(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		dao.update("EntDelaccountDataSeoMapper.updateStatusGuarEnt", map);	
	}
	@Override
	public void updateStatusLoanEnt(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		dao.update("EntDelaccountDataSeoMapper.updateStatusLoanEnt", map);	
	}
	@Override
	public void backdatePro(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		dao.update("EntDelaccountDataSeoMapper.backdatePro", map);	
	}
	@Override
	public void backdateGuar(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		dao.update("EntDelaccountDataSeoMapper.backdateGuar", map);	
	}
	@Override
	public void backdateLoan(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		dao.update("EntDelaccountDataSeoMapper.backdateLoan", map);	
	}
	@Override
	public void backdateProEnt(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		dao.update("EntDelaccountDataSeoMapper.backdateProEnt", map);	
	}
	@Override
	public void backdateGuarEnt(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		dao.update("EntDelaccountDataSeoMapper.backdateGuarEnt", map);	
	}
	@Override
	public void backdateLoanEnt(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		dao.update("EntDelaccountDataSeoMapper.backdateLoanEnt", map);	
	}


	}

