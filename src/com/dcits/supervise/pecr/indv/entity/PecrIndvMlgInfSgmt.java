package com.dcits.supervise.pecr.indv.entity;

import java.io.Serializable;
	/**
	 * 个人基本信息记录通讯地址段
	 * @author munan
	 *
	 */
public class PecrIndvMlgInfSgmt implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 主键
	 */
	private String pagMlgInfSgmtId;
	/**
	 * 报送日期
	 */
	private String rptDate;
	/**
	 * 通讯地址
	 */
	private String mailAddr;
	/**
	 * 通讯地邮编
	 */
	private String mailPc;
	/**
	 * 通讯地行政区划
	 */
	private String mailDist;
	/**
	 * 信息更新日期
	 */
	private String mlgInfoUpDate;
	/**
	 * 外建
	 */
	private String paaBsSgmtId;
	public String getMailAddr() {
		return mailAddr;
	}
	public void setMailAddr(String mailAddr) {
		this.mailAddr = mailAddr;
	}
	public String getMailPc() {
		return mailPc;
	}
	public void setMailPc(String mailPc) {
		this.mailPc = mailPc;
	}
	public String getMailDist() {
		return mailDist;
	}
	public void setMailDist(String mailDist) {
		this.mailDist = mailDist;
	}
	public String getMlgInfoUpDate() {
		return mlgInfoUpDate;
	}
	public void setMlgInfoUpDate(String mlgInfoUpDate) {
		this.mlgInfoUpDate = mlgInfoUpDate;
	}
	public String getPagMlgInfSgmtId() {
		return pagMlgInfSgmtId;
	}
	public void setPagMlgInfSgmtId(String pagMlgInfSgmtId) {
		this.pagMlgInfSgmtId = pagMlgInfSgmtId;
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
