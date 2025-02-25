package com.dcits.supervise.pecr.whiteList.service;

import java.util.List;
import java.util.Map;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.common.entity.SystemCodeTypeValue;

public interface WhiteMsgConfigManager {

	public List<PageData> msgConfigList(Page page) throws Exception;

	public void insertWhiteMsgConfig(PageData pd) throws Exception;

	public void updateWhiteMsgConfig(PageData pd) throws Exception;

	public void deleteWhiteMsgConfig(PageData pd) throws Exception;

	public List<Map<String, Object>> selectWhiteMsgCodeDict(
			List<Map<String, Object>> mapList) throws Exception;

	public List<SystemCodeTypeValue> selectCustomerIdTypeDict(
			String dict) throws Exception;

	public List<SystemCodeTypeValue> selectCustomerIdNumDict(
			String dict) throws Exception;

	public List<SystemCodeTypeValue> selectBusinessCodeDict(
			String dict) throws Exception;
	

}
