package com.dcits.supervise.pecr.indv.service.dataRecode.impl;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.indv.entity.LoanAcctBsSgmt;
import com.dcits.supervise.pecr.indv.entity.LoanAcctRltInfSgmt;
import com.dcits.supervise.pecr.indv.service.dataRecode.LoanAcctInfoManager;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;

import java.util.List;
import java.util.Map;

@Service("loanAcctInfoService")
public class LoanAcctInfoService implements LoanAcctInfoManager {
	@Resource(name = "daoSupportPecr")
	private DaoSupportPecr dao;

	// 查询个人借贷账户信息 基础段列表
	@SuppressWarnings("unchecked")
	@Override
	public List<LoanAcctBsSgmt> getLoanAcctBsSgmtList(Page page)
			throws Exception {
		return (List<LoanAcctBsSgmt>) dao.findForList(
				"LoanAcctInfoManager.loanAcctInfolistPage", page);
	}
    
	// 查询个人借贷账户信息 基础段列表
		@SuppressWarnings("unchecked")
		@Override
		public List<LoanAcctBsSgmt> getLoanAcctUpdateBsSgmtList(Page page)
				throws Exception {
			return (List<LoanAcctBsSgmt>) dao.findForList(
					"LoanAcctInfoManager.loanAcctUpdatelistPage", page);
		}
	
	/**
	 * 个人借贷账户 基础段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> getAcctBsSgmtById(PageData pd) throws Exception {
		return (Map<String, Object>) dao.findForObject("LoanAcctInfoManager.getAcctBsSgmtById", pd);
	}
	
	/**
	 * 个人借贷账户按段更正请求记录 获取基础段历史表中的主键
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	public String getPbaAcctBsSgmtId(Page page) throws Exception {
		return (String) dao.findForObject("LoanAcctInfoManager.getPbaAcctBsSgmtId", page);
	}
	
	/**
	 * 个人借贷账户按段更正信息
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> getAcctBsSgmtByIdType(PageData pd) throws Exception {
		return (Map<String, Object>) dao.findForObject("LoanAcctInfoManager.getAcctBsSgmtByIdType", pd);
	}

	/**
	 * 个人借贷账户 基本信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getAcctBsInfSgmtById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("LoanAcctInfoManager.getAcctBsInfSgmtById", pd);
	}

	/**
	 * 个人借贷账户 相关还款责任人段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<LoanAcctRltInfSgmt> getLoanRltSgmtById(Page page) throws Exception {
		return (List<LoanAcctRltInfSgmt>) dao.findForList(
				"LoanAcctInfoManager.getLoanRltSgmtByIdlistPage", page);
	}

	/**
	 * 个人借贷账户 抵质押物信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> getMccInfoSgmtById(Page page) throws Exception {
		return (List<PageData>) dao.findForList(
				"LoanAcctInfoManager.getMccInfoSgmtByIdlistPage", page);
	}

	/**
	 * 个人借贷账户 授信额度信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getAcctCredSgmtById(PageData pd) throws Exception {
		return (PageData) dao.findForObject(
				"LoanAcctInfoManager.getAcctCredSgmtById", pd);
	}

	/**
	 * 个人借贷账户 初始债权说明段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getOcInfoSgmtById(PageData pd) throws Exception {
		return (PageData) dao.findForObject(
				"LoanAcctInfoManager.getOcInfoSgmtById", pd);
	}

	/**
	 * 个人借贷账户 月度表现信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getAmblgInfoSgmtById(PageData pd) throws Exception {
		return (PageData) dao.findForObject(
				"LoanAcctInfoManager.getAmblgInfoSgmtById", pd);
	}

	/**
	 * 个人借贷账户 大额专项分期信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getSpecPrdSgmtById(PageData pd) throws Exception {
		return (PageData) dao.findForObject(
				"LoanAcctInfoManager.getSpecPrdSgmtById", pd);
	}

	/**
	 * 个人借贷账户 非月度表现信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getAcctDbtInfSgmtById(PageData pd) throws Exception {
		return (PageData) dao.findForObject(
				"LoanAcctInfoManager.getAcctDbtInfSgmtById", pd);
	}

	/**
	 * 个人借贷账户 特殊交易说明段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> getTrstDspnSgmtById(Page page) throws Exception {
		return (List<PageData>) dao.findForList(
				"LoanAcctInfoManager.getTrstDspnSgmtByIdlistPage", page);
	}
	
	/**
	 * 查询 基础段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getAcctBsSgmtKey(Map<String, Object> map) throws Exception{
		return (int) dao.findForObject("LoanAcctInfoManager.getAcctBsSgmtKey", map);
	}
	
	/**
	 * 新增   个人借贷账户按段更正基础段
	 * @param pd
	 * @throws Exception
	 */
	public void saveAcctBsSgmt(Map<String, Object> map) throws Exception{
		dao.save("LoanAcctInfoManager.saveAcctBsSgmt", map);
	}

