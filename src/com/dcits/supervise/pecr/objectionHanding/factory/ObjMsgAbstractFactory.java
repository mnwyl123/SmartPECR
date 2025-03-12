package com.dcits.supervise.pecr.objectionHanding.factory;

import com.dcits.supervise.pecr.objectionHanding.personal.service.creditCenterProcess.ObjectionMessage;

/**
 * @author 穆楠
 * @date 2020/10/21 - 10:15
 */
public abstract class ObjMsgAbstractFactory {
    public abstract ObjectionMessage create(String messageType);
}
