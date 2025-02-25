package com.dcits.supervise.pecr.indv.entity;

import java.io.Serializable;

/**
 * 个人基本信息记录收入信息段
 * @author munan
 *
 */
public class PecrIndvIncInfSgmt implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 主键
	 */
	private String paiIncInfSgmtId;
	/**
	 * 外建
	 */
	private String paaBsSgmtId;
	/**
	 * 自报年收入
	 */
	private String annlInc;
	/**
	 * 纳税年收入
	 */
	private String taxIncome;
	/**
	 * 信息更新日期
	 */
	private String incInfoUpDate;
	/**
	 * 报送日期
	 */
	private String rptDate;
	public String getAnnlInc() {
		return annlInc;
	}
	public void setAnnlInc(String annlInc) {
		this.annlInc = annlInc;
	}
	public String getTaxIncome() {
		return taxIncome;
	}
	public void setTaxIncome(String taxIncome) {
		this.taxIncome = taxIncome;
	}
	public String getIncInfoUpDate() {
		return incInfoUpDate;
	}
	public void setIncInfoUpDate(String incInfoUpDate) {
		this.incInfoUpDate = incInfoUpDate;
	}
	public String getPaiIncInfSgmtId() {
		return paiIncInfSgmtId;
	}
	public void setPaiIncInfSgmtId(String paiIncInfSgmtId) {
		this.paiIncInfSgmtId = paiIncInfSgmtId;
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
