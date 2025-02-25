package com.dcits.platform.service.system.sysApp;

import java.util.List;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.Role;
import com.dcits.platform.util.PageData;
import com.dcits.platform.entity.system.SysApp;

/** 
 * 说明： 系统（产品）管理接口
 * 创建人：  
 * 创建时间：2018-02-26
 * @version
 */
public interface SysAppManager{
	List<SysApp> listAllApp(String company) throws Exception;
	//查询已授权菜单ID
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
	
	/**全部产品
	 * @param pd
	 * @throws Exception
	 */
	public List<SysApp> appList(PageData pd)throws Exception;
	
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
	
}

