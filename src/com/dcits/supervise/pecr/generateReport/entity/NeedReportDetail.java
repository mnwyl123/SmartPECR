package com.dcits.supervise.pecr.generateReport.entity;

import java.io.Serializable;
import java.util.List;

/**
 * 生成报文传参对象
 * @author munan
 *
 */
public class NeedReportDetail implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5627805671313220477L;
	/**
	 * 所需生成报文类型
	 */
	private String infRecType;
	/**
	 * 范围开始时间
	 */
	private List<String> rptDate;
	/**
	 * 所属法人编码
	 */
	private List<String> company;
	
	/**
	 * 特殊报文对象
	 */
	private List<String> specialObj;
	
	/**
	 * 数据状态
	 */
	private String businessState;
	
	/**
	 * 数据状态
	 */
	private int rownum;
	
	
	 
	
	
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	public  NeedReportDetail(String infRecType, List<String> rptDate,List<String> company,List<String> specialObj){
		this.infRecType=infRecType;
		this.rptDate=rptDate;
		this.company=company;
		this.specialObj=specialObj;
	}
	public List<String> getCompany() {
		return company;
	}
	public void setCompany(List<String> company) {
		this.company = company;
	}
	public String getInfRecType() {
		return infRecType;
	}

	public void setInfRecType(String infRecType) {
		this.infRecType = infRecType;
	}
	public List<String> getRptDate() {
		return rptDate;
	}
	public void setRptDate(List<String> rptDate) {
		this.rptDate = rptDate;
	}
	public List<String> getSpecialObj() {
		return specialObj;
	}
	public void setSpecialObj(List<String> specialObj) {
		this.specialObj = specialObj;
	}
	public String getBusinessState() {
		return businessState;
	}
	public void setBusinessState(String businessState) {
		this.businessState = businessState;
	}
	
	
}
