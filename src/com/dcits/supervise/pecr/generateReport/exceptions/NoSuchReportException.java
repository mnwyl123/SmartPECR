package com.dcits.supervise.pecr.generateReport.exceptions;

public class NoSuchReportException extends Exception{

	/**
	 * 
	 */
	private static final long serialVersionUID = 2835599817252648650L;
	
	private String infRecType;
	public NoSuchReportException(String infRecType){
		super("NoSuchReportException");
		this.infRecType=infRecType;
	}
	
	public String toString(){
		return String.format("未找到%s对应的报文生成类", infRecType);
	}
}
