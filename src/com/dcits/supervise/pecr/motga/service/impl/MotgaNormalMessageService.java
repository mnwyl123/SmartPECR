package com.dcits.supervise.pecr.motga.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.entity.Page;
import com.dcits.supervise.pecr.motga.service.MotgaNormalMessageManager;

@Service
public class MotgaNormalMessageService implements MotgaNormalMessageManager{
	@Resource(name = "daoSupportPecr")
    private DaoSupportPecr dao;

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> getNormalMessage(Page page) throws Exception {
		return  (List<Map<String, Object>>) dao.findForList("MotgaNormalMessageMapper.getNormalMessagelistPage", page);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> autoNormalMessage(Page page) throws Exception {
		return  (List<Map<String, Object>>) dao.findForList("MotgaNormalMessageMapper.autoNormalMessagelistPage", page);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> getAbnormalMessage(Page page) throws Exception {
		return  (List<Map<String, Object>>) dao.findForList("MotgaNormalMessageMapper.getAbnormalMessagelistPage", page);
	}
}
