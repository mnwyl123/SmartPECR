package com.dcits.supervise.pecr.common.service;

import java.util.Map;

public interface MiddleDataChangeMapper {

	/**
	 * 对比后给对应中间表添加数据
	 * @throws Exception
	 */
	public void addMiddleData(Map<String, Object> conditionMap)throws Exception;
	
	/**
	 * 对比后删除中间表数据
	 * @param conditionMap
	 * @throws Exception
	 */
	public void deleteMiddleData(Map<String, Object> conditionMap)throws Exception;
	
	/**
	 * 新增删除时对比中间表数据
	 * @param conditionMap
	 * @throws Exception
	 */
	public Map<String, Object> compareMiddleData(Map<String, Object> conditionMap)throws Exception;
	
	/**
	 * 获取对应数据业务主键
	 * @param conditionMap
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getBusinessParameterKey(Map<String, Object> conditionMap)throws Exception;
	
	/**
	 * 获取历史数据表和当前表是否包含相同业务主键数据
	 * @param conditionMap
	 * @return
	 * @throws Exception
	 */
	public boolean findHistTableData(Map<String, Object> conditionMap)throws Exception;
	
	
}
