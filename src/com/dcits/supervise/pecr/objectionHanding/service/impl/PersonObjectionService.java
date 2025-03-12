package com.dcits.supervise.pecr.objectionHanding.service.impl;


import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.objectionHanding.entity.ObjectItem;
import com.dcits.supervise.pecr.objectionHanding.service.PersonObjectionManager;

/** 
 * 个人异议信息
 * 创建人：穆楠  
 */
@Service("PersonObjectionService")
public class PersonObjectionService implements PersonObjectionManager{
	private static Logger logger = Logger.getLogger(PersonObjectionService.class);
	
	@Resource(name = "daoSupportPecr")
	private DaoSupportPecr dao;
	
	/**通过系统用户名获取人行用户名
	 * @param str
	 * @throws Exception
	 */
	public String findUsernamePerBank(String str)throws Exception{
		return (String)dao.findForObject("ObjectionHandingMapper.findUsernamePerBank", str);
	}
	/**通过系统用户名获取人行账户信息
	 * @param str
	 * @throws Exception
	 */
	public PageData findPerBankInfo()throws Exception{
		return (PageData)dao.findForObject("ObjectionHandingMapper.findPerBankInfo", null);
	}
	/**通过系统用户名获取人行账户信息
	 * @param str
	 * @throws Exception
	 */
	public PageData findComBankInfo()throws Exception{
		return (PageData)dao.findForObject("ObjectionHandingMapper.findComBankInfo", null);
	}
	/**通过人行用户名获取人行密码
	 * @param str
	 * @throws Exception
	 */
	public String findPasswordPerBank(String str)throws Exception{
		return (String)dao.findForObject("ObjectionHandingMapper.findPasswordPerBank", str);
	}
	/**通过系统用户名获取流程表值
	 * @param str
	 * @throws Exception
	 */
	public PageData findFs(String str)throws Exception{
		return (PageData)dao.findForObject("ObjectionHandingMapper.findFs", str);
	}
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void saveResultToCheckObjection(PageData pd)throws Exception{
		dao.save("ObjectionHandingMapper.saveResultToCheckObjection", pd);
	}
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void saveResultSubToCheckObjection(PageData pd)throws Exception{
		dao.save("ObjectionHandingMapper.saveResultSubToCheckObjection", pd);
	}
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void saveResultSubLastToCheckObjection(PageData pd)throws Exception{
		dao.save("ObjectionHandingMapper.saveResultSubLastToCheckObjection", pd);
	}
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void saveResultToCheckObjectionEnclosure(PageData pd)throws Exception{
		dao.save("ObjectionHandingMapper.saveResultToCheckObjectionEnclosure", pd);
	}
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void toCheckObjectionResult(PageData pd)throws Exception{
		dao.save("ObjectionHandingMapper.toCheckObjectionResult", pd);
	}
	/**异议事项更正结果接受
	 * @param pd
	 * @throws Exception
	 */
	public void saveResultToObjectionCorrectAccept(PageData pd)throws Exception{
		dao.save("ObjectionHandingMapper.saveResultToObjectionCorrectAccept", pd);
	}
	/**添加个人标注
	 * @param pd
	 * @throws Exception
	 */
	public void saveResultToAddLabel(PageData pd)throws Exception{
		dao.save("ObjectionHandingMapper.saveResultToAddLabel", pd);
	}
	/**修改标注信息
	 * @param pd
	 * @throws Exception
	 */
	public void update_UserId(PageData pd)throws Exception{
		dao.update("ObjectionHandingMapper.update_UserId", pd);
	}
	/**存入异议信息表请求1
	 * @param pd
	 * @throws Exception
	 */
	public void saveToObjectionInfoOne(PageData pd)throws Exception{
		dao.save("ObjectionHandingMapper.saveToObjectionInfoOne", pd);
	}
	/**存入异议信息表请求2,5
	 * @param pd
	 * @throws Exception
	 */
	public void saveToObjectionInfoTwo(PageData pd)throws Exception{
		dao.save("ObjectionHandingMapper.saveToObjectionInfoTwo", pd);
	}
	/**存入异议信息表请求3
	 * @param pd
	 * @throws Exception
	 */
	public void saveToObjectionInfoThree(PageData pd)throws Exception{
		dao.save("ObjectionHandingMapper.saveToObjectionInfoThree", pd);
	}
	/**存入异议信息表请求4
	 * @param pd
	 * @throws Exception
	 */
	public void saveToObjectionInfoFour(PageData pd)throws Exception{
		dao.save("ObjectionHandingMapper.saveToObjectionInfoFour", pd);
	}
	/**存入异议信息表请求6
	 * @param pd
	 * @throws Exception
	 */
	public void saveToObjectionInfoSix(PageData pd)throws Exception{
		dao.save("ObjectionHandingMapper.saveToObjectionInfoSix", pd);
	}
	/**存入异议信息表请求7
	 * @param pd
	 * @throws Exception
	 */
	public void saveToObjectionInfoSeven(PageData pd)throws Exception{
		dao.save("ObjectionHandingMapper.saveToObjectionInfoSeven", pd);
	}
	/**存入流程状态表
	 * @param pd
	 * @throws Exception
	 */
	public void saveToFs(PageData pd)throws Exception{
		dao.save("ObjectionHandingMapper.saveToFs", pd);
	}
	/**更新流程表
	 * @param pd
	 * @throws Exception
	 */
	public void updateFs(PageData pd)throws Exception{
		dao.update("ObjectionHandingMapper.updateFs", pd);
	}
	/**待核查主表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listToCheckMainlistPage(Page page)throws Exception{
		return (List<PageData>)dao.findForList("ObjectionHandingMapper.listToCheckMainlistPage", page);
	}
	/**待核查子表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listToCheckSublistPage(Page page)throws Exception{
		return (List<PageData>)dao.findForList("ObjectionHandingMapper.listToCheckSublistPage", page);
	}
	/**待核查二级子表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listToCheckSubLastlistPage(Page page)throws Exception{
		return (List<PageData>)dao.findForList("ObjectionHandingMapper.listToCheckSubLast", page);
	}
	/**待核查附件列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listToCheckEnclosurelistPage(Page page)throws Exception{
		return (List<PageData>)dao.findForList("ObjectionHandingMapper.listToCheckEnclosurelistPage", page);
	}
	/**待核查结果列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listToCheckResultlistPage(Page page)throws Exception{
		return (List<PageData>)dao.findForList("ObjectionHandingMapper.listToCheckResultlistPage", page);
	}
	/**更正结果列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listCorrectlistPage(Page page)throws Exception{
		return (List<PageData>)dao.findForList("ObjectionHandingMapper.listCorrectlistPage", page);
	}
	/**更正结果接受列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listCorrectAcceptlistPage(Page page)throws Exception{
		return (List<PageData>)dao.findForList("ObjectionHandingMapper.listCorrectAcceptlistPage", page);
	}
	/**添加个人标注列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAddPersonLabellistPage(Page page)throws Exception{
		return (List<PageData>)dao.findForList("ObjectionHandingMapper.listAddPersonLabellistPage", page);
	}
	/**删除个人标注列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listDeletePersonLabellistPage(Page page)throws Exception{
		return (List<PageData>)dao.findForList("ObjectionHandingMapper.listDeletePersonLabellistPage", page);
	}
	
	/**
	 * 根据法人查询此法人下的所有机构
	 * @param company
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findOrgByCompany(String company) throws Exception{
		return (List<PageData>)dao.findForList("ObjectionHandingMapper.findOrgByCompany", company);
	}
	/**
	 * 批量分配异议处理机构
	 * @param list
	 * @throws Exception
	 */
	public void batchUpdateOrg(List<ObjectItem> list) throws Exception{
		dao.batchUpdate("ObjectionHandingMapper.batchUpdateOrg", list);
	}
	
