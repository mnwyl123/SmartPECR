package com.dcits.platform.entity.system;

/**

 * 

* 类名称：角色

* 类描述： 

* @author

* 作者单位： 

* 联系方式：

* 创建时间：2018年2月28日

* @version 1.0

 */

public class SysApp {
	
	private String SysInd;

	private String Name;

	private String Status;

	private String Url;

	private String PicturePath;

	private String SDesc;

	private String SClasses;
	
	private String ImitateUrl;

	private String target;  

	

	public String getSysInd() {
		return SysInd;
	}

	public void setSysInd(String sysInd) {
		SysInd = sysInd;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public String getStatus() {
		return Status;
	}

	public void setStatus(String status) {
		Status = status;
	}

	public String getUrl() {
		return Url;
	}

	public void setUrl(String url) {
		Url = url;
	}

	public String getPicturePath() {
		return PicturePath;
	}

	public void setPicturePath(String picturePath) {
		PicturePath = picturePath;
	}

	public String getSDesc() {
		return SDesc;
	}

	public void setSDesc(String sDesc) {
		SDesc = sDesc;
	}

	public String getSClasses() {
		return SClasses;
	}

	public void setSClasses(String sClasses) {
		SClasses = sClasses;
	}

	public String getImitateUrl() {
		return ImitateUrl;
	}

	public void setImitateUrl(String imitateUrl) {
		ImitateUrl = imitateUrl;
	}

	public String getTarget() {

		return target;

	}

	public void setTarget(String target) {

		this.target = target;

	}



}
