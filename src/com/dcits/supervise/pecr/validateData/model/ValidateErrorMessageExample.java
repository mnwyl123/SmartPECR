package com.dcits.supervise.pecr.validateData.model;

import java.util.ArrayList;
import java.util.List;

public class ValidateErrorMessageExample {
	protected String orderByClause;
	protected boolean distinct;
	protected List<Criteria> oredCriteria;

	public ValidateErrorMessageExample() {
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
		if (!(o instanceof ValidateErrorMessageExample))
			return false;
		ValidateErrorMessageExample other = (ValidateErrorMessageExample) o;
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
		return other instanceof ValidateErrorMessageExample;
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
		return "ValidateErrorMessageExample(orderByClause=" + getOrderByClause() + ", distinct=" + isDistinct()
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

	public static class Criteria extends ValidateErrorMessageExample.GeneratedCriteria {
	}

	protected static abstract class GeneratedCriteria {
		protected List<ValidateErrorMessageExample.Criterion> criteria;

		protected GeneratedCriteria() {
			this.criteria = new ArrayList();
		}

		public boolean isValid() {
			return this.criteria.size() > 0;
		}

		public List<ValidateErrorMessageExample.Criterion> getAllCriteria() {
			return this.criteria;
		}

		public List<ValidateErrorMessageExample.Criterion> getCriteria() {
			return this.criteria;
		}

		protected void addCriterion(String condition) {
			if (condition == null) {
				throw new RuntimeException("Value for condition cannot be null");
			}
			this.criteria.add(new ValidateErrorMessageExample.Criterion(condition));
		}

		protected void addCriterion(String condition, Object value, String property) {
			if (value == null) {
				throw new RuntimeException("Value for " + property + " cannot be null");
			}
			this.criteria.add(new ValidateErrorMessageExample.Criterion(condition, value));
		}

		protected void addCriterion(String condition, Object value1, Object value2, String property) {
			if ((value1 == null) || (value2 == null)) {
				throw new RuntimeException("Between values for " + property + " cannot be null");
			}
			this.criteria.add(new ValidateErrorMessageExample.Criterion(condition, value1, value2));
		}

		public ValidateErrorMessageExample.Criteria andIdIsNull() {
			addCriterion("ID is null");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andIdIsNotNull() {
			addCriterion("ID is not null");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andIdEqualTo(String value) {
			addCriterion("ID =", value, "id");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andIdNotEqualTo(String value) {
			addCriterion("ID <>", value, "id");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andIdGreaterThan(String value) {
			addCriterion("ID >", value, "id");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andIdGreaterThanOrEqualTo(String value) {
			addCriterion("ID >=", value, "id");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andIdLessThan(String value) {
			addCriterion("ID <", value, "id");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andIdLessThanOrEqualTo(String value) {
			addCriterion("ID <=", value, "id");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andIdLike(String value) {
			addCriterion("ID like", value, "id");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andIdNotLike(String value) {
			addCriterion("ID not like", value, "id");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andIdIn(List<String> values) {
			addCriterion("ID in", values, "id");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andIdNotIn(List<String> values) {
			addCriterion("ID not in", values, "id");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andIdBetween(String value1, String value2) {
			addCriterion("ID between", value1, value2, "id");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andIdNotBetween(String value1, String value2) {
			addCriterion("ID not between", value1, value2, "id");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andTablePkIsNull() {
			addCriterion("TABLE_PK is null");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andTablePkIsNotNull() {
			addCriterion("TABLE_PK is not null");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andTablePkEqualTo(String value) {
			addCriterion("TABLE_PK =", value, "tablePk");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andTablePkNotEqualTo(String value) {
			addCriterion("TABLE_PK <>", value, "tablePk");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andTablePkGreaterThan(String value) {
			addCriterion("TABLE_PK >", value, "tablePk");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andTablePkGreaterThanOrEqualTo(String value) {
			addCriterion("TABLE_PK >=", value, "tablePk");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andTablePkLessThan(String value) {
			addCriterion("TABLE_PK <", value, "tablePk");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andTablePkLessThanOrEqualTo(String value) {
			addCriterion("TABLE_PK <=", value, "tablePk");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andTablePkLike(String value) {
			addCriterion("TABLE_PK like", value, "tablePk");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andTablePkNotLike(String value) {
			addCriterion("TABLE_PK not like", value, "tablePk");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andTablePkIn(List<String> values) {
			addCriterion("TABLE_PK in", values, "tablePk");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andTablePkNotIn(List<String> values) {
			addCriterion("TABLE_PK not in", values, "tablePk");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andTablePkBetween(String value1, String value2) {
			addCriterion("TABLE_PK between", value1, value2, "tablePk");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andTablePkNotBetween(String value1, String value2) {
			addCriterion("TABLE_PK not between", value1, value2, "tablePk");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andTableNameIsNull() {
			addCriterion("TABLE_NAME is null");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andTableNameIsNotNull() {
			addCriterion("TABLE_NAME is not null");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andTableNameEqualTo(String value) {
			addCriterion("TABLE_NAME =", value, "tableName");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andTableNameNotEqualTo(String value) {
			addCriterion("TABLE_NAME <>", value, "tableName");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andTableNameGreaterThan(String value) {
			addCriterion("TABLE_NAME >", value, "tableName");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andTableNameGreaterThanOrEqualTo(String value) {
			addCriterion("TABLE_NAME >=", value, "tableName");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andTableNameLessThan(String value) {
			addCriterion("TABLE_NAME <", value, "tableName");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andTableNameLessThanOrEqualTo(String value) {
			addCriterion("TABLE_NAME <=", value, "tableName");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andTableNameLike(String value) {
			addCriterion("TABLE_NAME like", value, "tableName");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andTableNameNotLike(String value) {
			addCriterion("TABLE_NAME not like", value, "tableName");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andTableNameIn(List<String> values) {
			addCriterion("TABLE_NAME in", values, "tableName");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andTableNameNotIn(List<String> values) {
			addCriterion("TABLE_NAME not in", values, "tableName");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andTableNameBetween(String value1, String value2) {
			addCriterion("TABLE_NAME between", value1, value2, "tableName");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andTableNameNotBetween(String value1, String value2) {
			addCriterion("TABLE_NAME not between", value1, value2, "tableName");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andTableFieldIsNull() {
			addCriterion("TABLE_FIELD is null");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andTableFieldIsNotNull() {
			addCriterion("TABLE_FIELD is not null");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andTableFieldEqualTo(String value) {
			addCriterion("TABLE_FIELD =", value, "tableField");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andTableFieldNotEqualTo(String value) {
			addCriterion("TABLE_FIELD <>", value, "tableField");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andTableFieldGreaterThan(String value) {
			addCriterion("TABLE_FIELD >", value, "tableField");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andTableFieldGreaterThanOrEqualTo(String value) {
			addCriterion("TABLE_FIELD >=", value, "tableField");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andTableFieldLessThan(String value) {
			addCriterion("TABLE_FIELD <", value, "tableField");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andTableFieldLessThanOrEqualTo(String value) {
			addCriterion("TABLE_FIELD <=", value, "tableField");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andTableFieldLike(String value) {
			addCriterion("TABLE_FIELD like", value, "tableField");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andTableFieldNotLike(String value) {
			addCriterion("TABLE_FIELD not like", value, "tableField");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andTableFieldIn(List<String> values) {
			addCriterion("TABLE_FIELD in", values, "tableField");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andTableFieldNotIn(List<String> values) {
			addCriterion("TABLE_FIELD not in", values, "tableField");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andTableFieldBetween(String value1, String value2) {
			addCriterion("TABLE_FIELD between", value1, value2, "tableField");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andTableFieldNotBetween(String value1, String value2) {
			addCriterion("TABLE_FIELD not between", value1, value2, "tableField");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andErrorMsgIsNull() {
			addCriterion("ERROR_MSG is null");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andErrorMsgIsNotNull() {
			addCriterion("ERROR_MSG is not null");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andErrorMsgEqualTo(String value) {
			addCriterion("ERROR_MSG =", value, "errorMsg");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andErrorMsgNotEqualTo(String value) {
			addCriterion("ERROR_MSG <>", value, "errorMsg");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andErrorMsgGreaterThan(String value) {
			addCriterion("ERROR_MSG >", value, "errorMsg");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andErrorMsgGreaterThanOrEqualTo(String value) {
			addCriterion("ERROR_MSG >=", value, "errorMsg");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andErrorMsgLessThan(String value) {
			addCriterion("ERROR_MSG <", value, "errorMsg");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andErrorMsgLessThanOrEqualTo(String value) {
			addCriterion("ERROR_MSG <=", value, "errorMsg");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andErrorMsgLike(String value) {
			addCriterion("ERROR_MSG like", value, "errorMsg");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andErrorMsgNotLike(String value) {
			addCriterion("ERROR_MSG not like", value, "errorMsg");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andErrorMsgIn(List<String> values) {
			addCriterion("ERROR_MSG in", values, "errorMsg");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andErrorMsgNotIn(List<String> values) {
			addCriterion("ERROR_MSG not in", values, "errorMsg");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andErrorMsgBetween(String value1, String value2) {
			addCriterion("ERROR_MSG between", value1, value2, "errorMsg");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andErrorMsgNotBetween(String value1, String value2) {
			addCriterion("ERROR_MSG not between", value1, value2, "errorMsg");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andCurDateIsNull() {
			addCriterion("CUR_DATE is null");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andCurDateIsNotNull() {
			addCriterion("CUR_DATE is not null");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andCurDateEqualTo(String value) {
			addCriterion("CUR_DATE =", value, "curDate");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andCurDateNotEqualTo(String value) {
			addCriterion("CUR_DATE <>", value, "curDate");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andCurDateGreaterThan(String value) {
			addCriterion("CUR_DATE >", value, "curDate");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andCurDateGreaterThanOrEqualTo(String value) {
			addCriterion("CUR_DATE >=", value, "curDate");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andCurDateLessThan(String value) {
			addCriterion("CUR_DATE <", value, "curDate");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andCurDateLessThanOrEqualTo(String value) {
			addCriterion("CUR_DATE <=", value, "curDate");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andCurDateLike(String value) {
			addCriterion("CUR_DATE like", value, "curDate");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andCurDateNotLike(String value) {
			addCriterion("CUR_DATE not like", value, "curDate");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andCurDateIn(List<String> values) {
			addCriterion("CUR_DATE in", values, "curDate");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andCurDateNotIn(List<String> values) {
			addCriterion("CUR_DATE not in", values, "curDate");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andCurDateBetween(String value1, String value2) {
			addCriterion("CUR_DATE between", value1, value2, "curDate");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andCurDateNotBetween(String value1, String value2) {
			addCriterion("CUR_DATE not between", value1, value2, "curDate");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andValidateRulesIdIsNull() {
			addCriterion("VALIDATE_RULES_ID is null");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andValidateRulesIdIsNotNull() {
			addCriterion("VALIDATE_RULES_ID is not null");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andValidateRulesIdEqualTo(String value) {
			addCriterion("VALIDATE_RULES_ID =", value, "validateRulesId");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andValidateRulesIdNotEqualTo(String value) {
			addCriterion("VALIDATE_RULES_ID <>", value, "validateRulesId");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andValidateRulesIdGreaterThan(String value) {
			addCriterion("VALIDATE_RULES_ID >", value, "validateRulesId");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andValidateRulesIdGreaterThanOrEqualTo(String value) {
			addCriterion("VALIDATE_RULES_ID >=", value, "validateRulesId");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andValidateRulesIdLessThan(String value) {
			addCriterion("VALIDATE_RULES_ID <", value, "validateRulesId");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andValidateRulesIdLessThanOrEqualTo(String value) {
			addCriterion("VALIDATE_RULES_ID <=", value, "validateRulesId");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andValidateRulesIdLike(String value) {
			addCriterion("VALIDATE_RULES_ID like", value, "validateRulesId");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andValidateRulesIdNotLike(String value) {
			addCriterion("VALIDATE_RULES_ID not like", value, "validateRulesId");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andValidateRulesIdIn(List<String> values) {
			addCriterion("VALIDATE_RULES_ID in", values, "validateRulesId");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andValidateRulesIdNotIn(List<String> values) {
			addCriterion("VALIDATE_RULES_ID not in", values, "validateRulesId");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andValidateRulesIdBetween(String value1, String value2) {
			addCriterion("VALIDATE_RULES_ID between", value1, value2, "validateRulesId");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andValidateRulesIdNotBetween(String value1, String value2) {
			addCriterion("VALIDATE_RULES_ID not between", value1, value2, "validateRulesId");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andVCommentIsNull() {
			addCriterion("V_COMMENT is null");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andVCommentIsNotNull() {
			addCriterion("V_COMMENT is not null");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andVCommentEqualTo(String value) {
			addCriterion("V_COMMENT =", value, "vComment");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andVCommentNotEqualTo(String value) {
			addCriterion("V_COMMENT <>", value, "vComment");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andVCommentGreaterThan(String value) {
			addCriterion("V_COMMENT >", value, "vComment");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andVCommentGreaterThanOrEqualTo(String value) {
			addCriterion("V_COMMENT >=", value, "vComment");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andVCommentLessThan(String value) {
			addCriterion("V_COMMENT <", value, "vComment");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andVCommentLessThanOrEqualTo(String value) {
			addCriterion("V_COMMENT <=", value, "vComment");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andVCommentLike(String value) {
			addCriterion("V_COMMENT like", value, "vComment");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andVCommentNotLike(String value) {
			addCriterion("V_COMMENT not like", value, "vComment");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andVCommentIn(List<String> values) {
			addCriterion("V_COMMENT in", values, "vComment");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andVCommentNotIn(List<String> values) {
			addCriterion("V_COMMENT not in", values, "vComment");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andVCommentBetween(String value1, String value2) {
			addCriterion("V_COMMENT between", value1, value2, "vComment");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andVCommentNotBetween(String value1, String value2) {
			addCriterion("V_COMMENT not between", value1, value2, "vComment");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andBusinessPkIsNull() {
			addCriterion("BUSINESS_PK is null");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andBusinessPkIsNotNull() {
			addCriterion("BUSINESS_PK is not null");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andBusinessPkEqualTo(String value) {
			addCriterion("BUSINESS_PK =", value, "businessPk");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andBusinessPkNotEqualTo(String value) {
			addCriterion("BUSINESS_PK <>", value, "businessPk");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andBusinessPkGreaterThan(String value) {
			addCriterion("BUSINESS_PK >", value, "businessPk");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andBusinessPkGreaterThanOrEqualTo(String value) {
			addCriterion("BUSINESS_PK >=", value, "businessPk");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andBusinessPkLessThan(String value) {
			addCriterion("BUSINESS_PK <", value, "businessPk");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andBusinessPkLessThanOrEqualTo(String value) {
			addCriterion("BUSINESS_PK <=", value, "businessPk");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andBusinessPkLike(String value) {
			addCriterion("BUSINESS_PK like", value, "businessPk");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andBusinessPkNotLike(String value) {
			addCriterion("BUSINESS_PK not like", value, "businessPk");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andBusinessPkIn(List<String> values) {
			addCriterion("BUSINESS_PK in", values, "businessPk");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andBusinessPkNotIn(List<String> values) {
			addCriterion("BUSINESS_PK not in", values, "businessPk");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andBusinessPkBetween(String value1, String value2) {
			addCriterion("BUSINESS_PK between", value1, value2, "businessPk");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andBusinessPkNotBetween(String value1, String value2) {
			addCriterion("BUSINESS_PK not between", value1, value2, "businessPk");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andTableNameCnIsNull() {
			addCriterion("TABLE_NAME_CN is null");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andTableNameCnIsNotNull() {
			addCriterion("TABLE_NAME_CN is not null");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andTableNameCnEqualTo(String value) {
			addCriterion("TABLE_NAME_CN =", value, "tableNameCn");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andTableNameCnNotEqualTo(String value) {
			addCriterion("TABLE_NAME_CN <>", value, "tableNameCn");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andTableNameCnGreaterThan(String value) {
			addCriterion("TABLE_NAME_CN >", value, "tableNameCn");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andTableNameCnGreaterThanOrEqualTo(String value) {
			addCriterion("TABLE_NAME_CN >=", value, "tableNameCn");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andTableNameCnLessThan(String value) {
			addCriterion("TABLE_NAME_CN <", value, "tableNameCn");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andTableNameCnLessThanOrEqualTo(String value) {
			addCriterion("TABLE_NAME_CN <=", value, "tableNameCn");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andTableNameCnLike(String value) {
			addCriterion("TABLE_NAME_CN like", value, "tableNameCn");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andTableNameCnNotLike(String value) {
			addCriterion("TABLE_NAME_CN not like", value, "tableNameCn");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andTableNameCnIn(List<String> values) {
			addCriterion("TABLE_NAME_CN in", values, "tableNameCn");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andTableNameCnNotIn(List<String> values) {
			addCriterion("TABLE_NAME_CN not in", values, "tableNameCn");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andTableNameCnBetween(String value1, String value2) {
			addCriterion("TABLE_NAME_CN between", value1, value2, "tableNameCn");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andTableNameCnNotBetween(String value1, String value2) {
			addCriterion("TABLE_NAME_CN not between", value1, value2, "tableNameCn");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andSubjectIsNull() {
			addCriterion("SUBJECT is null");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andSubjectIsNotNull() {
			addCriterion("SUBJECT is not null");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andSubjectEqualTo(String value) {
			addCriterion("SUBJECT =", value, "subject");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andSubjectNotEqualTo(String value) {
			addCriterion("SUBJECT <>", value, "subject");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andSubjectGreaterThan(String value) {
			addCriterion("SUBJECT >", value, "subject");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andSubjectGreaterThanOrEqualTo(String value) {
			addCriterion("SUBJECT >=", value, "subject");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andSubjectLessThan(String value) {
			addCriterion("SUBJECT <", value, "subject");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andSubjectLessThanOrEqualTo(String value) {
			addCriterion("SUBJECT <=", value, "subject");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andSubjectLike(String value) {
			addCriterion("SUBJECT like", value, "subject");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andSubjectNotLike(String value) {
			addCriterion("SUBJECT not like", value, "subject");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andSubjectIn(List<String> values) {
			addCriterion("SUBJECT in", values, "subject");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andSubjectNotIn(List<String> values) {
			addCriterion("SUBJECT not in", values, "subject");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andSubjectBetween(String value1, String value2) {
			addCriterion("SUBJECT between", value1, value2, "subject");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andSubjectNotBetween(String value1, String value2) {
			addCriterion("SUBJECT not between", value1, value2, "subject");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andIsForceIsNull() {
			addCriterion("IS_FORCE is null");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andIsForceIsNotNull() {
			addCriterion("IS_FORCE is not null");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andIsForceEqualTo(String value) {
			addCriterion("IS_FORCE =", value, "isForce");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andIsForceNotEqualTo(String value) {
			addCriterion("IS_FORCE <>", value, "isForce");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andIsForceGreaterThan(String value) {
			addCriterion("IS_FORCE >", value, "isForce");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andIsForceGreaterThanOrEqualTo(String value) {
			addCriterion("IS_FORCE >=", value, "isForce");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andIsForceLessThan(String value) {
			addCriterion("IS_FORCE <", value, "isForce");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andIsForceLessThanOrEqualTo(String value) {
			addCriterion("IS_FORCE <=", value, "isForce");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andIsForceLike(String value) {
			addCriterion("IS_FORCE like", value, "isForce");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andIsForceNotLike(String value) {
			addCriterion("IS_FORCE not like", value, "isForce");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andIsForceIn(List<String> values) {
			addCriterion("IS_FORCE in", values, "isForce");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andIsForceNotIn(List<String> values) {
			addCriterion("IS_FORCE not in", values, "isForce");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andIsForceBetween(String value1, String value2) {
			addCriterion("IS_FORCE between", value1, value2, "isForce");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andIsForceNotBetween(String value1, String value2) {
			addCriterion("IS_FORCE not between", value1, value2, "isForce");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andIsMultiTableIsNull() {
			addCriterion("IS_MULTI_TABLE is null");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andIsMultiTableIsNotNull() {
			addCriterion("IS_MULTI_TABLE is not null");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andIsMultiTableEqualTo(String value) {
			addCriterion("IS_MULTI_TABLE =", value, "isMultiTable");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andIsMultiTableNotEqualTo(String value) {
			addCriterion("IS_MULTI_TABLE <>", value, "isMultiTable");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andIsMultiTableGreaterThan(String value) {
			addCriterion("IS_MULTI_TABLE >", value, "isMultiTable");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andIsMultiTableGreaterThanOrEqualTo(String value) {
			addCriterion("IS_MULTI_TABLE >=", value, "isMultiTable");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andIsMultiTableLessThan(String value) {
			addCriterion("IS_MULTI_TABLE <", value, "isMultiTable");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andIsMultiTableLessThanOrEqualTo(String value) {
			addCriterion("IS_MULTI_TABLE <=", value, "isMultiTable");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andIsMultiTableLike(String value) {
			addCriterion("IS_MULTI_TABLE like", value, "isMultiTable");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andIsMultiTableNotLike(String value) {
			addCriterion("IS_MULTI_TABLE not like", value, "isMultiTable");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andIsMultiTableIn(List<String> values) {
			addCriterion("IS_MULTI_TABLE in", values, "isMultiTable");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andIsMultiTableNotIn(List<String> values) {
			addCriterion("IS_MULTI_TABLE not in", values, "isMultiTable");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andIsMultiTableBetween(String value1, String value2) {
			addCriterion("IS_MULTI_TABLE between", value1, value2, "isMultiTable");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andIsMultiTableNotBetween(String value1, String value2) {
			addCriterion("IS_MULTI_TABLE not between", value1, value2, "isMultiTable");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andMasterTableIdIsNull() {
			addCriterion("MASTER_TABLE_ID is null");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andMasterTableIdIsNotNull() {
			addCriterion("MASTER_TABLE_ID is not null");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andMasterTableIdEqualTo(String value) {
			addCriterion("MASTER_TABLE_ID =", value, "masterTableId");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andMasterTableIdNotEqualTo(String value) {
			addCriterion("MASTER_TABLE_ID <>", value, "masterTableId");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andMasterTableIdGreaterThan(String value) {
			addCriterion("MASTER_TABLE_ID >", value, "masterTableId");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andMasterTableIdGreaterThanOrEqualTo(String value) {
			addCriterion("MASTER_TABLE_ID >=", value, "masterTableId");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andMasterTableIdLessThan(String value) {
			addCriterion("MASTER_TABLE_ID <", value, "masterTableId");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andMasterTableIdLessThanOrEqualTo(String value) {
			addCriterion("MASTER_TABLE_ID <=", value, "masterTableId");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andMasterTableIdLike(String value) {
			addCriterion("MASTER_TABLE_ID like", value, "masterTableId");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andMasterTableIdNotLike(String value) {
			addCriterion("MASTER_TABLE_ID not like", value, "masterTableId");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andMasterTableIdIn(List<String> values) {
			addCriterion("MASTER_TABLE_ID in", values, "masterTableId");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andMasterTableIdNotIn(List<String> values) {
			addCriterion("MASTER_TABLE_ID not in", values, "masterTableId");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andMasterTableIdBetween(String value1, String value2) {
			addCriterion("MASTER_TABLE_ID between", value1, value2, "masterTableId");
			return (ValidateErrorMessageExample.Criteria) this;
		}

		public ValidateErrorMessageExample.Criteria andMasterTableIdNotBetween(String value1, String value2) {
			addCriterion("MASTER_TABLE_ID not between", value1, value2, "masterTableId");
			return (ValidateErrorMessageExample.Criteria) this;
		}
	}
}