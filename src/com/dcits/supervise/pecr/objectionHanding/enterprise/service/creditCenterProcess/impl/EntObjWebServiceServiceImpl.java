package com.dcits.supervise.pecr.objectionHanding.enterprise.service.creditCenterProcess.impl;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.objectionHanding.enterprise.service.creditCenterProcess.EntObjWebServiceService;
import com.dcits.supervise.pecr.objectionHanding.entity.CreditCenterObjHandingEntity;
import com.dcits.supervise.pecr.objectionHanding.entity.EntCreditCenterObjHandingEntity;
import com.dcits.supervise.pecr.objectionHanding.entity.HistoricalCheckInfEntity;
import com.dcits.supervise.pecr.objectionHanding.entity.LocateInfEntity;
import com.dcits.supervise.pecr.objectionHanding.personal.service.creditCenterProcess.IndvObjWebServiceService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * @author wzy
 * @date 2020/10/22 - 10:59
 */
@Service
public class EntObjWebServiceServiceImpl implements EntObjWebServiceService {

    @Resource(name = "daoSupportPecr")
    private DaoSupportPecr dao;


    /**
     * 插入异议事项单
     *
     * @param map
     * @return
     * @throws Exception
     */
    @Override
    public String insertToCheckInf(Map<String, Object> map) throws Exception {
        String id = (String) dao.save("entObjWebServiceMapper.insertToCheckInf", map);
        return id;
    }

    /**
     * 插入异议历史核查信息
     *
     * @param map
     * @throws Exception
     */
    @Override
    public void insertHistoricalCheckInf(Map<String, String> map) throws Exception {
        dao.save("entObjWebServiceMapper.insertHistoricalCheckInf", map);
    }

    /**
     * 根据主键ID插入异议附件信息
     *
     * @param map
     * @throws Exception
     */
    @Override
    public void updateObjAnnexById(Map<String, String> map) throws Exception {
        dao.update("entObjWebServiceMapper.updateObjAnnexById", map);
    }

    /**
     * 根据主键ID插入异议核查结果信息
     *
     * @param map
     * @throws Exception
     */
    @Override
    public void updateFeedbackCheckResultById(Map<String, String> map) throws Exception {
        dao.update("entObjWebServiceMapper.updateFeedbackCheckResultById", map);
    }

    /**
     * 根据主键ID插入异议更正结果信息
     *
     * @param map
     * @throws Exception
     */
    @Override
    public void updateFeedbackCorrectResultById(Map<String, String> map) throws Exception {
        dao.update("entObjWebServiceMapper.updateFeedbackCorrectResultById", map);
    }

    /**
     * 根据主键ID插入异议更正结果接收情况
     *
     * @param map
     * @throws Exception
     */
    @Override
    public void updateReceiveResultById(Map<String, String> map) throws Exception {
        dao.update("entObjWebServiceMapper.updateReceiveResultById", map);
    }

    /**
     * 根据主键ID插入添加个人异议标注
     *
     * @param map
     * @throws Exception
     */
    @Override
    public void updateAddObjLabelById(Map<String, String> map) throws Exception {
        dao.update("entObjWebServiceMapper.updateAddObjLabelById", map);
    }

    /**
     * 根据主键ID插入删除个人异议标注
     *
     * @param map
     * @throws Exception
     */
    @Override
    public void updateDeleteObjLabelById(Map<String, String> map) throws Exception {
        dao.update("entObjWebServiceMapper.updateDeleteObjLabelById", map);
    }

    /**
     * 获取异议列表
     *
     * @param page
     * @return
     * @throws Exception
     */
    @Override
    public List<EntCreditCenterObjHandingEntity> objectionList(Page page) throws Exception {
        return (List<EntCreditCenterObjHandingEntity>)dao.findForList("entObjWebServiceMapper.objectionlistPage", page);
    }

    /**
     * 根据ID插入定位信息
     * @param map
     * @throws Exception
     */
    @Override
    public void insertLocalInfById(Map<String, String> map) throws Exception {
        dao.save("entObjWebServiceMapper.insertLocalInfById", map);
    }

    /**
     * 根据ID删除异议事项单
     * @param id
     * @throws Exception
     */
    @Override
    public void deleteToCheckObjectionById(String id) throws Exception {
        dao.delete("entObjWebServiceMapper.deleteToCheckObjectionById",id);
    }

    /**
     * 根据ID删除历史核查信息
     * @param id
     * @throws Exception
     */
    @Override
    public void deleteHistoricalCheckInf(String id) throws Exception {
        dao.delete("entObjWebServiceMapper.deleteHistoricalCheckInf",id);
    }

    /**
     * 根据ID删除定位信息
     * @param id
     * @throws Exception
     */
    @Override
    public void deleteLocateInf(String id) throws Exception {
        dao.delete("entObjWebServiceMapper.deleteLocateInf",id);
    }

    /**
     * 根据ID查询异议事项单信息
     * @param pd
     * @return
     * @throws Exception
     */
    @Override
    public PageData getToCheckObjectionById(PageData pd) throws Exception {
        return (PageData) dao.findForObject("entObjWebServiceMapper.getToCheckObjectionById",pd);
    }

    /**
     * 根据ID查询历史核查信息
     * @param id
     * @return
     * @throws Exception
     */
    @Override
    public List getHistoricalCheckInfById(String id) throws Exception {
        return (List<HistoricalCheckInfEntity>)dao.findForList("entObjWebServiceMapper.getHistoricalCheckInfById",id);
    }

    /**
     * 根据ID查询定位信息
     * @param id
     * @return
     * @throws Exception
     */
    @Override
    public List getLocateInfById(String id) throws Exception {
        return (List<LocateInfEntity>)dao.findForList("entObjWebServiceMapper.getLocateInfById",id);
    }
}
