package com.dcits.platform.service.system.moduleapp.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.platform.service.system.moduleapp.ModuleAppManager;

/** 
 * 说明： 管理模块系统（产品）
 * 创建人：  
 * 创建时间：2018-03-01
 * @version
 */
@Service("moduleappService")
public class ModuleAppService implements ModuleAppManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void save(PageData pd)throws Exception{
		dao.save("ModuleAppMapper.save", pd);
	}
	 
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("ModuleAppMapper.delete", pd);
	}
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void deleteByModuleId(PageData pd)throws Exception{
		dao.delete("ModuleAppMapper.deleteByModuleId", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void edit(PageData pd)throws Exception{
		dao.update("ModuleAppMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("ModuleAppMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("ModuleAppMapper.listAll", pd);
	}

	/**列出各模块下的产品
	 * @param pd
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listAllSysInd(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("ModuleAppMapper.listAllSysInd", pd);
	}
	
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("ModuleAppMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	@Override
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("ModuleAppMapper.deleteAll", ArrayDATA_IDS);
	}

	/**查询明细总数
	 * @param pd
	 * @throws Exception
	 */
	public PageData findCount(PageData pd)throws Exception{
		return (PageData)dao.findForObject("ModuleAppMapper.findCount", pd);
	}
	
}

