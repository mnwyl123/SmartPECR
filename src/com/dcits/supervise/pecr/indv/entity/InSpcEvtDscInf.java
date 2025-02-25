package com.dcits.supervise.pecr.indv.entity;

import java.io.Serializable;

public class InSpcEvtDscInf implements Serializable {
	private static final long serialVersionUID = 4850025875865845746L;
	/**
	 * 主键
	 */
	private String pbkInSpcEvtDscInfId; 
	/**
	 * 信息记录类型
	 */
	private String infRecType; 
	/**
	 * 账户类型
	 */
	private String acctType;  
	/**
	 * 账户标识码
	 */
	private String acctCode;  
	/**
	 * 事件类型
	 */
	private String opetnType;  
	/**
	 * 发生月份
	 */
	private String month;  
	/**
	 * 生效标志
	 */
	private String flag;  
	/**
	 * 信息报告日期
	 */
	private String rptDate; 
	/**
	 * 最后更新时间
	 */
	private String lastUpdateTime;
	/**
	 * 操作员
	 */
	private String operatorUser;  
	/**
	 * 数据来源机构名称
	 */
	private String orgName;  
	/**
	 * 数据来源机构编号
	 */
	private String orgCode;  
	/**
	 * 数据状态
	 */
	private String businessStates; 
	/**
	 * 驳回原因
	 */
	private String rejectReason;  
	/**
	 * 是否过滤标识(默认为N-不过滤)
	 */
	private String isFilter; 
	/**
	 * 报文文件ID
	 */
	private String reportMessageId; 
	/**
	 * 借款人姓名
	 */
	private String name;
	/**
	 * 借款人证件类型
	 */
	private String idType;  
	/**
	 * 借款人证件号码
	 */
	private String idNum;
	private String flag1;

	public String getFlag1() {
		return flag1;
	}
	public void setFlag1(String flag1) {
		this.flag1 = flag1;
	}
	public String getPbkInSpcEvtDscInfId() {
		return pbkInSpcEvtDscInfId;
	}
	public void setPbkInSpcEvtDscInfId(String pbkInSpcEvtDscInfId) {
		this.pbkInSpcEvtDscInfId = pbkInSpcEvtDscInfId;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getInfRecType() {
		return infRecType;
	}
	public void setInfRecType(String infRecType) {
		this.infRecType = infRecType;
	}
	public String getAcctType() {
		return acctType;
	}
	public void setAcctType(String acctType) {
		this.acctType = acctType;
	}
	public String getAcctCode() {
		return acctCode;
	}
	public void setAcctCode(String acctCode) {
		this.acctCode = acctCode;
	}
	public String getOpetnType() {
		return opetnType;
	}
	public void setOpetnType(String opetnType) {
		this.opetnType = opetnType;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getRptDate() {
		return rptDate;
	}
	public void setRptDate(String rptDate) {
		this.rptDate = rptDate;
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
	public String getReportMessageId() {
		return reportMessageId;
	}
	public void setReportMessageId(String reportMessageId) {
		this.reportMessageId = reportMessageId;
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
	

	
}
