package com.dcits.supervise.pecr.ent.service.dataRecode.impl;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.UuidUtil;
import com.dcits.supervise.pecr.ent.entity.EntAcctBsSgmt;
import com.dcits.supervise.pecr.ent.entity.EntRltRepymtSgmt;
import com.dcits.supervise.pecr.ent.service.dataRecode.EntLoanAcctInfoManager;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;

import java.util.List;
import java.util.Map;

/**
 * 企业借贷账户信息
 * @author 穆楠
 *
 */
@Service("entLoanAcctInfoService")
public class EntLoanAcctInfoService implements EntLoanAcctInfoManager {
	
	@Resource(name = "daoSupportPecr")
	private DaoSupportPecr dao;

	/**
	 * 获取企业借贷账户  基础段  列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<EntAcctBsSgmt> getLoanAcctBsSgmtList(Page page) throws Exception{
		return (List<EntAcctBsSgmt>) dao.findForList(
				"EntLoanAcctInfoManager.loanAcctInfolistPage", page);
	}
	
	/**
	 * 企业借贷账户 基础段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> getAcctBsSgmtById(PageData pd) throws Exception {
		return (Map<String, Object>) dao.findForObject("EntLoanAcctInfoManager.getAcctBsSgmtById", pd);
	}
	
	/**
	 * 企业借贷账户 基本信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getAcctBsInfSgmtById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("EntLoanAcctInfoManager.getAcctBsInfSgmtById", pd);
	}
	
	/**
	 * 企业借贷账户 授信额度信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getAcctCredSgmtById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("EntLoanAcctInfoManager.getAcctCredSgmtById", pd);
	}
	
	/**
	 * 企业借贷账户 初始债权说明段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getCreditorInfSgmtById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("EntLoanAcctInfoManager.getCreditorInfSgmtById", pd);
	}
	
	/**
	 * 企业借贷账户 还款表现信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getLbltyInfSgmtById(PageData pd) throws Exception{
		return (PageData) dao.findForObject("EntLoanAcctInfoManager.getLbltyInfSgmtById", pd);
	}
	
	/**
	 * 企业借贷账户 相关还款责任人段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<EntRltRepymtSgmt> getLoanRltSgmtById(Page page) throws Exception {
		return (List<EntRltRepymtSgmt>) dao.findForList("EntLoanAcctInfoManager.getLoanRltSgmtByIdlistPage", page);
	}

	/**
	 * 企业借贷账户 抵质押物信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> getMccInfoSgmtById(Page page) throws Exception {
		return (List<PageData>) dao.findForList("EntLoanAcctInfoManager.getMccInfoSgmtByIdlistPage", page);
	}

	/**
	 * 企业借贷账户 特殊交易说明段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> getTrstDspnSgmtById(Page page) throws Exception {
		return (List<PageData>) dao.findForList("EntLoanAcctInfoManager.getTrstDspnSgmtByIdlistPage", page);
	}
	
	/**
	 * 查询 基础段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getAcctBsSgmtKey(Map<String, Object> map) throws Exception{
		return (int) dao.findForObject("EntLoanAcctInfoManager.getAcctBsSgmtKey", map);
	}
	
	/**
	 * 新增   企业借贷账户按段更正基础段
	 * @param pd
	 * @throws Exception
	 */
	public void saveAcctBsSgmt(Map<String, Object> map) throws Exception{
		dao.save("EntLoanAcctInfoManager.saveAcctBsSgmt", map);
	}

	/**
	 * 新增   基础段
	 * @param pd
	 * @throws Exception
	 */
	public void insertAcctBsSgmt(Map<String, Object> map) throws Exception{
		dao.save("EntLoanAcctInfoManager.insertAcctBsSgmt", map);
	}
	
	/**
	 * 修改   基础段
	 * @param pd
	 * @throws Exception
	 */
	public void updateAcctBsSgmt(Map<String, Object> map) throws Exception{
		dao.update("EntLoanAcctInfoManager.updateAcctBsSgmt", map);
	}
	
