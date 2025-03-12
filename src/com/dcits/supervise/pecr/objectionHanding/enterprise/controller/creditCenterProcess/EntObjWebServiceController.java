package com.dcits.supervise.pecr.objectionHanding.enterprise.controller.creditCenterProcess;

import com.alibaba.druid.support.json.JSONUtils;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.AObjectionHandingInterface.ServiceName;
import com.dcits.supervise.pecr.objectionHanding.enterprise.service.creditCenterProcess.EntObjWebServiceService;
import com.dcits.supervise.pecr.objectionHanding.entity.CreditCenterObjHandingEntity;
import com.dcits.supervise.pecr.objectionHanding.entity.EntCreditCenterObjHandingEntity;
import com.dcits.supervise.pecr.objectionHanding.entity.HistoricalCheckInfEntity;
import com.dcits.supervise.pecr.objectionHanding.entity.LocateInfEntity;
import com.dcits.supervise.pecr.objectionHanding.factory.impl.EobjMsgFactory;
import com.dcits.supervise.pecr.objectionHanding.factory.impl.EobjMsgFactory;
import com.dcits.supervise.pecr.objectionHanding.personal.service.creditCenterProcess.ObjectionMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 通过前台点击调用异议处理webservice服务入口Controller
 *
 * @author 
 * @date 2020/10/19 - 17:28
 */
@Controller
//@RequestMapping("/entObjWebService")
public class EntObjWebServiceController extends BaseController {

    /**
     * WebService异议处理服务代理类
     */

    /**
     * 异议处理报文数据与数据库交互service
     */
    @Autowired
    private EntObjWebServiceService entObjWebServiceService;

    //展示页面
    @RequestMapping("/dataPageCreditCenterObjection")
    public String dataPageIndvObjectionRegiste() {
        return "pecr/objectionHanding/creditCenterEnterpriseObjection";
    }

    //异议数据列表展示
    @RequestMapping("/objectionDataList")
    @ResponseBody
    public Map<String, Object> objectionDataList(Page page) {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        try {
            PageData pd = this.getPageData();
            int pge = Integer.parseInt(pd.getString("page"));
            int limit = Integer.parseInt(pd.getString("limit"));
            page.setCurrentPage(pge);
            page.setShowCount(limit);
            page.setPd(pd);
            List<EntCreditCenterObjHandingEntity> list = null;
            list = entObjWebServiceService.objectionList(page);
            resultMap.put("data", list);
            resultMap.put("code", 0);
            resultMap.put("msg", "查询成功");
            resultMap.put("count", page.getTotalResult());
        } catch (Exception e) {
            e.printStackTrace();
            resultMap.put("code", 1);
            resultMap.put("msg", "查询失败");
            logger.error("-----------企业异议列表信息查询失败--------------");
        }
        return resultMap;
    }


    //获取企业待核查异议事项
    @RequestMapping("/getToCheckObjection")
    @ResponseBody
    public Map<String, Object> getToCheckObjection() {
        Map<String, Object> resultMap = new HashMap<String, Object>(3);
        try {
            PageData pageData = this.getPageData();//页面请求参数
            String messageType = pageData.getString("messageType");
            //组装请求报文
            ObjectionMessage objectionMessage = EobjMsgFactory.getInstance().create(messageType);
            //String message = objectionMessage.generateMessage(pageData);
            objectionMessage.generateMessage(pageData);
            //发送webservice请求,获得反馈报文
            //String feedbackMessage = objectionHandingService.bsGetToCheckObjReq(message);
            String feedbackMessage = "";
            //解析反馈报文并入库
            Map<String, Object> messageMap = objectionMessage.parseMessage(feedbackMessage);
            if ((boolean) messageMap.get("success")) {
                //处理成功，插入数据到数据库
                ArrayList<Map> listResultMap = (ArrayList<Map>) messageMap.get("resultDesc");
                //遍历每一个异议事项单
                for (int i = 0; i < listResultMap.size(); i++) {
                    logger.info("------------开始入库异议事项单:" + i + "--------------");
                    Map<String, Object> map = listResultMap.get(i);
                    //获取已入库事项单数据的主键，作为历史核查数据的外键
                    String toCheckId = entObjWebServiceService.insertToCheckInf(map);
                    ArrayList<Map> historicalCheckInfs = (ArrayList<Map>) map.get("historicalCheckInf");
                    //遍历每个事项单中的历史核查信息
                    for (int x = 0; x < historicalCheckInfs.size(); x++) {
                        logger.info("------------开始入库异议事项单:" + i + "的历史核查信息:" + x + "--------------");
                        HashMap<String, String> historicalCheckInf = (HashMap<String, String>) historicalCheckInfs.get(x);
                        historicalCheckInf.put("creditCenterObjHandingId", toCheckId);
                        entObjWebServiceService.insertHistoricalCheckInf(historicalCheckInf);
                        logger.info("------------完成入库异议事项单:" + i + "的历史核查信息:" + x + "--------------");
                    }
                    logger.info("------------完成入库异议事项单:" + i + "--------------");
                }
            }
            resultMap.putAll(messageMap);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("获取企业待核查异议事项请求出错");
        }
        return resultMap;
    }

