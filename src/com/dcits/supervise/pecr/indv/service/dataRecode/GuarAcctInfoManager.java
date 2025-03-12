package com.dcits.supervise.pecr.indv.service.dataRecode;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.indv.entity.GuarAcctBsSgmt;
import com.dcits.supervise.pecr.indv.entity.GuarRltRepymtInfSgmt;

import java.util.List;
import java.util.Map;
/**
 * 个人担保账户信息
 * @author 穆楠
 *
 */
public interface GuarAcctInfoManager {
	

	/**
	 * 个人担保基础段 按段更正  列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<GuarAcctBsSgmt> getGuarUpdateAcctBsSgmtList(Page page) throws Exception;


	/**
	 * 个人担保基础段   列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<GuarAcctBsSgmt> getGuarAcctBsSgmtList(Page page) throws Exception;

	/**
	 * 个人担保账户信息 基础段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getAcctBsSgmtById(PageData pd) throws Exception;
	
	/**
	 * 个人担保账户按段更正信息
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getAcctBsSgmtByIdType(PageData pd) throws Exception;

	/**
	 * 个人担保账户信息 基本信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getAcctInfSgmtById(PageData pd) throws Exception;
	
	/**
	 * 个人担保账户信息 在保责任信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getRepymtInfSgmtById(PageData pd) throws Exception;
	

	/**
	 * 个人担保账户按段跟正信息 从个人担保基础段历史表中获取主键
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public String getPdaGuarAcctBsSgmtId(Page page) throws Exception;

	/**
	 * 个人担保账户信息 相关还款责任人段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<GuarRltRepymtInfSgmt> getRltInfList(Page page) throws Exception;

	/**
	 * 个人担保账户信息 抵质押物信息段
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
	public int getAcctBsSgmtKey(Map<String, Object> map) throws Exception;
	
	/**
	 * 新增   个人担保按段更正基础段
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
	public void deleteAcctBsSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 查询 基本信息段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getAcctInfoSgmtKey(Map<String, Object> map) throws Exception;
	/**
	 * 查询 基本信息段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getMccInfKey(Map<String, Object> map) throws Exception;
	/**
	 * 查询 相关还款责任人 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getRltRepymtInfKey(Map<String, Object> map) throws Exception;
	/**
	 * 新增   个人担保按段更正基本信息段
	 * @param map
	 * @throws Exception
	 */
	public void saveAcctInfoSgmt(Map<String, Object> map) throws Exception;
	/**
	 * 新增   基本信息段
	 * @param map
	 * @throws Exception
	 */
	public void insertAcctInfoSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 修改   基本信息段
	 * @param map
	 * @throws Exception
	 */
	public void updateAcctInfoSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 删除   基本信息段
	 * @param map
	 * @throws Exception
	 */
	public void delAcctInfoSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 新增   按段更正相关还款责任人段
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
	 * 查询  在保责任信息段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getRepymtInfSgmtKey(Map<String, Object> map) throws Exception;
	
	/**
	 * 新增    个人担保账户按段更正在保责任信息段
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
	
}
