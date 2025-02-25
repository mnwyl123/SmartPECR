package com.dcits.supervise.pecr.ent.service.dataRecode.impl;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.ent.service.dataRecode.EntAccountChangeManager;
import com.dcits.supervise.pecr.indv.entity.Accountchange;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service("EntAccountChangeService")
public class AccountChangeService implements EntAccountChangeManager {
	@Resource(name = "daoSupportPecr")
	private DaoSupportPecr dao;
	
	/**
	   * 获取列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	
	@SuppressWarnings("unchecked")
	public List<Accountchange> listaccount(Page page)throws Exception{
		return (List<Accountchange>) dao.findForList("EntAccountchangeMapper.accountlistPage", page);
	}
/**
 * 授信新增
 */
	@Override
	public void proAccountChange(PageData pd) throws Exception {
		dao.findForObject("EntAccountchangeMapper.proAccountChange", pd);
		
	}
	/**
	  * 担保新增
	  */
	@Override
	public void guaAccountChange(PageData pd) throws Exception {
		dao.findForObject("EntAccountchangeMapper.guaAccountChange", pd);
		
	}
	/**
	  * 借贷新增
	  */
	@Override
	public void loanAccountChange(PageData pd) throws Exception {
		dao.findForObject("EntAccountchangeMapper.loanAccountChange", pd);
		
	}
	
	/**
	  * 授信修改
	  */
	@Override
	public void updatePro(PageData pd) throws Exception {
		dao.save("EntAccountchangeMapper.updatePro", pd);
		
	}
	/**
	  * 借贷修改
	  */
	@Override
	public void updateLoan(PageData pd) throws Exception {
		dao.save("EntAccountchangeMapper.updateLoan", pd);
		
	}
	/**
	  * 担保修改
	  */
	@Override
	public void updateGua(PageData pd) throws Exception {
		dao.save("EntAccountchangeMapper.updateGua", pd);
		
	}
	
	/**
	  *删除授信
	  */
	@Override
	public void deletePro(PageData pd) throws Exception {
		dao.delete("EntAccountchangeMapper.deletePro", pd);
		
	}
	/**
	  * 删除借贷
	  */
	@Override
	public void deleteLoan(PageData pd) throws Exception {
		dao.delete("EntAccountchangeMapper.deleteLoan", pd);
		
	}
	/**
	  * 删除担保
	  */
	@Override
	public void deleteGua(PageData pd) throws Exception {
		dao.delete("EntAccountchangeMapper.deleteGua", pd);
		
	}
}
