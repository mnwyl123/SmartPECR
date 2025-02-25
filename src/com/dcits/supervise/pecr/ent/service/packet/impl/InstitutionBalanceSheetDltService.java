package com.dcits.supervise.pecr.ent.service.packet.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.ent.entity.InstitutionBalanceSheetDlt;
import com.dcits.supervise.pecr.ent.service.packet.InstitutionBalanceSheetDltManager;
/**
 * 事业单位资产负债表整笔删除请求记录
 * @author leizx
 *
 */
@Service("institutionBalanceSheetDlt")
public class InstitutionBalanceSheetDltService implements InstitutionBalanceSheetDltManager{
	@Resource(name = "daoSupportPecr")
	private DaoSupportPecr dao;

	/**
	 * 事业单位资产负债表整笔删除请求记录  列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<InstitutionBalanceSheetDlt> getList(Page page)
			throws Exception {
		return (List<InstitutionBalanceSheetDlt>) dao.findForList("InstitutionBalanceSheetDltMapper.getlistPage", page);
	}
	/**
	 * 事业单位资产负债表整笔删除请求记录
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getAcctInfSgmtById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("InstitutionBalanceSheetDltMapper.getAcctInfSgmtById", pd);
	}
	/**
	 * 查询 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getAcctBsSgmtKey(Map<String, Object> map) throws Exception{
		return (int) dao.findForObject("InstitutionBalanceSheetDltMapper.getAcctBsSgmtKey", map);
	}

	/**
	 * 新增   
	 * @param pd
	 * @throws Exception
	 */
	public void insertAcctBsSgmt(Map<String, Object> map) throws Exception{
		dao.save("InstitutionBalanceSheetDltMapper.insertAcctBsSgmt", map);
	}
	
	/**
	 * 修改   
	 * @param pd
	 * @throws Exception
	 */
	public void updateAcctBsSgmt(Map<String, Object> map) throws Exception{
		dao.update("InstitutionBalanceSheetDltMapper.updateAcctBsSgmt", map);
	}
	
	/**
	 * 删除   
	 * @param map
	 * @throws Exception
	 */
	public void deleteAcctBsSgmt(Map<String, Object> map) throws Exception{
		dao.delete("InstitutionBalanceSheetDltMapper.delAcctBsSgmtById", map);
	}
}
