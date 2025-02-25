package com.dcits.supervise.pecr.ent.entity;

import java.io.Serializable;

public class CashFlows implements Serializable {

	  private static final long serialVersionUID = -2354852272222681638L;
	  /**
	   * 主键
	   */
	  private String ejaCashFlowsBsSgmtId ;
	  /**
	   * 信息记录类型
	   */
	  private String infRecType ;
	  /**
	   * 企业名称
	   */
	  private String entName ;
	  /**
	   * 企业身份标识类型
	   */
	  private String entCertType ;
	  /**
	   * 企业身份标识号码
	   */
	  private String entCertNum ;
	  /**
	   * 信息报告日期
	   */
	  private String rptDate ;
	  /**
	   * 报表年份
	   */
	  private String sheetYear ;
	  /**
	   * 报表类型
	   */
	  private String sheetType ;
	  /**
	   * 报表类型细分
	   */
	  private String sheetTypeDivide ;
	  /**
	   * 审计事务所名称
	   */
	  private String auditFirmName ;
	  /**
	   * 审计人员名称
	   */
	  private String auditorName ;
	  /**
	   * 审计时间
	   */
	  private String auditTime ;
	  /**
	   * 客户资料维护机构代码
	   */
	  private String cimoc ;
	  /**
	   * 报告时点说明代码
	   */
	  private String rptDateCode ;
	  /**
	   * 最后更新时间
	   */
	  private String lastUpdateTime ;
	  /**
	   * 操作员
	   */
	  private String operatorUser ;
	  /**
	   * 数据来源机构名称
	   */
	  private String orgName ;
	  /**
	   * 数据来源机构编号
	   */
	  private String orgCode ;
	  /**
	   * 数据状态
	   */
	  private String businessStates ;
	  /**
	   * 驳回原因
	   */
	  private String rejectReason ;
	  /**
	   * 是否过滤标识(默认为N-不过滤)
	   */
	  private String isFilter ;
	  /**
	   * 报文文件ID
	   */
	  private String reportMessageId ;
	  private String flag ;
	  
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getEjaCashFlowsBsSgmtId() {
		return ejaCashFlowsBsSgmtId;
	}
	public void setEjaCashFlowsBsSgmtId(String ejaCashFlowsBsSgmtId) {
		this.ejaCashFlowsBsSgmtId = ejaCashFlowsBsSgmtId;
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
	public String getSheetYear() {
		return sheetYear;
	}
	public void setSheetYear(String sheetYear) {
		this.sheetYear = sheetYear;
	}
	public String getSheetType() {
		return sheetType;
	}
	public void setSheetType(String sheetType) {
		this.sheetType = sheetType;
	}
	public String getSheetTypeDivide() {
		return sheetTypeDivide;
	}
	public void setSheetTypeDivide(String sheetTypeDivide) {
		this.sheetTypeDivide = sheetTypeDivide;
	}
	public String getAuditFirmName() {
		return auditFirmName;
	}
	public void setAuditFirmName(String auditFirmName) {
		this.auditFirmName = auditFirmName;
	}
	public String getAuditorName() {
		return auditorName;
	}
	public void setAuditorName(String auditorName) {
		this.auditorName = auditorName;
	}
	public String getAuditTime() {
		return auditTime;
	}
	public void setAuditTime(String auditTime) {
		this.auditTime = auditTime;
	}
	public String getCimoc() {
		return cimoc;
	}
	public void setCimoc(String cimoc) {
		this.cimoc = cimoc;
	}
	public String getRptDateCode() {
		return rptDateCode;
	}
	public void setRptDateCode(String rptDateCode) {
		this.rptDateCode = rptDateCode;
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
