package com.dcits.supervise.pecr.ent.service.seo;

import java.util.List;
import java.util.Map;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.ent.entity.CashFlows;

public interface CashFlowsSeoManager {


	/**
	 * 查询 中间表
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> dataList(Page page) throws Exception;
	/**
	 * 查询 当前表+历史表
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<CashFlows> dataHistList(Page page) throws Exception;
	/**
   	 * 更新状态到11
   	 * 
   	 * @param pd
   	 * @return
   	 * @throws Exception
   	 */
    public void updateStatus(Map<String, Object> map) throws Exception;
    /**
   	 * 更新状态到20
   	 * 
   	 * @param pd
   	 * @return
   	 * @throws Exception
   	 */
    public void backdate(Map<String, Object> map) throws Exception;
    /**
   	 * 删除报文数据信息
   	 * 
   	 * @param pd
   	 * @return
   	 * @throws Exception
   	 */
    public void deletedate(Map<String, Object> map) throws Exception;
    /**
	 * 企业现金流量表02现金流量表段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getCashFlows2002SgmtById(PageData pd) throws Exception;
	
	/**
	 * 企业现金流量表07现金流量表段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getCashFlows2007SgmtById(PageData pd) throws Exception;
	
	/**
	 * 基础段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getCashFlowsBsSgmtById(PageData pd) throws Exception;
	
}
