package com.dcits.supervise.pecr.indv.service.showMonthReport.impl;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.entity.Page;
import com.dcits.supervise.pecr.indv.entity.CustomerInterceptEntity;
import com.dcits.supervise.pecr.indv.entity.IOUInterceptEntity;
import com.dcits.supervise.pecr.indv.entity.IOUInterceptStatisticsEntity;
import com.dcits.supervise.pecr.indv.service.showMonthReport.CustomerInterceptService;
import com.microdone.asn1.E;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author liuyno
 * @date 2020/8/6 - 10:12
 */
@Service
public class CustomerInterceptServiceImpl implements CustomerInterceptService {
    @Resource(name = "daoSupportPecr")
    private DaoSupportPecr dao;

    @Override
    public List<CustomerInterceptEntity> getDataListCustomer(Page page) throws Exception {
        return (List<CustomerInterceptEntity>) dao.findForList("MonthReportMapper.getCustomerlistPage", page);
    }

    @Override
    public List<IOUInterceptEntity> getDataListIOU(Page page) throws Exception {
        return (List<IOUInterceptEntity>) dao.findForList("MonthReportMapper.getIOUlistPage", page);
    }

    @Override
    public List<IOUInterceptStatisticsEntity> getDataListIOUStatistics(Page page) throws Exception {
        return (List<IOUInterceptStatisticsEntity>) dao.findForList("MonthReportMapper.getIOUStatisticslistPage", page);
    }
}
