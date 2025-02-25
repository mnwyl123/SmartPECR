package com.dcits.supervise.pecr.indv.entity;

import java.io.Serializable;

public class InCtrctInfCreditLimSgmt implements Serializable {
    private static final long serialVersionUID = 4850025875865845746L;

    private String PCC_CREDIT_LIM_SGMT_ID;  //主键PRI

    private String CREDIT_LIM_TYPE;  //授信额度类型

    private String LIM_LOOP_FLG;  //额度循环标志

    private String CREDIT_LIM;  //授信额度

    private String CY;  //币种

    private String CON_EFF_DATE;  //额度生效日期

    private String CON_EXP_DATE;  //额度到期日期

    private String CON_STATUS;  //额度状态

    private String CREDIT_REST;  //授信限额

    private String CREDIT_REST_CODE;  //授信限额编号

    private String PCA_CTRCT_BS_SGMT_ID;  //数据外键

    private String RPT_DATE;  //报送日期

    private String EXTEND1;  //预留字段1

    private String EXTEND2;  //预留字段2

    private String EXTEND3;  //预留字段3

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public String getPCC_CREDIT_LIM_SGMT_ID() {
        return PCC_CREDIT_LIM_SGMT_ID;
    }

    public void setPCC_CREDIT_LIM_SGMT_ID(String PCC_CREDIT_LIM_SGMT_ID) {
        this.PCC_CREDIT_LIM_SGMT_ID = PCC_CREDIT_LIM_SGMT_ID;
    }

    public String getCREDIT_LIM_TYPE() {
        return CREDIT_LIM_TYPE;
    }

    public void setCREDIT_LIM_TYPE(String CREDIT_LIM_TYPE) {
        this.CREDIT_LIM_TYPE = CREDIT_LIM_TYPE;
    }

    public String getLIM_LOOP_FLG() {
        return LIM_LOOP_FLG;
    }

    public void setLIM_LOOP_FLG(String LIM_LOOP_FLG) {
        this.LIM_LOOP_FLG = LIM_LOOP_FLG;
    }

    public String getCREDIT_LIM() {
        return CREDIT_LIM;
    }

    public void setCREDIT_LIM(String CREDIT_LIM) {
        this.CREDIT_LIM = CREDIT_LIM;
    }

    public String getCY() {
        return CY;
    }

    public void setCY(String CY) {
        this.CY = CY;
    }

    public String getCON_EFF_DATE() {
        return CON_EFF_DATE;
    }

    public void setCON_EFF_DATE(String CON_EFF_DATE) {
        this.CON_EFF_DATE = CON_EFF_DATE;
    }

    public String getCON_EXP_DATE() {
        return CON_EXP_DATE;
    }

    public void setCON_EXP_DATE(String CON_EXP_DATE) {
        this.CON_EXP_DATE = CON_EXP_DATE;
    }

    public String getCON_STATUS() {
        return CON_STATUS;
    }

    public void setCON_STATUS(String CON_STATUS) {
        this.CON_STATUS = CON_STATUS;
    }

    public String getCREDIT_REST() {
        return CREDIT_REST;
    }

    public void setCREDIT_REST(String CREDIT_REST) {
        this.CREDIT_REST = CREDIT_REST;
    }

    public String getCREDIT_REST_CODE() {
        return CREDIT_REST_CODE;
    }

    public void setCREDIT_REST_CODE(String CREDIT_REST_CODE) {
        this.CREDIT_REST_CODE = CREDIT_REST_CODE;
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
