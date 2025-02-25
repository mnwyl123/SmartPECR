package com.dcits.platform.service.system.moduleapp;

import java.util.List;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;

/** 
 * 说明： 管理模块系统（产品）接口
 * 创建人：  
 * 创建时间：2018-03-01
 * @version
 */
public interface ModuleAppManager{

	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception;
	
	/**删除 moduleId
	 * @param pd
	 * @throws Exception
	 */
	public void deleteByModuleId(PageData pd)throws Exception;
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listAll(PageData pd)throws Exception;

	/**列出各模块下所有产品
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listAllSysInd(PageData pd)throws Exception;
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception;

	/**查询明细总数
	 * @param pd
	 * @throws Exception
	 */
	public PageData findCount(PageData pd)throws Exception;
}

