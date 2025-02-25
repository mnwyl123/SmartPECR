package com.dcits.supervise.pecr.ent.service.dataRecode;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.ent.entity.EntAcctBsSgmt;
import com.dcits.supervise.pecr.ent.entity.EntRltRepymtSgmt;

import java.util.List;
import java.util.Map;

/**
 * 企业借贷账户  持久层
 * @author leizx
 *
 */
public interface EntLoanAcctInfoManager {
	
	/**
	 * 获取企业借贷账户  基础段  列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<EntAcctBsSgmt> getLoanAcctBsSgmtList(Page page) throws Exception;
	public List<EntAcctBsSgmt> getUpLoanAcctBsSgmtList(Page page) throws Exception;
	/**
	 * 企业借贷账户 基础段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getAcctBsSgmtById(PageData pd) throws Exception;
	
	/**
	 * 企业借贷账户 基本信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getAcctBsInfSgmtById(PageData pd) throws Exception;
	/**
	 * 企业借贷账户按段更正信息
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getAcctBsSgmtByIdType(PageData pd) throws Exception;
	
	/**
	 * 企业借贷账户 授信额度信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getAcctCredSgmtById(PageData pd) throws Exception;
	
	/**
	 * 企业借贷账户 初始债权说明段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getCreditorInfSgmtById(PageData pd) throws Exception;
	/**
	 * 企业借贷账户按段更正 获取基础段历史表的主键
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public String getEdaAcctBsSgmtId(Page page) throws Exception;
	/**
	 * 企业借贷账户 还款表现信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getLbltyInfSgmtById(PageData pd) throws Exception;

	/**
	 * 企业借贷账户 相关还款责任人段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<EntRltRepymtSgmt> getLoanRltSgmtById(Page page) throws Exception;

	/**
	 * 企业借贷账户 抵质押物信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getMccInfoSgmtById(Page page) throws Exception;

	/**
	 * 企业借贷账户 特殊交易说明段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getTrstDspnSgmtById(Page pd) throws Exception;
	
	/**
	 * 查询 基础段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getAcctBsSgmtKey(Map<String, Object> map) throws Exception;
	
	/**
	 * 新增   企业借贷账户按段更正基础段
	 * @param pd
	 * @throws Exception
	 */
	public void saveAcctBsSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 新增   基础段
	 * @param pd
	 * @throws Exception
	 */
	public void insertAcctBsSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 修改   基础段
	 * @param map
	 * @throws Exception
	 */
	public void updateAcctBsSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 删除   基础段  (同时会删除其他段)
	 * @param map
	 * @throws Exception
	 */
	public void deleteLoanAcctBsSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 查询 基本信息段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getAcctBsInfoSgmtKey(Map<String, Object> map) throws Exception;
	
	/**
	 * 新增   企业借贷账户按段跟更正基本信息段
	 * @param map
	 * @throws Exception
	 */
	public void saveAcctBsInfoSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 新增   基本信息段
	 * @param map
	 * @throws Exception
	 */
	public void insertAcctBsInfoSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 修改   基本信息段
	 * @param map
	 * @throws Exception
	 */
	public void updateAcctBsInfoSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 删除   基本信息段
	 * @param map
	 * @throws Exception
	 */
	public void delAcctBsInfoSgmt(Map<String, Object> map) throws Exception;
	/**
	 * 新增   企业借贷按段更正相关还款责任人段
	 * @param map
	 * @throws Exception
	 */
	public void saveRltRepymtInf(Map<String, Object> map) throws Exception;
	/**
	 * 新增   相关还款责任人段
	 * @param map
	 * @throws Exception
	 */
	public void insertRltRepymtInf(Map<String, Object> map) throws Exception;
	
	/**
	 * 修改   相关还款责任人段
	 * @param map
	 * @throws Exception
	 */
	public void updateRltRepymtInf(Map<String, Object> map) throws Exception;
	
	/**
	 * 删除   相关还款责任人段
	 * @param map
	 * @throws Exception
	 */
	public void delRltRepymtInf(Map<String, Object> map) throws Exception;
	
