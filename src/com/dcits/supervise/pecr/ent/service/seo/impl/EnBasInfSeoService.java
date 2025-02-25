package com.dcits.supervise.pecr.ent.service.seo.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.ent.entity.EnBasInf;
import com.dcits.supervise.pecr.ent.entity.EntActuCotrlInfSgmt;
import com.dcits.supervise.pecr.ent.entity.EntIdSgmt;
import com.dcits.supervise.pecr.ent.entity.EntMnMmbInfSgmt;
import com.dcits.supervise.pecr.ent.entity.EntMnShaHodInfSgmt;
import com.dcits.supervise.pecr.ent.service.seo.EnBasInfSeoManager;
import com.dcits.supervise.pecr.indv.entity.PecrIndvBsSgmt;
import com.dcits.supervise.pecr.indv.service.seo.InCtrctInfSeoManager;

@Service
public class EnBasInfSeoService implements EnBasInfSeoManager{

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
        return (List<PageData>) dao.findForList("EnBasInfSeoManager.datalistPage", page);
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
    public List<EnBasInf> dataHistList(Page page) throws Exception {
        return (List<EnBasInf>) dao.findForList("EnBasInfSeoManager.dataHistlistPage", page);
    }
    /**
   	 * 更新状态到10
   	 * 
   	 * @param pd
   	 * @return
   	 * @throws Exception
   	 */
	@Override
	public void updateStatus(Map<String, Object> map) throws Exception {
		dao.update("EnBasInfSeoManager.updateStatus", map);		
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
		dao.update("EnBasInfSeoManager.backdate", map);		
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
		dao.delete("EnBasInfSeoManager.deletedate", map);
	}
	/**
     * 企业基本 基础段信息
     */
    @Override
    public PageData getEntBsSgmtData(PageData pd) throws Exception {
        return (PageData) dao.findForObject("EnBasInfSeoManager.getEntBsSgmtData", pd);
    }

    /**
	 * 企业基本信息 其他标识信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<EntIdSgmt> getentIdSgmtById(PageData pd) throws Exception {
		return (List<EntIdSgmt>) dao.findForList(
				"EnBasInfSeoManager.getentIdSgmtById", pd);
	}
	/**
	 * 企业基本信息 基本概况信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getentFcsInfSgmtById(PageData pd) throws Exception {
		return (PageData) dao.findForObject(
				"EnBasInfSeoManager.getentFcsInfSgmtById", pd);
	}
	/**
	 * 企业基本信息 主要组成人员段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<EntMnMmbInfSgmt> getentMnMmbInfSgmtById(PageData pd) throws Exception {
		return (List<EntMnMmbInfSgmt>) dao.findForList(
				"EnBasInfSeoManager.getentMnMmbInfSgmtById", pd);
	}
	/**
	 * 企业基本信息 注册资本及主要出资人段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<EntMnShaHodInfSgmt> getentMnShaHodInfSgmtById(PageData pd) throws Exception {
		return (List<EntMnShaHodInfSgmt>) dao.findForList(
				"EnBasInfSeoManager.getentMnShaHodInfSgmtById", pd);
	}
	/**
	 * 企业基本信息 实际控制人段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<EntActuCotrlInfSgmt> getentActuCotrlInfSgmtById(PageData pd) throws Exception {
		return (List<EntActuCotrlInfSgmt>) dao.findForList(
				"EnBasInfSeoManager.getentActuCotrlInfSgmtById", pd);
	}
	/**
	 * 企业基本信息 上级机构段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getentSpvsgAthrtyInfSgmtById(PageData pd) throws Exception {
		return (PageData) dao.findForObject(
				"EnBasInfSeoManager.getentSpvsgAthrtyInfSgmtById", pd);
	}
	/**
	 * 企业基本信息 联系方式段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getentCotaInfSgmtById(PageData pd) throws Exception {
		return (PageData) dao.findForObject(
				"EnBasInfSeoManager.getentCotaInfSgmtById", pd);
	}
}
