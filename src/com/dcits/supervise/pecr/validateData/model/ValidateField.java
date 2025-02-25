package com.dcits.supervise.pecr.validateData.model;

import java.io.Serializable;

public class ValidateField implements Serializable {

	// ("fieldId主键id")
	private String fieldId;

	// ("tableId表主键id")
	private String tableId;

	// ("fieldNameEn字段英文名")
	private String fieldNameEn;

	// ("fieldNameCn字段中文名")
	private String fieldNameCn;
	private static final long serialVersionUID = 1L;

	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append(getClass().getSimpleName());
		sb.append(" [");
		sb.append("Hash = ").append(hashCode());
		sb.append(", fieldId=").append(this.fieldId);
		sb.append(", tableId=").append(this.tableId);
		sb.append(", fieldNameEn=").append(this.fieldNameEn);
		sb.append(", fieldNameCn=").append(this.fieldNameCn);
		sb.append(", serialVersionUID=").append(1L);
		sb.append("]");
		return sb.toString();
	}

	public String getFieldId() {
		return this.fieldId;
	}

	public String getTableId() {
		return this.tableId;
	}

	public String getFieldNameEn() {
		return this.fieldNameEn;
	}

	public String getFieldNameCn() {
		return this.fieldNameCn;
	}

	public void setFieldId(String fieldId) {
		this.fieldId = fieldId;
	}

	public void setTableId(String tableId) {
		this.tableId = tableId;
	}

	public void setFieldNameEn(String fieldNameEn) {
		this.fieldNameEn = fieldNameEn;
	}

	public void setFieldNameCn(String fieldNameCn) {
		this.fieldNameCn = fieldNameCn;
	}

	public boolean equals(Object o) {
		if (o == this)
			return true;
		if (!(o instanceof ValidateField))
			return false;
		ValidateField other = (ValidateField) o;
		if (!other.canEqual(this))
			return false;
		Object this$fieldId = getFieldId();
		Object other$fieldId = other.getFieldId();
		if (this$fieldId == null ? other$fieldId != null : !this$fieldId.equals(other$fieldId))
			return false;
		Object this$tableId = getTableId();
		Object other$tableId = other.getTableId();
		if (this$tableId == null ? other$tableId != null : !this$tableId.equals(other$tableId))
			return false;
		Object this$fieldNameEn = getFieldNameEn();
		Object other$fieldNameEn = other.getFieldNameEn();
		if (this$fieldNameEn == null ? other$fieldNameEn != null : !this$fieldNameEn.equals(other$fieldNameEn))
			return false;
		Object this$fieldNameCn = getFieldNameCn();
		Object other$fieldNameCn = other.getFieldNameCn();
		return this$fieldNameCn == null ? other$fieldNameCn == null : this$fieldNameCn.equals(other$fieldNameCn);
	}

	protected boolean canEqual(Object other) {
		return other instanceof ValidateField;
	}

	public int hashCode() {
		//int PRIME = 59;
		int result = 1;
		Object $fieldId = getFieldId();
		result = result * 59 + ($fieldId == null ? 43 : $fieldId.hashCode());
		Object $tableId = getTableId();
		result = result * 59 + ($tableId == null ? 43 : $tableId.hashCode());
		Object $fieldNameEn = getFieldNameEn();
		result = result * 59 + ($fieldNameEn == null ? 43 : $fieldNameEn.hashCode());
		Object $fieldNameCn = getFieldNameCn();
		return result * 59 + ($fieldNameCn == null ? 43 : $fieldNameCn.hashCode());
	}
}