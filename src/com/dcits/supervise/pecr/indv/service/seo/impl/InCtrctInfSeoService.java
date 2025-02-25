package com.dcits.supervise.pecr.indv.service.seo.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.indv.entity.PecrIndvBsSgmt;
import com.dcits.supervise.pecr.indv.service.seo.InCtrctInfSeoManager;

@Service
public class InCtrctInfSeoService implements InCtrctInfSeoManager{

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
        return (List<PageData>) dao.findForList("InCtrctInfSeoMapper.datalistPage", page);
    }
    
    @SuppressWarnings("unchecked")
   	@Override
       public List<PageData> dataListForUpdate(Page page) throws Exception {
           return (List<PageData>) dao.findForList("InCtrctInfSeoMapper.changelistPage", page);
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
        return (List<PecrIndvBsSgmt>) dao.findForList("InCtrctInfSeoMapper.dataHistlistPage", page);
    }
    
    @SuppressWarnings("unchecked")
   	@Override
       public List<PecrIndvBsSgmt> dataHistListForUpdate(Page page) throws Exception {
           return (List<PecrIndvBsSgmt>) dao.findForList("InCtrctInfSeoMapper.changeHistlistPage", page);
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
		dao.update("InCtrctInfSeoMapper.updateStatus", map);		
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
		dao.update("InCtrctInfSeoMapper.backdate", map);		
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
		dao.delete("InCtrctInfSeoMapper.deletedate", map);
	}
	/**
     * 个人授信协议信息记录 基础段信息
     */
    @Override
    public PageData getCtrctBsSgmtData(PageData pd) throws Exception {
        return (PageData) dao.findForObject("InCtrctInfSeoMapper.getCtrctBsSgmtData", pd);
    }

    /**
     * 个人授信协议信息记录 共同受信人信息段
     */
    @SuppressWarnings("unchecked")
	@Override
    public List<PageData> getCertRelSgmtList(Page page) throws Exception {
        return (List<PageData>) dao.findForList("InCtrctInfSeoMapper.getCertRelSgmtlistpage", page);
    }

    /**
     * 个人授信协议信息记录  额度信息段
     */
    @Override
    public PageData getCreditLimSgmtData(PageData pd) throws Exception {
        return (PageData) dao.findForObject("InCtrctInfSeoMapper.getCreditLimSgmtData", pd);
    }
}