    //获取企业待核查异议事项附件信息
    @RequestMapping("/getObjAnnex")
    @ResponseBody
    public Map<String, Object> getObjAnnex() {
        Map<String, Object> resultMap = new HashMap<String, Object>(3);
        try {
            PageData pageData = this.getPageData();//页面请求参数
            String messageType = pageData.getString("messageType");
            //组装请求报文
            ObjectionMessage objectionMessage =  EobjMsgFactory.getInstance().create(messageType);
            //String message = objectionMessage.generateMessage(pageData);
            objectionMessage.generateMessage(pageData);
            //发送webservice请求,获得反馈报文  
            //String feedbackMessage = objectionHandingService.bsGetEncloReq(message);
            String feedbackMessage = "";
            //解析反馈报文并入库
            Map<String, Object> messageMap = objectionMessage.parseMessage(feedbackMessage);
            if ((boolean) messageMap.get("success")) {
                logger.info("------------开始入库异议事项附件信息--------------");
                //处理成功，插入数据到数据库
                ArrayList<Map> listResultMap = (ArrayList<Map>) messageMap.get("resultDesc");
                //此时listResultMap中只有一条数据记录，无需遍历
                HashMap<String, String> annexMap = (HashMap<String, String>) listResultMap.get(0);
                entObjWebServiceService.updateObjAnnexById(annexMap);
                logger.info("------------完成入库异议事项附件信息--------------");
            }
            resultMap.putAll(messageMap);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("获取企业待核查异议事项附件信息请求出错");
        }
        return resultMap;
    }

    //反馈企业异议事项核查结果
    @RequestMapping("/feedbackCheckResult")
    @ResponseBody
    public Map<String, Object> feedbackCheckResult() {
        Map<String, Object> resultMap = new HashMap<String, Object>(3);
        try {
            PageData pageData = this.getPageData();//页面请求参数
            String messageType = pageData.getString("messageType");
            //组装请求报文
            ObjectionMessage objectionMessage =  EobjMsgFactory.getInstance().create(messageType);
            //String message = objectionMessage.generateMessage(pageData);
            objectionMessage.generateMessage(pageData);
            //发送webservice请求,获得反馈报文
            //String feedbackMessage = objectionHandingService.bsObjCheckResultReq(message);
            String feedbackMessage ="";
            //解析反馈报文并入库
            Map<String, Object> messageMap = objectionMessage.parseMessage(feedbackMessage);
            if ((boolean) messageMap.get("success")) {
                logger.info("------------开始入库异议事项核查结果--------------");
                //处理成功，插入数据到数据库
                ArrayList<Map> listResultMap = (ArrayList<Map>) messageMap.get("resultDesc");
                //此时listResultMap中只有一条数据记录，无需遍历
                HashMap<String, String> feedbackCheckResultResponseMap = (HashMap<String, String>) listResultMap.get(0);
                //将前台用户输入的数据一并更新
                feedbackCheckResultResponseMap.put("rfIvrCheckResult", pageData.getString("rfIvrCheckResult"));
                feedbackCheckResultResponseMap.put("rfIvrCheckResultDesc", pageData.getString("rfIvrCheckResultDesc"));
                entObjWebServiceService.updateFeedbackCheckResultById(feedbackCheckResultResponseMap);
                logger.info("------------完成入库异议事项核查结果--------------");
            }
            resultMap.putAll(messageMap);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("反馈企业异议事项核查结果请求出错");
        }
        return resultMap;
    }

