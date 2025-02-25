package com.dcits.supervise.pecr.objectionHanding.enterprise.service.creditCenterProcess.impl;

import com.dcits.platform.util.PageData;
import org.dom4j.Element;

import java.util.*;

/**
 * 企业待核查异议报文-enterprise objection message to be verified
 *
 * @author wzy
 * @date 2020/10/20 - 15:39
 */
public class EormtbvObjectioinMessage extends AbstractGenerateObjectionMessage {

    //请求
    @Override
    public Element getMsg(Element e, PageData pd, Properties p) {
        e.addElement("OriginateOrgCode").setText(p.getProperty("sendOrgCode"));
        e.addElement("OriginateUserCode").setText(p.getProperty("userCode"));
        e.addElement("BeginDate").setText(pd.getString("beginDate"));
        e.addElement("EndDate").setText(pd.getString("endDate"));
        return e;
    }

    //应答
    @Override
    public List<Map> parseMsg(Element msg) {
        //异议事项单个数
        String toCheckNm = msg.elementText("ToCheckNm");
        ArrayList<Map> listCheckInf = new ArrayList<>(Integer.parseInt(toCheckNm));
        //遍历XML<ToCheckInf>节点
        for (Iterator<Element> i = msg.elementIterator("ToCheckInf"); i.hasNext(); ) {
            //创建用于存放历史核查信息的容器
            ArrayList<Map> listHistoricalCheckInf = new ArrayList<>();
            //得到每一个ToCheckInf节点
            Element element = i.next();
            Map<String, Object> checkInf = new HashMap<>();
            //获取ToCheckInf下的每一个子节点
            String objCheckID = element.selectSingleNode("ObjCheckID").getText();
            checkInf.put("objCheckId", objCheckID);
            String objCheckNum = element.selectSingleNode("ObjCheckNum").getText();
            checkInf.put("objCheckNum", objCheckNum);
            String checkBeginDate = element.selectSingleNode("CheckBeginDate").getText();
            checkInf.put("checkBeginDate", checkBeginDate);
            String name = element.selectSingleNode("Name").getText();
            checkInf.put("name", name);
            String idType = element.selectSingleNode("IDType").getText();
            checkInf.put("idType", idType);
            String idNum = element.selectSingleNode("IDNum").getText();
            checkInf.put("idNum", idNum);
            String phoneNum = element.selectSingleNode("PhoneNum").getText();
            checkInf.put("phoneNum", phoneNum);
            String objItemInf = element.selectSingleNode("ObjItemInf").getText();
            checkInf.put("objItemInf", objItemInf);
            String objItemDesc = element.selectSingleNode("ObjItemDesc").getText();
            checkInf.put("objItemDesc", objItemDesc);
            String dataProviderOrgCode = element.selectSingleNode("DataProviderOrgCode").getText();
            checkInf.put("dataProviderOrgCode", dataProviderOrgCode);
            String dataOccurOrgCode = element.selectSingleNode("DataOccurOrgCode").getText();
            checkInf.put("dataOccurOrgCode", dataOccurOrgCode);
            String businessCode = element.selectSingleNode("BusinessCode").getText();
            checkInf.put("businessCode", businessCode);
            String businessType = element.selectSingleNode("BusinessType").getText();
            checkInf.put("businessType", businessType);
            String checkFinalDate = element.selectSingleNode("CheckFinalDate").getText();
            checkInf.put("checkFinalDate", checkFinalDate);
            String dataOccurDate = element.selectSingleNode("DataOccurDate").getText();
            checkInf.put("dataOccurDate", dataOccurDate);
            String dataOccurAmount = element.selectSingleNode("DataOccurAmount").getText();
            checkInf.put("dataOccurAmount", dataOccurAmount);
            String enclosureFlag = element.selectSingleNode("EnclosureFlag").getText();
            checkInf.put("enclosureFlag", enclosureFlag);
            for (Iterator<Element> it = element.elementIterator("HistoricalCheckInf"); it.hasNext(); ) {
                HashMap<String, String> historicalCheckInf = new HashMap<>();
                Element next = it.next();
                String checkTime = next.selectSingleNode("CheckTime").getText();
                historicalCheckInf.put("checkTime", checkTime);
                String checkResult = next.selectSingleNode("CheckResult").getText();
                historicalCheckInf.put("checkResult", checkResult);
                String checkResultDesc = next.selectSingleNode("CheckResultDesc").getText();
                historicalCheckInf.put("checkResultDesc", checkResultDesc);
                String checkOrgCode = next.selectSingleNode("CheckOrgCode").getText();
                historicalCheckInf.put("checkOrgCode", checkOrgCode);
                String checkUserCode = next.selectSingleNode("CheckUserCode").getText();
                historicalCheckInf.put("checkUserCode", checkUserCode);
                String phoneNum1 = next.selectSingleNode("PhoneNum").getText();
                historicalCheckInf.put("phoneNum", phoneNum1);
                String checkAcceptFlag = next.selectSingleNode("CheckAcceptFlag").getText();
                historicalCheckInf.put("checkAcceptFlag", checkAcceptFlag);
                String checkOpinion = next.selectSingleNode("CheckOpinion").getText();
                historicalCheckInf.put("checkOpinion", checkOpinion);
                //把每组历史核查信息放入list
                listHistoricalCheckInf.add(historicalCheckInf);
            }
            checkInf.put("historicalCheckInf",listHistoricalCheckInf);
            //把每组异议事项单信息放入list
            listCheckInf.add(checkInf);
        }
        return listCheckInf;
    }
}
