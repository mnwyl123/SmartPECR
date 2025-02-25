package com.dcits.supervise.pecr.indv.entity;

import java.io.Serializable;
/**
 * 个人基本信息记录居住地址段
 * @author munan
 *
 */
public class PecrIndvRedncInfSgmt implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 主键
	 */
	private String pafRedncInfSgmtId;
	/**
	 * 居住状况
	 */
	private String resiStatus;
	/**
	 * 居住地详细地址
	 */
	private String resiAddr;
	/**
	 * 居住地邮编
	 */
	private String resiPc;
	/**
	 * 居住地行政区划
	 */
	private String resiDist;
	/**
	 * 住宅电话
	 */
	private String homeTel;
	/**
	 * 信息更新日期
	 */
	private String resiInfoUpDate;
	/**
	 * 报送日期
	 */
	private String rptDate;
	/**
	 * 外建
	 */
	private String paaBsSgmtId;
	public String getResiStatus() {
		return resiStatus;
	}
	public void setResiStatus(String resiStatus) {
		this.resiStatus = resiStatus;
	}
	public String getResiAddr() {
		return resiAddr;
	}
	public void setResiAddr(String resiAddr) {
		this.resiAddr = resiAddr;
	}
	public String getResiPc() {
		return resiPc;
	}
	public void setResiPc(String resiPc) {
		this.resiPc = resiPc;
	}
	public String getResiDist() {
		return resiDist;
	}
	public void setResiDist(String resiDist) {
		this.resiDist = resiDist;
	}
	public String getHomeTel() {
		return homeTel;
	}
	public void setHomeTel(String homeTel) {
		this.homeTel = homeTel;
	}
	public String getResiInfoUpDate() {
		return resiInfoUpDate;
	}
	public void setResiInfoUpDate(String resiInfoUpDate) {
		this.resiInfoUpDate = resiInfoUpDate;
	}
	public String getPafRedncInfSgmtId() {
		return pafRedncInfSgmtId;
	}
	public void setPafRedncInfSgmtId(String pafRedncInfSgmtId) {
		this.pafRedncInfSgmtId = pafRedncInfSgmtId;
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
