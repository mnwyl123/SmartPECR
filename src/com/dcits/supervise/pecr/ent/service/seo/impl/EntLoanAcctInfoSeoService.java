package com.dcits.supervise.pecr.ent.service.seo.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.ent.entity.EntRltRepymtSgmt;
import com.dcits.supervise.pecr.ent.service.seo.EntLoanAcctInfoSeoManager;
import com.dcits.supervise.pecr.indv.entity.PecrIndvBsSgmt;

@Service
public class EntLoanAcctInfoSeoService implements EntLoanAcctInfoSeoManager{
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
        return (List<PageData>) dao.findForList("EntLoanAcctInfoSeoMapper.datalistPage", page);
    }
    @SuppressWarnings("unchecked")
   	@Override
       public List<PageData> dataListForUpdate(Page page) throws Exception {
           return (List<PageData>) dao.findForList("EntLoanAcctInfoSeoMapper.changelistPage", page);
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
        return (List<PecrIndvBsSgmt>) dao.findForList("EntLoanAcctInfoSeoMapper.dataHistlistPage", page);
    }
    @SuppressWarnings("unchecked")
   	@Override
       public List<PecrIndvBsSgmt> dataHistListForUpdate(Page page) throws Exception {
           return (List<PecrIndvBsSgmt>) dao.findForList("EntLoanAcctInfoSeoMapper.changeHistlistPage", page);
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
		dao.update("EntLoanAcctInfoSeoMapper.updateStatus", map);		
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
		dao.update("EntLoanAcctInfoSeoMapper.backdate", map);		
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
		dao.delete("EntLoanAcctInfoSeoMapper.deletedate", map);
	}
	/**
	 * 企业借贷账户 基础段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> getAcctBsSgmtById(PageData pd) throws Exception {
		return (Map<String, Object>) dao.findForObject("EntLoanAcctInfoSeoMapper.getAcctBsSgmtById", pd);
	}
	
	/**
	 * 企业借贷账户 基本信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getAcctBsInfSgmtById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("EntLoanAcctInfoSeoMapper.getAcctBsInfSgmtById", pd);
	}
	
	/**
	 * 企业借贷账户 授信额度信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getAcctCredSgmtById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("EntLoanAcctInfoSeoMapper.getAcctCredSgmtById", pd);
	}
	
	/**
	 * 企业借贷账户 初始债权说明段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getCreditorInfSgmtById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("EntLoanAcctInfoSeoMapper.getCreditorInfSgmtById", pd);
	}
	
	/**
	 * 企业借贷账户 还款表现信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getLbltyInfSgmtById(PageData pd) throws Exception{
		return (PageData) dao.findForObject("EntLoanAcctInfoSeoMapper.getLbltyInfSgmtById", pd);
	}

	/**
	 * 企业借贷账户 相关还款责任人段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<EntRltRepymtSgmt> getLoanRltSgmtById(Page page) throws Exception {
		return (List<EntRltRepymtSgmt>) dao.findForList("EntLoanAcctInfoSeoMapper.getLoanRltSgmtByIdlistPage", page);
	}

	/**
	 * 企业借贷账户 抵质押物信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> getMccInfoSgmtById(Page page) throws Exception {
		return (List<PageData>) dao.findForList("EntLoanAcctInfoSeoMapper.getMccInfoSgmtByIdlistPage", page);
	}

	/**
	 * 企业借贷账户 特殊交易说明段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> getTrstDspnSgmtById(Page page) throws Exception {
		return (List<PageData>) dao.findForList(
				"EntLoanAcctInfoSeoMapper.getTrstDspnSgmtByIdlistPage", page);
	}
}
