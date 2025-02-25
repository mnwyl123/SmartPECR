package com.dcits.supervise.pecr.objectionHanding.factory.impl;

import com.dcits.supervise.pecr.generateReport.factory.GenerateReportFactory;
import com.dcits.supervise.pecr.objectionHanding.enterprise.service.creditCenterProcess.impl.EormtbvObjectioinMessage;
import com.dcits.supervise.pecr.objectionHanding.factory.ObjMsgAbstractFactory;
import com.dcits.supervise.pecr.objectionHanding.personal.service.creditCenterProcess.ObjectionMessage;
import com.dcits.supervise.pecr.objectionHanding.personal.service.creditCenterProcess.impl.*;
import com.dcits.supervise.pecr.util.PecrConstantUtil;
import org.apache.log4j.Logger;

/**
 * 异议处理报文生成类工厂
 *
 * @author wzy
 * @date 2020/10/21 - 10:50
 */
public class EobjMsgFactory extends ObjMsgAbstractFactory {

    private final static Logger logger = Logger.getLogger(GenerateReportFactory.class);

    private volatile static EobjMsgFactory iobjMsgFactory;

    ObjectionMessage objectionMessage;

    private EobjMsgFactory() {
    }

    public static EobjMsgFactory getInstance() {
        if (iobjMsgFactory == null) {
            synchronized (EobjMsgFactory.class) {
                if (iobjMsgFactory == null) {
                    iobjMsgFactory = new EobjMsgFactory();
                }
            }
        }
        return iobjMsgFactory;
    }

    @Override
    public ObjectionMessage create(String messageType) {
        logger.info("根据需要生成不同类型的报文，使用工厂创建具体的报文生成实现类");
        switch (messageType) {
            case PecrConstantUtil.ENT_PORM_OBJECTION_MSG_TYPE://G151
                objectionMessage = new EormtbvObjectioinMessage();
                break;
            case PecrConstantUtil.ENT_RTPB_OBJECTION_MSG_TYPE://G153
                objectionMessage = new AtpotbvObjectionMessage();
                break;
            case PecrConstantUtil.ENT_RMF_OBJECTION_MSG_TYPE://G155
                objectionMessage = new RmfvrpObjectionMessage();
                break;
            case PecrConstantUtil.ENT_FRMC_OBJECTION_MSG_TYPE://G156
                objectionMessage = new FrmcopObjectionMessage();
                break;
            case PecrConstantUtil.ENT_IPMC_OBJECTION_MSG_TYPE://G157
                objectionMessage = new AtpotbvObjectionMessage();
                break;
            case PecrConstantUtil.ENT_APLR_OBJECTION_MSG_TYPE://G159
                objectionMessage = new AplrmObjectionMessage();
                break;
            case PecrConstantUtil.ENT_DPLR_OBJECTION_MSG_TYPE://G161
                objectionMessage = new DplrmObjectionMessage();
                break;
            default:
                break;
        }
        return objectionMessage;
    }
}
