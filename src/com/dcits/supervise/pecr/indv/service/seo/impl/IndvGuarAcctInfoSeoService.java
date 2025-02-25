package com.dcits.supervise.pecr.indv.service.seo.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.indv.entity.GuarRltRepymtInfSgmt;
import com.dcits.supervise.pecr.indv.entity.PecrIndvBsSgmt;
import com.dcits.supervise.pecr.indv.service.seo.IndvGuarAcctInfoSeoManager;

@Service
public class IndvGuarAcctInfoSeoService implements IndvGuarAcctInfoSeoManager{

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
        return (List<PageData>) dao.findForList("IndvGuarAcctInfoSeoMapper.datalistPage", page);
    }
    
    @SuppressWarnings("unchecked")
	@Override
    public List<PageData> dataListForUpdate(Page page) throws Exception {
        return (List<PageData>) dao.findForList("IndvGuarAcctInfoSeoMapper.changelistPage", page);
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
        return (List<PecrIndvBsSgmt>) dao.findForList("IndvGuarAcctInfoSeoMapper.dataHistlistPage", page);
    }
    
    @SuppressWarnings("unchecked")
   	@Override
       public List<PecrIndvBsSgmt> dataHistListForUpdate(Page page) throws Exception {
           return (List<PecrIndvBsSgmt>) dao.findForList("IndvGuarAcctInfoSeoMapper.changeHistlistPage", page);
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
		dao.update("IndvGuarAcctInfoSeoMapper.updateStatus", map);		
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
		dao.update("IndvGuarAcctInfoSeoMapper.backdate", map);		
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
		dao.delete("IndvGuarAcctInfoSeoMapper.deletedate", map);
	}

	/**
	 * 个人担保账户 基础段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> getAcctBsSgmtById(PageData pd) throws Exception {
		return (Map<String, Object>) dao.findForObject("IndvGuarAcctInfoSeoMapper.getAcctBsSgmtById", pd);
	}

	/**
	 * 个人担保账户 基本信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getAcctInfSgmtById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("IndvGuarAcctInfoSeoMapper.getAcctInfSgmtById", pd);
	}
	
	/**
	 * 个人担保账户 在保责任信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getRepymtInfSgmtById(PageData pd) throws Exception {
		return (PageData) dao.findForObject(
				"IndvGuarAcctInfoSeoMapper.getRepymtInfSgmtById", pd);
	}

	/**
	 * 个人担保账户 相关还款责任人段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<GuarRltRepymtInfSgmt> getRltInfList(Page page) throws Exception {
		return (List<GuarRltRepymtInfSgmt>) dao.findForList("IndvGuarAcctInfoSeoMapper.getRltInflistPage", page);
	}

	/**
	 * 个人担保账户 抵质押物信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> getMccInfList(Page page) throws Exception {
		return (List<PageData>) dao.findForList("IndvGuarAcctInfoSeoMapper.getMccInflistPage", page);
	}
}
