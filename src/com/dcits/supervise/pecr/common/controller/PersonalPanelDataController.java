package com.dcits.supervise.pecr.common.controller;

import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.DateUtil;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.common.service.PersonalPanelDataService;
import com.dcits.supervise.pecr.util.PecrConstantUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import java.lang.String;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.Jurisdiction;
import org.apache.shiro.session.Session;
/**
 * 获取个人征信面板展示数据
 *
 * @author 穆楠
 * @date 2020/7/8 - 10:07
 */

@Controller
@RequestMapping("/personalPanelData")
public class PersonalPanelDataController extends BaseController {

    private Logger logger = LoggerFactory.getLogger(PersonalPanelDataController.class);

    @Autowired
    PersonalPanelDataService personalPanelDataService;

    //获取报送数据统计
    @RequestMapping("/getReportStatistics")
    @ResponseBody
    public Map<String, Object> getReportStatistics() {
        Map<String, Object> map = new HashMap<>(5);
        List<Map<String, Object>> dataList;
        int totalCount = 0;
        //汇总根据条件查询到的数据条数
        List<Integer> countList = new ArrayList<>(8);
        //汇总需要抽取数据表
        List<String> tNameList = new ArrayList<>(6);
        //个人
        tNameList.add("I_BS");
        tNameList.add("I_IN_FAL_MMBS_INF");
        tNameList.add("I_IN_ID_EFCT_INF");
        tNameList.add("I_ACCT_BS");
        tNameList.add("I_CTRCT_BS");
        tNameList.add("I_GUAR_ACCT_BS");
        tNameList.add("I_IN_CTF_ITG_INF");
        tNameList.add("I_IN_SPC_EVT_DSC_INF");
        
        //企业
//        tNameList.add("E_BS");
//        tNameList.add("E_ICDN_RLTP_INF");
//        tNameList.add("E_ACCT_BS");
//        tNameList.add("E_CTRCT_BS");
//        tNameList.add("E_GUAR_ACCT_BS");
//        tNameList.add("E_BALANCE_SHEET_BS");
//        tNameList.add("E_INCOME_STATEMENT");
//        tNameList.add("E_CASH_FLOWS_BS");
//        tNameList.add("E_INSTITU_BALANCE_BS");
//        tNameList.add("E_INCOME_EXPENSE_BS");
        
        /*//非正常报文表
        tNameList.add("I_IN_BS_INF_DLT");
        tNameList.add("I_IN_ID_EFCT_INF_DLT");
        tNameList.add("I_IN_ACCT_ID_CAGS_INF");
        tNameList.add("I_IN_ACCT_DEL");
        tNameList.add("I_IN_ACCT_ENT_DEL");
        tNameList.add("I_IN_CTRCTID_CAGS_INF");
        tNameList.add("I_IN_CTRCT_DEL");
        tNameList.add("I_IN_CTRCT_ENT_DEL");
        tNameList.add("I_INSECACCTID_CAGSINF");
        tNameList.add("I_IN_SEC_ACCT_DEL");
        tNameList.add("I_IN_SEC_ACCT_ENT_DEL");
*/
        //汇总取数条件
        List<List<String>> conditionList = new ArrayList<>(8);
        List<String> totalCondition = new ArrayList<String>();
        List<String> checkErrorCondition = new ArrayList<String>();
        checkErrorCondition.add(PecrConstantUtil.BUSINESS_STATUS_10);
        List<String> toGenCondition = new ArrayList<String>();
        toGenCondition.add(PecrConstantUtil.BUSINESS_STATUS_20);
        List<String> toRepCondition = new ArrayList<String>();
        toRepCondition.add(PecrConstantUtil.BUSINESS_STATUS_50);
        List<String> toFeedCondition = new ArrayList<String>();
        toFeedCondition.add(PecrConstantUtil.BUSINESS_STATUS_60);
        List<String> feedErrorToDealCondition = new ArrayList<String>();
        feedErrorToDealCondition.add(PecrConstantUtil.BUSINESS_STATUS_80);
        List<String> reportedCondition = new ArrayList<String>();
        reportedCondition.add(PecrConstantUtil.BUSINESS_STATUS_60);
        reportedCondition.add(PecrConstantUtil.BUSINESS_STATUS_70);
        reportedCondition.add(PecrConstantUtil.BUSINESS_STATUS_80);
        List<String> repSuccessCondition = new ArrayList<String>();
        repSuccessCondition.add(PecrConstantUtil.BUSINESS_STATUS_70);
        conditionList.add(totalCondition);
        conditionList.add(checkErrorCondition);
        conditionList.add(toGenCondition);
        conditionList.add(toRepCondition);
        conditionList.add(toFeedCondition);
        conditionList.add(feedErrorToDealCondition);
        conditionList.add(reportedCondition);
        conditionList.add(repSuccessCondition);
        try {
            //根据个报送接口统计数据
            //统计总记录数
            int count;
            List<String> currentCondition;
            Map<String, Object> conditionMap = new HashMap<>(2);
            for (int i = 0; i < conditionList.size(); i++) {
                count = 0;
                currentCondition = conditionList.get(i);
                for (int j = 0; j < tNameList.size(); j++) {
                    conditionMap.clear();
                    conditionMap.put("tName", tNameList.get(j));
                    conditionMap.put("condition", currentCondition);
                    count += personalPanelDataService.getStatData(conditionMap);
                }
                countList.add(count);
            }
            //把统计到的数据插入到I_Panel_Data表
            //插入数据到记录表
            //先获取表中当天对应记录数：有记录则更新 无记录则插入
            Map<String, Object> StatisticsMap = new HashMap<>();
            Map<String, Object> paramMap = new HashMap<>();
            StatisticsMap.put("TOTAL_COUNT", countList.get(0));
            StatisticsMap.put("CHECK_ERROR_COUNT", countList.get(1));
            StatisticsMap.put("AWAIT_GENERATE_COUNT", countList.get(2));
            StatisticsMap.put("AWAIT_REPORT_COUNT", countList.get(3));
            StatisticsMap.put("AWAIT_FEEDBACK_COUNT", countList.get(4));
            StatisticsMap.put("FEEDBACK_ERROE_PENDING", countList.get(5));
            StatisticsMap.put("REPORTED", countList.get(6));
            StatisticsMap.put("REPORTED_SUCCESS", countList.get(7));
            StatisticsMap.put("EXTRACTION_DATE", DateUtil.getDay());
            paramMap.put("paramMap", StatisticsMap);
            paramMap.put("tName", "I_PANEL_DATA");
            int recordCount = personalPanelDataService.hasRecord("I_PANEL_DATA");
            if (recordCount == 0) {
                personalPanelDataService.addBarRecord(paramMap);
            } else {
                personalPanelDataService.updateBarRecord(paramMap);
            }
            //根据首页传参查询列表数据
            PageData pd = this.getPageData();
            dataList = personalPanelDataService.getReportStatistics(pd);
            totalCount = personalPanelDataService.getTotalCount("I_PANEL_DATA");
        } catch (
                Exception e) {
            logger.error(e.getMessage());
            map.put("code", 1); //0为成功 1为失败
            map.put("msg", "查询失败");
            map.put("total", 0);
            return map;
        }
        map.put("code", 0); //0为成功 1为失败
        map.put("msg", "查询成功");
        map.put("total", totalCount);
        map.put("data", dataList);
        return map;
    }


