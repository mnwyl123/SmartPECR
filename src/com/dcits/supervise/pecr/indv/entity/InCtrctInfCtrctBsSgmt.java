package com.dcits.supervise.pecr.indv.entity;

import java.io.Serializable;

public class InCtrctInfCtrctBsSgmt implements Serializable {
    private static final long serialVersionUID = 4850025875865845746L;

    private String pcaCtrctBsSgmtId;  //主键PRI

    private String infRecType;  //信息记录类型

    private String contractCode;  //授信协议标识码

    private String rptDate;  //信息报告日期

    private String rptDateCode;  //报告时点说明代码

    private String name;  //受信人姓名

    private String idType;  //受信人证件类型

    private String idNum;  //受信人证件号码

    private String mngmtOrgCode;  //业务管理机构代码

    private String lastUpdateTime;  //最后更新时间

    private String operatorUser;  //操作员

    private String orgName;  //数据来源机构名称

    private String orgCode;  //数据来源机构编号

    private String businessStates;  //数据状态

    private String rejectReason;  //驳回原因

    private String isFilter;  //是否过滤标识(默认为N-不过滤)
    private String flag;
    private String reportMessageId;
    
    private String mdfcSgmtCode;	//待更正段段标
    
	public String getMdfcSgmtCode() {
		return mdfcSgmtCode;
	}

	public void setMdfcSgmtCode(String mdfcSgmtCode) {
		this.mdfcSgmtCode = mdfcSgmtCode;
	}

	public String getReportMessageId() {
		return reportMessageId;
	}

	public void setReportMessageId(String reportMessageId) {
		this.reportMessageId = reportMessageId;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getPcaCtrctBsSgmtId() {
		return pcaCtrctBsSgmtId;
	}

	public void setPcaCtrctBsSgmtId(String pcaCtrctBsSgmtId) {
		this.pcaCtrctBsSgmtId = pcaCtrctBsSgmtId;
	}

	public String getInfRecType() {
		return infRecType;
	}

	public void setInfRecType(String infRecType) {
		this.infRecType = infRecType;
	}

	public String getContractCode() {
		return contractCode;
	}

	public void setContractCode(String contractCode) {
		this.contractCode = contractCode;
	}

	public String getRptDate() {
		return rptDate;
	}

	public void setRptDate(String rptDate) {
		this.rptDate = rptDate;
	}

	public String getRptDateCode() {
		return rptDateCode;
	}

	public void setRptDateCode(String rptDateCode) {
		this.rptDateCode = rptDateCode;
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

	public String getMngmtOrgCode() {
		return mngmtOrgCode;
	}

	public void setMngmtOrgCode(String mngmtOrgCode) {
		this.mngmtOrgCode = mngmtOrgCode;
	}

	public String getLastUpdateTime() {
		return lastUpdateTime;
	}

	public void setLastUpdateTime(String lastUpdateTime) {
		this.lastUpdateTime = lastUpdateTime;
	}

	public String getOperatorUser() {
		return operatorUser;
	}

	public void setOperatorUser(String operatorUser) {
		this.operatorUser = operatorUser;
	}

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	public String getOrgCode() {
		return orgCode;
	}

	public void setOrgCode(String orgCode) {
		this.orgCode = orgCode;
	}

	public String getBusinessStates() {
		return businessStates;
	}

	public void setBusinessStates(String businessStates) {
		this.businessStates = businessStates;
	}

	public String getRejectReason() {
		return rejectReason;
	}

	public void setRejectReason(String rejectReason) {
		this.rejectReason = rejectReason;
	}

	public String getIsFilter() {
		return isFilter;
	}

	public void setIsFilter(String isFilter) {
		this.isFilter = isFilter;
	}
    
}
