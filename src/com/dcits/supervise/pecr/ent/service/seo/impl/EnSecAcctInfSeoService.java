package com.dcits.supervise.pecr.ent.service.seo.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.ent.service.seo.EnSecAcctInfSeoManager;
import com.dcits.supervise.pecr.indv.entity.PecrIndvBsSgmt;

@Service
public class EnSecAcctInfSeoService implements EnSecAcctInfSeoManager{
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
        return (List<PageData>) dao.findForList("EnSecAcctInfSeoMapper.datalistPage", page);
    }
    @SuppressWarnings("unchecked")
   	@Override
       public List<PageData> dataListForUpdate(Page page) throws Exception {
           return (List<PageData>) dao.findForList("EnSecAcctInfSeoMapper.changelistPage", page);
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
    public List<PecrIndvBsSgmt> dataHistList(Page page) throws Exception {
        return (List<PecrIndvBsSgmt>) dao.findForList("EnSecAcctInfSeoMapper.dataHistlistPage", page);
    }
    @SuppressWarnings("unchecked")
	@Override
    public List<PecrIndvBsSgmt> dataHistListForUpdate(Page page) throws Exception {
        return (List<PecrIndvBsSgmt>) dao.findForList("EnSecAcctInfSeoMapper.changeHistlistPage", page);
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
		dao.update("EnSecAcctInfSeoMapper.updateStatus", map);		
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
		dao.update("EnSecAcctInfSeoMapper.backdate", map);		
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
		dao.delete("EnSecAcctInfSeoMapper.deletedate", map);
	}
	/**
	 * 担保账户 基础段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> getenSecAcctInfById(PageData pd) throws Exception {
		return (Map<String, Object>) dao.findForObject("EnSecAcctInfSeoMapper.getenSecAcctInfById", pd);
	}

	/**
	 * 担保账户 基本信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getGuarAcctBsInfSgmtById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("EnSecAcctInfSeoMapper.getGuarAcctBsInfSgmtById", pd);
	}
	
	/**
	 * 担保账户 账户信息授信额度信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getacctCredSgmtById(PageData pd) throws Exception {
		return (PageData) dao.findForObject(
				"EnSecAcctInfSeoMapper.getacctCredSgmtById", pd);
	}
	
	/**
	 * 担保账户 在保责任信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getRepymtInfSgmtById(PageData pd) throws Exception {
		return (PageData) dao.findForObject(
				"EnSecAcctInfSeoMapper.getRepymtInfSgmtById", pd);
	}

	/**
	 * 担保账户 相关还款责任人段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> getRltInfList(Page page) throws Exception {
		return (List<PageData>) dao.findForList("EnSecAcctInfSeoMapper.getRltInflistPage", page);
	}

	/**
	 * 担保账户 抵质押物信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> getMccInfList(Page page) throws Exception {
		return (List<PageData>) dao.findForList("EnSecAcctInfSeoMapper.getMccInflistPage", page);
	}
}
