package com.dcits.supervise.pecr.ent.entity;

import java.io.Serializable;

/**
 * 抵（质）押合同信息   基础段
 * @author 穆楠
 *
 */
public class MotgaCltalCtrctBsSgmt implements Serializable {

	private static final long serialVersionUID = -2469096200750789111L;
	
	/**
	 * 主键
	 */
	private String efaMotgaCltalCtrctBsId ;
	
	/**
	 * 信息记录类型
	 */
	private String infRecType;
	
	/**
	 * 抵（质）押合同标识码
	 */
	private String ccCode;

	/**
	 * 信息报告日期
	 */
	private String rptDate;
	
	/**
	 * 报告时点说明代码
	 */
	private String rptDateCode;
	
	/**
	 * 债务人身份类别
	 */
	private String infoIdType;
	
	/**
	 * 债务人名称
	 */
	private String name;
	
	/**
	 * 借款人证件类型
	 */
	private String certType;
	/**
	 * 借款人证件号码
	 */
	private String certNum;
	
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
	private String flag;
	private String reportMessageId;
	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String getReportMessageId() {
		return reportMessageId;
	}

	public void setReportMessageId(String reportMessageId) {
		this.reportMessageId = reportMessageId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getEfaMotgaCltalCtrctBsId() {
		return efaMotgaCltalCtrctBsId;
	}

	public void setEfaMotgaCltalCtrctBsId(String efaMotgaCltalCtrctBsId) {
		this.efaMotgaCltalCtrctBsId = efaMotgaCltalCtrctBsId;
	}

	public String getInfRecType() {
		return infRecType;
	}

	public void setInfRecType(String infRecType) {
		this.infRecType = infRecType;
	}

	public String getCcCode() {
		return ccCode;
	}

	public void setCcCode(String ccCode) {
		this.ccCode = ccCode;
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

	public String getInfoIdType() {
		return infoIdType;
	}

	public void setInfoIdType(String infoIdType) {
		this.infoIdType = infoIdType;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCertType() {
		return certType;
	}

	public void setCertType(String certType) {
		this.certType = certType;
	}

	public String getCertNum() {
		return certNum;
	}

	public void setCertNum(String certNum) {
		this.certNum = certNum;
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
}
