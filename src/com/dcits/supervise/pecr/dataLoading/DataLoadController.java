package com.dcits.supervise.pecr.dataLoading;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.dataLoading.mapper.DataLoadMapper;
import com.dcits.supervise.pecr.indv.entity.PecrIndvBsSgmt;
import com.dcits.supervise.pecr.indv.service.dataRecode.impl.IndvBasicsInfoService;

/**
 * 数据加载更行Controller
 * @author duanfx
 *
 */
@Controller
@RequestMapping("/dataLoad")
public class DataLoadController extends BaseController {
	
	@Autowired
	private DataLoadMapper service;
	private IndvBasicsInfoService indvBasicsInfoService;
	/**
	 * 获取数据加载页面
	 * @return
	 */
	@RequestMapping("/dataPage")
	public String dataPage() {
		return "pecr/dataLoad/dataLoad_list";
	}
	
	/**
	 * 获取表格数据列表
	 * @param page
	 * @return
	 */
	@RequestMapping("/dataloadList")
	@ResponseBody
	public Map<String, Object> dataList(Page page){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			PageData pd = this.getPageData();
			pd.put("COMPANY", company);
			pd.put("queryType", "APPLY");
			Boolean flag = (Boolean) session.getAttribute(user.getUSER_ID()+"isCompany");
			pd.put("managerId",flag?"":user.getUSERNAME());
			int pge = Integer.parseInt(pd.getString("page"));
			int limit = Integer.parseInt(pd.getString("limit"));
			page.setCurrentPage(pge);
			page.setShowCount(limit);
			page.setPd(pd);
			List<PecrIndvBsSgmt> dataList = indvBasicsInfoService.dataBsSgmtList(page);
			resultMap.put("code", 0);
			resultMap.put("msg","");
			resultMap.put("count", page.getTotalResult());
			resultMap.put("data", dataList);
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("code", 1);
		}
		return resultMap;
	}
	
	
	/**
	 * 数据更新
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("/dataLoad")
	public Map<String, Object>dataLoad()throws Exception{
		Map<String,Object> resultMap =new HashMap<>();
	    Map<String,Object> dataLoadMap = new HashMap<>();
	     //获取当前系统日期
	    Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String dataDate =sdf.format(date);
        String rptDate = dataDate.replace("-", "");
        dataLoadMap.put("rptDate", rptDate);
        dataLoadMap.put("DATA_DATE", dataDate);
        //删除个人基本信息模块的数据
        service.deleteIndvBasicInfo(dataLoadMap);
        //删除个人借贷信息表中的数据
        service.deleteLoanAcctInfo(dataLoadMap);
        //删除个人担保账户信息表中的数据
        service.deleteGuarAcctInfo(dataLoadMap);
        StringBuffer errOutExpress = new StringBuffer("");
        InputStream errin = null;
        InputStream mesin = null;
        BufferedReader stdoutReader = null;
        BufferedReader stderrReader = null;
        Process process = null;
        System.out.println("开始执行shell脚本");
        try {

            process = Runtime.getRuntime().exec(
                    " sh /sxthfg/SmartPECR/importDataPECR.sh");
            errin = process.getErrorStream();
            mesin = process.getInputStream();
            stdoutReader = new BufferedReader(new InputStreamReader(mesin));
            while (true) {
                String line = stdoutReader.readLine();
                if (line == null)
                    break;
            }
            stderrReader = new BufferedReader(new InputStreamReader(errin));
            while (true) {
                String line = stderrReader.readLine();
                if (line == null)
                    break;
                errOutExpress.append(line);
            }
            System.out.println("shell脚本执行完成");
            System.out.println("开始修改数据外键");
            service.updateMasterKey(dataLoadMap);
            System.out.println("修改数据外键结束");
            System.out.println("开始更新中间表中的数据");
            service.insetMiddleData(dataLoadMap);
            System.out.println("中间表中的数据更新完成");
            resultMap.put("msg","数据更新完成，请刷新查看新的数据");
		} catch (Exception e) {
			e.printStackTrace();
            System.out.println("数据更新执行出错" + e.getMessage());
            resultMap.put("msg","数据更新失败，请联系系统管理员");
		}
       
	     return resultMap;
	}
}
