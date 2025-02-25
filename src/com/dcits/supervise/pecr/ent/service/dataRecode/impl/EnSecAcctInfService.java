package com.dcits.supervise.pecr.ent.service.dataRecode.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.UuidUtil;
import com.dcits.supervise.pecr.ent.entity.EnSecAcctInf;
import com.dcits.supervise.pecr.ent.service.dataRecode.EnSecAcctInfManager;

/**
 * 担保账户信息
 * @author leizx
 *
 */
@Service("enSecAcctInfService")
public class EnSecAcctInfService implements EnSecAcctInfManager {

	@Resource(name = "daoSupportPecr")
	private DaoSupportPecr dao;

	/**
	 * 担保基础段   列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<EnSecAcctInf> getenSecAcctInfList(Page page)
			throws Exception {
		return (List<EnSecAcctInf>) dao.findForList("EnSecAcctInfMapper.enSecAcctInflistPage", page);
	}


	/**
	 * 担保基础段   列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<EnSecAcctInf> getEnList(Page page)
			throws Exception {
		return (List<EnSecAcctInf>) dao.findForList("EnSecAcctInfMapper.enInflistPage", page);
	}
	/**
	 * 担保账户按段更正 获取基础段历史表中的主键
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	public String getEeaGuarAcctBsSgmtId(Page page) throws Exception {
		return (String) dao.findForObject("EnSecAcctInfMapper.getEeaGuarAcctBsSgmtId", page);
	}
	/**
	 * 担保账户按段更正 基础段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> getenSecAcctInfByIdType(PageData pd) throws Exception {
		return (Map<String, Object>) dao.findForObject("EnSecAcctInfMapper.getenSecAcctInfByIdType", pd);
	}
	/**
	 * 担保账户 基础段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> getenSecAcctInfById(PageData pd) throws Exception {
		return (Map<String, Object>) dao.findForObject("EnSecAcctInfMapper.getenSecAcctInfById", pd);
	}

	/**
	 * 担保账户 基本信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getGuarAcctBsInfSgmtById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("EnSecAcctInfMapper.getGuarAcctBsInfSgmtById", pd);
	}
	
	/**
	 * 担保账户 账户信息授信额度信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getacctCredSgmtById(PageData pd) throws Exception {
		return (PageData) dao.findForObject(
				"EnSecAcctInfMapper.getacctCredSgmtById", pd);
	}
	
	/**
	 * 担保账户 在保责任信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getRepymtInfSgmtById(PageData pd) throws Exception {
		return (PageData) dao.findForObject(
				"EnSecAcctInfMapper.getRepymtInfSgmtById", pd);
	}

	/**
	 * 担保账户 相关还款责任人段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> getRltInfList(Page page) throws Exception {
		return (List<PageData>) dao.findForList("EnSecAcctInfMapper.getRltInflistPage", page);
	}

	/**
	 * 担保账户 抵质押物信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> getMccInfList(Page page) throws Exception {
		return (List<PageData>) dao.findForList("EnSecAcctInfMapper.getMccInflistPage", page);
	}
	
	/**
	 * 查询 基础段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getEnSecAcctInfKey(Map<String, Object> map) throws Exception{
		return (int) dao.findForObject("EnSecAcctInfMapper.getEnSecAcctInfKey", map);
	}
	
	/**
	 * 新增   企业担保账户按段更正基础段
	 * @param pd
	 * @throws Exception
	 */
	public void saveEnSecAcctInf(Map<String, Object> map) throws Exception{
		dao.save("EnSecAcctInfMapper.saveEnSecAcctInf", map);
	}

	/**
	 * 新增   基础段
	 * @param pd
	 * @throws Exception
	 */
	public void insertEnSecAcctInf(Map<String, Object> map) throws Exception{
		dao.save("EnSecAcctInfMapper.insertEnSecAcctInf", map);
	}
	
	/**
	 * 修改   基础段
	 * @param pd
	 * @throws Exception
	 */
	public void updateEnSecAcctInf(Map<String, Object> map) throws Exception{
		dao.update("EnSecAcctInfMapper.updateEnSecAcctInf", map);
	}
	
