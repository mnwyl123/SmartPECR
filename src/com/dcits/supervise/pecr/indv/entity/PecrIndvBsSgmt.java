package com.dcits.supervise.pecr.indv.entity;

import java.io.Serializable;

/**
 * 个人基本信息记录基础段
 * @author munan
 *
 */
public class PecrIndvBsSgmt implements Serializable {

	/***
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	/**
	 * 主键
	 */
	private String paaBsSmgtId;
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
	/***
	 * 信息记录类型
	 */
	private String infRecType;
	/**
	 * 姓名
	 */
	private String name;
	/**
	 * 证件类型
	 */
	private String idType;
	/**
	 * 证件号码
	 */
	private String idNum;
	/**
	 * 信息来源编码
	 */
	private String infSurcCode;
	/**
	 * 信息报告日期
	 */
	private String rptDate;
	/**
	 * 报告时点说明代码
	 */
	private String rptDateCode;
	/**
	 * 客户资料维护机构代码
	 */
	private String cimoc;
	/**
	 * 客户资料类型
	 */
	private String customerType;
	//private String lastUpdateTime;
	private String flag;
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
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
	public String getInfSurcCode() {
		return infSurcCode;
	}
	public void setInfSurcCode(String infSurcCode) {
		this.infSurcCode = infSurcCode;
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
	public String getPaaBsSmgtId() {
		return paaBsSmgtId;
	}
	public void setPaaBsSmgtId(String paaBsSmgtId) {
		this.paaBsSmgtId = paaBsSmgtId;
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


}
