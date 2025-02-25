package com.dcits.supervise.pecr.indv.service.packet.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.entity.Page;
import com.dcits.supervise.pecr.indv.service.packet.IndvMessageDownLoadManager;
@Service
public class IndvMessageDownLoadService implements IndvMessageDownLoadManager{

	@Resource(name = "daoSupportPecr")
    private DaoSupportPecr dao;

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> getIndvMessageDownLoad(Page page) throws Exception {
		return  (List<Map<String, Object>>) dao.findForList("IndvMessageDownLoadMapper.getIndvMessageDownLoadlistPage", page);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> getEntMessageDownLoad(Page page) throws Exception {
		return  (List<Map<String, Object>>) dao.findForList("IndvMessageDownLoadMapper.getEntMessageDownLoadlistPage", page);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> getIndvSpMessageDownLoad(Page page) throws Exception {
		// TODO Auto-generated method stub
		return  (List<Map<String, Object>>) dao.findForList("IndvMessageDownLoadMapper.getIndvSpMessageDownLoadlistPage", page);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> getEntSpMessageDownLoad(Page page) throws Exception {
		// TODO Auto-generated method stub
		return  (List<Map<String, Object>>) dao.findForList("IndvMessageDownLoadMapper.getEntSpMessageDownLoadlistPage", page);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> getMoMessageDownLoad(Page page) throws Exception {
		// TODO Auto-generated method stub
		return  (List<Map<String, Object>>) dao.findForList("IndvMessageDownLoadMapper.getMoMessageDownLoadlistPage", page);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> getMoSpMessageDownLoad(Page page) throws Exception {
		// TODO Auto-generated method stub
		return  (List<Map<String, Object>>) dao.findForList("IndvMessageDownLoadMapper.getMoSpMessageDownLoadlistPage", page);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> getReportMessageDataPage(Page page) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("IndvMessageDownLoadMapper.getReportMessageDownLoadlistPage", page);
	}

	@Override
	public void updateReportStatus(List<Map<String, String>> listMaps) throws Exception {
		dao.batchUpdate("IndvMessageDownLoadMapper.updateReportStatus", listMaps);
	}

	@Override
	public int getNumByReportTypeAndName(Map<String, String> map) throws Exception {
		return (int) dao.findForObject("IndvMessageDownLoadMapper.getNumByReportTypeAndName", map);
	}
}
