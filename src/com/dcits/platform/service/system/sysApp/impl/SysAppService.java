package com.dcits.platform.service.system.sysApp.impl;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;

import org.apache.shiro.session.Session;
import org.springframework.stereotype.Service;
import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.SysApp;
import com.dcits.platform.entity.system.Role;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;
import com.dcits.platform.service.system.sysApp.SysAppManager;

/** 
 * 说明： 系统（产品）管理
 * 创建人：  SUNQFB
 * 创建时间：2018-02-26
 * @version
 */
@Service("sysAppService")
public class SysAppService implements SysAppManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void save(PageData pd)throws Exception{
		dao.save("SysAppMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void delete(PageData pd)throws Exception{
		dao.delete("SysAppMapper.delete", pd);
		dao.delete("ModuleAppMapper.deleteBySysInd", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void edit(PageData pd)throws Exception{
		dao.update("SysAppMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("SysAppMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("SysAppMapper.listAll", pd);
	}
	
	/**全部产品
	 * @param pd
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<SysApp> appList(PageData pd)throws Exception{
		return (List<SysApp>)dao.findForList("SysAppMapper.sysIndList", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("SysAppMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	@Override
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("SysAppMapper.deleteAll", ArrayDATA_IDS);
		dao.delete("ModuleAppMapper.deleteAllBySysInd", ArrayDATA_IDS);
	}
	@Override
	public List<SysApp> listAllApp(String company) throws Exception {
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		PageData pd = new PageData();
		pd.put("USER_ID", USERID);
		pd.put("COMPANY", company);
		Page page = new Page();
		List<SysApp> SysAppList = new ArrayList<SysApp>();
		Boolean flag = (Boolean) session.getAttribute(user.getUSER_ID()+"isCompany");
		page.setPd(pd);
		//根据用户不同显示不同系统（产品）
		if(flag){
			SysAppList = (List<SysApp>) dao.findForList("SysAppMapper.SysIndlistAut", pd);
		}else{
			SysAppList = (List<SysApp>) dao.findForList("SysAppMapper.ComSysIndlistAut", pd);
		}
		
//		List<Role> RoleList = this.listAllRoles(pd);
		for(SysApp depar : SysAppList){
			depar.setTarget("treeFrame");
		}
		return SysAppList;
	}
	
}

