package com.dcits.supervise.pecr.indv.entity;

import java.io.Serializable;
/**
 * 个人基本信息记录职业信息段
 * @author munan
 *
 */
public class PecrIndvOctpnInfSgmt implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 主键
	 */
	private String paeOctpnInfSgmtId;
	/**
	 * 报送日期
	 */
	private String rptDate;
	/**
	 * 外建
	 */
	private String paaBsSgmtId;
	/**
	 * 就业状况
	 */
	private String empStatus;
	/**
	 * 单位名称
	 */
	private String cpnName;
	/**
	 * 单位性质
	 */
	private String cpnType;
	/**
	 * 单位所属行业
	 */
	private String industry;
	/**
	 * 单位详细地址
	 */
	private String cpnAddr;
	/**
	 * 单位所在地邮编
	 */
	private String cpnPc;
	/**
	 * 单位所在地行政区划
	 */
	private String cpnDist;
	/**
	 * 单位电话
	 */
	private String cpnTEL;
	/**
	 * 职业
	 */
	private String occupation;
	/**
	 * 职务
	 */
	private String title;
	/**
	 * 职称
	 */
	private String techTitle;
	/**
	 * 本单位工作起始年份
	 */
	private String workStartDate;
	/**
	 * 信息更新日期
	 */
	private String octpnInfoUpDa;
	public String getEmpStatus() {
		return empStatus;
	}
	public void setEmpStatus(String empStatus) {
		this.empStatus = empStatus;
	}
	public String getCpnName() {
		return cpnName;
	}
	public void setCpnName(String cpnName) {
		this.cpnName = cpnName;
	}
	public String getCpnType() {
		return cpnType;
	}
	public void setCpnType(String cpnType) {
		this.cpnType = cpnType;
	}
	public String getIndustry() {
		return industry;
	}
	public void setIndustry(String industry) {
		this.industry = industry;
	}
	public String getCpnAddr() {
		return cpnAddr;
	}
	public void setCpnAddr(String cpnAddr) {
		this.cpnAddr = cpnAddr;
	}
	public String getCpnPc() {
		return cpnPc;
	}
	public void setCpnPc(String cpnPc) {
		this.cpnPc = cpnPc;
	}
	public String getCpnDist() {
		return cpnDist;
	}
	public void setCpnDist(String cpnDist) {
		this.cpnDist = cpnDist;
	}
	public String getCpnTEL() {
		return cpnTEL;
	}
	public void setCpnTEL(String cpnTEL) {
		this.cpnTEL = cpnTEL;
	}
	public String getOccupation() {
		return occupation;
	}
	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTechTitle() {
		return techTitle;
	}
	public void setTechTitle(String techTitle) {
		this.techTitle = techTitle;
	}
	public String getWorkStartDate() {
		return workStartDate;
	}
	public void setWorkStartDate(String workStartDate) {
		this.workStartDate = workStartDate;
	}
	public String getOctpnInfoUpDa() {
		return octpnInfoUpDa;
	}
	public void setOctpnInfoUpDa(String octpnInfoUpDa) {
		this.octpnInfoUpDa = octpnInfoUpDa;
	}
	public String getPaeOctpnInfSgmtId() {
		return paeOctpnInfSgmtId;
	}
	public void setPaeOctpnInfSgmtId(String paeOctpnInfSgmtId) {
		this.paeOctpnInfSgmtId = paeOctpnInfSgmtId;
	}
	public String getRptDate() {
		return rptDate;
	}
	public void setRptDate(String rptDate) {
		this.rptDate = rptDate;
	}
	public String getPaaBsSgmtId() {
		return paaBsSgmtId;
	}
	public void setPaaBsSgmtId(String paaBsSgmtId) {
		this.paaBsSgmtId = paaBsSgmtId;
	}
	
	
}
