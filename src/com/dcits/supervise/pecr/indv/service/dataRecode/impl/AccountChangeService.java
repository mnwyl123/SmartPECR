package com.dcits.supervise.pecr.indv.service.dataRecode.impl;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.indv.entity.Accountchange;
import com.dcits.supervise.pecr.indv.service.dataRecode.AccountChangeManager;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service("accountChangeService")
public class AccountChangeService implements AccountChangeManager {
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
		return (List<Accountchange>) dao.findForList("AccountchangeMapper.accountlistPage", page);
	}
 /**
  * 授信新增
  */
	@Override
	public void proAccountChange(PageData pd) throws Exception {
		dao.findForObject("AccountchangeMapper.proAccountChange", pd);
		
	}
	/**
	  * 担保新增
	  */
	@Override
	public void guaAccountChange(PageData pd) throws Exception {
		dao.findForObject("AccountchangeMapper.guaAccountChange", pd);
		
	}
	/**
	  * 借贷新增
	  */
	@Override
	public void loanAccountChange(PageData pd) throws Exception {
		dao.findForObject("AccountchangeMapper.loanAccountChange", pd);
		
	}
	
	/**
	  * 授信修改
	  */
	@Override
	public void updatePro(PageData pd) throws Exception {
		dao.save("AccountchangeMapper.updatePro", pd);
		
	}
	/**
	  * 借贷修改
	  */
	@Override
	public void updateLoan(PageData pd) throws Exception {
		dao.save("AccountchangeMapper.updateLoan", pd);
		
	}
	/**
	  * 担保修改
	  */
	@Override
	public void updateGua(PageData pd) throws Exception {
		dao.save("AccountchangeMapper.updateGua", pd);
		
	}
	
	/**
	  *删除授信
	  */
	@Override
	public void deletePro(PageData pd) throws Exception {
		dao.delete("AccountchangeMapper.deletePro", pd);
		
	}
	/**
	  * 删除借贷
	  */
	@Override
	public void deleteLoan(PageData pd) throws Exception {
		dao.delete("AccountchangeMapper.deleteLoan", pd);
		
	}
	/**
	  * 删除担保
	  */
	@Override
	public void deleteGua(PageData pd) throws Exception {
		dao.delete("AccountchangeMapper.deleteGua", pd);
		
	}
	
}
