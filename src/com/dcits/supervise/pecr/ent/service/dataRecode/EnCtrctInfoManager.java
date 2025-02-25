package com.dcits.supervise.pecr.ent.service.dataRecode;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;

import java.util.List;
import java.util.Map;

/**
 * 企业授信信息
 * @author
 *
 */
public interface EnCtrctInfoManager {
    // 查询企业征信授信基础数据信息
    public List<Map<String, Object>> getctrctBsSgmtList(Page page) throws Exception;

    
    /**
     * 企业授信协议按段更正信息 基础段
     *
     * @param pd
     * @return
     * @throws Exception
     */
    public Map<String, Object> getCtrctBsSgmtByIdType(PageData pd) throws Exception;
    /**
     * 企业授信协议按段更正信息 获取基础段历史表中的主键
     *
     * @param pd
     * @return
     * @throws Exception
     */
    public String getEgaCtrctBsSgmtId(Page page) throws Exception;
    
    /**
     * 企业征信授信信息 基础段
     *
     * @param pd
     * @return
     * @throws Exception
     */
    public Map<String, Object> getCtrctBsSgmtById(PageData pd) throws Exception;
    
    /**
     * 企业征信按段更正授信信息 基础段
     *
     * @param pd
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> getCtrctChangeBsSgmtList(Page page) throws Exception;

    /**
     * 企业征信授信信息 授信信息段
     *
     * @param pd
     * @return
     * @throws Exception
     */
    public PageData getCreditLimSgmtById(PageData pd) throws Exception;
    /**
     * 查询 基础段 主键是否存在
     * @param map
     * @return
     * @throws Exception
     */
    public int getCtrctBsSgmtKey(Map<String, Object> map) throws Exception;

    /**
             * 查询    共同授信人信息段 主键是否存在
     * @param map
     * @return
     * @throws Exception
     */
    public int getCertRelSgmtKey(Map<String, Object> map) throws Exception;
    /**
     * 新增   企业授信协议按段更正基础段
     * @param map
     * @throws Exception
     */
    public void saveCtrctBsSgmt(Map<String, Object> map) throws Exception;
    /**
     * 新增   基础段
     * @param map
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
     * 删除基础段信息
     *
     * @param map
     * @return
     * @throws Exception
     */
    public void deleteOneRecord(Map<String, Object> map) throws Exception;

    /**
     * 企业授信协议信息记录   共同受信人信息段
     * @param page
     * @return
     * @throws Exception
     */
    public List<PageData> getRltInfList(Page page) throws Exception;
    
    /**
     * 新增   企业授信协议按段更正共同授信人信息段
     * @param map
     * @throws Exception
     */
    public void saveCertRelSgmt(Map<String, Object> map) throws Exception;

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
     * 新增   企业授信按段更正额度信息段
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
    
    /**
     * 根据协议标识码查询其历史数据
     * @param page
     * @return
     * @throws Exception
     */
    public List<PageData> findHistEntProtocolList(Page page) throws Exception;
}
