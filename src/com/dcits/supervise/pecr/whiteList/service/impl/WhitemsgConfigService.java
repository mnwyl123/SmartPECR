package com.dcits.supervise.pecr.whiteList.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.common.entity.SystemCodeTypeValue;
import com.dcits.supervise.pecr.whiteList.service.WhiteMsgConfigManager;


@Service
public class WhitemsgConfigService implements WhiteMsgConfigManager{
	@Resource(name = "daoSupportPecr")
	private DaoSupportPecr dao;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> msgConfigList(Page page) throws Exception {
		return (List<PageData>) dao.findForList("WhiteMsgConfigMapper.msgConfigList", page);
	}

	@Override
	public void insertWhiteMsgConfig(PageData pd) throws Exception {
		dao.save("WhiteMsgConfigMapper.insertWhiteMsgConfig", pd);
		
	}

	@Override
	public void updateWhiteMsgConfig(PageData pd) throws Exception {
		dao.update("WhiteMsgConfigMapper.updateWhiteMsgConfig", pd);
		
	}

	@Override
	public void deleteWhiteMsgConfig(PageData pd) throws Exception {
		dao.delete("WhiteMsgConfigMapper.deleteWhiteMsgConfig", pd);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectWhiteMsgCodeDict(
			List<Map<String, Object>> list) throws Exception {
		List<Map<String, Object>> codeValueList = new ArrayList<>();
		List<SystemCodeTypeValue> codeList;
		if (list != null && list.size() > 0) {
			for (Map<String, Object> codeMap : list) {
				Map<String, Object> map = new HashMap<>();
				if (((String) codeMap.get("systemCodeType"))
						.contains("PRODUCT")) {
					codeList = (List<SystemCodeTypeValue>) dao.findForList(
							"WhiteMsgConfigMapper.selectWhiteMsgCodeProduct",
							(String) codeMap.get("systemCodeType"));

				} else if (((String) codeMap.get("systemCodeType"))
						.contains("CUSTOMER")) {

					codeList = (List<SystemCodeTypeValue>) dao.findForList(
							"WhiteMsgConfigMapper.selectWhiteMsgCodeCustomer",
							(String) codeMap.get("systemCodeType"));
				} else if (((String) codeMap.get("systemCodeType"))
						.contains("BUSINESS")) {

					codeList = (List<SystemCodeTypeValue>) dao.findForList(
							"WhiteMsgConfigMapper.selectWhiteMsgCodeBusiness",
							(String) codeMap.get("systemCodeType"));
				} else {
					codeList = null;
				}

				map.put((String) codeMap.get("systemCodeType"), codeList);
				codeValueList.add(map);
			}
		}
		return codeValueList;
	}

	
	@SuppressWarnings("unchecked")
	@Override
	public List<SystemCodeTypeValue> selectCustomerIdTypeDict(String dict)
			throws Exception {
		List<SystemCodeTypeValue> codeList;

		Map<String, Object> map = new HashMap<>();
	
		String[] typeIds = dict.split(",");
		map.put("system_code_type", typeIds[0]);
		map.put("customer_type", typeIds[1]);

		codeList = (List<SystemCodeTypeValue>) dao.findForList(
				"WhiteMsgConfigMapper.selectCustomerIdTypeDict", map);


		return codeList;
	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<SystemCodeTypeValue> selectCustomerIdNumDict(String dict)
			throws Exception {
		List<SystemCodeTypeValue> codeList;

		Map<String, Object> map = new HashMap<>();
		String[] typeIds = dict.split(",");
		map.put("customer_type", typeIds[0]);
		map.put("customer_id_type", typeIds[1]);
		codeList = (List<SystemCodeTypeValue>) dao.findForList(
				"WhiteMsgConfigMapper.selectCustomerIdNumDict", map);

		return codeList;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<SystemCodeTypeValue> selectBusinessCodeDict(String dict)
			throws Exception {
		
		return (List<SystemCodeTypeValue>) dao.findForList(
				"WhiteMsgConfigMapper.selectBusinessCodeDict", dict);
	}
	


	
	
	
	
	
	
	

}



