	/**
	 * 新增   基础段
	 * @param pd
	 * @throws Exception
	 */
	public void insertAcctBsSgmt(Map<String, Object> map) throws Exception{
		dao.save("LoanAcctInfoManager.insertAcctBsSgmt", map);
	}
	
	/**
	 * 修改   基础段
	 * @param pd
	 * @throws Exception
	 */
	public void updateAcctBsSgmt(Map<String, Object> map) throws Exception{
		dao.update("LoanAcctInfoManager.updateAcctBsSgmt", map);
	}
	
	/**
	 * 删除   基础段  (同时会删除其他段)
	 * @param map
	 * @throws Exception
	 */
	public void deleteLoanAcctBsSgmt(Map<String, Object> map) throws Exception{
		dao.delete("LoanAcctInfoManager.delAcctBsSgmtById", map);
		dao.delete("LoanAcctInfoManager.delAcctBsInfSgmtById", map);
		dao.delete("LoanAcctInfoManager.delLoanRltSgmtById", map);
		dao.delete("LoanAcctInfoManager.delMccInfoSgmtById", map);
		dao.delete("LoanAcctInfoManager.delAcctCredSgmtById", map);
		dao.delete("LoanAcctInfoManager.delOcInfoSgmtById", map);
		dao.delete("LoanAcctInfoManager.delAmblgInfoSgmtById", map);
		dao.delete("LoanAcctInfoManager.delSpecPrdSgmtById", map);
		dao.delete("LoanAcctInfoManager.delAcctDbtInfSgmtById", map);
		dao.delete("LoanAcctInfoManager.delTrstDspnSgmtById", map);
	}
	
	/**
	 * 查询 基本信息段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getAcctBsInfoSgmtKey(Map<String, Object> map) throws Exception{
		return (int) dao.findForObject("LoanAcctInfoManager.getAcctBsInfoSgmtKey", map);
	}
	
	/**
	 * 新增   个人借贷账户按段更正基本信息段
	 * @param map
	 * @throws Exception
	 */
	public void saveAcctBsInfoSgmt(Map<String, Object> map) throws Exception{
		dao.save("LoanAcctInfoManager.saveAcctBsInfoSgmt", map);
	}
	
	/**
	 * 新增   基本信息段
	 * @param map
	 * @throws Exception
	 */
	public void insertAcctBsInfoSgmt(Map<String, Object> map) throws Exception{
		dao.save("LoanAcctInfoManager.insertAcctBsInfoSgmt", map);
	}
	
	/**
	 * 修改   基本信息段
	 * @param map
	 * @throws Exception
	 */
	public void updateAcctBsInfoSgmt(Map<String, Object> map) throws Exception{
		dao.update("LoanAcctInfoManager.updateAcctBsInfoSgmt", map);
	}
	
