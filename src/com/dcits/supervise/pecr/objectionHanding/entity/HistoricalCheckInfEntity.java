package com.dcits.supervise.pecr.objectionHanding.entity;


import java.io.Serializable;

/**
 * 历史核查信息-属于个人待核查异议应答报文业务体的部分信息
 *
 * @author 穆楠
 * @date 2020/9/15 - 10:45
 */
public class HistoricalCheckInfEntity implements Serializable {

    private static final long serialVersionUID = -1110720496170003878L;

    //主键IDd
    private String historicalCheckInfId;
    //关联征信中心异议处理综合实体类主表的ID
    private String creditCenterObjHandingId;
    //处理核查时间
    private String checkTime;
    //核查结果
    private String checkResult;
    //核查结果描述
    private String checkResultDesc;
    //核查机构代码
    private String checkOrgCode;
    //核查用户代码
    private String checkUserCode;
    //有效联系电话
    private String phoneNum;
    //是否接受核查结果
    private String checkAcceptFlag;
    //核查处理意见
    private String checkOpinion;

    public HistoricalCheckInfEntity() {
    }

    public HistoricalCheckInfEntity(String historicalCheckInfId, String creditCenterObjHandingId, String checkTime, String checkResult, String checkResultDesc, String checkOrgCode, String checkUserCode, String phoneNum, String checkAcceptFlag, String checkOpinion) {
        this.historicalCheckInfId = historicalCheckInfId;
        this.creditCenterObjHandingId = creditCenterObjHandingId;
        this.checkTime = checkTime;
        this.checkResult = checkResult;
        this.checkResultDesc = checkResultDesc;
        this.checkOrgCode = checkOrgCode;
        this.checkUserCode = checkUserCode;
        this.phoneNum = phoneNum;
        this.checkAcceptFlag = checkAcceptFlag;
        this.checkOpinion = checkOpinion;
    }

    public String getHistoricalCheckInfId() {
        return historicalCheckInfId;
    }

    public void setHistoricalCheckInfId(String historicalCheckInfId) {
        this.historicalCheckInfId = historicalCheckInfId;
    }

    public String getCreditCenterObjHandingId() {
        return creditCenterObjHandingId;
    }

    public void setCreditCenterObjHandingId(String creditCenterObjHandingId) {
        this.creditCenterObjHandingId = creditCenterObjHandingId;
    }

    public String getCheckTime() {
        return checkTime;
    }

    public void setCheckTime(String checkTime) {
        this.checkTime = checkTime;
    }

    public String getCheckResult() {
        return checkResult;
    }

    public void setCheckResult(String checkResult) {
        this.checkResult = checkResult;
    }

    public String getCheckResultDesc() {
        return checkResultDesc;
    }

    public void setCheckResultDesc(String checkResultDesc) {
        this.checkResultDesc = checkResultDesc;
    }

    public String getCheckOrgCode() {
        return checkOrgCode;
    }

    public void setCheckOrgCode(String checkOrgCode) {
        this.checkOrgCode = checkOrgCode;
    }

    public String getCheckUserCode() {
        return checkUserCode;
    }

    public void setCheckUserCode(String checkUserCode) {
        this.checkUserCode = checkUserCode;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public String getCheckAcceptFlag() {
        return checkAcceptFlag;
    }

    public void setCheckAcceptFlag(String checkAcceptFlag) {
        this.checkAcceptFlag = checkAcceptFlag;
    }

    public String getCheckOpinion() {
        return checkOpinion;
    }

    public void setCheckOpinion(String checkOpinion) {
        this.checkOpinion = checkOpinion;
    }

    @Override
    public String toString() {
        return "HistoricalCheckInfEntity{" +
                "historicalCheckInfId='" + historicalCheckInfId + '\'' +
                ", creditCenterObjHandingId='" + creditCenterObjHandingId + '\'' +
                ", checkTime='" + checkTime + '\'' +
                ", checkResult='" + checkResult + '\'' +
                ", checkResultDesc='" + checkResultDesc + '\'' +
                ", checkOrgCode='" + checkOrgCode + '\'' +
                ", checkUserCode='" + checkUserCode + '\'' +
                ", phoneNum='" + phoneNum + '\'' +
                ", checkAcceptFlag='" + checkAcceptFlag + '\'' +
                ", checkOpinion='" + checkOpinion + '\'' +
                '}';
    }
}
