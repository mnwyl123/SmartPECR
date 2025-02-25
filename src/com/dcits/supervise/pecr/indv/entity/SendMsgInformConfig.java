package com.dcits.supervise.pecr.indv.entity;

import java.util.List;
import java.util.Map;

public class SendMsgInformConfig {
	// 短信通知地址
	private String SEND_MSG_HEAD;

	public SendMsgInformConfig() {
	}

	public String getSEND_MSG_HEAD() {
		return SEND_MSG_HEAD;
	}

	public void setSEND_MSG_HEAD(String sEND_MSG_HEAD) {
		SEND_MSG_HEAD = sEND_MSG_HEAD;
	}

	private String REPORT_MESSAGE_NAME;


	private String sourSystemId;
	private String branchId;
	private String subSerialNo;
	private String destServiceCode;
	private String sourSPN;
	// private String globalSerialNo;
	// private String tranTimestamp;
	private String destSystemId;
	private String routeKey;
	private String routeKeyType;
	private String tellerId;
	private String destServiceVer;
	private String sourServerId;
	private String company;
	private String sourServiceVer;
	// private String tranDate;
	private String isPlayback;
	private String destSPN;
	private String Password;
	private String UserId;
	private String content;

	public String getREPORT_MESSAGE_NAME() {
		return REPORT_MESSAGE_NAME;
	}
	
	public void setREPORT_MESSAGE_NAME(String rEPORT_MESSAGE_NAME) {
		REPORT_MESSAGE_NAME = rEPORT_MESSAGE_NAME;
	}
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}


	public String getSourSystemId() {
		return sourSystemId;
	}

	public void setSourSystemId(String sourSystemId) {
		this.sourSystemId = sourSystemId;
	}

	public String getBranchId() {
		return branchId;
	}

	public void setBranchId(String branchId) {
		this.branchId = branchId;
	}

	public String getSubSerialNo() {
		return subSerialNo;
	}

	public void setSubSerialNo(String subSerialNo) {
		this.subSerialNo = subSerialNo;
	}

	public String getDestServiceCode() {
		return destServiceCode;
	}

	public void setDestServiceCode(String destServiceCode) {
		this.destServiceCode = destServiceCode;
	}

	public String getSourSPN() {
		return sourSPN;
	}

	public void setSourSPN(String sourSPN) {
		this.sourSPN = sourSPN;
	}

	// public String getGlobalSerialNo() {
	// return globalSerialNo;
	// }
	// public void setGlobalSerialNo(String globalSerialNo) {
	// this.globalSerialNo = globalSerialNo;
	// }
	// public String getTranTimestamp() {
	// return tranTimestamp;
	// }
	// public void setTranTimestamp(String tranTimestamp) {
	// this.tranTimestamp = tranTimestamp;
	// }
	public String getDestSystemId() {
		return destSystemId;
	}

	public void setDestSystemId(String destSystemId) {
		this.destSystemId = destSystemId;
	}

	public String getRouteKey() {
		return routeKey;
	}

	public void setRouteKey(String routeKey) {
		this.routeKey = routeKey;
	}

	public String getRouteKeyType() {
		return routeKeyType;
	}

	public void setRouteKeyType(String routeKeyType) {
		this.routeKeyType = routeKeyType;
	}

	public String getTellerId() {
		return tellerId;
	}

	public void setTellerId(String tellerId) {
		this.tellerId = tellerId;
	}

	public String getDestServiceVer() {
		return destServiceVer;
	}

	public void setDestServiceVer(String destServiceVer) {
		this.destServiceVer = destServiceVer;
	}

	public String getSourServerId() {
		return sourServerId;
	}

	public void setSourServerId(String sourServerId) {
		this.sourServerId = sourServerId;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getSourServiceVer() {
		return sourServiceVer;
	}

	public void setSourServiceVer(String sourServiceVer) {
		this.sourServiceVer = sourServiceVer;
	}

	public String getIsPlayback() {
		return isPlayback;
	}

	public void setIsPlayback(String isPlayback) {
		this.isPlayback = isPlayback;
	}

	public String getDestSPN() {
		return destSPN;
	}

	public void setDestSPN(String destSPN) {
		this.destSPN = destSPN;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
	}

	public String getUserId() {
		return UserId;
	}

	public void setUserId(String userId) {
		UserId = userId;
	}

	

	// 为对接短信平台的参数进行赋值
	public void valueToElement(List<Map<String, Object>> sendMsgPmtList,
			Map<String, Object> msgData) {
		for (Map<String, Object> map : sendMsgPmtList) {
			if (((String) map.get("ARG_KEY")).equals("SEND_MSG_HEAD")) {
				this.setSEND_MSG_HEAD((String) map.get("ARG_VALUE"));
			} else if (((String) map.get("ARG_KEY")).equals("sourSystemId")) {
				this.setSourSystemId((String) map.get("ARG_VALUE"));
			} else if (((String) map.get("ARG_KEY")).equals("destServiceCode")) {
				this.setDestServiceCode((String) map.get("ARG_VALUE"));
			} else if (((String) map.get("ARG_KEY")).equals("sourSPN")) {
				this.setSourSPN((String) map.get("ARG_VALUE"));
			} else if (((String) map.get("ARG_KEY")).equals("destSystemId")) {
				this.setDestSystemId((String) map.get("ARG_VALUE"));
			} else if (((String) map.get("ARG_KEY")).equals("routeKey")) {
				this.setRouteKey(((String) map.get("ARG_VALUE")).equals("null") ? ""
						: (String) map.get("ARG_VALUE"));
			} else if (((String) map.get("ARG_KEY")).equals("routeKeyType")) {
				this.setRouteKeyType(((String) map.get("ARG_VALUE")).equals("null") ? ""
						: (String) map.get("ARG_VALUE"));
			} else if (((String) map.get("ARG_KEY")).equals("tellerId")) {
				this.setTellerId((String) map.get("ARG_VALUE"));
			} else if (((String) map.get("ARG_KEY")).equals("destServiceVer")) {
				this.setDestServiceVer((String) map.get("ARG_VALUE"));
			} else if (((String) map.get("ARG_KEY")).equals("company")) {
				this.setCompany((String) map.get("ARG_VALUE"));
			} else if (((String) map.get("ARG_KEY")).equals("sourServiceVer")) {
				this.setSourServiceVer((String) map.get("ARG_VALUE"));
			} else if (((String) map.get("ARG_KEY")).equals("isPlayback")) {
				this.setIsPlayback((String) map.get("ARG_VALUE"));
			} else if (((String) map.get("ARG_KEY")).equals("destSPN")) {
				this.setDestSPN((String) map.get("ARG_VALUE"));
			} else if (((String) map.get("ARG_KEY")).equals("Password")) {
				this.setPassword((String) map.get("ARG_VALUE"));
			} else if (((String) map.get("ARG_KEY")).equals("UserId")) {
				this.setUserId((String) map.get("ARG_VALUE"));
			} else if (((String) map.get("ARG_KEY")).equals("content")) {
				this.setContent((String) map.get("ARG_VALUE"));
			} else if (((String) map.get("ARG_KEY")).equals("subSerialNo")) {
				this.setSubSerialNo((String) map.get("ARG_VALUE"));
			}
			// else if(((String)map.get("KEY")).equals("sourServerId")){
			// this.setSourServerId((String)map.get("VALUE"));
			// }
		}
		this.setBranchId("90001");
		this.setREPORT_MESSAGE_NAME((String) msgData.get("REPORT_MESSAGE_NAME"));
		this.setSourServerId((String) msgData.get("sourServerId"));

	}

}
