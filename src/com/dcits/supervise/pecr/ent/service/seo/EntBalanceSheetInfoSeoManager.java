package com.dcits.supervise.pecr.ent.service.seo;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.ent.entity.EntBalanceSheetBsSgmt;

import java.util.List;
import java.util.Map;

/**
 * 企业财务报表   企业资产负债表  持久层
 * @author 穆楠
 *
 */
public interface EntBalanceSheetInfoSeoManager {
	

	
	/**
	 * 企业资产负债表  基础段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getBalanceBsSgmtById(PageData pd) throws Exception;
	
	/**
	 * 企业资产负债表  02企业资产负债表段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getBalanceSheet2002ById(PageData pd) throws Exception;
	
	/**
	 * 企业资产负债表  07企业资产负债表段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getBalanceSheet2007ById(PageData pd) throws Exception;


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
	public List<EntBalanceSheetBsSgmt> dataHistList(Page page) throws Exception;
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
	
}
