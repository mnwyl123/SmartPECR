package com.dcits.supervise.pecr.feedbackreport.entity;

import java.io.Serializable;

public class FeedBackReportErrorMessage implements Serializable {

	// ("feedBackReportErrorMessIdnull")
	private String feedBackReportErrorMessId;

	// ("feedBackReportCodeId反馈报文错误码主键")
	private String feedBackReportCodeId;

	// ("errorMessage错误信息")
	private String errorMessage;

	// ("recordId记录ID")
	private String recordId;

	// ("reportMessageId报文ID")
	private String reportMessageId;

	// ("reportMessageType记录类型")
	private String reportMessageType;

	// ("createTime创建时间")
	private String createTime;

	// ("reportMessageName报文名称")
	private String reportMessageName;

	// ("feedBackReportName反馈报文名称")
	private String feedBackReportName;

	// ("fbCode反馈代码")
	private String fbCode;
	
	// ("报送信息id")
	private String recordBsId;

	// ("fbTag反馈标签")
	private String fbTag;
	// ("isCheck区分0：预处理还是  1:反馈报文")
	private String isCheck;
	
	private String company;
	//(1：已补录且检验成功；0：待补录。)
	private String isEdit;
	
	private static final long serialVersionUID = 1L;

	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append(getClass().getSimpleName());
		sb.append(" [");
		sb.append("Hash = ").append(hashCode());
		sb.append(", feedBackReportErrorMessId=").append(this.feedBackReportErrorMessId);
		sb.append(", feedBackReportCodeId=").append(this.feedBackReportCodeId);
		sb.append(", errorMessage=").append(this.errorMessage);
		sb.append(", recordId=").append(this.recordId);
		sb.append(", reportMessageId=").append(this.reportMessageId);
		sb.append(", reportMessageType=").append(this.reportMessageType);
		sb.append(", createTime=").append(this.createTime);
		sb.append(", reportMessageName=").append(this.reportMessageName);
		sb.append(", feedBackReportName=").append(this.feedBackReportName);
		sb.append(", fbCode=").append(this.fbCode);
		sb.append(", fbTag=").append(this.fbTag);
		sb.append(", isCheck=").append(this.isCheck);
		sb.append(", isEdit=").append(this.isEdit);
		sb.append(", serialVersionUID=").append(1L);
		sb.append("]");
		return sb.toString();
	}
	
	public String getIsEdit() {
		return isEdit;
	}

	public void setIsEdit(String isEdit) {
		this.isEdit = isEdit;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getIsCheck() {
		return isCheck;
	}

	public String getRecordBsId() {
		return recordBsId;
	}

	public void setRecordBsId(String recordBsId) {
		this.recordBsId = recordBsId;
	}

	public void setIsCheck(String isCheck) {
		this.isCheck = isCheck;
	}

	public String getFeedBackReportErrorMessId() {
		return this.feedBackReportErrorMessId;
	}

	public String getFeedBackReportCodeId() {
		return this.feedBackReportCodeId;
	}

	public String getErrorMessage() {
		return this.errorMessage;
	}

	public String getRecordId() {
		return this.recordId;
	}

	public String getReportMessageId() {
		return this.reportMessageId;
	}

	public String getReportMessageType() {
		return this.reportMessageType;
	}

	public String getCreateTime() {
		return this.createTime;
	}

	public String getReportMessageName() {
		return this.reportMessageName;
	}

	public String getFeedBackReportName() {
		return this.feedBackReportName;
	}

	public String getFbCode() {
		return this.fbCode;
	}

	public String getFbTag() {
		return this.fbTag;
	}

	public void setFeedBackReportErrorMessId(String feedBackReportErrorMessId) {
		this.feedBackReportErrorMessId = feedBackReportErrorMessId;
	}

	public void setFeedBackReportCodeId(String feedBackReportCodeId) {
		this.feedBackReportCodeId = feedBackReportCodeId;
	}

	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}

	public void setRecordId(String recordId) {
		this.recordId = recordId;
	}

	public void setReportMessageId(String reportMessageId) {
		this.reportMessageId = reportMessageId;
	}

	public void setReportMessageType(String reportMessageType) {
		this.reportMessageType = reportMessageType;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public void setReportMessageName(String reportMessageName) {
		this.reportMessageName = reportMessageName;
	}

	public void setFeedBackReportName(String feedBackReportName) {
		this.feedBackReportName = feedBackReportName;
	}

	public void setFbCode(String fbCode) {
		this.fbCode = fbCode;
	}

	public void setFbTag(String fbTag) {
		this.fbTag = fbTag;
	}

	public boolean equals(Object o) {
		if (o == this)
			return true;
		if (!(o instanceof FeedBackReportErrorMessage))
			return false;
		FeedBackReportErrorMessage other = (FeedBackReportErrorMessage) o;
		if (!other.canEqual(this))
			return false;
		Object this$feedBackReportErrorMessId = getFeedBackReportErrorMessId();
		Object other$feedBackReportErrorMessId = other.getFeedBackReportErrorMessId();
		if (this$feedBackReportErrorMessId == null ? other$feedBackReportErrorMessId != null
				: !this$feedBackReportErrorMessId.equals(other$feedBackReportErrorMessId))
			return false;
		Object this$feedBackReportCodeId = getFeedBackReportCodeId();
		Object other$feedBackReportCodeId = other.getFeedBackReportCodeId();
		if (this$feedBackReportCodeId == null ? other$feedBackReportCodeId != null
				: !this$feedBackReportCodeId.equals(other$feedBackReportCodeId))
			return false;
		Object this$errorMessage = getErrorMessage();
		Object other$errorMessage = other.getErrorMessage();
		if (this$errorMessage == null ? other$errorMessage != null : !this$errorMessage.equals(other$errorMessage))
			return false;
		Object this$recordId = getRecordId();
		Object other$recordId = other.getRecordId();
		if (this$recordId == null ? other$recordId != null : !this$recordId.equals(other$recordId))
			return false;
		Object this$reportMessageId = getReportMessageId();
		Object other$reportMessageId = other.getReportMessageId();
		if (this$reportMessageId == null ? other$reportMessageId != null
				: !this$reportMessageId.equals(other$reportMessageId))
			return false;
		Object this$reportMessageType = getReportMessageType();
		Object other$reportMessageType = other.getReportMessageType();
		if (this$reportMessageType == null ? other$reportMessageType != null
				: !this$reportMessageType.equals(other$reportMessageType))
			return false;
		Object this$createTime = getCreateTime();
		Object other$createTime = other.getCreateTime();
		if (this$createTime == null ? other$createTime != null : !this$createTime.equals(other$createTime))
			return false;
		Object this$reportMessageName = getReportMessageName();
		Object other$reportMessageName = other.getReportMessageName();
		if (this$reportMessageName == null ? other$reportMessageName != null
				: !this$reportMessageName.equals(other$reportMessageName))
			return false;
		Object this$feedBackReportName = getFeedBackReportName();
		Object other$feedBackReportName = other.getFeedBackReportName();
		if (this$feedBackReportName == null ? other$feedBackReportName != null
				: !this$feedBackReportName.equals(other$feedBackReportName))
			return false;
		Object this$fbCode = getFbCode();
		Object other$fbCode = other.getFbCode();
		if (this$fbCode == null ? other$fbCode != null : !this$fbCode.equals(other$fbCode))
			return false;
		Object this$fbTag = getFbTag();
		Object other$fbTag = other.getFbTag();
		return this$fbTag == null ? other$fbTag == null : this$fbTag.equals(other$fbTag);
	}

	protected boolean canEqual(Object other) {
		return other instanceof FeedBackReportErrorMessage;
	}

	public int hashCode() {
		//int PRIME = 59;
		int result = 1;
		Object $feedBackReportErrorMessId = getFeedBackReportErrorMessId();
		result = result * 59 + ($feedBackReportErrorMessId == null ? 43 : $feedBackReportErrorMessId.hashCode());
		Object $feedBackReportCodeId = getFeedBackReportCodeId();
		result = result * 59 + ($feedBackReportCodeId == null ? 43 : $feedBackReportCodeId.hashCode());
		Object $errorMessage = getErrorMessage();
		result = result * 59 + ($errorMessage == null ? 43 : $errorMessage.hashCode());
		Object $recordId = getRecordId();
		result = result * 59 + ($recordId == null ? 43 : $recordId.hashCode());
		Object $reportMessageId = getReportMessageId();
		result = result * 59 + ($reportMessageId == null ? 43 : $reportMessageId.hashCode());
		Object $reportMessageType = getReportMessageType();
		result = result * 59 + ($reportMessageType == null ? 43 : $reportMessageType.hashCode());
		Object $createTime = getCreateTime();
		result = result * 59 + ($createTime == null ? 43 : $createTime.hashCode());
		Object $reportMessageName = getReportMessageName();
		result = result * 59 + ($reportMessageName == null ? 43 : $reportMessageName.hashCode());
		Object $feedBackReportName = getFeedBackReportName();
		result = result * 59 + ($feedBackReportName == null ? 43 : $feedBackReportName.hashCode());
		Object $fbCode = getFbCode();
		result = result * 59 + ($fbCode == null ? 43 : $fbCode.hashCode());
		Object $fbTag = getFbTag();
		return result * 59 + ($fbTag == null ? 43 : $fbTag.hashCode());
	}
}
