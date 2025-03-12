package com.dcits.supervise.pecr.objectionHanding.personal.controller.creditCenterProcess;


import com.dcits.platform.util.PageData;
import org.bouncycastle.util.encoders.Hex;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.pbccrc.collectclient.api.utils.sm3.SM3Digest;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * 该类暂时无用
 * 异议处理报文组装工具类
 *
 * @author 穆楠
 * @date 2020/9/15 - 17:19
 */
public class ObjectionMesAssemblyUtil {

    //换行符
    private static String newlineSeparator = System.getProperty("line.separator");


    /**
     * 使用dom4j解析XML到Map中
     *
     * @param xmlMessage 待解析为JavaBean的XML
     * @param object     与XML对应的JavaBean对象
     * @return void
     * @Author 穆楠
     * @Description
     * @Date 2020/9/17 19:25
     */
    public static PageData parseXmlToPd(String xmlMessage, Object object) throws Exception {
        PageData pd = new PageData();
        Document doc = DocumentHelper.parseText(xmlMessage);
        Element rootElement = doc.getRootElement();//Document根节点
        List<Element> elements = rootElement.elements();
        Element element = elements.get(0);//Msg节点
        elementToPd(pd, element.elements());
        return pd;
    }


    private static void elementToPd(PageData pd, List<Element> elements) {
        for (Element element : elements) {
            if (element.elements().size() != 0) {
                PageData childPd = new PageData();
                Set<String> repeatNodeName = RepeatChild(element.elements());
                if (repeatNodeName.size() > 0) {
                    //重复元素
                    for (String attrName : repeatNodeName) {
                        String eightVal = null; //存放长度为8位但有重复元素的值，将此值以“|”连接到一块
                        List<PageData> list = new ArrayList<PageData>();
                        List<Element> li = element.elements(attrName);
                        String key = attrName;
                        for (Element el : li) {
                            if (attrName.length() == 8) {
                                if (eightVal == null) eightVal = String.valueOf(el.getData()).replace("null", "");
                                else eightVal += "|" + String.valueOf(el.getData()).replace("null", "");
                                element.remove(el); //去掉重复的节点
                                continue;
                            }
                            PageData p = new PageData();
                            if (el.elements().size() > 0) {
                                //重复元素有子节点
                                elementToPd(p, el.elements());
                                list.add(p);
                                element.remove(el); //去掉重复的节点
                            } else {
                                key = element.getName();
                                //重复元素没有子节点
                                p.put(el.getName(), el.getData());
                                list.add(p);
                                element.remove(el); //去掉重复的节点
                            }
                        }
                        if (attrName.length() == 8) {
                            childPd.put(key, eightVal);
                        } else {
                            childPd.put(key, list); //将重复元素存放为List<PageData>形式
                        }

                    }
                    //不重复元素
                    elementToPd(childPd, element.elements());
                } else {
                    elementToPd(childPd, element.elements());
                }
                pd.put(element.getName(), childPd);
            } else {
                String name = element.getName();
                String val = String.valueOf(element.getData());
                pd.put(name, val);
            }
        }
    }

    /**
     * 查找Element的子节点的重复元素的属性名称
     *
     * @param elements
     * @return
     */
    private static Set<String> RepeatChild(List<Element> elements) {
        PageData pd = new PageData();
        Set<String> repeatNode = new HashSet<String>(); //重复元素
        for (Element element : elements) {
            if (pd.containsKey(element.getName())) {
                repeatNode.add(element.getName());
            }
            pd.put(element.getName(), null);
        }
        return repeatNode;
    }

    /**
     * 类似与MD5的摘要加密算法
     * @param password
     * @return
     */
    private static String SM3Encrypt(String password) {
        byte[] md = new byte[32];
        byte[] msg1 = password.getBytes();
        SM3Digest sm3 = new SM3Digest();
        sm3.update(msg1, 0, msg1.length);
        sm3.doFinal(md, 0);
        String s = new String(Hex.encode(md));
        return s;
    }



    public static void main(String[] args) throws Exception {

    }
}
