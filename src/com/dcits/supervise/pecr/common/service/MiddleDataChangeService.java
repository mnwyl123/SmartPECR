package com.dcits.supervise.pecr.common.service;

public interface MiddleDataChangeService {

	/**
	 * 对比后给对应中间表添加数据
	 * @param infRecType 接口类型
	 * @param pk 主键中的pk : 若只有一个业务主键，则赋给此变量，此变量不能为空
	 * @param addOrDelete 新增或修改
	 * @throws Exception
	 */
	public void changeMiddleData(String infRecType, String pk,String addOrDelete)throws Exception;
	
	/**
	 * 多法人：对比后给对应中间表添加数据
	 * @param infRecType
	 * @param pk
	 * @param addOrDelete
	 * @throws Exception
	 */
	public void changeMiddleDataMCom(String infRecType, String pk,String addOrDelete,String company)throws Exception;
}
