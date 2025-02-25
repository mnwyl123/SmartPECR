package com.dcits.supervise.pecr.validateData.model;

import java.util.ArrayList;
import java.util.List;

public class ValidateTemplateExample {
	protected String orderByClause;
	protected boolean distinct;
	protected List<Criteria> oredCriteria;

	public ValidateTemplateExample() {
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
		if (!(o instanceof ValidateTemplateExample))
			return false;
		ValidateTemplateExample other = (ValidateTemplateExample) o;
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
		return other instanceof ValidateTemplateExample;
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
		return "ValidateTemplateExample(orderByClause=" + getOrderByClause() + ", distinct=" + isDistinct()
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

	public static class Criteria extends ValidateTemplateExample.GeneratedCriteria {
	}

	protected static abstract class GeneratedCriteria {
		protected List<ValidateTemplateExample.Criterion> criteria;

		protected GeneratedCriteria() {
			this.criteria = new ArrayList();
		}

		public boolean isValid() {
			return this.criteria.size() > 0;
		}

		public List<ValidateTemplateExample.Criterion> getAllCriteria() {
			return this.criteria;
		}

		public List<ValidateTemplateExample.Criterion> getCriteria() {
			return this.criteria;
		}

		protected void addCriterion(String condition) {
			if (condition == null) {
				throw new RuntimeException("Value for condition cannot be null");
			}
			this.criteria.add(new ValidateTemplateExample.Criterion(condition));
		}

		protected void addCriterion(String condition, Object value, String property) {
			if (value == null) {
				throw new RuntimeException("Value for " + property + " cannot be null");
			}
			this.criteria.add(new ValidateTemplateExample.Criterion(condition, value));
		}

		protected void addCriterion(String condition, Object value1, Object value2, String property) {
			if ((value1 == null) || (value2 == null)) {
				throw new RuntimeException("Between values for " + property + " cannot be null");
			}
			this.criteria.add(new ValidateTemplateExample.Criterion(condition, value1, value2));
		}

		public ValidateTemplateExample.Criteria andTemplateNameIsNull() {
			addCriterion("TEMPLATE_NAME is null");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andTemplateNameIsNotNull() {
			addCriterion("TEMPLATE_NAME is not null");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andTemplateNameEqualTo(String value) {
			addCriterion("TEMPLATE_NAME =", value, "templateName");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andTemplateNameNotEqualTo(String value) {
			addCriterion("TEMPLATE_NAME <>", value, "templateName");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andTemplateNameGreaterThan(String value) {
			addCriterion("TEMPLATE_NAME >", value, "templateName");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andTemplateNameGreaterThanOrEqualTo(String value) {
			addCriterion("TEMPLATE_NAME >=", value, "templateName");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andTemplateNameLessThan(String value) {
			addCriterion("TEMPLATE_NAME <", value, "templateName");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andTemplateNameLessThanOrEqualTo(String value) {
			addCriterion("TEMPLATE_NAME <=", value, "templateName");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andTemplateNameLike(String value) {
			addCriterion("TEMPLATE_NAME like", value, "templateName");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andTemplateNameNotLike(String value) {
			addCriterion("TEMPLATE_NAME not like", value, "templateName");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andTemplateNameIn(List<String> values) {
			addCriterion("TEMPLATE_NAME in", values, "templateName");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andTemplateNameNotIn(List<String> values) {
			addCriterion("TEMPLATE_NAME not in", values, "templateName");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andTemplateNameBetween(String value1, String value2) {
			addCriterion("TEMPLATE_NAME between", value1, value2, "templateName");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andTemplateNameNotBetween(String value1, String value2) {
			addCriterion("TEMPLATE_NAME not between", value1, value2, "templateName");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andTemplateTypeIsNull() {
			addCriterion("TEMPLATE_TYPE is null");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andTemplateTypeIsNotNull() {
			addCriterion("TEMPLATE_TYPE is not null");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andTemplateTypeEqualTo(String value) {
			addCriterion("TEMPLATE_TYPE =", value, "templateType");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andTemplateTypeNotEqualTo(String value) {
			addCriterion("TEMPLATE_TYPE <>", value, "templateType");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andTemplateTypeGreaterThan(String value) {
			addCriterion("TEMPLATE_TYPE >", value, "templateType");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andTemplateTypeGreaterThanOrEqualTo(String value) {
			addCriterion("TEMPLATE_TYPE >=", value, "templateType");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andTemplateTypeLessThan(String value) {
			addCriterion("TEMPLATE_TYPE <", value, "templateType");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andTemplateTypeLessThanOrEqualTo(String value) {
			addCriterion("TEMPLATE_TYPE <=", value, "templateType");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andTemplateTypeLike(String value) {
			addCriterion("TEMPLATE_TYPE like", value, "templateType");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andTemplateTypeNotLike(String value) {
			addCriterion("TEMPLATE_TYPE not like", value, "templateType");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andTemplateTypeIn(List<String> values) {
			addCriterion("TEMPLATE_TYPE in", values, "templateType");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andTemplateTypeNotIn(List<String> values) {
			addCriterion("TEMPLATE_TYPE not in", values, "templateType");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andTemplateTypeBetween(String value1, String value2) {
			addCriterion("TEMPLATE_TYPE between", value1, value2, "templateType");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andTemplateTypeNotBetween(String value1, String value2) {
			addCriterion("TEMPLATE_TYPE not between", value1, value2, "templateType");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andTemplateCommentIsNull() {
			addCriterion("TEMPLATE_COMMENT is null");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andTemplateCommentIsNotNull() {
			addCriterion("TEMPLATE_COMMENT is not null");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andTemplateCommentEqualTo(String value) {
			addCriterion("TEMPLATE_COMMENT =", value, "templateComment");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andTemplateCommentNotEqualTo(String value) {
			addCriterion("TEMPLATE_COMMENT <>", value, "templateComment");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andTemplateCommentGreaterThan(String value) {
			addCriterion("TEMPLATE_COMMENT >", value, "templateComment");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andTemplateCommentGreaterThanOrEqualTo(String value) {
			addCriterion("TEMPLATE_COMMENT >=", value, "templateComment");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andTemplateCommentLessThan(String value) {
			addCriterion("TEMPLATE_COMMENT <", value, "templateComment");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andTemplateCommentLessThanOrEqualTo(String value) {
			addCriterion("TEMPLATE_COMMENT <=", value, "templateComment");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andTemplateCommentLike(String value) {
			addCriterion("TEMPLATE_COMMENT like", value, "templateComment");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andTemplateCommentNotLike(String value) {
			addCriterion("TEMPLATE_COMMENT not like", value, "templateComment");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andTemplateCommentIn(List<String> values) {
			addCriterion("TEMPLATE_COMMENT in", values, "templateComment");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andTemplateCommentNotIn(List<String> values) {
			addCriterion("TEMPLATE_COMMENT not in", values, "templateComment");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andTemplateCommentBetween(String value1, String value2) {
			addCriterion("TEMPLATE_COMMENT between", value1, value2, "templateComment");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andTemplateCommentNotBetween(String value1, String value2) {
			addCriterion("TEMPLATE_COMMENT not between", value1, value2, "templateComment");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andErrorMsgIsNull() {
			addCriterion("ERROR_MSG is null");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andErrorMsgIsNotNull() {
			addCriterion("ERROR_MSG is not null");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andErrorMsgEqualTo(String value) {
			addCriterion("ERROR_MSG =", value, "errorMsg");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andErrorMsgNotEqualTo(String value) {
			addCriterion("ERROR_MSG <>", value, "errorMsg");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andErrorMsgGreaterThan(String value) {
			addCriterion("ERROR_MSG >", value, "errorMsg");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andErrorMsgGreaterThanOrEqualTo(String value) {
			addCriterion("ERROR_MSG >=", value, "errorMsg");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andErrorMsgLessThan(String value) {
			addCriterion("ERROR_MSG <", value, "errorMsg");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andErrorMsgLessThanOrEqualTo(String value) {
			addCriterion("ERROR_MSG <=", value, "errorMsg");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andErrorMsgLike(String value) {
			addCriterion("ERROR_MSG like", value, "errorMsg");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andErrorMsgNotLike(String value) {
			addCriterion("ERROR_MSG not like", value, "errorMsg");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andErrorMsgIn(List<String> values) {
			addCriterion("ERROR_MSG in", values, "errorMsg");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andErrorMsgNotIn(List<String> values) {
			addCriterion("ERROR_MSG not in", values, "errorMsg");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andErrorMsgBetween(String value1, String value2) {
			addCriterion("ERROR_MSG between", value1, value2, "errorMsg");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andErrorMsgNotBetween(String value1, String value2) {
			addCriterion("ERROR_MSG not between", value1, value2, "errorMsg");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andDatabaseTypeIsNull() {
			addCriterion("DATABASE_TYPE is null");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andDatabaseTypeIsNotNull() {
			addCriterion("DATABASE_TYPE is not null");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andDatabaseTypeEqualTo(String value) {
			addCriterion("DATABASE_TYPE =", value, "databaseType");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andDatabaseTypeNotEqualTo(String value) {
			addCriterion("DATABASE_TYPE <>", value, "databaseType");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andDatabaseTypeGreaterThan(String value) {
			addCriterion("DATABASE_TYPE >", value, "databaseType");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andDatabaseTypeGreaterThanOrEqualTo(String value) {
			addCriterion("DATABASE_TYPE >=", value, "databaseType");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andDatabaseTypeLessThan(String value) {
			addCriterion("DATABASE_TYPE <", value, "databaseType");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andDatabaseTypeLessThanOrEqualTo(String value) {
			addCriterion("DATABASE_TYPE <=", value, "databaseType");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andDatabaseTypeLike(String value) {
			addCriterion("DATABASE_TYPE like", value, "databaseType");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andDatabaseTypeNotLike(String value) {
			addCriterion("DATABASE_TYPE not like", value, "databaseType");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andDatabaseTypeIn(List<String> values) {
			addCriterion("DATABASE_TYPE in", values, "databaseType");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andDatabaseTypeNotIn(List<String> values) {
			addCriterion("DATABASE_TYPE not in", values, "databaseType");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andDatabaseTypeBetween(String value1, String value2) {
			addCriterion("DATABASE_TYPE between", value1, value2, "databaseType");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andDatabaseTypeNotBetween(String value1, String value2) {
			addCriterion("DATABASE_TYPE not between", value1, value2, "databaseType");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andTemplateTplIsNull() {
			addCriterion("TEMPLATE_TPL is null");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andTemplateTplIsNotNull() {
			addCriterion("TEMPLATE_TPL is not null");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andTemplateTplEqualTo(String value) {
			addCriterion("TEMPLATE_TPL =", value, "templateTpl");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andTemplateTplNotEqualTo(String value) {
			addCriterion("TEMPLATE_TPL <>", value, "templateTpl");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andTemplateTplGreaterThan(String value) {
			addCriterion("TEMPLATE_TPL >", value, "templateTpl");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andTemplateTplGreaterThanOrEqualTo(String value) {
			addCriterion("TEMPLATE_TPL >=", value, "templateTpl");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andTemplateTplLessThan(String value) {
			addCriterion("TEMPLATE_TPL <", value, "templateTpl");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andTemplateTplLessThanOrEqualTo(String value) {
			addCriterion("TEMPLATE_TPL <=", value, "templateTpl");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andTemplateTplLike(String value) {
			addCriterion("TEMPLATE_TPL like", value, "templateTpl");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andTemplateTplNotLike(String value) {
			addCriterion("TEMPLATE_TPL not like", value, "templateTpl");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andTemplateTplIn(List<String> values) {
			addCriterion("TEMPLATE_TPL in", values, "templateTpl");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andTemplateTplNotIn(List<String> values) {
			addCriterion("TEMPLATE_TPL not in", values, "templateTpl");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andTemplateTplBetween(String value1, String value2) {
			addCriterion("TEMPLATE_TPL between", value1, value2, "templateTpl");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andTemplateTplNotBetween(String value1, String value2) {
			addCriterion("TEMPLATE_TPL not between", value1, value2, "templateTpl");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andServiceNameIsNull() {
			addCriterion("SERVICE_NAME is null");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andServiceNameIsNotNull() {
			addCriterion("SERVICE_NAME is not null");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andServiceNameEqualTo(String value) {
			addCriterion("SERVICE_NAME =", value, "serviceName");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andServiceNameNotEqualTo(String value) {
			addCriterion("SERVICE_NAME <>", value, "serviceName");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andServiceNameGreaterThan(String value) {
			addCriterion("SERVICE_NAME >", value, "serviceName");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andServiceNameGreaterThanOrEqualTo(String value) {
			addCriterion("SERVICE_NAME >=", value, "serviceName");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andServiceNameLessThan(String value) {
			addCriterion("SERVICE_NAME <", value, "serviceName");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andServiceNameLessThanOrEqualTo(String value) {
			addCriterion("SERVICE_NAME <=", value, "serviceName");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andServiceNameLike(String value) {
			addCriterion("SERVICE_NAME like", value, "serviceName");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andServiceNameNotLike(String value) {
			addCriterion("SERVICE_NAME not like", value, "serviceName");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andServiceNameIn(List<String> values) {
			addCriterion("SERVICE_NAME in", values, "serviceName");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andServiceNameNotIn(List<String> values) {
			addCriterion("SERVICE_NAME not in", values, "serviceName");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andServiceNameBetween(String value1, String value2) {
			addCriterion("SERVICE_NAME between", value1, value2, "serviceName");
			return (ValidateTemplateExample.Criteria) this;
		}

		public ValidateTemplateExample.Criteria andServiceNameNotBetween(String value1, String value2) {
			addCriterion("SERVICE_NAME not between", value1, value2, "serviceName");
			return (ValidateTemplateExample.Criteria) this;
		}
	}
}