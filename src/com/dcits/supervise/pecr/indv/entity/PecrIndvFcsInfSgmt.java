package com.dcits.supervise.pecr.indv.entity;

import java.io.Serializable;

/**
 * 个人基本信息记录基本概况信息段
 * @author munan
 *
 */
public class PecrIndvFcsInfSgmt implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 主键
	 */
	private String pacFcsInfSgmtId;
	/**
	 * 外建
	 */
	private String paaBsSgmtId;
	/**
	 * 性别
	 */
	private String sex;     
	/**
	 * 出生日期
	 */
	private String dOB;     
	/**
	 * 国籍
	 */
	private String nation;   
	/**
	 * 户籍地址
	 */
	private String houseAdd;   
	/**
	 * 户籍所在地行政区划
	 */
	private String hhDist;      
	/**
	 * 手机号码
	 */
	private String cellPhone;    
	/**
	 * 电子邮箱
	 */
	private String email;        
	/**
	 * 信息更新日期
	 */
	private String fcsInfoUpDate;
	/**
	 * 信息报告日期
	 */
	private String rptDate;
	public String getRptDate() {
		return rptDate;
	}
	public void setRptDate(String rptDate) {
		this.rptDate = rptDate;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getdOB() {
		return dOB;
	}
	public void setdOB(String dOB) {
		this.dOB = dOB;
	}
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	public String getHouseAdd() {
		return houseAdd;
	}
	public void setHouseAdd(String houseAdd) {
		this.houseAdd = houseAdd;
	}
	public String getHhDist() {
		return hhDist;
	}
	public void setHhDist(String hhDist) {
		this.hhDist = hhDist;
	}
	public String getCellPhone() {
		return cellPhone;
	}
	public void setCellPhone(String cellPhone) {
		this.cellPhone = cellPhone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getFcsInfoUpDate() {
		return fcsInfoUpDate;
	}
	public void setFcsInfoUpDate(String fcsInfoUpDate) {
		this.fcsInfoUpDate = fcsInfoUpDate;
	}
	public String getPacFcsInfSgmtId() {
		return pacFcsInfSgmtId;
	}
	public void setPacFcsInfSgmtId(String pacFcsInfSgmtId) {
		this.pacFcsInfSgmtId = pacFcsInfSgmtId;
	}
	public String getPaaBsSgmtId() {
		return paaBsSgmtId;
	}
	public void setPaaBsSgmtId(String paaBsSgmtId) {
		this.paaBsSgmtId = paaBsSgmtId;
	}

	
}
