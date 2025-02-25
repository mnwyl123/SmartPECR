package com.dcits.supervise.pecr.common.service;

import com.dcits.platform.entity.Page;

public interface GenerateUUIDMapper {

	public String generateUUID(Page page) throws Exception;
	
	public String insertXmlLog(String topid) throws Exception;
	
	public int getXmlLog(String topid) throws Exception;
}
