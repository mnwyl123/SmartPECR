package com.dcits.supervise.pecr.ent.entity;

import java.io.Serializable;

public class EnIcdnRltpInf implements Serializable {
	
	private static final long serialVersionUID = -2354852272222681638L;
	  /**
	   * 主键
	   */
	  private String ecaEnIcdnRltpInfId ;
	  public String getEcaEnIcdnRltpInfId() {
		return ecaEnIcdnRltpInfId;
	}

	public void setEcaEnIcdnRltpInfId(String ecaEnIcdnRltpInfId) {
		this.ecaEnIcdnRltpInfId = ecaEnIcdnRltpInfId;
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

	public String getAssoEntName() {
		return assoEntName;
	}

	public void setAssoEntName(String assoEntName) {
		this.assoEntName = assoEntName;
	}

	public String getAssoEntCertType() {
		return assoEntCertType;
	}

	public void setAssoEntCertType(String assoEntCertType) {
		this.assoEntCertType = assoEntCertType;
	}

	public String getAssoEntCertNum() {
		return assoEntCertNum;
	}

	public void setAssoEntCertNum(String assoEntCertNum) {
		this.assoEntCertNum = assoEntCertNum;
	}

	public String getAssoType() {
		return assoType;
	}

	public void setAssoType(String assoType) {
		this.assoType = assoType;
	}

	public String getAssoSign() {
		return assoSign;
	}

	public void setAssoSign(String assoSign) {
		this.assoSign = assoSign;
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

	public String getRptDate() {
		return rptDate;
	}

	public void setRptDate(String rptDate) {
		this.rptDate = rptDate;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	/**
	   * 信息记录类型
	   */
	  private String infRecType ;
	  /**
	   * A企业名称
	   */
	  private String entName ;
	  /**
	   * A企业身份标识类型
	   */
	  private String entCertType ;
	  /**
	   * A企业身份标识码
	   */
	  private String entCertNum ;
	  /**
	   * B企业名称
	   */
	  private String assoEntName ;
	  /**
	   * B企业身份标识类型
	   */
	  private String assoEntCertType ;
	  /**
	   * B企业身份标识码
	   */
	  private String assoEntCertNum ;
	  /**
	   * 关联关系类型
	   */
	  private String assoType;
	  /**
	   * 关联标志
	   */
	  private String assoSign ;
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
	  /**
	   * 信息报告日期
	   */
	  private String rptDate;
	  
	  private String flag;

}
