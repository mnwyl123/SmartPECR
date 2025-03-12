package com.dcits.supervise.pecr.ent.entity;

import java.io.Serializable;

/**
 * 企业借贷账户信息记录    相关还款责任人段
 * @author 穆楠
 *
 */
public class EntRltRepymtSgmt implements Serializable {

	private static final long serialVersionUID = 1022485691374618441L;

	/**
	 * 主键
	 */
	private String edcRltRepymtInfSgmtId;
	
	/**
	 * 身份类别
	 */
	private String arlpIdType;
	
	/**
	 * 责任人名称
	 */
	private String arlpName;
	
	/**
	 * 责任人身份标识类型
	 */
	private String arlpCertType;
	
	/**
	 * 责任人身份标识号码
	 */
	private String arlpCertNum;
	
	/**
	 * 还款责任人类型
	 */
	private String arlpType;
	
	/**
	 * 还款责任金额
	 */
	private String arlpAmt;
	
	/**
	 * 联保标志
	 */
	private String wartySign;
	
	/**
	 * 保证合同编号
	 */
	private String maxGuarMcc;

	public String getEdcRltRepymtInfSgmtId() {
		return edcRltRepymtInfSgmtId;
	}

	public void setEdcRltRepymtInfSgmtId(String edcRltRepymtInfSgmtId) {
		this.edcRltRepymtInfSgmtId = edcRltRepymtInfSgmtId;
	}

	public String getArlpIdType() {
		return arlpIdType;
	}

	public void setArlpIdType(String arlpIdType) {
		this.arlpIdType = arlpIdType;
	}

	public String getArlpName() {
		return arlpName;
	}

	public void setArlpName(String arlpName) {
		this.arlpName = arlpName;
	}

	public String getArlpCertType() {
		return arlpCertType;
	}

	public void setArlpCertType(String arlpCertType) {
		this.arlpCertType = arlpCertType;
	}

	public String getArlpCertNum() {
		return arlpCertNum;
	}

	public void setArlpCertNum(String arlpCertNum) {
		this.arlpCertNum = arlpCertNum;
	}

	public String getArlpType() {
		return arlpType;
	}

	public void setArlpType(String arlpType) {
		this.arlpType = arlpType;
	}

	public String getArlpAmt() {
		return arlpAmt;
	}

	public void setArlpAmt(String arlpAmt) {
		this.arlpAmt = arlpAmt;
	}

	public String getWartySign() {
		return wartySign;
	}

	public void setWartySign(String wartySign) {
		this.wartySign = wartySign;
	}

	public String getMaxGuarMcc() {
		return maxGuarMcc;
	}

	public void setMaxGuarMcc(String maxGuarMcc) {
		this.maxGuarMcc = maxGuarMcc;
	}

}
