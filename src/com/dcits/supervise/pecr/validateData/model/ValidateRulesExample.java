package com.dcits.supervise.pecr.validateData.model;

import java.util.ArrayList;
import java.util.List;

public class ValidateRulesExample {
	protected String orderByClause;
	protected boolean distinct;
	protected List<Criteria> oredCriteria;

	public ValidateRulesExample() {
		this.oredCriteria = new ArrayList();
	}

	public void setOrderByClause(String orderByClause) {
		this.orderByClause = orderByClause;
	}

	public String getOrderByClause() {
		return this.orderByClause;
	}

	public void setDistinct(boolean distinct) {
		this.distinct = distinct;
	}

	public boolean isDistinct() {
		return this.distinct;
	}

	public List<Criteria> getOredCriteria() {
		return this.oredCriteria;
	}

	public void or(Criteria criteria) {
		this.oredCriteria.add(criteria);
	}

	public Criteria or() {
		Criteria criteria = createCriteriaInternal();
		this.oredCriteria.add(criteria);
		return criteria;
	}

	public Criteria createCriteria() {
		Criteria criteria = createCriteriaInternal();
		if (this.oredCriteria.size() == 0) {
			this.oredCriteria.add(criteria);
		}
		return criteria;
	}

	protected Criteria createCriteriaInternal() {
		Criteria criteria = new Criteria();
		return criteria;
	}

	public void clear() {
		this.oredCriteria.clear();
		this.orderByClause = null;
		this.distinct = false;
	}

	public void setOredCriteria(List<Criteria> oredCriteria) {
		this.oredCriteria = oredCriteria;
	}

	public boolean equals(Object o) {
		if (o == this)
			return true;
		if (!(o instanceof ValidateRulesExample))
			return false;
		ValidateRulesExample other = (ValidateRulesExample) o;
		if (!other.canEqual(this))
			return false;
		Object this$orderByClause = getOrderByClause();
		Object other$orderByClause = other.getOrderByClause();
		if (this$orderByClause == null ? other$orderByClause != null : !this$orderByClause.equals(other$orderByClause))
			return false;
		if (isDistinct() != other.isDistinct())
			return false;
		Object this$oredCriteria = getOredCriteria();
		Object other$oredCriteria = other.getOredCriteria();
		return this$oredCriteria == null ? other$oredCriteria == null : this$oredCriteria.equals(other$oredCriteria);
	}

	protected boolean canEqual(Object other) {
		return other instanceof ValidateRulesExample;
	}

	public int hashCode() {
		//int PRIME = 59;
		int result = 1;
		Object $orderByClause = getOrderByClause();
		result = result * 59 + ($orderByClause == null ? 43 : $orderByClause.hashCode());
		result = result * 59 + (isDistinct() ? 79 : 97);
		Object $oredCriteria = getOredCriteria();
		return result * 59 + ($oredCriteria == null ? 43 : $oredCriteria.hashCode());
	}

	public String toString() {
		return "ValidateRulesExample(orderByClause=" + getOrderByClause() + ", distinct=" + isDistinct()
				+ ", oredCriteria=" + getOredCriteria() + ")";
	}

	public static class Criterion {
		private String condition;
		private Object value;
		private Object secondValue;
		private boolean noValue;
		private boolean singleValue;
		private boolean betweenValue;
		private boolean listValue;
		private String typeHandler;

		public String getCondition() {
			return this.condition;
		}

		public Object getValue() {
			return this.value;
		}

		public Object getSecondValue() {
			return this.secondValue;
		}

		public boolean isNoValue() {
			return this.noValue;
		}

		public boolean isSingleValue() {
			return this.singleValue;
		}

		public boolean isBetweenValue() {
			return this.betweenValue;
		}

		public boolean isListValue() {
			return this.listValue;
		}

		public String getTypeHandler() {
			return this.typeHandler;
		}

		protected Criterion(String condition) {
			this.condition = condition;
			this.typeHandler = null;
			this.noValue = true;
		}

		protected Criterion(String condition, Object value, String typeHandler) {
			this.condition = condition;
			this.value = value;
			this.typeHandler = typeHandler;
			if ((value instanceof List))
				this.listValue = true;
			else
				this.singleValue = true;
		}

