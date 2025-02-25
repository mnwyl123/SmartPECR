package com.dcits.supervise.pecr.validateData.model;

import java.io.Serializable;

public class ValidateDbType implements Serializable {

	// dbName数据库名称")
	private String dbName;

	// isCurrentY当前系统正在使用N表示不是")
	private String isCurrent;
	private static final long serialVersionUID = 1L;

	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append(getClass().getSimpleName());
		sb.append(" [");
		sb.append("Hash = ").append(hashCode());
		sb.append(", dbName=").append(this.dbName);
		sb.append(", isCurrent=").append(this.isCurrent);
		sb.append(", serialVersionUID=").append(1L);
		sb.append("]");
		return sb.toString();
	}

	public String getDbName() {
		return this.dbName;
	}

	public String getIsCurrent() {
		return this.isCurrent;
	}

	public void setDbName(String dbName) {
		this.dbName = dbName;
	}

	public void setIsCurrent(String isCurrent) {
		this.isCurrent = isCurrent;
	}

	public boolean equals(Object o) {
		if (o == this)
			return true;
		if (!(o instanceof ValidateDbType))
			return false;
		ValidateDbType other = (ValidateDbType) o;
		if (!other.canEqual(this))
			return false;
		Object this$dbName = getDbName();
		Object other$dbName = other.getDbName();
		if (this$dbName == null ? other$dbName != null : !this$dbName.equals(other$dbName))
			return false;
		Object this$isCurrent = getIsCurrent();
		Object other$isCurrent = other.getIsCurrent();
		return this$isCurrent == null ? other$isCurrent == null : this$isCurrent.equals(other$isCurrent);
	}

	protected boolean canEqual(Object other) {
		return other instanceof ValidateDbType;
	}

	public int hashCode() {
		//int PRIME = 59;
		int result = 1;
		Object $dbName = getDbName();
		result = result * 59 + ($dbName == null ? 43 : $dbName.hashCode());
		Object $isCurrent = getIsCurrent();
		return result * 59 + ($isCurrent == null ? 43 : $isCurrent.hashCode());
	}
}