package com.dcits.supervise.pecr.indv.entity;

import java.io.Serializable;

/**
 * 个人基本信息记录其他标识段
 * @author munan
 *
 */
public class PecrIndvIdSgmt implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 主键
	 */
	private String pabIdSgmtId;
		
	/**
	 * 信息更新日期
	 */
	private String idInfoUpDate;
	/**
	 * 外建
	 */
	private String paaBsSgmtId;
	/**
	 * 姓名
	 */
	private String alias;       
	/**
	 * 证件类型
	 */
	private String othIdType;   
	/**
	 * 证件号码
	 */
	private String othIdNum;
	/**
	 * 信息报告日期
	 */
	private String rptDate;
	
	public String getIdInfoUpDate() {
		return idInfoUpDate;
	}
	public void setIdInfoUpDate(String idInfoUpDate) {
		this.idInfoUpDate = idInfoUpDate;
	}
	public String getAlias() {
		return alias;
	}
	public void setAlias(String alias) {
		this.alias = alias;
	}
	public String getOthIdType() {
		return othIdType;
	}
	public void setOthIdType(String othIdType) {
		this.othIdType = othIdType;
	}
	public String getOthIdNum() {
		return othIdNum;
	}
	public void setOthIdNum(String othIdNum) {
		this.othIdNum = othIdNum;
	}
	public String getPabIdSgmtId() {
		return pabIdSgmtId;
	}
	public void setPabIdSgmtId(String pabIdSgmtId) {
		this.pabIdSgmtId = pabIdSgmtId;
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
