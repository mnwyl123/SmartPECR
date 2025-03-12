package com.dcits.supervise.pecr.objectionHanding.enterprise.service.creditCenterProcess.impl;

import com.dcits.platform.util.PageData;
import org.dom4j.Element;

import java.util.*;

/**
 * 反馈企业异议事项更正结果报文-Feedback request message for correction of enterprise objections
 *
 * @author 
 * @date 2020/10/20 - 16:58
 */
public class FrmcoeObjectionMessage extends AbstractGenerateObjectionMessage {

    @Override
    public Element getMsg(Element e, PageData pd, Properties p) {
        e.addElement("OriginateOrgCode").setText(p.getProperty("sendOrgCode"));
        e.addElement("OriginateUserCode").setText(p.getProperty("userCode"));
        e.addElement("ObjCheckID").setText(pd.getString("objCheckId"));
        e.addElement("CheckResult").setText(pd.getString("fopoacrrCorrectResult"));
        e.addElement("EnclosureInf").setText(pd.getString("fopoacrrEnclosureInf"));
        e.addElement("CorrectDesc").setText(pd.getString("fopoacrrCorrectDesc"));
        return e;
    }

    @Override
    public List<Map> parseMsg(Element msg) {
        ArrayList<Map> listResult = new ArrayList<>();
        Map<String, Object> result = new HashMap<>();
        String resultCode = msg.selectSingleNode("ResultCode").getText();
        result.put("fopoacrResultCode", resultCode);
        String resultDesc = msg.selectSingleNode("ResultDesc").getText();
        result.put("fopoacrResultDesc", resultDesc);
        listResult.add(result);
        return listResult;
    }
}
