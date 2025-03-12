package com.dcits.supervise.pecr.indv.controller.showMonthReport;

import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.indv.entity.CustomerInterceptEntity;
import com.dcits.supervise.pecr.indv.entity.IOUInterceptEntity;
import com.dcits.supervise.pecr.indv.entity.IOUInterceptStatisticsEntity;
import com.dcits.supervise.pecr.indv.entity.InFalMmbsInf;
import com.dcits.supervise.pecr.indv.service.dataRecode.impl.InFalMmbsInfService;
import com.dcits.supervise.pecr.indv.service.showMonthReport.CustomerInterceptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 月报展示
 *
 * @author 穆楠
 * @date 2020/8/5 - 14:23
 */
@Controller
@RequestMapping("/indv/dataIntercept")
public class CustomerInterceptController extends BaseController {

    @Autowired
    private CustomerInterceptService customerInterceptService;

    @RequestMapping("/dataPageCustomer")
    public String dataPageCustomer() {
        return "pecr/indv/showMonthReport/CustomerIntercept";
    }

    @RequestMapping("/dataPageIOU")
    public String dataPageIOU() {
        return "pecr/indv/showMonthReport/IOUIntercept";
    }

    @RequestMapping("/dataPageIOUStatistics")
    public String dataPageIOUStatistics() {
        return "pecr/indv/showMonthReport/IOUStatisticsIntercept";
    }

    //获取数据列表
    @RequestMapping("/getDataList")
    @ResponseBody
    public Map<String, Object> getDataList(Page page) {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        try {
            PageData pageData = this.getPageData();
            int currentPage = Integer.parseInt(pageData.getString("page"));//页码参数名
            int limit = Integer.parseInt(pageData.getString("limit"));//每页数据量参数名
            String tabName = pageData.getString("tabName");//表名
            page.setCurrentPage(currentPage);
            page.setShowCount(limit);
            page.setPd(pageData);
            if (null != tabName && !"".equals(tabName)) {
                if ("CUST_INTERCEPT_DETAIL".equals(tabName)) {
                    List<CustomerInterceptEntity> List = customerInterceptService.getDataListCustomer(page);
                    resultMap.put("data", List);
                } else if ("IOU_INTERCEPT_DETAIL".equals(tabName)) {
                    List<IOUInterceptEntity> List = customerInterceptService.getDataListIOU(page);
                    resultMap.put("data", List);
                } else if ("IOU_INTERCEPT_STATISTICS".equals(tabName)) {
                    List<IOUInterceptStatisticsEntity> List = customerInterceptService.getDataListIOUStatistics(page);
                    resultMap.put("data", List);
                } else {
                    logger.error("要查询的表名不正确！" + tabName);
                    resultMap.put("code", 1);
                    return resultMap;
                }
            }
            resultMap.put("code", 0);
            resultMap.put("count", page.getTotalResult());
        } catch (Exception e) {
            e.printStackTrace();
            resultMap.put("code", 1);
        }
        return resultMap;
    }
}
