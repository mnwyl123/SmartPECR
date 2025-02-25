package com.dcits.supervise.pecr.indv.entity;

import java.io.Serializable;
/**
 * 个人基本信息记录婚姻信息段
 * @author munan
 *
 */
public class PecrIndvSpsInfSgmt implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	/**
	 * 主键
	 */
	private String pahSpsInfSgmtId;
	/**
	 * 报送日期
	 */
	private String rptDate;
	/**
	 * 外建
	 */
	private String paaBsSgmtId;
	/**
	 * 婚姻状况
	 */
	private String mariStatus;   
	/**
	 * 配偶姓名
	 */
	private String spoName;     
	/**
	 * 配偶证件类型
	 */
	private String spoIdType;    
	/**
	 * 配偶证件号码
	 */
	private String spoIdNum;     
	/**
	 * 配偶联系电话
	 */
	private String spoTel;       
	/**
	 * 配偶工作单位
	 */
	private String spsCmpyNm;    
	/**
	 * 信息更新日期
	 */
	private String spsInfoUpDate;
	public String getMariStatus() {
		return mariStatus;
	}
	public void setMariStatus(String mariStatus) {
		this.mariStatus = mariStatus;
	}
	public String getSpoName() {
		return spoName;
	}
	public void setSpoName(String spoName) {
		this.spoName = spoName;
	}
	public String getSpoIdType() {
		return spoIdType;
	}
	public void setSpoIdType(String spoIdType) {
		this.spoIdType = spoIdType;
	}
	public String getSpoIdNum() {
		return spoIdNum;
	}
	public void setSpoIdNum(String spoIdNum) {
		this.spoIdNum = spoIdNum;
	}
	public String getSpoTel() {
		return spoTel;
	}
	public void setSpoTel(String spoTel) {
		this.spoTel = spoTel;
	}
	public String getSpsCmpyNm() {
		return spsCmpyNm;
	}
	public void setSpsCmpyNm(String spsCmpyNm) {
		this.spsCmpyNm = spsCmpyNm;
	}
	public String getSpsInfoUpDate() {
		return spsInfoUpDate;
	}
	public void setSpsInfoUpDate(String spsInfoUpDate) {
		this.spsInfoUpDate = spsInfoUpDate;
	}
	public String getPahSpsInfSgmtId() {
		return pahSpsInfSgmtId;
	}
	public void setPahSpsInfSgmtId(String pahSpsInfSgmtId) {
		this.pahSpsInfSgmtId = pahSpsInfSgmtId;
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
