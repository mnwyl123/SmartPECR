package com.dcits.supervise.pecr.objectionHanding.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * 征信中心异议处理综合实体类
 *
 * @author 穆楠
 * @date 2020/10/19 - 9:29
 */
public class CreditCenterObjHandingEntity implements Serializable {

    private static final long serialVersionUID = -309562432014775418L;

    //主键ID
    private String creditCenterObjHandingId;

    /**
     * 个人待核查异议事项-应答报文
     */

    //异议事项号
    private String objCheckId;
    //异议事项流水号
    private String objCheckNum;
    //核查开始日期
    private String checkBeginDate;
    //姓名
    private String name;
    //证件类型
    private String idType;
    //证件号码
    private String idNum;
    //有效联系电话
    private String phoneNum;
    //异议事项信息
    private String objItemInf;
    //异议说明
    private String objItemDesc;
    //数据提供机构代码
    private String dataProviderOrgCode;
    //数据发生机构代码
    private String dataOccurOrgCode;
    //业务标识号
    private String businessCode;
    //业务种类
    private String businessType;
    //核查到期日期
    private String checkFinalDate;
    //数据发生日期
    private String dataOccurDate;
    //数据发生金额
    private String dataOccurAmount;
    //是否存在附件
    private String enclosureFlag;
    //历史核查信息
    private List<HistoricalCheckInfEntity> historicalCheckInfList = new ArrayList<>();

    /**
     * 个人待核查异议事项附件信息-应答报文
     */

    //个人待核查异议事项附件信息应答报文-处理结果代码
    private String airmfResultCode;
    //个人待核查异议事项附件信息应答报文-处理结果描述
    private String airmfResultDesc;
    //个人待核查异议事项附件信息应答报文-是否存在附件
    private String airmfEnclosureFlag;
    //个人待核查异议事项附件信息应答报文-附件信息存储路径
    private String airmfEnclosureInf;

    /**
     * 反馈个人异议事项核查结果-请求报文
     */

    //反馈个人异议事项核查结果请求报文-核查结果
    private String rfIvrCheckResult;
    //反馈个人异议事项核查结果请求报文-异议核查结果描述
    private String rfIvrCheckResultDesc;

    /**
     * 反馈个人异议事项核查结果-应答报文
     */

    //反馈个人异议事项核查结果应答报文-处理结果代码
    private String afIvrResultCode;
    //反馈个人异议事项核查结果应答报文-处理结果描述
    private String afIvrResultDesc;

    /**
     * 反馈个人异议事项更正结果-请求报文
     */

    //反馈个人异议事项更正结果请求报文-异议更正结果
    private String fopoacrrCorrectResult;
    //反馈个人异议事项更正结果请求报文-附件信息存储路径
    private String fopoacrrEnclosureInf;
    //反馈个人异议事项更正结果请求报文-异议更正结果描述
    private String fopoacrrCorrectDesc;

    /**
     * 反馈个人异议事项更正结果-应答报文
     */

    //反馈个人异议事项更正结果应答报文-处理结果代码
    private String fopoacrResultCode;
    //反馈个人异议事项更正结果应答报文-处理结果描述
    private String fopoacrResultDesc;

    /**
     * 个人异议事项更正结果接受情况-应答报文
     */

    //个人异议事项更正结果接受情况应答报文-处理结果代码
    private String pocrasrResultCode;
    //个人异议事项更正结果接受情况应答报文-处理结果描述
    private String pocrasrResultDesc;
    //个人异议事项更正结果接受情况应答报文-是否接受更正结果
    private String pocrasrCorrectAcceptFlag;
    //个人异议事项更正结果接受情况应答报文-更正处理意见
    private String pocrasrCorrectOpinion;

    /**
     * 添加个人标注-请求报文
     */

    //添加个人标注请求报文-定位信息个数
    private int aplrLocateInfNm;
    //定位信息
    private List<LocateInfEntity> LocateInfList = new ArrayList<>(aplrLocateInfNm);
    //添加个人标注请求报文-异议说明
    private String aplrObjDesc;

