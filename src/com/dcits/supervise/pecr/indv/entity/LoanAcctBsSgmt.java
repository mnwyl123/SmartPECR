package com.dcits.supervise.pecr.indv.entity;

import java.io.Serializable;

/**
 * 个人借贷账户信息记录基础段
 * @author 穆楠
 *
 */
public class LoanAcctBsSgmt implements Serializable {
	
	private static final long serialVersionUID = -2354852272222681638L;
	/**
	 * 主键
	 */
	private String pbaAcctBsSgmtId;
	/**
	 * 账户类型
	 */
	private String acctType;
	/**
	 * 账户标识码
	 */
	private String acctCode;
	/**
	 * 信息报告日期
	 */
	private String rptDate;
	/**
	 * 报告时点说明代码
	 */
	private String rptDateCode;
	/**
	 * 借款人姓名
	 */
	private String name;
	/**
	 * 借款人证件类型
	 */
	private String idType;
	/**
	 * 借款人证件号码
	 */
	private String idNum;
	/**
	 * 业务管理机构代码     
	 */
	private String mngmtOrgCode;
	/**
	 * 数据状态
	 */
	private String businessStates;
	/**
	 * 驳回原因
	 */
	private String rejectReason;
	private String reportMessageId;
	private String flag;
	private String mdfcSgmtCode;
	
	private String month;
	
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getReportMessageId() {
		return reportMessageId;
	}
	public void setReportMessageId(String reportMessageId) {
		this.reportMessageId = reportMessageId;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getPbaAcctBsSgmtId() {
		return pbaAcctBsSgmtId;
	}
	public void setPbaAcctBsSgmtId(String pbaAcctBsSgmtId) {
		this.pbaAcctBsSgmtId = pbaAcctBsSgmtId;
	}
	public String getAcctType() {
		return acctType;
	}
	public void setAcctType(String acctType) {
		this.acctType = acctType;
	}
	public String getAcctCode() {
		return acctCode;
	}
	public void setAcctCode(String acctCode) {
		this.acctCode = acctCode;
	}
	public String getRptDate() {
		return rptDate;
	}
	public void setRptDate(String rptDate) {
		this.rptDate = rptDate;
	}
	public String getRptDateCode() {
		return rptDateCode;
	}
	public void setRptDateCode(String rptDateCode) {
		this.rptDateCode = rptDateCode;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIdType() {
		return idType;
	}
	public void setIdType(String idType) {
		this.idType = idType;
	}
	public String getIdNum() {
		return idNum;
	}
	public void setIdNum(String idNum) {
		this.idNum = idNum;
	}
	public String getMngmtOrgCode() {
		return mngmtOrgCode;
	}
	public void setMngmtOrgCode(String mngmtOrgCode) {
		this.mngmtOrgCode = mngmtOrgCode;
	}
	public String getBusinessStates() {
		return businessStates;
	}
	public void setBusinessStates(String businessStates) {
		this.businessStates = businessStates;
	}
	public String getRejectReason() {
		return rejectReason;
	}
	public void setRejectReason(String rejectReason) {
		this.rejectReason = rejectReason;
	}
	public String getMdfcSgmtCode() {
		return mdfcSgmtCode;
	}
	public void setMdfcSgmtCode(String mdfcSgmtCode) {
		this.mdfcSgmtCode = mdfcSgmtCode;
	}
	
}
