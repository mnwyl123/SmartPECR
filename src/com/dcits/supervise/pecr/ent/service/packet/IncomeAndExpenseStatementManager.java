package com.dcits.supervise.pecr.ent.service.packet;

import java.util.List;
import java.util.Map;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.ent.entity.IncomeAndExpenseStatementDlt;

/**
 * 事业单位收入支出表整笔删除请求记录
 * @author 穆楠
 *
 */
public interface IncomeAndExpenseStatementManager {

	/**
	 * 事业单位收入支出表整笔删除请求记录   列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<IncomeAndExpenseStatementDlt> getList(Page page) throws Exception;
	/**
	 * 事业单位收入支出表整笔删除请求记录段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getAcctInfSgmtById(PageData pd) throws Exception;
	/**
	 * 查询  主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getAcctBsSgmtKey(Map<String, Object> map) throws Exception;

	/**
	 * 新增   
	 * @param pd
	 * @throws Exception
	 */
	public void insertAcctBsSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 修改   
	 * @param map
	 * @throws Exception
	 */
	public void updateAcctBsSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 删除   
	 * @param map
	 * @throws Exception
	 */
	public void deleteAcctBsSgmt(Map<String, Object> map) throws Exception;
}
