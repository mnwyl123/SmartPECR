package com.dcits.supervise.pecr.ent.service.dataRecode;

import java.util.List;
import java.util.Map;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.ent.entity.EnSecAcctInf;

public interface EnSecAcctInfManager {

	/**
	 * 企业担保基础段   列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<EnSecAcctInf> getenSecAcctInfList(Page page) throws Exception;
	/**
	 * 企业担保按段更正基础段   列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<EnSecAcctInf> getEnList(Page page) throws Exception;
	/**
	 * 企业担保账户按段更正信息 基础段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getenSecAcctInfByIdType(PageData pd) throws Exception;
	
	
	/**
	 * 企业担保账户按段更正信息 获取基础段历史表中的主键
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public String getEeaGuarAcctBsSgmtId(Page page) throws Exception;

	/**
	 * 企业担保账户信息 基础段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getenSecAcctInfById(PageData pd) throws Exception;

	/**
	 * 企业担保账户信息 基本信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getGuarAcctBsInfSgmtById(PageData pd) throws Exception;
	
	/**
	 * 企业担保账户信息 账户信息授信额度信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getacctCredSgmtById(PageData pd) throws Exception;
	
	/**
	 * 企业担保账户信息 在保责任信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getRepymtInfSgmtById(PageData pd) throws Exception;

	/**
	 * 企业担保账户信息 相关还款责任人段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getRltInfList(Page page) throws Exception;

	/**
	 * 企业担保账户信息 抵质押物信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getMccInfList(Page page) throws Exception;

	/**
	 * 查询 基础段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getEnSecAcctInfKey(Map<String, Object> map) throws Exception;
	
	/**
	 * 新增   企业担保账户按段更正基础段
	 * @param pd
	 * @throws Exception
	 */
	public void saveEnSecAcctInf(Map<String, Object> map) throws Exception;

	/**
	 * 新增   基础段
	 * @param pd
	 * @throws Exception
	 */
	public void insertEnSecAcctInf(Map<String, Object> map) throws Exception;
	
	/**
	 * 修改   基础段
	 * @param map
	 * @throws Exception
	 */
	public void updateEnSecAcctInf(Map<String, Object> map) throws Exception;
	
	/**
	 * 删除   基础段  (同时会删除其他段)
	 * @param map
	 * @throws Exception
	 */
	public void delEnSecAcctInfById(Map<String, Object> map) throws Exception;
	
	/**
	 * 查询 基本信息段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getGuarAcctBsInfSgmtKey(Map<String, Object> map) throws Exception;
	
	/**
	 * 新增   企业担保按段更正基本信息段
	 * @param map
	 * @throws Exception
	 */
	public void saveGuarAcctBsInfSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 新增   基本信息段
	 * @param map
	 * @throws Exception
	 */
	public void insertGuarAcctBsInfSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 修改   基本信息段
	 * @param map
	 * @throws Exception
	 */
	public void updateGuarAcctBsInfSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 删除   基本信息段
	 * @param map
	 * @throws Exception
	 */
	public void delGuarAcctBsInfSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 新增  企业担保按段更正 相关还款责任人段
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
	 * 查询  相关还款责任人段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getRltRepymtInfKey(Map<String, Object> map) throws Exception;
	
	/**
	 * 查询  抵质押物信息段主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getMccInfKey(Map<String, Object> map) throws Exception;
	/**
	 * 新增   企业担保按段更正抵质押物信息段
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
	 * 查询  在保责任信息段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getRepymtInfSgmtKey(Map<String, Object> map) throws Exception;
	
	/**
	 * 新增    企业担保账户按段更正在保责任信息段
	 * @param map
	 * @throws Exception
	 */
	public void saveRepymtInfSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 新增    在保责任信息段
	 * @param map
	 * @throws Exception
	 */
	public void insertRepymtInfSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 修改    在保责任信息段
	 * @param map
	 * @throws Exception
	 */
	public void updateRepymtInfSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 删除   在保责任信息段
	 * @param map
	 * @throws Exception
	 */
	public void delRepymtInfSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 查询  账户信息授信额度信息段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getAcctCredSgmtKey(Map<String, Object> map) throws Exception;
	/**
	 * 新增    企业担保账户按段更正账户信息授信额度信息段
	 * @param map
	 * @throws Exception
	 */
	public void saveAcctCredSgmt(Map<String, Object> map) throws Exception;
	/**
	 * 新增    账户信息授信额度信息段
	 * @param map
	 * @throws Exception
	 */
	public void insertAcctCredSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 修改    账户信息授信额度信息段
	 * @param map
	 * @throws Exception
	 */
	public void updateAcctCredSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 删除   账户信息授信额度信息段
	 * @param map
	 * @throws Exception
	 */
	public void delAcctCredSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 根据账户标识码获取历史数据
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findHistEntGuaranteeList(Page page) throws Exception;
}
