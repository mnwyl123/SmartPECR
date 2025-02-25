package com.dcits.supervise.pecr.common.service;

import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.common.entity.OrgCode;
import com.dcits.supervise.pecr.common.entity.SystemCodeTypeValue;
import com.dcits.supervise.pecr.common.entity.SystemStateValue;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface DataDictCodeMapper {
	/**
	 * 系统码值结果查询
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> selectCodeValueList(List<Map<String, Object>> list) throws Exception;
	
	/**
	 * wzy
	 * 系统码值结果查询 -- 机构
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> selectSysCodeValueList(PageData pd) throws Exception;
	/**
	 * 根据uperId查询   系统码值
	 * @param uperId
	 * @return
	 * @throws Exception
	 */
	public List<SystemCodeTypeValue> selectCodeValueListByUperId(@Param("uperId")String uperId) throws Exception;
	
	/**
	 * 根据uperId查询   系统码值
	 * @param uperId
	 * @return
	 * @throws Exception
	 */
	public List<SystemCodeTypeValue> selectTableValueListByUperId(@Param("uperId")String uperId) throws Exception;

	/**
	 * 根据uperId查询  多个 系统码值
	 * @param uperId
	 * @return
	 * @throws Exception
	 */
	public List<SystemCodeTypeValue> selectCodesValueListByUperId(PageData pd) throws Exception;
	
	
	/**
	 * 查询机构
	 * @param code
	 * @return
	 * @throws Exception
	 */
	public List<OrgCode> selectOrgList(String code) throws Exception;
	
	/**
	 * 查询数据状态/报文状态
	 * @param code
	 * @return
	 * @throws Exception
	 */
	public List<SystemStateValue> getSystemStateList(String stateName) throws Exception;
	
	/**
	 * 系统数据字典  渲染表格
	 * @param code
	 * @return
	 * @throws Exception
	 */
	public List<OrgCode> getSysCodeTypeList(String code) throws Exception;
}
