package com.dcits.supervise.pecr.objectionHanding.entity;

/**
 * @author liuyno
 * @date 2020/8/24 - 10:13
 */
public class IndvObjection {
    //主键ID
    private String objectionId;
    //客户姓名
    private String custName;
    //证件类型
    private String idType;
    //证件号码
    private String idNum;
    //异议信息类型
    private String objectionType;
    //异议信息段
    private String objectionSegment;
    //是否标注
    private String isLabel;
    //异议登记备注
    private String objectionRegistRemark;
    //登记日期
    private String registDate;
    //最后更新时间
    private String lastUpdateDate;
    //资料核查备注
    private String materialCheckRemark;
    //审核备注
    private String reviewRemark;
    //审批备注
    private String approveRemark;
    //异议登记结束时间
    private String objectionRegistClosedTime;
    //资料核查结束时间
    private String materialCheckClosedTime;
    //审核结束时间
    private String reviewClosedTime;
    //审批结束时间
    private String approveClosedTime;
    //异议状态
    private String objectionStatus;

    public String getObjectionId() {
        return objectionId;
    }

    public void setObjectionId(String objectionId) {
        this.objectionId = objectionId;
    }

    public String getCustName() {
        return custName;
    }

    public void setCustName(String custName) {
        this.custName = custName;
    }

    public String getIdType() {
        return idType;
    }

    public void setIdType(String idType) {
        this.idType = idType;
    }

    public String getIdNum() {
        return idNum;
    }

    public void setIdNum(String idNum) {
        this.idNum = idNum;
    }

    public String getObjectionType() {
        return objectionType;
    }

    public void setObjectionType(String objectionType) {
        this.objectionType = objectionType;
    }

    public String getObjectionSegment() {
        return objectionSegment;
    }

    public void setObjectionSegment(String objectionSegment) {
        this.objectionSegment = objectionSegment;
    }

    public String getIsLabel() {
        return isLabel;
    }

    public void setIsLabel(String isLabel) {
        this.isLabel = isLabel;
    }

    public String getObjectionRegistRemark() {
        return objectionRegistRemark;
    }

    public void setObjectionRegistRemark(String objectionRegistRemark) {
        this.objectionRegistRemark = objectionRegistRemark;
    }

    public String getRegistDate() {
        return registDate;
    }

    public void setRegistDate(String registDate) {
        this.registDate = registDate;
    }

    public String getLastUpdateDate() {
        return lastUpdateDate;
    }

    public void setLastUpdateDate(String lastUpdateDate) {
        this.lastUpdateDate = lastUpdateDate;
    }

    public String getMaterialCheckRemark() {
        return materialCheckRemark;
    }

    public void setMaterialCheckRemark(String materialCheckRemark) {
        this.materialCheckRemark = materialCheckRemark;
    }

    public String getReviewRemark() {
        return reviewRemark;
    }

    public void setReviewRemark(String reviewRemark) {
        this.reviewRemark = reviewRemark;
    }

    public String getApproveRemark() {
        return approveRemark;
    }

    public void setApproveRemark(String approveRemark) {
        this.approveRemark = approveRemark;
    }

    public String getObjectionRegistClosedTime() {
        return objectionRegistClosedTime;
    }

    public void setObjectionRegistClosedTime(String objectionRegistClosedTime) {
        this.objectionRegistClosedTime = objectionRegistClosedTime;
    }

    public String getMaterialCheckClosedTime() {
        return materialCheckClosedTime;
    }

    public void setMaterialCheckClosedTime(String materialCheckClosedTime) {
        this.materialCheckClosedTime = materialCheckClosedTime;
    }

    public String getReviewClosedTime() {
        return reviewClosedTime;
    }

    public void setReviewClosedTime(String reviewClosedTime) {
        this.reviewClosedTime = reviewClosedTime;
    }

    public String getApproveClosedTime() {
        return approveClosedTime;
    }

    public void setApproveClosedTime(String approveClosedTime) {
        this.approveClosedTime = approveClosedTime;
    }

    public String getObjectionStatus() {
        return objectionStatus;
    }

    public void setObjectionStatus(String objectionStatus) {
        this.objectionStatus = objectionStatus;
    }

    @Override
    public String toString() {
        return "IndvObjectionRegiste{" +
                "objectionId='" + objectionId + '\'' +
                ", custName='" + custName + '\'' +
                ", idType='" + idType + '\'' +
                ", idNum='" + idNum + '\'' +
                ", objectionType='" + objectionType + '\'' +
                ", objectionSegment='" + objectionSegment + '\'' +
                ", isLabel='" + isLabel + '\'' +
                ", objectionRegistRemark='" + objectionRegistRemark + '\'' +
                ", registDate='" + registDate + '\'' +
                ", lastUpdateDate='" + lastUpdateDate + '\'' +
                ", materialCheckRemark='" + materialCheckRemark + '\'' +
                ", reviewRemark='" + reviewRemark + '\'' +
                ", approveRemark='" + approveRemark + '\'' +
                ", objectionRegistClosedTime='" + objectionRegistClosedTime + '\'' +
                ", materialCheckClosedTime='" + materialCheckClosedTime + '\'' +
                ", reviewClosedTime='" + reviewClosedTime + '\'' +
                ", approveClosedTime='" + approveClosedTime + '\'' +
                ", objectionStatus='" + objectionStatus + '\'' +
                '}';
    }
}
