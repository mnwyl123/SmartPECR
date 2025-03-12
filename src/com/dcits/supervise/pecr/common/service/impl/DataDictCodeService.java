package com.dcits.supervise.pecr.common.service.impl;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.common.entity.OrgCode;
import com.dcits.supervise.pecr.common.entity.SystemCodeTypeValue;
import com.dcits.supervise.pecr.common.entity.SystemStateValue;
import com.dcits.supervise.pecr.common.service.DataDictCodeMapper;

import org.apache.shiro.session.Session;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 码值结果查询
 * 
 * @author 穆楠
 *
 */
@Service("dataDictCodeService")
public class DataDictCodeService implements DataDictCodeMapper {

	@Resource(name = "daoSupportPecr")
	private DaoSupportPecr dao;

	/**
	 * 码值结果查询
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> selectCodeValueList(List<Map<String, Object>> list) throws Exception {
		List<Map<String, Object>> codeValueList = new ArrayList<>();
		if (list != null && list.size() > 0) {
			for (Map<String, Object> codeMap : list) {
				Map<String, Object> map = new HashMap<>();
				List<SystemCodeTypeValue> codeList = (List<SystemCodeTypeValue>) dao
						.findForList("DataDictCodeMapper.selectCodeValueList",
								(String) codeMap.get("systemCodeType"));
				map.put((String) codeMap.get("systemCodeType"), codeList);
				codeValueList.add(map);
			}
		}
		return codeValueList;
	}
	
	/**
	 * wzy
	 * 码值结果查询  --机构
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> selectSysCodeValueList(PageData pd){
		List<Map<String, Object>> codeValueList = new ArrayList<>();
			List<SystemCodeTypeValue> codeList = null;
			
			/*Map mapStr = new HashMap<>();
			mapStr.put("COMPANY", pd.get("COMPANY"));*/
			try {
				Map<String, Object> map = new HashMap<>();
				codeList = (List<SystemCodeTypeValue>) dao.findForList("DataDictCodeMapper.selectSysCodeValueList",(String)pd.get("COMPANY"));
				map.put("SysOrg", codeList);
				codeValueList.add(map);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return codeValueList;
	}

	/**
	 * 根据uperId查询 系统码值
	 * 
	 * @param uperId
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<SystemCodeTypeValue> selectCodeValueListByUperId(String uperId)
			throws Exception {
		return (List<SystemCodeTypeValue>) dao.findForList(
				"DataDictCodeMapper.selectCodeValueListByUperId", uperId);
	}
	
	/**
	 * 根据uperId查询  表码值
	 * 穆楠
	 * @param uperId
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<SystemCodeTypeValue> selectTableValueListByUperId(String uperId)
			throws Exception {
		return (List<SystemCodeTypeValue>) dao.findForList(
				"DataDictCodeMapper.selectTableValueListByUperId", uperId);
	}
	
	/**
	 * 
	 * @param code
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<OrgCode> selectOrgList(String code) throws Exception{
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		Boolean flag = (Boolean) session.getAttribute(user.getUSER_ID()+"isCompany");
		if(flag){
			return (List<OrgCode>) dao.findForList("DataDictCodeMapper.selectOrgListByCom", company);
		}else{
			String org_id = user.getOrg().getOrgId();
			return (List<OrgCode>) dao.findForList("DataDictCodeMapper.selectOrgListById", org_id);
		}
	}
	
	/**
	 * 查询数据状态/报文状态
	 * @param code
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<SystemStateValue> getSystemStateList(String stateName) throws Exception{
		return (List<SystemStateValue>) dao.findForList("DataDictCodeMapper.getSystemStateList", stateName);
	}
	
	/**
	 * 系统数据字典  渲染表格
	 * @param code
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<OrgCode> getSysCodeTypeList(String code) throws Exception{
		return (List<OrgCode>) dao.findForList("DataDictCodeMapper.getSysCodeTypeList", code);
	}
	
	@SuppressWarnings("unchecked")
	public List<OrgCode> getSysCodeTypeList() throws Exception{
		return (List<OrgCode>) dao.findForList("DataDictCodeMapper.getSysCodeTypeList2");
	}

	/**
	 * 根据uperId和codeLevel查询 系统码值
	 * 
	 * @param uperId
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<SystemCodeTypeValue> selectCodesValueListByUperId(PageData pd) throws Exception {
		return (List<SystemCodeTypeValue>) dao.findForList("DataDictCodeMapper.selectCodesValueListByUperId",pd);
	}
}