    /**
     * 添加个人标注-应答报文
     */

    //添加个人标注应答报文-处理结果代码
    private String aparResultCode;
    //添加个人标注应答报文-处理结果描述
    private String aparResultDesc;
    //添加个人标注应答报文-业务回执代码
    private String aparServiceReturnCode;

    /**
     * 删除个人标注-应答报文
     */

    //删除标注应答报文-处理结果代码
    private String darResultCode;
    //删除标注应答报文-处理结果描述
    private String darResultDesc;

    public CreditCenterObjHandingEntity() {
    }

    public CreditCenterObjHandingEntity(String creditCenterObjHandingId, String objCheckId, String objCheckNum, String checkBeginDate, String name, String idType, String idNum, String phoneNum, String objItemInf, String objItemDesc, String dataProviderOrgCode, String dataOccurOrgCode, String businessCode, String businessType, String checkFinalDate, String dataOccurDate, String dataOccurAmount, String enclosureFlag, List<HistoricalCheckInfEntity> historicalCheckInfList, String airmfResultCode, String airmfResultDesc, String airmfEnclosureFlag, String airmfEnclosureInf, String rfIvrCheckResult, String rfIvrCheckResultDesc, String afIvrResultCode, String afIvrResultDesc, String fopoacrrCorrectResult, String fopoacrrEnclosureInf, String fopoacrrCorrectDesc, String fopoacrResultCode, String fopoacrResultDesc, String pocrasrResultCode, String pocrasrResultDesc, String pocrasrCorrectAcceptFlag, String pocrasrCorrectOpinion, int aplrLocateInfNm, List<LocateInfEntity> locateInfList, String aplrObjDesc, String aparResultCode, String aparResultDesc, String aparServiceReturnCode, String darResultCode, String darResultDesc) {
        this.creditCenterObjHandingId = creditCenterObjHandingId;
        this.objCheckId = objCheckId;
        this.objCheckNum = objCheckNum;
        this.checkBeginDate = checkBeginDate;
        this.name = name;
        this.idType = idType;
        this.idNum = idNum;
        this.phoneNum = phoneNum;
        this.objItemInf = objItemInf;
        this.objItemDesc = objItemDesc;
        this.dataProviderOrgCode = dataProviderOrgCode;
        this.dataOccurOrgCode = dataOccurOrgCode;
        this.businessCode = businessCode;
        this.businessType = businessType;
        this.checkFinalDate = checkFinalDate;
        this.dataOccurDate = dataOccurDate;
        this.dataOccurAmount = dataOccurAmount;
        this.enclosureFlag = enclosureFlag;
        this.historicalCheckInfList = historicalCheckInfList;
        this.airmfResultCode = airmfResultCode;
        this.airmfResultDesc = airmfResultDesc;
        this.airmfEnclosureFlag = airmfEnclosureFlag;
        this.airmfEnclosureInf = airmfEnclosureInf;
        this.rfIvrCheckResult = rfIvrCheckResult;
        this.rfIvrCheckResultDesc = rfIvrCheckResultDesc;
        this.afIvrResultCode = afIvrResultCode;
        this.afIvrResultDesc = afIvrResultDesc;
        this.fopoacrrCorrectResult = fopoacrrCorrectResult;
        this.fopoacrrEnclosureInf = fopoacrrEnclosureInf;
        this.fopoacrrCorrectDesc = fopoacrrCorrectDesc;
        this.fopoacrResultCode = fopoacrResultCode;
        this.fopoacrResultDesc = fopoacrResultDesc;
        this.pocrasrResultCode = pocrasrResultCode;
        this.pocrasrResultDesc = pocrasrResultDesc;
        this.pocrasrCorrectAcceptFlag = pocrasrCorrectAcceptFlag;
        this.pocrasrCorrectOpinion = pocrasrCorrectOpinion;
        this.aplrLocateInfNm = aplrLocateInfNm;
        LocateInfList = locateInfList;
        this.aplrObjDesc = aplrObjDesc;
        this.aparResultCode = aparResultCode;
        this.aparResultDesc = aparResultDesc;
        this.aparServiceReturnCode = aparServiceReturnCode;
        this.darResultCode = darResultCode;
        this.darResultDesc = darResultDesc;
    }

