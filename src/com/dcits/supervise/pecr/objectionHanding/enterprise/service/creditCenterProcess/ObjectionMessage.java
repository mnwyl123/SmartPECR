package com.dcits.supervise.pecr.objectionHanding.enterprise.service.creditCenterProcess;

import com.dcits.platform.util.PageData;

import java.util.Map;

/**
 * 异议处理流程-报文处理
 * @author wzy
 * @date 2020/10/20 - 15:09
 */
public interface ObjectionMessage {
    /**
     * 生成请求报文
     * @return
     */
    public String generateMessage(PageData pd);

    /**
     * 解析应答报文
     */

    public Map<String, Object> parseMessage(String message);
}
