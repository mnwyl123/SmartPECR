package com.dcits.supervise.pecr.objectionHanding.personal.service.creditCenterProcess.impl;

import com.dcits.platform.util.PageData;
import org.dom4j.Element;

import java.util.*;

/**
 * 添加个人标注报文-Add personal labeling request message
 * @author 穆楠
 * @date 2020/10/20 - 17:03
 */
public class AplrmObjectionMessage extends AbstractGenerateObjectionMessage {

    //请求
    @Override
    public Element getMsg(Element e, PageData pd, Properties p) {
        e.addElement("OriginateOrgCode").setText(p.getProperty("sendOrgCode"));
        e.addElement("OriginateUserCode").setText(p.getProperty("userCode"));
        e.addElement("Name").setText(pd.getString("name"));
        e.addElement("IDType").setText(pd.getString("idType"));
        e.addElement("IDNum").setText(pd.getString("idNum"));
        e.addElement("BusinessCode").setText(pd.getString("businessCode"));
        e.addElement("LocateInfNm").setText(pd.getString("aplrLocateInfNm"));
        Element locateInf = e.addElement("LocateInf");
        //待完成--添加定位信息类型，添加个数等于LocateInfNm值
        locateInf.addElement("LocateInfType").setText("");
        e.addElement("DataOccurOrgCode").setText(p.getProperty("sendOrgCode"));
        e.addElement("ObjDesc").setText(pd.getString("aplrObjDesc"));
        return e;
    }

    //应答
    @Override
    public List<Map> parseMsg(Element msg) {
        ArrayList<Map> listResult = new ArrayList<>();
        Map<String, Object> result = new HashMap<>();
        String resultCode = msg.selectSingleNode("ResultCode").getText();
        result.put("aparResultCode", resultCode);
        String resultDesc = msg.selectSingleNode("ResultDesc").getText();
        result.put("aparResultDesc", resultDesc);
        String serviceReturnCode = msg.selectSingleNode("ServiceReturnCode").getText();
        result.put("aparServiceReturnCode", serviceReturnCode);
        listResult.add(result);
        return listResult;
    }
}