	/**
	 * 删除   基础段  (同时会删除其他段)
	 * @param map
	 * @throws Exception
	 */
	public void deleteLoanAcctBsSgmt(Map<String, Object> map) throws Exception{
		//基础段
		dao.delete("EntLoanAcctInfoManager.delAcctBsSgmtById", map);
		//基本信息段
		dao.delete("EntLoanAcctInfoManager.delAcctBsInfSgmtById", map);
		//授信额度信息段
		dao.delete("EntLoanAcctInfoManager.delAcctCredSgmtById", map);
		//初始债权说明段
		dao.delete("EntLoanAcctInfoManager.delCreditorInfSgmtById", map);
		//还款表现信息段
		dao.delete("EntLoanAcctInfoManager.delLbltyInfSgmtById", map);
		//相关还款责任人段
		dao.delete("EntLoanAcctInfoManager.delLoanRltSgmtById", map);
		//抵质押物信息段
		dao.delete("EntLoanAcctInfoManager.delMccInfoSgmtById", map);
		//特殊交易说明段
		dao.delete("EntLoanAcctInfoManager.delTrstDspnSgmtById", map);
	}
	
	/**
	 * 查询 基本信息段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getAcctBsInfoSgmtKey(Map<String, Object> map) throws Exception{
		return (int) dao.findForObject("EntLoanAcctInfoManager.getAcctBsInfoSgmtKey", map);
	}
	
	/**
	 * 新增   企业借贷账户按段更正基本信息段
	 * @param map
	 * @throws Exception
	 */
	public void saveAcctBsInfoSgmt(Map<String, Object> map) throws Exception{
		map.put("UUID",UuidUtil.get32UUID());
		dao.save("EntLoanAcctInfoManager.saveAcctBsInfoSgmt", map);
	}
	
	/**
	 * 新增   基本信息段
	 * @param map
	 * @throws Exception
	 */
	public void insertAcctBsInfoSgmt(Map<String, Object> map) throws Exception{
		dao.save("EntLoanAcctInfoManager.insertAcctBsInfoSgmt", map);
	}
	
	/**
	 * 修改   基本信息段
	 * @param map
	 * @throws Exception
	 */
	public void updateAcctBsInfoSgmt(Map<String, Object> map) throws Exception{
		dao.update("EntLoanAcctInfoManager.updateAcctBsInfoSgmt", map);
	}
	
	/**
	 * 删除   基本信息段
	 * @param map
	 * @throws Exception
	 */
	public void delAcctBsInfoSgmt(Map<String, Object> map) throws Exception{
		dao.delete("EntLoanAcctInfoManager.delAcctBsInfoSgmt", map);
	}
	/**
	 * 新增  企业借贷按段更正相关还款责任人段
	 * @param map
	 * @throws Exception
	 */
	public void saveRltRepymtInf(Map<String, Object> map) throws Exception{
		map.put("UUID",UuidUtil.get32UUID());
		dao.save("EntLoanAcctInfoManager.saveRltRepymtInf", map);
	}
	/**
	 * 新增   相关还款责任人段
	 * @param map
	 * @throws Exception
	 */
	public void insertRltRepymtInf(Map<String, Object> map) throws Exception{
		dao.save("EntLoanAcctInfoManager.insertRltRepymtInf", map);
	}
	
	/**
	 * 修改   相关还款责任人段
	 * @param map
	 * @throws Exception
	 */
	public void updateRltRepymtInf(Map<String, Object> map) throws Exception{
		dao.update("EntLoanAcctInfoManager.updateRltRepymtInf", map);
	}
	
	/**
	 * 删除   相关还款责任人段
	 * @param map
	 * @throws Exception
	 */
	public void delRltRepymtInf(Map<String, Object> map) throws Exception{
		dao.delete("EntLoanAcctInfoManager.delRltRepymtInf", map);
	}
	
	/**
	 * 查询 还款表现信息段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getLbltyInfSgmtKey(Map<String, Object> map) throws Exception{
		return (int) dao.findForObject("EntLoanAcctInfoManager.getLbltyInfSgmtKey", map);
	}
	
	/**
	 * 新增   企业借贷账户按段更正还款表现信息段
	 * @param map
	 * @throws Exception
	 */
	public void saveLbltyInfSgmt(Map<String, Object> map) throws Exception{
		map.put("UUID",UuidUtil.get32UUID());
		dao.save("EntLoanAcctInfoManager.saveLbltyInfSgmt", map);
	}
	
