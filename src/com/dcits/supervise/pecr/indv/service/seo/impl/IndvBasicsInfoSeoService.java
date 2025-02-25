package com.dcits.supervise.pecr.indv.service.seo.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.indv.entity.PecrIndvBsSgmt;
import com.dcits.supervise.pecr.indv.entity.PecrIndvIdSgmt;
import com.dcits.supervise.pecr.indv.service.seo.IndvBasicsInfoSeoManager;
@Service
public class IndvBasicsInfoSeoService implements IndvBasicsInfoSeoManager{
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
        return (List<PageData>) dao.findForList("IndvBasicsInfoSeoMapper.dataBsSgmtlistPage", page);
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
        return (List<PecrIndvBsSgmt>) dao.findForList("IndvBasicsInfoSeoMapper.dataBsSgmtHistlistPage", page);
    }
    /**
	 * 查询 历史表其他标识段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
    @SuppressWarnings("unchecked")
	@Override
	public List<PecrIndvIdSgmt> getPecrIndvIdSgmtById(Page pd) throws Exception {
		return (List<PecrIndvIdSgmt>) dao.findForList("IndvBasicsInfoSeoMapper.getPecrIndvIdSgmtByIdlistPage", pd);
	}
    /**
	 * 查询 历史表基础段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
    @Override
	public PageData getPcBasBsSgmtById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("IndvBasicsInfoSeoMapper.getPcBasBsSgmtById", pd);
	}
    /**
	 * 查询 历史表基本概况信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
    @Override
	public PageData getPcBasFcsInfSgmtById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("IndvBasicsInfoSeoMapper.getPcBasFcsInfSgmtById", pd);
	}
    /**
	 * 查询 历史表婚姻信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	public PageData getPcBasSpsInfSgmtById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("IndvBasicsInfoSeoMapper.getPcBasSpsInfSgmtById", pd);
	}
	/**
	 * 查询 历史表教育信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	public PageData getPcBasEduInfSgmtById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("IndvBasicsInfoSeoMapper.getPcBasEduInfSgmtById", pd);
	}
	/**
	 * 查询 历史表职业信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	public PageData getPcBasOctpnInfSgmtById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("IndvBasicsInfoSeoMapper.getPcBasOctpnInfSgmtById", pd);
	}
	/**
	 * 查询 历史表居住地址段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	public PageData getPcBasRedncInfSgmtById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("IndvBasicsInfoSeoMapper.getPcBasRedncInfSgmtById", pd);
	}
	/**
	 * 查询 历史表通讯地址段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	public PageData getPcBasMlgInfSgmtById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("IndvBasicsInfoSeoMapper.getPcBasMlgInfSgmtById", pd);
	}
	/**
	 * 查询 历史表收入信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	public PageData getPcBasIncInfSgmtById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("IndvBasicsInfoSeoMapper.getPcBasIncInfSgmtById", pd);
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
		dao.update("IndvBasicsInfoSeoMapper.updateStatus", map);		
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
		dao.update("IndvBasicsInfoSeoMapper.backdate", map);		
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
		dao.delete("IndvBasicsInfoSeoMapper.deletedate", map);
	}
}
