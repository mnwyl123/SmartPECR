package com.dcits.supervise.pecr.common.service.impl;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.UuidUtil;
import com.dcits.supervise.pecr.common.service.GenerateUUIDMapper;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.stereotype.Service;

import java.util.Map;

import javax.annotation.Resource;

/**
 * 生成UUID
 * @author leizx
 *
 */
@Service("generateUUIDService")
public class GenerateUUIDService implements GenerateUUIDMapper{
	
	@Resource(name = "daoSupportPecr")
	private DaoSupportPecr dao;
	
	/**
	 * 生成UUID
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@Override
	public String generateUUID(Page page) throws Exception {
		//return (String) dao.findForObject("GenerateUUIDMapper.generateUUID", page);
		return UuidUtil.get32UUID();
	}
	
	@Override
	public String insertXmlLog(String xmlLog) throws Exception {
		Map map = new HashedMap();
		map.put("topid", xmlLog);
		return (String) dao.findForObject("GenerateUUIDMapper.insertXmlLog",map);
	}
	
	@Override
	public int getXmlLog(String xmlLog) throws Exception {
		Map map = new HashedMap();
		map.put("topid", xmlLog);
		return (int) dao.findForObject("GenerateUUIDMapper.getXmlLog",map);
	}

}
