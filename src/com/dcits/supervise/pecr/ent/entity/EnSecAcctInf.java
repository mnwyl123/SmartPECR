package com.dcits.supervise.pecr.ent.entity;

import java.io.Serializable;

public class EnSecAcctInf implements Serializable {
	
	private static final long serialVersionUID = -2354852272222681638L;
	  /**
	   * 主键
	   */
	  private String eeaGuarAcctBsSgmtId ;
	  /**
	   * 信息记录类型
	   */
	  private String infRecType ;
	  /**
	   * 账户类型
	   */
	  private String acctType ;
	  /**
	   * 账户标识码
	   */
	  private String acctCode ;
	  /**
	   * 信息报告日期
	   */
	  private String rptDate ;
	  /**
	   * 报告时点说明代码
	   */
	  private String rptDateCode ;
	  /**
	   * 债务人名称
	   */
	  private String name ;
	  /**
	   * 债务人身份标识类型
	   */
	  private String idType ;
	  /**
	   * 债务人身份标识号码
	   */
	  private String idNum ;
	  /**
	   * 业务管理机构代码
	   */
	  private String mngmtOrgCode ;
	  /**
	   * 最后更新时间
	   */
	  private String lastUpdateTime ;
	  /**
	   * 操作员
	   */
	  private String operatorUser ;
	  public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	/**
	   * 数据来源机构名称
	   */
	  private String orgName ;
	  /**
	   * 数据来源机构编号
	   */
	  private String orgCode ;
	  private String flag;
	  public String getEeaGuarAcctBsSgmtId() {
		return eeaGuarAcctBsSgmtId;
	}
	public void setEeaGuarAcctBsSgmtId(String eeaGuarAcctBsSgmtId) {
		this.eeaGuarAcctBsSgmtId = eeaGuarAcctBsSgmtId;
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
	public String getReportMessageId() {
		return reportMessageId;
	}
	public void setReportMessageId(String reportMessageId) {
		this.reportMessageId = reportMessageId;
	}
	public String getMdfcSgmtCode() {
		return mdfcSgmtCode;
	}
	public void setMdfcSgmtCode(String mdfcSgmtCode) {
		this.mdfcSgmtCode = mdfcSgmtCode;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
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
	  /**
	   * 待更正段段标
	   */
	  private String mdfcSgmtCode;
}