    //反馈企业异议事项更正结果
    @RequestMapping("/feedbackCorrectResult")
    @ResponseBody
    public Map<String, Object> feedbackCorrectResult() {
        Map<String, Object> resultMap = new HashMap<String, Object>(3);
        try {
            PageData pageData = this.getPageData();//页面请求参数
            String messageType = pageData.getString("messageType");
            //组装请求报文
            ObjectionMessage objectionMessage =  EobjMsgFactory.getInstance().create(messageType);
            //String message = objectionMessage.generateMessage(pageData);
            objectionMessage.generateMessage(pageData);
            //发送webservice请求,获得反馈报文
            //String feedbackMessage = objectionHandingService.bsObjCorrectResultReq(message);
            String feedbackMessage = "";
            //解析反馈报文并入库
            Map<String, Object> messageMap = objectionMessage.parseMessage(feedbackMessage);
            if ((boolean) messageMap.get("success")) {
                logger.info("------------开始入库异议事项更正结果--------------");
                //处理成功，插入数据到数据库
                ArrayList<Map> listResultMap = (ArrayList<Map>) messageMap.get("resultDesc");
                //此时listResultMap中只有一条数据记录，无需遍历
                HashMap<String, String> feedbackCorrectResultResponseMap = (HashMap<String, String>) listResultMap.get(0);
                //将前台用户输入的数据一并更新
                feedbackCorrectResultResponseMap.put("fopoacrrCorrectResult", pageData.getString("fopoacrrCorrectResult"));
                feedbackCorrectResultResponseMap.put("fopoacrrEnclosureInf", pageData.getString("fopoacrrEnclosureInf"));
                feedbackCorrectResultResponseMap.put("fopoacrrCorrectDesc", pageData.getString("fopoacrrCorrectDesc"));
                entObjWebServiceService.updateFeedbackCorrectResultById(feedbackCorrectResultResponseMap);
                logger.info("------------完成入库异议事项更正结果--------------");
            }
            resultMap.putAll(messageMap);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("反馈企业异议事项更正结果请求出错");
        }
        return resultMap;
    }

    //查询企业异议事项更正结果接受情况
    @RequestMapping("/findReceiveResult")
    @ResponseBody
    public Map<String, Object> findReceiveResult() {
        Map<String, Object> resultMap = new HashMap<String, Object>(3);
        try {
            PageData pageData = this.getPageData();//页面请求参数
            String messageType = pageData.getString("messageType");
            //组装请求报文
            ObjectionMessage objectionMessage =  EobjMsgFactory.getInstance().create(messageType);
            //String message = objectionMessage.generateMessage(pageData);
            objectionMessage.generateMessage(pageData);
            //发送webservice请求,获得反馈报文
            //String feedbackMessage = objectionHandingService.bsObjCorrectResultQueryReq(message);
            String feedbackMessage = "";
            //解析反馈报文并入库
            Map<String, Object> messageMap = objectionMessage.parseMessage(feedbackMessage);
            if ((boolean) messageMap.get("success")) {
                logger.info("------------开始入库异议更正结果接收情况--------------");
                //处理成功，插入数据到数据库
                ArrayList<Map> listResultMap = (ArrayList<Map>) messageMap.get("resultDesc");
                //此时listResultMap中只有一条数据记录，无需遍历
                HashMap<String, String> receiveResultMap = (HashMap<String, String>) listResultMap.get(0);
                entObjWebServiceService.updateReceiveResultById(receiveResultMap);
                logger.info("------------完成入库异议更正结果接收情况--------------");
            }
            resultMap.putAll(messageMap);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("查询企业异议事项更正结果接受情况接口请求出错");
        }
        return resultMap;
    }

    //添加企业标注
    @RequestMapping("/addObjLabel")
    @ResponseBody
    public Map<String, Object> addObjLabel() {
        Map<String, Object> resultMap = new HashMap<String, Object>(3);
        try {
            PageData pageData = this.getPageData();//页面请求参数
            String messageType = pageData.getString("messageType");
            //组装请求报文
            ObjectionMessage objectionMessage =  EobjMsgFactory.getInstance().create(messageType);
            //String message = objectionMessage.generateMessage(pageData);
            objectionMessage.generateMessage(pageData);
            //发送webservice请求,获得反馈报文
            //String feedbackMessage = objectionHandingService.bsAddTagReq(message);
            String feedbackMessage ="";
            //解析反馈报文并入库
            Map<String, Object> messageMap = objectionMessage.parseMessage(feedbackMessage);
            if ((boolean) messageMap.get("success")) {
                logger.info("------------开始入库添加企业异议信息标注--------------");
                //处理成功，插入数据到数据库
                ArrayList<Map> listResultMap = (ArrayList<Map>) messageMap.get("resultDesc");
                //此时listResultMap中只有一条数据记录，无需遍历
                HashMap<String, String> addObjLabelMap = (HashMap<String, String>) listResultMap.get(0);
                addObjLabelMap.put("aplrLocateInfNm", pageData.getString("aplrLocateInfNm"));
                addObjLabelMap.put("aplrObjDesc", pageData.getString("aplrObjDesc"));
                entObjWebServiceService.updateAddObjLabelById(addObjLabelMap);
                //更新定位类型表信息
                String[] locateInfList = pageData.getString("locateInfList[]").split(",");
                for (int i = 0; i < locateInfList.length; i++) {
                    addObjLabelMap.put("locateInfType", locateInfList[i]);
                    entObjWebServiceService.insertLocalInfById(addObjLabelMap);
                }
                logger.info("------------完成入库添加企业异议信息标注--------------");
            }
            resultMap.putAll(messageMap);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("添加企业异议信息标注请求出错");
        }
        return resultMap;
    }