	/**
	 * 新增   还款表现信息段
	 * @param map
	 * @throws Exception
	 */
	public void insertLbltyInfSgmt(Map<String, Object> map) throws Exception{
		dao.save("EntLoanAcctInfoManager.insertLbltyInfSgmt", map);
	}
	
	/**
	 * 修改   还款表现信息段
	 * @param map
	 * @throws Exception
	 */
	public void updateLbltyInfSgmt(Map<String, Object> map) throws Exception{
		dao.update("EntLoanAcctInfoManager.updateLbltyInfSgmt", map);
	}
	
	/**
	 * 删除   还款表现信息段
	 * @param map
	 * @throws Exception
	 */
	public void delLbltyInfSgmt(Map<String, Object> map) throws Exception{
		dao.delete("EntLoanAcctInfoManager.delLbltyInfSgmt", map);
	}
	/**
	 * 新增   企业借贷按段更正抵质押物信息段
	 * @param map
	 * @throws Exception
	 */
	public void saveMccInf(Map<String, Object> map) throws Exception{
		map.put("UUID",UuidUtil.get32UUID());
		dao.save("EntLoanAcctInfoManager.saveMccInf", map);
	}
	/**
	 * 新增   抵质押物信息段
	 * @param map
	 * @throws Exception
	 */
	public void insertMccInf(Map<String, Object> map) throws Exception{
		dao.save("EntLoanAcctInfoManager.insertMccInf", map);
	}
	
	/**
	 * 修改   抵质押物信息段
	 * @param map
	 * @throws Exception
	 */
	public void updateMccInf(Map<String, Object> map) throws Exception{
		dao.update("EntLoanAcctInfoManager.updateMccInf", map);
	}
	
	/**
	 * 删除   抵质押物信息段
	 * @param map
	 * @throws Exception
	 */
	public void delMccInf(Map<String, Object> map) throws Exception{
		dao.delete("EntLoanAcctInfoManager.delMccInf", map);
	}
	
	/**
	 * 查询  授信额度信息段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getAcctCredSgmtKey(Map<String, Object> map) throws Exception{
		return (int) dao.findForObject("EntLoanAcctInfoManager.getAcctCredSgmtKey", map);
	}
	
	/**
	 * 新增    企业借贷账户按段更正授信额度信息段
	 * @param map
	 * @throws Exception
	 */
	public void saveAcctCredSgmt(Map<String, Object> map) throws Exception{
		map.put("UUID",UuidUtil.get32UUID());
		dao.save("EntLoanAcctInfoManager.saveAcctCredSgmt", map);
	}
	
	/**
	 * 新增    授信额度信息段
	 * @param map
	 * @throws Exception
	 */
	public void insertAcctCredSgmt(Map<String, Object> map) throws Exception{
		dao.save("EntLoanAcctInfoManager.insertAcctCredSgmt", map);
	}
	
	/**
	 * 修改    授信额度信息段
	 * @param map
	 * @throws Exception
	 */
	public void updateAcctCredSgmt(Map<String, Object> map) throws Exception{
		dao.update("EntLoanAcctInfoManager.updateAcctCredSgmt", map);
	}
	
	/**
	 * 删除    授信额度信息段
	 * @param map
	 * @throws Exception
	 */
	public void delAcctCredSgmt(Map<String, Object> map) throws Exception{
		dao.delete("EntLoanAcctInfoManager.delAcctCredSgmt", map);
	}
	/**
	 * 新增  按段更正特殊交易说明段
	 * @param map
	 * @throws Exception
	 */
	public void saveTrstDspn(Map<String, Object> map) throws Exception{
		map.put("UUID",UuidUtil.get32UUID());
		dao.save("EntLoanAcctInfoManager.saveTrstDspn", map);
	}
	/**
	 * 新增  特殊交易说明段
	 * @param map
	 * @throws Exception
	 */
	public void insertTrstDspn(Map<String, Object> map) throws Exception{
		dao.save("EntLoanAcctInfoManager.insertTrstDspn", map);
	}
	
