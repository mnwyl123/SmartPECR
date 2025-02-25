package com.dcits.supervise.pecr.generateReport.entity;

import java.io.Serializable;

public class IndvBsSgmtReportEntity implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 4679472168171365311L;
	//个人基本信息基础段
	/**
	 * 主键
	 */
	private String paaBsSmgtId;
	/***
	 * 信息记录类型
	 */
	private String InfRecType;
	/**
	 * 姓名
	 */
	private String Name;
	/**
	 * 机构号
	 */
	private String orgCode;
	/**
	 * 证件类型
	 */
	private String IDType;
	/**
	 * 证件号码
	 */
	private String IDNum;
	/**
	 * 信息来源编码
	 */
	private String InfSurcCode;
	/**
	 * 信息报告日期
	 */
	private String RptDate;
	/**
	 * 报告时点说明代码
	 */
	private String RptDateCode;
	/**
	 * 客户资料维护机构代码
	 */
	private String Cimoc;
	/**
	 * 客户资料类型
	 */
	private String CustomerType; 
	//个人基本信息教育段
	/**
	 * 学历
	 */
	private String EduLevel;     
	/**
	 * 学位
	 */
	private String AcaDegree;    
	/**
	 * 信息更新日期
	 */
	private String EduInfoUpDate;
	
	//个人基本信息记录基本概况信息段
	/**
	 * 性别
	 */
	private String Sex;     
	/**
	 * 出生日期
	 */
	private String DOB;     
	/**
	 * 国籍
	 */
	private String Nation;   
	/**
	 * 户籍地址
	 */
	private String HouseAdd;   
	/**
	 * 户籍所在地行政区划
	 */
	private String HhDist;      
	/**
	 * 手机号码
	 */
	private String CellPhone;    
	/**
	 * 电子邮箱
	 */
	private String Email;        
	/**
	 * 信息更新日期
	 */
	private String FcsInfoUpDate;
	
	//个人基本信息记录收入信息段
	/**
	 * 自报年收入
	 */
	private String AnnlInc;
	/**
	 * 纳税年收入
	 */
	private String TaxIncome;
	/**
	 * 信息更新日期
	 */
	private String IncInfoUpDate;
	// 个人基本信息记录通讯地址段
	/**
	 * 通讯地址
	 */
	private String MailAddr;
	/**
	 * 通讯地邮编
	 */
	private String MailPc;
	/**
	 * 通讯地行政区划
	 */
	private String MailDist;
	/**
	 * 信息更新日期
	 */
	private String MlgInfoUpDate;
	
	//个人基本信息记录职业信息段
	
	/**
	 * 就业状况
	 */
	private String EmpStatus;
	/**
	 * 单位名称
	 */
	private String CpnName;
	/**
	 * 单位性质
	 */
	private String CpnType;
	/**
	 * 单位所属行业
	 */
	private String Industry;
	/**
	 * 单位详细地址
	 */
	private String CpnAddr;
	/**
	 * 单位所在地邮编
	 */
	private String CpnPc;
	/**
	 * 单位所在地行政区划
	 */
	private String CpnDist;
	/**
	 * 单位电话
	 */
	private String CpnTEL;
	/**
	 * 职业
	 */
	private String Occupation;
	/**
	 * 职务
	 */
	private String Title;
	/**
	 * 职称
	 */
	private String TechTitle;
	/**
	 * 本单位工作起始年份
	 */
	private String WorkStartDate;
	/**
	 * 信息更新日期
	 */
	private String OctpnInfoUpDate;
	//个人基本信息记录居住地址段
	/**
	 * 居住状况
	 */
	private String ResiStatus;
	/**
	 * 居住地详细地址
	 */
	private String ResiAddr;
	/**
	 * 居住地邮编
	 */
	private String ResiPc;
	/**
	 * 居住地行政区划
	 */
	private String ResiDist;
	/**
	 * 住宅电话
	 */
	private String HomeTel;
	/**
	 * 信息更新日期
	 */
	private String ResiInfoUpDate;
	//个人基本信息记录婚姻信息段
	/**
	 * 婚姻状况
	 */
	private String MariStatus;   
	/**
	 * 配偶姓名
	 */
	private String SpoName;     
	/**
	 * 配偶证件类型
	 */
	private String SpoIDType;    
	/**
	 * 配偶证件号码
	 */
	private String SpoIDNum;     
	/**
	 * 配偶联系电话
	 */
	private String SpoTel;       
	/**
	 * 配偶工作单位
	 */
	private String SpsCmpyNm;    
	/**
	 * 信息更新日期
	 */
	private String SpsInfoUpDate;
	public String getPaaBsSmgtId() {
		return paaBsSmgtId;
	}
	public void setPaaBsSmgtId(String paaBsSmgtId) {
		this.paaBsSmgtId = paaBsSmgtId;
	}
	public String getInfRecType() {
		return InfRecType;
	}
	public void setInfRecType(String infRecType) {
		InfRecType = infRecType;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	
	public String getIDType() {
		return IDType;
	}
	public void setIDType(String iDType) {
		IDType = iDType;
	}
	public String getIDNum() {
		return IDNum;
	}
	public void setIDNum(String iDNum) {
		IDNum = iDNum;
	}
	public String getInfSurcCode() {
		return InfSurcCode;
	}
	public void setInfSurcCode(String infSurcCode) {
		InfSurcCode = infSurcCode;
	}
	public String getRptDate() {
		return RptDate;
	}
	public void setRptDate(String rptDate) {
		RptDate = rptDate;
	}
	public String getRptDateCode() {
		return RptDateCode;
	}
	public void setRptDateCode(String rptDateCode) {
		RptDateCode = rptDateCode;
	}
	public String getCimoc() {
		return Cimoc;
	}
	public void setCimoc(String cimoc) {
		Cimoc = cimoc;
	}
	public String getCustomerType() {
		return CustomerType;
	}
	public void setCustomerType(String customerType) {
		CustomerType = customerType;
	}
	public String getEduLevel() {
		return EduLevel;
	}
	public void setEduLevel(String eduLevel) {
		EduLevel = eduLevel;
	}
	public String getAcaDegree() {
		return AcaDegree;
	}
	public void setAcaDegree(String acaDegree) {
		AcaDegree = acaDegree;
	}
	public String getEduInfoUpDate() {
		return EduInfoUpDate;
	}
	public void setEduInfoUpDate(String eduInfoUpDate) {
		EduInfoUpDate = eduInfoUpDate;
	}
	public String getSex() {
		return Sex;
	}
	public void setSex(String sex) {
		Sex = sex;
	}
	public String getDOB() {
		return DOB;
	}
	public void setDOB(String dOB) {
		DOB = dOB;
	}
	public String getNation() {
		return Nation;
	}
	public void setNation(String nation) {
		Nation = nation;
	}
	public String getHouseAdd() {
		return HouseAdd;
	}
	public void setHouseAdd(String houseAdd) {
		HouseAdd = houseAdd;
	}
	public String getHhDist() {
		return HhDist;
	}
	public void setHhDist(String hhDist) {
		HhDist = hhDist;
	}
	public String getCellPhone() {
		return CellPhone;
	}
	public void setCellPhone(String cellPhone) {
		CellPhone = cellPhone;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getFcsInfoUpDate() {
		return FcsInfoUpDate;
	}
	public void setFcsInfoUpDate(String fcsInfoUpDate) {
		FcsInfoUpDate = fcsInfoUpDate;
	}
	public String getAnnlInc() {
		return AnnlInc;
	}
	public void setAnnlInc(String annlInc) {
		AnnlInc = annlInc;
	}
	public String getTaxIncome() {
		return TaxIncome;
	}
	public void setTaxIncome(String taxIncome) {
		TaxIncome = taxIncome;
	}
	public String getIncInfoUpDate() {
		return IncInfoUpDate;
	}
	public void setIncInfoUpDate(String incInfoUpDate) {
		IncInfoUpDate = incInfoUpDate;
	}
	public String getMailAddr() {
		return MailAddr;
	}
	public void setMailAddr(String mailAddr) {
		MailAddr = mailAddr;
	}
	public String getMailPc() {
		return MailPc;
	}
	public void setMailPc(String mailPc) {
		MailPc = mailPc;
	}
	public String getMailDist() {
		return MailDist;
	}
	public void setMailDist(String mailDist) {
		MailDist = mailDist;
	}
	public String getMlgInfoUpDate() {
		return MlgInfoUpDate;
	}
	public void setMlgInfoUpDate(String mlgInfoUpDate) {
		MlgInfoUpDate = mlgInfoUpDate;
	}
	public String getEmpStatus() {
		return EmpStatus;
	}
	public void setEmpStatus(String empStatus) {
		EmpStatus = empStatus;
	}
	public String getCpnName() {
		return CpnName;
	}
	public void setCpnName(String cpnName) {
		CpnName = cpnName;
	}
	public String getCpnType() {
		return CpnType;
	}
	public void setCpnType(String cpnType) {
		CpnType = cpnType;
	}
	public String getIndustry() {
		return Industry;
	}
	public void setIndustry(String industry) {
		Industry = industry;
	}
	public String getCpnAddr() {
		return CpnAddr;
	}
	public void setCpnAddr(String cpnAddr) {
		CpnAddr = cpnAddr;
	}
	public String getCpnPc() {
		return CpnPc;
	}
	public void setCpnPc(String cpnPc) {
		CpnPc = cpnPc;
	}
	public String getCpnDist() {
		return CpnDist;
	}
	public void setCpnDist(String cpnDist) {
		CpnDist = cpnDist;
	}
	public String getCpnTEL() {
		return CpnTEL;
	}
	public void setCpnTEL(String cpnTEL) {
		CpnTEL = cpnTEL;
	}
	public String getOccupation() {
		return Occupation;
	}
	public void setOccupation(String occupation) {
		Occupation = occupation;
	}
	public String getTitle() {
		return Title;
	}
	public void setTitle(String title) {
		Title = title;
	}
	public String getTechTitle() {
		return TechTitle;
	}
	public void setTechTitle(String techTitle) {
		TechTitle = techTitle;
	}
	public String getWorkStartDate() {
		return WorkStartDate;
	}
	public void setWorkStartDate(String workStartDate) {
		WorkStartDate = workStartDate;
	}
	public String getOctpnInfoUpDate() {
		return OctpnInfoUpDate;
	}
	public void setOctpnInfoUpDate(String octpnInfoUpDate) {
		OctpnInfoUpDate = octpnInfoUpDate;
	}
	public String getResiStatus() {
		return ResiStatus;
	}
	public void setResiStatus(String resiStatus) {
		ResiStatus = resiStatus;
	}
	public String getResiAddr() {
		return ResiAddr;
	}
	public void setResiAddr(String resiAddr) {
		ResiAddr = resiAddr;
	}
	public String getResiPc() {
		return ResiPc;
	}
	public void setResiPc(String resiPc) {
		ResiPc = resiPc;
	}
	public String getResiDist() {
		return ResiDist;
	}
	public void setResiDist(String resiDist) {
		ResiDist = resiDist;
	}
	public String getHomeTel() {
		return HomeTel;
	}
	public void setHomeTel(String homeTel) {
		HomeTel = homeTel;
	}
	public String getResiInfoUpDate() {
		return ResiInfoUpDate;
	}
	public void setResiInfoUpDate(String resiInfoUpDate) {
		ResiInfoUpDate = resiInfoUpDate;
	}
	public String getMariStatus() {
		return MariStatus;
	}
	public void setMariStatus(String mariStatus) {
		MariStatus = mariStatus;
	}
	public String getSpoName() {
		return SpoName;
	}
	public void setSpoName(String spoName) {
		SpoName = spoName;
	}
	public String getSpoIDType() {
		return SpoIDType;
	}
	public void setSpoIDType(String spoIDType) {
		SpoIDType = spoIDType;
	}
	public String getSpoIDNum() {
		return SpoIDNum;
	}
	public void setSpoIDNum(String spoIDNum) {
		SpoIDNum = spoIDNum;
	}
	public String getSpoTel() {
		return SpoTel;
	}
	public void setSpoTel(String spoTel) {
		SpoTel = spoTel;
	}
	public String getSpsCmpyNm() {
		return SpsCmpyNm;
	}
	public void setSpsCmpyNm(String spsCmpyNm) {
		SpsCmpyNm = spsCmpyNm;
	}
	public String getSpsInfoUpDate() {
		return SpsInfoUpDate;
	}
	public void setSpsInfoUpDate(String spsInfoUpDate) {
		SpsInfoUpDate = spsInfoUpDate;
	}
	public String getOrgCode() {
		return orgCode;
	}
	public void setOrgCode(String orgCode) {
		this.orgCode = orgCode;
	}
	
	
}
