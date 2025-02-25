package com.dcits.supervise.pecr.indv.entity;

import java.io.Serializable;
/**
    * 按段删除整笔删除实体类
 * @author wangyanaaa
 *
 */
public class inDel implements Serializable{
private static final long serialVersionUID = 1L;
	
	private String	pbyInAcctDelId;                                                                                                                                 
	private String	infRecType;                                                                                                                                      
	private String	acctType;                                                                                                                                            
	private String	delRecCode;                                                                                                                                    
	private String	delSgmtCode;  
	private String	delStartDate;
	private String	delEndDate;
	private String	lastUpdateTime;                                                                                                                              
	private String	operatorUser;                                                                                                                                             
	private String	orgName;                                                                                                                                  
	private String	orgCode;                                                                                                                                  
	private String	businessStates;                                                                                                                                        
	private String	rejectReason;                                                                                                                                           
	private String	isFilter;                                                                                                        
	private String	reportMessageId;                                                                                                                  
	private String	rptDate;                                                                                                                              
	private String	name;                                  
	private String	idType;                     
	private String	idNum;
	private String	pk;
	private String infSurcCode;
	private String flag;
	private String sheetYear;
    private String sheetType;
    private String sheetTypeDivide;
	
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
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getInfSurcCode() {
		return infSurcCode;
	}
	public void setInfSurcCode(String infSurcCode) {
		this.infSurcCode = infSurcCode;
	}
	public String getPk() {
		return pk;
	}
	public void setPk(String pk) {
		this.pk = pk;
	}
	public String getPbyInAcctDelId() {
		return pbyInAcctDelId;
	}
	public void setPbyInAcctDelId(String pbyInAcctDelId) {
		this.pbyInAcctDelId = pbyInAcctDelId;
	}
	public String getInfRecType() {
		return infRecType;
	}
	public void setInfRecType(String infRecType) {
		this.infRecType = infRecType;
	}
	public String getAcctType() {
		return acctType;
	}
	public void setAcctType(String acctType) {
		this.acctType = acctType;
	}
	public String getDelRecCode() {
		return delRecCode;
	}
	public void setDelRecCode(String delRecCode) {
		this.delRecCode = delRecCode;
	}
	public String getDelSgmtCode() {
		return delSgmtCode;
	}
	public void setDelSgmtCode(String delSgmtCode) {
		this.delSgmtCode = delSgmtCode;
	}
	public String getDelStartDate() {
		return delStartDate;
	}
	public void setDelStartDate(String delStartDate) {
		this.delStartDate = delStartDate;
	}
	public String getDelEndDate() {
		return delEndDate;
	}
	public void setDelEndDate(String delEndDate) {
		this.delEndDate = delEndDate;
	}
	public String getLastUpdateTime() {
		return lastUpdateTime;
	}
	public void setLastUpdateTime(String lastUpdateTime) {
		this.lastUpdateTime = lastUpdateTime;
	}
	public String getOperatorUser() {
		return operatorUser;
	}
	public void setOperatorUser(String operatorUser) {
		this.operatorUser = operatorUser;
	}
	public String getOrgName() {
		return orgName;
	}
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
	public String getOrgCode() {
		return orgCode;
	}
	public void setOrgCode(String orgCode) {
		this.orgCode = orgCode;
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
	public String getIsFilter() {
		return isFilter;
	}
	public void setIsFilter(String isFilter) {
		this.isFilter = isFilter;
	}
	public String getReportMessageId() {
		return reportMessageId;
	}
	public void setReportMessageId(String reportMessageId) {
		this.reportMessageId = reportMessageId;
	}
	public String getRptDate() {
		return rptDate;
	}
	public void setRptDate(String rptDate) {
		this.rptDate = rptDate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIdType() {
		return idType;
	}
	public void setIdType(String idType) {
		this.idType = idType;
	}
	public String getIdNum() {
		return idNum;
	}
	public void setIdNum(String idNum) {
		this.idNum = idNum;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	

}
