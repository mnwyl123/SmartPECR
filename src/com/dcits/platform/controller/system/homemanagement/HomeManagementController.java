package com.dcits.platform.controller.system.homemanagement;

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


import com.dcits.platform.entity.system.User;
import com.dcits.platform.util.AppUtil;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.ObjectExcelView;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.role.RoleAuthFactory;
import com.dcits.platform.service.system.homemanagement.HomeManagementManager;
import com.dcits.platform.service.system.moduleapp.ModuleAppManager;
/** 
 * 说明：首页管理
 * 创建人：  
 * 创建时间：2018-03-01
 */
@Controller
@RequestMapping(value="/homemanagement")
public class HomeManagementController extends BaseController {

	@Resource(name="homemanagementService")
	private HomeManagementManager homemanagementService;

	
	private RoleAuthFactory roleAtuhFactory;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增HomeManagement");
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		//此处主键根据实际情况来设定
		pd.put("***", this.get32UUID());	//主键
		homemanagementService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete") 
	@ResponseBody
	public Object delete() throws NumberFormatException, Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除HomeManagement");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		Map<String,String> map = new HashMap<String,String>();
		PageData pd = this.getPageData();
		String errInfo = "success";  
		homemanagementService.delete(pd); 
		map.put("result", errInfo);
		return AppUtil.returnObject(new PageData(), map);
	}
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改HomeManagement");
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		pd.put("MODULE_ID", pd.get("MODULE_ID1").toString());
		homemanagementService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表HomeManagement");
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		List<String> roleIds = (List<String>) session.getAttribute(USERID+Const.SESSION_ROLE_RIGHTS);
		String menuId = pd.getString("menuId");
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = homemanagementService.list(page);	//列出HomeManagement列表
		mv.setViewName("system/homemanagement/homemanagement_list");
		mv.addObject("varList", varList);
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
		mv.setViewName("system/homemanagement/homemanagement_edit");
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
		pd = homemanagementService.findById(pd);	//根据ID读取
		mv.setViewName("system/homemanagement/homemanagement_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}	
	 /**去修改页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/editpro")
	public ModelAndView editpro()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		pd = homemanagementService.findById(pd);	//根据ID读取
		mv.setViewName("system/homemanagement/homemanagement_editpro");
		mv.addObject("msg", "edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除HomeManagement");
		PageData pd = this.getPageData();
		Map<String,Object> map = new HashMap<String,Object>();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			homemanagementService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出HomeManagement到excel");
		PageData pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("模块ID");	//1
		titles.add("模块名称");	//2
		titles.add("图标");	//3
		dataMap.put("titles", titles);
		List<PageData> varOList = homemanagementService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("MODULE_ID"));	//1
			vpd.put("var2", varOList.get(i).getString("MODULE_NAME"));	//2
			vpd.put("var3", varOList.get(i).getString("MODULE_PICTURE"));	//3
			varList.add(vpd);
		}
		dataMap.put("varList", varList);
		ObjectExcelView erv = new ObjectExcelView();
		ModelAndView mv  = new ModelAndView(erv,dataMap);
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
			if(homemanagementService.findById(pd) != null){
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
