package com.dcits.supervise.pecr.indv.service.seo.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.indv.entity.LoanAcctRltInfSgmt;
import com.dcits.supervise.pecr.indv.entity.PecrIndvBsSgmt;
import com.dcits.supervise.pecr.indv.service.seo.LoanAcctInfoSeoManager;

@Service
public class LoanAcctInfoSeoService implements LoanAcctInfoSeoManager{
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
        return (List<PageData>) dao.findForList("LoanAcctInfoSeoMapper.datalistPage", page);
    }
    @SuppressWarnings("unchecked")
  	@Override
      public List<PageData> dataListForUpdate(Page page) throws Exception {
          return (List<PageData>) dao.findForList("LoanAcctInfoSeoMapper.changelistPage", page);
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
        return (List<PecrIndvBsSgmt>) dao.findForList("LoanAcctInfoSeoMapper.dataHistlistPage", page);
    }
    @SuppressWarnings("unchecked")
   	@Override
       public List<PecrIndvBsSgmt> dataHistListForUpdate(Page page) throws Exception {
           return (List<PecrIndvBsSgmt>) dao.findForList("LoanAcctInfoSeoMapper.changeHistlistPage", page);
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
		dao.update("LoanAcctInfoSeoMapper.updateStatus", map);		
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
		dao.update("LoanAcctInfoSeoMapper.backdate", map);		
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
		dao.delete("LoanAcctInfoSeoMapper.deletedate", map);
	}
	/**
	 * 个人借贷账户 基础段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> getAcctBsSgmtById(PageData pd) throws Exception {
		return (Map<String, Object>) dao.findForObject("LoanAcctInfoSeoMapper.getAcctBsSgmtById", pd);
	}

	/**
	 * 个人借贷账户 基本信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getAcctBsInfSgmtById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("LoanAcctInfoSeoMapper.getAcctBsInfSgmtById", pd);
	}

	/**
	 * 个人借贷账户 相关还款责任人段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<LoanAcctRltInfSgmt> getLoanRltSgmtById(Page page) throws Exception {
		return (List<LoanAcctRltInfSgmt>) dao.findForList(
				"LoanAcctInfoSeoMapper.getLoanRltSgmtByIdlistPage", page);
	}

	/**
	 * 个人借贷账户 抵质押物信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> getMccInfoSgmtById(Page page) throws Exception {
		return (List<PageData>) dao.findForList(
				"LoanAcctInfoSeoMapper.getMccInfoSgmtByIdlistPage", page);
	}

	/**
	 * 个人借贷账户 授信额度信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getAcctCredSgmtById(PageData pd) throws Exception {
		return (PageData) dao.findForObject(
				"LoanAcctInfoSeoMapper.getAcctCredSgmtById", pd);
	}

	/**
	 * 个人借贷账户 初始债权说明段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getOcInfoSgmtById(PageData pd) throws Exception {
		return (PageData) dao.findForObject(
				"LoanAcctInfoSeoMapper.getOcInfoSgmtById", pd);
	}

	/**
	 * 个人借贷账户 月度表现信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getAmblgInfoSgmtById(PageData pd) throws Exception {
		return (PageData) dao.findForObject(
				"LoanAcctInfoSeoMapper.getAmblgInfoSgmtById", pd);
	}

	/**
	 * 个人借贷账户 大额专项分期信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getSpecPrdSgmtById(PageData pd) throws Exception {
		return (PageData) dao.findForObject(
				"LoanAcctInfoSeoMapper.getSpecPrdSgmtById", pd);
	}

	/**
	 * 个人借贷账户 非月度表现信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getAcctDbtInfSgmtById(PageData pd) throws Exception {
		return (PageData) dao.findForObject(
				"LoanAcctInfoSeoMapper.getAcctDbtInfSgmtById", pd);
	}

	/**
	 * 个人借贷账户 特殊交易说明段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> getTrstDspnSgmtById(Page page) throws Exception {
		return (List<PageData>) dao.findForList(
				"LoanAcctInfoSeoMapper.getTrstDspnSgmtByIdlistPage", page);
	}
}