	/**
	 * 查询 还款表现信息段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getLbltyInfSgmtKey(Map<String, Object> map) throws Exception;
	
	/**
	 * 新增   企业借贷账户按段更正还款表现信息段
	 * @param map
	 * @throws Exception
	 */
	public void saveLbltyInfSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 新增   还款表现信息段
	 * @param map
	 * @throws Exception
	 */
	public void insertLbltyInfSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 修改   还款表现信息段
	 * @param map
	 * @throws Exception
	 */
	public void updateLbltyInfSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 删除   还款表现信息段
	 * @param map
	 * @throws Exception
	 */
	public void delLbltyInfSgmt(Map<String, Object> map) throws Exception;
	/**
	 * 新增   按段更正抵质押物信息段
	 * @param map
	 * @throws Exception
	 */
	public void saveMccInf(Map<String, Object> map) throws Exception;
	/**
	 * 新增   抵质押物信息段
	 * @param map
	 * @throws Exception
	 */
	public void insertMccInf(Map<String, Object> map) throws Exception;
	
	/**
	 * 修改   抵质押物信息段
	 * @param map
	 * @throws Exception
	 */
	public void updateMccInf(Map<String, Object> map) throws Exception;
	
	/**
	 * 删除   抵质押物信息段
	 * @param map
	 * @throws Exception
	 */
	public void delMccInf(Map<String, Object> map) throws Exception;
	
	/**
	 * 查询  授信额度信息段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getAcctCredSgmtKey(Map<String, Object> map) throws Exception;
	
	/**
	 * 新增    企业借贷按段更正授信额度信息段
	 * @param map
	 * @throws Exception
	 */
	public void saveAcctCredSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 新增    授信额度信息段
	 * @param map
	 * @throws Exception
	 */
	public void insertAcctCredSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 修改    授信额度信息段
	 * @param map
	 * @throws Exception
	 */
	public void updateAcctCredSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 删除    授信额度信息段
	 * @param map
	 * @throws Exception
	 */
	public void delAcctCredSgmt(Map<String, Object> map) throws Exception;
	/**
	 * 新增  按段更正特殊交易说明段
	 * @param map
	 * @throws Exception
	 */
	public void saveTrstDspn(Map<String, Object> map) throws Exception;
	/**
	 * 新增  特殊交易说明段
	 * @param map
	 * @throws Exception
	 */
	public void insertTrstDspn(Map<String, Object> map) throws Exception;
	
	/**
	 * 修改   特殊交易说明段
	 * @param map
	 * @throws Exception
	 */
	public void updateTrstDspn(Map<String, Object> map) throws Exception;
	
	/**
	 * 删除   特殊交易说明段
	 * @param map
	 * @throws Exception
	 */
	public void delTrstDspn(Map<String, Object> map) throws Exception;
	
	/**
	 * 查询  初始债权说明段  主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getOcInfSgmtKey(Map<String, Object> map) throws Exception;
	
	/**
	 * 新增   企业借贷账户按段更正初始债权说明段
	 * @param map
	 * @throws Exception
	 */
	public void saveOcInfSgmt(Map<String, Object> map) throws Exception;
	/**
	 * 新增   初始债权说明段
	 * @param map
	 * @throws Exception
	 */
	public void insertOcInfSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 修改   初始债权说明段
	 * @param map
	 * @throws Exception
	 */
	public void updateOcInfSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 删除   初始债权说明段
	 * @param map
	 * @throws Exception
	 */
	public void delOcInfSgmt(Map<String, Object> map) throws Exception;
	/**
	 * 主键是否存在  特殊交易说明段
	 * @param map
	 * @throws Exception
	 */
	public int getTrstDspnSgmtKey(Map<String, Object> map) throws Exception;
	/**
	 * 主键是否存在  相关还款责任人段
	 * @param map
	 * @throws Exception
	 */
	public int getRltRepymtInfKey(Map<String, Object> map) throws Exception;
	/**
	 * 主键是否存在  抵质押物信息段
	 * @param map
	 * @throws Exception
	 */
	public int getmccInfKey(Map<String, Object> map) throws Exception;
	
	/**
	 * 根据账户标识码和待更正段信息获取历史上报数据
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findHistEntAcctList(Page page) throws Exception;
}
