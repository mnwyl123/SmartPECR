package com.dcits.supervise.pecr.validateData.model;

import java.util.ArrayList;
import java.util.List;

public class ValidateParameterExample {
	protected String orderByClause;
	protected boolean distinct;
	protected List<Criteria> oredCriteria;

	public ValidateParameterExample() {
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
		if (!(o instanceof ValidateParameterExample))
			return false;
		ValidateParameterExample other = (ValidateParameterExample) o;
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
		return other instanceof ValidateParameterExample;
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
		return "ValidateParameterExample(orderByClause=" + getOrderByClause() + ", distinct=" + isDistinct()
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

	public static class Criteria extends ValidateParameterExample.GeneratedCriteria {
	}

	protected static abstract class GeneratedCriteria {
		protected List<ValidateParameterExample.Criterion> criteria;

		protected GeneratedCriteria() {
			this.criteria = new ArrayList();
		}

		public boolean isValid() {
			return this.criteria.size() > 0;
		}

		public List<ValidateParameterExample.Criterion> getAllCriteria() {
			return this.criteria;
		}

		public List<ValidateParameterExample.Criterion> getCriteria() {
			return this.criteria;
		}

		protected void addCriterion(String condition) {
			if (condition == null) {
				throw new RuntimeException("Value for condition cannot be null");
			}
			this.criteria.add(new ValidateParameterExample.Criterion(condition));
		}

		protected void addCriterion(String condition, Object value, String property) {
			if (value == null) {
				throw new RuntimeException("Value for " + property + " cannot be null");
			}
			this.criteria.add(new ValidateParameterExample.Criterion(condition, value));
		}

		protected void addCriterion(String condition, Object value1, Object value2, String property) {
			if ((value1 == null) || (value2 == null)) {
				throw new RuntimeException("Between values for " + property + " cannot be null");
			}
			this.criteria.add(new ValidateParameterExample.Criterion(condition, value1, value2));
		}

		public ValidateParameterExample.Criteria andParameterNameIsNull() {
			addCriterion("PARAMETER_NAME is null");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andParameterNameIsNotNull() {
			addCriterion("PARAMETER_NAME is not null");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andParameterNameEqualTo(String value) {
			addCriterion("PARAMETER_NAME =", value, "parameterName");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andParameterNameNotEqualTo(String value) {
			addCriterion("PARAMETER_NAME <>", value, "parameterName");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andParameterNameGreaterThan(String value) {
			addCriterion("PARAMETER_NAME >", value, "parameterName");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andParameterNameGreaterThanOrEqualTo(String value) {
			addCriterion("PARAMETER_NAME >=", value, "parameterName");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andParameterNameLessThan(String value) {
			addCriterion("PARAMETER_NAME <", value, "parameterName");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andParameterNameLessThanOrEqualTo(String value) {
			addCriterion("PARAMETER_NAME <=", value, "parameterName");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andParameterNameLike(String value) {
			addCriterion("PARAMETER_NAME like", value, "parameterName");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andParameterNameNotLike(String value) {
			addCriterion("PARAMETER_NAME not like", value, "parameterName");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andParameterNameIn(List<String> values) {
			addCriterion("PARAMETER_NAME in", values, "parameterName");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andParameterNameNotIn(List<String> values) {
			addCriterion("PARAMETER_NAME not in", values, "parameterName");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andParameterNameBetween(String value1, String value2) {
			addCriterion("PARAMETER_NAME between", value1, value2, "parameterName");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andParameterNameNotBetween(String value1, String value2) {
			addCriterion("PARAMETER_NAME not between", value1, value2, "parameterName");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andParameterTypeIsNull() {
			addCriterion("PARAMETER_TYPE is null");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andParameterTypeIsNotNull() {
			addCriterion("PARAMETER_TYPE is not null");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andParameterTypeEqualTo(String value) {
			addCriterion("PARAMETER_TYPE =", value, "parameterType");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andParameterTypeNotEqualTo(String value) {
			addCriterion("PARAMETER_TYPE <>", value, "parameterType");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andParameterTypeGreaterThan(String value) {
			addCriterion("PARAMETER_TYPE >", value, "parameterType");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andParameterTypeGreaterThanOrEqualTo(String value) {
			addCriterion("PARAMETER_TYPE >=", value, "parameterType");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andParameterTypeLessThan(String value) {
			addCriterion("PARAMETER_TYPE <", value, "parameterType");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andParameterTypeLessThanOrEqualTo(String value) {
			addCriterion("PARAMETER_TYPE <=", value, "parameterType");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andParameterTypeLike(String value) {
			addCriterion("PARAMETER_TYPE like", value, "parameterType");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andParameterTypeNotLike(String value) {
			addCriterion("PARAMETER_TYPE not like", value, "parameterType");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andParameterTypeIn(List<String> values) {
			addCriterion("PARAMETER_TYPE in", values, "parameterType");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andParameterTypeNotIn(List<String> values) {
			addCriterion("PARAMETER_TYPE not in", values, "parameterType");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andParameterTypeBetween(String value1, String value2) {
			addCriterion("PARAMETER_TYPE between", value1, value2, "parameterType");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andParameterTypeNotBetween(String value1, String value2) {
			addCriterion("PARAMETER_TYPE not between", value1, value2, "parameterType");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andParameterValueIsNull() {
			addCriterion("PARAMETER_VALUE is null");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andParameterValueIsNotNull() {
			addCriterion("PARAMETER_VALUE is not null");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andParameterValueEqualTo(String value) {
			addCriterion("PARAMETER_VALUE =", value, "parameterValue");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andParameterValueNotEqualTo(String value) {
			addCriterion("PARAMETER_VALUE <>", value, "parameterValue");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andParameterValueGreaterThan(String value) {
			addCriterion("PARAMETER_VALUE >", value, "parameterValue");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andParameterValueGreaterThanOrEqualTo(String value) {
			addCriterion("PARAMETER_VALUE >=", value, "parameterValue");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andParameterValueLessThan(String value) {
			addCriterion("PARAMETER_VALUE <", value, "parameterValue");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andParameterValueLessThanOrEqualTo(String value) {
			addCriterion("PARAMETER_VALUE <=", value, "parameterValue");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andParameterValueLike(String value) {
			addCriterion("PARAMETER_VALUE like", value, "parameterValue");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andParameterValueNotLike(String value) {
			addCriterion("PARAMETER_VALUE not like", value, "parameterValue");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andParameterValueIn(List<String> values) {
			addCriterion("PARAMETER_VALUE in", values, "parameterValue");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andParameterValueNotIn(List<String> values) {
			addCriterion("PARAMETER_VALUE not in", values, "parameterValue");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andParameterValueBetween(String value1, String value2) {
			addCriterion("PARAMETER_VALUE between", value1, value2, "parameterValue");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andParameterValueNotBetween(String value1, String value2) {
			addCriterion("PARAMETER_VALUE not between", value1, value2, "parameterValue");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andParameterCommentIsNull() {
			addCriterion("PARAMETER_COMMENT is null");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andParameterCommentIsNotNull() {
			addCriterion("PARAMETER_COMMENT is not null");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andParameterCommentEqualTo(String value) {
			addCriterion("PARAMETER_COMMENT =", value, "parameterComment");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andParameterCommentNotEqualTo(String value) {
			addCriterion("PARAMETER_COMMENT <>", value, "parameterComment");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andParameterCommentGreaterThan(String value) {
			addCriterion("PARAMETER_COMMENT >", value, "parameterComment");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andParameterCommentGreaterThanOrEqualTo(String value) {
			addCriterion("PARAMETER_COMMENT >=", value, "parameterComment");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andParameterCommentLessThan(String value) {
			addCriterion("PARAMETER_COMMENT <", value, "parameterComment");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andParameterCommentLessThanOrEqualTo(String value) {
			addCriterion("PARAMETER_COMMENT <=", value, "parameterComment");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andParameterCommentLike(String value) {
			addCriterion("PARAMETER_COMMENT like", value, "parameterComment");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andParameterCommentNotLike(String value) {
			addCriterion("PARAMETER_COMMENT not like", value, "parameterComment");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andParameterCommentIn(List<String> values) {
			addCriterion("PARAMETER_COMMENT in", values, "parameterComment");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andParameterCommentNotIn(List<String> values) {
			addCriterion("PARAMETER_COMMENT not in", values, "parameterComment");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andParameterCommentBetween(String value1, String value2) {
			addCriterion("PARAMETER_COMMENT between", value1, value2, "parameterComment");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andParameterCommentNotBetween(String value1, String value2) {
			addCriterion("PARAMETER_COMMENT not between", value1, value2, "parameterComment");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andServiceNameIsNull() {
			addCriterion("SERVICE_NAME is null");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andServiceNameIsNotNull() {
			addCriterion("SERVICE_NAME is not null");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andServiceNameEqualTo(String value) {
			addCriterion("SERVICE_NAME =", value, "serviceName");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andServiceNameNotEqualTo(String value) {
			addCriterion("SERVICE_NAME <>", value, "serviceName");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andServiceNameGreaterThan(String value) {
			addCriterion("SERVICE_NAME >", value, "serviceName");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andServiceNameGreaterThanOrEqualTo(String value) {
			addCriterion("SERVICE_NAME >=", value, "serviceName");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andServiceNameLessThan(String value) {
			addCriterion("SERVICE_NAME <", value, "serviceName");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andServiceNameLessThanOrEqualTo(String value) {
			addCriterion("SERVICE_NAME <=", value, "serviceName");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andServiceNameLike(String value) {
			addCriterion("SERVICE_NAME like", value, "serviceName");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andServiceNameNotLike(String value) {
			addCriterion("SERVICE_NAME not like", value, "serviceName");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andServiceNameIn(List<String> values) {
			addCriterion("SERVICE_NAME in", values, "serviceName");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andServiceNameNotIn(List<String> values) {
			addCriterion("SERVICE_NAME not in", values, "serviceName");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andServiceNameBetween(String value1, String value2) {
			addCriterion("SERVICE_NAME between", value1, value2, "serviceName");
			return (ValidateParameterExample.Criteria) this;
		}

		public ValidateParameterExample.Criteria andServiceNameNotBetween(String value1, String value2) {
			addCriterion("SERVICE_NAME not between", value1, value2, "serviceName");
			return (ValidateParameterExample.Criteria) this;
		}
	}
}