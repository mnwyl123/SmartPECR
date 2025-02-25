package com.dcits.supervise.pecr.indv.service.dataRecode;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.indv.entity.InCtrctInfCtrctBsSgmt;

import java.util.List;
import java.util.Map;

public interface InCtrctInfManager {
	/**
	 * 个人授信协议信息记录   列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
    public List<InCtrctInfCtrctBsSgmt> dataCtrctBsSgmtList(Page page) throws Exception;
    /**
	 * 个人授信协议信息记录   列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
    public List<InCtrctInfCtrctBsSgmt> dataCtrctBsSgmtsList(Page page) throws Exception;
    /**
	 * 个人授信协议信息记录    按段 列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
    public List<InCtrctInfCtrctBsSgmt> dataUpdateCtrctBsSgmtsList(Page page) throws Exception;

    /**
     * 个人授信协议信息记录 基础段信息
     * @param pd
     * @return
     * @throws Exception
     */
    public PageData getCtrctBsSgmtData(PageData pd) throws Exception;
    
    public List<PageData> getErrBsSgmtData(PageData pd) throws Exception;
    /**
     * 个人授信协议信息记录   共同受信人信息段
     * @param pd
     * @return
     * @throws Exception
     */
    public String getPcaCtrctBsSgmtId(Page page) throws Exception;
    /**
     * 个人授信协议信息记录   共同受信人信息段
     * @param pd
     * @return
     * @throws Exception
     */
    public List<PageData> getCertRelSgmtList(Page page) throws Exception;
    /**
	 * 个人授信协议按段更正信息
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getCtrctBsSgmtByIdType(PageData pd) throws Exception;

    /**
     * 个人授信协议信息记录   额度信息段
     * @param pd
     * @return
     * @throws Exception
     */
    public PageData getCreditLimSgmtData(PageData pd) throws Exception;
    
    /**
	 * 查询 基础段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getCtrctBsSgmtKey(Map<String, Object> map) throws Exception;
	
    /**
	 * 查询 共同授信人段主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getCertRelSgmtKey(Map<String, Object> map) throws Exception;
	/**
	 * 新增   基础段
	 * @param pd
	 * @throws Exception
	 */
	public void saveCtrctBsSgmt(Map<String, Object> map) throws Exception;
	/**
	 * 新增   基础段
	 * @param pd
	 * @throws Exception
	 */
	public void insertCtrctBsSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 修改   基础段
	 * @param map
	 * @throws Exception
	 */
	public void updateCtrctBsSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 删除   基础段  (同时会删除其他段)
	 * @param map
	 * @throws Exception
	 */
	public void deleteCtrctBsSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 新增   个人授信协议按段更正共同授信人信息段
	 * @param map
	 * @throws Exception
	 */
	public void addCertRelSgmt(Map<String, Object> map) throws Exception;
	/**
	 * 新增   共同授信人信息段
	 * @param map
	 * @throws Exception
	 */
	public void insertCertRelSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 修改   共同授信人信息段
	 * @param map
	 * @throws Exception
	 */
	public void updateCertRelSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 删除   共同授信人信息段
	 * @param map
	 * @throws Exception
	 */
	public void deleteCertRelSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 查询 额度信息段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getCreditLimSgmtKey(Map<String, Object> map) throws Exception;
	
	/**
	 * 新增   个人授信按段更正额度信息段
	 * @param map
	 * @throws Exception
	 */
	public void saveCreditLimSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 新增   额度信息段
	 * @param map
	 * @throws Exception
	 */
	public void insertCreditLimSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 修改  额度信息段
	 * @param map
	 * @throws Exception
	 */
	public void updateCreditLimSgmt(Map<String, Object> map) throws Exception;
	
	/**
	 * 删除   额度信息段
	 * @param map
	 * @throws Exception
	 */
	public void delCreditLimSgmt(Map<String, Object> map) throws Exception;
}
