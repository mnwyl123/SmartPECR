package com.dcits.supervise.pecr.validateData.model;

import java.util.ArrayList;
import java.util.List;

public class ValidateFieldExample {
	protected String orderByClause;
	protected boolean distinct;
	protected List<Criteria> oredCriteria;

	public ValidateFieldExample() {
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
		if (!(o instanceof ValidateFieldExample))
			return false;
		ValidateFieldExample other = (ValidateFieldExample) o;
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
		return other instanceof ValidateFieldExample;
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
		return "ValidateFieldExample(orderByClause=" + getOrderByClause() + ", distinct=" + isDistinct()
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

	public static class Criteria extends ValidateFieldExample.GeneratedCriteria {
	}

	protected static abstract class GeneratedCriteria {
		protected List<ValidateFieldExample.Criterion> criteria;

		protected GeneratedCriteria() {
			this.criteria = new ArrayList();
		}

		public boolean isValid() {
			return this.criteria.size() > 0;
		}

		public List<ValidateFieldExample.Criterion> getAllCriteria() {
			return this.criteria;
		}

		public List<ValidateFieldExample.Criterion> getCriteria() {
			return this.criteria;
		}

		protected void addCriterion(String condition) {
			if (condition == null) {
				throw new RuntimeException("Value for condition cannot be null");
			}
			this.criteria.add(new ValidateFieldExample.Criterion(condition));
		}

		protected void addCriterion(String condition, Object value, String property) {
			if (value == null) {
				throw new RuntimeException("Value for " + property + " cannot be null");
			}
			this.criteria.add(new ValidateFieldExample.Criterion(condition, value));
		}

		protected void addCriterion(String condition, Object value1, Object value2, String property) {
			if ((value1 == null) || (value2 == null)) {
				throw new RuntimeException("Between values for " + property + " cannot be null");
			}
			this.criteria.add(new ValidateFieldExample.Criterion(condition, value1, value2));
		}

		public ValidateFieldExample.Criteria andFieldIdIsNull() {
			addCriterion("FIELD_ID is null");
			return (ValidateFieldExample.Criteria) this;
		}

		public ValidateFieldExample.Criteria andFieldIdIsNotNull() {
			addCriterion("FIELD_ID is not null");
			return (ValidateFieldExample.Criteria) this;
		}

		public ValidateFieldExample.Criteria andFieldIdEqualTo(String value) {
			addCriterion("FIELD_ID =", value, "fieldId");
			return (ValidateFieldExample.Criteria) this;
		}

		public ValidateFieldExample.Criteria andFieldIdNotEqualTo(String value) {
			addCriterion("FIELD_ID <>", value, "fieldId");
			return (ValidateFieldExample.Criteria) this;
		}

		public ValidateFieldExample.Criteria andFieldIdGreaterThan(String value) {
			addCriterion("FIELD_ID >", value, "fieldId");
			return (ValidateFieldExample.Criteria) this;
		}

		public ValidateFieldExample.Criteria andFieldIdGreaterThanOrEqualTo(String value) {
			addCriterion("FIELD_ID >=", value, "fieldId");
			return (ValidateFieldExample.Criteria) this;
		}

		public ValidateFieldExample.Criteria andFieldIdLessThan(String value) {
			addCriterion("FIELD_ID <", value, "fieldId");
			return (ValidateFieldExample.Criteria) this;
		}

		public ValidateFieldExample.Criteria andFieldIdLessThanOrEqualTo(String value) {
			addCriterion("FIELD_ID <=", value, "fieldId");
			return (ValidateFieldExample.Criteria) this;
		}

		public ValidateFieldExample.Criteria andFieldIdLike(String value) {
			addCriterion("FIELD_ID like", value, "fieldId");
			return (ValidateFieldExample.Criteria) this;
		}

		public ValidateFieldExample.Criteria andFieldIdNotLike(String value) {
			addCriterion("FIELD_ID not like", value, "fieldId");
			return (ValidateFieldExample.Criteria) this;
		}

		public ValidateFieldExample.Criteria andFieldIdIn(List<String> values) {
			addCriterion("FIELD_ID in", values, "fieldId");
			return (ValidateFieldExample.Criteria) this;
		}

		public ValidateFieldExample.Criteria andFieldIdNotIn(List<String> values) {
			addCriterion("FIELD_ID not in", values, "fieldId");
			return (ValidateFieldExample.Criteria) this;
		}

		public ValidateFieldExample.Criteria andFieldIdBetween(String value1, String value2) {
			addCriterion("FIELD_ID between", value1, value2, "fieldId");
			return (ValidateFieldExample.Criteria) this;
		}

		public ValidateFieldExample.Criteria andFieldIdNotBetween(String value1, String value2) {
			addCriterion("FIELD_ID not between", value1, value2, "fieldId");
			return (ValidateFieldExample.Criteria) this;
		}

		public ValidateFieldExample.Criteria andTableIdIsNull() {
			addCriterion("TABLE_ID is null");
			return (ValidateFieldExample.Criteria) this;
		}

		public ValidateFieldExample.Criteria andTableIdIsNotNull() {
			addCriterion("TABLE_ID is not null");
			return (ValidateFieldExample.Criteria) this;
		}

		public ValidateFieldExample.Criteria andTableIdEqualTo(String value) {
			addCriterion("TABLE_ID =", value, "tableId");
			return (ValidateFieldExample.Criteria) this;
		}

		public ValidateFieldExample.Criteria andTableIdNotEqualTo(String value) {
			addCriterion("TABLE_ID <>", value, "tableId");
			return (ValidateFieldExample.Criteria) this;
		}

		public ValidateFieldExample.Criteria andTableIdGreaterThan(String value) {
			addCriterion("TABLE_ID >", value, "tableId");
			return (ValidateFieldExample.Criteria) this;
		}

		public ValidateFieldExample.Criteria andTableIdGreaterThanOrEqualTo(String value) {
			addCriterion("TABLE_ID >=", value, "tableId");
			return (ValidateFieldExample.Criteria) this;
		}

		public ValidateFieldExample.Criteria andTableIdLessThan(String value) {
			addCriterion("TABLE_ID <", value, "tableId");
			return (ValidateFieldExample.Criteria) this;
		}

		public ValidateFieldExample.Criteria andTableIdLessThanOrEqualTo(String value) {
			addCriterion("TABLE_ID <=", value, "tableId");
			return (ValidateFieldExample.Criteria) this;
		}

		public ValidateFieldExample.Criteria andTableIdLike(String value) {
			addCriterion("TABLE_ID like", value, "tableId");
			return (ValidateFieldExample.Criteria) this;
		}

		public ValidateFieldExample.Criteria andTableIdNotLike(String value) {
			addCriterion("TABLE_ID not like", value, "tableId");
			return (ValidateFieldExample.Criteria) this;
		}

		public ValidateFieldExample.Criteria andTableIdIn(List<String> values) {
			addCriterion("TABLE_ID in", values, "tableId");
			return (ValidateFieldExample.Criteria) this;
		}

		public ValidateFieldExample.Criteria andTableIdNotIn(List<String> values) {
			addCriterion("TABLE_ID not in", values, "tableId");
			return (ValidateFieldExample.Criteria) this;
		}

		public ValidateFieldExample.Criteria andTableIdBetween(String value1, String value2) {
			addCriterion("TABLE_ID between", value1, value2, "tableId");
			return (ValidateFieldExample.Criteria) this;
		}

		public ValidateFieldExample.Criteria andTableIdNotBetween(String value1, String value2) {
			addCriterion("TABLE_ID not between", value1, value2, "tableId");
			return (ValidateFieldExample.Criteria) this;
		}

		public ValidateFieldExample.Criteria andFieldNameEnIsNull() {
			addCriterion("FIELD_NAME_EN is null");
			return (ValidateFieldExample.Criteria) this;
		}

		public ValidateFieldExample.Criteria andFieldNameEnIsNotNull() {
			addCriterion("FIELD_NAME_EN is not null");
			return (ValidateFieldExample.Criteria) this;
		}

		public ValidateFieldExample.Criteria andFieldNameEnEqualTo(String value) {
			addCriterion("FIELD_NAME_EN =", value, "fieldNameEn");
			return (ValidateFieldExample.Criteria) this;
		}

		public ValidateFieldExample.Criteria andFieldNameEnNotEqualTo(String value) {
			addCriterion("FIELD_NAME_EN <>", value, "fieldNameEn");
			return (ValidateFieldExample.Criteria) this;
		}

		public ValidateFieldExample.Criteria andFieldNameEnGreaterThan(String value) {
			addCriterion("FIELD_NAME_EN >", value, "fieldNameEn");
			return (ValidateFieldExample.Criteria) this;
		}

		public ValidateFieldExample.Criteria andFieldNameEnGreaterThanOrEqualTo(String value) {
			addCriterion("FIELD_NAME_EN >=", value, "fieldNameEn");
			return (ValidateFieldExample.Criteria) this;
		}

		public ValidateFieldExample.Criteria andFieldNameEnLessThan(String value) {
			addCriterion("FIELD_NAME_EN <", value, "fieldNameEn");
			return (ValidateFieldExample.Criteria) this;
		}

		public ValidateFieldExample.Criteria andFieldNameEnLessThanOrEqualTo(String value) {
			addCriterion("FIELD_NAME_EN <=", value, "fieldNameEn");
			return (ValidateFieldExample.Criteria) this;
		}

		public ValidateFieldExample.Criteria andFieldNameEnLike(String value) {
			addCriterion("FIELD_NAME_EN like", value, "fieldNameEn");
			return (ValidateFieldExample.Criteria) this;
		}

		public ValidateFieldExample.Criteria andFieldNameEnNotLike(String value) {
			addCriterion("FIELD_NAME_EN not like", value, "fieldNameEn");
			return (ValidateFieldExample.Criteria) this;
		}

		public ValidateFieldExample.Criteria andFieldNameEnIn(List<String> values) {
			addCriterion("FIELD_NAME_EN in", values, "fieldNameEn");
			return (ValidateFieldExample.Criteria) this;
		}

		public ValidateFieldExample.Criteria andFieldNameEnNotIn(List<String> values) {
			addCriterion("FIELD_NAME_EN not in", values, "fieldNameEn");
			return (ValidateFieldExample.Criteria) this;
		}

		public ValidateFieldExample.Criteria andFieldNameEnBetween(String value1, String value2) {
			addCriterion("FIELD_NAME_EN between", value1, value2, "fieldNameEn");
			return (ValidateFieldExample.Criteria) this;
		}

		public ValidateFieldExample.Criteria andFieldNameEnNotBetween(String value1, String value2) {
			addCriterion("FIELD_NAME_EN not between", value1, value2, "fieldNameEn");
			return (ValidateFieldExample.Criteria) this;
		}

		public ValidateFieldExample.Criteria andFieldNameCnIsNull() {
			addCriterion("FIELD_NAME_CN is null");
			return (ValidateFieldExample.Criteria) this;
		}

		public ValidateFieldExample.Criteria andFieldNameCnIsNotNull() {
			addCriterion("FIELD_NAME_CN is not null");
			return (ValidateFieldExample.Criteria) this;
		}

		public ValidateFieldExample.Criteria andFieldNameCnEqualTo(String value) {
			addCriterion("FIELD_NAME_CN =", value, "fieldNameCn");
			return (ValidateFieldExample.Criteria) this;
		}

		public ValidateFieldExample.Criteria andFieldNameCnNotEqualTo(String value) {
			addCriterion("FIELD_NAME_CN <>", value, "fieldNameCn");
			return (ValidateFieldExample.Criteria) this;
		}

		public ValidateFieldExample.Criteria andFieldNameCnGreaterThan(String value) {
			addCriterion("FIELD_NAME_CN >", value, "fieldNameCn");
			return (ValidateFieldExample.Criteria) this;
		}

		public ValidateFieldExample.Criteria andFieldNameCnGreaterThanOrEqualTo(String value) {
			addCriterion("FIELD_NAME_CN >=", value, "fieldNameCn");
			return (ValidateFieldExample.Criteria) this;
		}

		public ValidateFieldExample.Criteria andFieldNameCnLessThan(String value) {
			addCriterion("FIELD_NAME_CN <", value, "fieldNameCn");
			return (ValidateFieldExample.Criteria) this;
		}

		public ValidateFieldExample.Criteria andFieldNameCnLessThanOrEqualTo(String value) {
			addCriterion("FIELD_NAME_CN <=", value, "fieldNameCn");
			return (ValidateFieldExample.Criteria) this;
		}

		public ValidateFieldExample.Criteria andFieldNameCnLike(String value) {
			addCriterion("FIELD_NAME_CN like", value, "fieldNameCn");
			return (ValidateFieldExample.Criteria) this;
		}

		public ValidateFieldExample.Criteria andFieldNameCnNotLike(String value) {
			addCriterion("FIELD_NAME_CN not like", value, "fieldNameCn");
			return (ValidateFieldExample.Criteria) this;
		}

		public ValidateFieldExample.Criteria andFieldNameCnIn(List<String> values) {
			addCriterion("FIELD_NAME_CN in", values, "fieldNameCn");
			return (ValidateFieldExample.Criteria) this;
		}

		public ValidateFieldExample.Criteria andFieldNameCnNotIn(List<String> values) {
			addCriterion("FIELD_NAME_CN not in", values, "fieldNameCn");
			return (ValidateFieldExample.Criteria) this;
		}

		public ValidateFieldExample.Criteria andFieldNameCnBetween(String value1, String value2) {
			addCriterion("FIELD_NAME_CN between", value1, value2, "fieldNameCn");
			return (ValidateFieldExample.Criteria) this;
		}

		public ValidateFieldExample.Criteria andFieldNameCnNotBetween(String value1, String value2) {
			addCriterion("FIELD_NAME_CN not between", value1, value2, "fieldNameCn");
			return (ValidateFieldExample.Criteria) this;
		}
	}
}