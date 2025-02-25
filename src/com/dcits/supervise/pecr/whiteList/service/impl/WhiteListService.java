package com.dcits.supervise.pecr.whiteList.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.supervise.pecr.whiteList.service.WhiteListManager;
import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;

@Service
public class WhiteListService implements WhiteListManager {

	@Resource(name = "daoSupportPecr")
	private DaoSupportPecr dao;
	

	
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> productList(Page page) throws Exception {
		return (List<PageData>) dao.findForList("WhiteListMapper.productList", page);
	}

	@Override
	public int selectCountProduct(PageData pd) throws Exception {
		return (int) dao.findForObject("WhiteListMapper.selectCountProduct", pd);
	}

	@Override
	public void insertWhiteProduct(PageData pd) throws Exception {
		dao.save("WhiteListMapper.insertWhiteProduct", pd);
		
	}

	@Override
	public void updateWhiteProduct(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		dao.update("WhiteListMapper.updateWhiteProduct", pd);
		
	}

	@Override
	public int selectCountMsgProduct(PageData pd) throws Exception {
		return (int) dao.findForObject("WhiteListMapper.selectCountMsgProduct", pd);
	}

	@Override
	public PageData selectOneProduct(PageData pd) throws Exception {
		return (PageData) dao.findForObject("WhiteListMapper.selectOneProduct", pd);
	}

	@Override
	public void deleteWhiteProduct(PageData pd) throws Exception {
		dao.delete("WhiteListMapper.deleteWhiteProduct", pd);
	}
	
	
	
	

	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> customerList(Page page) throws Exception {
		return (List<PageData>) dao.findForList("WhiteListMapper.customerList", page);
	}

	@Override
	public int selectCountCustomer(PageData pd) throws Exception {
		return (int) dao.findForObject("WhiteListMapper.selectCountCustomer", pd);
	}

	@Override
	public void insertWhiteCustomer(PageData pd) throws Exception {
		dao.save("WhiteListMapper.insertWhiteCustomer", pd);
		
	}

	@Override
	public void updateWhiteCustomer(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		dao.update("WhiteListMapper.updateWhiteCustomer", pd);
		
	}

	@Override
	public int selectCountMsgCustomer(PageData pd) throws Exception {
		return (int) dao.findForObject("WhiteListMapper.selectCountMsgCustomer", pd);
	}

	@Override
	public PageData selectOneCustomer(PageData pd) throws Exception {
		return (PageData) dao.findForObject("WhiteListMapper.selectOneCustomer", pd);
	}

	@Override
	public void deleteWhiteCustomer(PageData pd) throws Exception {
		dao.delete("WhiteListMapper.deleteWhiteCustomer", pd);
	}
	
	
	

	
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> businessList(Page page) throws Exception {
		return (List<PageData>) dao.findForList("WhiteListMapper.businessList", page);
	}

	@Override
	public int selectCountBusiness(PageData pd) throws Exception {
		return (int) dao.findForObject("WhiteListMapper.selectCountBusiness", pd);
	}

	@Override
	public void insertWhiteBusiness(PageData pd) throws Exception {
		dao.save("WhiteListMapper.insertWhiteBusiness", pd);
		
	}

	@Override
	public void updateWhiteBusiness(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		dao.update("WhiteListMapper.updateWhiteBusiness", pd);
		
	}

	@Override
	public int selectCountMsgBusiness(PageData pd) throws Exception {
		return (int) dao.findForObject("WhiteListMapper.selectCountMsgBusiness", pd);
	}

	@Override
	public PageData selectOneBusiness(PageData pd) throws Exception {
		return (PageData) dao.findForObject("WhiteListMapper.selectOneBusiness", pd);
	}

	@Override
	public void deleteWhiteBusiness(PageData pd) throws Exception {
		dao.delete("WhiteListMapper.deleteWhiteBusiness", pd);
	}
	
}
































