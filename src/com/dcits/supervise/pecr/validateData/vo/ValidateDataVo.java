package com.dcits.supervise.pecr.validateData.vo;

import com.dcits.supervise.pecr.validateData.model.ValidateRules;

public class ValidateDataVo extends ValidateRules {
	/**
	 * 
	 */
	private static final long serialVersionUID = 3324882410245432709L;
	private String tableName;
	private String pk;
	private String currentDate;
	private String status;
	private String masterTableId;

	public String getTableName() {
		return this.tableName;
	}

	public String getPk() {
		return this.pk;
	}

	public String getCurrentDate() {
		return this.currentDate;
	}

	public String getStatus() {
		return this.status;
	}

	public String getMasterTableId() {
		return this.masterTableId;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public void setPk(String pk) {
		this.pk = pk;
	}

	public void setCurrentDate(String currentDate) {
		this.currentDate = currentDate;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public void setMasterTableId(String masterTableId) {
		this.masterTableId = masterTableId;
	}

	public boolean equals(Object o) {
		if (o == this)
			return true;
		if (!(o instanceof ValidateDataVo))
			return false;
		ValidateDataVo other = (ValidateDataVo) o;
		if (!other.canEqual(this))
			return false;
		Object this$tableName = getTableName();
		Object other$tableName = other.getTableName();
		if (this$tableName == null ? other$tableName != null : !this$tableName.equals(other$tableName))
			return false;
		Object this$pk = getPk();
		Object other$pk = other.getPk();
		if (this$pk == null ? other$pk != null : !this$pk.equals(other$pk))
			return false;
		Object this$currentDate = getCurrentDate();
		Object other$currentDate = other.getCurrentDate();
		if (this$currentDate == null ? other$currentDate != null : !this$currentDate.equals(other$currentDate))
			return false;
		Object this$status = getStatus();
		Object other$status = other.getStatus();
		if (this$status == null ? other$status != null : !this$status.equals(other$status))
			return false;
		Object this$masterTableId = getMasterTableId();
		Object other$masterTableId = other.getMasterTableId();
		return this$masterTableId == null ? other$masterTableId == null
				: this$masterTableId.equals(other$masterTableId);
	}

	protected boolean canEqual(Object other) {
		return other instanceof ValidateDataVo;
	}

	public int hashCode() {
		//int PRIME = 59;
		int result = 1;
		Object $tableName = getTableName();
		result = result * 59 + ($tableName == null ? 43 : $tableName.hashCode());
		Object $pk = getPk();
		result = result * 59 + ($pk == null ? 43 : $pk.hashCode());
		Object $currentDate = getCurrentDate();
		result = result * 59 + ($currentDate == null ? 43 : $currentDate.hashCode());
		Object $status = getStatus();
		result = result * 59 + ($status == null ? 43 : $status.hashCode());
		Object $masterTableId = getMasterTableId();
		return result * 59 + ($masterTableId == null ? 43 : $masterTableId.hashCode());
	}

	public String toString() {
		return "ValidateDataVo(tableName=" + getTableName() + ", pk=" + getPk() + ", currentDate=" + getCurrentDate()
				+ ", status=" + getStatus() + ", masterTableId=" + getMasterTableId() + ")";
	}
}