package com.dcits.supervise.pecr.ent.entity;

import java.io.Serializable;

public class EntActuCotrlInfSgmt implements Serializable {

	  /**
	   * 
	   */
	  private static final long serialVersionUID = 1L;
	  /**
	   * 主键
	   */
	  private String eafActuCotrlInfSgmtId ;
	  /**
	   * 实际控制人身份类别
	   */
	  private String actuCotrlCertType ;
	  /**
	   * 实际控制人名称
	   */
	  private String actuCotrlName ;
	  /**
	   * 实际控制人身份标识类型
	   */
	  private String actuCotrlIdType ;
	  /**
	   * 实际控制人身份标识号码
	   */
	  private String actuCotrlIdNum ;
	  /**
	   * 信息更新日期
	   */
	  private String actuCotrlInfoUpdate ;
	  /**
	   * 数据外键
	   */
	  private String eaaBsSgmtId ;
	  /**
	   * 报送日期
	   */
	  private String rptDate ;
	public String getEafActuCotrlInfSgmtId() {
		return eafActuCotrlInfSgmtId;
	}
	public void setEafActuCotrlInfSgmtId(String eafActuCotrlInfSgmtId) {
		this.eafActuCotrlInfSgmtId = eafActuCotrlInfSgmtId;
	}
	public String getActuCotrlCertType() {
		return actuCotrlCertType;
	}
	public void setActuCotrlCertType(String actuCotrlCertType) {
		this.actuCotrlCertType = actuCotrlCertType;
	}
	public String getActuCotrlName() {
		return actuCotrlName;
	}
	public void setActuCotrlName(String actuCotrlName) {
		this.actuCotrlName = actuCotrlName;
	}
	public String getActuCotrlIdType() {
		return actuCotrlIdType;
	}
	public void setActuCotrlIdType(String actuCotrlIdType) {
		this.actuCotrlIdType = actuCotrlIdType;
	}
	public String getActuCotrlIdNum() {
		return actuCotrlIdNum;
	}
	public void setActuCotrlIdNum(String actuCotrlIdNum) {
		this.actuCotrlIdNum = actuCotrlIdNum;
	}
	public String getActuCotrlInfoUpdate() {
		return actuCotrlInfoUpdate;
	}
	public void setActuCotrlInfoUpdate(String actuCotrlInfoUpdate) {
		this.actuCotrlInfoUpdate = actuCotrlInfoUpdate;
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
