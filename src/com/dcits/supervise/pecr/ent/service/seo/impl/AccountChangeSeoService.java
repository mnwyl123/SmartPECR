package com.dcits.supervise.pecr.ent.service.seo.impl;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.ent.service.seo.EntAccountChangeSeoManager;
import com.dcits.supervise.pecr.indv.entity.Accountchange;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
@Service
public class AccountChangeSeoService implements EntAccountChangeSeoManager {

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
        return (List<PageData>) dao.findForList("EntAccountchangeSeoMapper.datalistPage", page);
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
    public List<Accountchange> dataHistList(Page page) throws Exception {
        return (List<Accountchange>) dao.findForList("EntAccountchangeSeoMapper.dataHistlistPage", page);
    }
    /**
   	 * 更新状态到11
   	 * 
   	 * @param pd
   	 * @return
   	 * @throws Exception
   	 */
	@Override
	public void updateStatusGuar(Map<String, Object> map) throws Exception {
		dao.update("EntAccountchangeSeoMapper.updateStatusSec", map);		
	}
	 /**
   	 * 更新状态到11
   	 * 
   	 * @param pd
   	 * @return
   	 * @throws Exception
   	 */
	@Override
	public void updateStatusPro(Map<String, Object> map) throws Exception {
		dao.update("EntAccountchangeSeoMapper.updateStatusCr", map);		
	}
	 /**
   	 * 更新状态到11
   	 * 
   	 * @param pd
   	 * @return
   	 * @throws Exception
   	 */
	@Override
	public void updateStatusLoan(Map<String, Object> map) throws Exception {
		dao.update("EntAccountchangeSeoMapper.updateStatusEn", map);		
	}
	/**
   	 * 更新状态到20
   	 * 
   	 * @param pd
   	 * @return
   	 * @throws Exception
   	 */
	@Override
	public void backdateGuar(Map<String, Object> map) throws Exception {
		dao.update("EntAccountchangeSeoMapper.backdateGuar", map);		
	}
	/**
   	 * 更新状态到20
   	 * 
   	 * @param pd
   	 * @return
   	 * @throws Exception
   	 */
	@Override
	public void backdatePro(Map<String, Object> map) throws Exception {
		dao.update("EntAccountchangeSeoMapper.backdatePro", map);		
	}
	/**
   	 * 更新状态到20
   	 * 
   	 * @param pd
   	 * @return
   	 * @throws Exception
   	 */
	@Override
	public void backdateLoan(Map<String, Object> map) throws Exception {
		dao.update("EntAccountchangeSeoMapper.backdateLoan", map);		
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
		dao.delete("EntAccountchangeSeoMapper.deletedate", map);
	}
}
