package com.dcits.supervise.pecr.ent.service.packet;

import java.util.List;
import java.util.Map;

import com.dcits.platform.entity.Page;

public interface EntNormalMessageManager {

	public List<Map<String, Object>> getNormalMessage(Page page) throws Exception;
	
	public List<Map<String, Object>> autoNormalMessage(Page page) throws Exception;
	

	public List<Map<String, Object>> getAbnormalMessage(Page page) throws Exception;
}
