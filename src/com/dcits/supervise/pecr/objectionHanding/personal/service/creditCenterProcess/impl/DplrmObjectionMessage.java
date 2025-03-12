package com.dcits.supervise.pecr.objectionHanding.personal.service.creditCenterProcess.impl;

import com.dcits.platform.util.PageData;
import org.dom4j.Element;

import java.util.*;

/**
 * 删除个人标注报文-Delete personal labeling request message
 *
 * @author 穆楠
 * @date 2020/10/20 - 17:11
 */
public class DplrmObjectionMessage extends AbstractGenerateObjectionMessage {

    @Override
    public Element getMsg(Element e, PageData pd, Properties p) {
        e.addElement("OriginateOrgCode").setText(p.getProperty("sendOrgCode"));
        e.addElement("OriginateUserCode").setText(p.getProperty("userCode"));
        e.addElement("ServiceReturnCode").setText(pd.getString("serviceReturnCode"));
        return e;
    }

    @Override
    public List<Map> parseMsg(Element msg) {
        ArrayList<Map> listResult = new ArrayList<>();
        Map<String, Object> result = new HashMap<>();
        String resultCode = msg.selectSingleNode("ResultCode").getText();
        result.put("darResultCode", resultCode);
        String resultDesc = msg.selectSingleNode("ResultDesc").getText();
        result.put("darResultDesc", resultDesc);
        listResult.add(result);
        return listResult;
    }
}
