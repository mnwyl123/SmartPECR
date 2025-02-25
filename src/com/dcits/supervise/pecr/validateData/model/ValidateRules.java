package com.dcits.supervise.pecr.validateData.model;

import java.io.Serializable;

public class ValidateRules implements Serializable {

	// ("id唯一ID")
	private String id;

	// ("ruleName规则名称")
	private String ruleName;

	// ("ruleType规则类型（sql数据库规则，viewPage前台规则）")
	private String ruleType;

	// ("tableName表名")
	private String tableName;

	// ("tableField字段")
	private String tableField;

	// ("templateName模板名称")
	private String templateName;

	// ("ruleComment描述备注")
	private String ruleComment;

	// ("subject主题")
	private String subject;

	// ("isForce是否强制校验(Y/必须通过，N可以忽略)")
	private String isForce;

	// ("isMultiTable是否多表校验(Y/是，N不是)")
	private String isMultiTable;

	// ("tablePk表主键")
	private String tablePk;

	// ("action动作标识一般为新增修改")
	private String action;

	// ("seq排序")
	private Long seq;
	private static final long serialVersionUID = 1L;

	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append(getClass().getSimpleName());
		sb.append(" [");
		sb.append("Hash = ").append(hashCode());
		sb.append(", id=").append(this.id);
		sb.append(", ruleName=").append(this.ruleName);
		sb.append(", ruleType=").append(this.ruleType);
		sb.append(", tableName=").append(this.tableName);
		sb.append(", tableField=").append(this.tableField);
		sb.append(", templateName=").append(this.templateName);
		sb.append(", ruleComment=").append(this.ruleComment);
		sb.append(", subject=").append(this.subject);
		sb.append(", isForce=").append(this.isForce);
		sb.append(", isMultiTable=").append(this.isMultiTable);
		sb.append(", tablePk=").append(this.tablePk);
		sb.append(", action=").append(this.action);
		sb.append(", seq=").append(this.seq);
		sb.append(", serialVersionUID=").append(1L);
		sb.append("]");
		return sb.toString();
	}

	public String getId() {
		return this.id;
	}

	public String getRuleName() {
		return this.ruleName;
	}

	public String getRuleType() {
		return this.ruleType;
	}

	public String getTableName() {
		return this.tableName;
	}

	public String getTableField() {
		return this.tableField;
	}

	public String getTemplateName() {
		return this.templateName;
	}

	public String getRuleComment() {
		return this.ruleComment;
	}

	public String getSubject() {
		return this.subject;
	}

	public String getIsForce() {
		return this.isForce;
	}

	public String getIsMultiTable() {
		return this.isMultiTable;
	}

	public String getTablePk() {
		return this.tablePk;
	}

	public String getAction() {
		return this.action;
	}

	public Long getSeq() {
		return this.seq;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setRuleName(String ruleName) {
		this.ruleName = ruleName;
	}

	public void setRuleType(String ruleType) {
		this.ruleType = ruleType;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public void setTableField(String tableField) {
		this.tableField = tableField;
	}

	public void setTemplateName(String templateName) {
		this.templateName = templateName;
	}

	public void setRuleComment(String ruleComment) {
		this.ruleComment = ruleComment;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public void setIsForce(String isForce) {
		this.isForce = isForce;
	}

	public void setIsMultiTable(String isMultiTable) {
		this.isMultiTable = isMultiTable;
	}

	public void setTablePk(String tablePk) {
		this.tablePk = tablePk;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public void setSeq(Long seq) {
		this.seq = seq;
	}

	public boolean equals(Object o) {
		if (o == this)
			return true;
		if (!(o instanceof ValidateRules))
			return false;
		ValidateRules other = (ValidateRules) o;
		if (!other.canEqual(this))
			return false;
		Object this$id = getId();
		Object other$id = other.getId();
		if (this$id == null ? other$id != null : !this$id.equals(other$id))
			return false;
		Object this$ruleName = getRuleName();
		Object other$ruleName = other.getRuleName();
		if (this$ruleName == null ? other$ruleName != null : !this$ruleName.equals(other$ruleName))
			return false;
		Object this$ruleType = getRuleType();
		Object other$ruleType = other.getRuleType();
		if (this$ruleType == null ? other$ruleType != null : !this$ruleType.equals(other$ruleType))
			return false;
		Object this$tableName = getTableName();
		Object other$tableName = other.getTableName();
		if (this$tableName == null ? other$tableName != null : !this$tableName.equals(other$tableName))
			return false;
		Object this$tableField = getTableField();
		Object other$tableField = other.getTableField();
		if (this$tableField == null ? other$tableField != null : !this$tableField.equals(other$tableField))
			return false;
		Object this$templateName = getTemplateName();
		Object other$templateName = other.getTemplateName();
		if (this$templateName == null ? other$templateName != null : !this$templateName.equals(other$templateName))
			return false;
		Object this$ruleComment = getRuleComment();
		Object other$ruleComment = other.getRuleComment();
		if (this$ruleComment == null ? other$ruleComment != null : !this$ruleComment.equals(other$ruleComment))
			return false;
		Object this$subject = getSubject();
		Object other$subject = other.getSubject();
		if (this$subject == null ? other$subject != null : !this$subject.equals(other$subject))
			return false;
		Object this$isForce = getIsForce();
		Object other$isForce = other.getIsForce();
		if (this$isForce == null ? other$isForce != null : !this$isForce.equals(other$isForce))
			return false;
		Object this$isMultiTable = getIsMultiTable();
		Object other$isMultiTable = other.getIsMultiTable();
		if (this$isMultiTable == null ? other$isMultiTable != null : !this$isMultiTable.equals(other$isMultiTable))
			return false;
		Object this$tablePk = getTablePk();
		Object other$tablePk = other.getTablePk();
		if (this$tablePk == null ? other$tablePk != null : !this$tablePk.equals(other$tablePk))
			return false;
		Object this$action = getAction();
		Object other$action = other.getAction();
		if (this$action == null ? other$action != null : !this$action.equals(other$action))
			return false;
		Object this$seq = getSeq();
		Object other$seq = other.getSeq();
		return this$seq == null ? other$seq == null : this$seq.equals(other$seq);
	}

	protected boolean canEqual(Object other) {
		return other instanceof ValidateRules;
	}

	public int hashCode() {
		//int PRIME = 59;
		int result = 1;
		Object $id = getId();
		result = result * 59 + ($id == null ? 43 : $id.hashCode());
		Object $ruleName = getRuleName();
		result = result * 59 + ($ruleName == null ? 43 : $ruleName.hashCode());
		Object $ruleType = getRuleType();
		result = result * 59 + ($ruleType == null ? 43 : $ruleType.hashCode());
		Object $tableName = getTableName();
		result = result * 59 + ($tableName == null ? 43 : $tableName.hashCode());
		Object $tableField = getTableField();
		result = result * 59 + ($tableField == null ? 43 : $tableField.hashCode());
		Object $templateName = getTemplateName();
		result = result * 59 + ($templateName == null ? 43 : $templateName.hashCode());
		Object $ruleComment = getRuleComment();
		result = result * 59 + ($ruleComment == null ? 43 : $ruleComment.hashCode());
		Object $subject = getSubject();
		result = result * 59 + ($subject == null ? 43 : $subject.hashCode());
		Object $isForce = getIsForce();
		result = result * 59 + ($isForce == null ? 43 : $isForce.hashCode());
		Object $isMultiTable = getIsMultiTable();
		result = result * 59 + ($isMultiTable == null ? 43 : $isMultiTable.hashCode());
		Object $tablePk = getTablePk();
		result = result * 59 + ($tablePk == null ? 43 : $tablePk.hashCode());
		Object $action = getAction();
		result = result * 59 + ($action == null ? 43 : $action.hashCode());
		Object $seq = getSeq();
		return result * 59 + ($seq == null ? 43 : $seq.hashCode());
	}
}