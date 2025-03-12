package com.dcits.supervise.pecr.indv.service.dataRecode.impl;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.indv.entity.GuarAcctBsSgmt;
import com.dcits.supervise.pecr.indv.entity.GuarRltRepymtInfSgmt;
import com.dcits.supervise.pecr.indv.service.dataRecode.GuarAcctInfoManager;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;

import java.util.List;
import java.util.Map;

/**
 * 个人担保账户信息
 * @author 穆楠
 *
 */
@Service("guarAcctInfoService")
public class GuarAcctInfoService implements GuarAcctInfoManager {
	@Resource(name = "daoSupportPecr")
	private DaoSupportPecr dao;

	/**
	 * 个人担保基础段   列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<GuarAcctBsSgmt> getGuarUpdateAcctBsSgmtList(Page page)
			throws Exception {
		return (List<GuarAcctBsSgmt>) dao.findForList("GuarAcctInfoManager.guarUpdateAcctInfolistPage", page);
	}

	/**
	 * 个人担保基础段   列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<GuarAcctBsSgmt> getGuarAcctBsSgmtList(Page page)
			throws Exception {
		return (List<GuarAcctBsSgmt>) dao.findForList("GuarAcctInfoManager.guarAcctInfolistPage", page);
	}

	/**
	 * 个人担保账户 基础段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> getAcctBsSgmtById(PageData pd) throws Exception {
		return (Map<String, Object>) dao.findForObject("GuarAcctInfoManager.getAcctBsSgmtById", pd);
	}
	/**
	 * 个人担保账户按段更正
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> getAcctBsSgmtByIdType(PageData pd) throws Exception {
		return (Map<String, Object>) dao.findForObject("GuarAcctInfoManager.getAcctBsSgmtByIdType", pd);
	}
	
	/**
	 * 个人担保账户按段更正 从基础段历史表中获取主键
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	public String getPdaGuarAcctBsSgmtId(Page page) throws Exception {
		return (String) dao.findForObject("GuarAcctInfoManager.getPdaGuarAcctBsSgmtId", page);
	}
	
	/**
	 * 个人担保账户 基本信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getAcctInfSgmtById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("GuarAcctInfoManager.getAcctInfSgmtById", pd);
	}
	
	/**
	 * 个人担保账户 在保责任信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getRepymtInfSgmtById(PageData pd) throws Exception {
		return (PageData) dao.findForObject(
				"GuarAcctInfoManager.getRepymtInfSgmtById", pd);
	}

	/**
	 * 个人担保账户 相关还款责任人段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<GuarRltRepymtInfSgmt> getRltInfList(Page page) throws Exception {
		return (List<GuarRltRepymtInfSgmt>) dao.findForList("GuarAcctInfoManager.getRltInflistPage", page);
	}

	/**
	 * 个人担保账户 抵质押物信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> getMccInfList(Page page) throws Exception {
		return (List<PageData>) dao.findForList("GuarAcctInfoManager.getMccInflistPage", page);
	}
	
	/**
	 * 查询 基础段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getAcctBsSgmtKey(Map<String, Object> map) throws Exception{
		return (int) dao.findForObject("GuarAcctInfoManager.getAcctBsSgmtKey", map);
	}
	
	/**
	 * 新增   个人担保账户按段更正基础段
	 * @param pd
	 * @throws Exception
	 */
	public void saveAcctBsSgmt(Map<String, Object> map) throws Exception{
		dao.save("GuarAcctInfoManager.saveAcctBsSgmt", map);
	}

	/**
	 * 新增   基础段
	 * @param pd
	 * @throws Exception
	 */
	public void insertAcctBsSgmt(Map<String, Object> map) throws Exception{
		dao.save("GuarAcctInfoManager.insertAcctBsSgmt", map);
	}
	
	/**
	 * 修改   基础段
	 * @param pd
	 * @throws Exception
	 */
	public void updateAcctBsSgmt(Map<String, Object> map) throws Exception{
		dao.update("GuarAcctInfoManager.updateAcctBsSgmt", map);
	}
	
	/**
	 * 删除   基础段  (同时会删除其他段)
	 * @param map
	 * @throws Exception
	 */
	public void deleteAcctBsSgmt(Map<String, Object> map) throws Exception{
		//基础段
		dao.delete("GuarAcctInfoManager.delAcctBsSgmtById", map);
		//基本信息段
		dao.delete("GuarAcctInfoManager.delAcctInfSgmtById", map);
		//相关还款责任人
		dao.delete("GuarAcctInfoManager.delRltSgmtById", map);
		//抵质押物信息段
		dao.delete("GuarAcctInfoManager.delMccInfoSgmtById", map);
		//在保责任信息段
		dao.delete("GuarAcctInfoManager.delRepymtInfSgmtById", map);
	}
	
