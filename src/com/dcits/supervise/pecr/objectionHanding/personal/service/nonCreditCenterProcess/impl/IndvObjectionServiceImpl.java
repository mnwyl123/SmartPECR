package com.dcits.supervise.pecr.objectionHanding.personal.service.nonCreditCenterProcess.impl;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.objectionHanding.entity.IndvObjection;
import com.dcits.supervise.pecr.objectionHanding.personal.service.nonCreditCenterProcess.IndvObjectionService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;

/**
 * @author 穆楠
 * @date 2020/8/24 - 10:30
 */
@Service
public class IndvObjectionServiceImpl implements IndvObjectionService {

    @Resource(name = "daoSupportPecr")
    private DaoSupportPecr dao;

    //获取异议登记数据列表
    @Override
    public List<IndvObjection> getDataListIndvObjection(Page page) throws Exception {
        return (List<IndvObjection>) dao.findForList("IndvObjectionMapper.getIndvObjectionlistPage", page);
    }

    @Override
    public void addIndvObjection(Page page) throws Exception {
        dao.save("IndvObjectionMapper.addIndvObjection", page);
    }

    @Override
    public void updateIndvObjectionById(Page page) throws Exception {
        dao.update("IndvObjectionMapper.updateIndvObjectionById", page);
    }

    @Override
    public void deleteByObjectionId(PageData pageData) throws Exception {
        dao.delete("IndvObjectionMapper.deleteByObjectionId",pageData);
    }

    @Override
    public void changeObjectionStatus(HashMap<String,Object> objectionParam) throws Exception {
        dao.delete("IndvObjectionMapper.changeObjectionStatus",objectionParam);
    }
}
