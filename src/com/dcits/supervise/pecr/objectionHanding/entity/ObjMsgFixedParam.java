package com.dcits.supervise.pecr.objectionHanding.entity;

/**
 * @author liuyno
 * @date 2020/10/20 - 15:51
 */
public class ObjMsgFixedParam {
    //报文发送机构代码
    private String sendOrgCode;
    //用户代码
    private String userCode;
    //用户密码
    private String password;
    //报文接收机构代码
    private String receiveOrgCode;
    //预留字段
    private String reservedField;

    public ObjMsgFixedParam() {
    }

    public ObjMsgFixedParam(String sendOrgCode, String userCode, String password, String receiveOrgCode, String reservedField) {
        this.sendOrgCode = sendOrgCode;
        this.userCode = userCode;
        this.password = password;
        this.receiveOrgCode = receiveOrgCode;
        this.reservedField = reservedField;
    }

    public String getSendOrgCode() {
        return sendOrgCode;
    }

    public void setSendOrgCode(String sendOrgCode) {
        this.sendOrgCode = sendOrgCode;
    }

    public String getUserCode() {
        return userCode;
    }

    public void setUserCode(String userCode) {
        this.userCode = userCode;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getReceiveOrgCode() {
        return receiveOrgCode;
    }

    public void setReceiveOrgCode(String receiveOrgCode) {
        this.receiveOrgCode = receiveOrgCode;
    }

    public String getReservedField() {
        return reservedField;
    }

    public void setReservedField(String reservedField) {
        this.reservedField = reservedField;
    }

    @Override
    public String toString() {
        return "ObjMsgFixedParam{" +
                "sendOrgCode='" + sendOrgCode + '\'' +
                ", userCode='" + userCode + '\'' +
                ", password='" + password + '\'' +
                ", receiveOrgCode='" + receiveOrgCode + '\'' +
                ", reservedField='" + reservedField + '\'' +
                '}';
    }
}
