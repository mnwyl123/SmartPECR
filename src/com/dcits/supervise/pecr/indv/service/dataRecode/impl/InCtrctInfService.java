package com.dcits.supervise.pecr.indv.service.dataRecode.impl;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.indv.entity.InCtrctInfCtrctBsSgmt;
import com.dcits.supervise.pecr.indv.service.dataRecode.InCtrctInfManager;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;

import java.util.List;
import java.util.Map;

@Service
public class InCtrctInfService implements InCtrctInfManager {
    @Resource(name = "daoSupportPecr")
    private DaoSupportPecr dao;
    
    /**
     * 个人授信协议信息 列表信息 shenhe 
     */
    @SuppressWarnings("unchecked")
	@Override
    public List<InCtrctInfCtrctBsSgmt> dataCtrctBsSgmtsList(Page page) throws Exception {
        return (List<InCtrctInfCtrctBsSgmt>) dao.findForList("InCtrctInfMapper.dataCtrctBsSgmtslistPage", page);
    }

    /**
     * 个人授信协议信息 列表信息
     */
    @SuppressWarnings("unchecked")
	@Override
    public List<InCtrctInfCtrctBsSgmt> dataCtrctBsSgmtList(Page page) throws Exception {
        return (List<InCtrctInfCtrctBsSgmt>) dao.findForList("InCtrctInfMapper.dataCtrctBsSgmtlistPage", page);
    }
    /**
     * 个人授信协议信息 列表信息
     */
    @SuppressWarnings("unchecked")
	@Override
    public List<InCtrctInfCtrctBsSgmt> dataUpdateCtrctBsSgmtsList(Page page) throws Exception {
        return (List<InCtrctInfCtrctBsSgmt>) dao.findForList("InCtrctInfMapper.dataUpdateCtrctBsSgmtslistPage", page);
    }
    
    /**
	 * 个人授信协议按段更正信息
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> getCtrctBsSgmtByIdType(PageData pd) throws Exception {
		return (Map<String, Object>) dao.findForObject("InCtrctInfMapper.getCtrctBsSgmtByIdType", pd);
	}
	/**
	 * 获取历史表中基础段的主键
	 */
	public String getPcaCtrctBsSgmtId(Page page) throws Exception {
		return (String) dao.findForObject("InCtrctInfMapper.getPcaCtrctBsSgmtId", page);
	}

    /**
     * 个人授信协议信息记录 基础段信息
     */
    @Override
    public PageData getCtrctBsSgmtData(PageData pd) throws Exception {
        return (PageData) dao.findForObject("InCtrctInfMapper.getCtrctBsSgmtData", pd);
    }
    
    /**
     * 韦宗英 add
     * 个人授信协议信息记录 错误信息
     */
    @Override
    public List<PageData> getErrBsSgmtData(PageData pd) throws Exception {
        return (List<PageData>) dao.findForList("InCtrctInfMapper.getErrBsSgmtData", pd);
    }

    /**
     * 个人授信协议信息记录 共同受信人信息段
     */
    @SuppressWarnings("unchecked")
	@Override
    public List<PageData> getCertRelSgmtList(Page page) throws Exception {
        return (List<PageData>) dao.findForList("InCtrctInfMapper.getCertRelSgmtlistpage", page);
    }

    /**
     * 个人授信协议信息记录  额度信息段
     */
    @Override
    public PageData getCreditLimSgmtData(PageData pd) throws Exception {
        return (PageData) dao.findForObject("InCtrctInfMapper.getCreditLimSgmtData", pd);
    }

    /**
	 * 查询 基础段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getCtrctBsSgmtKey(Map<String, Object> map) throws Exception{
		return (int) dao.findForObject("InCtrctInfMapper.getCtrctBsSgmtKey", map);
	}
	
	/**
	 * 新增   个人授信协议按段更正基础段
	 * @param pd
	 * @throws Exception
	 */
	public void saveCtrctBsSgmt(Map<String, Object> map) throws Exception{
		dao.save("InCtrctInfMapper.saveCtrctBsSgmt", map);
	}
	
	/**
	 * 新增   基础段
	 * @param pd
	 * @throws Exception
	 */
	public void insertCtrctBsSgmt(Map<String, Object> map) throws Exception{
		dao.save("InCtrctInfMapper.insertCtrctBsSgmt", map);
	}
	
	/**
	 * 修改   基础段
	 * @param map
	 * @throws Exception
	 */
	public void updateCtrctBsSgmt(Map<String, Object> map) throws Exception{
		dao.update("InCtrctInfMapper.updateCtrctBsSgmt", map);
	}
	
	/**
	 * 删除   基础段  (同时会删除其他段)
	 * @param map
	 * @throws Exception
	 */
	public void deleteCtrctBsSgmt(Map<String, Object> map) throws Exception{
		dao.delete("InCtrctInfMapper.delCtrctBsSgmtById", map);
		dao.delete("InCtrctInfMapper.delCtrctCertRelSgmtById", map);
		dao.delete("InCtrctInfMapper.delCreditLimSgmtById", map);
	}
	
	/**
	 * 新增   个人授信协议按段更正共同授信人信息段
	 * @param map
	 * @throws Exception
	 */
	public void addCertRelSgmt(Map<String, Object> map) throws Exception{
		dao.save("InCtrctInfMapper.addCertRelSgmt", map);
	}

	/**
	 * 新增   共同授信人信息段
	 * @param map
	 * @throws Exception
	 */
	public void insertCertRelSgmt(Map<String, Object> map) throws Exception{
		dao.save("InCtrctInfMapper.insertCertRelSgmt", map);
	}
	/**
	 * 修改   共同授信人信息段
	 * @param map
	 * @throws Exception
	 */
	public void updateCertRelSgmt(Map<String, Object> map) throws Exception{
		dao.update("InCtrctInfMapper.updateCertRelSgmt", map);
	}
	
	/**
	 * 删除   共同授信人信息段
	 * @param map
	 * @throws Exception
	 */
	public void deleteCertRelSgmt(Map<String, Object> map) throws Exception{
		dao.delete("InCtrctInfMapper.deleteCertRelSgmt", map);
	}
	
	/**
	 * 查询 额度信息段 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getCreditLimSgmtKey(Map<String, Object> map) throws Exception{
		return (int) dao.findForObject("InCtrctInfMapper.getCreditLimSgmtKey", map);
	}
	
	/**
	 * 新增   额度信息段
	 * @param map
	 * @throws Exception
	 */
	public void saveCreditLimSgmt(Map<String, Object> map) throws Exception{
		dao.save("InCtrctInfMapper.saveCreditLimSgmt", map);
	}
	
	/**
	 * 新增   额度信息段
	 * @param map
	 * @throws Exception
	 */
	public void insertCreditLimSgmt(Map<String, Object> map) throws Exception{
		dao.save("InCtrctInfMapper.insertCreditLimSgmt", map);
	}
	
	/**
	 * 修改  额度信息段
	 * @param map
	 * @throws Exception
	 */
	public void updateCreditLimSgmt(Map<String, Object> map) throws Exception{
		dao.update("InCtrctInfMapper.updateCreditLimSgmt", map);
	}
	
	/**
	 * 删除   额度信息段
	 * @param map
	 * @throws Exception
	 */
	public void delCreditLimSgmt(Map<String, Object> map) throws Exception{
		dao.delete("InCtrctInfMapper.delCreditLimSgmt", map);
	}

	@Override
	public int getCertRelSgmtKey(Map<String, Object> map) throws Exception {
		return (int) dao.findForObject("InCtrctInfMapper.getCertRelSgmtKey", map);
	}
}
