package com.dcits.supervise.pecr.validateData.model;

import java.io.Serializable;

public class ValidateErrorMessage implements Serializable {

	//// id主键")
	private String id;

	//// tablePknull")
	private String tablePk;

	//// tableName表名称")
	private String tableName;

	//// tableField表字段")
	private String tableField;

	//// errorMsg错误信息")
	private String errorMsg;

	//// curDate日期")
	private String curDate;

	//// validateRulesId校验规则id")
	private String validateRulesId;

	//// vComment描述")
	private String vComment;

	//// businessPk业务联合主键")
	private String businessPk;

	//// tableNameCn业务表中文名")
	private String tableNameCn;

	//// subject主题")
	private String subject;

	//// isForce是否强制性校验")
	private String isForce;

	//// isMultiTable是否是多表")
	private String isMultiTable;

	//// masterTableId主表主键ID")
	private String masterTableId;
	private static final long serialVersionUID = 1L;

	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append(getClass().getSimpleName());
		sb.append(" [");
		sb.append("Hash = ").append(hashCode());
		sb.append(", id=").append(this.id);
		sb.append(", tablePk=").append(this.tablePk);
		sb.append(", tableName=").append(this.tableName);
		sb.append(", tableField=").append(this.tableField);
		sb.append(", errorMsg=").append(this.errorMsg);
		sb.append(", curDate=").append(this.curDate);
		sb.append(", validateRulesId=").append(this.validateRulesId);
		sb.append(", vComment=").append(this.vComment);
		sb.append(", businessPk=").append(this.businessPk);
		sb.append(", tableNameCn=").append(this.tableNameCn);
		sb.append(", subject=").append(this.subject);
		sb.append(", isForce=").append(this.isForce);
		sb.append(", isMultiTable=").append(this.isMultiTable);
		sb.append(", masterTableId=").append(this.masterTableId);
		sb.append(", serialVersionUID=").append(1L);
		sb.append("]");
		return sb.toString();
	}

	public String getId() {
		return this.id;
	}

	public String getTablePk() {
		return this.tablePk;
	}

	public String getTableName() {
		return this.tableName;
	}

	public String getTableField() {
		return this.tableField;
	}

	public String getErrorMsg() {
		return this.errorMsg;
	}

	public String getCurDate() {
		return this.curDate;
	}

	public String getValidateRulesId() {
		return this.validateRulesId;
	}

	public String getVComment() {
		return this.vComment;
	}

	public String getBusinessPk() {
		return this.businessPk;
	}

	public String getTableNameCn() {
		return this.tableNameCn;
	}

	public String getSubject() {
		return this.subject;
	}

	public String getIsForce() {
		return this.isForce;
	}

	public String getIsMultiTable() {
		return this.isMultiTable;
	}

	public String getMasterTableId() {
		return this.masterTableId;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setTablePk(String tablePk) {
		this.tablePk = tablePk;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public void setTableField(String tableField) {
		this.tableField = tableField;
	}

	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}

	public void setCurDate(String curDate) {
		this.curDate = curDate;
	}

	public void setValidateRulesId(String validateRulesId) {
		this.validateRulesId = validateRulesId;
	}

	public void setVComment(String vComment) {
		this.vComment = vComment;
	}

	public void setBusinessPk(String businessPk) {
		this.businessPk = businessPk;
	}

	public void setTableNameCn(String tableNameCn) {
		this.tableNameCn = tableNameCn;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public void setIsForce(String isForce) {
		this.isForce = isForce;
	}

	public void setIsMultiTable(String isMultiTable) {
		this.isMultiTable = isMultiTable;
	}

	public void setMasterTableId(String masterTableId) {
		this.masterTableId = masterTableId;
	}

	public boolean equals(Object o) {
		if (o == this)
			return true;
		if (!(o instanceof ValidateErrorMessage))
			return false;
		ValidateErrorMessage other = (ValidateErrorMessage) o;
		if (!other.canEqual(this))
			return false;
		Object this$id = getId();
		Object other$id = other.getId();
		if (this$id == null ? other$id != null : !this$id.equals(other$id))
			return false;
		Object this$tablePk = getTablePk();
		Object other$tablePk = other.getTablePk();
		if (this$tablePk == null ? other$tablePk != null : !this$tablePk.equals(other$tablePk))
			return false;
		Object this$tableName = getTableName();
		Object other$tableName = other.getTableName();
		if (this$tableName == null ? other$tableName != null : !this$tableName.equals(other$tableName))
			return false;
		Object this$tableField = getTableField();
		Object other$tableField = other.getTableField();
		if (this$tableField == null ? other$tableField != null : !this$tableField.equals(other$tableField))
			return false;
		Object this$errorMsg = getErrorMsg();
		Object other$errorMsg = other.getErrorMsg();
		if (this$errorMsg == null ? other$errorMsg != null : !this$errorMsg.equals(other$errorMsg))
			return false;
		Object this$curDate = getCurDate();
		Object other$curDate = other.getCurDate();
		if (this$curDate == null ? other$curDate != null : !this$curDate.equals(other$curDate))
			return false;
		Object this$validateRulesId = getValidateRulesId();
		Object other$validateRulesId = other.getValidateRulesId();
		if (this$validateRulesId == null ? other$validateRulesId != null
				: !this$validateRulesId.equals(other$validateRulesId))
			return false;
		Object this$vComment = getVComment();
		Object other$vComment = other.getVComment();
		if (this$vComment == null ? other$vComment != null : !this$vComment.equals(other$vComment))
			return false;
		Object this$businessPk = getBusinessPk();
		Object other$businessPk = other.getBusinessPk();
		if (this$businessPk == null ? other$businessPk != null : !this$businessPk.equals(other$businessPk))
			return false;
		Object this$tableNameCn = getTableNameCn();
		Object other$tableNameCn = other.getTableNameCn();
		if (this$tableNameCn == null ? other$tableNameCn != null : !this$tableNameCn.equals(other$tableNameCn))
			return false;
		Object this$subject = getSubject();
		Object other$subject = other.getSubject();
		if (this$subject == null ? other$subject != null : !this$subject.equals(other$subject))
			return false;
		Object this$isForce = getIsForce();
		Object other$isForce = other.getIsForce();
		if (this$isForce == null ? other$isForce != null : !this$isForce.equals(other$isForce))
			return false;
		Object this$isMultiTable = getIsMultiTable();
		Object other$isMultiTable = other.getIsMultiTable();
		if (this$isMultiTable == null ? other$isMultiTable != null : !this$isMultiTable.equals(other$isMultiTable))
			return false;
		Object this$masterTableId = getMasterTableId();
		Object other$masterTableId = other.getMasterTableId();
		return this$masterTableId == null ? other$masterTableId == null
				: this$masterTableId.equals(other$masterTableId);
	}

	protected boolean canEqual(Object other) {
		return other instanceof ValidateErrorMessage;
	}

	public int hashCode() {
		//int PRIME = 59;
		int result = 1;
		Object $id = getId();
		result = result * 59 + ($id == null ? 43 : $id.hashCode());
		Object $tablePk = getTablePk();
		result = result * 59 + ($tablePk == null ? 43 : $tablePk.hashCode());
		Object $tableName = getTableName();
		result = result * 59 + ($tableName == null ? 43 : $tableName.hashCode());
		Object $tableField = getTableField();
		result = result * 59 + ($tableField == null ? 43 : $tableField.hashCode());
		Object $errorMsg = getErrorMsg();
		result = result * 59 + ($errorMsg == null ? 43 : $errorMsg.hashCode());
		Object $curDate = getCurDate();
		result = result * 59 + ($curDate == null ? 43 : $curDate.hashCode());
		Object $validateRulesId = getValidateRulesId();
		result = result * 59 + ($validateRulesId == null ? 43 : $validateRulesId.hashCode());
		Object $vComment = getVComment();
		result = result * 59 + ($vComment == null ? 43 : $vComment.hashCode());
		Object $businessPk = getBusinessPk();
		result = result * 59 + ($businessPk == null ? 43 : $businessPk.hashCode());
		Object $tableNameCn = getTableNameCn();
		result = result * 59 + ($tableNameCn == null ? 43 : $tableNameCn.hashCode());
		Object $subject = getSubject();
		result = result * 59 + ($subject == null ? 43 : $subject.hashCode());
		Object $isForce = getIsForce();
		result = result * 59 + ($isForce == null ? 43 : $isForce.hashCode());
		Object $isMultiTable = getIsMultiTable();
		result = result * 59 + ($isMultiTable == null ? 43 : $isMultiTable.hashCode());
		Object $masterTableId = getMasterTableId();
		return result * 59 + ($masterTableId == null ? 43 : $masterTableId.hashCode());
	}
}