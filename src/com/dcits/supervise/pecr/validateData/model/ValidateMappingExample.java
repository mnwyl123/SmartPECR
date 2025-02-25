package com.dcits.supervise.pecr.validateData.model;

import java.util.ArrayList;
import java.util.List;

public class ValidateMappingExample {
	protected String orderByClause;
	protected boolean distinct;
	protected List<Criteria> oredCriteria;

	public ValidateMappingExample() {
		this.oredCriteria = new ArrayList<>();
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
		if (!(o instanceof ValidateMappingExample))
			return false;
		ValidateMappingExample other = (ValidateMappingExample) o;
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
		return other instanceof ValidateMappingExample;
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
		return "ValidateMappingExample(orderByClause=" + getOrderByClause() + ", distinct=" + isDistinct()
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

	public static class Criteria extends ValidateMappingExample.GeneratedCriteria {
	}

	protected static abstract class GeneratedCriteria {
		protected List<ValidateMappingExample.Criterion> criteria;

		protected GeneratedCriteria() {
			this.criteria = new ArrayList();
		}

		public boolean isValid() {
			return this.criteria.size() > 0;
		}

		public List<ValidateMappingExample.Criterion> getAllCriteria() {
			return this.criteria;
		}

		public List<ValidateMappingExample.Criterion> getCriteria() {
			return this.criteria;
		}

		protected void addCriterion(String condition) {
			if (condition == null) {
				throw new RuntimeException("Value for condition cannot be null");
			}
			this.criteria.add(new ValidateMappingExample.Criterion(condition));
		}

		protected void addCriterion(String condition, Object value, String property) {
			if (value == null) {
				throw new RuntimeException("Value for " + property + " cannot be null");
			}
			this.criteria.add(new ValidateMappingExample.Criterion(condition, value));
		}

		protected void addCriterion(String condition, Object value1, Object value2, String property) {
			if ((value1 == null) || (value2 == null)) {
				throw new RuntimeException("Between values for " + property + " cannot be null");
			}
			this.criteria.add(new ValidateMappingExample.Criterion(condition, value1, value2));
		}

		public ValidateMappingExample.Criteria andIdIsNull() {
			addCriterion("ID is null");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andIdIsNotNull() {
			addCriterion("ID is not null");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andIdEqualTo(String value) {
			addCriterion("ID =", value, "id");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andIdNotEqualTo(String value) {
			addCriterion("ID <>", value, "id");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andIdGreaterThan(String value) {
			addCriterion("ID >", value, "id");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andIdGreaterThanOrEqualTo(String value) {
			addCriterion("ID >=", value, "id");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andIdLessThan(String value) {
			addCriterion("ID <", value, "id");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andIdLessThanOrEqualTo(String value) {
			addCriterion("ID <=", value, "id");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andIdLike(String value) {
			addCriterion("ID like", value, "id");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andIdNotLike(String value) {
			addCriterion("ID not like", value, "id");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andIdIn(List<String> values) {
			addCriterion("ID in", values, "id");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andIdNotIn(List<String> values) {
			addCriterion("ID not in", values, "id");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andIdBetween(String value1, String value2) {
			addCriterion("ID between", value1, value2, "id");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andIdNotBetween(String value1, String value2) {
			addCriterion("ID not between", value1, value2, "id");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andValidateRulesIdIsNull() {
			addCriterion("VALIDATE_RULES_ID is null");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andValidateRulesIdIsNotNull() {
			addCriterion("VALIDATE_RULES_ID is not null");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andValidateRulesIdEqualTo(String value) {
			addCriterion("VALIDATE_RULES_ID =", value, "validateRulesId");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andValidateRulesIdNotEqualTo(String value) {
			addCriterion("VALIDATE_RULES_ID <>", value, "validateRulesId");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andValidateRulesIdGreaterThan(String value) {
			addCriterion("VALIDATE_RULES_ID >", value, "validateRulesId");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andValidateRulesIdGreaterThanOrEqualTo(String value) {
			addCriterion("VALIDATE_RULES_ID >=", value, "validateRulesId");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andValidateRulesIdLessThan(String value) {
			addCriterion("VALIDATE_RULES_ID <", value, "validateRulesId");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andValidateRulesIdLessThanOrEqualTo(String value) {
			addCriterion("VALIDATE_RULES_ID <=", value, "validateRulesId");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andValidateRulesIdLike(String value) {
			addCriterion("VALIDATE_RULES_ID like", value, "validateRulesId");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andValidateRulesIdNotLike(String value) {
			addCriterion("VALIDATE_RULES_ID not like", value, "validateRulesId");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andValidateRulesIdIn(List<String> values) {
			addCriterion("VALIDATE_RULES_ID in", values, "validateRulesId");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andValidateRulesIdNotIn(List<String> values) {
			addCriterion("VALIDATE_RULES_ID not in", values, "validateRulesId");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andValidateRulesIdBetween(String value1, String value2) {
			addCriterion("VALIDATE_RULES_ID between", value1, value2, "validateRulesId");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andValidateRulesIdNotBetween(String value1, String value2) {
			addCriterion("VALIDATE_RULES_ID not between", value1, value2, "validateRulesId");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andValidateParameterNameIsNull() {
			addCriterion("VALIDATE_PARAMETER_NAME is null");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andValidateParameterNameIsNotNull() {
			addCriterion("VALIDATE_PARAMETER_NAME is not null");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andValidateParameterNameEqualTo(String value) {
			addCriterion("VALIDATE_PARAMETER_NAME =", value, "validateParameterName");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andValidateParameterNameNotEqualTo(String value) {
			addCriterion("VALIDATE_PARAMETER_NAME <>", value, "validateParameterName");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andValidateParameterNameGreaterThan(String value) {
			addCriterion("VALIDATE_PARAMETER_NAME >", value, "validateParameterName");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andValidateParameterNameGreaterThanOrEqualTo(String value) {
			addCriterion("VALIDATE_PARAMETER_NAME >=", value, "validateParameterName");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andValidateParameterNameLessThan(String value) {
			addCriterion("VALIDATE_PARAMETER_NAME <", value, "validateParameterName");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andValidateParameterNameLessThanOrEqualTo(String value) {
			addCriterion("VALIDATE_PARAMETER_NAME <=", value, "validateParameterName");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andValidateParameterNameLike(String value) {
			addCriterion("VALIDATE_PARAMETER_NAME like", value, "validateParameterName");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andValidateParameterNameNotLike(String value) {
			addCriterion("VALIDATE_PARAMETER_NAME not like", value, "validateParameterName");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andValidateParameterNameIn(List<String> values) {
			addCriterion("VALIDATE_PARAMETER_NAME in", values, "validateParameterName");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andValidateParameterNameNotIn(List<String> values) {
			addCriterion("VALIDATE_PARAMETER_NAME not in", values, "validateParameterName");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andValidateParameterNameBetween(String value1, String value2) {
			addCriterion("VALIDATE_PARAMETER_NAME between", value1, value2, "validateParameterName");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andValidateParameterNameNotBetween(String value1, String value2) {
			addCriterion("VALIDATE_PARAMETER_NAME not between", value1, value2, "validateParameterName");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andTemplateMappingNameIsNull() {
			addCriterion("TEMPLATE_MAPPING_NAME is null");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andTemplateMappingNameIsNotNull() {
			addCriterion("TEMPLATE_MAPPING_NAME is not null");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andTemplateMappingNameEqualTo(String value) {
			addCriterion("TEMPLATE_MAPPING_NAME =", value, "templateMappingName");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andTemplateMappingNameNotEqualTo(String value) {
			addCriterion("TEMPLATE_MAPPING_NAME <>", value, "templateMappingName");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andTemplateMappingNameGreaterThan(String value) {
			addCriterion("TEMPLATE_MAPPING_NAME >", value, "templateMappingName");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andTemplateMappingNameGreaterThanOrEqualTo(String value) {
			addCriterion("TEMPLATE_MAPPING_NAME >=", value, "templateMappingName");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andTemplateMappingNameLessThan(String value) {
			addCriterion("TEMPLATE_MAPPING_NAME <", value, "templateMappingName");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andTemplateMappingNameLessThanOrEqualTo(String value) {
			addCriterion("TEMPLATE_MAPPING_NAME <=", value, "templateMappingName");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andTemplateMappingNameLike(String value) {
			addCriterion("TEMPLATE_MAPPING_NAME like", value, "templateMappingName");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andTemplateMappingNameNotLike(String value) {
			addCriterion("TEMPLATE_MAPPING_NAME not like", value, "templateMappingName");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andTemplateMappingNameIn(List<String> values) {
			addCriterion("TEMPLATE_MAPPING_NAME in", values, "templateMappingName");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andTemplateMappingNameNotIn(List<String> values) {
			addCriterion("TEMPLATE_MAPPING_NAME not in", values, "templateMappingName");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andTemplateMappingNameBetween(String value1, String value2) {
			addCriterion("TEMPLATE_MAPPING_NAME between", value1, value2, "templateMappingName");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andTemplateMappingNameNotBetween(String value1, String value2) {
			addCriterion("TEMPLATE_MAPPING_NAME not between", value1, value2, "templateMappingName");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andValidateMappingCommentIsNull() {
			addCriterion("VALIDATE_MAPPING_COMMENT is null");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andValidateMappingCommentIsNotNull() {
			addCriterion("VALIDATE_MAPPING_COMMENT is not null");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andValidateMappingCommentEqualTo(String value) {
			addCriterion("VALIDATE_MAPPING_COMMENT =", value, "validateMappingComment");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andValidateMappingCommentNotEqualTo(String value) {
			addCriterion("VALIDATE_MAPPING_COMMENT <>", value, "validateMappingComment");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andValidateMappingCommentGreaterThan(String value) {
			addCriterion("VALIDATE_MAPPING_COMMENT >", value, "validateMappingComment");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andValidateMappingCommentGreaterThanOrEqualTo(String value) {
			addCriterion("VALIDATE_MAPPING_COMMENT >=", value, "validateMappingComment");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andValidateMappingCommentLessThan(String value) {
			addCriterion("VALIDATE_MAPPING_COMMENT <", value, "validateMappingComment");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andValidateMappingCommentLessThanOrEqualTo(String value) {
			addCriterion("VALIDATE_MAPPING_COMMENT <=", value, "validateMappingComment");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andValidateMappingCommentLike(String value) {
			addCriterion("VALIDATE_MAPPING_COMMENT like", value, "validateMappingComment");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andValidateMappingCommentNotLike(String value) {
			addCriterion("VALIDATE_MAPPING_COMMENT not like", value, "validateMappingComment");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andValidateMappingCommentIn(List<String> values) {
			addCriterion("VALIDATE_MAPPING_COMMENT in", values, "validateMappingComment");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andValidateMappingCommentNotIn(List<String> values) {
			addCriterion("VALIDATE_MAPPING_COMMENT not in", values, "validateMappingComment");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andValidateMappingCommentBetween(String value1, String value2) {
			addCriterion("VALIDATE_MAPPING_COMMENT between", value1, value2, "validateMappingComment");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andValidateMappingCommentNotBetween(String value1, String value2) {
			addCriterion("VALIDATE_MAPPING_COMMENT not between", value1, value2, "validateMappingComment");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andValidateMappingTypeIsNull() {
			addCriterion("VALIDATE_MAPPING_TYPE is null");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andValidateMappingTypeIsNotNull() {
			addCriterion("VALIDATE_MAPPING_TYPE is not null");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andValidateMappingTypeEqualTo(String value) {
			addCriterion("VALIDATE_MAPPING_TYPE =", value, "validateMappingType");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andValidateMappingTypeNotEqualTo(String value) {
			addCriterion("VALIDATE_MAPPING_TYPE <>", value, "validateMappingType");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andValidateMappingTypeGreaterThan(String value) {
			addCriterion("VALIDATE_MAPPING_TYPE >", value, "validateMappingType");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andValidateMappingTypeGreaterThanOrEqualTo(String value) {
			addCriterion("VALIDATE_MAPPING_TYPE >=", value, "validateMappingType");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andValidateMappingTypeLessThan(String value) {
			addCriterion("VALIDATE_MAPPING_TYPE <", value, "validateMappingType");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andValidateMappingTypeLessThanOrEqualTo(String value) {
			addCriterion("VALIDATE_MAPPING_TYPE <=", value, "validateMappingType");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andValidateMappingTypeLike(String value) {
			addCriterion("VALIDATE_MAPPING_TYPE like", value, "validateMappingType");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andValidateMappingTypeNotLike(String value) {
			addCriterion("VALIDATE_MAPPING_TYPE not like", value, "validateMappingType");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andValidateMappingTypeIn(List<String> values) {
			addCriterion("VALIDATE_MAPPING_TYPE in", values, "validateMappingType");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andValidateMappingTypeNotIn(List<String> values) {
			addCriterion("VALIDATE_MAPPING_TYPE not in", values, "validateMappingType");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andValidateMappingTypeBetween(String value1, String value2) {
			addCriterion("VALIDATE_MAPPING_TYPE between", value1, value2, "validateMappingType");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andValidateMappingTypeNotBetween(String value1, String value2) {
			addCriterion("VALIDATE_MAPPING_TYPE not between", value1, value2, "validateMappingType");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andSeqIsNull() {
			addCriterion("SEQ is null");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andSeqIsNotNull() {
			addCriterion("SEQ is not null");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andSeqEqualTo(Long value) {
			addCriterion("SEQ =", value, "seq");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andSeqNotEqualTo(Long value) {
			addCriterion("SEQ <>", value, "seq");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andSeqGreaterThan(Long value) {
			addCriterion("SEQ >", value, "seq");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andSeqGreaterThanOrEqualTo(Long value) {
			addCriterion("SEQ >=", value, "seq");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andSeqLessThan(Long value) {
			addCriterion("SEQ <", value, "seq");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andSeqLessThanOrEqualTo(Long value) {
			addCriterion("SEQ <=", value, "seq");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andSeqIn(List<Long> values) {
			addCriterion("SEQ in", values, "seq");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andSeqNotIn(List<Long> values) {
			addCriterion("SEQ not in", values, "seq");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andSeqBetween(Long value1, Long value2) {
			addCriterion("SEQ between", value1, value2, "seq");
			return (ValidateMappingExample.Criteria) this;
		}

		public ValidateMappingExample.Criteria andSeqNotBetween(Long value1, Long value2) {
			addCriterion("SEQ not between", value1, value2, "seq");
			return (ValidateMappingExample.Criteria) this;
		}
	}
}