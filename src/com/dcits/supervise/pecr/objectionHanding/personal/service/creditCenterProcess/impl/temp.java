package com.dcits.supervise.pecr.objectionHanding.personal.service.creditCenterProcess.impl;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import java.util.*;

/**
 * @author liuyno
 * @date 2020/10/21 - 19:28
 */
public class temp {

    public static List<Map> parseMsg(Element msg) {
       // ArrayList<Map> listResult = new ArrayList<>();
        for (Iterator<Element> it = msg.elementIterator(); it.hasNext(); ) {
            //Map<String, Object> result = new HashMap<>();
            Element next = it.next();
            System.out.println(next);
            System.out.println(next);
            System.out.println(next.content());
        }
        return null;
    }


    public static void main(String[] args) {
        String text = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n" +"<Document>"+
                "<Msg>\n" +
                "<ResultCode>AAA000</ResultCode>\n" +
                "<ResultDesc>处理成功</ResultDesc> <ObjCheckID>askdalsdl</ObjCheckID> <EnclosureFlag>Y</EnclosureFlag> <EnclosureInf>skkdaksllsalddkfkskdfks</EnclosureInf></Msg></Document>";
        try {
            Document document = DocumentHelper.parseText(text);
            Element rootElement = document.getRootElement();
            Element msg = rootElement.element("Msg");
            List<Map> maps = parseMsg(msg);
            System.out.println(maps);
        } catch (
                DocumentException e) {
            e.printStackTrace();
        }
    }
}
