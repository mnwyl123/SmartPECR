package com.dcits.supervise.pecr.common.service;

import java.util.List;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;

public interface DataCheckResultMapper {
	/**
	 * 校验结果查看
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findResultList(Page page) throws Exception;
}
