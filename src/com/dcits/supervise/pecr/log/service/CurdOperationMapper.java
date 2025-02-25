package com.dcits.supervise.pecr.log.service;

import com.dcits.platform.util.PageData;

public interface CurdOperationMapper{

	/**
	 * 保存日志信息至数据库
	 */
	public void addLog(PageData pd);

}
