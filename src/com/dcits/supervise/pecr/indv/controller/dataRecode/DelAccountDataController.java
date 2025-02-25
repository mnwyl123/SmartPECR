package com.dcits.supervise.pecr.indv.controller.dataRecode;


import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.shiro.session.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.dcits.supervise.pecr.indv.entity.inDel;
import com.dcits.supervise.pecr.indv.service.dataRecode.AccountChangeManager;
import com.dcits.supervise.pecr.indv.service.dataRecode.DelaccountDataManager;
import com.dcits.supervise.pecr.log.Operate;
import com.dcits.supervise.pecr.util.ImportExportData;
import com.dcits.supervise.pecr.util.ImportExportDataPerDel;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.FileDownload;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.PathUtil;

@Controller
@RequestMapping(value = "/delaccount")
public class DelAccountDataController extends BaseController {
	@Resource(name = "delaccountDataService")
	private DelaccountDataManager delAccountDataService;
	@Resource(name = "accountChangeService")
	private AccountChangeManager accountChangeService;
	/**
	 * 数据列表界面
	 * @return
	 */
	@RequestMapping("/dataPage")
	public String dataPage() {
		return "pecr/indv/dataRecode/indvDelAccountData_list";
	}
	

	@RequestMapping(value = "/delaccountdataList")
	@ResponseBody
	public Map<String, Object> listDelaccountData(Page page,HttpServletRequest request) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			PageData pd = this.getPageData();
			pd.put("COMPANY", company);
			pd.put("queryType", "APPLY");
			int pge = Integer.parseInt(pd.getString("page"));
			int limit = Integer.parseInt(pd.getString("limit"));
			page.setCurrentPage(pge);
			page.setShowCount(limit);
			page.setPd(pd);
			List<inDel> delaccountDataList = delAccountDataService.listDelaccountData(page);
			resultMap.put("data", delaccountDataList);
			resultMap.put("code", 0);
			resultMap.put("count", page.getTotalResult());
			resultMap.put("msg", "");		
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("code", 1);
		}
		
		return resultMap;
	}

	
	/**
	 *     新增或修改数据
	 */
	@Operate(modulName = "个人按段删除请求记录--新增/修改")
	@RequestMapping(value = "/addOrUpdateUser")
	@ResponseBody
	public Object add(Page page) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("success", true);
		PageData pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		try {
			pd.put("operatorUser", user.getUSERNAME());	
			pd.put("COMPANY", company);
			String addOrUpdate = pd.getString("addOrUpdate");
			if("add".equalsIgnoreCase(addOrUpdate)) {
				if(pd.get("infRecType").equals("213")) {
					delAccountDataService.saveLoan(pd);
				}else if(pd.get("infRecType").equals("134")) {
					delAccountDataService.saveIDE(pd);
				}else if(pd.get("infRecType").equals("233")) {
					delAccountDataService.saveGua(pd);
				}else if(pd.get("infRecType").equals("114")) {
					delAccountDataService.saveBasic(pd);
				}else if(pd.get("infRecType").equals("223")) {
					delAccountDataService.savePro(pd);
				}else if(pd.get("infRecType").equals("234")) {
					delAccountDataService.saveGuaEnt(pd);
				}else if(pd.get("infRecType").equals("214")) {
					delAccountDataService.saveLoanEnt(pd);
				}else if(pd.get("infRecType").equals("224")) {
					delAccountDataService.saveProEnt(pd);
				}
			}else {
				if(pd.get("infRecType").equals("213")) {
					delAccountDataService.updateLoan(pd);
				}else if(pd.get("infRecType").equals("134")) {
					delAccountDataService.updateIDE(pd);
				}else if(pd.get("infRecType").equals("233")) {
					delAccountDataService.updateGua(pd);
				}else if(pd.get("infRecType").equals("114")) {
					delAccountDataService.updateBasic(pd);
				}else if(pd.get("infRecType").equals("223")) {
					delAccountDataService.updatePro(pd);
				}else if(pd.get("infRecType").equals("234")) {
					delAccountDataService.updateGuaEnt(pd);
				}else if(pd.get("infRecType").equals("214")) {
					delAccountDataService.updateLoanEnt(pd);
				}else if(pd.get("infRecType").equals("224")) {
					delAccountDataService.updateProEnt(pd);
				}
			}			
		} catch (Exception e) {
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
			logger.error(e.toString(), e);
		}
		    return resultMap;
	}
	
	
	/**
	 * 删除的方法
	 * @param page
	 * @return
	 */
	@Operate(modulName = "个人按段删除请求记录--删除")
	@RequestMapping(value = "/delete")
	@ResponseBody
	public Object delData(Page page) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		resultMap.put("success", true);
		try {
			PageData pd = this.getPageData();
			pd.put("COMPANY", company);
			if(pd.get("infRecType").equals("213")) {
				delAccountDataService.delLoan(pd);
			}else if(pd.get("infRecType").equals("134")) {
				delAccountDataService.delIDE(pd);
			}else if(pd.get("infRecType").equals("233")) {
				delAccountDataService.delGua(pd);
			}else if(pd.get("infRecType").equals("114")) {
				delAccountDataService.delBasic(pd);
			}else if(pd.get("infRecType").equals("223")) {
				delAccountDataService.delPro(pd);
			}else if(pd.get("infRecType").equals("234")) {
				delAccountDataService.delGuaEnt(pd);
			}else if(pd.get("infRecType").equals("214")) {
				delAccountDataService.delLoanEnt(pd);
			}else if(pd.get("infRecType").equals("224")) {
				delAccountDataService.delProEnt(pd);
			}
		} catch (Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());
		}
		return resultMap;
	}
	
	/**下载模版
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value="/downExcel")
	public void downExcel(HttpServletResponse response)throws Exception{
		PageData pd = this.getPageData();
		String type = pd.getString("type");
		if("114".equals(type)){
			FileDownload.fileDownload(response, PathUtil.getClasspath1() + Const.FILEPATHFILE + "114DelAccount.xlsx", "114个人基本信息整笔删除模板.xlsx");
		}
		if("134".equals(type)){
			FileDownload.fileDownload(response, PathUtil.getClasspath1() + Const.FILEPATHFILE + "134DelAccount.xlsx", "134个人证件有效期信息整笔删除模板.xlsx");
		}
		if("213".equals(type)){
			FileDownload.fileDownload(response, PathUtil.getClasspath1() + Const.FILEPATHFILE + "213DelAccount.xlsx", "213个人借贷账户按段删除模板.xlsx");
		}
		if("214".equals(type)){
			FileDownload.fileDownload(response, PathUtil.getClasspath1() + Const.FILEPATHFILE + "214DelAccount.xlsx", "214个人借贷账户整笔删除模板.xlsx");
		}
		if("223".equals(type)){
			FileDownload.fileDownload(response, PathUtil.getClasspath1() + Const.FILEPATHFILE + "223DelAccount.xlsx", "223个人授信协议按段删除模板.xlsx");
		}
		if("224".equals(type)){
			FileDownload.fileDownload(response, PathUtil.getClasspath1() + Const.FILEPATHFILE + "224DelAccount.xlsx", "224个人授信协议整笔删除模板.xlsx");
		}
		if("233".equals(type)){
			FileDownload.fileDownload(response, PathUtil.getClasspath1() + Const.FILEPATHFILE + "233DelAccount.xlsx", "233个人担保账户按段删除模板.xlsx");
		}
		if("234".equals(type)){
			FileDownload.fileDownload(response, PathUtil.getClasspath1() + Const.FILEPATHFILE + "234DelAccount.xlsx", "234个人担保账户整笔删除模板.xlsx");
		}
	}
	
	/**
	 * js前台决定对上传文件名和选择的信息记录类型做一个校验，放置模板一样但是记录类型不一样的情况在出现手误的情况下成功导入。
	 * 生成记录的时候应该进行“是否在历史表中存在的校验”，所以数据应该上传数据应该单独放置在对应的新建表中。
	 */
	@RequestMapping(value = "/readExcel")
	@ResponseBody
	public Object readExcel(@RequestParam(value = "excel", required = false) MultipartFile file,
							@RequestParam(value = "infRecType", required = false) String infRecType){
		Map<String, Object> map = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User userInfo = (User) Jurisdiction.getSession().getAttribute("sessionUser");
		String USERID = userInfo.getUSER_ID();
		String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		PageData pd = new PageData();
		pd.put("COMPANY", company);
		pd.put("INF_REC_TYPE", infRecType);
		pd.put("OPERATOR_USER", userInfo.getUSERNAME());
		try {
			String filename = file.getOriginalFilename();
			String fileType = filename.substring(filename.lastIndexOf(".")+1,filename.length());
			if("xlsx".equals(fileType)){
				CommonsMultipartFile cf = (CommonsMultipartFile) file;
				DiskFileItem fi = (DiskFileItem) cf.getFileItem();
				File ff = fi.getStoreLocation();
				Map<String,Object> resultMap = new ImportExportDataPerDel(ff,delAccountDataService,pd).getData();
				if("SUCC".equals(resultMap.get("RESULT").toString())){
					int nums = delAccountDataService.saveDelInfoByBatchList(pd);
					map.put("msg", "Excel批量成功导入："+ nums +"条记录！");
					map.put("result", "SUCCESS");
				}else{
					map.put("msg", "Excel批量解析失败！！！");
					map.put("result", "FAIL");
				}
				String path = ff.getAbsolutePath()+File.separator+ff.getName();
				//删除临时文件
				try{
					File txt = new File(path);
					txt.delete();
				}catch(Exception e){
					logger.error("临时文件删除失败："+e.getMessage(), e);
				}
			}else{
				logger.error("读取的不是excel文件");
				map.put("msg", "读取的不是excel文件");
				map.put("result", "FAIL");
			}
			
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			map.put("msg", "系统异常，请联系管理员！");
			map.put("result", "FAIL");
		}
		return map;
	}
}
