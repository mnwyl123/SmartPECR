package com.dcits.supervise.pecr.ent.service.dataRecode;

import java.util.List;
import java.util.Map;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.indv.entity.inDel;

public interface EntDelaccountDataManager {

	 /**
	  * 获取列表
	  */
	List<inDel> listDelaccountData(Page page) throws Exception;

	/**
	    * 删除413-企业借贷账户信息按段删除请求记录
	 */
	void delLoan(PageData pd) throws Exception;
	/**
	    * 删除443-企业担保账户信息按段删除类请求
	 */
	void delGua(PageData pd) throws Exception;
	
	/**
	    * 删除423-企业授信协议信息按段删除类请求
	 */
	void delPro(PageData pd) throws Exception;
	/**
	    * 删除444-企业担保账户信息整笔删除请求
	 */
	void delGuaEnt(PageData pd) throws Exception;
	/**
	    * 删除414-企业借贷账户整笔删除请求记录
	 */
	void delLoanEnt(PageData pd) throws Exception;
	/**
	    *删除424-企业授信协议信息整笔删除请求
	 */
	void delProEnt(PageData pd) throws Exception;
	/**
	    * 删除314-企业基本信息整笔删除请求信息段
	 */
	void delBsEnt(PageData pd) throws Exception;
	/**
	    * 删除614-企业资产负债表整笔删除请求记录
	 */
	void delBlanceEnt(PageData pd) throws Exception;
	/**
	    * 删除624-企业利润及利润分配表整笔删除请求记录
	 */
	void delInComeEnt(PageData pd) throws Exception;
	/**
	    * 删除634-企业现金流量表整笔删除请求记录  
	 */
	void delCashEnt(PageData pd) throws Exception;
	/**
	    * 删除644-事业单位资产负债表整笔删除请求记录  
	 */
	void delAssetsEnt(PageData pd) throws Exception;
	/**
	    * 删除654-事业单位收入支出表整笔删除请求记录  
	 */
	void delInOutEnt(PageData pd) throws Exception;
	
	


	/**
	 * 插入413-企业借贷账户信息按段删除请求记录
	 */
	void saveLoan(PageData pd) throws Exception;
	
	/**
	 * 插入443-企业担保账户信息按段删除类请求   
	 */
	void saveGua(PageData pd) throws Exception;
	
	/**
	 * 插入423-企业授信协议信息按段删除类请求  
	 */
	void savePro(PageData pd) throws Exception;
	/**
	 * 插入444-企业担保账户信息整笔删除请求
	 */
	void saveGuaEnt(PageData pd) throws Exception;
	/**
	 * 插入414-企业借贷账户整笔删除请求记录
	 */
	void saveLoanEnt(PageData pd) throws Exception;
	/**
	 * 插入424-企业授信协议信息整笔删除请求 
	 */
	void saveProEnt(PageData pd) throws Exception;
	/**
	 * 插入314-企业基本信息整笔删除请求信息段
	 */
	void saveBsEnt(PageData pd) throws Exception;
	/**
	 * 插入614-企业资产负债表整笔删除请求记录
	 */
	void saveBlanceEnt(PageData pd) throws Exception;
	/**
	 * 插入624-企业利润及利润分配表整笔删除请求记录
	 */
	void saveInComeEnt(PageData pd) throws Exception;
	/**
	 * 插入634-企业现金流量表整笔删除请求记录 
	 */
	void saveCashEnt(PageData pd) throws Exception;
	/**
	 * 插入634-企业现金流量表整笔删除请求记录 
	 */
	void saveAssetsEnt(PageData pd) throws Exception;
	/**
	 * 插入634-企业现金流量表整笔删除请求记录 
	 */
	void saveInOutEnt(PageData pd) throws Exception;
	
	
	/**
	    * 更改413-企业借贷账户信息按段删除请求记录
	 */
	void updateLoan(PageData pd) throws Exception;

	/**
	    * 更改443-企业担保账户信息按段删除类请求   
	 */
	void updateGua(PageData pd) throws Exception;


	/**
	    * 更改423-企业授信协议信息按段删除类请求  
	 */
	void updatePro(PageData pd) throws Exception;

	/**
	    * 更改444-企业担保账户信息整笔删除请求
	 */
	void updateGuaEnt(PageData pd) throws Exception;

	/**
	    * 更改414-企业借贷账户整笔删除请求记录
	 */
	void updateLoanEnt(PageData pd) throws Exception;

	/**
	    * 更改424-企业授信协议信息整笔删除请求  
	 */
	void updateProEnt(PageData pd) throws Exception;
	/**
	    * 更改314-企业基本信息整笔删除请求信息段
	 */
	void updateBsEnt(PageData pd) throws Exception;
	/**
	    * 更改614-企业资产负债表整笔删除请求记录
	 */
	void updateBlanceEnt(PageData pd) throws Exception;
	/**
	    * 更改624-企业利润及利润分配表整笔删除请求记录 
	 */
	void updateInComeEnt(PageData pd) throws Exception;
	/**
	    * 更改634-企业现金流量表整笔删除请求记录 
	 */
	void updateCashEnt(PageData pd) throws Exception;
	/**
	    * 更改634-企业现金流量表整笔删除请求记录 
	 */
	void updateAssetsEnt(PageData pd) throws Exception;
	/**
	    * 更改634-企业现金流量表整笔删除请求记录 
	 */
	void updateInOutEnt(PageData pd) throws Exception;
}
