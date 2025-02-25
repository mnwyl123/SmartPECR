package com.dcits.supervise.pecr.ent.service.dataRecode;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.ent.entity.EntIncomeStatement;

import java.util.List;
import java.util.Map;

/**
 * 企业财务报表   企业利润及利润分配表  持久层
 * @author leizx
 *
 */
public interface EntIncomePabsInfoManager {
	
	/**
	 * 获取企业利润及利润分配表  基础段  列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<EntIncomeStatement> getIncomeInfoList(Page page) throws Exception;
	
	/**
	 * 企业利润及利润分配表  基础段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getIncomeStatementById(PageData pd) throws Exception;
	
	/**
	 * 企业利润及利润分配表  02企业利润及利润分配表段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getIncomeStatement02ById(PageData pd) throws Exception;
	
	/**
	 * 企业利润及利润分配表  07企业利润及利润分配表段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getIncomeStatement07ById(PageData pd) throws Exception;

	/**
	 * 查询 基础段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getIncomeStatementKey(Map<String, Object> map) throws Exception;
	
	/**
	 * 新增   基础段
	 * @param pd
	 * @throws Exception
	 */
	public void insertIncomeStatement(Map<String, Object> map) throws Exception;
	
	/**
	 * 修改   基础段
	 * @param map
	 * @throws Exception
	 */
	public void updateIncomeStatement(Map<String, Object> map) throws Exception;
	
	/**
	 * 删除   基础段  (同时会删除其他段)
	 * @param map
	 * @throws Exception
	 */
	public void deleteIncomeStatement(Map<String, Object> map) throws Exception;
	
	/**
	 * 查询 02企业利润及利润分配表段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getIncome2002Key(Map<String, Object> map) throws Exception;
	
	/**
	 * 新增   02企业利润及利润分配表段
	 * @param map
	 * @throws Exception
	 */
	public void insertIncome2002(Map<String, Object> map) throws Exception;
	
	/**
	 * 修改   02企业利润及利润分配表段
	 * @param map
	 * @throws Exception
	 */
	public void updateIncome2002(Map<String, Object> map) throws Exception;
	
	/**
	 * 删除   02企业利润及利润分配表段
	 * @param map
	 * @throws Exception
	 */
	public void delIncome2002(Map<String, Object> map) throws Exception;
	
	
	/**
	 * 查询 07企业利润及利润分配表段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getIncomeState2007Key(Map<String, Object> map) throws Exception;
	
	/**
	 * 新增   07企业利润及利润分配表段
	 * @param map
	 * @throws Exception
	 */
	public void insertIncomeState2007(Map<String, Object> map) throws Exception;
	
	/**
	 * 修改   07企业利润及利润分配表段
	 * @param map
	 * @throws Exception
	 */
	public void updateIncomeState2007(Map<String, Object> map) throws Exception;
	
	/**
	 * 删除   07企业利润及利润分配表段
	 * @param map
	 * @throws Exception
	 */
	public void delIncomeState2007(Map<String, Object> map) throws Exception;
	
}
