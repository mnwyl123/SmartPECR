package com.dcits.supervise.pecr.indv.service.dataRecode;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.indv.entity.LoanAcctBsSgmt;
import com.dcits.supervise.pecr.indv.entity.LoanAcctRltInfSgmt;

import java.util.List;
import java.util.Map;

public interface LoanAcctInfoManager {
	// 查询个人借贷账户信息数据信息
	public List<LoanAcctBsSgmt> getLoanAcctBsSgmtList(Page page)
			throws Exception;

	// 查询个人借贷账户按段更正信息数据信息
		public List<LoanAcctBsSgmt> getLoanAcctUpdateBsSgmtList(Page page)
				throws Exception;
	/**
	 * 个人借贷账户 基础段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getAcctBsSgmtById(PageData pd) throws Exception;
	/**
	 * 个人借贷账户按段更正信息
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getAcctBsSgmtByIdType(PageData pd) throws Exception;
	
	/**
	 * 个人借贷账户按段更正请求记录 获取借贷基础段主键
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public String getPbaAcctBsSgmtId(Page page) throws Exception;
	/**
	 * 个人借贷账户 基本信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getAcctBsInfSgmtById(PageData pd) throws Exception;

	/**
	 * 个人借贷账户 相关还款责任人段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<LoanAcctRltInfSgmt> getLoanRltSgmtById(Page page) throws Exception;

	/**
	 * 个人借贷账户 抵质押物信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getMccInfoSgmtById(Page page) throws Exception;

	/**
	 * 个人借贷账户 授信额度信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getAcctCredSgmtById(PageData pd) throws Exception;

	/**
	 * 个人借贷账户 初始债权说明段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getOcInfoSgmtById(PageData pd) throws Exception;

	/**
	 * 个人借贷账户 月度表现信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getAmblgInfoSgmtById(PageData pd) throws Exception;

	/**
	 * 个人借贷账户 大额专项分期信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getSpecPrdSgmtById(PageData pd) throws Exception;

	/**
	 * 个人借贷账户 非月度表现信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getAcctDbtInfSgmtById(PageData pd) throws Exception;

	/**
	 * 个人借贷账户 特殊交易说明段
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
	 * 新增   个人借贷账户按段更正基础段
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
	 * 新增   个人借贷账户按段跟正基本信息段
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
	 * 新增   个人借贷按段更正相关还款责任人段
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
	public void delrltRepymtInf(Map<String, Object> map) throws Exception;
	
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
	 * 查询抵质押物信息段主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getMccInfKey(Map<String, Object> map) throws Exception;
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
	public int getrltRepymtInfKey(Map<String, Object> map) throws Exception;
	public int getTrstDspnKey(Map<String, Object> map) throws Exception;
	
	/**
	 * 新增    个人借贷账户按段更正授信额度信息段
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
	 * 查询 月度表现信息段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getAmblgInfSgmtKey(Map<String, Object> map) throws Exception;
	
	/**
	 * 新增   个人借贷账户按段更正月度表现信息段
	 * @param map
	 * @throws Exception
	 */
	public void saveAmblgInfSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 新增   月度表现信息段
	 * @param map
	 * @throws Exception
	 */
	public void insertAmblgInfSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 修改   月度表现信息段
	 * @param map
	 * @throws Exception
	 */
	public void updateAmblgInfSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 删除   月度表现信息段
	 * @param map
	 * @throws Exception
	 */
	public void delAmblgInfSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 查询 非月度表现信息段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getAcctDbtInfSgmtKey(Map<String, Object> map) throws Exception;
	
	/**
	 * 新增   个人借贷按段更正非月度表现信息段
	 * @param map
	 * @throws Exception
	 */
	public void saveAcctDbtInfSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 新增   非月度表现信息段
	 * @param map
	 * @throws Exception
	 */
	public void insertAcctDbtInfSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 修改   非月度表现信息段
	 * @param map
	 * @throws Exception
	 */
	public void updateAcctDbtInfSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 删除   非月度表现信息段
	 * @param map
	 * @throws Exception
	 */
	public void delAcctDbtInfSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 查询 大额专项分期信息段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getSpecPrdSgmtKey(Map<String, Object> map) throws Exception;
	
	/**
	 * 新增   个人借贷账户按段更正大额专项分期信息段
	 * @param map
	 * @throws Exception
	 */
	public void saveSpecPrdSgmt(Map<String, Object> map) throws Exception;
	/**
	 * 新增   大额专项分期信息段
	 * @param map
	 * @throws Exception
	 */
	public void insertSpecPrdSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 修改   大额专项分期信息段
	 * @param map
	 * @throws Exception
	 */
	public void updateSpecPrdSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 删除   大额专项分期信息段
	 * @param map
	 * @throws Exception
	 */
	public void delSpecPrdSgmt(Map<String, Object> map) throws Exception;

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
	 * 新增   初始债权说明段
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
	 * 生成新的随机号
	 * @param map
	 * @return
	 * @throws Exception
	 */

	public String getUUid(Map<String,Object>map)throws Exception;

	/**
	 * excel导入批量插入表I_AMBLG_INF_LIST数据
	 * @param dataMapList
	 */
	public void saveAmblgChangeListInfo(List<Map<String, String>> dataMapList) throws Exception ;
	
	/**
	 * 根据excel导入表I_AMBLG_INF_LIST的数据组装对应的月度表现段按段生成报文
	 * @param dataMapList
	 */
	public int saveChangeAmblgByListInfo(PageData pd) throws Exception ;
}
