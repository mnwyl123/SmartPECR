package com.dcits.supervise.pecr.indv.service.dataRecode;

import com.dcits.platform.util.PageData;

public interface AuditingCommonManager {

	/**
	 * 更改数据审核状态公告方法
	 * @param pd
	 * @throws Exception
	 */
	public void updateAuditing(PageData pd) throws Exception;
	
}
