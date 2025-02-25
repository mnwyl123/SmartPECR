package com.dcits.supervise.pecr.whiteList.service;

import java.util.List;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;

public interface WhiteListManager {
	
	public List<PageData> productList(Page page) throws Exception;
	public int selectCountProduct(PageData pd) throws Exception;
	public void insertWhiteProduct(PageData pd) throws Exception;
	public void updateWhiteProduct(PageData pd) throws Exception;
	public int selectCountMsgProduct(PageData pd) throws Exception;
	public PageData selectOneProduct(PageData pd) throws Exception;
	public void deleteWhiteProduct(PageData pd) throws Exception;
	
	
	
	public List<PageData> customerList(Page page) throws Exception;
	public int selectCountCustomer(PageData pd) throws Exception;
	public void insertWhiteCustomer(PageData pd) throws Exception;
	public void updateWhiteCustomer(PageData pd) throws Exception;
	public int selectCountMsgCustomer(PageData pd) throws Exception;
	public PageData selectOneCustomer(PageData pd) throws Exception;
	public void deleteWhiteCustomer(PageData pd) throws Exception;
	
	
	public List<PageData> businessList(Page page) throws Exception;
	public int selectCountBusiness(PageData pd) throws Exception;
	public void insertWhiteBusiness(PageData pd) throws Exception;
	public void updateWhiteBusiness(PageData pd) throws Exception;
	public int selectCountMsgBusiness(PageData pd) throws Exception;
	public PageData selectOneBusiness(PageData pd) throws Exception;
	public void deleteWhiteBusiness(PageData pd) throws Exception;

}
