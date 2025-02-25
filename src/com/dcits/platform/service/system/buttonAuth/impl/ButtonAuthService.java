package com.dcits.platform.service.system.buttonAuth.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.entity.Page;
import com.dcits.platform.service.system.buttonAuth.ButtonAuthManager;
import com.dcits.platform.util.PageData;

@Service("buttonAuthService")
public class ButtonAuthService implements ButtonAuthManager {

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> lists(Page page) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>) dao.findForList("ButtonAuthMapper.buttonAuthlistPage", page);
	}

	@Override
	public PageData getCompanyName(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return (PageData) dao.findForObject("ButtonAuthMapper.getCompanyName", pd);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> findAllMenu(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>) dao.findForList("ButtonAuthMapper.findAllMenu", pd);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> findFunIdByGroupId(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>) dao.findForList("ButtonAuthMapper.findFunIdByGroupId", pd);
	}

	@Override
	public void save(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		dao.save("ButtonAuthMapper.save", pd);
	}

	@Override
	public PageData findFunName(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return (PageData) dao.findForObject("ButtonAuthMapper.findFunName", pd);
	}

	@Override
	public PageData findButtonAuthByID(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return (PageData) dao.findForObject("ButtonAuthMapper.findButtonAuthByID", pd);
	}

	@Override
	public void updateButtonAuth(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		dao.update("ButtonAuthMapper.updateButtonAuth", pd);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> getFunNameByMenuId(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>) dao.findForList("ButtonAuthMapper.getFunNameByMenuId", pd);
	}

	@Override
	public void updateStatus(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		dao.update("ButtonAuthMapper.updateStatus", pd);
	}

	@Override
	public List<PageData> getBuAuByComMenuId(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>) dao.findForList("ButtonAuthMapper.getBuAuByComMenuId", pd);
	}
	
	
}
