package com.dcits.supervise.pecr.indv.entity;

import java.io.Serializable;

/**借据拦截统计月报表实体类
 * @author 穆楠
 * @date 2020/8/10 - 10:20
 */
public class IOUInterceptStatisticsEntity implements Serializable {


    private static final long serialVersionUID = -6704786348264205184L;

    //主键ID
    private String id;
    //报表日期
    private String reportDate;
    //渠道名称
    private String channelName;
    //产品名称
    private String productName;
    //白名单类型
    private String whiteListType;
    //当月拦截借据数
    private String currMonInterceptIouNum;
    //连续两个月拦截借据数
    private String twoMonInterceptIouNum;
    //连续三个月拦截借据数
    private String threeMonInterceptIouNum;

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

    public String getWhiteListType() {
        return whiteListType;
    }

    public void setWhiteListType(String whiteListType) {
        this.whiteListType = whiteListType;
    }

    public String getCurrMonInterceptIouNum() {
        return currMonInterceptIouNum;
    }

    public void setCurrMonInterceptIouNum(String currMonInterceptIouNum) {
        this.currMonInterceptIouNum = currMonInterceptIouNum;
    }

    public String getTwoMonInterceptIouNum() {
        return twoMonInterceptIouNum;
    }

    public void setTwoMonInterceptIouNum(String twoMonInterceptIouNum) {
        this.twoMonInterceptIouNum = twoMonInterceptIouNum;
    }

    public String getThreeMonInterceptIouNum() {
        return threeMonInterceptIouNum;
    }

    public void setThreeMonInterceptIouNum(String threeMonInterceptIouNum) {
        this.threeMonInterceptIouNum = threeMonInterceptIouNum;
    }

    @Override
    public String toString() {
        return "IOUInterceptStatisticsEntity{" +
                "id='" + id + '\'' +
                ", reportDate='" + reportDate + '\'' +
                ", channelName='" + channelName + '\'' +
                ", productName='" + productName + '\'' +
                ", whiteListType='" + whiteListType + '\'' +
                ", currMonInterceptIouNum='" + currMonInterceptIouNum + '\'' +
                ", twoMonInterceptIouNum='" + twoMonInterceptIouNum + '\'' +
                ", threeMonInterceptIouNum='" + threeMonInterceptIouNum + '\'' +
                '}';
    }
}
