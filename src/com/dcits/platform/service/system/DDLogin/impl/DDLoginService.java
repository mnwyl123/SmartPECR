package com.dcits.platform.service.system.DDLogin.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.service.system.DDLogin.DDLoginManager;
import com.dcits.platform.util.PageData;

@Service("ddLoginService")
public class DDLoginService implements DDLoginManager {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	
	public PageData DDloginUserDeal(PageData pd)throws Exception{
		PageData resultPd = new PageData();
		String result = "";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Map<String,Object> maps = (Map<String, Object>) pd.get("maps");
		String TknVerfFlg = (String) maps.get("TknVerfFlg");
		if("0".equals(TknVerfFlg)){
			String UsrCd = (String) maps.get("UsrCd");//获取用户编码
			String BlngBrchNo = (String) maps.get("BlngBrchNo");//获取所属机构号,通过所属机构查询法人。
			List<Object> roles =  (List<Object>) maps.get("RlInfoArr");//获取角色list
			resultPd.put("USER_ID", UsrCd);
			//先删除用户相关的数据包括sys_user,sys_user_role,sys_role,sys_user_org
			resultPd.put("ORG_CODE", BlngBrchNo);
			PageData comPd = (PageData) dao.findForObject("DDLoginMapper.getCompanyByOrg", resultPd);
			String company = comPd.getString("COMPANY");
			String orgId =  comPd.getString("ORG_ID");
			resultPd.put("COMPANY", company);
			resultPd.put("ORG_ID", orgId);
			dao.delete("DDLoginMapper.deleteU", resultPd);//删除用户
			dao.delete("DDLoginMapper.deleteAuthOrgC", resultPd);//删除用户机构表
			dao.delete("DDLoginMapper.deleteAuthRoleC", resultPd);//删除用户角色关系表
			PageData userPd = new PageData();
			userPd.put("USER_ID", UsrCd);
			userPd.put("USERNAME", (String) maps.get("UsrNm"));
			resultPd.put("USERNAME", (String) maps.get("UsrNm"));
			//userPd.put("PASSWORD", "6b07cab3419456bd7af577b0f649efde");//222222
			//resultPd.put("PASSWORD", "222222");
			userPd.put("NAME", (String) maps.get("UsrNm"));
			userPd.put("LAST_LOGIN", sdf.format(new Date()));
			userPd.put("IP", pd.getString("IP"));
			userPd.put("SKIN", "default");
			userPd.put("EMAIL", "222@111.com");
			userPd.put("TELLER_NUMBER", "99");
			userPd.put("PHONE", (String) maps.get("MblNo"));
			userPd.put("PWD_ALTER_TIME", sdf.format(new Date()));
			userPd.put("DEPT_CODE", "");
			userPd.put("STATE", "");
			userPd.put("ERR_TIMES", 0);
			userPd.put("LOCK_STATUS", "0");
			userPd.put("COMPANY", company);
			dao.save("DDLoginMapper.saveUser", userPd);
			dao.save("DDLoginMapper.saveOrgAuth", resultPd);
			for(int i = 0;i<roles.size();i++){
				PageData rolePd = new PageData();
				rolePd.put("USER_ID", UsrCd);
				String RlCd = roles.get(i).toString();
				Map<String, Object> RlCdmap = JSON.parseObject(RlCd);
				rolePd.put("ROLE_NAME", (String)RlCdmap.get("RlCd"));
				PageData demo = (PageData) dao.findForObject("DDLoginMapper.getRoleIdByName", rolePd);
				rolePd.put("ROLE_ID", demo.getString("ROLE_ID"));
				dao.save("DDLoginMapper.saveRoleAuth", rolePd);
			}
			result = "success";
		}else{
			result = "faild";
		}
		resultPd.put("result", result);
		return resultPd;
	}
}
