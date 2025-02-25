package com.dcits.supervise.pecr.sendSMS.mapper;

import java.util.List;
import java.util.Map;

import com.dcits.platform.util.PageData;

public interface SendSMSMapper {
	
	/**
	 * 逾期短信数据迁移
	 * @param pd
	 * @throws Exception
	 */
	public abstract void getMessageTo(PageData pd) throws Exception;
	
	/**
	 * 短信修改状态抢断
	 * @param uuid
	 * @return
	 * @throws Exception
	 */
	public abstract int updateStatus(String uuid)throws Exception;

	/**
	 * 查询抢断的所有短信
	 * @param uuid
	 * @return
	 * @throws Exception 
	 */
	public abstract List<Map<String, Object>> queryRec(String uuid) throws Exception;

	/**
	 * 插入短信发送记录
	 * @param map
	 * @throws Exception 
	 */
	public abstract void insertRecprd(Map<String, Object> map) throws Exception;

}