    /*获取柱状图数据
     根据当前日期获取报送目标表的数据与其对应历史表的数据信息存入柱状图数据记录表供首页展示使用
     */
    @RequestMapping("/getBarData")
    @ResponseBody
    public Map<String, Object> getBarData(Page page) {
        Map<String, Object> map = new HashMap<>(5);
        Map<String, Object> dataList;
        ArrayList seriesTotalData = new ArrayList();
        ArrayList seriesReportedData = new ArrayList();
        try {
            //统计每张报送目标表的数据到柱状图数据记录表
            String tName = "I_BS";  //个人基本信息
            int I_BS_REPORTED = personalPanelDataService.findReportedData(tName);
            int I_BS_TOTAL = personalPanelDataService.findTotalData(tName);
            tName = "I_IN_FAL_MMBS_INF";   //家族关系信息
            int I_FAL_MMBS_REPORTED = personalPanelDataService.findReportedData(tName);
            int I_FAL_MMBS_TOTAL = personalPanelDataService.findTotalData(tName);
            tName = "I_IN_ID_EFCT_INF";    //个人证件有效期信息
            int I_EFCT_REPORTED = personalPanelDataService.findReportedData(tName);
            int I_EFCT_TOTAL = personalPanelDataService.findTotalData(tName);
            tName = "I_ACCT_BS";    //个人借贷账户信息
            int I_JDACCT_REPORTED = personalPanelDataService.findReportedData(tName);
            int I_JDACCT_TOTAL = personalPanelDataService.findTotalData(tName);
            tName = "I_CTRCT_BS";   //个人授信协议信息
            int I_CTRCT_BS_REPORTED = personalPanelDataService.findReportedData(tName);
            int I_CTRCT_BS_TOTAL = personalPanelDataService.findTotalData(tName);
            tName = "I_GUAR_ACCT_BS";   //个人担保账户信息
            int I_GUAR_ACCT_REPORTED = personalPanelDataService.findReportedData(tName);
            int I_GUAR_ACCT_TOTAL = personalPanelDataService.findTotalData(tName);
            //插入数据到记录表
            //先获取表中当天对应记录数：有记录则更新 无记录则插入
            Map<String, Object> barMap = new HashMap<>();
            Map<String, Object> paramMap = new HashMap<>();
            barMap.put("I_BS_TOTAL", I_BS_TOTAL);
            barMap.put("I_BS_REPORTED", I_BS_REPORTED);
            barMap.put("I_EFCT_TOTAL", I_EFCT_TOTAL);
            barMap.put("I_EFCT_REPORTED", I_EFCT_REPORTED);
            barMap.put("I_FAL_MMBS_TOTAL", I_FAL_MMBS_TOTAL);
            barMap.put("I_FAL_MMBS_REPORTED", I_FAL_MMBS_REPORTED);
            barMap.put("I_CTRCT_BS_TOTAL", I_CTRCT_BS_TOTAL);
            barMap.put("I_CTRCT_BS_REPORTED", I_CTRCT_BS_REPORTED);
            barMap.put("I_GUAR_ACCT_TOTAL", I_GUAR_ACCT_TOTAL);
            barMap.put("I_GUAR_ACCT_REPORTED", I_GUAR_ACCT_REPORTED);
            barMap.put("I_JDACCT_TOTAL", I_JDACCT_TOTAL);
            barMap.put("I_JDACCT_REPORTED", I_JDACCT_REPORTED);
            barMap.put("EXTRACTION_DATE", DateUtil.getDay());
            paramMap.put("paramMap", barMap);
            paramMap.put("tName", "I_PANEL_BAR_DATA");
            int recordCount = personalPanelDataService.hasRecord("I_PANEL_BAR_DATA");
            if (recordCount == 0) {
                personalPanelDataService.addBarRecord(paramMap);
            } else {
                personalPanelDataService.updateBarRecord(paramMap);
            }
            dataList = personalPanelDataService.getBarData();
            seriesTotalData.add(dataList.get("I_BS_TOTAL"));
            seriesReportedData.add(dataList.get("I_BS_REPORTED"));
            seriesTotalData.add(dataList.get("I_EFCT_TOTAL"));
            seriesReportedData.add(dataList.get("I_EFCT_REPORTED"));
            seriesTotalData.add(dataList.get("I_FAL_MMBS_TOTAL"));
            seriesReportedData.add(dataList.get("I_FAL_MMBS_REPORTED"));
            seriesTotalData.add(dataList.get("I_CTRCT_BS_TOTAL"));
            seriesReportedData.add(dataList.get("I_CTRCT_BS_REPORTED"));
            seriesTotalData.add(dataList.get("I_GUAR_ACCT_TOTAL"));
            seriesReportedData.add(dataList.get("I_GUAR_ACCT_REPORTED"));
            seriesTotalData.add(dataList.get("I_JDACCT_TOTAL"));
            seriesReportedData.add(dataList.get("I_JDACCT_REPORTED"));
        } catch (Exception e) {
            logger.error(e.getMessage());
            map.put("code", 1); //0为成功 1为失败
            map.put("msg", "查询失败");
            map.put("total", 0);
            return map;
        }
        map.put("code", 0); //0为成功 1为失败
        map.put("msg", "查询成功");
        map.put("total", dataList.size());
        map.put("seriesTotalData", seriesTotalData);
        map.put("seriesReportedData", seriesReportedData);
        return map;
    }

