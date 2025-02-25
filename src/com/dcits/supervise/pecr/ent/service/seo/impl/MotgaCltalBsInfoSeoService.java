package com.dcits.supervise.pecr.ent.service.seo.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.ent.service.seo.MotgaCltalBsInfoSeoManager;
import com.dcits.supervise.pecr.indv.entity.PecrIndvBsSgmt;

@Service
public class MotgaCltalBsInfoSeoService implements MotgaCltalBsInfoSeoManager{
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
        return (List<PageData>) dao.findForList("MotgaCltalBsInfoSeoMapper.datalistPage", page);
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
        return (List<PecrIndvBsSgmt>) dao.findForList("MotgaCltalBsInfoSeoMapper.dataHistlistPage", page);
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
		dao.update("MotgaCltalBsInfoSeoMapper.updateStatus", map);		
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
		dao.update("MotgaCltalBsInfoSeoMapper.backdate", map);		
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
		dao.delete("MotgaCltalBsInfoSeoMapper.deletedate", map);
	}
	/**
	 * 抵（质）押合同信息 基础段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> getMotgaCltalBsSgmtById(PageData pd) throws Exception {
		return (Map<String, Object>) dao.findForObject("MotgaCltalBsInfoSeoMapper.getMotgaCltalBsSgmtById", pd);
	}
	
	/**
	 * 抵（质）押合同信息 基本信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getMotgaCltalInfById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("MotgaCltalBsInfoSeoMapper.getMotgaCltalInfById", pd);
	}
	/**
	 * 抵（质）押合同信息 其他债务人信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> getComRecInfSgmtById(Page page) throws Exception {
		return (List<PageData>) dao.findForList("MotgaCltalBsInfoSeoMapper.getComRecInfSgmtByIdlistPage", page);
	}
	/**
	 * 抵（质）押合同信息 抵押物信息段 
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> getMotgaProptInfListById(Page page) throws Exception {
		return (List<PageData>) dao.findForList("MotgaCltalBsInfoSeoMapper.getMotgaProptInfByIdlistPage", page);
	}
	/**
	 * 抵（质）押合同信息 质物信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> getCltalInfListById(Page page) throws Exception {
		return (List<PageData>) dao.findForList(
				"MotgaCltalBsInfoSeoMapper.getCltalInfByIdlistPage", page);
	}
}
