package com.dcits.supervise.pecr.ent.service.seo;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.ent.entity.BalanceSheetDlt;
import com.dcits.supervise.pecr.ent.entity.EntInstitutionBalance;

import java.util.List;
import java.util.Map;

/**
 * 企业财务报表   事业单位资产负债表  持久层
 * @author 穆楠
 *
 */
public interface entFinStaSeoManager {
	
	public PageData getBalanceById(PageData pd) throws Exception;
	public PageData getCashById(PageData pd) throws Exception;
	public PageData getIncomeById(PageData pd) throws Exception;
	public PageData getPabsById(PageData pd) throws Exception;
	public PageData getInstitutionById(PageData pd) throws Exception;
	
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
	public List<BalanceSheetDlt> dataHistList(Page page) throws Exception;
	/**
   	 * 更新状态到11
   	 * 
   	 * @param pd
   	 * @return
   	 * @throws Exception
   	 */
    public void updateStatusBalance(Map<String, Object> map) throws Exception;
    public void updateStatusCash(Map<String, Object> map) throws Exception;
    public void updateStatusIncome(Map<String, Object> map) throws Exception;
    public void updateStatusPabs(Map<String, Object> map) throws Exception;
    public void updateStatusInstitution(Map<String, Object> map) throws Exception;
    /**
   	 * 更新状态到20
   	 * 
   	 * @param pd
   	 * @return
   	 * @throws Exception
   	 */
    public void backdateBalance(Map<String, Object> map) throws Exception;
    public void backdateCash(Map<String, Object> map) throws Exception;
    public void backdateIncome(Map<String, Object> map) throws Exception;
    public void backdatePabs(Map<String, Object> map) throws Exception;
    public void backdateInstitution(Map<String, Object> map) throws Exception;
    /**
   	 * 删除报文数据信息
   	 * 
   	 * @param pd
   	 * @return
   	 * @throws Exception
   	 */
    public void deletedate(Map<String, Object> map) throws Exception;
    
	
	
}
