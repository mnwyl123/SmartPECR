package com.dcits.supervise.pecr.indv.entity;

import java.io.Serializable;

/**
 * 客户拦截明细表实体类
 *
 * @author liuyno
 * @date 2020/8/6 - 9:54
 */
public class CustomerInterceptEntity implements Serializable {
    private static final long serialVersionUID = 6006717084325208734L;
    //主键ID
    private String id;
    //报表日期
    private String reportDate;
    //渠道名称
    private String channelName;
    //产品名称
    private String productName;
    //报文类型
    private String messageType;
    //上月未结清客户数
    private String lastMonOutstandingCustNum;
    //当月新增客户数
    private String currMonAddCustNum;
    //当月拦截客户数
    private String currMonInterceptCustNum;
    //当月报结清客户数
    private String currMonClosedCustNum;
    //当月正常上报客户数
    private String currMonNormalRepNum;
    //未上报客户数
    private String notReportCustNum;

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getReportDate() {
        return reportDate;
    }

    public void setReportDate(String reportDate) {
        this.reportDate = reportDate;
    }

    public String getChannelName() {
        return channelName;
    }

    public void setChannelName(String channelName) {
        this.channelName = channelName;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getMessageType() {
        return messageType;
    }

    public void setMessageType(String messageType) {
        this.messageType = messageType;
    }

    public String getLastMonOutstandingCustNum() {
        return lastMonOutstandingCustNum;
    }

    public void setLastMonOutstandingCustNum(String lastMonOutstandingCustNum) {
        this.lastMonOutstandingCustNum = lastMonOutstandingCustNum;
    }

    public String getCurrMonAddCustNum() {
        return currMonAddCustNum;
    }

    public void setCurrMonAddCustNum(String currMonAddCustNum) {
        this.currMonAddCustNum = currMonAddCustNum;
    }

    public String getCurrMonInterceptCustNum() {
        return currMonInterceptCustNum;
    }

    public void setCurrMonInterceptCustNum(String currMonInterceptCustNum) {
        this.currMonInterceptCustNum = currMonInterceptCustNum;
    }

    public String getCurrMonClosedCustNum() {
        return currMonClosedCustNum;
    }

    public void setCurrMonClosedCustNum(String currMonClosedCustNum) {
        this.currMonClosedCustNum = currMonClosedCustNum;
    }

    public String getCurrMonNormalRepNum() {
        return currMonNormalRepNum;
    }

    public void setCurrMonNormalRepNum(String currMonNormalRepNum) {
        this.currMonNormalRepNum = currMonNormalRepNum;
    }

    public String getNotReportCustNum() {
        return notReportCustNum;
    }

    public void setNotReportCustNum(String notReportCustNum) {
        this.notReportCustNum = notReportCustNum;
    }

    @Override
    public String toString() {
        return "CustomerInterceptEntity{" +
                "id='" + id + '\'' +
                ", reportDate='" + reportDate + '\'' +
                ", channelName='" + channelName + '\'' +
                ", productName='" + productName + '\'' +
                ", messageType='" + messageType + '\'' +
                ", lastMonOutstandingCustNum='" + lastMonOutstandingCustNum + '\'' +
                ", currMonAddCustNum='" + currMonAddCustNum + '\'' +
                ", currMonInterceptCustNum='" + currMonInterceptCustNum + '\'' +
                ", currMonClosedCustNum='" + currMonClosedCustNum + '\'' +
                ", currMonNormalRepNum='" + currMonNormalRepNum + '\'' +
                ", notReportCustNum='" + notReportCustNum + '\'' +
                '}';
    }
}
