package com.dcits.supervise.pecr.objectionHanding.personal.service.creditCenterProcess.impl;

import com.dcits.platform.util.PageData;
import org.dom4j.Element;

import java.util.*;

/**
 * 反馈个人异议事项核查结果报文-Request message for feedback of verification results of personal objections
 *
 * @author liuyno
 * @date 2020/10/20 - 16:49
 */
public class RmfvrpObjectionMessage extends AbstractGenerateObjectionMessage {

    @Override
    public Element getMsg(Element e, PageData pd, Properties p) {
        e.addElement("OriginateOrgCode").setText(p.getProperty("sendOrgCode"));
        e.addElement("OriginateUserCode").setText(p.getProperty("userCode"));
        e.addElement("PhoneNum").setText(pd.getString("phoneNum"));
        e.addElement("ObjCheckID").setText(pd.getString("objCheckId"));
        e.addElement("ObjCheckNum").setText(pd.getString("objCheckNum"));
        e.addElement("CheckResult").setText(pd.getString("rfIvrCheckResult"));
        e.addElement("CheckResultDesc").setText(pd.getString("rfIvrCheckResultDesc"));
        return e;
    }

    @Override
    public List<Map> parseMsg(Element msg) {
        ArrayList<Map> listResult = new ArrayList<>();
        Map<String, Object> result = new HashMap<>();
        String resultCode = msg.selectSingleNode("ResultCode").getText();
        result.put("afIvrResultCode", resultCode);
        String resultDesc = msg.selectSingleNode("ResultDesc").getText();
        result.put("afIvrResultDesc", resultDesc);
        listResult.add(result);
        return listResult;
    }
}
