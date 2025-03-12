package com.dcits.supervise.bfd.dao.impl;

import java.util.List;
import java.util.Map;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.bfd.dao.BfdDataCheckDao;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;

/***
 * bfd校验业务持久化接口层实现类
 *
 * @author 穆楠
 *
 */
@Repository("bfdDataCheckDao")
public class BfdDataCheckDoaImpl implements
        BfdDataCheckDao {

    @Resource(name = "daoSupportPecr")
    private DaoSupportPecr dao;

    @Override
    public String dataCheck(Map<String, String> params) throws Exception {
        dao.findForObject("bfdDataCheck.execDataCheckProcedure", params);
        return params.get("P_O_RESULT");
    }

    @Override
    public List<Map<String, String>> getCheckResult(Page page)
            throws Exception {
        return (List<Map<String, String>>) dao.findForList("bfdDataCheck.getCheckResultlistPage", page);
    }

    @Override
    public void updateCheckResultById(PageData pd) throws Exception {
        dao.update("bfdDataCheck.updateCheckResultById", pd);
    }

    @Override
    public void deleteCheckResultById(PageData pd) throws Exception {
        dao.update("bfdDataCheck.deleteCheckResultById", pd);
    }

    @Override
    public Map<String,Object> getCheckResultById(Page page) throws Exception {
        return (Map<String,Object>)dao.findForObject("bfdDataCheck.getCheckResultById", page);
    }
}
