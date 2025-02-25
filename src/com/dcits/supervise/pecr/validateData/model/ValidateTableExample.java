package com.dcits.supervise.pecr.validateData.model;

import java.util.ArrayList;
import java.util.List;

public class ValidateTableExample {
	protected String orderByClause;
	protected boolean distinct;
	protected List<Criteria> oredCriteria;

	public ValidateTableExample() {
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
		if (!(o instanceof ValidateTableExample))
			return false;
		ValidateTableExample other = (ValidateTableExample) o;
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
		return other instanceof ValidateTableExample;
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
		return "ValidateTableExample(orderByClause=" + getOrderByClause() + ", distinct=" + isDistinct()
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

	public static class Criteria extends ValidateTableExample.GeneratedCriteria {
	}

	protected static abstract class GeneratedCriteria {
		protected List<ValidateTableExample.Criterion> criteria;

		protected GeneratedCriteria() {
			this.criteria = new ArrayList();
		}

		public boolean isValid() {
			return this.criteria.size() > 0;
		}

		public List<ValidateTableExample.Criterion> getAllCriteria() {
			return this.criteria;
		}

		public List<ValidateTableExample.Criterion> getCriteria() {
			return this.criteria;
		}

		protected void addCriterion(String condition) {
			if (condition == null) {
				throw new RuntimeException("Value for condition cannot be null");
			}
			this.criteria.add(new ValidateTableExample.Criterion(condition));
		}

		protected void addCriterion(String condition, Object value, String property) {
			if (value == null) {
				throw new RuntimeException("Value for " + property + " cannot be null");
			}
			this.criteria.add(new ValidateTableExample.Criterion(condition, value));
		}

		protected void addCriterion(String condition, Object value1, Object value2, String property) {
			if ((value1 == null) || (value2 == null)) {
				throw new RuntimeException("Between values for " + property + " cannot be null");
			}
			this.criteria.add(new ValidateTableExample.Criterion(condition, value1, value2));
		}

		public ValidateTableExample.Criteria andTableIdIsNull() {
			addCriterion("TABLE_ID is null");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andTableIdIsNotNull() {
			addCriterion("TABLE_ID is not null");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andTableIdEqualTo(String value) {
			addCriterion("TABLE_ID =", value, "tableId");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andTableIdNotEqualTo(String value) {
			addCriterion("TABLE_ID <>", value, "tableId");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andTableIdGreaterThan(String value) {
			addCriterion("TABLE_ID >", value, "tableId");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andTableIdGreaterThanOrEqualTo(String value) {
			addCriterion("TABLE_ID >=", value, "tableId");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andTableIdLessThan(String value) {
			addCriterion("TABLE_ID <", value, "tableId");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andTableIdLessThanOrEqualTo(String value) {
			addCriterion("TABLE_ID <=", value, "tableId");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andTableIdLike(String value) {
			addCriterion("TABLE_ID like", value, "tableId");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andTableIdNotLike(String value) {
			addCriterion("TABLE_ID not like", value, "tableId");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andTableIdIn(List<String> values) {
			addCriterion("TABLE_ID in", values, "tableId");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andTableIdNotIn(List<String> values) {
			addCriterion("TABLE_ID not in", values, "tableId");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andTableIdBetween(String value1, String value2) {
			addCriterion("TABLE_ID between", value1, value2, "tableId");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andTableIdNotBetween(String value1, String value2) {
			addCriterion("TABLE_ID not between", value1, value2, "tableId");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andTableNameEnIsNull() {
			addCriterion("TABLE_NAME_EN is null");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andTableNameEnIsNotNull() {
			addCriterion("TABLE_NAME_EN is not null");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andTableNameEnEqualTo(String value) {
			addCriterion("TABLE_NAME_EN =", value, "tableNameEn");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andTableNameEnNotEqualTo(String value) {
			addCriterion("TABLE_NAME_EN <>", value, "tableNameEn");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andTableNameEnGreaterThan(String value) {
			addCriterion("TABLE_NAME_EN >", value, "tableNameEn");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andTableNameEnGreaterThanOrEqualTo(String value) {
			addCriterion("TABLE_NAME_EN >=", value, "tableNameEn");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andTableNameEnLessThan(String value) {
			addCriterion("TABLE_NAME_EN <", value, "tableNameEn");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andTableNameEnLessThanOrEqualTo(String value) {
			addCriterion("TABLE_NAME_EN <=", value, "tableNameEn");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andTableNameEnLike(String value) {
			addCriterion("TABLE_NAME_EN like", value, "tableNameEn");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andTableNameEnNotLike(String value) {
			addCriterion("TABLE_NAME_EN not like", value, "tableNameEn");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andTableNameEnIn(List<String> values) {
			addCriterion("TABLE_NAME_EN in", values, "tableNameEn");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andTableNameEnNotIn(List<String> values) {
			addCriterion("TABLE_NAME_EN not in", values, "tableNameEn");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andTableNameEnBetween(String value1, String value2) {
			addCriterion("TABLE_NAME_EN between", value1, value2, "tableNameEn");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andTableNameEnNotBetween(String value1, String value2) {
			addCriterion("TABLE_NAME_EN not between", value1, value2, "tableNameEn");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andTableNameCnIsNull() {
			addCriterion("TABLE_NAME_CN is null");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andTableNameCnIsNotNull() {
			addCriterion("TABLE_NAME_CN is not null");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andTableNameCnEqualTo(String value) {
			addCriterion("TABLE_NAME_CN =", value, "tableNameCn");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andTableNameCnNotEqualTo(String value) {
			addCriterion("TABLE_NAME_CN <>", value, "tableNameCn");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andTableNameCnGreaterThan(String value) {
			addCriterion("TABLE_NAME_CN >", value, "tableNameCn");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andTableNameCnGreaterThanOrEqualTo(String value) {
			addCriterion("TABLE_NAME_CN >=", value, "tableNameCn");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andTableNameCnLessThan(String value) {
			addCriterion("TABLE_NAME_CN <", value, "tableNameCn");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andTableNameCnLessThanOrEqualTo(String value) {
			addCriterion("TABLE_NAME_CN <=", value, "tableNameCn");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andTableNameCnLike(String value) {
			addCriterion("TABLE_NAME_CN like", value, "tableNameCn");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andTableNameCnNotLike(String value) {
			addCriterion("TABLE_NAME_CN not like", value, "tableNameCn");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andTableNameCnIn(List<String> values) {
			addCriterion("TABLE_NAME_CN in", values, "tableNameCn");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andTableNameCnNotIn(List<String> values) {
			addCriterion("TABLE_NAME_CN not in", values, "tableNameCn");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andTableNameCnBetween(String value1, String value2) {
			addCriterion("TABLE_NAME_CN between", value1, value2, "tableNameCn");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andTableNameCnNotBetween(String value1, String value2) {
			addCriterion("TABLE_NAME_CN not between", value1, value2, "tableNameCn");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andMasterTableEnIsNull() {
			addCriterion("MASTER_TABLE_EN is null");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andMasterTableEnIsNotNull() {
			addCriterion("MASTER_TABLE_EN is not null");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andMasterTableEnEqualTo(String value) {
			addCriterion("MASTER_TABLE_EN =", value, "masterTableEn");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andMasterTableEnNotEqualTo(String value) {
			addCriterion("MASTER_TABLE_EN <>", value, "masterTableEn");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andMasterTableEnGreaterThan(String value) {
			addCriterion("MASTER_TABLE_EN >", value, "masterTableEn");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andMasterTableEnGreaterThanOrEqualTo(String value) {
			addCriterion("MASTER_TABLE_EN >=", value, "masterTableEn");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andMasterTableEnLessThan(String value) {
			addCriterion("MASTER_TABLE_EN <", value, "masterTableEn");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andMasterTableEnLessThanOrEqualTo(String value) {
			addCriterion("MASTER_TABLE_EN <=", value, "masterTableEn");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andMasterTableEnLike(String value) {
			addCriterion("MASTER_TABLE_EN like", value, "masterTableEn");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andMasterTableEnNotLike(String value) {
			addCriterion("MASTER_TABLE_EN not like", value, "masterTableEn");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andMasterTableEnIn(List<String> values) {
			addCriterion("MASTER_TABLE_EN in", values, "masterTableEn");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andMasterTableEnNotIn(List<String> values) {
			addCriterion("MASTER_TABLE_EN not in", values, "masterTableEn");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andMasterTableEnBetween(String value1, String value2) {
			addCriterion("MASTER_TABLE_EN between", value1, value2, "masterTableEn");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andMasterTableEnNotBetween(String value1, String value2) {
			addCriterion("MASTER_TABLE_EN not between", value1, value2, "masterTableEn");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andMasterTablePkIsNull() {
			addCriterion("MASTER_TABLE_PK is null");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andMasterTablePkIsNotNull() {
			addCriterion("MASTER_TABLE_PK is not null");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andMasterTablePkEqualTo(String value) {
			addCriterion("MASTER_TABLE_PK =", value, "masterTablePk");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andMasterTablePkNotEqualTo(String value) {
			addCriterion("MASTER_TABLE_PK <>", value, "masterTablePk");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andMasterTablePkGreaterThan(String value) {
			addCriterion("MASTER_TABLE_PK >", value, "masterTablePk");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andMasterTablePkGreaterThanOrEqualTo(String value) {
			addCriterion("MASTER_TABLE_PK >=", value, "masterTablePk");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andMasterTablePkLessThan(String value) {
			addCriterion("MASTER_TABLE_PK <", value, "masterTablePk");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andMasterTablePkLessThanOrEqualTo(String value) {
			addCriterion("MASTER_TABLE_PK <=", value, "masterTablePk");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andMasterTablePkLike(String value) {
			addCriterion("MASTER_TABLE_PK like", value, "masterTablePk");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andMasterTablePkNotLike(String value) {
			addCriterion("MASTER_TABLE_PK not like", value, "masterTablePk");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andMasterTablePkIn(List<String> values) {
			addCriterion("MASTER_TABLE_PK in", values, "masterTablePk");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andMasterTablePkNotIn(List<String> values) {
			addCriterion("MASTER_TABLE_PK not in", values, "masterTablePk");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andMasterTablePkBetween(String value1, String value2) {
			addCriterion("MASTER_TABLE_PK between", value1, value2, "masterTablePk");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andMasterTablePkNotBetween(String value1, String value2) {
			addCriterion("MASTER_TABLE_PK not between", value1, value2, "masterTablePk");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andTbalePkIsNull() {
			addCriterion("TBALE_PK is null");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andTbalePkIsNotNull() {
			addCriterion("TBALE_PK is not null");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andTbalePkEqualTo(String value) {
			addCriterion("TBALE_PK =", value, "tbalePk");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andTbalePkNotEqualTo(String value) {
			addCriterion("TBALE_PK <>", value, "tbalePk");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andTbalePkGreaterThan(String value) {
			addCriterion("TBALE_PK >", value, "tbalePk");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andTbalePkGreaterThanOrEqualTo(String value) {
			addCriterion("TBALE_PK >=", value, "tbalePk");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andTbalePkLessThan(String value) {
			addCriterion("TBALE_PK <", value, "tbalePk");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andTbalePkLessThanOrEqualTo(String value) {
			addCriterion("TBALE_PK <=", value, "tbalePk");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andTbalePkLike(String value) {
			addCriterion("TBALE_PK like", value, "tbalePk");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andTbalePkNotLike(String value) {
			addCriterion("TBALE_PK not like", value, "tbalePk");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andTbalePkIn(List<String> values) {
			addCriterion("TBALE_PK in", values, "tbalePk");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andTbalePkNotIn(List<String> values) {
			addCriterion("TBALE_PK not in", values, "tbalePk");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andTbalePkBetween(String value1, String value2) {
			addCriterion("TBALE_PK between", value1, value2, "tbalePk");
			return (ValidateTableExample.Criteria) this;
		}

		public ValidateTableExample.Criteria andTbalePkNotBetween(String value1, String value2) {
			addCriterion("TBALE_PK not between", value1, value2, "tbalePk");
			return (ValidateTableExample.Criteria) this;
		}
	}
}