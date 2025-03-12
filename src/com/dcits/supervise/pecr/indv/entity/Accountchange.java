package com.dcits.supervise.pecr.indv.entity;

import java.io.Serializable;

/**
 * 标识变更实体类
 *
 * @author 穆楠
 */
public class Accountchange implements Serializable {
    private static final long serialVersionUID = 1L;

    private String pdwInsecacctidCagsinfId;
    private String pcwInsecacctidCagsinfId;
    private String pbwInsecacctidCagsinfId;
    private String infRecType;
    private String acctType;
    private String odBnesCode;
    private String nwBnesCode;
    private String lastUpdateTime;
    private String operatorUser;
    private String orgName;
    private String orgCode;
    private String businessStates;
    private String rejectReason;
    private String isFilter;
    private String reportMessageId;
    private String rptDate;
    private String name;
    private String idType;
    private String idNum;
    private String clientNumber;
    private String pk;
    private String efwMocId;
    private String infoIdType;
    private String efzMocId;
    private String delRecCode;
    private String flag;
    private String certNum;
    private String certType;
    
    public String getCertNum() {
		return certNum;
	}

	public void setCertNum(String certNum) {
		this.certNum = certNum;
	}

	public String getCertType() {
		return certType;
	}

	public void setCertType(String certType) {
		this.certType = certType;
	}

	public String getPdwInsecacctidCagsinfId() {
        return pdwInsecacctidCagsinfId;
    }

    public void setPdwInsecacctidCagsinfId(String pdwInsecacctidCagsinfId) {
        this.pdwInsecacctidCagsinfId = pdwInsecacctidCagsinfId;
    }

    public String getPcwInsecacctidCagsinfId() {
        return pcwInsecacctidCagsinfId;
    }

    public void setPcwInsecacctidCagsinfId(String pcwInsecacctidCagsinfId) {
        this.pcwInsecacctidCagsinfId = pcwInsecacctidCagsinfId;
    }

    public String getPbwInsecacctidCagsinfId() {
        return pbwInsecacctidCagsinfId;
    }

    public void setPbwInsecacctidCagsinfId(String pbwInsecacctidCagsinfId) {
        this.pbwInsecacctidCagsinfId = pbwInsecacctidCagsinfId;
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

    public String getOdBnesCode() {
        return odBnesCode;
    }

    public void setOdBnesCode(String odBnesCode) {
        this.odBnesCode = odBnesCode;
    }

    public String getNwBnesCode() {
        return nwBnesCode;
    }

    public void setNwBnesCode(String nwBnesCode) {
        this.nwBnesCode = nwBnesCode;
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

    public String getPk() {
        return pk;
    }

    public void setPk(String pk) {
        this.pk = pk;
    }

    public String getEfwMocId() {
        return efwMocId;
    }

    public void setEfwMocId(String efwMocId) {
        this.efwMocId = efwMocId;
    }

    public String getInfoIdType() {
        return infoIdType;
    }

    public void setInfoIdType(String infoIdType) {
        this.infoIdType = infoIdType;
    }

    public String getEfzMocId() {
        return efzMocId;
    }

    public void setEfzMocId(String efzMocId) {
        this.efzMocId = efzMocId;
    }

    public String getDelRecCode() {
        return delRecCode;
    }

    public void setDelRecCode(String delRecCode) {
        this.delRecCode = delRecCode;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

	public String getClientNumber() {
		return clientNumber;
	}

	public void setClientNumber(String clientNumber) {
		this.clientNumber = clientNumber;
	}
}