	/**
	 * 修改   特殊交易说明段
	 * @param map
	 * @throws Exception
	 */
	public void updateTrstDspn(Map<String, Object> map) throws Exception{
		dao.update("EntLoanAcctInfoManager.updateTrstDspn", map);
	}
	
	/**
	 * 删除   特殊交易说明段
	 * @param map
	 * @throws Exception
	 */
	public void delTrstDspn(Map<String, Object> map) throws Exception{
		dao.delete("EntLoanAcctInfoManager.delTrstDspn", map);
	}
	
	/**
	 * 查询  初始债权说明段  主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getOcInfSgmtKey(Map<String, Object> map) throws Exception{
		return (int) dao.findForObject("EntLoanAcctInfoManager.getOcInfSgmtKey", map);
	}
	
	/**
	 * 新增   企业借贷账户按段更正初始债权说明段
	 * @param map
	 * @throws Exception
	 */
	public void saveOcInfSgmt(Map<String, Object> map) throws Exception{
		map.put("UUID",UuidUtil.get32UUID());
		dao.save("EntLoanAcctInfoManager.saveOcInfSgmt", map);
	}
	
	/**
	 * 新增   初始债权说明段
	 * @param map
	 * @throws Exception
	 */
	public void insertOcInfSgmt(Map<String, Object> map) throws Exception{
		dao.save("EntLoanAcctInfoManager.insertOcInfSgmt", map);
	}
	
	/**
	 * 修改   初始债权说明段
	 * @param map
	 * @throws Exception
	 */
	public void updateOcInfSgmt(Map<String, Object> map) throws Exception{
		dao.update("EntLoanAcctInfoManager.updateOcInfSgmt", map);
	}
	
	/**
	 * 删除   初始债权说明段
	 * @param map
	 * @throws Exception
	 */
	public void delOcInfSgmt(Map<String, Object> map) throws Exception{
		dao.delete("EntLoanAcctInfoManager.delOcInfSgmt", map);
	}
	/**
	 * 主键是否存在 特殊交易说明段
	 * @param map
	 * @throws Exception
	 */
	@Override
    public int getTrstDspnSgmtKey(Map<String, Object> map) throws Exception {
        return (int) dao.findForObject("EntLoanAcctInfoManager.getTrstDspnSgmtKey", map);
    }
	/**
	 * 主键是否存在 相关还款责任人段
	 * @param map
	 * @throws Exception
	 */
	@Override
    public int getRltRepymtInfKey(Map<String, Object> map) throws Exception {
        return (int) dao.findForObject("EntLoanAcctInfoManager.getRltRepymtInfKey", map);
    }
	/**
	 *企业借贷账户按段更正 获取基础段历史表中的主键
	 * @param map
	 * @throws Exception
	 */
	@Override
    public String getEdaAcctBsSgmtId(Page page) throws Exception {
        return (String) dao.findForObject("EntLoanAcctInfoManager.getEdaAcctBsSgmtId", page);
    }
	/**
	 * 企业借贷账户按段更正信息
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> getAcctBsSgmtByIdType(PageData pd) throws Exception {
		return (Map<String, Object>) dao.findForObject("EntLoanAcctInfoManager.getAcctBsSgmtByIdType", pd);
	}
	/**
	 * 主键是否存在 抵质押物信息段
	 * @param map
	 * @throws Exception
	 */
	@Override
    public int getmccInfKey(Map<String, Object> map) throws Exception {
        return (int) dao.findForObject("EntLoanAcctInfoManager.getmccInfKey", map);
    }

	@Override
	public List<EntAcctBsSgmt> getUpLoanAcctBsSgmtList(Page page) throws Exception {
		return (List<EntAcctBsSgmt>) dao.findForList("EntLoanAcctInfoManager.loanAcctUpdatelistPage", page);
	}

	@Override
	public List<PageData> findHistEntAcctList(Page page) throws Exception {
		return (List<PageData>) dao.findForList("EntLoanAcctInfoManager.findHistEntAcctlistPage", page);
	}
}
