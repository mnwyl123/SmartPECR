package com.dcits.supervise.pecr.ent.entity;

import java.io.Serializable;

public class EntMnShaHodInfSgmt implements Serializable {

	  /**
	   * 
	   */
	  private static final long serialVersionUID = 1L;
	  /**
	   * 主键
	   */
	  private String eaeMnShaHodInfSgmtId ;
	  /**
	   * 注册资本币种
	   */
	  private String regCapCurrency ;
	  /**
	   * 注册资本
	   */
	  private String regCap ;
	  /**
	   * 出资人类型
	   */
	  private String sharHodType ;
	  /**
	   * 出资人身份类别
	   */
	  private String sharHodCertType ;
	  /**
	   * 出资人名称
	   */
	  private String sharHodName ;
	  /**
	   * 出资人身份标识类型
	   */
	  private String sharHodIdType ;
	  /**
	   * 出资人身份标识号码
	   */
	  private String sharHodIdNum ;
	  /**
	   * 出资比例
	   */
	  private String invRatio ;
	  /**
	   * 信息更新日期
	   */
	  private String mnShaHodInfoUpDate ;
	  /**
	   * 数据外键
	   */
	  private String eaaBsSgmtId ;
	  /**
	   * 报送日期
	   */
	  private String rptDate ;
	public String getEaeMnShaHodInfSgmtId() {
		return eaeMnShaHodInfSgmtId;
	}
	public void setEaeMnShaHodInfSgmtId(String eaeMnShaHodInfSgmtId) {
		this.eaeMnShaHodInfSgmtId = eaeMnShaHodInfSgmtId;
	}
	public String getRegCapCurrency() {
		return regCapCurrency;
	}
	public void setRegCapCurrency(String regCapCurrency) {
		this.regCapCurrency = regCapCurrency;
	}
	public String getRegCap() {
		return regCap;
	}
	public void setRegCap(String regCap) {
		this.regCap = regCap;
	}
	public String getSharHodType() {
		return sharHodType;
	}
	public void setSharHodType(String sharHodType) {
		this.sharHodType = sharHodType;
	}
	public String getSharHodCertType() {
		return sharHodCertType;
	}
	public void setSharHodCertType(String sharHodCertType) {
		this.sharHodCertType = sharHodCertType;
	}
	public String getSharHodName() {
		return sharHodName;
	}
	public void setSharHodName(String sharHodName) {
		this.sharHodName = sharHodName;
	}
	public String getSharHodIdType() {
		return sharHodIdType;
	}
	public void setSharHodIdType(String sharHodIdType) {
		this.sharHodIdType = sharHodIdType;
	}
	public String getSharHodIdNum() {
		return sharHodIdNum;
	}
	public void setSharHodIdNum(String sharHodIdNum) {
		this.sharHodIdNum = sharHodIdNum;
	}
	public String getInvRatio() {
		return invRatio;
	}
	public void setInvRatio(String invRatio) {
		this.invRatio = invRatio;
	}
	public String getMnShaHodInfoUpDate() {
		return mnShaHodInfoUpDate;
	}
	public void setMnShaHodInfoUpDate(String mnShaHodInfoUpDate) {
		this.mnShaHodInfoUpDate = mnShaHodInfoUpDate;
	}
	public String getEaaBsSgmtId() {
		return eaaBsSgmtId;
	}
	public void setEaaBsSgmtId(String eaaBsSgmtId) {
		this.eaaBsSgmtId = eaaBsSgmtId;
	}
	public String getRptDate() {
		return rptDate;
	}
	public void setRptDate(String rptDate) {
		this.rptDate = rptDate;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
