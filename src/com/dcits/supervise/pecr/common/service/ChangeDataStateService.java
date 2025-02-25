package com.dcits.supervise.pecr.common.service;

import java.util.Map;

public interface ChangeDataStateService {

	/**
	 * 1：根据参数改变指定表指定条件下数据的状态
	 * 20210317
	 *:2：修改feed_back_report_err_message中数据的数据状态
	 * @param conditionMap
	 * @throws Exception
	 */
	public void updateBusinessStateByCondition(Map<String, Object> conditionMap) throws Exception;
	
	/**
	 * 校验功能
	 * @param conditionMap
	 * @throws Exception
	 */
	public void updateBaseAudit(Map<String, Object> conditionMap) throws Exception;
}
