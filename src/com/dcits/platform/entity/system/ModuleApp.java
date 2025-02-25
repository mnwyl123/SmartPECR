package com.dcits.platform.entity.system;

/**

 * 

* 类名称：角色

* 类描述： 

* @author sunqfb

* 作者单位： 

* 联系方式：

* 创建时间：2018年2月28日

* @version 1.0

 */

public class ModuleApp {


	private String ModuleId;

	private String SysInd; 
	
	private String OderBy; 

	private String target;  

	 
	public String getSysInd() {
		return SysInd;
	}

	public void setSysInd(String sysInd) {
		SysInd = sysInd;
	}

	public String getModuleId() {
		return ModuleId;
	}

	public void setModuleId(String moduleId) {
		ModuleId = moduleId;
	}
 
	public String getOderBy() {
		return OderBy;
	}

	public void setOderBy(String oderBy) {
		OderBy = oderBy;
	}

	public String getTarget() {

		return target;

	}

	public void setTarget(String target) {

		this.target = target;

	}
 


}
