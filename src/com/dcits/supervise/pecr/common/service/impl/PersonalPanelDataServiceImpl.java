package com.dcits.supervise.pecr.common.service.impl;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.common.service.PersonalPanelDataService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
import com.dcits.platform.entity.Page;
import com.dcits.supervise.pecr.indv.service.packet.IndvNormalMessageManager;

/**
 * @author 穆楠
 * @date 2020/7/8 - 14:34
 */

@Service
public class PersonalPanelDataServiceImpl implements PersonalPanelDataService {

    @Resource(name = "daoSupportPecr")
    private DaoSupportPecr dao;

    //获取报送数据统计列表展示到首页
    @Override
    public List<Map<String, Object>> getReportStatistics(PageData pd) throws Exception {
        return (List<Map<String, Object>>) dao.findForList("PersonalPanelDataMapper.findReportStatistics", pd);
    }

    //获取折线图数据展示到首页
    @Override
    public List<Map<String,String>> getLineChartData() throws Exception {
        return (List<Map<String, String>>) dao.findForList("PersonalPanelDataMapper.findLineChartData");
    }

    //获取柱状图数据展示到首页
    @Override
    public Map<String, Object> getBarData() throws Exception {
        return (Map<String, Object>) dao.findForObject("PersonalPanelDataMapper.findBarData", "");
    }

    //获取已上报记录数
    @Override
    public int findReportedData(String tName) throws Exception {
        return (int) dao.findForObject("PersonalPanelDataMapper.findReportedData", tName);
    }

    //获取总记录数
    @Override
    public int findTotalData(String tName) throws Exception {
        return (int) dao.findForObject("PersonalPanelDataMapper.findTotalData", tName);
    }

    //新增首页柱状图数据记录
    @Override
    public void addBarRecord(Map<String, Object> paramMap) throws Exception {
        dao.save("PersonalPanelDataMapper.addBarRecord", paramMap);
    }

    //获取当天对应是否有记录
    @Override
    public int hasRecord(String tName) throws Exception {
        return (int) dao.findForObject("PersonalPanelDataMapper.hasRecord", tName);
    }

    //更新首页柱状图数据记录
    @Override
    public void updateBarRecord(Map<String, Object> paramMap) throws Exception {
        dao.update("PersonalPanelDataMapper.updateBarRecord", paramMap);
    }

    @Override
    public int getStatData(Map<String, Object> map) throws Exception {
        return (int) dao.findForObject("PersonalPanelDataMapper.getStatData", map);
    }

    @Override
    public int getTotalCount(String tName) throws Exception {
        return (int) dao.findForObject("PersonalPanelDataMapper.getTotalCount", tName);
    }
//穆楠
//    @Override
//    public Map<String,Integer> getNormalPacketToDoCount() throws Exception {
//        return (Map<String,Integer>) dao.findForObject("PersonalPanelDataMapper.getNormalPacketToDoCount","");
//    }
//
//    @Override
//    public Map<String,Integer> getAbnormalPacketToDoCount() throws Exception {
//        return (Map<String,Integer>) dao.findForObject("PersonalPanelDataMapper.getAbnormalPacketToDoCount","");
//    }
    
    //穆楠
    @Override
    public Map<String,Integer> getNormalPacketToDoCount(Page page) throws Exception {
        return (Map<String,Integer>) dao.findForObject("PersonalPanelDataMapper.getNormalPacketToDoCount",page);
    }

    @Override
    public Map<String,Integer> getAbnormalPacketToDoCount(Page page) throws Exception {
        return (Map<String,Integer>) dao.findForObject("PersonalPanelDataMapper.getAbnormalPacketToDoCount",page);
    }
}