    //获取折线图数据
    @RequestMapping("/getLineChartData")
    @ResponseBody
    public Map<String, Object> getLineChartData(Page page) {
        Map<String, Object> map = new HashMap<>(5);
        List<Map<String, String>> dataList;
        ArrayList t = new ArrayList();
        ArrayList l = new ArrayList();
        try {
            dataList = personalPanelDataService.getLineChartData();
            for (int i = dataList.size() - 1; i >= 0; i--) {
                t.add(dataList.get(i).get("EXTRACTION_DATE"));
                String reported_success = dataList.get(i).get("REPORTED_SUCCESS");
                String reported = dataList.get(i).get("REPORTED");
                if (Integer.parseInt(reported) == 0) {
                    l.add(100);
                } else {
                    l.add((int) (((Float.parseFloat(reported_success)) / (Integer.parseInt(reported))) * 100));
                }
            }
        } catch (Exception e) {
            logger.error(e.getMessage());
            map.put("code", 1); //0为成功 1为失败
            map.put("msg", "查询失败");
            map.put("total", 0);
            return map;
        }
        map.put("code", 0); //0为成功 1为失败
        map.put("msg", "查询成功");
        map.put("total", dataList.size());
        map.put("t", t);
        map.put("l", l);
        return map;
    }

    /**
     * 获取首页待生成、待上报、待反馈数据
     */
    @RequestMapping("/getPacketToDoCount")
    @ResponseBody
    public Map<String, Object> getPacketToDoCount(Page page) {
    	PageData pd = this.getPageData();
        Map<String, Object> map = new HashMap<>(5);
        Map<String, Integer> normalResultMap;
       // Map<String, Integer> abnormalResultMap;
        Session session = Jurisdiction.getSession();
        User user = (User)session.getAttribute(Const.SESSION_USER);
        pd.put("COMPANY", user.getCOMPANY());
        page.setPd(pd);
        //查询获取数据
        try {
            normalResultMap = personalPanelDataService.getNormalPacketToDoCount(page);
            //20220606 暂时屏蔽企业报文数据量查询
            //abnormalResultMap = personalPanelDataService.getAbnormalPacketToDoCount(page);
        } catch (Exception e) {
            logger.error(e.getMessage());
            map.put("success", false);
            map.put("msg", "查询失败");
            return map;
        }
        map.put("success", true);
        map.put("msg", "查询成功");
        map.putAll(normalResultMap);
        //20220606 暂时屏蔽企业报文数据量查询
        //map.putAll(abnormalResultMap);
        return map;
    }

}