		protected Criterion(String condition, Object value) {
			this(condition, value, null);
		}

		protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
			this.condition = condition;
			this.value = value;
			this.secondValue = secondValue;
			this.typeHandler = typeHandler;
			this.betweenValue = true;
		}

		protected Criterion(String condition, Object value, Object secondValue) {
			this(condition, value, secondValue, null);
		}
	}

	public static class Criteria extends ValidateRulesExample.GeneratedCriteria {
	}

	protected static abstract class GeneratedCriteria {
		protected List<ValidateRulesExample.Criterion> criteria;

		protected GeneratedCriteria() {
			this.criteria = new ArrayList();
		}

		public boolean isValid() {
			return this.criteria.size() > 0;
		}

		public List<ValidateRulesExample.Criterion> getAllCriteria() {
			return this.criteria;
		}

		public List<ValidateRulesExample.Criterion> getCriteria() {
			return this.criteria;
		}

		protected void addCriterion(String condition) {
			if (condition == null) {
				throw new RuntimeException("Value for condition cannot be null");
			}
			this.criteria.add(new ValidateRulesExample.Criterion(condition));
		}

		protected void addCriterion(String condition, Object value, String property) {
			if (value == null) {
				throw new RuntimeException("Value for " + property + " cannot be null");
			}
			this.criteria.add(new ValidateRulesExample.Criterion(condition, value));
		}

		protected void addCriterion(String condition, Object value1, Object value2, String property) {
			if ((value1 == null) || (value2 == null)) {
				throw new RuntimeException("Between values for " + property + " cannot be null");
			}
			this.criteria.add(new ValidateRulesExample.Criterion(condition, value1, value2));
		}

		public ValidateRulesExample.Criteria andIdIsNull() {
			addCriterion("ID is null");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andIdIsNotNull() {
			addCriterion("ID is not null");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andIdEqualTo(String value) {
			addCriterion("ID =", value, "id");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andIdNotEqualTo(String value) {
			addCriterion("ID <>", value, "id");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andIdGreaterThan(String value) {
			addCriterion("ID >", value, "id");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andIdGreaterThanOrEqualTo(String value) {
			addCriterion("ID >=", value, "id");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andIdLessThan(String value) {
			addCriterion("ID <", value, "id");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andIdLessThanOrEqualTo(String value) {
			addCriterion("ID <=", value, "id");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andIdLike(String value) {
			addCriterion("ID like", value, "id");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andIdNotLike(String value) {
			addCriterion("ID not like", value, "id");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andIdIn(List<String> values) {
			addCriterion("ID in", values, "id");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andIdNotIn(List<String> values) {
			addCriterion("ID not in", values, "id");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andIdBetween(String value1, String value2) {
			addCriterion("ID between", value1, value2, "id");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andIdNotBetween(String value1, String value2) {
			addCriterion("ID not between", value1, value2, "id");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andRuleNameIsNull() {
			addCriterion("RULE_NAME is null");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andRuleNameIsNotNull() {
			addCriterion("RULE_NAME is not null");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andRuleNameEqualTo(String value) {
			addCriterion("RULE_NAME =", value, "ruleName");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andRuleNameNotEqualTo(String value) {
			addCriterion("RULE_NAME <>", value, "ruleName");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andRuleNameGreaterThan(String value) {
			addCriterion("RULE_NAME >", value, "ruleName");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andRuleNameGreaterThanOrEqualTo(String value) {
			addCriterion("RULE_NAME >=", value, "ruleName");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andRuleNameLessThan(String value) {
			addCriterion("RULE_NAME <", value, "ruleName");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andRuleNameLessThanOrEqualTo(String value) {
			addCriterion("RULE_NAME <=", value, "ruleName");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andRuleNameLike(String value) {
			addCriterion("RULE_NAME like", value, "ruleName");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andRuleNameNotLike(String value) {
			addCriterion("RULE_NAME not like", value, "ruleName");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andRuleNameIn(List<String> values) {
			addCriterion("RULE_NAME in", values, "ruleName");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andRuleNameNotIn(List<String> values) {
			addCriterion("RULE_NAME not in", values, "ruleName");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andRuleNameBetween(String value1, String value2) {
			addCriterion("RULE_NAME between", value1, value2, "ruleName");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andRuleNameNotBetween(String value1, String value2) {
			addCriterion("RULE_NAME not between", value1, value2, "ruleName");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andRuleTypeIsNull() {
			addCriterion("RULE_TYPE is null");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andRuleTypeIsNotNull() {
			addCriterion("RULE_TYPE is not null");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andRuleTypeEqualTo(String value) {
			addCriterion("RULE_TYPE =", value, "ruleType");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andRuleTypeNotEqualTo(String value) {
			addCriterion("RULE_TYPE <>", value, "ruleType");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andRuleTypeGreaterThan(String value) {
			addCriterion("RULE_TYPE >", value, "ruleType");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andRuleTypeGreaterThanOrEqualTo(String value) {
			addCriterion("RULE_TYPE >=", value, "ruleType");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andRuleTypeLessThan(String value) {
			addCriterion("RULE_TYPE <", value, "ruleType");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andRuleTypeLessThanOrEqualTo(String value) {
			addCriterion("RULE_TYPE <=", value, "ruleType");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andRuleTypeLike(String value) {
			addCriterion("RULE_TYPE like", value, "ruleType");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andRuleTypeNotLike(String value) {
			addCriterion("RULE_TYPE not like", value, "ruleType");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andRuleTypeIn(List<String> values) {
			addCriterion("RULE_TYPE in", values, "ruleType");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andRuleTypeNotIn(List<String> values) {
			addCriterion("RULE_TYPE not in", values, "ruleType");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andRuleTypeBetween(String value1, String value2) {
			addCriterion("RULE_TYPE between", value1, value2, "ruleType");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andRuleTypeNotBetween(String value1, String value2) {
			addCriterion("RULE_TYPE not between", value1, value2, "ruleType");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andTableNameIsNull() {
			addCriterion("TABLE_NAME is null");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andTableNameIsNotNull() {
			addCriterion("TABLE_NAME is not null");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andTableNameEqualTo(String value) {
			addCriterion("TABLE_NAME =", value, "tableName");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andTableNameNotEqualTo(String value) {
			addCriterion("TABLE_NAME <>", value, "tableName");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andTableNameGreaterThan(String value) {
			addCriterion("TABLE_NAME >", value, "tableName");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andTableNameGreaterThanOrEqualTo(String value) {
			addCriterion("TABLE_NAME >=", value, "tableName");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andTableNameLessThan(String value) {
			addCriterion("TABLE_NAME <", value, "tableName");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andTableNameLessThanOrEqualTo(String value) {
			addCriterion("TABLE_NAME <=", value, "tableName");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andTableNameLike(String value) {
			addCriterion("TABLE_NAME like", value, "tableName");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andTableNameNotLike(String value) {
			addCriterion("TABLE_NAME not like", value, "tableName");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andTableNameIn(List<String> values) {
			addCriterion("TABLE_NAME in", values, "tableName");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andTableNameNotIn(List<String> values) {
			addCriterion("TABLE_NAME not in", values, "tableName");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andTableNameBetween(String value1, String value2) {
			addCriterion("TABLE_NAME between", value1, value2, "tableName");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andTableNameNotBetween(String value1, String value2) {
			addCriterion("TABLE_NAME not between", value1, value2, "tableName");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andTableFieldIsNull() {
			addCriterion("TABLE_FIELD is null");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andTableFieldIsNotNull() {
			addCriterion("TABLE_FIELD is not null");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andTableFieldEqualTo(String value) {
			addCriterion("TABLE_FIELD =", value, "tableField");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andTableFieldNotEqualTo(String value) {
			addCriterion("TABLE_FIELD <>", value, "tableField");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andTableFieldGreaterThan(String value) {
			addCriterion("TABLE_FIELD >", value, "tableField");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andTableFieldGreaterThanOrEqualTo(String value) {
			addCriterion("TABLE_FIELD >=", value, "tableField");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andTableFieldLessThan(String value) {
			addCriterion("TABLE_FIELD <", value, "tableField");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andTableFieldLessThanOrEqualTo(String value) {
			addCriterion("TABLE_FIELD <=", value, "tableField");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andTableFieldLike(String value) {
			addCriterion("TABLE_FIELD like", value, "tableField");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andTableFieldNotLike(String value) {
			addCriterion("TABLE_FIELD not like", value, "tableField");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andTableFieldIn(List<String> values) {
			addCriterion("TABLE_FIELD in", values, "tableField");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andTableFieldNotIn(List<String> values) {
			addCriterion("TABLE_FIELD not in", values, "tableField");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andTableFieldBetween(String value1, String value2) {
			addCriterion("TABLE_FIELD between", value1, value2, "tableField");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andTableFieldNotBetween(String value1, String value2) {
			addCriterion("TABLE_FIELD not between", value1, value2, "tableField");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andTemplateNameIsNull() {
			addCriterion("TEMPLATE_NAME is null");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andTemplateNameIsNotNull() {
			addCriterion("TEMPLATE_NAME is not null");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andTemplateNameEqualTo(String value) {
			addCriterion("TEMPLATE_NAME =", value, "templateName");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andTemplateNameNotEqualTo(String value) {
			addCriterion("TEMPLATE_NAME <>", value, "templateName");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andTemplateNameGreaterThan(String value) {
			addCriterion("TEMPLATE_NAME >", value, "templateName");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andTemplateNameGreaterThanOrEqualTo(String value) {
			addCriterion("TEMPLATE_NAME >=", value, "templateName");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andTemplateNameLessThan(String value) {
			addCriterion("TEMPLATE_NAME <", value, "templateName");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andTemplateNameLessThanOrEqualTo(String value) {
			addCriterion("TEMPLATE_NAME <=", value, "templateName");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andTemplateNameLike(String value) {
			addCriterion("TEMPLATE_NAME like", value, "templateName");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andTemplateNameNotLike(String value) {
			addCriterion("TEMPLATE_NAME not like", value, "templateName");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andTemplateNameIn(List<String> values) {
			addCriterion("TEMPLATE_NAME in", values, "templateName");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andTemplateNameNotIn(List<String> values) {
			addCriterion("TEMPLATE_NAME not in", values, "templateName");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andTemplateNameBetween(String value1, String value2) {
			addCriterion("TEMPLATE_NAME between", value1, value2, "templateName");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andTemplateNameNotBetween(String value1, String value2) {
			addCriterion("TEMPLATE_NAME not between", value1, value2, "templateName");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andRuleCommentIsNull() {
			addCriterion("RULE_COMMENT is null");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andRuleCommentIsNotNull() {
			addCriterion("RULE_COMMENT is not null");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andRuleCommentEqualTo(String value) {
			addCriterion("RULE_COMMENT =", value, "ruleComment");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andRuleCommentNotEqualTo(String value) {
			addCriterion("RULE_COMMENT <>", value, "ruleComment");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andRuleCommentGreaterThan(String value) {
			addCriterion("RULE_COMMENT >", value, "ruleComment");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andRuleCommentGreaterThanOrEqualTo(String value) {
			addCriterion("RULE_COMMENT >=", value, "ruleComment");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andRuleCommentLessThan(String value) {
			addCriterion("RULE_COMMENT <", value, "ruleComment");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andRuleCommentLessThanOrEqualTo(String value) {
			addCriterion("RULE_COMMENT <=", value, "ruleComment");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andRuleCommentLike(String value) {
			addCriterion("RULE_COMMENT like", value, "ruleComment");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andRuleCommentNotLike(String value) {
			addCriterion("RULE_COMMENT not like", value, "ruleComment");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andRuleCommentIn(List<String> values) {
			addCriterion("RULE_COMMENT in", values, "ruleComment");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andRuleCommentNotIn(List<String> values) {
			addCriterion("RULE_COMMENT not in", values, "ruleComment");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andRuleCommentBetween(String value1, String value2) {
			addCriterion("RULE_COMMENT between", value1, value2, "ruleComment");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andRuleCommentNotBetween(String value1, String value2) {
			addCriterion("RULE_COMMENT not between", value1, value2, "ruleComment");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andSubjectIsNull() {
			addCriterion("SUBJECT is null");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andSubjectIsNotNull() {
			addCriterion("SUBJECT is not null");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andSubjectEqualTo(String value) {
			addCriterion("SUBJECT =", value, "subject");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andSubjectNotEqualTo(String value) {
			addCriterion("SUBJECT <>", value, "subject");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andSubjectGreaterThan(String value) {
			addCriterion("SUBJECT >", value, "subject");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andSubjectGreaterThanOrEqualTo(String value) {
			addCriterion("SUBJECT >=", value, "subject");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andSubjectLessThan(String value) {
			addCriterion("SUBJECT <", value, "subject");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andSubjectLessThanOrEqualTo(String value) {
			addCriterion("SUBJECT <=", value, "subject");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andSubjectLike(String value) {
			addCriterion("SUBJECT like", value, "subject");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andSubjectNotLike(String value) {
			addCriterion("SUBJECT not like", value, "subject");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andSubjectIn(List<String> values) {
			addCriterion("SUBJECT in", values, "subject");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andSubjectNotIn(List<String> values) {
			addCriterion("SUBJECT not in", values, "subject");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andSubjectBetween(String value1, String value2) {
			addCriterion("SUBJECT between", value1, value2, "subject");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andSubjectNotBetween(String value1, String value2) {
			addCriterion("SUBJECT not between", value1, value2, "subject");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andIsForceIsNull() {
			addCriterion("IS_FORCE is null");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andIsForceIsNotNull() {
			addCriterion("IS_FORCE is not null");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andIsForceEqualTo(String value) {
			addCriterion("IS_FORCE =", value, "isForce");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andIsForceNotEqualTo(String value) {
			addCriterion("IS_FORCE <>", value, "isForce");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andIsForceGreaterThan(String value) {
			addCriterion("IS_FORCE >", value, "isForce");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andIsForceGreaterThanOrEqualTo(String value) {
			addCriterion("IS_FORCE >=", value, "isForce");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andIsForceLessThan(String value) {
			addCriterion("IS_FORCE <", value, "isForce");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andIsForceLessThanOrEqualTo(String value) {
			addCriterion("IS_FORCE <=", value, "isForce");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andIsForceLike(String value) {
			addCriterion("IS_FORCE like", value, "isForce");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andIsForceNotLike(String value) {
			addCriterion("IS_FORCE not like", value, "isForce");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andIsForceIn(List<String> values) {
			addCriterion("IS_FORCE in", values, "isForce");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andIsForceNotIn(List<String> values) {
			addCriterion("IS_FORCE not in", values, "isForce");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andIsForceBetween(String value1, String value2) {
			addCriterion("IS_FORCE between", value1, value2, "isForce");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andIsForceNotBetween(String value1, String value2) {
			addCriterion("IS_FORCE not between", value1, value2, "isForce");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andIsMultiTableIsNull() {
			addCriterion("IS_MULTI_TABLE is null");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andIsMultiTableIsNotNull() {
			addCriterion("IS_MULTI_TABLE is not null");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andIsMultiTableEqualTo(String value) {
			addCriterion("IS_MULTI_TABLE =", value, "isMultiTable");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andIsMultiTableNotEqualTo(String value) {
			addCriterion("IS_MULTI_TABLE <>", value, "isMultiTable");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andIsMultiTableGreaterThan(String value) {
			addCriterion("IS_MULTI_TABLE >", value, "isMultiTable");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andIsMultiTableGreaterThanOrEqualTo(String value) {
			addCriterion("IS_MULTI_TABLE >=", value, "isMultiTable");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andIsMultiTableLessThan(String value) {
			addCriterion("IS_MULTI_TABLE <", value, "isMultiTable");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andIsMultiTableLessThanOrEqualTo(String value) {
			addCriterion("IS_MULTI_TABLE <=", value, "isMultiTable");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andIsMultiTableLike(String value) {
			addCriterion("IS_MULTI_TABLE like", value, "isMultiTable");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andIsMultiTableNotLike(String value) {
			addCriterion("IS_MULTI_TABLE not like", value, "isMultiTable");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andIsMultiTableIn(List<String> values) {
			addCriterion("IS_MULTI_TABLE in", values, "isMultiTable");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andIsMultiTableNotIn(List<String> values) {
			addCriterion("IS_MULTI_TABLE not in", values, "isMultiTable");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andIsMultiTableBetween(String value1, String value2) {
			addCriterion("IS_MULTI_TABLE between", value1, value2, "isMultiTable");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andIsMultiTableNotBetween(String value1, String value2) {
			addCriterion("IS_MULTI_TABLE not between", value1, value2, "isMultiTable");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andTablePkIsNull() {
			addCriterion("TABLE_PK is null");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andTablePkIsNotNull() {
			addCriterion("TABLE_PK is not null");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andTablePkEqualTo(String value) {
			addCriterion("TABLE_PK =", value, "tablePk");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andTablePkNotEqualTo(String value) {
			addCriterion("TABLE_PK <>", value, "tablePk");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andTablePkGreaterThan(String value) {
			addCriterion("TABLE_PK >", value, "tablePk");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andTablePkGreaterThanOrEqualTo(String value) {
			addCriterion("TABLE_PK >=", value, "tablePk");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andTablePkLessThan(String value) {
			addCriterion("TABLE_PK <", value, "tablePk");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andTablePkLessThanOrEqualTo(String value) {
			addCriterion("TABLE_PK <=", value, "tablePk");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andTablePkLike(String value) {
			addCriterion("TABLE_PK like", value, "tablePk");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andTablePkNotLike(String value) {
			addCriterion("TABLE_PK not like", value, "tablePk");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andTablePkIn(List<String> values) {
			addCriterion("TABLE_PK in", values, "tablePk");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andTablePkNotIn(List<String> values) {
			addCriterion("TABLE_PK not in", values, "tablePk");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andTablePkBetween(String value1, String value2) {
			addCriterion("TABLE_PK between", value1, value2, "tablePk");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andTablePkNotBetween(String value1, String value2) {
			addCriterion("TABLE_PK not between", value1, value2, "tablePk");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andActionIsNull() {
			addCriterion("ACTION is null");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andActionIsNotNull() {
			addCriterion("ACTION is not null");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andActionEqualTo(String value) {
			addCriterion("ACTION =", value, "action");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andActionNotEqualTo(String value) {
			addCriterion("ACTION <>", value, "action");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andActionGreaterThan(String value) {
			addCriterion("ACTION >", value, "action");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andActionGreaterThanOrEqualTo(String value) {
			addCriterion("ACTION >=", value, "action");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andActionLessThan(String value) {
			addCriterion("ACTION <", value, "action");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andActionLessThanOrEqualTo(String value) {
			addCriterion("ACTION <=", value, "action");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andActionLike(String value) {
			addCriterion("ACTION like", value, "action");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andActionNotLike(String value) {
			addCriterion("ACTION not like", value, "action");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andActionIn(List<String> values) {
			addCriterion("ACTION in", values, "action");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andActionNotIn(List<String> values) {
			addCriterion("ACTION not in", values, "action");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andActionBetween(String value1, String value2) {
			addCriterion("ACTION between", value1, value2, "action");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andActionNotBetween(String value1, String value2) {
			addCriterion("ACTION not between", value1, value2, "action");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andSeqIsNull() {
			addCriterion("SEQ is null");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andSeqIsNotNull() {
			addCriterion("SEQ is not null");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andSeqEqualTo(Long value) {
			addCriterion("SEQ =", value, "seq");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andSeqNotEqualTo(Long value) {
			addCriterion("SEQ <>", value, "seq");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andSeqGreaterThan(Long value) {
			addCriterion("SEQ >", value, "seq");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andSeqGreaterThanOrEqualTo(Long value) {
			addCriterion("SEQ >=", value, "seq");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andSeqLessThan(Long value) {
			addCriterion("SEQ <", value, "seq");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andSeqLessThanOrEqualTo(Long value) {
			addCriterion("SEQ <=", value, "seq");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andSeqIn(List<Long> values) {
			addCriterion("SEQ in", values, "seq");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andSeqNotIn(List<Long> values) {
			addCriterion("SEQ not in", values, "seq");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andSeqBetween(Long value1, Long value2) {
			addCriterion("SEQ between", value1, value2, "seq");
			return (ValidateRulesExample.Criteria) this;
		}

		public ValidateRulesExample.Criteria andSeqNotBetween(Long value1, Long value2) {
			addCriterion("SEQ not between", value1, value2, "seq");
			return (ValidateRulesExample.Criteria) this;
		}
	}
}