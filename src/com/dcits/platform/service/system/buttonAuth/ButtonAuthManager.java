package com.dcits.platform.service.system.buttonAuth;

import java.util.List;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;

public interface ButtonAuthManager {

	
	public List<PageData> lists(Page page)throws Exception;
	
	public PageData getCompanyName(PageData pd)throws Exception;
	
	public List<PageData> findAllMenu(PageData pd)throws Exception;
	
	public List<PageData> findFunIdByGroupId(PageData pd)throws Exception;
	
	public void save(PageData pd)throws Exception;
	
	public PageData findFunName(PageData pd)throws Exception;
	
	public PageData findButtonAuthByID(PageData pd)throws Exception;
	
	public void updateButtonAuth(PageData pd)throws Exception;
	
	public List<PageData> getFunNameByMenuId(PageData pd)throws Exception;
	
	public void updateStatus(PageData pd)throws Exception;
	
	public List<PageData> getBuAuByComMenuId(PageData pd)throws Exception;
}
