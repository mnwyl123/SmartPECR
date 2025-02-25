package com.dcits.platform.service.system.user.impl;

import java.net.InetAddress;
import java.net.NetworkInterface;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Formatter;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.shiro.session.Session;
import org.springframework.stereotype.Service;

import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.service.system.user.UserManager;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;


/** 系统用户
 * @author pengyj fhpengyj (pengyj)
 * 修改时间：2015.11.2
 */
@Service("userService")
public class UserService implements UserManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**登录判断
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	public User getUserByNameAndPwd(PageData pd)throws Exception{
		return (User)dao.findForObject("UserMapper.getUserInfo", pd);
	}
	
	/**更新登录时间
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void updateLastLogin(PageData pd)throws Exception{
		dao.update("UserMapper.updateLastLogin", pd);
	}
	
	/**通过用户ID获取用户信息和角色信息
	 * @param USER_ID
	 * @return
	 * @throws Exception
	 */
	@Override
	public User getUserById(String USER_ID) throws Exception {
		return (User) dao.findForObject("UserMapper.getUserById", USER_ID);
	}
	
	/**通过USERNAEME获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	public PageData findByUsername(PageData pd)throws Exception{
		return (PageData)dao.findForObject("UserMapper.findByUsername", pd);
	}
	
	/**列出某角色下的所有用户
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> listAllUserByRoldId(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("UserMapper.listAllUserByRoldId", pd);
		
	}
	
	/**保存用户IP
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void saveIP(PageData pd)throws Exception{
		dao.update("UserMapper.saveIP", pd);
	}
	
	/**用户列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listUsers(Page page)throws Exception{
		return (List<PageData>) dao.findForList("UserMapper.userlistPage", page);
	}
	
	/**通过邮箱获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	public PageData findByUE(PageData pd)throws Exception{
		return (PageData)dao.findForObject("UserMapper.findByUE", pd);
	}
	
	/**通过编号获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	public PageData findByUN(PageData pd)throws Exception{
		return (PageData)dao.findForObject("UserMapper.findByUN", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("UserMapper.findById", pd);
	}
	
	/**保存用户
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void saveU(PageData pd)throws Exception{
		dao.save("UserMapper.saveU", pd);
	}
	 
	/**修改用户
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void editU(PageData pd)throws Exception{
		dao.update("UserMapper.editU", pd);
	}
	
	/**修改初始密码
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void ChangeInitPwd(PageData pd)throws Exception{
		dao.update("UserMapper.ChangeInitPwd", pd);
	}
	
	/**删除用户
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void deleteU(PageData pd)throws Exception{
		dao.delete("UserMapper.deleteU", pd);
	}
	
	/**批量删除用户
	 * @param USER_IDS
	 * @throws Exception
	 */
	@Override
	public void deleteAllU(String[] USER_IDS)throws Exception{
		dao.delete("UserMapper.deleteAllU", USER_IDS);
	}
	
	/**批量禁用用户
	 * @param USER_IDS
	 * @throws Exception
	 */
	@Override
	public void disableAllU(String[] USER_IDS)throws Exception{
		dao.delete("UserMapper.disableAllU", USER_IDS);
	}
	
	
	/**用户列表(全部)
	 * @param USER_IDS
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> listAllUser(PageData pd)throws Exception{
		return (List<PageData>) dao.findForList("UserMapper.listAllUser", pd);
	}
	
	/**获取总数
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData getUserCount(String value)throws Exception{
		return (PageData)dao.findForObject("UserMapper.getUserCount", value);
	}
	
	/**通过法人代码获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	public String findByCompCodeandName(PageData pd)throws Exception{
		return (String)dao.findForObject("UserMapper.findByCompCodeandName", pd);
	}
	/**删除法人及用户
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void deleteUC(PageData pd)throws Exception{
		dao.delete("UserMapper.deleteUC", pd);
	}
	/**批量删除法人及用户
	 * @throws Exception
	 */
	@Override
	public void deleteAllUC(String[] COMP_CODES)throws Exception{
		dao.delete("UserMapper.deleteAllUC", COMP_CODES);
	}
	/**通过USERNAEME获
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> findCompCodeByUsername(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("UserMapper.findCompCodeByUsername", pd);
	}
	/**通过USER_ID获取机构信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<PageData> getOrgByUserId(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("UserMapper.findOrgByUserId", pd);
	}

	@Override
	public void addErrorTime(PageData pd) throws Exception {
		dao.update("UserMapper.addErrorTime", pd);	
	}

	@Override
	@SuppressWarnings("unchecked")
	public String checkErrTime(PageData pd) throws Exception {
		return (String)dao.checkErrTime("UserMapper.checkErrTime", pd);
	}

	@Override
	public String clearErrTime(PageData pd) throws Exception {
		return (String)dao.clearErrTime("UserMapper.clearErrTime", pd);
	}

	@Override
	public List<Map<String,Object>> getAllRole(PageData pd)throws Exception{
		return (List<Map<String, Object>>) dao.findForList("UserMapper.getAllRole", pd);
	}
	
	@Override
	public List<Map<String,Object>> getAllOrg(PageData pd)throws Exception{
		return (List<Map<String, Object>>) dao.findForList("UserMapper.getAllOrg",pd);
	}
	
	@Override
	public void saveRoleAuth(Map<String,Object> map)throws Exception{
		dao.save("UserMapper.saveRoleAuth", map);
	};
	
	@Override
	public void saveOrgAuth(Map<String,Object> map)throws Exception{
		dao.save("UserMapper.saveOrgAuth", map);
	};
	
	@Override
	public List<String> findOrgId(String USER_ID)throws Exception{
		return (List<String>) dao.findForList("UserMapper.findOrgId", USER_ID);
	}
	
	@Override
	public void deleteAuthOrg(String USER_ID)throws Exception{
		dao.delete("UserMapper.deleteAuthOrg", USER_ID);
	}
	
	@Override
	public List<String> findRoleId(String USER_ID)throws Exception{
		return (List<String>) dao.findForList("UserMapper.findRoleId", USER_ID);
	}
	
	@Override
	public void deleteAuthRole(String USER_ID)throws Exception{
		dao.delete("UserMapper.deleteAuthRole", USER_ID);
	}
	@Override
	public PageData findByUserId(PageData pd)throws Exception{
		return (PageData)dao.findForObject("UserMapper.findByUserId", pd);
	}
	@Override
	@SuppressWarnings("unchecked")
	public String checkLock(PageData pd) throws Exception {
		return (String)dao.checkLock("UserMapper.checkLock", pd);
	}
	@Override
	public void LockUser(PageData pd)throws Exception{
		dao.update("UserMapper.LockUser", pd);
	}
	/**用户列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<User> OutUsers(Page page)throws Exception{
		return (List<User>) dao.findForList("UserMapper.OutUsers", page);
	}
	/**通过USERNAEME和密码获
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<String> findCompCode(PageData pd)throws Exception{
		return (List<String>)dao.findForList("UserMapper.findCompCode", pd);
	}
	/**通过法人查询用户登录编码
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<String> findUserCode(PageData pd)throws Exception{
		return (List<String>)dao.findForList("UserMapper.findUserCode", pd);
	}

	/**解锁重置密码
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void updateUnLock(PageData pd)throws Exception{
		dao.update("UserMapper.unLock", pd);
	}
	//删除已授权机构信息--普通用户
	@Override
	public void deleteAuthOrgC(Map list)throws Exception{
		dao.delete("UserMapper.deleteAuthOrgC", list);
	}
	//删除已授权角色信息--普通用户
	@Override
	public void deleteAuthRoleC(Map list)throws Exception{
		dao.delete("UserMapper.deleteAuthRoleC", list);
	}
	/**根据用户名获取密码，法人
	 * 添加人：maff
	 * 添加时间：2017/7/6
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public List<Map<String,Object>> getUserPwd(PageData pd) throws Exception {
		return (List<Map<String,Object>>)dao.findForList("UserMapper.selectPwd", pd);
	}

	@Override
	public List<PageData> getOrgUseUserId(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("UserMapper.findOrgUseUserId", pd);
	}
	
	@Override
	public User getUserByNameAndPwdFin(PageData pd)throws Exception{
		return (User)dao.findForObject("UserMapperFin.getUserInfo", pd);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<String> findCompCodeFin(PageData pd)throws Exception{
		return (List<String>)dao.findForList("UserMapperFin.findCompCode", pd);
	}
	/**列出用户下所有有效的系统应用  sunqfb 20180309
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> listSysApps(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("UserMapper.listSysApps", pd);
		
	}
	
	/**判断用户是否存在
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	public User getUserByNameAndID(PageData pd)throws Exception{
		return (User)dao.findForObject("UserMapper.getUserIDInfo", pd);
	}
	
}
