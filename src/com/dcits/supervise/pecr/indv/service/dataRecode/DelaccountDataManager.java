package com.dcits.supervise.pecr.indv.service.dataRecode;

import java.util.List;
import java.util.Map;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.indv.entity.inDel;

public interface DelaccountDataManager {

	 /**
	  * 获取列表
	  */
	List<inDel> listDelaccountData(Page page) throws Exception;

	/**
	    * 删除213-个人借贷账户按段删除请求记录
	 */
	void delLoan(PageData pd) throws Exception;

	/**
	    * 删除134-个人证件有效期信息整笔删除请求记录
	 */
	void delIDE(PageData pd) throws Exception;


	/**
	    * 删除233-个人担保账户按段删除请求记录
	 */
	void delGua(PageData pd) throws Exception;
	/**
	    * 删除114-个人基本信息整笔删除请求记录
	 */
	void delBasic(PageData pd) throws Exception;
	/**
	    * 删除223-个人授信协议按段删除请求记录
	 */
	void delPro(PageData pd) throws Exception;
	/**
	    * 删除234-个人担保账户整笔删除请求记录
	 */
	void delGuaEnt(PageData pd) throws Exception;
	/**
	    * 删除214-个人借贷账户整笔删除请求记录
	 */
	void delLoanEnt(PageData pd) throws Exception;
	/**
	    * 删除224-个人授信协议整笔删除请求记录
	 */
	void delProEnt(PageData pd) throws Exception;
	


	/**
	 * 插入213-个人借贷账户按段删除请求记录
	 */
	void saveLoan(PageData pd) throws Exception;
	/**
	 * 插入134-个人证件有效期信息整笔删除请求记录
	 */
	void saveIDE(PageData pd) throws Exception;
	/**
	 * 插入233-个人担保账户按段删除请求记录
	 */
	void saveGua(PageData pd) throws Exception;
	/**
	 * 插入114-个人基本信息整笔删除请求记录
	 */
	void saveBasic(PageData pd) throws Exception;
	/**
	 * 插入223-个人授信协议按段删除请求记录
	 */
	void savePro(PageData pd) throws Exception;
	/**
	 * 插入234-个人担保账户整笔删除请求记录
	 */
	void saveGuaEnt(PageData pd) throws Exception;
	/**
	 * 插入214-个人借贷账户整笔删除请求记录
	 */
	void saveLoanEnt(PageData pd) throws Exception;
	/**
	 * 插入224-个人授信协议整笔删除请求记录
	 */
	void saveProEnt(PageData pd) throws Exception;
	

	/**
	    * 更改213-个人借贷账户按段删除请求记录
	 */
	void updateLoan(PageData pd) throws Exception;
	/**
	    * 更改134-个人证件有效期信息整笔删除请求记录
	 */
	void updateIDE(PageData pd) throws Exception;
	/**
	    * 更改233-个人担保账户按段删除请求记录
	 */
	void updateGua(PageData pd) throws Exception;

	/**
	    * 更改114-个人基本信息整笔删除请求记录
	 */
	void updateBasic(PageData pd) throws Exception;

	/**
	    * 更改223-个人授信协议按段删除请求记录
	 */
	void updatePro(PageData pd) throws Exception;

	/**
	    * 更改234-个人担保账户整笔删除请求记录
	 */
	void updateGuaEnt(PageData pd) throws Exception;

	/**
	    * 更改214-个人借贷账户整笔删除请求记录
	 */
	void updateLoanEnt(PageData pd) throws Exception;

	/**
	    * 更改224-个人授信协议整笔删除请求记录
	 */
	void updateProEnt(PageData pd) throws Exception;
	
	
	public void saveIDelBatchInfo(List<Map<String,String>> listMap) throws Exception;
	
	/**
	 * 根据不同信息记录类型，进行对应删除数据的新增以及批量数据记录表的数据状态更新
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public int saveDelInfoByBatchList(PageData pd) throws Exception;

}
