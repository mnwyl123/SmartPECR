package com.dcits.supervise.pecr.sendSMS.mapper.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.sendSMS.mapper.SendSMSMapper;

@Repository
public class SendSMSMapperImpl implements SendSMSMapper{
	
	@Resource(name="daoSupportPecr")
	private DaoSupportPecr dao;
	
	@Override
	public void getMessageTo(PageData page) throws Exception {
		dao.save("SendSMSMapper.getMessageTo", page);
	}

	@Override
	public int updateStatus(String uuid) throws Exception {
		Object count = dao.update("SendSMSMapper.updateStatus", uuid);
		if(count != null) {
			return (int) count;
		}else {
			return 0;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryRec(String uuid) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("SendSMSMapper.querySmsRec", uuid);
	}

	@Override
	public void insertRecprd(Map<String, Object> map) throws Exception {
		dao.update("SendSMSMapper.updateStatusEnd", map);
		dao.insert("SendSMSMapper.insertRecprd", map);		
	}

}
