package com.dcits.supervise.pecr.ent.service.dataRecode.impl;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.UuidUtil;
import com.dcits.supervise.pecr.ent.entity.MotgaCltalCtrctBsSgmt;
import com.dcits.supervise.pecr.ent.service.dataRecode.MotgaCltalBsInfoManager;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;

import java.util.List;
import java.util.Map;

/**
 * 抵（质）押合同信息
 * @author 穆楠
 *
 */
@Service("motgaCltalBsInfoService")
public class MotgaCltalBsInfoService implements MotgaCltalBsInfoManager {
	
	@Resource(name = "daoSupportPecr")
	private DaoSupportPecr dao;

	/**
	 * 抵（质）押合同信息  基础段  列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<MotgaCltalCtrctBsSgmt> getMotgaContractInfoList(Page page) throws Exception{
		return (List<MotgaCltalCtrctBsSgmt>) dao.findForList("MotgaCltalBsInfoManager.motgaContractInfolistPage", page);
	}
	
	/**
	 * 抵（质）押合同信息 基础段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> getMotgaCltalBsSgmtById(PageData pd) throws Exception {
		return (Map<String, Object>) dao.findForObject("MotgaCltalBsInfoManager.getMotgaCltalBsSgmtById", pd);
	}
	
	/**
	 * 抵（质）押合同信息 基本信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getMotgaCltalInfById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("MotgaCltalBsInfoManager.getMotgaCltalInfById", pd);
	}
	
	/**
	 * 查询 基础段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getMotgaCltalBsSgmtKey(Map<String, Object> map) throws Exception{
		return (int) dao.findForObject("MotgaCltalBsInfoManager.getMotgaCltalBsSgmtKey", map);
	}

	/**
	 * 新增   基础段
	 * @param pd
	 * @throws Exception
	 */
	public void insertMotgaCltalBsSgmt(Map<String, Object> map) throws Exception{
		dao.save("MotgaCltalBsInfoManager.insertMotgaCltalBsSgmt", map);
	}
	
	/**
	 * 修改   基础段
	 * @param pd
	 * @throws Exception
	 */
	public void updateMotgaCltalBsSgmt(Map<String, Object> map) throws Exception{
		dao.update("MotgaCltalBsInfoManager.updateMotgaCltalBsSgmt", map);
	}
	
	/**
	 * 删除   基础段  (同时会删除其他段)
	 * @param map
	 * @throws Exception
	 */
	public void deleteMotgaCltalBsSgmt(Map<String, Object> map) throws Exception{
		//基础段
		dao.delete("MotgaCltalBsInfoManager.delMotgaCltalBsSgmtById", map);
		//基本信息段
		dao.delete("MotgaCltalBsInfoManager.delCltalBsInfSgmtById", map);
		//其他债务人信息段
		dao.delete("MotgaCltalBsInfoManager.delComRecInfSgmtById", map);
		//抵押物信息段
		dao.delete("MotgaCltalBsInfoManager.delProptInfoSgmtById", map);
		//质物信息段
		dao.delete("MotgaCltalBsInfoManager.delCltalInfoSgmtById", map);
	}
	
	/**
	 * 查询 基本信息段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getMotgaCltalInfoKey(Map<String, Object> map) throws Exception{
		return (int) dao.findForObject("MotgaCltalBsInfoManager.getMotgaCltalInfoKey", map);
	}
	
	/**
	 * 新增   基本信息段
	 * @param map
	 * @throws Exception
	 */
	public void insertMotgaCltalInfo(Map<String, Object> map) throws Exception{
		dao.save("MotgaCltalBsInfoManager.insertMotgaCltalInfo", map);
	}
	
	/**
	 * 修改   基本信息段
	 * @param map
	 * @throws Exception
	 */
	public void updateMotgaCltalInfo(Map<String, Object> map) throws Exception{
		dao.update("MotgaCltalBsInfoManager.updateMotgaCltalInfo", map);
	}
	
	/**
	 * 删除   基本信息段
	 * @param map
	 * @throws Exception
	 */
	public void delMotgaCltalInfo(Map<String, Object> map) throws Exception{
		dao.delete("MotgaCltalBsInfoManager.delMotgaCltalInfo", map);
	}
	
	/**
	 * 抵（质）押合同信息 其他债务人信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> getComRecInfSgmtById(Page page) throws Exception {
		return (List<PageData>) dao.findForList("MotgaCltalBsInfoManager.getComRecInfSgmtByIdlistPage", page);
	}
	
	/**
	 * 新增   其他债务人信息段
	 * @param map
	 * @throws Exception
	 */
	public void insertComRecInfSgmt(Map<String, Object> map) throws Exception{
		map.put("UUID",UuidUtil.get32UUID());
		dao.save("MotgaCltalBsInfoManager.insertComRecInfSgmt", map);
	}
	
	/**
	 * 修改   其他债务人信息段
	 * @param map
	 * @throws Exception
	 */
	public void updateComRecInfSgmt(Map<String, Object> map) throws Exception{
		dao.update("MotgaCltalBsInfoManager.updateComRecInfSgmt", map);
	}
	
	/**
	 * 删除   其他债务人信息段
	 * @param map
	 * @throws Exception
	 */
	public void delComRecInfSgmt(Map<String, Object> map) throws Exception{
		dao.delete("MotgaCltalBsInfoManager.delComRecInfSgmt", map);
	}
	
	/**
	 * 抵（质）押合同信息 抵押物信息段 
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> getMotgaProptInfListById(Page page) throws Exception {
		return (List<PageData>) dao.findForList("MotgaCltalBsInfoManager.getMotgaProptInfByIdlistPage", page);
	}
	
	/**
	 * 新增   抵押物信息段 
	 * @param map
	 * @throws Exception
	 */
	public void insertMotgaProptInf(Map<String, Object> map) throws Exception{
		map.put("UUID",UuidUtil.get32UUID());
		dao.save("MotgaCltalBsInfoManager.insertMotgaProptInf", map);
	}
	
	/**
	 * 修改   抵押物信息段 
	 * @param map
	 * @throws Exception
	 */
	public void updateMotgaProptInf(Map<String, Object> map) throws Exception{
		dao.update("MotgaCltalBsInfoManager.updateMotgaProptInf", map);
	}
	
	/**
	 * 删除   抵押物信息段 
	 * @param map
	 * @throws Exception
	 */
	public void delMotgaProptInf(Map<String, Object> map) throws Exception{
		dao.delete("MotgaCltalBsInfoManager.delMotgaProptInf", map);
	}
	
	/**
	 * 抵（质）押合同信息 质物信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> getCltalInfListById(Page page) throws Exception {
		return (List<PageData>) dao.findForList(
				"MotgaCltalBsInfoManager.getCltalInfByIdlistPage", page);
	}
	
	/**
	 * 新增  质物信息段
	 * @param map
	 * @throws Exception
	 */
	public void insertCltalInf(Map<String, Object> map) throws Exception{
		map.put("UUID",UuidUtil.get32UUID());
		dao.save("MotgaCltalBsInfoManager.insertCltalInf", map);
	}
	
	/**
	 * 修改   质物信息段
	 * @param map
	 * @throws Exception
	 */
	public void updateCltalInf(Map<String, Object> map) throws Exception{
		dao.update("MotgaCltalBsInfoManager.updateCltalInf", map);
	}
	
	/**
	 * 删除   质物信息段
	 * @param map
	 * @throws Exception
	 */
	public void delCltalInf(Map<String, Object> map) throws Exception{
		dao.delete("MotgaCltalBsInfoManager.delCltalInf", map);
	}
	
}
