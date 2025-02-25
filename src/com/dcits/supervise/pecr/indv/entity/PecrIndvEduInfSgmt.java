package com.dcits.supervise.pecr.indv.entity;

import java.io.Serializable;

/**
 * 个人基本信息记录教育信息段
 * @author munan
 *
 */
public class PecrIndvEduInfSgmt implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 主键
	 */
	private String padEduInfSgmtId;
	/**
	 * 数据外建
	 */
	private String paaBsSgmtId;
	/**
	 * 报送日期  
	 */
	private String rptDate;
	/**
	 * 学历
	 */
	private String eduLevel;     
	/**
	 * 学位
	 */
	private String acaDegree;    
	/**
	 * 信息更新日期
	 */
	private String eduInfoUpDate;
	public String getEduLevel() {
		return eduLevel;
	}
	public void setEduLevel(String eduLevel) {
		this.eduLevel = eduLevel;
	}
	public String getAcaDegree() {
		return acaDegree;
	}
	public void setAcaDegree(String acaDegree) {
		this.acaDegree = acaDegree;
	}
	public String getEduInfoUpDate() {
		return eduInfoUpDate;
	}
	public void setEduInfoUpDate(String eduInfoUpDate) {
		this.eduInfoUpDate = eduInfoUpDate;
	}
	public String getPadEduInfSgmtId() {
		return padEduInfSgmtId;
	}
	public void setPadEduInfSgmtId(String padEduInfSgmtId) {
		this.padEduInfSgmtId = padEduInfSgmtId;
	}
	public String getPaaBsSgmtId() {
		return paaBsSgmtId;
	}
	public void setPaaBsSgmtId(String paaBsSgmtId) {
		this.paaBsSgmtId = paaBsSgmtId;
	}
	public String getRptDate() {
		return rptDate;
	}
	public void setRptDate(String rptDate) {
		this.rptDate = rptDate;
	}
	
	
}
