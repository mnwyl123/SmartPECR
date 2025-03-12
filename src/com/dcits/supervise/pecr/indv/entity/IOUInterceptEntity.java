package com.dcits.supervise.pecr.indv.entity;

import java.io.Serializable;

/**借据拦截明细月报表实体类
 * @author 穆楠
 * @date 2020/8/10 - 10:20
 */
public class IOUInterceptEntity implements Serializable {

    private static final long serialVersionUID = -266141192875631137L;

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
    //上月未结清借据数
    private String lastMonOutstandingIouNum;
    //当月新增借据数
    private String currMonAddIouNum;
    //当月拦截借据数
    private String currMonInterceptIouNum;
    //当月报结清借据数
    private String currMonClosedIouNum;
    //当月正常上报借据数
    private String currMonNormalRepIouNum;
    //未上报借据数
    private String notReportIouNum;

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

    public String getLastMonOutstandingIouNum() {
        return lastMonOutstandingIouNum;
    }

    public void setLastMonOutstandingIouNum(String lastMonOutstandingIouNum) {
        this.lastMonOutstandingIouNum = lastMonOutstandingIouNum;
    }

    public String getCurrmonAddIounumm() {
        return currMonAddIouNum;
    }

    public void setCurrmonAddIounumm(String currmonAddIounumm) {
        this.currMonAddIouNum = currmonAddIounumm;
    }

    public String getCurrMonInterceptIouNum() {
        return currMonInterceptIouNum;
    }

    public void setCurrMonInterceptIouNum(String currMonInterceptIouNum) {
        this.currMonInterceptIouNum = currMonInterceptIouNum;
    }

    public String getCurrMonClosedIouNum() {
        return currMonClosedIouNum;
    }

    public void setCurrMonClosedIouNum(String currMonClosedIouNum) {
        this.currMonClosedIouNum = currMonClosedIouNum;
    }

    public String getCurrMonNormalRepIouNum() {
        return currMonNormalRepIouNum;
    }

    public void setCurrMonNormalRepIouNum(String currMonNormalRepIouNum) {
        this.currMonNormalRepIouNum = currMonNormalRepIouNum;
    }

    public String getNotReportIouNum() {
        return notReportIouNum;
    }

    public void setNotReportIouNum(String notReportIouNum) {
        this.notReportIouNum = notReportIouNum;
    }

    @Override
    public String toString() {
        return "IOUInterceptEntity{" +
                "id='" + id + '\'' +
                ", reportDate='" + reportDate + '\'' +
                ", channelName='" + channelName + '\'' +
                ", productName='" + productName + '\'' +
                ", messageType='" + messageType + '\'' +
                ", lastMonOutstandingIouNum='" + lastMonOutstandingIouNum + '\'' +
                ", currmonAddIounumm='" + currMonAddIouNum + '\'' +
                ", currMonInterceptIouNum='" + currMonInterceptIouNum + '\'' +
                ", currMonClosedIouNum='" + currMonClosedIouNum + '\'' +
                ", currMonNormalRepIouNum='" + currMonNormalRepIouNum + '\'' +
                ", notReportIouNum='" + notReportIouNum + '\'' +
                '}';
    }
}
