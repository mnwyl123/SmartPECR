package com.dcits.supervise.pecr.indv.entity;

import java.io.Serializable;

public class InFalMmbsInf implements Serializable {
	private static final long serialVersionUID = -2354852272222681638L;
	/**
	 * 主键
	 */
	private String pajInFalMmbsInfId;
	/**
	 * 信息记录类型
	 */
	private String infRecType;
	/**
	 * A姓名
	 */
	private String name;
	/**
	 * A证件类型
	 */
	private String idType;
	/**
	 * A证件号码
	 */
	private String idNum;
	/**
	 * B姓名
	 */
	private String famMemName;
	/**
	 * B证件类型
	 */
	private String famMemCertType;
	/**
	 * B证件号码
	 */
	private String famMemCertNum;
	/**
	 * 家族关系
	 */
	private String famRel;
	/**
	 * 家族关系有效标志
	 */
	private String famRelaAssFlag;
	/**
	 * 信息来源编码
	 */
	private String infSurcCode;
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
	private String flag;
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getPajInFalMmbsInfId() {
		return pajInFalMmbsInfId;
	}
	public void setPajInFalMmbsInfId(String pajInFalMmbsInfId) {
		this.pajInFalMmbsInfId = pajInFalMmbsInfId;
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
	public String getFamMemName() {
		return famMemName;
	}
	public void setFamMemName(String famMemName) {
		this.famMemName = famMemName;
	}
	public String getFamMemCertType() {
		return famMemCertType;
	}
	public void setFamMemCertType(String famMemCertType) {
		this.famMemCertType = famMemCertType;
	}
	public String getFamMemCertNum() {
		return famMemCertNum;
	}
	public void setFamMemCertNum(String famMemCertNum) {
		this.famMemCertNum = famMemCertNum;
	}
	public String getFamRel() {
		return famRel;
	}
	public void setFamRel(String famRel) {
		this.famRel = famRel;
	}
	public String getFamRelaAssFlag() {
		return famRelaAssFlag;
	}
	public void setFamRelaAssFlag(String famRelaAssFlag) {
		this.famRelaAssFlag = famRelaAssFlag;
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
