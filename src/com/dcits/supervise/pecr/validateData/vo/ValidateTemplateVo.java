package com.dcits.supervise.pecr.validateData.vo;

import com.dcits.supervise.pecr.validateData.model.ValidateTemplate;

public class ValidateTemplateVo extends ValidateTemplate {
	/**
	 * 
	 */
	private static final long serialVersionUID = -5119558236286470859L;
	private String templateNameOld;

	public String getTemplateNameOld() {
		return this.templateNameOld;
	}

	public void setTemplateNameOld(String templateNameOld) {
		this.templateNameOld = templateNameOld;
	}

	public boolean equals(Object o) {
		if (o == this)
			return true;
		if (!(o instanceof ValidateTemplateVo))
			return false;
		ValidateTemplateVo other = (ValidateTemplateVo) o;
		if (!other.canEqual(this))
			return false;
		Object this$templateNameOld = getTemplateNameOld();
		Object other$templateNameOld = other.getTemplateNameOld();
		return this$templateNameOld == null ? other$templateNameOld == null
				: this$templateNameOld.equals(other$templateNameOld);
	}

	protected boolean canEqual(Object other) {
		return other instanceof ValidateTemplateVo;
	}

	public int hashCode() {
		//int PRIME = 59;
		int result = 1;
		Object $templateNameOld = getTemplateNameOld();
		return result * 59 + ($templateNameOld == null ? 43 : $templateNameOld.hashCode());
	}

	public String toString() {
		return "ValidateTemplateVo(templateNameOld=" + getTemplateNameOld() + ")";
	}
}