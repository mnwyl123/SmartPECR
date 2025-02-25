package com.dcits.supervise.pecr.ent.service.seo;

import java.util.List;
import java.util.Map;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.ent.entity.EntIncomeAndExpenseStatemeBs;

public interface EntIncomeAndExpenseStatemeBsSeoManager {


	
	/**
	 * 事业单位资产负债 债表段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getAcctInfSgmtById(PageData pd) throws Exception;
	
	/**
	 * 事业单位资产负债 在保责任信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getRepymtInfSgmtById(PageData pd) throws Exception;


	void updateStatus(Map<String, Object> map) throws Exception;


	List<PageData> dataList(Page page) throws Exception;


	List<EntIncomeAndExpenseStatemeBs> dataHistList(Page page) throws Exception;


	void backdate(Map<String, Object> map) throws Exception;


	void deletedate(Map<String, Object> map) throws Exception;

}
