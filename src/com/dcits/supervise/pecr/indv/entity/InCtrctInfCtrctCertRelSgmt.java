package com.dcits.supervise.pecr.indv.entity;

import java.io.Serializable;

public class InCtrctInfCtrctCertRelSgmt implements Serializable {
    private static final long serialVersionUID = 4850025875865845746L;

    private String PCB_CTRCT_CERT_REL_SGMT_ID;  //主键PRI

    private String BRER_TYPE;  //共同受信人身份类别

    private String CERT_REL_NAME;  //共同受信人名称

    private String CERT_REL_ID_TYPE;  //共同受信人身份标识类型

    private String CERT_REL_ID_NUM;  //共同受信人身份标识号码

    private String PCA_CTRCT_BS_SGMT_ID;  //数据外键

    private String RPT_DATE;  //报送日期

    private String EXTEND1;  //预留字段1

    private String EXTEND2;  //预留字段2

    private String EXTEND3;  //预留字段3



    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public String getPCB_CTRCT_CERT_REL_SGMT_ID() {
        return PCB_CTRCT_CERT_REL_SGMT_ID;
    }

    public void setPCB_CTRCT_CERT_REL_SGMT_ID(String PCB_CTRCT_CERT_REL_SGMT_ID) {
        this.PCB_CTRCT_CERT_REL_SGMT_ID = PCB_CTRCT_CERT_REL_SGMT_ID;
    }

    public String getBRER_TYPE() {
        return BRER_TYPE;
    }

    public void setBRER_TYPE(String BRER_TYPE) {
        this.BRER_TYPE = BRER_TYPE;
    }

    public String getCERT_REL_NAME() {
        return CERT_REL_NAME;
    }

    public void setCERT_REL_NAME(String CERT_REL_NAME) {
        this.CERT_REL_NAME = CERT_REL_NAME;
    }

    public String getCERT_REL_ID_TYPE() {
        return CERT_REL_ID_TYPE;
    }

    public void setCERT_REL_ID_TYPE(String CERT_REL_ID_TYPE) {
        this.CERT_REL_ID_TYPE = CERT_REL_ID_TYPE;
    }

    public String getCERT_REL_ID_NUM() {
        return CERT_REL_ID_NUM;
    }

    public void setCERT_REL_ID_NUM(String CERT_REL_ID_NUM) {
        this.CERT_REL_ID_NUM = CERT_REL_ID_NUM;
    }

    public String getPCA_CTRCT_BS_SGMT_ID() {
        return PCA_CTRCT_BS_SGMT_ID;
    }

    public void setPCA_CTRCT_BS_SGMT_ID(String PCA_CTRCT_BS_SGMT_ID) {
        this.PCA_CTRCT_BS_SGMT_ID = PCA_CTRCT_BS_SGMT_ID;
    }

    public String getRPT_DATE() {
        return RPT_DATE;
    }

    public void setRPT_DATE(String RPT_DATE) {
        this.RPT_DATE = RPT_DATE;
    }

    public String getEXTEND1() {
        return EXTEND1;
    }

    public void setEXTEND1(String EXTEND1) {
        this.EXTEND1 = EXTEND1;
    }

    public String getEXTEND2() {
        return EXTEND2;
    }

    public void setEXTEND2(String EXTEND2) {
        this.EXTEND2 = EXTEND2;
    }

    public String getEXTEND3() {
        return EXTEND3;
    }

    public void setEXTEND3(String EXTEND3) {
        this.EXTEND3 = EXTEND3;
    }
}
