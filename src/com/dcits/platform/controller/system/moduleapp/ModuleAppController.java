package com.dcits.platform.controller.system.moduleapp;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;

import org.apache.shiro.session.Session;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.SysApp;
import com.dcits.platform.entity.system.Role;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.util.AppUtil;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.ObjectExcelView;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.role.RoleAuthFactory;
import com.dcits.platform.service.system.moduleapp.ModuleAppManager;
import com.dcits.platform.service.system.sysApp.SysAppManager;

/** 
 * 说明：管理模块系统（产品）
 * 创建人：  sunqfb
 * 创建时间：2018-03-01
 */
@Controller
@RequestMapping(value="/moduleapp")
public class ModuleAppController extends BaseController {
	
	@Resource(name="moduleappService")
	private ModuleAppManager moduleappService;
	@Resource(name="sysAppService")
	private SysAppManager sysAppService;
	private RoleAuthFactory roleAtuhFactory;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增moduleapp");
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		pd.put("MODULE_ID", pd.get("MODULE_ID1").toString());
		//此处主键根据实际情况来设定
		pd.put("***", this.get32UUID());	//主键
		moduleappService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除moduleapp");
		PageData pd = this.getPageData();
		moduleappService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改moduleapp");
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		pd.put("MODULE_ID", pd.get("MODULE_ID1").toString());
		if(pd.get("SYS_INDD")!=null&&!pd.get("SYS_INDD").equals(null)){
			pd.put("SYS_IND", pd.get("SYS_INDD").toString());
		}
		//if(pd.get("MODULE_ID1")!=null&&!pd.get("MODULE_ID1").equals(null)){
		//	pd.put("MODULE_ID", pd.get("MODULE_ID1").toString());
		//}
		moduleappService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表moduleapp");
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		if(pd.get("MODULE_ID1")!=null&&!pd.get("MODULE_ID1").equals(null)){
			pd.put("MODULE_ID", pd.get("MODULE_ID1").toString());
		}
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		List<SysApp> appList = sysAppService.appList(pd);//列出所有系统(产品)
		List<String> roleIds = (List<String>) session.getAttribute(USERID+Const.SESSION_ROLE_RIGHTS);
		String menuId = pd.getString("menuId");
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = moduleappService.list(page);	//列出moduleapp列表
		mv.setViewName("system/moduleapp/moduleapp_list");
		mv.addObject("varList", varList);
		mv.addObject("appList", appList);
		mv.addObject("pd", pd);
		mv.addObject("QX",roleAtuhFactory.getHC(roleIds,menuId));	//按钮权限
		return mv;
	}
	
	/**去新增页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		List<SysApp> appList = sysAppService.appList(pd);//列出所有系统(产品)
		mv.setViewName("system/moduleapp/moduleapp_edit");
		mv.addObject("appList", appList);
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**去修改页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		pd = moduleappService.findById(pd);	//根据ID读取
		if(pd.get("SYS_INDD")!=null&&!pd.get("SYS_INDD").equals(null)){
			pd.put("SYS_IND", pd.get("RPO_IDD").toString());
		}
		List<SysApp> appList = sysAppService.appList(pd);//列出所有系统(产品)
		mv.setViewName("system/moduleapp/moduleapp_edit");
		mv.addObject("msg", "edit");
		mv.addObject("appList", appList);
		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**批量删除
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量删除moduleapp");
		PageData pd = this.getPageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			moduleappService.deleteAll(ArrayDATA_IDS);
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	
	 /**导出到excel
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"导出moduleapp到excel");
		PageData pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("模块ID");	//1
		titles.add("系统（产品）id");	//2
		titles.add("排序");	//3
		dataMap.put("titles", titles);
		List<PageData> varOList = moduleappService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("MODULE_ID"));	//1
			vpd.put("var2", varOList.get(i).getString("SYS_IND"));	//2
			vpd.put("var3", varOList.get(i).getString("SEQ"));	//3
			varList.add(vpd);
		}
		dataMap.put("varList", varList);
		ObjectExcelView erv = new ObjectExcelView();
		ModelAndView mv = new ModelAndView(erv,dataMap);
		return mv;
	}
	/**判断编码是否存在
	 * @return
	 */
	@RequestMapping(value="/hasD")
	@ResponseBody
	public Object hasD(){
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "success";
		PageData pd = this.getPageData();
		try{
			if(moduleappService.findById(pd) != null){
				errInfo = "error";
			}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);				//返回结果
		return AppUtil.returnObject(new PageData(), map);
	}
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
