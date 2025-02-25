package com.dcits.supervise.pecr.ent.service.dataRecode;

import java.util.List;
import java.util.Map;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.ent.entity.EnBasInf;
import com.dcits.supervise.pecr.ent.entity.EntActuCotrlInfSgmt;
import com.dcits.supervise.pecr.ent.entity.EntCotaInfSgmt;
import com.dcits.supervise.pecr.ent.entity.EntFcsInfSgmt;
import com.dcits.supervise.pecr.ent.entity.EntIdSgmt;
import com.dcits.supervise.pecr.ent.entity.EntMnMmbInfSgmt;
import com.dcits.supervise.pecr.ent.entity.EntMnShaHodInfSgmt;
import com.dcits.supervise.pecr.ent.entity.EntSpvsgAthrtyInfSgmt;

public interface EnBasInfManager {
	/**
	 * 企业基本信息 
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<EnBasInf> List(Page page)
			throws Exception;
	/**
	 * 企业基本信息 基础段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getentBsSgmt(PageData pd) throws Exception;
	/**
	 * 企业基本信息 其他标识信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<EntIdSgmt> getentIdSgmtById(PageData pd) throws Exception;
	/**
	 * 企业基本信息 基本概况信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getentFcsInfSgmtById(PageData pd) throws Exception;
	/**
	 * 企业基本信息 主要成员段主键
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getentMnShaHodInfSgmt(PageData pd) throws Exception;
	/**
	 * 企业基本信息 主要组成人员段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<EntMnMmbInfSgmt> getentMnMmbInfSgmtById(PageData pd) throws Exception;
	/**
	 * 企业基本信息 注册资本及主要出资人段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<EntMnShaHodInfSgmt> getentMnShaHodInfSgmtById(PageData pd) throws Exception;
	/**
	 * 企业基本信息 实际控制人段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<EntActuCotrlInfSgmt> getentActuCotrlInfSgmtById(PageData pd) throws Exception;
	/**
	 * 企业基本信息 上级机构段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getentSpvsgAthrtyInfSgmtById(PageData pd) throws Exception;
	/**
	 * 企业基本信息 联系方式段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getentCotaInfSgmtById(PageData pd) throws Exception;
	/**
	 * 新增   基础段
	 * @param pd
	 * @throws Exception
	 */
	public void insertEntBsSgmt(Map<String, Object> map) throws Exception;
	/**
	 * 修改   基础段
	 * @param map
	 * @throws Exception
	 */
	public void updateEntBsSgmt(Map<String, Object> map) throws Exception;
	/**
	 * 删除   基础段  (同时会删除其他段)
	 * @param map
	 * @throws Exception
	 */
	public void deleteEntBsSgmt(Map<String, Object> map) throws Exception;
	/**
	 * 新增   其他标识信息段
	 * @param pd
	 * @throws Exception
	 */
	public void insertEntIdSgmt(Map<String, Object> map) throws Exception;
	/**
	 * 修改   其他标识信息段
	 * @param map
	 * @throws Exception
	 */
	public void updateEntIdSgmt(Map<String, Object> map) throws Exception;
	/**
	 * 删除   其他标识信息段
	 * @param map
	 * @throws Exception
	 */
	public void deleteEntIdSgmt(Map<String, Object> map) throws Exception;
	/**
	 * 新增   基本概况信息段
	 * @param pd
	 * @throws Exception
	 */
	public void insertEntFcsInfSgmt(Map<String, Object> map) throws Exception;
	/**
	 * 修改   基本概况信息段
	 * @param map
	 * @throws Exception
	 */
	public void updateEntFcsInfSgmt(Map<String, Object> map) throws Exception;
	/**
	 * 删除   基本概况信息段
	 * @param map
	 * @throws Exception
	 */
	public void deleteEntFcsInfSgmt(Map<String, Object> map) throws Exception;
	/**
	 * 新增   主要组成人员段
	 * @param pd
	 * @throws Exception
	 */
	public void insertEntMnMmbInfSgmt(Map<String, Object> map) throws Exception;
	/**
	 * 修改   主要组成人员段
	 * @param map
	 * @throws Exception
	 */
	public void updateEntMnMmbInfSgmt(Map<String, Object> map) throws Exception;
	/**
	 * 删除   主要组成人员段
	 * @param map
	 * @throws Exception
	 */
	public void deleteEntMnMmbInfSgmt(Map<String, Object> map) throws Exception;
	/**
	 * 新增   注册资本及主要出资人段
	 * @param pd
	 * @throws Exception
	 */
	public void insertEntMnShaHodInfSgmt(Map<String, Object> map) throws Exception;
	/**
	 * 修改   注册资本及主要出资人段
	 * @param map
	 * @throws Exception
	 */
	public void updateEntMnShaHodInfSgmt(Map<String, Object> map) throws Exception;
	/**
	 * 删除   注册资本及主要出资人段
	 * @param map
	 * @throws Exception
	 */
	public void deleteEntMnShaHodInfSgmt(Map<String, Object> map) throws Exception;
	/**
	 * 新增   实际控制人
	 * @param pd
	 * @throws Exception
	 */
	public void insertEntActuCotrlInfSgmt(Map<String, Object> map) throws Exception;
	/**
	 * 修改  实际控制人
	 * @param map
	 * @throws Exception
	 */
	public void updateEntActuCotrlInfSgmt(Map<String, Object> map) throws Exception;
	/**
	 * 删除   实际控制人
	 * @param map
	 * @throws Exception
	 */
	public void deleteEntActuCotrlInfSgmt(Map<String, Object> map) throws Exception;
	/**
	 * 新增   上级机构段
	 * @param pd
	 * @throws Exception
	 */
	public void insertEntSpvsgAthrtyInfSgmt(Map<String, Object> map) throws Exception;
	/**
	 * 修改  上级机构段
	 * @param map
	 * @throws Exception
	 */
	public void updateEntSpvsgAthrtyInfSgmt(Map<String, Object> map) throws Exception;
	/**
	 * 删除   上级机构段
	 * @param map
	 * @throws Exception
	 */
	public void deleteEntSpvsgAthrtyInfSgmt(Map<String, Object> map) throws Exception;
	/**
	 * 新增  联系方式段
	 * @param pd
	 * @throws Exception
	 */
	public void insertEntCotaInfSgmt(Map<String, Object> map) throws Exception;
	/**
	 * 修改   联系方式段
	 * @param map
	 * @throws Exception
	 */
	public void updateEntCotaInfSgmt(Map<String, Object> map) throws Exception;
	/**
	 * 删除   联系方式段
	 * @param map
	 * @throws Exception
	 */
	public void deleteEntCotaInfSgmt(Map<String, Object> map) throws Exception;
	/**
	 * 主键是否存在  其他标识信息段
	 * @param map
	 * @throws Exception
	 */
	public int getEntIdSgmtKey(Map<String, Object> map) throws Exception;
	/**
	 * 主键是否存在  主要组成人员段
	 * @param map
	 * @throws Exception
	 */
	public int getEntMnMmbInfSgmtKey(Map<String, Object> map) throws Exception;
	/**
	 * 主键是否存在  注册资本及主要出资人段
	 * @param map
	 * @throws Exception
	 */
	public int getEntMnShaHodInfSgmtKey(Map<String, Object> map) throws Exception;
	/**
	 * 主键是否存在  实际控制人段
	 * @param map
	 * @throws Exception
	 */
	public int getEntActuCotrlInfSgmtKey(Map<String, Object> map) throws Exception;
	
}
