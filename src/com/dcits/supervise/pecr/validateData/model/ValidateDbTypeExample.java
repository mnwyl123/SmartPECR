package com.dcits.supervise.pecr.validateData.model;

import java.util.ArrayList;
import java.util.List;

public class ValidateDbTypeExample {
	protected String orderByClause;
	protected boolean distinct;
	protected List<Criteria> oredCriteria;

	public ValidateDbTypeExample() {
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
		if (!(o instanceof ValidateDbTypeExample))
			return false;
		ValidateDbTypeExample other = (ValidateDbTypeExample) o;
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
		return other instanceof ValidateDbTypeExample;
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
		return "ValidateDbTypeExample(orderByClause=" + getOrderByClause() + ", distinct=" + isDistinct()
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

	public static class Criteria extends ValidateDbTypeExample.GeneratedCriteria {
	}

	protected static abstract class GeneratedCriteria {
		protected List<ValidateDbTypeExample.Criterion> criteria;

		protected GeneratedCriteria() {
			this.criteria = new ArrayList();
		}

		public boolean isValid() {
			return this.criteria.size() > 0;
		}

		public List<ValidateDbTypeExample.Criterion> getAllCriteria() {
			return this.criteria;
		}

		public List<ValidateDbTypeExample.Criterion> getCriteria() {
			return this.criteria;
		}

		protected void addCriterion(String condition) {
			if (condition == null) {
				throw new RuntimeException("Value for condition cannot be null");
			}
			this.criteria.add(new ValidateDbTypeExample.Criterion(condition));
		}

		protected void addCriterion(String condition, Object value, String property) {
			if (value == null) {
				throw new RuntimeException("Value for " + property + " cannot be null");
			}
			this.criteria.add(new ValidateDbTypeExample.Criterion(condition, value));
		}

		protected void addCriterion(String condition, Object value1, Object value2, String property) {
			if ((value1 == null) || (value2 == null)) {
				throw new RuntimeException("Between values for " + property + " cannot be null");
			}
			this.criteria.add(new ValidateDbTypeExample.Criterion(condition, value1, value2));
		}

		public ValidateDbTypeExample.Criteria andDbNameIsNull() {
			addCriterion("DB_NAME is null");
			return (ValidateDbTypeExample.Criteria) this;
		}

		public ValidateDbTypeExample.Criteria andDbNameIsNotNull() {
			addCriterion("DB_NAME is not null");
			return (ValidateDbTypeExample.Criteria) this;
		}

		public ValidateDbTypeExample.Criteria andDbNameEqualTo(String value) {
			addCriterion("DB_NAME =", value, "dbName");
			return (ValidateDbTypeExample.Criteria) this;
		}

		public ValidateDbTypeExample.Criteria andDbNameNotEqualTo(String value) {
			addCriterion("DB_NAME <>", value, "dbName");
			return (ValidateDbTypeExample.Criteria) this;
		}

		public ValidateDbTypeExample.Criteria andDbNameGreaterThan(String value) {
			addCriterion("DB_NAME >", value, "dbName");
			return (ValidateDbTypeExample.Criteria) this;
		}

		public ValidateDbTypeExample.Criteria andDbNameGreaterThanOrEqualTo(String value) {
			addCriterion("DB_NAME >=", value, "dbName");
			return (ValidateDbTypeExample.Criteria) this;
		}

		public ValidateDbTypeExample.Criteria andDbNameLessThan(String value) {
			addCriterion("DB_NAME <", value, "dbName");
			return (ValidateDbTypeExample.Criteria) this;
		}

		public ValidateDbTypeExample.Criteria andDbNameLessThanOrEqualTo(String value) {
			addCriterion("DB_NAME <=", value, "dbName");
			return (ValidateDbTypeExample.Criteria) this;
		}

		public ValidateDbTypeExample.Criteria andDbNameLike(String value) {
			addCriterion("DB_NAME like", value, "dbName");
			return (ValidateDbTypeExample.Criteria) this;
		}

		public ValidateDbTypeExample.Criteria andDbNameNotLike(String value) {
			addCriterion("DB_NAME not like", value, "dbName");
			return (ValidateDbTypeExample.Criteria) this;
		}

		public ValidateDbTypeExample.Criteria andDbNameIn(List<String> values) {
			addCriterion("DB_NAME in", values, "dbName");
			return (ValidateDbTypeExample.Criteria) this;
		}

		public ValidateDbTypeExample.Criteria andDbNameNotIn(List<String> values) {
			addCriterion("DB_NAME not in", values, "dbName");
			return (ValidateDbTypeExample.Criteria) this;
		}

		public ValidateDbTypeExample.Criteria andDbNameBetween(String value1, String value2) {
			addCriterion("DB_NAME between", value1, value2, "dbName");
			return (ValidateDbTypeExample.Criteria) this;
		}

		public ValidateDbTypeExample.Criteria andDbNameNotBetween(String value1, String value2) {
			addCriterion("DB_NAME not between", value1, value2, "dbName");
			return (ValidateDbTypeExample.Criteria) this;
		}

		public ValidateDbTypeExample.Criteria andIsCurrentIsNull() {
			addCriterion("IS_CURRENT is null");
			return (ValidateDbTypeExample.Criteria) this;
		}

		public ValidateDbTypeExample.Criteria andIsCurrentIsNotNull() {
			addCriterion("IS_CURRENT is not null");
			return (ValidateDbTypeExample.Criteria) this;
		}

		public ValidateDbTypeExample.Criteria andIsCurrentEqualTo(String value) {
			addCriterion("IS_CURRENT =", value, "isCurrent");
			return (ValidateDbTypeExample.Criteria) this;
		}

		public ValidateDbTypeExample.Criteria andIsCurrentNotEqualTo(String value) {
			addCriterion("IS_CURRENT <>", value, "isCurrent");
			return (ValidateDbTypeExample.Criteria) this;
		}

		public ValidateDbTypeExample.Criteria andIsCurrentGreaterThan(String value) {
			addCriterion("IS_CURRENT >", value, "isCurrent");
			return (ValidateDbTypeExample.Criteria) this;
		}

		public ValidateDbTypeExample.Criteria andIsCurrentGreaterThanOrEqualTo(String value) {
			addCriterion("IS_CURRENT >=", value, "isCurrent");
			return (ValidateDbTypeExample.Criteria) this;
		}

		public ValidateDbTypeExample.Criteria andIsCurrentLessThan(String value) {
			addCriterion("IS_CURRENT <", value, "isCurrent");
			return (ValidateDbTypeExample.Criteria) this;
		}

		public ValidateDbTypeExample.Criteria andIsCurrentLessThanOrEqualTo(String value) {
			addCriterion("IS_CURRENT <=", value, "isCurrent");
			return (ValidateDbTypeExample.Criteria) this;
		}

		public ValidateDbTypeExample.Criteria andIsCurrentLike(String value) {
			addCriterion("IS_CURRENT like", value, "isCurrent");
			return (ValidateDbTypeExample.Criteria) this;
		}

		public ValidateDbTypeExample.Criteria andIsCurrentNotLike(String value) {
			addCriterion("IS_CURRENT not like", value, "isCurrent");
			return (ValidateDbTypeExample.Criteria) this;
		}

		public ValidateDbTypeExample.Criteria andIsCurrentIn(List<String> values) {
			addCriterion("IS_CURRENT in", values, "isCurrent");
			return (ValidateDbTypeExample.Criteria) this;
		}

		public ValidateDbTypeExample.Criteria andIsCurrentNotIn(List<String> values) {
			addCriterion("IS_CURRENT not in", values, "isCurrent");
			return (ValidateDbTypeExample.Criteria) this;
		}

		public ValidateDbTypeExample.Criteria andIsCurrentBetween(String value1, String value2) {
			addCriterion("IS_CURRENT between", value1, value2, "isCurrent");
			return (ValidateDbTypeExample.Criteria) this;
		}

		public ValidateDbTypeExample.Criteria andIsCurrentNotBetween(String value1, String value2) {
			addCriterion("IS_CURRENT not between", value1, value2, "isCurrent");
			return (ValidateDbTypeExample.Criteria) this;
		}
	}
}
