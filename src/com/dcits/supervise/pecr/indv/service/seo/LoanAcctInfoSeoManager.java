package com.dcits.supervise.pecr.indv.service.seo;

import java.util.List;
import java.util.Map;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.indv.entity.LoanAcctRltInfSgmt;
import com.dcits.supervise.pecr.indv.entity.PecrIndvBsSgmt;

public interface LoanAcctInfoSeoManager {
	/**
	 * 查询 中间表
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> dataList(Page page) throws Exception;
	public List<PageData> dataListForUpdate(Page page) throws Exception;
	/**
	 * 查询 当前表+历史表
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PecrIndvBsSgmt> dataHistList(Page page) throws Exception;
	public List<PecrIndvBsSgmt> dataHistListForUpdate(Page page) throws Exception;
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
	 * 个人借贷账户 基础段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getAcctBsSgmtById(PageData pd) throws Exception;

	/**
	 * 个人借贷账户 基本信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getAcctBsInfSgmtById(PageData pd) throws Exception;

	/**
	 * 个人借贷账户 相关还款责任人段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<LoanAcctRltInfSgmt> getLoanRltSgmtById(Page page) throws Exception;

	/**
	 * 个人借贷账户 抵质押物信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getMccInfoSgmtById(Page page) throws Exception;

	/**
	 * 个人借贷账户 授信额度信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getAcctCredSgmtById(PageData pd) throws Exception;

	/**
	 * 个人借贷账户 初始债权说明段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getOcInfoSgmtById(PageData pd) throws Exception;

	/**
	 * 个人借贷账户 月度表现信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getAmblgInfoSgmtById(PageData pd) throws Exception;

	/**
	 * 个人借贷账户 大额专项分期信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getSpecPrdSgmtById(PageData pd) throws Exception;

	/**
	 * 个人借贷账户 非月度表现信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getAcctDbtInfSgmtById(PageData pd) throws Exception;

	/**
	 * 个人借贷账户 特殊交易说明段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getTrstDspnSgmtById(Page pd) throws Exception;
}
