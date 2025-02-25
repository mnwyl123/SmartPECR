package com.dcits.supervise.pecr.ent.controller.packet;

import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.FileDownload;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.indv.service.packet.IndvMessageDownLoadManager;

import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.RejectedExecutionException;

/**
 * 个人担保账户信息
 * @author leizx
 *
 */
@Controller
@RequestMapping("/entMessageDownLoad")
public class EntMessageDownLoadController extends BaseController{

	@Autowired
	private IndvMessageDownLoadManager IndvMessageDownLoad;
	
	/**
	 * 数据列表界面
	 * @return
	 */
	@RequestMapping("/dataPage")
	public String dataPage() {
		return "pecr/indv/packet/indvMessageDownLoadList";
	}
	
	/**
	 * 获取表格数据列表
	 * @param page
	 * @return
	 */
	@RequestMapping("/dataList")
	@ResponseBody
	public Map<String, Object> acctInfoList(Page page){
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			PageData pd = this.getPageData();
			pd.put("COMPANY", company);
			int pge = Integer.parseInt(pd.getString("page"));
			int limit = Integer.parseInt(pd.getString("limit"));
			page.setCurrentPage(pge);
			page.setShowCount(limit);
			page.setPd(pd);
			List<Map<String, Object>> dataList = IndvMessageDownLoad.getEntMessageDownLoad(page);
			resultMap.put("data", dataList);
			resultMap.put("code", 0);
			resultMap.put("count", page.getTotalResult());
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("code", 1);
		}
		return resultMap;
	}
	
	@ResponseBody
	@RequestMapping("/download")
	public Map<String, Object> generateMessage(HttpServletResponse response){
		Map<String, Object> map = new HashMap<String,Object>(3); 
		try{
			PageData pd = this.getPageData();
			String str = pd.get("str").toString();
			if(str.isEmpty()){
				logger.info("报文整体类型为空");
				map.put("success", false);
				map.put("msg", "报文整体类型为空");
				return map;
			}
			String[] strs = str.split(";");
			int size = strs.length;
			for(int i = 0;i<size;i++) {
				String path = strs[i].replace(",", File.separator);
				FileDownload.fileDownload(response, path, path);
				//File file = new File(path);
			}
			
			logger.info("正在下载报文，请稍后查看");
			map.put("success", false);
			map.put("msg", "正在下载报文，请稍后查看");
			return map;
		}catch(RejectedExecutionException e){
			logger.info("下载报文任务繁忙，请稍后再试",e);
			map.put("success", false);
			map.put("msg", "下载报文任务繁忙，请稍后再试");
			return map;
		}catch(IllegalStateException e){
			logger.info("下载报文任务错误，请稍后再试",e);
			map.put("success", false);
			map.put("msg", "下载报文任务错误，请稍后再试");
			return map;
		}catch(Exception e){
			logger.info("下载报文任务错误，请联系管理员",e);
			map.put("success", false);
			map.put("msg", "下载报文任务错误，请联系管理员");
			return map;
		}
	}
}