	/**
	 * 删除   基本信息段
	 * @param map
	 * @throws Exception
	 */
	public void delAcctBsInfoSgmt(Map<String, Object> map) throws Exception{
		dao.delete("LoanAcctInfoManager.delAcctBsInfoSgmt", map);
	}
	/**
	 * 新增  个人借贷按段更正相关还款责任人段
	 * @param map
	 * @throws Exception
	 */
	public void saveRltRepymtInf(Map<String, Object> map) throws Exception{
		dao.save("LoanAcctInfoManager.saveRltRepymtInf", map);
	}
	
	/**
	 * 新增   相关还款责任人段
	 * @param map
	 * @throws Exception
	 */
	public void insertRltRepymtInf(Map<String, Object> map) throws Exception{
		dao.save("LoanAcctInfoManager.insertRltRepymtInf", map);
	}
	
	/**
	 * 修改   相关还款责任人段
	 * @param map
	 * @throws Exception
	 */
	public void updateRltRepymtInf(Map<String, Object> map) throws Exception{
		dao.update("LoanAcctInfoManager.updateRltRepymtInf", map);
	}
	
	/**
	 * 删除   相关还款责任人段
	 * @param map
	 * @throws Exception
	 */
	public void delrltRepymtInf(Map<String, Object> map) throws Exception{
		dao.delete("LoanAcctInfoManager.delrltRepymtInf", map);
	}
	/**
	 * 新增   抵质押物信息段
	 * @param map
	 * @throws Exception
	 */
	public void saveMccInf(Map<String, Object> map) throws Exception{
		dao.save("LoanAcctInfoManager.saveMccInf", map);
	}
	
	/**
	 * 新增   抵质押物信息段
	 * @param map
	 * @throws Exception
	 */
	public void insertMccInf(Map<String, Object> map) throws Exception{
		dao.save("LoanAcctInfoManager.insertMccInf", map);
	}
	
	/**
	 * 修改   抵质押物信息段
	 * @param map
	 * @throws Exception
	 */
	public void updateMccInf(Map<String, Object> map) throws Exception{
		dao.update("LoanAcctInfoManager.updateMccInf", map);
	}
	
	/**
	 * 删除   抵质押物信息段
	 * @param map
	 * @throws Exception
	 */
	public void delMccInf(Map<String, Object> map) throws Exception{
		dao.delete("LoanAcctInfoManager.delMccInf", map);
	}
	
	/**
	 * 查询  授信额度信息段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getAcctCredSgmtKey(Map<String, Object> map) throws Exception{
		return (int) dao.findForObject("LoanAcctInfoManager.getAcctCredSgmtKey", map);
	}
	
	/**
	 * 获取新的随机号
	 */
	public String getUUid(Map<String, Object> map) throws Exception {
		return (String) dao.findForObject("LoanAcctInfoManager.getUUid", map);
	}
	/**
	 * 查询  相关还款责任人 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getrltRepymtInfKey(Map<String, Object> map) throws Exception{
		return (int) dao.findForObject("LoanAcctInfoManager.getrltRepymtInfKey", map);
	}
	/**
	 * 新增   个人借贷账户按段更正授信额度信息段
	 * @param map
	 * @throws Exception
	 */
	public void saveAcctCredSgmt(Map<String, Object> map) throws Exception{
		dao.save("LoanAcctInfoManager.saveAcctCredSgmt", map);
	}
	/**
	 * 新增    授信额度信息段
	 * @param map
	 * @throws Exception
	 */
	public void insertAcctCredSgmt(Map<String, Object> map) throws Exception{
		dao.save("LoanAcctInfoManager.insertAcctCredSgmt", map);
	}
	
	/**
	 * 修改    授信额度信息段
	 * @param map
	 * @throws Exception
	 */
	public void updateAcctCredSgmt(Map<String, Object> map) throws Exception{
		dao.update("LoanAcctInfoManager.updateAcctCredSgmt", map);
	}
	
	/**
	 * 删除    授信额度信息段
	 * @param map
	 * @throws Exception
	 */
	public void delAcctCredSgmt(Map<String, Object> map) throws Exception{
		dao.delete("LoanAcctInfoManager.delAcctCredSgmt", map);
	}
	
