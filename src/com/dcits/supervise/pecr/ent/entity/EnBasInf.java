package com.dcits.supervise.pecr.ent.entity;

import java.io.Serializable;

public class EnBasInf implements Serializable {
	
	private static final long serialVersionUID = -2354852272222681638L;
	/**
	 * 主键
	 */
	private String   eaaBsSgmtId ;
	/**
	 * 信息记录类型
	 */
	private String   infRecType ;
	/**
	 * 企业名称
	 */
	private String   entName ;
	/**
	 * 企业身份标识类型
	 */
	private String   entCertType ;
	/**
	 * 企业身份标识号码
	 */
	private String   entCertNum ;
	/**
	 * 信息报告日期
	 */
	private String   rptDate ;
	/**
	 * 报告时点说明代码
	 */
	private String   rptDateCode ;
	/**
	 * 信息来源编码
	 */
	private String   infSurcCode ;
	/**
	 * 客户资料维护机构代码
	 */
	private String   cimoc ;
	/**
	 * 客户资料类型
	 */
	private String   customerType ;
	/**
	 * 存续状态
	 */
	private String   etpSts ;
	/**
	 * 组织机构类型
	 */
	private String   orgType ;
	/**
	 * 最后更新时间
	 */
	private String   lastUpdateTime ;
	/**
	 * 操作员
	 */
	private String   operatorUser ;
	/**
	 * 数据来源机构名称
	 */
	private String   orgName ;
	/**
	 * 数据来源机构编号
	 */
	private String   orgCode ;
	/**
	 * 数据状态
	 */
	private String   businessStates ;
	/**
	 * 驳回原因
	 */
	private String   rejectReason ;
	/**
	 * 是否过滤标识(默认为N-不过滤)
	 */
	private String   isFilter ;
	/**
	 * 报文文件ID
	 */
	private String   reportMessageId;
	
	private String  flag;
	
	private String mdfcSgmtCode;
	
	
	
	public String getMdfcSgmtCode() {
		return mdfcSgmtCode;
	}
	public void setMdfcSgmtCode(String mdfcSgmtCode) {
		this.mdfcSgmtCode = mdfcSgmtCode;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getEaaBsSgmtId() {
		return eaaBsSgmtId;
	}
	public void setEaaBsSgmtId(String eaaBsSgmtId) {
		this.eaaBsSgmtId = eaaBsSgmtId;
	}
	public String getInfRecType() {
		return infRecType;
	}
	public void setInfRecType(String infRecType) {
		this.infRecType = infRecType;
	}
	public String getEntName() {
		return entName;
	}
	public void setEntName(String entName) {
		this.entName = entName;
	}
	public String getEntCertType() {
		return entCertType;
	}
	public void setEntCertType(String entCertType) {
		this.entCertType = entCertType;
	}
	public String getEntCertNum() {
		return entCertNum;
	}
	public void setEntCertNum(String entCertNum) {
		this.entCertNum = entCertNum;
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
	public String getInfSurcCode() {
		return infSurcCode;
	}
	public void setInfSurcCode(String infSurcCode) {
		this.infSurcCode = infSurcCode;
	}
	public String getCimoc() {
		return cimoc;
	}
	public void setCimoc(String cimoc) {
		this.cimoc = cimoc;
	}
	public String getCustomerType() {
		return customerType;
	}
	public void setCustomerType(String customerType) {
		this.customerType = customerType;
	}
	public String getEtpSts() {
		return etpSts;
	}
	public void setEtpSts(String etpSts) {
		this.etpSts = etpSts;
	}
	public String getOrgType() {
		return orgType;
	}
	public void setOrgType(String orgType) {
		this.orgType = orgType;
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
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
