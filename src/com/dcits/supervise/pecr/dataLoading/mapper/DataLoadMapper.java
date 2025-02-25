package com.dcits.supervise.pecr.dataLoading.mapper;

import java.util.Map;

public interface DataLoadMapper {
	/**
	 * 删除个人基本信息中当天入库的数据
	 * @throws Exception
	 */
	public void deleteIndvBasicInfo(Map<String, Object> dataLoadMap) throws Exception;
	/**
	 * 删除个人借贷账户信息表中当天入库的数据
	 * @throws Exception
	 */
	public void deleteLoanAcctInfo(Map<String, Object> dataLoadMap)throws Exception;
	/**
	 * 删除个人担保账户信息表中当天入库的数据
	 * @throws Exception
	 */
	public void deleteGuarAcctInfo(Map<String, Object> dataLoadMap)throws Exception;
	/**
	 * 修改当天更行的所有字表的数据外键信息
	 * @throws Exception
	 */
	public void updateMasterKey(Map<String, Object> dataLoadMap)throws Exception;
	/**
	 * 数据更新成功之后插入中间表的信息
	 * @throws Exception
	 */
	public void insetMiddleData(Map<String, Object> dataLoadMap) throws Exception;
		
	

}
