package com.dcits.supervise.pecr.validateData.model;

import java.io.Serializable;

public class ValidateMapping implements Serializable {

	// ("id主键id")
	private String id;

	// ("validateRulesId校验规则id")
	private String validateRulesId;

	// ("validateParameterName校验参数名称")
	private String validateParameterName;

	// ("templateMappingName检验映射名称")
	private String templateMappingName;

	// ("validateMappingComment描述")
	private String validateMappingComment;

	// ("validateMappingType类型")
	private String validateMappingType;

	// ("seq排序")
	private Long seq;
	private static final long serialVersionUID = 1L;

	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append(getClass().getSimpleName());
		sb.append(" [");
		sb.append("Hash = ").append(hashCode());
		sb.append(", id=").append(this.id);
		sb.append(", validateRulesId=").append(this.validateRulesId);
		sb.append(", validateParameterName=").append(this.validateParameterName);
		sb.append(", templateMappingName=").append(this.templateMappingName);
		sb.append(", validateMappingComment=").append(this.validateMappingComment);
		sb.append(", validateMappingType=").append(this.validateMappingType);
		sb.append(", seq=").append(this.seq);
		sb.append(", serialVersionUID=").append(1L);
		sb.append("]");
		return sb.toString();
	}

	public String getId() {
		return this.id;
	}

	public String getValidateRulesId() {
		return this.validateRulesId;
	}

	public String getValidateParameterName() {
		return this.validateParameterName;
	}

	public String getTemplateMappingName() {
		return this.templateMappingName;
	}

	public String getValidateMappingComment() {
		return this.validateMappingComment;
	}

	public String getValidateMappingType() {
		return this.validateMappingType;
	}

	public Long getSeq() {
		return this.seq;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setValidateRulesId(String validateRulesId) {
		this.validateRulesId = validateRulesId;
	}

	public void setValidateParameterName(String validateParameterName) {
		this.validateParameterName = validateParameterName;
	}

	public void setTemplateMappingName(String templateMappingName) {
		this.templateMappingName = templateMappingName;
	}

	public void setValidateMappingComment(String validateMappingComment) {
		this.validateMappingComment = validateMappingComment;
	}

	public void setValidateMappingType(String validateMappingType) {
		this.validateMappingType = validateMappingType;
	}

	public void setSeq(Long seq) {
		this.seq = seq;
	}

	public boolean equals(Object o) {
		if (o == this)
			return true;
		if (!(o instanceof ValidateMapping))
			return false;
		ValidateMapping other = (ValidateMapping) o;
		if (!other.canEqual(this))
			return false;
		Object this$id = getId();
		Object other$id = other.getId();
		if (this$id == null ? other$id != null : !this$id.equals(other$id))
			return false;
		Object this$validateRulesId = getValidateRulesId();
		Object other$validateRulesId = other.getValidateRulesId();
		if (this$validateRulesId == null ? other$validateRulesId != null
				: !this$validateRulesId.equals(other$validateRulesId))
			return false;
		Object this$validateParameterName = getValidateParameterName();
		Object other$validateParameterName = other.getValidateParameterName();
		if (this$validateParameterName == null ? other$validateParameterName != null
				: !this$validateParameterName.equals(other$validateParameterName))
			return false;
		Object this$templateMappingName = getTemplateMappingName();
		Object other$templateMappingName = other.getTemplateMappingName();
		if (this$templateMappingName == null ? other$templateMappingName != null
				: !this$templateMappingName.equals(other$templateMappingName))
			return false;
		Object this$validateMappingComment = getValidateMappingComment();
		Object other$validateMappingComment = other.getValidateMappingComment();
		if (this$validateMappingComment == null ? other$validateMappingComment != null
				: !this$validateMappingComment.equals(other$validateMappingComment))
			return false;
		Object this$validateMappingType = getValidateMappingType();
		Object other$validateMappingType = other.getValidateMappingType();
		if (this$validateMappingType == null ? other$validateMappingType != null
				: !this$validateMappingType.equals(other$validateMappingType))
			return false;
		Object this$seq = getSeq();
		Object other$seq = other.getSeq();
		return this$seq == null ? other$seq == null : this$seq.equals(other$seq);
	}

	protected boolean canEqual(Object other) {
		return other instanceof ValidateMapping;
	}

	public int hashCode() {
		//int PRIME = 59;
		int result = 1;
		Object $id = getId();
		result = result * 59 + ($id == null ? 43 : $id.hashCode());
		Object $validateRulesId = getValidateRulesId();
		result = result * 59 + ($validateRulesId == null ? 43 : $validateRulesId.hashCode());
		Object $validateParameterName = getValidateParameterName();
		result = result * 59 + ($validateParameterName == null ? 43 : $validateParameterName.hashCode());
		Object $templateMappingName = getTemplateMappingName();
		result = result * 59 + ($templateMappingName == null ? 43 : $templateMappingName.hashCode());
		Object $validateMappingComment = getValidateMappingComment();
		result = result * 59 + ($validateMappingComment == null ? 43 : $validateMappingComment.hashCode());
		Object $validateMappingType = getValidateMappingType();
		result = result * 59 + ($validateMappingType == null ? 43 : $validateMappingType.hashCode());
		Object $seq = getSeq();
		return result * 59 + ($seq == null ? 43 : $seq.hashCode());
	}
}