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

public class HomeManagement {


	private String ModuleId;

	private String ModuleName;

	private String ModulePicture; 

	private String target;  
 
 
	public String getModuleId() {
		return ModuleId;
	}

	public void setModuleId(String moduleId) {
		ModuleId = moduleId;
	}
 
	public String getModuleName() {
		return ModuleName;
	}

	public void setModuleName(String moduleName) {
		ModuleName = moduleName;
	}

	public String getModulePicture() {
		return ModulePicture;
	}

	public void setModulePicture(String modulePicture) {
		ModulePicture = modulePicture;
	}

	public String getTarget() {

		return target;

	}

	public void setTarget(String target) {

		this.target = target;

	}



}