	/**
	 * 删除   基础段  (同时会删除其他段)
	 * @param map
	 * @throws Exception
	 */
	public void delEnSecAcctInfById(Map<String, Object> map) throws Exception{
		//基础段
		dao.delete("EnSecAcctInfMapper.delEnSecAcctInfById", map);
		//基本信息段
		dao.delete("EnSecAcctInfMapper.delAcctInfSgmtById", map);
		//相关还款责任人
		dao.delete("EnSecAcctInfMapper.delRltSgmtById", map);
		//抵质押物信息段
		dao.delete("EnSecAcctInfMapper.delMccInfoSgmtById", map);
		//在保责任信息段
		dao.delete("EnSecAcctInfMapper.delRepymtInfSgmtById", map);
	}
	
	/**
	 * 查询 基本信息段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getGuarAcctBsInfSgmtKey(Map<String, Object> map) throws Exception{
		return (int) dao.findForObject("EnSecAcctInfMapper.getGuarAcctBsInfSgmtKey", map);
	}
	
	/**
	 * 新增   企业担保按段更正基本信息段
	 * @param map
	 * @throws Exception
	 */
	public void saveGuarAcctBsInfSgmt(Map<String, Object> map) throws Exception{
		map.put("UUID",UuidUtil.get32UUID());
		dao.save("EnSecAcctInfMapper.saveGuarAcctBsInfSgmt", map);
	}
	
	/**
	 * 新增   基本信息段
	 * @param map
	 * @throws Exception
	 */
	public void insertGuarAcctBsInfSgmt(Map<String, Object> map) throws Exception{
		dao.save("EnSecAcctInfMapper.insertGuarAcctBsInfSgmt", map);
	}
	
	/**
	 * 修改   基本信息段
	 * @param map
	 * @throws Exception
	 */
	public void updateGuarAcctBsInfSgmt(Map<String, Object> map) throws Exception{
		dao.update("EnSecAcctInfMapper.updateGuarAcctBsInfSgmt", map);
	}
	
	/**
	 * 删除   基本信息段
	 * @param map
	 * @throws Exception
	 */
	public void delGuarAcctBsInfSgmt(Map<String, Object> map) throws Exception{
		dao.delete("EnSecAcctInfMapper.delGuarAcctBsInfSgmt", map);
	}
	/**
	 * 新增   企业担保按段更正相关还款责任人段
	 * @param map
	 * @throws Exception
	 */
	public void saveRltRepymtInf(Map<String, Object> map) throws Exception{
		map.put("UUID",UuidUtil.get32UUID());
		dao.save("EnSecAcctInfMapper.saveRltRepymtInf", map);
	}
	/**
	 * 新增   相关还款责任人段
	 * @param map
	 * @throws Exception
	 */
	public void insertRltRepymtInf(Map<String, Object> map) throws Exception{
		dao.save("EnSecAcctInfMapper.insertRltRepymtInf", map);
	}
	
	/**
	 * 修改   相关还款责任人段
	 * @param map
	 * @throws Exception
	 */
	public void updateRltRepymtInf(Map<String, Object> map) throws Exception{
		dao.update("EnSecAcctInfMapper.updateRltRepymtInf", map);
	}
	
	/**
	 * 删除   相关还款责任人段
	 * @param map
	 * @throws Exception
	 */
	public void delRltRepymtInf(Map<String, Object> map) throws Exception{
		dao.delete("EnSecAcctInfMapper.delRltRepymtInf", map);
	}
	/**
	 * 新增   企业担保品按段更正抵质押物信息段
	 * @param map
	 * @throws Exception
	 */
	public void saveMccInf(Map<String, Object> map) throws Exception{
		map.put("UUID",UuidUtil.get32UUID());
		dao.save("EnSecAcctInfMapper.saveMccInf", map);
	}
	/**
	 * 新增   抵质押物信息段
	 * @param map
	 * @throws Exception
	 */
	public void insertMccInf(Map<String, Object> map) throws Exception{
		dao.save("EnSecAcctInfMapper.insertMccInf", map);
	}
	
