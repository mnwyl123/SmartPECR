package com.dcits.supervise.pecr.common.entity;

import java.io.Serializable;

/**
 * 系统状态码值
 * @author leizx
 *
 */
public class SystemStateValue implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 3500829854857768522L;
	
	/**
	 * 主键
	 */
	private String systemStateValueId;
	
	/**
	 * 外键
	 */
	private String systemStateTypeId;
	
	/**
	 * 系统状态码值
	 */
	private String systemStateValue;
	
	/**
	 * 系统状态码值名称
	 */
	private String systemStateName;

	public String getSystemStateValueId() {
		return systemStateValueId;
	}

	public void setSystemStateValueId(String systemStateValueId) {
		this.systemStateValueId = systemStateValueId;
	}

	public String getSystemStateTypeId() {
		return systemStateTypeId;
	}

	public void setSystemStateTypeId(String systemStateTypeId) {
		this.systemStateTypeId = systemStateTypeId;
	}

	public String getSystemStateValue() {
		return systemStateValue;
	}

	public void setSystemStateValue(String systemStateValue) {
		this.systemStateValue = systemStateValue;
	}

	public String getSystemStateName() {
		return systemStateName;
	}

	public void setSystemStateName(String systemStateName) {
		this.systemStateName = systemStateName;
	}
}
