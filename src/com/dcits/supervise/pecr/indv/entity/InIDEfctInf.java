package com.dcits.supervise.pecr.indv.entity;

import java.io.Serializable;

public class InIDEfctInf implements Serializable {
	private static final long serialVersionUID = -2354852272222681638L;
	/**
	 * 主键
	 */
	private String pakInIdEfctInfId;
	/**
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
	 * 证件有效期起始日期
	 */
	private String idEfctDate;
	/**
	 * 证件有效期终止日期
	 */
	private String idDueDate;
	/**
	 * 证件签发机关名称
	 */
	private String idOrgName;
	/**
	 * 证件签发机关所在地行政区划
	 */
	private String idDist;
	/**
	 * 客户资料维护机构代码
	 */
	private String cimoc;
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
	public String getPakInIdEfctInfId() {
		return pakInIdEfctInfId;
	}
	public void setPakInIdEfctInfId(String pakInIdEfctInfId) {
		this.pakInIdEfctInfId = pakInIdEfctInfId;
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
	public String getIdEfctDate() {
		return idEfctDate;
	}
	public void setIdEfctDate(String idEfctDate) {
		this.idEfctDate = idEfctDate;
	}
	public String getIdDueDate() {
		return idDueDate;
	}
	public void setIdDueDate(String idDueDate) {
		this.idDueDate = idDueDate;
	}
	public String getIdOrgName() {
		return idOrgName;
	}
	public void setIdOrgName(String idOrgName) {
		this.idOrgName = idOrgName;
	}
	public String getIdDist() {
		return idDist;
	}
	public void setIdDist(String idDist) {
		this.idDist = idDist;
	}
	public String getCimoc() {
		return cimoc;
	}
	public void setCimoc(String cimoc) {
		this.cimoc = cimoc;
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
