package com.dcits.supervise.pecr.validateData.vo;

import java.util.List;

import com.dcits.supervise.pecr.validateData.model.ValidateMapping;
import com.dcits.supervise.pecr.validateData.model.ValidateRules;

public class ValidateRulesVo extends ValidateRules {
	/**
	 * 
	 */
	private static final long serialVersionUID = -875489001972833517L;
	private List<ValidateMapping> validateMappingList;

	public List<ValidateMapping> getValidateMappingList() {
		return this.validateMappingList;
	}

	public void setValidateMappingList(List<ValidateMapping> validateMappingList) {
		this.validateMappingList = validateMappingList;
	}

	public boolean equals(Object o) {
		if (o == this)
			return true;
		if (!(o instanceof ValidateRulesVo))
			return false;
		ValidateRulesVo other = (ValidateRulesVo) o;
		if (!other.canEqual(this))
			return false;
		Object this$validateMappingList = getValidateMappingList();
		Object other$validateMappingList = other.getValidateMappingList();
		return this$validateMappingList == null ? other$validateMappingList == null
				: this$validateMappingList.equals(other$validateMappingList);
	}

	protected boolean canEqual(Object other) {
		return other instanceof ValidateRulesVo;
	}

	public int hashCode() {
		//int PRIME = 59;
		int result = 1;
		Object $validateMappingList = getValidateMappingList();
		return result * 59 + ($validateMappingList == null ? 43 : $validateMappingList.hashCode());
	}

	public String toString() {
		return "ValidateRulesVo(validateMappingList=" + getValidateMappingList() + ")";
	}
}