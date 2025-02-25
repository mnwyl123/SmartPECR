package com.dcits.supervise.pecr.ent.entity;

import java.io.Serializable;

public class EntCotaInfSgmt implements Serializable {

	  /**
	   * 
	   */
	  private static final long serialVersionUID = 1L;
	  /**
	   * 主键
	   */
	  private String eahCotaInfSgmtId ;
	  /**
	   * 联系地址行政区划代码
	   */
	  private String conAddDistrictCcode ;
	  /**
	   * 联系地址
	   */
	  private String conAdd ;
	  /**
	   * 联系电话
	   */
	  private String conPhone ;
	  /**
	   * 财务部门联系电话
	   */
	  private String finConPhone ;
	  /**
	   * 联系方式信息更新日期
	   */
	  private String cotaInfoUpDate ;
	  /**
	   * 数据外键
	   */
	  private String eaaBsSgmtId ;
	  /**
	   * 报送日期
	   */
	  private String rptDate ;
	public String getEahCotaInfSgmtId() {
		return eahCotaInfSgmtId;
	}
	public void setEahCotaInfSgmtId(String eahCotaInfSgmtId) {
		this.eahCotaInfSgmtId = eahCotaInfSgmtId;
	}
	public String getConAddDistrictCcode() {
		return conAddDistrictCcode;
	}
	public void setConAddDistrictCcode(String conAddDistrictCcode) {
		this.conAddDistrictCcode = conAddDistrictCcode;
	}
	public String getConAdd() {
		return conAdd;
	}
	public void setConAdd(String conAdd) {
		this.conAdd = conAdd;
	}
	public String getConPhone() {
		return conPhone;
	}
	public void setConPhone(String conPhone) {
		this.conPhone = conPhone;
	}
	public String getFinConPhone() {
		return finConPhone;
	}
	public void setFinConPhone(String finConPhone) {
		this.finConPhone = finConPhone;
	}
	public String getCotaInfoUpDate() {
		return cotaInfoUpDate;
	}
	public void setCotaInfoUpDate(String cotaInfoUpDate) {
		this.cotaInfoUpDate = cotaInfoUpDate;
	}
	public String getEaaBsSgmtId() {
		return eaaBsSgmtId;
	}
	public void setEaaBsSgmtId(String eaaBsSgmtId) {
		this.eaaBsSgmtId = eaaBsSgmtId;
	}
	public String getRptDate() {
		return rptDate;
	}
	public void setRptDate(String rptDate) {
		this.rptDate = rptDate;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
