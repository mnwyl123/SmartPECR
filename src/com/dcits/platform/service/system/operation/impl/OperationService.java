package com.dcits.platform.service.system.operation.impl;

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
import com.dcits.platform.service.system.operation.OperationManager;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.UuidUtil;

@Service("operationService")
public class OperationService implements OperationManager{
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("OperationMapper.listPage", page);
	}
	
	// 获取MAC地址
	public String getMac(){ 
		String sMAC = ""; 
			Formatter formatter = new Formatter(); 
		  try{ 
		      InetAddress address = InetAddress.getLocalHost(); 
		      NetworkInterface ni = NetworkInterface.getByInetAddress(address); 
		      if(ni!=null){
		    	  byte[] mac = ni.getHardwareAddress(); 
			      if(mac!=null){
			    	  for (int i = 0; i < mac.length; i++) { 
				          sMAC = formatter.format(Locale.getDefault(), "%02X%s", mac[i], 
				                  (i < mac.length - 1) ? "-" : "").toString(); 
				      } 
			      } 
		      }else{
		    	  
		    	  sMAC = "00-00-00-00-00-00";
		      }
		      
		  }catch(Exception e){ 
		      e.printStackTrace(); 
		  }finally{
			  formatter.close();
		  }
		  return sMAC;
	} 
	
	//添加日志
	public void operationLog(String url,String operation){
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		PageData oper = (PageData) session.getAttribute(USERID+Const.SESSION_LoginInfo);
		oper.put("OPERATION_TIME",  new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		oper.put("OPERATION_DESC", operation);
		oper.put("LOG_ID", UuidUtil.get32UUID());
		oper.put("OPERATION_URL", url);
		try {
			addLog(oper);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//向数据库中插入数据
	@Override
	public void addLog(PageData pd)throws Exception{
		dao.save("OperationMapper.addLog", pd);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, String>> excelExport(Map<String, String> map) throws Exception {
		return (List<Map<String, String>>)dao.findForList("OperationMapper.excelExport", map);
	}
	
	@Override
	public String getmenuname(PageData pd) throws Exception {
		return (String)dao.findForObject("OperationMapper.getmenuname", pd);
	}
}
