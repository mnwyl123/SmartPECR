package com.dcits.supervise.pecr.ent.entity;

import java.io.Serializable;

public class EntIdSgmt implements Serializable {

	/**
	 * 
	 */
	  private static final long serialVersionUID = 1L;
	  /**
		 * 310-企业基本信息其他标识信息段主键
		 */
	  private String eabIdSgmtId ;
	  /**
		 * 企业身份标识类型
		 */
	  private String othEntCertType ;
	  /**
		 * 企业身份标识号码
		 */
	  private String othEntCertNum ;
	  /**
		 * 信息更新日期
		 */
	  private String idInfoUpDate ;
	  /**
		 * 数据外键
		 */
	  private String eaaBsSgmtId ;
	  /**
		 * 报送日期
		 */
	  private String rptDate;
	public String getEabIdSgmtId() {
		return eabIdSgmtId;
	}
	public void setEabIdSgmtId(String eabIdSgmtId) {
		this.eabIdSgmtId = eabIdSgmtId;
	}
	public String getOthEntCertType() {
		return othEntCertType;
	}
	public void setOthEntCertType(String othEntCertType) {
		this.othEntCertType = othEntCertType;
	}
	public String getOthEntCertNum() {
		return othEntCertNum;
	}
	public void setOthEntCertNum(String othEntCertNum) {
		this.othEntCertNum = othEntCertNum;
	}
	public String getIdInfoUpDate() {
		return idInfoUpDate;
	}
	public void setIdInfoUpDate(String idInfoUpDate) {
		this.idInfoUpDate = idInfoUpDate;
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
