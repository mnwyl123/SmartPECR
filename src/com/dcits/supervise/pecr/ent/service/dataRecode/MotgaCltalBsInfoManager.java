package com.dcits.supervise.pecr.ent.service.dataRecode;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.ent.entity.MotgaCltalCtrctBsSgmt;

import java.util.List;
import java.util.Map;

/**
 * 抵（质）押合同信息
 * @author 穆楠
 *
 */
public interface MotgaCltalBsInfoManager {
	
	/**
	 * 抵（质）押合同信息  基础段  列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<MotgaCltalCtrctBsSgmt> getMotgaContractInfoList(Page page) throws Exception;
	
	/**
	 * 抵（质）押合同信息 基础段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getMotgaCltalBsSgmtById(PageData pd) throws Exception;
	
	/**
	 * 抵（质）押合同信息 基本信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getMotgaCltalInfById(PageData pd) throws Exception;
	
	/**
	 * 查询 基础段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getMotgaCltalBsSgmtKey(Map<String, Object> map) throws Exception;
	
	/**
	 * 新增   基础段
	 * @param pd
	 * @throws Exception
	 */
	public void insertMotgaCltalBsSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 修改   基础段
	 * @param map
	 * @throws Exception
	 */
	public void updateMotgaCltalBsSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 删除   基础段  (同时会删除其他段)
	 * @param map
	 * @throws Exception
	 */
	public void deleteMotgaCltalBsSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 查询 基本信息段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getMotgaCltalInfoKey(Map<String, Object> map) throws Exception;
	
	/**
	 * 新增   基本信息段
	 * @param map
	 * @throws Exception
	 */
	public void insertMotgaCltalInfo(Map<String, Object> map) throws Exception;
	
	/**
	 * 修改   基本信息段
	 * @param map
	 * @throws Exception
	 */
	public void updateMotgaCltalInfo(Map<String, Object> map) throws Exception;
	
	/**
	 * 删除   基本信息段
	 * @param map
	 * @throws Exception
	 */
	public void delMotgaCltalInfo(Map<String, Object> map) throws Exception;
	
	/**
	 * 抵（质）押合同信息 其他债务人信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getComRecInfSgmtById(Page page) throws Exception;
	
	/**
	 * 新增   其他债务人信息段
	 * @param map
	 * @throws Exception
	 */
	public void insertComRecInfSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 修改   其他债务人信息段
	 * @param map
	 * @throws Exception
	 */
	public void updateComRecInfSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 删除   其他债务人信息段
	 * @param map
	 * @throws Exception
	 */
	public void delComRecInfSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 抵（质）押合同信息 抵押物信息段 
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getMotgaProptInfListById(Page page) throws Exception;
	
	/**
	 * 新增   抵押物信息段 
	 * @param map
	 * @throws Exception
	 */
	public void insertMotgaProptInf(Map<String, Object> map) throws Exception;
	
	/**
	 * 修改   抵押物信息段 
	 * @param map
	 * @throws Exception
	 */
	public void updateMotgaProptInf(Map<String, Object> map) throws Exception;
	
	/**
	 * 删除   抵押物信息段 
	 * @param map
	 * @throws Exception
	 */
	public void delMotgaProptInf(Map<String, Object> map) throws Exception;
	
	/**
	 * 抵（质）押合同信息 质物信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getCltalInfListById(Page pd) throws Exception;
	
	/**
	 * 新增  质物信息段
	 * @param map
	 * @throws Exception
	 */
	public void insertCltalInf(Map<String, Object> map) throws Exception;
	
	/**
	 * 修改   质物信息段
	 * @param map
	 * @throws Exception
	 */
	public void updateCltalInf(Map<String, Object> map) throws Exception;
	
	/**
	 * 删除   质物信息段
	 * @param map
	 * @throws Exception
	 */
	public void delCltalInf(Map<String, Object> map) throws Exception;
	
}
