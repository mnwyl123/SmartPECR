package com.dcits.supervise.pecr.objectionHanding.factory.impl;

import com.dcits.supervise.pecr.generateReport.factory.GenerateReportFactory;
import com.dcits.supervise.pecr.objectionHanding.factory.ObjMsgAbstractFactory;
import com.dcits.supervise.pecr.objectionHanding.personal.service.creditCenterProcess.ObjectionMessage;
import com.dcits.supervise.pecr.objectionHanding.personal.service.creditCenterProcess.impl.*;
import com.dcits.supervise.pecr.util.PecrConstantUtil;
import org.apache.log4j.Logger;

/**
 * 异议处理报文生成类工厂
 *
 * @author liuyno
 * @date 2020/10/21 - 10:50
 */
public class IobjMsgFactory extends ObjMsgAbstractFactory {

    private final static Logger logger = Logger.getLogger(GenerateReportFactory.class);

    private volatile static IobjMsgFactory iobjMsgFactory;

    ObjectionMessage objectionMessage;

    private IobjMsgFactory() {
    }

    public static IobjMsgFactory getInstance() {
        if (iobjMsgFactory == null) {
            synchronized (IobjMsgFactory.class) {
                if (iobjMsgFactory == null) {
                    iobjMsgFactory = new IobjMsgFactory();
                }
            }
        }
        return iobjMsgFactory;
    }

    @Override
    public ObjectionMessage create(String messageType) {
        logger.info("根据需要生成不同类型的报文，使用工厂创建具体的报文生成实现类");
        switch (messageType) {
            case PecrConstantUtil.PORM_OBJECTION_MSG_TYPE://G101
                objectionMessage = new PormtbvObjectioinMessage();
                break;
            case PecrConstantUtil.RTPB_OBJECTION_MSG_TYPE://G103
                objectionMessage = new AtpotbvObjectionMessage();
                break;
            case PecrConstantUtil.RMF_OBJECTION_MSG_TYPE://G105
                objectionMessage = new RmfvrpObjectionMessage();
                break;
            case PecrConstantUtil.FRMC_OBJECTION_MSG_TYPE://G106
                objectionMessage = new FrmcopObjectionMessage();
                break;
            case PecrConstantUtil.IPMC_OBJECTION_MSG_TYPE://G107
                objectionMessage = new AtpotbvObjectionMessage();
                break;
            case PecrConstantUtil.APLR_OBJECTION_MSG_TYPE://G109
                objectionMessage = new AplrmObjectionMessage();
                break;
            case PecrConstantUtil.DPLR_OBJECTION_MSG_TYPE://G111
                objectionMessage = new DplrmObjectionMessage();
                break;
            default:
                break;
        }
        return objectionMessage;
    }
}