	/**
	 * 查询 基本信息段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getAcctInfoSgmtKey(Map<String, Object> map) throws Exception{
		return (int) dao.findForObject("GuarAcctInfoManager.getAcctInfoSgmtKey", map);
	}
	
	/**
	 * 查询 相关还款责任人段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getRltRepymtInfKey(Map<String, Object> map) throws Exception{
		return (int) dao.findForObject("GuarAcctInfoManager.getRltRepymtInfKey", map);
	}
	
	/**
	 * 查询 抵质押物信息段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getMccInfKey(Map<String, Object> map) throws Exception{
		return (int) dao.findForObject("GuarAcctInfoManager.getMccInfKey", map);
	}
	/**
	 * 新增   个人担保账户按段更正基本信息段
	 * @param map
	 * @throws Exception
	 */
	public void saveAcctInfoSgmt(Map<String, Object> map) throws Exception{
		dao.save("GuarAcctInfoManager.saveAcctInfoSgmt", map);
	}
	/**
	 * 新增   基本信息段
	 * @param map
	 * @throws Exception
	 */
	public void insertAcctInfoSgmt(Map<String, Object> map) throws Exception{
		dao.save("GuarAcctInfoManager.insertAcctInfoSgmt", map);
	}
	
	/**
	 * 修改   基本信息段
	 * @param map
	 * @throws Exception
	 */
	public void updateAcctInfoSgmt(Map<String, Object> map) throws Exception{
		dao.update("GuarAcctInfoManager.updateAcctInfoSgmt", map);
	}
	
	/**
	 * 删除   基本信息段
	 * @param map
	 * @throws Exception
	 */
	public void delAcctInfoSgmt(Map<String, Object> map) throws Exception{
		dao.delete("GuarAcctInfoManager.delAcctInfoSgmt", map);
	}
	
	/**
	 * 新增   按段更正相关还款责任人段
	 * @param map
	 * @throws Exception
	 */
	public void saveRltRepymtInf(Map<String, Object> map) throws Exception{
		dao.save("GuarAcctInfoManager.saveRltRepymtInf", map);
	}
	/**
	 * 新增   相关还款责任人段
	 * @param map
	 * @throws Exception
	 */
	public void insertRltRepymtInf(Map<String, Object> map) throws Exception{
		dao.save("GuarAcctInfoManager.insertRltRepymtInf", map);
	}
	
	/**
	 * 修改   相关还款责任人段
	 * @param map
	 * @throws Exception
	 */
	public void updateRltRepymtInf(Map<String, Object> map) throws Exception{
		dao.update("GuarAcctInfoManager.updateRltRepymtInf", map);
	}
	
	/**
	 * 删除   相关还款责任人段
	 * @param map
	 * @throws Exception
	 */
	public void delRltRepymtInf(Map<String, Object> map) throws Exception{
		dao.delete("GuarAcctInfoManager.delRltRepymtInf", map);
	}
	
	/**
	 * 新增   按段更正抵质押物信息段
	 * @param map
	 * @throws Exception
	 */
	public void saveMccInf(Map<String, Object> map) throws Exception{
		dao.save("GuarAcctInfoManager.saveMccInf", map);
	}
	/**
	 * 新增   抵质押物信息段
	 * @param map
	 * @throws Exception
	 */
	public void insertMccInf(Map<String, Object> map) throws Exception{
		dao.save("GuarAcctInfoManager.insertMccInf", map);
	}
	
	/**
	 * 修改   抵质押物信息段
	 * @param map
	 * @throws Exception
	 */
	public void updateMccInf(Map<String, Object> map) throws Exception{
		dao.update("GuarAcctInfoManager.updateMccInf", map);
	}
	
	/**
	 * 删除   抵质押物信息段
	 * @param map
	 * @throws Exception
	 */
	public void delMccInf(Map<String, Object> map) throws Exception{
		dao.delete("GuarAcctInfoManager.delMccInf", map);
	}
	
	/**
	 * 查询  在保责任信息段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getRepymtInfSgmtKey(Map<String, Object> map) throws Exception{
		return (int) dao.findForObject("GuarAcctInfoManager.getRepymtInfSgmtKey", map);
	}
	/**
	 * 新增   个人担保账户按段 在保责任信息段
	 * @param map
	 * @throws Exception
	 */
	public void saveRepymtInfSgmt(Map<String, Object> map) throws Exception{
		dao.save("GuarAcctInfoManager.saveRepymtInfSgmt", map);
	}
	/**
	 * 新增    在保责任信息段
	 * @param map
	 * @throws Exception
	 */
	public void insertRepymtInfSgmt(Map<String, Object> map) throws Exception{
		dao.save("GuarAcctInfoManager.insertRepymtInfSgmt", map);
	}
	
	/**
	 * 修改    在保责任信息段
	 * @param map
	 * @throws Exception
	 */
	public void updateRepymtInfSgmt(Map<String, Object> map) throws Exception{
		dao.update("GuarAcctInfoManager.updateRepymtInfSgmt", map);
	}
	
	/**
	 * 删除    在保责任信息段
	 * @param map
	 * @throws Exception
	 */
	public void delRepymtInfSgmt(Map<String, Object> map) throws Exception{
		dao.delete("GuarAcctInfoManager.delRepymtInfSgmt", map);
	}
	
}
