package com.dcits.supervise.pecr.validateData.vo;

import java.util.List;

import com.dcits.supervise.pecr.validateData.model.ValidateField;
import com.dcits.supervise.pecr.validateData.model.ValidateTable;

public class ValidateTableVo extends ValidateTable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 8740258237991836473L;
	private List<ValidateField> validateFieldList;

	public List<ValidateField> getValidateFieldList() {
		return this.validateFieldList;
	}

	public void setValidateFieldList(List<ValidateField> validateFieldList) {
		this.validateFieldList = validateFieldList;
	}

	public boolean equals(Object o) {
		if (o == this)
			return true;
		if (!(o instanceof ValidateTableVo))
			return false;
		ValidateTableVo other = (ValidateTableVo) o;
		if (!other.canEqual(this))
			return false;
		Object this$validateFieldList = getValidateFieldList();
		Object other$validateFieldList = other.getValidateFieldList();
		return this$validateFieldList == null ? other$validateFieldList == null
				: this$validateFieldList.equals(other$validateFieldList);
	}

	protected boolean canEqual(Object other) {
		return other instanceof ValidateTableVo;
	}

	public int hashCode() {
		//int PRIME = 59;
		int result = 1;
		Object $validateFieldList = getValidateFieldList();
		return result * 59 + ($validateFieldList == null ? 43 : $validateFieldList.hashCode());
	}

	public String toString() {
		return "ValidateTableVo(validateFieldList=" + getValidateFieldList() + ")";
	}
}