package com.dcits.supervise.pecr.objectionHanding.enterprise.service.creditCenterProcess.impl;

import com.dcits.platform.util.PageData;
import org.dom4j.Element;

import java.util.*;

/**
 * 企业待核查异议事项附件信息-Attachment to enterprise objections to be verified
 * @author 
 * @date 2020/10/20 - 16:45
 */
public class AteotbvObjectionMessage extends AbstractGenerateObjectionMessage {

    //请求
    @Override
    public Element getMsg(Element e, PageData pd, Properties p) {
        e.addElement("OriginateOrgCode").setText(p.getProperty("sendOrgCode"));
        e.addElement("OriginateUserCode").setText(p.getProperty("userCode"));
        e.addElement("ObjCheckID").setText(pd.getString("objCheckId"));
        return e;
    }

    //应答
    @Override
    public List<Map> parseMsg(Element msg) {
        ArrayList<Map> listResult = new ArrayList<>();
        Map<String, Object> result = new HashMap<>();
        String resultCode = msg.selectSingleNode("ResultCode").getText();
        result.put("airmfResultCode", resultCode);
        String resultDesc = msg.selectSingleNode("ResultDesc").getText();
        result.put("airmfResultDesc", resultDesc);
        String objCheckID = msg.selectSingleNode("ObjCheckID").getText();
        result.put("objCheckId", objCheckID);
        String enclosureFlag = msg.selectSingleNode("EnclosureFlag").getText();
        result.put("airmfEnclosureFlag", enclosureFlag);
        String enclosureInf = msg.selectSingleNode("EnclosureInf").getText();
        result.put("airmfEnclosureInf", enclosureInf);
        listResult.add(result);
        return listResult;
    }
}
