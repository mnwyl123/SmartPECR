package com.dcits.supervise.bfd.service.impl;

import java.util.List;
import java.util.Map;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.bfd.dao.BfdDataCheckDao;
import com.dcits.supervise.bfd.service.BfdDataCheckService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * bfd校验业务层接口实现类
 *
 * @author liuyno
 */
@Service
public class BfdDataCheckServiceImpl implements BfdDataCheckService {

    @Autowired
    private BfdDataCheckDao bfdDataCheckDao;

    @Override
    public String dataCheck(Map<String, String> params) throws Exception {
        return bfdDataCheckDao.dataCheck(params);
    }

    @Override
    public List<Map<String, String>> getCheckResult(Page page)
            throws Exception {
        return this.bfdDataCheckDao.getCheckResult(page);
    }

    @Override
    public void updateCheckResultById(PageData pd) throws Exception {
        this.bfdDataCheckDao.updateCheckResultById(pd);
    }

    @Override
    public void deleteCheckResultById(PageData pd) throws Exception {
        this.bfdDataCheckDao.deleteCheckResultById(pd);
    }

    @Override
    public Map<String,Object> getCheckResultById(Page page) throws Exception {
        return this.bfdDataCheckDao.getCheckResultById(page);
    }
}