	/**根据异议事项号和id查询异议事项附件信息
	 * @param page
	 * @throws Exception
	 */
	public PageData findAttrBy(PageData pd)throws Exception{
		return (PageData)dao.findForObject("ObjectionHandingMapper.findAttrBy", pd);
	}

	public void saveCheckResult(PageData pd) throws Exception{
		dao.update("ObjectionHandingMapper.saveCheckResult", pd);
	}
	/**
	 * 查询更正/核查结果通用应答报文根据条件
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findObjectionResultBy(PageData pd)throws Exception{
		return (PageData)dao.findForObject("ObjectionHandingMapper.findObjectionResultBy", pd);
	}
	/**
	 * 更新更正/核查结果通用应答报文根据条件
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void updateObjectionResultBy(PageData pd)throws Exception{
		 dao.update("ObjectionHandingMapper.updateObjectionResultBy", pd);
	}
	/**
	 * 查询异议事项核查结果根据条件
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findCheckResultBy(PageData pd)throws Exception{
		return (PageData)dao.findForObject("ObjectionHandingMapper.findObjeReportBy", pd);
	}
	/**
	 * 保存个人异议事项更正结果上报信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void saveCorrectResult(PageData pd)throws Exception{
		dao.update("ObjectionHandingMapper.saveCorrectResult", pd);
	}
	/**根据添加个人标注
	 * @param page
	 * @throws Exception
	 */
	public PageData findAddRemarkBy(PageData pd)throws Exception{
		return (PageData)dao.findForObject("ObjectionHandingMapper.findAddRemarkBy", pd);
	}
	/**修改个人标注信息
	 * @param page
	 * @throws Exception
	 */
	public void updatePersonLabel(PageData pd)throws Exception{
		dao.update("ObjectionHandingMapper.updatePersonLabel", pd);
	}
	/**删除个人标注信息
	 * @param page
	 * @throws Exception
	 */
	public void deletePersonLabel(PageData pd)throws Exception{
		dao.delete("ObjectionHandingMapper.deletePersonLabel", pd);
	}
	/**删除附件
	 * @param pd
	 * @throws Exception
	 */
	public void delAtt(PageData pd)throws Exception{
		dao.update("ObjectionHandingMapper.delAtt", pd);
	}
	/**更新更正结果上报信息
	 * @param pd
	 * @throws Exception
	 */
	public void updateResultToObjectionCorrectAccept(PageData pd)throws Exception{
		dao.update("ObjectionHandingMapper.updateResultToObjectionCorrectAccept", pd);
	}
	/**查询更正结果上报信息
	 * @param pd
	 * @throws Exception
	 */
	public PageData findResultToObjectionCorrectAcceptBy(PageData pd)throws Exception{
		return (PageData) dao.findForObject("ObjectionHandingMapper.findResultToObjectionCorrectAcceptBy", pd);
	}
	/**修改标注信息(全部)
	 * @param pd
	 * @throws Exception
	 */
	public void update_addRemark(PageData pd)throws Exception{
		dao.update("ObjectionHandingMapper.update_addRemark", pd);
	}
	/**修改标注信息(全部) 
	 * @param pd
	 * @throws Exception
	 */
	public PageData find_AddRemarkBy(PageData pd)throws Exception{
		return (PageData) dao.findForObject("ObjectionHandingMapper.find_AddRemarkBy", pd);
	}
	public PageData selectObject(PageData pd)throws Exception{
		return (PageData) dao.findForObject("ObjectionHandingMapper.selectObject", pd);
	}

}

