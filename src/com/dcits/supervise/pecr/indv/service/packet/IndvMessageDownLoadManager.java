package com.dcits.supervise.pecr.indv.service.packet;

import java.util.List;
import java.util.Map;

import com.dcits.platform.entity.Page;

public interface IndvMessageDownLoadManager {

	 public List<Map<String, Object>> getIndvMessageDownLoad(Page page) throws Exception;
	 public List<Map<String, Object>> getEntMessageDownLoad(Page page) throws Exception;
	 public List<Map<String, Object>> getIndvSpMessageDownLoad(Page page) throws Exception;
	 public List<Map<String, Object>> getEntSpMessageDownLoad(Page page) throws Exception;
	 public List<Map<String, Object>> getMoMessageDownLoad(Page page) throws Exception;
	 public List<Map<String, Object>> getMoSpMessageDownLoad(Page page) throws Exception;
	 
	 public List<Map<String, Object>> getReportMessageDataPage(Page page) throws Exception;
	 
	 /**
	  * 根据报文名和报文类型将报文状态为 60	预处理成功 修改为 41	反馈全成功
	  * @param listMaps
	  * @throws Exception
	  */
	 public void updateReportStatus(List<Map<String,String>> listMaps)throws Exception;
	 /**
	  * 根据报文名和报文类型获取数据状态为50	已生成报文 的数量
	  * @param map
	  * @return
	  * @throws Exception
	  */
	 public int getNumByReportTypeAndName(Map<String,String> map)throws Exception;
}
