package com.dcits.supervise.pecr.common.entity;

import java.io.Serializable;

/**
 * 系统上报码值    数据字典
 * @author 穆楠
 *
 */
public class SystemCodeTypeValue implements Serializable {
	
	private static final long serialVersionUID = -6557935629208779751L;
	/**
	 * 主键
	 */
	private String systemCodeValueId;
	/**
	 * 外键
	 */
	private String systemCodeTypeId;
	/**
	 * 系统代码
	 */
	private String systemCode;
	/**
	 * 系统代码名称
	 */
	private String systemCodeName;
	/**
	 * 上级分类主键
	 */
	private String uperId;	
	/*private String uperId;*/
	public String getSystemCodeValueId() {
		return systemCodeValueId;
	}
	public void setSystemCodeValueId(String systemCodeValueId) {
		this.systemCodeValueId = systemCodeValueId;
	}
	public String getSystemCodeTypeId() {
		return systemCodeTypeId;
	}
	public void setSystemCodeTypeId(String systemCodeTypeId) {
		this.systemCodeTypeId = systemCodeTypeId;
	}
	public String getSystemCode() {
		return systemCode;
	}
	public void setSystemCode(String systemCode) {
		this.systemCode = systemCode;
	}
	public String getSystemCodeName() {
		return systemCodeName;
	}
	public void setSystemCodeName(String systemCodeName) {
		this.systemCodeName = systemCodeName;
	}
	public String getUperId() {
		return uperId;
	}
	public void setUperId(String uperId) {
		this.uperId = uperId;
	}
	
}