    public String getCreditCenterObjHandingId() {
        return creditCenterObjHandingId;
    }

    public void setCreditCenterObjHandingId(String creditCenterObjHandingId) {
        this.creditCenterObjHandingId = creditCenterObjHandingId;
    }

    public String getObjCheckId() {
        return objCheckId;
    }

    public void setObjCheckId(String objCheckId) {
        this.objCheckId = objCheckId;
    }

    public String getObjCheckNum() {
        return objCheckNum;
    }

    public void setObjCheckNum(String objCheckNum) {
        this.objCheckNum = objCheckNum;
    }

    public String getCheckBeginDate() {
        return checkBeginDate;
    }

    public void setCheckBeginDate(String checkBeginDate) {
        this.checkBeginDate = checkBeginDate;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public String getObjItemInf() {
        return objItemInf;
    }

    public void setObjItemInf(String objItemInf) {
        this.objItemInf = objItemInf;
    }

    public String getObjItemDesc() {
        return objItemDesc;
    }

    public void setObjItemDesc(String objItemDesc) {
        this.objItemDesc = objItemDesc;
    }

    public String getDataProviderOrgCode() {
        return dataProviderOrgCode;
    }

    public void setDataProviderOrgCode(String dataProviderOrgCode) {
        this.dataProviderOrgCode = dataProviderOrgCode;
    }

    public String getDataOccurOrgCode() {
        return dataOccurOrgCode;
    }

    public void setDataOccurOrgCode(String dataOccurOrgCode) {
        this.dataOccurOrgCode = dataOccurOrgCode;
    }

    public String getBusinessCode() {
        return businessCode;
    }

    public void setBusinessCode(String businessCode) {
        this.businessCode = businessCode;
    }

    public String getBusinessType() {
        return businessType;
    }

    public void setBusinessType(String businessType) {
        this.businessType = businessType;
    }

    public String getCheckFinalDate() {
        return checkFinalDate;
    }

    public void setCheckFinalDate(String checkFinalDate) {
        this.checkFinalDate = checkFinalDate;
    }

    public String getDataOccurDate() {
        return dataOccurDate;
    }

    public void setDataOccurDate(String dataOccurDate) {
        this.dataOccurDate = dataOccurDate;
    }

    public String getDataOccurAmount() {
        return dataOccurAmount;
    }

    public void setDataOccurAmount(String dataOccurAmount) {
        this.dataOccurAmount = dataOccurAmount;
    }

    public String getEnclosureFlag() {
        return enclosureFlag;
    }

    public void setEnclosureFlag(String enclosureFlag) {
        this.enclosureFlag = enclosureFlag;
    }

    public List<HistoricalCheckInfEntity> getHistoricalCheckInfList() {
        return historicalCheckInfList;
    }

    public void setHistoricalCheckInfList(List<HistoricalCheckInfEntity> historicalCheckInfList) {
        this.historicalCheckInfList = historicalCheckInfList;
    }

    public String getAirmfResultCode() {
        return airmfResultCode;
    }

    public void setAirmfResultCode(String airmfResultCode) {
        this.airmfResultCode = airmfResultCode;
    }

    public String getAirmfResultDesc() {
        return airmfResultDesc;
    }

    public void setAirmfResultDesc(String airmfResultDesc) {
        this.airmfResultDesc = airmfResultDesc;
    }

    public String getAirmfEnclosureFlag() {
        return airmfEnclosureFlag;
    }

    public void setAirmfEnclosureFlag(String airmfEnclosureFlag) {
        this.airmfEnclosureFlag = airmfEnclosureFlag;
    }

    public String getAirmfEnclosureInf() {
        return airmfEnclosureInf;
    }

    public void setAirmfEnclosureInf(String airmfEnclosureInf) {
        this.airmfEnclosureInf = airmfEnclosureInf;
    }

    public String getRfIvrCheckResult() {
        return rfIvrCheckResult;
    }

    public void setRfIvrCheckResult(String rfIvrCheckResult) {
        this.rfIvrCheckResult = rfIvrCheckResult;
    }

    public String getRfIvrCheckResultDesc() {
        return rfIvrCheckResultDesc;
    }

    public void setRfIvrCheckResultDesc(String rfIvrCheckResultDesc) {
        this.rfIvrCheckResultDesc = rfIvrCheckResultDesc;
    }

    public String getAfIvrResultCode() {
        return afIvrResultCode;
    }

    public void setAfIvrResultCode(String afIvrResultCode) {
        this.afIvrResultCode = afIvrResultCode;
    }

    public String getAfIvrResultDesc() {
        return afIvrResultDesc;
    }

    public void setAfIvrResultDesc(String afIvrResultDesc) {
        this.afIvrResultDesc = afIvrResultDesc;
    }

    public String getFopoacrrCorrectResult() {
        return fopoacrrCorrectResult;
    }

    public void setFopoacrrCorrectResult(String fopoacrrCorrectResult) {
        this.fopoacrrCorrectResult = fopoacrrCorrectResult;
    }

    public String getFopoacrrEnclosureInf() {
        return fopoacrrEnclosureInf;
    }

    public void setFopoacrrEnclosureInf(String fopoacrrEnclosureInf) {
        this.fopoacrrEnclosureInf = fopoacrrEnclosureInf;
    }

    public String getFopoacrrCorrectDesc() {
        return fopoacrrCorrectDesc;
    }

    public void setFopoacrrCorrectDesc(String fopoacrrCorrectDesc) {
        this.fopoacrrCorrectDesc = fopoacrrCorrectDesc;
    }

    public String getFopoacrResultCode() {
        return fopoacrResultCode;
    }

    public void setFopoacrResultCode(String fopoacrResultCode) {
        this.fopoacrResultCode = fopoacrResultCode;
    }

    public String getFopoacrResultDesc() {
        return fopoacrResultDesc;
    }

    public void setFopoacrResultDesc(String fopoacrResultDesc) {
        this.fopoacrResultDesc = fopoacrResultDesc;
    }

    public String getPocrasrResultCode() {
        return pocrasrResultCode;
    }

    public void setPocrasrResultCode(String pocrasrResultCode) {
        this.pocrasrResultCode = pocrasrResultCode;
    }

    public String getPocrasrResultDesc() {
        return pocrasrResultDesc;
    }

    public void setPocrasrResultDesc(String pocrasrResultDesc) {
        this.pocrasrResultDesc = pocrasrResultDesc;
    }

    public String getPocrasrCorrectAcceptFlag() {
        return pocrasrCorrectAcceptFlag;
    }

    public void setPocrasrCorrectAcceptFlag(String pocrasrCorrectAcceptFlag) {
        this.pocrasrCorrectAcceptFlag = pocrasrCorrectAcceptFlag;
    }

    public String getPocrasrCorrectOpinion() {
        return pocrasrCorrectOpinion;
    }

    public void setPocrasrCorrectOpinion(String pocrasrCorrectOpinion) {
        this.pocrasrCorrectOpinion = pocrasrCorrectOpinion;
    }

    public int getAplrLocateInfNm() {
        return aplrLocateInfNm;
    }

    public void setAplrLocateInfNm(int aplrLocateInfNm) {
        this.aplrLocateInfNm = aplrLocateInfNm;
    }

    public List<LocateInfEntity> getLocateInfList() {
        return LocateInfList;
    }

    public void setLocateInfList(List<LocateInfEntity> locateInfList) {
        LocateInfList = locateInfList;
    }

    public String getAplrObjDesc() {
        return aplrObjDesc;
    }

    public void setAplrObjDesc(String aplrObjDesc) {
        this.aplrObjDesc = aplrObjDesc;
    }

    public String getAparResultCode() {
        return aparResultCode;
    }

    public void setAparResultCode(String aparResultCode) {
        this.aparResultCode = aparResultCode;
    }

    public String getAparResultDesc() {
        return aparResultDesc;
    }

    public void setAparResultDesc(String aparResultDesc) {
        this.aparResultDesc = aparResultDesc;
    }

    public String getAparServiceReturnCode() {
        return aparServiceReturnCode;
    }

    public void setAparServiceReturnCode(String aparServiceReturnCode) {
        this.aparServiceReturnCode = aparServiceReturnCode;
    }

    public String getDarResultCode() {
        return darResultCode;
    }

    public void setDarResultCode(String darResultCode) {
        this.darResultCode = darResultCode;
    }

    public String getDarResultDesc() {
        return darResultDesc;
    }

    public void setDarResultDesc(String darResultDesc) {
        this.darResultDesc = darResultDesc;
    }

    @Override
    public String toString() {
        return "CreditCenterObjHandingEntity{" +
                "creditCenterObjHandingId='" + creditCenterObjHandingId + '\'' +
                ", objCheckId='" + objCheckId + '\'' +
                ", objCheckNum='" + objCheckNum + '\'' +
                ", checkBeginDate='" + checkBeginDate + '\'' +
                ", name='" + name + '\'' +
                ", idType='" + idType + '\'' +
                ", idNum='" + idNum + '\'' +
                ", phoneNum='" + phoneNum + '\'' +
                ", objItemInf='" + objItemInf + '\'' +
                ", objItemDesc='" + objItemDesc + '\'' +
                ", dataProviderOrgCode='" + dataProviderOrgCode + '\'' +
                ", dataOccurOrgCode='" + dataOccurOrgCode + '\'' +
                ", businessCode='" + businessCode + '\'' +
                ", businessType='" + businessType + '\'' +
                ", checkFinalDate='" + checkFinalDate + '\'' +
                ", dataOccurDate='" + dataOccurDate + '\'' +
                ", dataOccurAmount='" + dataOccurAmount + '\'' +
                ", enclosureFlag='" + enclosureFlag + '\'' +
                ", historicalCheckInfList=" + historicalCheckInfList +
                ", airmfResultCode='" + airmfResultCode + '\'' +
                ", airmfResultDesc='" + airmfResultDesc + '\'' +
                ", airmfEnclosureFlag='" + airmfEnclosureFlag + '\'' +
                ", airmfEnclosureInf='" + airmfEnclosureInf + '\'' +
                ", rfIvrCheckResult='" + rfIvrCheckResult + '\'' +
                ", rfIvrCheckResultDesc='" + rfIvrCheckResultDesc + '\'' +
                ", afIvrResultCode='" + afIvrResultCode + '\'' +
                ", afIvrResultDesc='" + afIvrResultDesc + '\'' +
                ", fopoacrrCorrectResult='" + fopoacrrCorrectResult + '\'' +
                ", fopoacrrEnclosureInf='" + fopoacrrEnclosureInf + '\'' +
                ", fopoacrrCorrectDesc='" + fopoacrrCorrectDesc + '\'' +
                ", fopoacrResultCode='" + fopoacrResultCode + '\'' +
                ", fopoacrResultDesc='" + fopoacrResultDesc + '\'' +
                ", pocrasrResultCode='" + pocrasrResultCode + '\'' +
                ", pocrasrResultDesc='" + pocrasrResultDesc + '\'' +
                ", pocrasrCorrectAcceptFlag='" + pocrasrCorrectAcceptFlag + '\'' +
                ", pocrasrCorrectOpinion='" + pocrasrCorrectOpinion + '\'' +
                ", aplrLocateInfNm=" + aplrLocateInfNm +
                ", LocateInfList=" + LocateInfList +
                ", aplrObjDesc='" + aplrObjDesc + '\'' +
                ", aparResultCode='" + aparResultCode + '\'' +
                ", aparResultDesc='" + aparResultDesc + '\'' +
                ", aparServiceReturnCode='" + aparServiceReturnCode + '\'' +
                ", darResultCode='" + darResultCode + '\'' +
                ", darResultDesc='" + darResultDesc + '\'' +
                '}';
    }
}