	/**
	 * 查询 月度表现信息段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getAmblgInfSgmtKey(Map<String, Object> map) throws Exception{
		return (int) dao.findForObject("LoanAcctInfoManager.getAmblgInfSgmtKey", map);
	}
	
	/**
	 * 新增   个人借贷账户按段更正月度表现信息段
	 * @param map
	 * @throws Exception
	 */
	public void saveAmblgInfSgmt(Map<String, Object> map) throws Exception{
		dao.save("LoanAcctInfoManager.saveAmblgInfSgmt", map);
	}
	
	/**
	 * 新增   月度表现信息段
	 * @param map
	 * @throws Exception
	 */
	public void insertAmblgInfSgmt(Map<String, Object> map) throws Exception{
		dao.save("LoanAcctInfoManager.insertAmblgInfSgmt", map);
	}
	
	/**
	 * 修改   月度表现信息段
	 * @param map
	 * @throws Exception
	 */
	public void updateAmblgInfSgmt(Map<String, Object> map) throws Exception{
		dao.update("LoanAcctInfoManager.updateAmblgInfSgmt", map);
	}
	
	/**
	 * 删除   月度表现信息段
	 * @param map
	 * @throws Exception
	 */
	public void delAmblgInfSgmt(Map<String, Object> map) throws Exception{
		dao.delete("LoanAcctInfoManager.delAmblgInfSgmt", map);
	}
	
	/**
	 * 查询 非月度表现信息段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getAcctDbtInfSgmtKey(Map<String, Object> map) throws Exception{
		return (int) dao.findForObject("LoanAcctInfoManager.getAcctDbtInfSgmtKey", map);
	}
	
	/**
	 * 新增   个人借贷按段更正非月度表现信息段
	 * @param map
	 * @throws Exception
	 */
	public void saveAcctDbtInfSgmt(Map<String, Object> map) throws Exception{
		dao.save("LoanAcctInfoManager.saveAcctDbtInfSgmt", map);
	}
	
	/**
	 * 新增   非月度表现信息段
	 * @param map
	 * @throws Exception
	 */
	public void insertAcctDbtInfSgmt(Map<String, Object> map) throws Exception{
		dao.save("LoanAcctInfoManager.insertAcctDbtInfSgmt", map);
	}
	
	/**
	 * 修改   非月度表现信息段
	 * @param map
	 * @throws Exception
	 */
	public void updateAcctDbtInfSgmt(Map<String, Object> map) throws Exception{
		dao.update("LoanAcctInfoManager.updateAcctDbtInfSgmt", map);
	}
	
	/**
	 * 删除   非月度表现信息段
	 * @param map
	 * @throws Exception
	 */
	public void delAcctDbtInfSgmt(Map<String, Object> map) throws Exception{
		dao.delete("LoanAcctInfoManager.delAcctDbtInfSgmt", map);
	}
	
	/**
	 * 查询 大额专项分期信息段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getSpecPrdSgmtKey(Map<String, Object> map) throws Exception{
		return (int) dao.findForObject("LoanAcctInfoManager.getSpecPrdSgmtKey", map);
	}
	
	/**
	 * 新增   个人借贷账户按段更正大额专项分期信息段
	 * @param map
	 * @throws Exception
	 */
	public void saveSpecPrdSgmt(Map<String, Object> map) throws Exception{
		dao.save("LoanAcctInfoManager.saveSpecPrdSgmt", map);
	}
	
	/**
	 * 新增   大额专项分期信息段
	 * @param map
	 * @throws Exception
	 */
	public void insertSpecPrdSgmt(Map<String, Object> map) throws Exception{
		dao.save("LoanAcctInfoManager.insertSpecPrdSgmt", map);
	}
	
