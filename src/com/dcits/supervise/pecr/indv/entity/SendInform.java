package com.dcits.supervise.pecr.indv.entity;

public class SendInform {
	private String reportFileName;
	private String dueDate;
	private String loanKey;
	private String indentType;
	private String indentNum;
	private String clientName;
	private String mobileTel;
	private int delinquencyTerm;
	private int delinquencyTermAmt;
	private String globalSerialNo;

	public String getIndentType() {
		return indentType;
	}
	public void setIndentType(String indentType) {
		this.indentType = indentType;
	}

	public String getReportFileName() {
		return reportFileName;
	}
	public void setReportFileName(String reportFileName) {
		this.reportFileName = reportFileName;
	}
	
	public String getDueDate() {
		return dueDate;
	}
	public void setDueDate(String dueDate) {
		this.dueDate = dueDate;
	}
	public String getLoanKey() {
		return loanKey;
	}
	public void setLoanKey(String loanKey) {
		this.loanKey = loanKey;
	}
	public String getIndentNum() {
		return indentNum;
	}
	public void setIndentNum(String indentNum) {
		this.indentNum = indentNum;
	}
	public String getClientName() {
		return clientName;
	}
	public void setClientName(String clientName) {
		this.clientName = clientName;
	}
	public String getMobileTel() {
		return mobileTel;
	}
	public void setMobileTel(String mobileTel) {
		this.mobileTel = mobileTel;
	}

	public int getDelinquencyTerm() {
		return delinquencyTerm;
	}
	public void setDelinquencyTerm(int delinquencyTerm) {
		this.delinquencyTerm = delinquencyTerm;
	}
	public int getDelinquencyTermAmt() {
		return delinquencyTermAmt;
	}
	public void setDelinquencyTermAmt(int delinquencyTermAmt) {
		this.delinquencyTermAmt = delinquencyTermAmt;
	}
	public String getGlobalSerialNo() {
		return globalSerialNo;
	}
	public void setGlobalSerialNo(String globalSerialNo) {
		this.globalSerialNo = globalSerialNo;
	}
	
	
}
