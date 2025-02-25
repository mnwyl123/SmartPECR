package com.dcits.supervise.pecr.validateData.model;

import java.io.Serializable;

public class ValidateTable implements Serializable {

	// ("tableId主键id")
	private String tableId;

	// ("tableNameEn表中英文名")
	private String tableNameEn;

	// ("tableNameCn表中文名")
	private String tableNameCn;

	// ("masterTableEn对应的主表名称")
	private String masterTableEn;

	// ("masterTablePk主键的主键字段")
	private String masterTablePk;

	// ("tbalePk表主键信息")
	private String tbalePk;
	private static final long serialVersionUID = 1L;

	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append(getClass().getSimpleName());
		sb.append(" [");
		sb.append("Hash = ").append(hashCode());
		sb.append(", tableId=").append(this.tableId);
		sb.append(", tableNameEn=").append(this.tableNameEn);
		sb.append(", tableNameCn=").append(this.tableNameCn);
		sb.append(", masterTableEn=").append(this.masterTableEn);
		sb.append(", masterTablePk=").append(this.masterTablePk);
		sb.append(", tbalePk=").append(this.tbalePk);
		sb.append(", serialVersionUID=").append(1L);
		sb.append("]");
		return sb.toString();
	}

	public String getTableId() {
		return this.tableId;
	}

	public String getTableNameEn() {
		return this.tableNameEn;
	}

	public String getTableNameCn() {
		return this.tableNameCn;
	}

	public String getMasterTableEn() {
		return this.masterTableEn;
	}

	public String getMasterTablePk() {
		return this.masterTablePk;
	}

	public String getTbalePk() {
		return this.tbalePk;
	}

	public void setTableId(String tableId) {
		this.tableId = tableId;
	}

	public void setTableNameEn(String tableNameEn) {
		this.tableNameEn = tableNameEn;
	}

	public void setTableNameCn(String tableNameCn) {
		this.tableNameCn = tableNameCn;
	}

	public void setMasterTableEn(String masterTableEn) {
		this.masterTableEn = masterTableEn;
	}

	public void setMasterTablePk(String masterTablePk) {
		this.masterTablePk = masterTablePk;
	}

	public void setTbalePk(String tbalePk) {
		this.tbalePk = tbalePk;
	}

	public boolean equals(Object o) {
		if (o == this)
			return true;
		if (!(o instanceof ValidateTable))
			return false;
		ValidateTable other = (ValidateTable) o;
		if (!other.canEqual(this))
			return false;
		Object this$tableId = getTableId();
		Object other$tableId = other.getTableId();
		if (this$tableId == null ? other$tableId != null : !this$tableId.equals(other$tableId))
			return false;
		Object this$tableNameEn = getTableNameEn();
		Object other$tableNameEn = other.getTableNameEn();
		if (this$tableNameEn == null ? other$tableNameEn != null : !this$tableNameEn.equals(other$tableNameEn))
			return false;
		Object this$tableNameCn = getTableNameCn();
		Object other$tableNameCn = other.getTableNameCn();
		if (this$tableNameCn == null ? other$tableNameCn != null : !this$tableNameCn.equals(other$tableNameCn))
			return false;
		Object this$masterTableEn = getMasterTableEn();
		Object other$masterTableEn = other.getMasterTableEn();
		if (this$masterTableEn == null ? other$masterTableEn != null : !this$masterTableEn.equals(other$masterTableEn))
			return false;
		Object this$masterTablePk = getMasterTablePk();
		Object other$masterTablePk = other.getMasterTablePk();
		if (this$masterTablePk == null ? other$masterTablePk != null : !this$masterTablePk.equals(other$masterTablePk))
			return false;
		Object this$tbalePk = getTbalePk();
		Object other$tbalePk = other.getTbalePk();
		return this$tbalePk == null ? other$tbalePk == null : this$tbalePk.equals(other$tbalePk);
	}

	protected boolean canEqual(Object other) {
		return other instanceof ValidateTable;
	}

	public int hashCode() {
		//int PRIME = 59;
		int result = 1;
		Object $tableId = getTableId();
		result = result * 59 + ($tableId == null ? 43 : $tableId.hashCode());
		Object $tableNameEn = getTableNameEn();
		result = result * 59 + ($tableNameEn == null ? 43 : $tableNameEn.hashCode());
		Object $tableNameCn = getTableNameCn();
		result = result * 59 + ($tableNameCn == null ? 43 : $tableNameCn.hashCode());
		Object $masterTableEn = getMasterTableEn();
		result = result * 59 + ($masterTableEn == null ? 43 : $masterTableEn.hashCode());
		Object $masterTablePk = getMasterTablePk();
		result = result * 59 + ($masterTablePk == null ? 43 : $masterTablePk.hashCode());
		Object $tbalePk = getTbalePk();
		return result * 59 + ($tbalePk == null ? 43 : $tbalePk.hashCode());
	}
}