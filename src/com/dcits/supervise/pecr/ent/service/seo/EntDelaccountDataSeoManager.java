package com.dcits.supervise.pecr.ent.service.seo;

import java.util.List;
import java.util.Map;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.indv.entity.inDel;

public interface EntDelaccountDataSeoManager {

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
	public List<inDel> dataHistList(Page page) throws Exception;
	/**
   	 * 更新状态到11
   	 * 
   	 * @param pd
   	 * @return
   	 * @throws Exception
   	 */
    public void updateStatusPro(Map<String, Object> map) throws Exception;
    public void updateStatusGuar(Map<String, Object> map) throws Exception;
    public void updateStatusLoan(Map<String, Object> map) throws Exception;
    public void updateStatusProEnt(Map<String, Object> map) throws Exception;
    public void updateStatusGuarEnt(Map<String, Object> map) throws Exception;
    public void updateStatusLoanEnt(Map<String, Object> map) throws Exception;
    /**
   	 * 更新状态到20
   	 * 
   	 * @param pd
   	 * @return
   	 * @throws Exception
   	 */
    public void backdatePro(Map<String, Object> map) throws Exception;
    public void backdateGuar(Map<String, Object> map) throws Exception;
    public void backdateLoan(Map<String, Object> map) throws Exception;
    public void backdateProEnt(Map<String, Object> map) throws Exception;
    public void backdateGuarEnt(Map<String, Object> map) throws Exception;
    public void backdateLoanEnt(Map<String, Object> map) throws Exception;
    /**
   	 * 删除报文数据信息
   	 * 
   	 * @param pd
   	 * @return
   	 * @throws Exception
   	 */
    public void deletedate(Map<String, Object> map) throws Exception;
    
	

}
