package com.dcits.supervise.pecr.feedbackreport.entity;

public class ConditionColumAndValue {

	/**
	 * 字段名
	 */
	private String colum;
	/**
	 * 值
	 */
	private String value;

	public ConditionColumAndValue(String colum, String value) {
		this.colum = colum;
		this.value = value;
	}

	public String getColum() {
		return colum;
	}

	public void setColum(String colum) {
		this.colum = colum;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

}
