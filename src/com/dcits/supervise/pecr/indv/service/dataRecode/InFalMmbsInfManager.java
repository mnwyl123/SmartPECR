package com.dcits.supervise.pecr.indv.service.dataRecode;

import java.util.List;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.indv.entity.InFalMmbsInf;
import com.dcits.supervise.pecr.indv.entity.InIDEfctInf;

public interface InFalMmbsInfManager {
	/**
	 * 查询
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<InFalMmbsInf> List(Page page) throws Exception;
	/**
	 * 修改
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void updateData(PageData pd) throws Exception;
	/**
	 * 更新状态
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void updatestatus(PageData pd) throws Exception;
	/**
	 * 删除
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void deleteData(PageData pd) throws Exception;
	/**
	 * 新增
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void addData(PageData pd) throws Exception;
	/**
	 * 判断
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public InFalMmbsInf getData(PageData pd) throws Exception;
	/**
	 * 校验
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public InFalMmbsInf getDatabyname(PageData pd) throws Exception;
}