    //删除企业标注
    @RequestMapping("/deleteObjLabel")
    @ResponseBody
    public Map<String, Object> deleteObjLabel() {
        Map<String, Object> resultMap = new HashMap<String, Object>(3);
        try {
            PageData pageData = this.getPageData();//页面请求参数
            String messageType = pageData.getString("messageType");
            //组装请求报文
            ObjectionMessage objectionMessage =  EobjMsgFactory.getInstance().create(messageType);
            //String message = objectionMessage.generateMessage(pageData);
            objectionMessage.generateMessage(pageData);
            //发送webservice请求,获得反馈报文
            //String feedbackMessage = objectionHandingService.bsDelTagReq(message);
            String feedbackMessage ="";
            //解析反馈报文并入库
            Map<String, Object> messageMap = objectionMessage.parseMessage(feedbackMessage);
            if ((boolean) messageMap.get("success")) {
                logger.info("------------开始入库删除企业异议信息标注--------------");
                //处理成功，插入数据到数据库
                ArrayList<Map> listResultMap = (ArrayList<Map>) messageMap.get("resultDesc");
                //此时listResultMap中只有一条数据记录，无需遍历
                HashMap<String, String> deleteObjLabelMap = (HashMap<String, String>) listResultMap.get(0);
                entObjWebServiceService.updateDeleteObjLabelById(deleteObjLabelMap);
                logger.info("------------完成入库删除企业异议信息标注--------------");
            }
            resultMap.putAll(messageMap);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("删除企业异议信息标注请求出错");
        }
        return resultMap;
    }

    //删除异议事项单
    @RequestMapping("/deleteToCheckObjection")
    @ResponseBody
    public Map<String, Object> deleteToCheckObjection() {
        Map<String, Object> resultMap = new HashMap<String, Object>(3);
        try {
            PageData pageData = this.getPageData();//页面请求参数
            String creditCenterObjHandingId = pageData.getString("creditCenterObjHandingId");
            entObjWebServiceService.deleteToCheckObjectionById(creditCenterObjHandingId);
            entObjWebServiceService.deleteHistoricalCheckInf(creditCenterObjHandingId);
            entObjWebServiceService.deleteLocateInf(creditCenterObjHandingId);
            resultMap.put("success", true);
            resultMap.put("msg", "删除成功");
        } catch (Exception e) {
            e.printStackTrace();
            resultMap.put("success", false);
            resultMap.put("msg", "删除失败");
        }
        return resultMap;
    }

    //查看详情
    @RequestMapping("/objectionDetail")
    public ModelAndView dataDetail(Page page) {
        ModelAndView mv = this.getModelAndView();
        try {
            PageData pd = this.getPageData();
            PageData ToCheckObjection = entObjWebServiceService.getToCheckObjectionById(pd);
            mv.addObject("ToCheckObjection", JSONUtils.toJSONString(ToCheckObjection));
            mv.addObject("pd", pd);
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        mv.setViewName("pecr/objectionHanding/creditCenterEnterpriseObjectionDetail");
        return mv;
    }

    //查询异议事项单对应的历史核查记录
    @RequestMapping("/getHistoricalCheckInfList")
    @ResponseBody
    public Map<String, Object> getHistoricalCheckInfList(Page page) {
        Map<String, Object> resultMap = new HashMap<String, Object>(3);
        try {
            PageData pd = this.getPageData();
            String creditCenterObjHandingId = pd.getString("creditCenterObjHandingId");
            List<HistoricalCheckInfEntity> HistoricalCheckInfList = entObjWebServiceService.getHistoricalCheckInfById(creditCenterObjHandingId);
            resultMap.put("data", HistoricalCheckInfList);
            resultMap.put("code", 0);
            resultMap.put("count", page.getTotalResult());
            resultMap.put("msg", "查询成功");
        } catch (Exception e) {
            logger.error(e.getMessage());
            resultMap.put("code", 1);
            resultMap.put("msg", "查询失败");
        }
        return resultMap;
    }

    //查询企业标注对应的定位信息
    @RequestMapping("/getLocateInfList")
    @ResponseBody
    public Map<String, Object> getLocateInfList(Page page) {
        Map<String, Object> resultMap = new HashMap<String, Object>(3);
        try {
            PageData pd = this.getPageData();
            String creditCenterObjHandingId = pd.getString("creditCenterObjHandingId");
            List<LocateInfEntity> LocateInfList = entObjWebServiceService.getLocateInfById(creditCenterObjHandingId);
            resultMap.put("data", LocateInfList);
            resultMap.put("code", 0);
            resultMap.put("count", page.getTotalResult());
            resultMap.put("msg", "查询成功");
        } catch (Exception e) {
            logger.error(e.getMessage());
            resultMap.put("code", 1);
            resultMap.put("msg", "查询失败");
        }
        return resultMap;
    }
}
