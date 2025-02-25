package com.dcits.supervise.pecr.whiteList.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.common.DaoSupportPecr;
import com.dcits.supervise.pecr.whiteList.service.WhiteUsingManager;

@Service
public class WhiteUsingService implements WhiteUsingManager {
	@Resource(name = "daoSupportPecr")
	private DaoSupportPecr dao;

	@Override
	public void whiteUsing(Map<String, Object> keyMap) throws Exception {
		@SuppressWarnings("unchecked")
		Map<String,Object> table_msg = (Map<String, Object>) dao.findForObject("WhiteUsingMapper.selectTableMsg", keyMap);
		
		if(table_msg != null){
			table_msg.putAll(keyMap);
			
			if(table_msg.get("customer_type_field_name") == null || "".equals(table_msg.get("customer_type_field_name"))){
				//客户类型是空,信息段不为抵质押信息段
				//先将白名单生效的数据筛回正常
				dao.save("WhiteUsingMapper.whiteUsingIndvEntStatusFalse", table_msg);
				
				//再将白名单失效状态的数据改为白名单生效状态
				dao.save("WhiteUsingMapper.whiteUsingIndvEntStatusTrue", table_msg);
			}else{
				//客户类型非空,信息段为抵质押信息段
				dao.save("WhiteUsingMapper.whiteUsingMotgaStatusFalse", table_msg);
				
				dao.save("WhiteUsingMapper.whiteUsingMotgaStatusTrue", table_msg);
			}
		}
		
	}
	
}





























