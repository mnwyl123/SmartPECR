package com.dcits.supervise.pecr.validateData.model;

import java.io.Serializable;

public class ValidateParameter implements Serializable {

	// ("parameterName参数名称")
	private String parameterName;

	// ("parameterType参数类型")
	private String parameterType;

	// ("parameterValue参数的值")
	private String parameterValue;

	// ("parameterComment参数描述")
	private String parameterComment;

	// ("serviceNameservice类名")
	private String serviceName;
	private static final long serialVersionUID = 1L;

	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append(getClass().getSimpleName());
		sb.append(" [");
		sb.append("Hash = ").append(hashCode());
		sb.append(", parameterName=").append(this.parameterName);
		sb.append(", parameterType=").append(this.parameterType);
		sb.append(", parameterValue=").append(this.parameterValue);
		sb.append(", parameterComment=").append(this.parameterComment);
		sb.append(", serviceName=").append(this.serviceName);
		sb.append(", serialVersionUID=").append(1L);
		sb.append("]");
		return sb.toString();
	}

	public String getParameterName() {
		return this.parameterName;
	}

	public String getParameterType() {
		return this.parameterType;
	}

	public String getParameterValue() {
		return this.parameterValue;
	}

	public String getParameterComment() {
		return this.parameterComment;
	}

	public String getServiceName() {
		return this.serviceName;
	}

	public void setParameterName(String parameterName) {
		this.parameterName = parameterName;
	}

	public void setParameterType(String parameterType) {
		this.parameterType = parameterType;
	}

	public void setParameterValue(String parameterValue) {
		this.parameterValue = parameterValue;
	}

	public void setParameterComment(String parameterComment) {
		this.parameterComment = parameterComment;
	}

	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}

	public boolean equals(Object o) {
		if (o == this)
			return true;
		if (!(o instanceof ValidateParameter))
			return false;
		ValidateParameter other = (ValidateParameter) o;
		if (!other.canEqual(this))
			return false;
		Object this$parameterName = getParameterName();
		Object other$parameterName = other.getParameterName();
		if (this$parameterName == null ? other$parameterName != null : !this$parameterName.equals(other$parameterName))
			return false;
		Object this$parameterType = getParameterType();
		Object other$parameterType = other.getParameterType();
		if (this$parameterType == null ? other$parameterType != null : !this$parameterType.equals(other$parameterType))
			return false;
		Object this$parameterValue = getParameterValue();
		Object other$parameterValue = other.getParameterValue();
		if (this$parameterValue == null ? other$parameterValue != null
				: !this$parameterValue.equals(other$parameterValue))
			return false;
		Object this$parameterComment = getParameterComment();
		Object other$parameterComment = other.getParameterComment();
		if (this$parameterComment == null ? other$parameterComment != null
				: !this$parameterComment.equals(other$parameterComment))
			return false;
		Object this$serviceName = getServiceName();
		Object other$serviceName = other.getServiceName();
		return this$serviceName == null ? other$serviceName == null : this$serviceName.equals(other$serviceName);
	}

	protected boolean canEqual(Object other) {
		return other instanceof ValidateParameter;
	}

	public int hashCode() {
		//int PRIME = 59;
		int result = 1;
		Object $parameterName = getParameterName();
		result = result * 59 + ($parameterName == null ? 43 : $parameterName.hashCode());
		Object $parameterType = getParameterType();
		result = result * 59 + ($parameterType == null ? 43 : $parameterType.hashCode());
		Object $parameterValue = getParameterValue();
		result = result * 59 + ($parameterValue == null ? 43 : $parameterValue.hashCode());
		Object $parameterComment = getParameterComment();
		result = result * 59 + ($parameterComment == null ? 43 : $parameterComment.hashCode());
		Object $serviceName = getServiceName();
		return result * 59 + ($serviceName == null ? 43 : $serviceName.hashCode());
	}
}