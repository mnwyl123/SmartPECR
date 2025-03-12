package com.dcits.platform.entity.system;

import java.util.List;

import com.dcits.platform.util.tree.TreeDetails;
import com.dcits.platform.util.tree.TreeEntity;

/**
 * 
* 类名称：组织机构
* 类描述： 
* @author 穆楠
* 作者单位： 
* 联系方式：
* 修改时间：2015年12月16日
* @version 2.0
 */
public class Org implements TreeDetails {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4909401128952621861L;
	private String orgId;
	private String name;			//名称
	private String nameEn;			//英文名称
	private String orgCode;
	private int orgLevel;
	private String orgDesc;
	private String status;
	private String orgOrder;
	private String company;
	private String parentId;		//上级ID
	private String headman;			//负责人
	private String tel;				//电话
	private String functions;		//部门职能
	private	String address;			//地址

	private String target;
	private Org org;
	private List<Org> subDepartment;
	private boolean hasDepartment = false;
	private String treeurl;
	//20201207,新增字段，总行对应的14位征信中心机构编码和各分支行机构对应的14位征信中心机构编码
	private String orgCodeFourteen;
	private String eachOrgCodeFourteen;
	
	public String getOrgCodeFourteen() {
		return orgCodeFourteen;
	}
	public void setOrgCodeFourteen(String orgCodeFourteen) {
		this.orgCodeFourteen = orgCodeFourteen;
	}
	public String getEachOrgCodeFourteen() {
		return eachOrgCodeFourteen;
	}
	public void setEachOrgCodeFourteen(String eachOrgCodeFourteen) {
		this.eachOrgCodeFourteen = eachOrgCodeFourteen;
	}
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}
	public List<Org> getSubDepartment() {
		return subDepartment;
	}
	public void setSubDepartment(List<Org> subDepartment) {
		this.subDepartment = subDepartment;
	}
	public boolean isHasDepartment() {
		return hasDepartment;
	}
	public void setHasDepartment(boolean hasDepartment) {
		this.hasDepartment = hasDepartment;
	}
	public String getTreeurl() {
		return treeurl;
	}
	public void setTreeurl(String treeurl) {
		this.treeurl = treeurl;
	}

	public Org getOrg() {
		return org;
	}
	public void setOrg(Org org) {
		this.org = org;
	}
	public String getOrgId() {
		return orgId;
	}
	public void setOrgId(String orgId) {
		this.orgId = orgId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getOrgCode() {
		return orgCode;
	}
	public void setOrgCode(String orgCode) {
		this.orgCode = orgCode;
	}
	public String getOrgDesc() {
		return orgDesc;
	}
	public void setOrgDesc(String orgDesc) {
		this.orgDesc = orgDesc;
	}
	public String getOrgOrder() {
		return orgOrder;
	}
	public void setOrgOrder(String orgOrder) {
		this.orgOrder = orgOrder;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
	public String getHeadman() {
		return headman;
	}
	public void setHeadman(String headman) {
		this.headman = headman;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getFunctions() {
		return functions;
	}
	public void setFunctions(String functions) {
		this.functions = functions;
	}
	public String getNameEn() {
		return nameEn;
	}
	public void setNameEn(String nameEn) {
		this.nameEn = nameEn;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getId() {
		return this.orgId;
	}
	
	public String getParentId() {
		return this.parentId;
	}
	public TreeEntity toTreeEntity() {
		TreeEntity treeEntity = new OrgTreeEntity(this.orgId, this.orgCode, this.name, this.parentId);
		return treeEntity;
	}
	public int getOrgLevel() {
		return orgLevel;
	}
	public void setOrgLevel(int orgLevel) {
		this.orgLevel = orgLevel;
	}
	
}