	/**
	 * 修改   大额专项分期信息段
	 * @param map
	 * @throws Exception
	 */
	public void updateSpecPrdSgmt(Map<String, Object> map) throws Exception{
		dao.update("LoanAcctInfoManager.updateSpecPrdSgmt", map);
	}
	
	/**
	 * 删除   大额专项分期信息段
	 * @param map
	 * @throws Exception
	 */
	public void delSpecPrdSgmt(Map<String, Object> map) throws Exception{
		dao.delete("LoanAcctInfoManager.delSpecPrdSgmt", map);
	}
	/**
	 * 新增  按段更正特殊交易说明段
	 * @param map
	 * @throws Exception
	 */
	public void saveTrstDspn(Map<String, Object> map) throws Exception{
		dao.save("LoanAcctInfoManager.saveTrstDspn", map);
	}
	/**
	 * 新增  特殊交易说明段
	 * @param map
	 * @throws Exception
	 */
	public void insertTrstDspn(Map<String, Object> map) throws Exception{
		dao.save("LoanAcctInfoManager.insertTrstDspn", map);
	}
	
	/**
	 * 修改   特殊交易说明段
	 * @param map
	 * @throws Exception
	 */
	public void updateTrstDspn(Map<String, Object> map) throws Exception{
		dao.update("LoanAcctInfoManager.updateTrstDspn", map);
	}
	
	/**
	 * 删除   特殊交易说明段
	 * @param map
	 * @throws Exception
	 */
	public void delTrstDspn(Map<String, Object> map) throws Exception{
		dao.delete("LoanAcctInfoManager.delTrstDspn", map);
	}
	
	/**
	 * 查询  初始债权说明段  主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getOcInfSgmtKey(Map<String, Object> map) throws Exception{
		return (int) dao.findForObject("LoanAcctInfoManager.getOcInfSgmtKey", map);
	}
	
	/**
	 * 新增   初始债权说明段
	 * @param map
	 * @throws Exception
	 */
	public void insertOcInfSgmt(Map<String, Object> map) throws Exception{
		dao.save("LoanAcctInfoManager.insertOcInfSgmt", map);
	}
	/**
	 * 新增   初始债权说明段
	 * @param map
	 * @throws Exception
	 */
	public void saveOcInfSgmt(Map<String, Object> map) throws Exception{
		dao.save("LoanAcctInfoManager.saveOcInfSgmt", map);
	}
	
	/**
	 * 修改   初始债权说明段
	 * @param map
	 * @throws Exception
	 */
	public void updateOcInfSgmt(Map<String, Object> map) throws Exception{
		dao.update("LoanAcctInfoManager.updateOcInfSgmt", map);
	}
	
	/**
	 * 删除   初始债权说明段
	 * @param map
	 * @throws Exception
	 */
	public void delOcInfSgmt(Map<String, Object> map) throws Exception{
		dao.delete("LoanAcctInfoManager.delOcInfSgmt", map);
	}

	@Override
	public int getTrstDspnKey(Map<String, Object> map) throws Exception {
		return (int) dao.findForObject("LoanAcctInfoManager.getTrstDspnKey", map);
	}

	@Override
	public int getMccInfKey(Map<String, Object> map) throws Exception {
		return (int) dao.findForObject("LoanAcctInfoManager.getMccInfKey", map);
	}

	@Override
	public void saveAmblgChangeListInfo(List<Map<String, String>> dataMapList) throws Exception  {
		dao.save("LoanAcctInfoManager.saveAmblgChangeListInfo", dataMapList);
	}

	@Override
	public int saveChangeAmblgByListInfo(PageData pd) throws Exception {
		//先插入借贷账户基础表
		int nums = (int) dao.save("LoanAcctInfoManager.saveAcctBsByAmblgChange", pd);
		//插入月度表现信息表
		dao.save("LoanAcctInfoManager.saveAmblgInfoByAmblgChange", pd);
		//更改对应的I_AMBLG_INF_LIST数据状态
		dao.update("LoanAcctInfoManager.updateAmblgChangeListStatus", pd);
		return nums;
	}
}
