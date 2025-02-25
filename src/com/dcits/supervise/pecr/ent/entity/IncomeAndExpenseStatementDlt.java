package com.dcits.supervise.pecr.ent.entity;

import java.io.Serializable;

public class IncomeAndExpenseStatementDlt implements Serializable {
	
	private static final long serialVersionUID = -2354852272222681638L;
	/**
	 * 主键
	 */
	private String   elaIncomeAndExpenseStatId ;
	/**
	 * 信息记录类型
	 */
	private String   infRecType ;
	/**
	 * 企业名称
	 */
	private String   entName ;
	/**
	 * 企业身份标识类型
	 */
	private String   entCertType ;
	/**
	 * 企业身份标识号码
	 */
	private String   entCertNum ;
	/**
	 * 报表年份
	 */
	private String   sheetYear ;
	/**
	 * 报表类型
	 */
	private String   sheetType ;
	/**
	 * 报表类型细分
	 */
	private String   sheetTypeDivide ;
	private String   businessStates ;
	private String   orgCode ;
	public String getBusinessStates() {
		return businessStates;
	}
	public void setBusinessStates(String businessStates) {
		this.businessStates = businessStates;
	}
	public String getOrgCode() {
		return orgCode;
	}
	public void setOrgCode(String orgCode) {
		this.orgCode = orgCode;
	}
	public String getElaIncomeAndExpenseStatId() {
		return elaIncomeAndExpenseStatId;
	}
	public void setElaIncomeAndExpenseStatId(String elaIncomeAndExpenseStatId) {
		this.elaIncomeAndExpenseStatId = elaIncomeAndExpenseStatId;
	}
	public String getInfRecType() {
		return infRecType;
	}
	public void setInfRecType(String infRecType) {
		this.infRecType = infRecType;
	}
	public String getEntName() {
		return entName;
	}
	public void setEntName(String entName) {
		this.entName = entName;
	}
	public String getEntCertType() {
		return entCertType;
	}
	public void setEntCertType(String entCertType) {
		this.entCertType = entCertType;
	}
	public String getEntCertNum() {
		return entCertNum;
	}
	public void setEntCertNum(String entCertNum) {
		this.entCertNum = entCertNum;
	}
	public String getSheetYear() {
		return sheetYear;
	}
	public void setSheetYear(String sheetYear) {
		this.sheetYear = sheetYear;
	}
	public String getSheetType() {
		return sheetType;
	}
	public void setSheetType(String sheetType) {
		this.sheetType = sheetType;
	}
	public String getSheetTypeDivide() {
		return sheetTypeDivide;
	}
	public void setSheetTypeDivide(String sheetTypeDivide) {
		this.sheetTypeDivide = sheetTypeDivide;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
