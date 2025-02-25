package com.dcits.supervise.pecr.ent.service.seo.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.ent.service.seo.EnCtrctInfoSeoManager;
import com.dcits.supervise.pecr.indv.entity.PecrIndvBsSgmt;
@Service
public class EnCtrctInfoSeoService implements EnCtrctInfoSeoManager{
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
        return (List<PageData>) dao.findForList("EnCtrctInfoSeoMapper.datalistPage", page);
    }
    @SuppressWarnings("unchecked")
   	@Override
       public List<PageData> dataListForUpdate(Page page) throws Exception {
           return (List<PageData>) dao.findForList("EnCtrctInfoSeoMapper.changelistPage", page);
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
        return (List<PecrIndvBsSgmt>) dao.findForList("EnCtrctInfoSeoMapper.dataHistlistPage", page);
    }
    
    @SuppressWarnings("unchecked")
 	@Override
     public List<PecrIndvBsSgmt> dataHistListForUpdate(Page page) throws Exception {
         return (List<PecrIndvBsSgmt>) dao.findForList("EnCtrctInfoSeoMapper.changeHistlistPage", page);
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
		dao.update("EnCtrctInfoSeoMapper.updateStatus", map);		
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
		dao.update("EnCtrctInfoSeoMapper.backdate", map);	
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
		dao.delete("EnCtrctInfoSeoMapper.deletedate", map);
	}


    @Override
    public Map<String, Object> getCtrctBsSgmtById(PageData pd) throws Exception {
        return (Map<String, Object>) dao.findForObject("EnCtrctInfoSeoMapper.getCtrctBsSgmtById", pd);
    }

    @Override
    public PageData getCreditLimSgmtById(PageData pd) throws Exception {
        return (PageData) dao.findForObject("EnCtrctInfoSeoMapper.getCreditLimSgmtById", pd);
    }
    /**
     * 查询   共同授信人信息段
     * @param page
     * @throws Exception
     */
    @Override
    public List<PageData> getRltInfList(Page page) throws Exception {
        return (List<PageData>)dao.findForList("EnCtrctInfoSeoMapper.getRltInfolistPage", page);
    }
}
