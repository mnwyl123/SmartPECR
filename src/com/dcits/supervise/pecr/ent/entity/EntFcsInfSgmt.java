package com.dcits.supervise.pecr.ent.entity;

import java.io.Serializable;

public class EntFcsInfSgmt implements Serializable {

	
	 /**
	 * 主键
	 */
	  private String eacFcsInfSgmtId ;
	  /**
		 * 国别代码
		 */
	  private String nationality ;
	  /**
		 * 登记地址
		 */
	  private String regAdd ;
	  /**
		 * 登记地行政区划代码
		 */
	  private String admDivOfReg ;
	  /**
		 * 成立日期
		 */
	  private String establishDate ;
	  /**
		 * 营业许可证到期日
		 */
	  private String bizEndDate ;
	  /**
		 * 业务范围
		 */
	  private String bizRange ;
	  /**
		 * 行业分类代码
		 */
	  private String ecoIndusCate ;
	  /**
		 * 经济类型代码
		 */
	  private String ecoType ;
	  /**
		 * 企业规模
		 */
	  private String entScale ;
	  /**
		 * 基本概况信息更新日期
		 */
	  private String fcsInfoUpDate ;
	  /**
		 * 数据外键
		 */
	  private String eaaBsSgmtId ;
	  /**
		 * 报送日期
		 */
	  private String rptDate;
	public String getEacFcsInfSgmtId() {
		return eacFcsInfSgmtId;
	}
	public void setEacFcsInfSgmtId(String eacFcsInfSgmtId) {
		this.eacFcsInfSgmtId = eacFcsInfSgmtId;
	}
	public String getNationality() {
		return nationality;
	}
	public void setNationality(String nationality) {
		this.nationality = nationality;
	}
	public String getRegAdd() {
		return regAdd;
	}
	public void setRegAdd(String regAdd) {
		this.regAdd = regAdd;
	}
	public String getAdmDivOfReg() {
		return admDivOfReg;
	}
	public void setAdmDivOfReg(String admDivOfReg) {
		this.admDivOfReg = admDivOfReg;
	}
	public String getEstablishDate() {
		return establishDate;
	}
	public void setEstablishDate(String establishDate) {
		this.establishDate = establishDate;
	}
	public String getBizEndDate() {
		return bizEndDate;
	}
	public void setBizEndDate(String bizEndDate) {
		this.bizEndDate = bizEndDate;
	}
	public String getBizRange() {
		return bizRange;
	}
	public void setBizRange(String bizRange) {
		this.bizRange = bizRange;
	}
	public String getEcoIndusCate() {
		return ecoIndusCate;
	}
	public void setEcoIndusCate(String ecoIndusCate) {
		this.ecoIndusCate = ecoIndusCate;
	}
	public String getEcoType() {
		return ecoType;
	}
	public void setEcoType(String ecoType) {
		this.ecoType = ecoType;
	}
	public String getEntScale() {
		return entScale;
	}
	public void setEntScale(String entScale) {
		this.entScale = entScale;
	}
	public String getFcsInfoUpDate() {
		return fcsInfoUpDate;
	}
	public void setFcsInfoUpDate(String fcsInfoUpDate) {
		this.fcsInfoUpDate = fcsInfoUpDate;
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
}