	/**
	 * 修改   抵质押物信息段
	 * @param map
	 * @throws Exception
	 */
	public void updateMccInf(Map<String, Object> map) throws Exception{
		dao.update("EnSecAcctInfMapper.updateMccInf", map);
	}
	
	/**
	 * 删除   抵质押物信息段
	 * @param map
	 * @throws Exception
	 */
	public void delMccInf(Map<String, Object> map) throws Exception{
		dao.delete("EnSecAcctInfMapper.delMccInf", map);
	}
	
	/**
	 * 查询  在保责任信息段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getRepymtInfSgmtKey(Map<String, Object> map) throws Exception{
		return (int) dao.findForObject("EnSecAcctInfMapper.getRepymtInfSgmtKey", map);
	}
	
	/**
	 * 新增    企业担保账户按段更正在保责任信息段
	 * @param map
	 * @throws Exception
	 */
	public void saveRepymtInfSgmt(Map<String, Object> map) throws Exception{
		map.put("UUID",UuidUtil.get32UUID());
		dao.save("EnSecAcctInfMapper.saveRepymtInfSgmt", map);
	}
	
	/**
	 * 新增    在保责任信息段
	 * @param map
	 * @throws Exception
	 */
	public void insertRepymtInfSgmt(Map<String, Object> map) throws Exception{
		dao.save("EnSecAcctInfMapper.insertRepymtInfSgmt", map);
	}
	
	/**
	 * 修改    在保责任信息段
	 * @param map
	 * @throws Exception
	 */
	public void updateRepymtInfSgmt(Map<String, Object> map) throws Exception{
		dao.update("EnSecAcctInfMapper.updateRepymtInfSgmt", map);
	}
	
	/**
	 * 删除    在保责任信息段
	 * @param map
	 * @throws Exception
	 */
	public void delRepymtInfSgmt(Map<String, Object> map) throws Exception{
		dao.delete("EnSecAcctInfMapper.delRepymtInfSgmt", map);
	}
	
	/**
	 * 查询  账户信息授信额度信息段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getAcctCredSgmtKey(Map<String, Object> map) throws Exception{
		return (int) dao.findForObject("EnSecAcctInfMapper.getAcctCredSgmtKey", map);
	}
	
	/**
	 * 新增    企业担保账户按段更正账户信息授信额度信息段
	 * @param map
	 * @throws Exception
	 */
	public void saveAcctCredSgmt(Map<String, Object> map) throws Exception{
		map.put("UUID",UuidUtil.get32UUID());
		dao.save("EnSecAcctInfMapper.saveAcctCredSgmt", map);
	}
	
	/**
	 * 新增    账户信息授信额度信息段
	 * @param map
	 * @throws Exception
	 */
	public void insertAcctCredSgmt(Map<String, Object> map) throws Exception{
		dao.save("EnSecAcctInfMapper.insertAcctCredSgmt", map);
	}
	
	/**
	 * 修改    账户信息授信额度信息段
	 * @param map
	 * @throws Exception
	 */
	public void updateAcctCredSgmt(Map<String, Object> map) throws Exception{
		dao.update("EnSecAcctInfMapper.updateAcctCredSgmt", map);
	}
	
	/**
	 * 删除    账户信息授信额度信息段
	 * @param map
	 * @throws Exception
	 */
	public void delAcctCredSgmt(Map<String, Object> map) throws Exception{
		dao.delete("EnSecAcctInfMapper.delAcctCredSgmt", map);
	}


	@Override
	public int getRltRepymtInfKey(Map<String, Object> map) throws Exception {
		return (int) dao.findForObject("EnSecAcctInfMapper.getRltRepymtInfKey", map);
	}


	@Override
	public int getMccInfKey(Map<String, Object> map) throws Exception {
		return (int) dao.findForObject("EnSecAcctInfMapper.getMccInfKey", map);
	}


	@Override
	public List<PageData> findHistEntGuaranteeList(Page page) throws Exception {
		return (List<PageData>) dao.findForList("EnSecAcctInfMapper.findHistEntGuaranteelistPage", page);
	}
}
