package com.dcits.supervise.pecr.objectionHanding.personal.service.creditCenterProcess.impl;

import com.dcits.platform.util.PageData;
import org.dom4j.Element;

import java.util.*;

/**
 * 查询个人异议事项更正结果接受情况-Acceptance of correction results of personal objections
 * @author 穆楠
 * @date 2020/10/20 - 16:45
 */
public class AcrpObjectionMessage extends AbstractGenerateObjectionMessage {

    @Override
    public Element getMsg(Element e, PageData pd, Properties p) {
        e.addElement("OriginateOrgCode").setText(p.getProperty("sendOrgCode"));
        e.addElement("OriginateUserCode").setText(p.getProperty("userCode"));
        e.addElement("ObjCheckID").setText(pd.getString("objCheckId"));
        return e;
    }

    @Override
    public List<Map> parseMsg(Element msg) {
        ArrayList<Map> listResult = new ArrayList<>();
        Map<String, Object> result = new HashMap<>();
        String resultCode = msg.selectSingleNode("ResultCode").getText();
        result.put("pocrasrResultCode", resultCode);
        String resultDesc = msg.selectSingleNode("ResultDesc").getText();
        result.put("pocrasrResultDesc", resultDesc);
        String objCheckID = msg.selectSingleNode("ObjCheckID").getText();
        result.put("objCheckId", objCheckID);
        String enclosureFlag = msg.selectSingleNode("EnclosureFlag").getText();
        result.put("pocrasrCorrectAcceptFlag", enclosureFlag);
        String enclosureInf = msg.selectSingleNode("EnclosureInf").getText();
        result.put("pocrasrCorrectOpinion", enclosureInf);
        listResult.add(result);
        return listResult;
    }
}
