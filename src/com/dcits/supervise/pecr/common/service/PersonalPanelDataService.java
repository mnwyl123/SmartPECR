package com.dcits.supervise.pecr.common.service;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;

import java.util.List;
import java.util.Map;

/**
 * @author 穆楠
 * @date 2020/7/8 - 14:11
 */

public interface PersonalPanelDataService {
    public List<Map<String, Object>> getReportStatistics(PageData pd) throws Exception;

    public List<Map<String, String>> getLineChartData() throws Exception;

    public Map<String, Object> getBarData() throws Exception;

    public int findReportedData(String tName) throws Exception;

    public int findTotalData(String tName) throws Exception;

    public void addBarRecord(Map<String, Object> paramMap) throws Exception;

    public int hasRecord(String tName) throws Exception;

    public void updateBarRecord(Map<String, Object> paramMap) throws Exception;

    public int getStatData(Map<String,Object> map) throws Exception;

    public int getTotalCount(String tName) throws Exception;

/*    public Map<String,Integer> getNormalPacketToDoCount() throws Exception;

    public Map<String,Integer> getAbnormalPacketToDoCount() throws Exception;*/
    
    public Map<String,Integer> getNormalPacketToDoCount(Page page) throws Exception;
    
    public Map<String,Integer> getAbnormalPacketToDoCount(Page page) throws Exception;

}
