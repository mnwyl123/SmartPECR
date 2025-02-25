package com.dcits.supervise.pecr.generateReport.entity;

import java.io.Serializable;

public class SerialNumberEntity implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1500864687808029310L;

	/**
	 * 主键ID
	 */
	private String id;
	
	/**
	 * 流水号值
	 */
	private String serial_number;
	
	/**
	 * 抽取日期
	 */
	private String extractDate;
	//信息记录类型
	private String infRecType;
	

	public String getInfRecType() {
		return infRecType;
	}

	public void setInfRecType(String infRecType) {
		this.infRecType = infRecType;
	}

	public String getExtractDate() {
		return extractDate;
	}

	public void setExtractDate(String extractDate) {
		this.extractDate = extractDate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSerial_number() {
		return serial_number;
	}

	public void setSerial_number(String serial_number) {
		this.serial_number = serial_number;
	}
	
	
}
