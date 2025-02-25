package com.dcits.supervise.pecr.ent.service.packet.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.entity.Page;
import com.dcits.supervise.pecr.ent.service.packet.EntNormalMessageManager;
@Service("entNormalMessageService")
public class EntNormalMessageService implements EntNormalMessageManager{
	@Resource(name = "daoSupportPecr")
    private DaoSupportPecr dao;

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> getNormalMessage(Page page) throws Exception {
		return  (List<Map<String, Object>>) dao.findForList("EntNormalMessageMapper.getNormalMessagelistPage", page);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> autoNormalMessage(Page page) throws Exception {
		return  (List<Map<String, Object>>) dao.findForList("EntNormalMessageMapper.autoNormalMessagelistPage", page);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> getAbnormalMessage(Page page) throws Exception {
		return  (List<Map<String, Object>>) dao.findForList("EntNormalMessageMapper.getAbnormalMessagelistPage", page);
	}
}
