package com.dcits.supervise.pecr.log.entity;

public class OperationLog {
	private String id;
	private String operationName;
	private String ip;
	private String createTime;
	private String action;
	private String description;
	private String result;
	private String sysOrgCode;
	private String sysOrgName;
	private String legalPersonId;
	private String legalPersonName;
	private String browser;
	
	
	public OperationLog() {
		super();
	}
	
	public OperationLog(String id, String operationName, String ip, String createTime, String action,
			String description, String result, String sysOrgCode, String sysOrgName, String legalPersonId,
			String legalPersonName, String browser) {
		super();
		this.id = id;
		this.operationName = operationName;
		this.ip = ip;
		this.createTime = createTime;
		this.action = action;
		this.description = description;
		this.result = result;
		this.sysOrgCode = sysOrgCode;
		this.sysOrgName = sysOrgName;
		this.legalPersonId = legalPersonId;
		this.legalPersonName = legalPersonName;
		this.browser = browser;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getOperationName() {
		return operationName;
	}
	public void setOperationName(String operationName) {
		this.operationName = operationName;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getSysOrgCode() {
		return sysOrgCode;
	}
	public void setSysOrgCode(String sysOrgCode) {
		this.sysOrgCode = sysOrgCode;
	}
	public String getSysOrgName() {
		return sysOrgName;
	}
	public void setSysOrgName(String sysOrgName) {
		this.sysOrgName = sysOrgName;
	}
	public String getLegalPersonId() {
		return legalPersonId;
	}
	public void setLegalPersonId(String legalPersonId) {
		this.legalPersonId = legalPersonId;
	}
	public String getLegalPersonName() {
		return legalPersonName;
	}
	public void setLegalPersonName(String legalPersonName) {
		this.legalPersonName = legalPersonName;
	}
	public String getBrowser() {
		return browser;
	}
	public void setBrowser(String browser) {
		this.browser = browser;
	}
	
	

	

}
