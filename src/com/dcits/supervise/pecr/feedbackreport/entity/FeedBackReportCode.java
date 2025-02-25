package com.dcits.supervise.pecr.feedbackreport.entity;

import java.io.Serializable;

public class FeedBackReportCode implements Serializable {

	private String feedBackReportCodeId;

	private String fbCode;

	private String fbTag;

	private String message;
	private static final long serialVersionUID = 1L;

	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append(getClass().getSimpleName());
		sb.append(" [");
		sb.append("Hash = ").append(hashCode());
		sb.append(", feedBackReportCodeId=").append(this.feedBackReportCodeId);
		sb.append(", fbCode=").append(this.fbCode);
		sb.append(", fbTag=").append(this.fbTag);
		sb.append(", message=").append(this.message);
		sb.append(", serialVersionUID=").append(1L);
		sb.append("]");
		return sb.toString();
	}

	public String getFeedBackReportCodeId() {
		return this.feedBackReportCodeId;
	}

	public String getFbCode() {
		return this.fbCode;
	}

	public String getFbTag() {
		return this.fbTag;
	}

	public String getMessage() {
		return this.message;
	}

	public void setFeedBackReportCodeId(String feedBackReportCodeId) {
		this.feedBackReportCodeId = feedBackReportCodeId;
	}

	public void setFbCode(String fbCode) {
		this.fbCode = fbCode;
	}

	public void setFbTag(String fbTag) {
		this.fbTag = fbTag;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public boolean equals(Object o) {
		if (o == this)
			return true;
		if (!(o instanceof FeedBackReportCode))
			return false;
		FeedBackReportCode other = (FeedBackReportCode) o;
		if (!other.canEqual(this))
			return false;
		Object this$feedBackReportCodeId = getFeedBackReportCodeId();
		Object other$feedBackReportCodeId = other.getFeedBackReportCodeId();
		if (this$feedBackReportCodeId == null ? other$feedBackReportCodeId != null
				: !this$feedBackReportCodeId.equals(other$feedBackReportCodeId))
			return false;
		Object this$fbCode = getFbCode();
		Object other$fbCode = other.getFbCode();
		if (this$fbCode == null ? other$fbCode != null : !this$fbCode.equals(other$fbCode))
			return false;
		Object this$fbTag = getFbTag();
		Object other$fbTag = other.getFbTag();
		if (this$fbTag == null ? other$fbTag != null : !this$fbTag.equals(other$fbTag))
			return false;
		Object this$message = getMessage();
		Object other$message = other.getMessage();
		return this$message == null ? other$message == null : this$message.equals(other$message);
	}

	protected boolean canEqual(Object other) {
		return other instanceof FeedBackReportCode;
	}

	public int hashCode() {
		//int PRIME = 59;
		int result = 1;
		Object $feedBackReportCodeId = getFeedBackReportCodeId();
		result = result * 59 + ($feedBackReportCodeId == null ? 43 : $feedBackReportCodeId.hashCode());
		Object $fbCode = getFbCode();
		result = result * 59 + ($fbCode == null ? 43 : $fbCode.hashCode());
		Object $fbTag = getFbTag();
		result = result * 59 + ($fbTag == null ? 43 : $fbTag.hashCode());
		Object $message = getMessage();
		return result * 59 + ($message == null ? 43 : $message.hashCode());
	}
}