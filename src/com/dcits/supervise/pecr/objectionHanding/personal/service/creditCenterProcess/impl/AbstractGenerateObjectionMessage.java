package com.dcits.supervise.pecr.objectionHanding.personal.service.creditCenterProcess.impl;

import com.dcits.platform.util.DateUtil;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.objectionHanding.personal.service.creditCenterProcess.ObjectionMessage;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.XMLWriter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.io.StringWriter;
import java.util.*;

/**
 * @author liuyno
 * @date 2020/10/20 - 15:16
 */
public abstract class AbstractGenerateObjectionMessage implements ObjectionMessage {

    private static final Logger log = LoggerFactory.getLogger(AbstractGenerateObjectionMessage.class);

    private static final String Properties_Name = "appConfig.properties";

    private Properties properties;

    //换行符
    private static String newlineSeparator = System.getProperty("line.separator");

    public AbstractGenerateObjectionMessage() {
        //加载properties中的配置项
        if (properties == null) {
            properties = new Properties();
        }
        try {
            properties.load(this.getClass().getClassLoader().getResourceAsStream(Properties_Name));
        } catch (IOException e) {
            e.printStackTrace();
            log.error("加载[appConfig.properties]配置文件配置项失败！");
        }
    }

    /**
     * 组装请求报文-主流程控制
     *
     * @return
     */
    @Override
    public String generateMessage(PageData pd) {
        StringBuilder message = new StringBuilder();
        XMLWriter writer = null;
        try {
            log.info("------------请求报文组装开始--------------");
            //报文头
            message.append("B2.0.0").append(properties.getProperty("sendOrgCode")).append(properties.getProperty("receiveOrgCode")).
                    append(DateUtil.getSdftimes()).append(pd.getString("messageType")).
                    append(getMarkNum()).append(properties.getProperty("reservedField"));
            //报文体
            Document document = DocumentHelper.createDocument();
            //标签<Document>
            Element root = document.addElement("Document");
            /**
             * 组装业务头
             */
            //标签<Head>
            Element head = root.addElement("Head");
            head.addElement("DataProviderOrgCode").setText(properties.getProperty("sendOrgCode"));
            head.addElement("UserCode").setText(properties.getProperty("userCode"));
            head.addElement("Password").setText(properties.getProperty("objpassword"));
            /**
             * 组装业务体
             */
            //标签<Msg>
            Element msg = root.addElement("Msg");
            getMsg(msg, pd, properties);
            //格式化输出
            OutputFormat formater = OutputFormat.createPrettyPrint();
            formater.setEncoding("UTF-8");
            StringWriter out = new StringWriter();
            writer = new XMLWriter(out, formater);
            writer.write(document);
            writer.close();
            message.append(out);
            log.info("------------请求报文组装成功--------------");
        } catch (IOException e) {
            e.printStackTrace();
            log.error("------------请求报文组装出错--------------");
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return message.toString();
    }

    /**
     * 解析应答报文-主流程控制
     *
     * @return
     */
    @Override
    public Map<String, Object> parseMessage(String message) {
        Map<String, Object> map = new HashMap<>(2);
        List<Map> listValue = null;
        try {
            log.info("------------应答报文解析开始--------------");
            Document document = DocumentHelper.parseText(message);
            Element rootElement = document.getRootElement();
            Element msg = rootElement.element("Msg");
            //判断处理结果状态
            String resultCode = msg.elementText("ResultCode");
            String resultDesc = getResultDesc(resultCode);
            if (resultCode == "AAA000") {
                log.info("------------征信中心应答报文处理成功--------------");
                //处理成功流程-返回数据
                listValue = parseMsg(msg);
                map.put("success", true);
                map.put("resultDesc", listValue);
            } else {
                log.info("------------征信中心应答报文处理失败--------------");
                //处理失败流程-返回失败描述
                map.put("success", false);
                map.put("resultDesc", resultDesc);
            }
            log.info("------------应答报文解析成功--------------");
        } catch (DocumentException e) {
            e.printStackTrace();
            log.error("------------应答报文解析出错--------------");
            map.put("success", false);
            map.put("resultDesc", "应答报文解析出错");
        }
        return map;
    }

    /**
     * 解析应答报文业务体
     */
    public abstract List<Map> parseMsg(Element e);

    /**
     * 组装请求报文业务体
     */
    public abstract Element getMsg(Element e, PageData pd, Properties p);

    /**
     * 生成随机的报文标识号
     */
    public String getMarkNum() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(DateUtil.getDays());
        Random r = new Random();
        for (int i = 0; i < 8; i++) {
            int x = r.nextInt(10);
            stringBuilder.append(x);
        }
        return stringBuilder.toString();
    }

    /**
     * 根据处理结果代码返回处理结果描述
     */
    public String getResultDesc(String resultCode) {
        String resultDesc = "无匹配的信息代码";
        Map<String, String> resultMap = new HashMap<>();
        //装载发文中处理信息代码
        resultMap.put("AAA000", "处理成功");
        resultMap.put("ATO001", "系统繁忙");
        resultMap.put("ATO002", "请求正在处理中尚未处理完毕，请稍后再试");
        resultMap.put("ATO004", "数据库错误");
        resultMap.put("ATO005", "系统错误");
        resultMap.put("ATO999", "其它错误");
        resultMap.put("ABE001", "接口密码错误");
        resultMap.put("ABE002", "接口用户在征信系统中不存在");
        resultMap.put("ABE003", "接口用户没有操作权限");
        resultMap.put("ABE004", "接口用户被锁定");
        resultMap.put("ABO001", "系统当前非工作状态");
        resultMap.put("ABO002", "对于一组可出现多次的数据项，其出现次数必须与其个数相匹配且内容不能重复");
        resultMap.put("ABM001", "报文头长度错误");
        resultMap.put("ABM002", "报文头的字符不合法");
        resultMap.put("ABM003", "报文头中起始标识校验错误");
        resultMap.put("ABM004", "报文头中报文格式版本号校验错误");
        resultMap.put("ABM005", "报文头中报文发送机构代码校验错误");
        resultMap.put("ABM006", "报文头中报文接收机构代码校验错误");
        resultMap.put("ABM007", "报文头中报文生成时间校验错误");
        resultMap.put("ABM008", "报文头中报文类型校验错误");
        resultMap.put("ABM009", "报文头中报文标识号校验错误");
        resultMap.put("ABM010", "报文头中预留字段校验错误");
        resultMap.put("ABM011", "报文头中结束标识校验错误");
        resultMap.put("ABF003", "报文体格式错误");
        if (resultMap.containsKey(resultCode)) {
            resultDesc = resultMap.get(resultCode);
        }
        return resultDesc;
    }
}
