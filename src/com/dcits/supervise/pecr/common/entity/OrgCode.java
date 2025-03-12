package com.dcits.supervise.pecr.common.entity;

import java.io.Serializable;

/**
 * 机构
 * @author 穆楠
 *
 */
public class OrgCode implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 8947058758470703708L;
	/**
	 * 机构编码
	 */
	private String orgCode;
	/**
	 * 机构名称
	 */
	private String orgName;
	
	/**
	 * 行内机构编码对应的征信中心14位机构编码
	 */
	private String orgFourteenCode;
	
	public String getOrgFourteenCode() {
		return orgFourteenCode;
	}

	public void setOrgFourteenCode(String orgFourteenCode) {
		this.orgFourteenCode = orgFourteenCode;
	}

	public String getOrgCode() {
		return orgCode;
	}
	
	public void setOrgCode(String orgCode) {
		this.orgCode = orgCode;
	}
	
	public String getOrgName() {
		return orgName;
	}
	
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
}
