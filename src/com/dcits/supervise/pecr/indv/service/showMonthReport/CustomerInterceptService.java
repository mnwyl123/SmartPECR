package com.dcits.supervise.pecr.indv.service.showMonthReport;

import com.dcits.platform.entity.Page;
import com.dcits.supervise.pecr.indv.entity.CustomerInterceptEntity;
import com.dcits.supervise.pecr.indv.entity.IOUInterceptEntity;
import com.dcits.supervise.pecr.indv.entity.IOUInterceptStatisticsEntity;

import java.util.List;

/**
 * @author liuyno
 * @date 2020/8/6 - 9:53
 */
public interface CustomerInterceptService {

    public List<CustomerInterceptEntity> getDataListCustomer(Page page) throws Exception;

    public List<IOUInterceptEntity> getDataListIOU(Page page) throws Exception;

    public List<IOUInterceptStatisticsEntity> getDataListIOUStatistics(Page page) throws Exception;
}
