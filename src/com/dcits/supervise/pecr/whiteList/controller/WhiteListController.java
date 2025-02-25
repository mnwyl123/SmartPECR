package com.dcits.supervise.pecr.whiteList.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.whiteList.service.WhiteListManager;
/**
 * 征信报送白名单维护
 * @author zhanggy
 *
 */
@Controller
@RequestMapping("/whiteMsgMaintenance")
public class WhiteListController extends BaseController{

	@Autowired
	private WhiteListManager whiteListService; 
	

	/**
	 * 数据列表界面
	 * @return
	 */
	@RequestMapping("/dataPageProduct")
	public String dataPageProduct() {
		return "pecr/whiteList/white_product";
	}
	/**
	 * 数据列表界面
	 * @return
	 */
	@RequestMapping("/dataPageCustomer")
	public String dataPageCustomer() {
		return "pecr/whiteList/white_customer";
	}
	/**
	 * 数据列表界面
	 * @return
	 */
	@RequestMapping("/dataPageBusiness")
	public String dataPageBusiness() {
		return "pecr/whiteList/white_business";
	}
	
	/**
	 * 获取表格数据列表
	 * @param page
	 * @return
	 */
	@RequestMapping("/product_list")
	@ResponseBody
	public Map<String, Object> productList(Page page){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			PageData pd = this.getPageData();
			String type = pd.getString("type");
			int pge = Integer.parseInt(pd.getString("page"));
			int limit = Integer.parseInt(pd.getString("limit"));
			page.setCurrentPage(pge);
			page.setShowCount(limit);
			page.setPd(pd);
			List<PageData> list = null;
			if("product".equals(type)){
				list = whiteListService.productList(page);
			}else if("customer".equals(type)){
				list = whiteListService.customerList(page);
				
			}else if("business".equals(type)){
				list = whiteListService.businessList(page);
			}else{
				resultMap.put("code", 1);
			}

				
			resultMap.put("data", list);
			resultMap.put("code", 0);
			resultMap.put("count", page.getTotalResult());
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("code", 1);
		}
		return resultMap;
	}

	
	/**
	 * 保存修改,新增,根据flag判断
	 * 
	 * @param page
	 * @return
	 */
	@RequestMapping("/product_save")
	@ResponseBody
	public Map<String, Object> productSave(Page page) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			PageData pd = this.getPageData();
			String flag = pd.getString("addOrSave");
			int count = whiteListService.selectCountProduct(pd);
			
			if(count == 0){
				if("add".equals(flag)){
					whiteListService.insertWhiteProduct(pd);
					resultMap.put("success", true);
				}else if("save".equals(flag)){
					whiteListService.updateWhiteProduct(pd);
					resultMap.put("success", true);
					
				}else{
					resultMap.put("success", false);
					resultMap.put("msg", "方法异常,请联系管理员!");	
				}
				
			}else{
				resultMap.put("success", false);
				resultMap.put("msg", "产品已存在,不能重复维护!");				
			}
			
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());		
//			resultMap.put("code", 1);
		}
		return resultMap;
	}
	

	/**
	 * 修改,删除,根据flag判断
	 * 
	 * @param page
	 * @return
	 */
	@RequestMapping("/product_editdel")
	@ResponseBody
	public Map<String, Object> productEditdel(Page page) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			PageData pd = this.getPageData();
			String flag = pd.getString("delOrUpdate");
			int count = whiteListService.selectCountMsgProduct(pd);
			
			if(count == 0){
				if("update".equals(flag)){
					//修改时请求状态查询
					PageData oneProduct = whiteListService.selectOneProduct(pd);
					
					resultMap.put("success", true);
					resultMap.put("data", oneProduct);
					
				}else if("delete".equals(flag)){
					whiteListService.deleteWhiteProduct(pd);
					resultMap.put("success", true);
					
				}else{
					resultMap.put("success", false);
					resultMap.put("msg", "方法异常,请联系管理员!");	
				}
				
			}else{
				resultMap.put("success", false);
				resultMap.put("msg", "产品已在配置信息中使用,需维护请先修改配置信息!");				
			}
			
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());		
//			resultMap.put("code", 1);
		}
		return resultMap;
	}
	
	
	
	
	
	
	

	
	/**
	 * 保存修改,新增,根据flag判断
	 * 
	 * @param page
	 * @return
	 */
	@RequestMapping("/customer_save")
	@ResponseBody
	public Map<String, Object> customerSave(Page page) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			PageData pd = this.getPageData();
			String flag = pd.getString("addOrSave");
			int count = whiteListService.selectCountCustomer(pd);
			
			if(count == 0){
				if("add".equals(flag)){
					whiteListService.insertWhiteCustomer(pd);
					resultMap.put("success", true);
				}else if("save".equals(flag)){
					whiteListService.updateWhiteCustomer(pd);
					resultMap.put("success", true);
					
				}else{
					resultMap.put("success", false);
					resultMap.put("msg", "方法异常,请联系管理员!");	
				}
				
			}else{
				resultMap.put("success", false);
				resultMap.put("msg", "产品已存在,不能重复维护!");				
			}
			
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());		
//			resultMap.put("code", 1);
		}
		return resultMap;
	}
	

	/**
	 * 修改,删除,根据flag判断
	 * 
	 * @param page
	 * @return
	 */
	@RequestMapping("/customer_editdel")
	@ResponseBody
	public Map<String, Object> customerEditdel(Page page) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			PageData pd = this.getPageData();
			String flag = pd.getString("delOrUpdate");
			int count = whiteListService.selectCountMsgCustomer(pd);
			
			if(count == 0){
				if("update".equals(flag)){
					//修改时请求状态查询
					PageData oneCustomer = whiteListService.selectOneCustomer(pd);
					
					resultMap.put("success", true);
					resultMap.put("data", oneCustomer);
					
				}else if("delete".equals(flag)){
					whiteListService.deleteWhiteCustomer(pd);
					resultMap.put("success", true);
					
				}else{
					resultMap.put("success", false);
					resultMap.put("msg", "方法异常,请联系管理员!");	
				}
				
			}else{
				resultMap.put("success", false);
				resultMap.put("msg", "产品已在配置信息中使用,需维护请先修改配置信息!");				
			}
			
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());		
//			resultMap.put("code", 1);
		}
		return resultMap;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	


	
	/**
	 * 保存修改,新增,根据flag判断
	 * 
	 * @param page
	 * @return
	 */
	@RequestMapping("/business_save")
	@ResponseBody
	public Map<String, Object> businessSave(Page page) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			PageData pd = this.getPageData();
			String flag = pd.getString("addOrSave");
			int count = whiteListService.selectCountBusiness(pd);
			
			if(count == 0){
				if("add".equals(flag)){
					whiteListService.insertWhiteBusiness(pd);
					resultMap.put("success", true);
				}else if("save".equals(flag)){
					whiteListService.updateWhiteBusiness(pd);
					resultMap.put("success", true);
					
				}else{
					resultMap.put("success", false);
					resultMap.put("msg", "方法异常,请联系管理员!");	
				}
				
			}else{
				resultMap.put("success", false);
				resultMap.put("msg", "产品已存在,不能重复维护!");				
			}
			
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());		
//			resultMap.put("code", 1);
		}
		return resultMap;
	}
	

	/**
	 * 修改,删除,根据flag判断
	 * 
	 * @param page
	 * @return
	 */
	@RequestMapping("/business_editdel")
	@ResponseBody
	public Map<String, Object> businessEditdel(Page page) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			PageData pd = this.getPageData();
			String flag = pd.getString("delOrUpdate");
			int count = whiteListService.selectCountMsgBusiness(pd);
			
			if(count == 0){
				if("update".equals(flag)){
					//修改时请求状态查询
					PageData oneBusiness = whiteListService.selectOneBusiness(pd);
					
					resultMap.put("success", true);
					resultMap.put("data", oneBusiness);
					
				}else if("delete".equals(flag)){
					whiteListService.deleteWhiteBusiness(pd);
					resultMap.put("success", true);
					
				}else{
					resultMap.put("success", false);
					resultMap.put("msg", "方法异常,请联系管理员!");	
				}
				
			}else{
				resultMap.put("success", false);
				resultMap.put("msg", "产品已在配置信息中使用,需维护请先修改配置信息!");				
			}
			
		}catch(Exception e) {
			logger.error(e.getMessage());
			resultMap.put("success", false);
			resultMap.put("msg", e.getMessage());		
//			resultMap.put("code", 1);
		}
		return resultMap;
	}
	
	
	
	
	
	
	
	
}








