package com.dcits.supervise.pecr.ent.service.dataRecode.impl;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.UuidUtil;
import com.dcits.supervise.pecr.ent.service.dataRecode.EnCtrctInfoManager;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * 个人担保账户信息
 * @author 穆楠
 *
 */
@Service("enCtrctInfoService")
public class EnCtrctInfoService implements EnCtrctInfoManager {
    @Resource(name = "daoSupportPecr")
    private DaoSupportPecr dao;
/**
 * 企业授信协议按段更正 获取基础段历史表中的主键
 */
    @Override
    public String getEgaCtrctBsSgmtId(Page page) throws Exception {
        return (String)dao.findForObject("EnCtrctInfoManager.getEgaCtrctBsSgmtId", page);
    }
    @Override
    public List<Map<String, Object>> getctrctBsSgmtList(Page page) throws Exception {
        return (List<Map<String, Object>>)dao.findForList("EnCtrctInfoManager.ctrctBsSgmtlistPage", page);
    }
    
    @Override
	public List<Map<String, Object>> getCtrctChangeBsSgmtList(Page page) throws Exception {
		 return (List<Map<String, Object>>)dao.findForList("EnCtrctInfoManager.getCtrctChangeBsSgmtlistPage", page);
	}
    @Override
    public Map<String, Object> getCtrctBsSgmtByIdType(PageData pd) throws Exception {
        return (Map<String, Object>) dao.findForObject("EnCtrctInfoManager.getCtrctBsSgmtByIdType", pd);
    }
    @Override
    public Map<String, Object> getCtrctBsSgmtById(PageData pd) throws Exception {
        return (Map<String, Object>) dao.findForObject("EnCtrctInfoManager.getCtrctBsSgmtById", pd);
    }

    @Override
    public PageData getCreditLimSgmtById(PageData pd) throws Exception {
        return (PageData) dao.findForObject("EnCtrctInfoManager.getCreditLimSgmtById", pd);
    }

    /**
     * 查询 基础段 主键是否存在
     * @param map
     * @return
     * @throws Exception
     */
    public int getCtrctBsSgmtKey(Map<String, Object> map) throws Exception{
        return (int) dao.findForObject("EnCtrctInfoManager.getCtrctBsSgmtKey", map);
    }
    
    /**
     * 新增   企业授信协议按段更正基础段
     * @param map
     * @throws Exception
     */
    public void saveCtrctBsSgmt(Map<String, Object> map) throws Exception{
    	map.put("UUID",UuidUtil.get32UUID());
        dao.save("EnCtrctInfoManager.saveCtrctBsSgmt", map);
    }

    /**
     * 新增   基础段
     * @param map
     * @throws Exception
     */
    public void insertCtrctBsSgmt(Map<String, Object> map) throws Exception{
        dao.save("EnCtrctInfoManager.insertCtrctBsSgmt", map);
    }

    /**
     * 修改   基础段
     * @param map
     * @throws Exception
     */
    public void updateCtrctBsSgmt(Map<String, Object> map) throws Exception{
        dao.update("EnCtrctInfoManager.updateCtrctBsSgmt", map);
    }


    @Override
    public void deleteOneRecord(Map<String, Object> map) throws Exception {
        dao.delete("EnCtrctInfoManager.delCtrctBsSgmtById", map);
        dao.delete("EnCtrctInfoManager.delCtrctCertRelSgmtById", map);
        dao.delete("EnCtrctInfoManager.delCreditLimSgmtById", map);
    }

    /**
     * 查询   共同授信人信息段
     * @param page
     * @throws Exception
     */
    @Override
    public List<PageData> getRltInfList(Page page) throws Exception {
        return (List<PageData>)dao.findForList("EnCtrctInfoManager.getRltInfList", page);
    }
    
    /**
     * 新增   企业借贷按段更正共同授信人信息段
     * @param map
     * @throws Exception
     */
    public void saveCertRelSgmt(Map<String, Object> map) throws Exception{
    	map.put("UUID",UuidUtil.get32UUID());
        dao.save("EnCtrctInfoManager.saveCertRelSgmt", map);
    }

    /**
     * 新增   共同授信人信息段
     * @param map
     * @throws Exception
     */
    public void insertCertRelSgmt(Map<String, Object> map) throws Exception{
        dao.save("EnCtrctInfoManager.insertCertRelSgmt", map);
    }

    /**
     * 修改   共同授信人信息段
     * @param map
     * @throws Exception
     */
    public void updateCertRelSgmt(Map<String, Object> map) throws Exception{
        dao.update("EnCtrctInfoManager.updateCertRelSgmt", map);
    }

    /**
     * 删除   共同授信人信息段
     * @param map
     * @throws Exception
     */
    public void deleteCertRelSgmt(Map<String, Object> map) throws Exception{
        dao.delete("EnCtrctInfoManager.deleteCertRelSgmt", map);
    }

    @Override
    public int getCreditLimSgmtKey(Map<String, Object> map) throws Exception {
        return (int) dao.findForObject("EnCtrctInfoManager.getCreditLimSgmtKey", map);
    }
    /**
     * 新增 企业授信协议按段更正授信额度段
     * @param map
     * @throws Exception
     */
    @Override
    public void saveCreditLimSgmt(Map<String, Object> map) throws Exception {
    	map.put("UUID",UuidUtil.get32UUID());
        dao.save("EnCtrctInfoManager.saveCreditLimSgmt", map);
    }
    @Override
    public void insertCreditLimSgmt(Map<String, Object> map) throws Exception {
        dao.save("EnCtrctInfoManager.insertCreditLimSgmt", map);
    }

    @Override
    public void updateCreditLimSgmt(Map<String, Object> map) throws Exception {
        dao.update("EnCtrctInfoManager.updateCreditLimSgmt", map);
    }

    @Override
    public void delCreditLimSgmt(Map<String, Object> map) throws Exception {
        dao.delete("EnCtrctInfoManager.delCreditLimSgmt", map);
    }

	@Override
	public int getCertRelSgmtKey(Map<String, Object> map) throws Exception {
		return (int) dao.findForObject("EnCtrctInfoManager.getCertRelSgmtKey", map);
	}
	@Override
	public List<PageData> findHistEntProtocolList(Page page) throws Exception {
		return (List<PageData>) dao.findForList("EnCtrctInfoManager.findHistEntProtocollistPage", page);
	}


	
}
