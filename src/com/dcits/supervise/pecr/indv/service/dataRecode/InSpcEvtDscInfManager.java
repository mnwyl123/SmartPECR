package com.dcits.supervise.pecr.indv.service.dataRecode;

import java.util.List;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.indv.entity.InSpcEvtDscInf;

public interface InSpcEvtDscInfManager {
	/**
	 * 查询
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<InSpcEvtDscInf> List(Page page) throws Exception;
	/**
	 * 修改
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void updateData(PageData pd) throws Exception;
	/**
	 * 更新数据状态
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void updatestatus(PageData pd) throws Exception;
	/**
	 * 新增
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void addData(PageData pd) throws Exception;
	/**
	 * 删除
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void deleteData(PageData pd) throws Exception;
}
