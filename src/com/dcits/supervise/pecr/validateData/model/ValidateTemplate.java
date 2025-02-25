package com.dcits.supervise.pecr.validateData.model;

import java.io.Serializable;

public class ValidateTemplate implements Serializable {

	// templateName模板名称")
	private String templateName;

	// templateType模板类型")
	private String templateType;

	// templateComment模板描述")
	private String templateComment;

	// errorMsg错误信息提示")
	private String errorMsg;

	// databaseType数据库类型 (null表示通用,mysql,oracle,sqlserver,oracle,db2)")
	private String databaseType;

	// templateTpl模板内容")
	private String templateTpl;

	// serviceNameservice名称")
	private String serviceName;
	private static final long serialVersionUID = 1L;

	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append(getClass().getSimpleName());
		sb.append(" [");
		sb.append("Hash = ").append(hashCode());
		sb.append(", templateName=").append(this.templateName);
		sb.append(", templateType=").append(this.templateType);
		sb.append(", templateComment=").append(this.templateComment);
		sb.append(", errorMsg=").append(this.errorMsg);
		sb.append(", databaseType=").append(this.databaseType);
		sb.append(", templateTpl=").append(this.templateTpl);
		sb.append(", serviceName=").append(this.serviceName);
		sb.append(", serialVersionUID=").append(1L);
		sb.append("]");
		return sb.toString();
	}

	public String getTemplateName() {
		return this.templateName;
	}

	public String getTemplateType() {
		return this.templateType;
	}

	public String getTemplateComment() {
		return this.templateComment;
	}

	public String getErrorMsg() {
		return this.errorMsg;
	}

	public String getDatabaseType() {
		return this.databaseType;
	}

	public String getTemplateTpl() {
		return this.templateTpl;
	}

	public String getServiceName() {
		return this.serviceName;
	}

	public void setTemplateName(String templateName) {
		this.templateName = templateName;
	}

	public void setTemplateType(String templateType) {
		this.templateType = templateType;
	}

	public void setTemplateComment(String templateComment) {
		this.templateComment = templateComment;
	}

	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}

	public void setDatabaseType(String databaseType) {
		this.databaseType = databaseType;
	}

	public void setTemplateTpl(String templateTpl) {
		this.templateTpl = templateTpl;
	}

	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}

	public boolean equals(Object o) {
		if (o == this)
			return true;
		if (!(o instanceof ValidateTemplate))
			return false;
		ValidateTemplate other = (ValidateTemplate) o;
		if (!other.canEqual(this))
			return false;
		Object this$templateName = getTemplateName();
		Object other$templateName = other.getTemplateName();
		if (this$templateName == null ? other$templateName != null : !this$templateName.equals(other$templateName))
			return false;
		Object this$templateType = getTemplateType();
		Object other$templateType = other.getTemplateType();
		if (this$templateType == null ? other$templateType != null : !this$templateType.equals(other$templateType))
			return false;
		Object this$templateComment = getTemplateComment();
		Object other$templateComment = other.getTemplateComment();
		if (this$templateComment == null ? other$templateComment != null
				: !this$templateComment.equals(other$templateComment))
			return false;
		Object this$errorMsg = getErrorMsg();
		Object other$errorMsg = other.getErrorMsg();
		if (this$errorMsg == null ? other$errorMsg != null : !this$errorMsg.equals(other$errorMsg))
			return false;
		Object this$databaseType = getDatabaseType();
		Object other$databaseType = other.getDatabaseType();
		if (this$databaseType == null ? other$databaseType != null : !this$databaseType.equals(other$databaseType))
			return false;
		Object this$templateTpl = getTemplateTpl();
		Object other$templateTpl = other.getTemplateTpl();
		if (this$templateTpl == null ? other$templateTpl != null : !this$templateTpl.equals(other$templateTpl))
			return false;
		Object this$serviceName = getServiceName();
		Object other$serviceName = other.getServiceName();
		return this$serviceName == null ? other$serviceName == null : this$serviceName.equals(other$serviceName);
	}

	protected boolean canEqual(Object other) {
		return other instanceof ValidateTemplate;
	}

	public int hashCode() {
		//int PRIME = 59;
		int result = 1;
		Object $templateName = getTemplateName();
		result = result * 59 + ($templateName == null ? 43 : $templateName.hashCode());
		Object $templateType = getTemplateType();
		result = result * 59 + ($templateType == null ? 43 : $templateType.hashCode());
		Object $templateComment = getTemplateComment();
		result = result * 59 + ($templateComment == null ? 43 : $templateComment.hashCode());
		Object $errorMsg = getErrorMsg();
		result = result * 59 + ($errorMsg == null ? 43 : $errorMsg.hashCode());
		Object $databaseType = getDatabaseType();
		result = result * 59 + ($databaseType == null ? 43 : $databaseType.hashCode());
		Object $templateTpl = getTemplateTpl();
		result = result * 59 + ($templateTpl == null ? 43 : $templateTpl.hashCode());
		Object $serviceName = getServiceName();
		return result * 59 + ($serviceName == null ? 43 : $serviceName.hashCode());
	}
}