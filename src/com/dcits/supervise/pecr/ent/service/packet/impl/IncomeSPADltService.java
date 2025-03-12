package com.dcits.supervise.pecr.ent.service.packet.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.ent.entity.IncomeSPADlt;
import com.dcits.supervise.pecr.ent.service.packet.IncomeSPADltManager;

/**
 * 企业现金流量表整笔删除请求记录
 * @author 穆楠
 *
 */
@Service("incomeSPADlt")
public class IncomeSPADltService implements IncomeSPADltManager{

	@Resource(name = "daoSupportPecr")
	private DaoSupportPecr dao;

	/**
	 * 企业现金流量表整笔删除请求记录  列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<IncomeSPADlt> getList(Page page)
			throws Exception {
		return (List<IncomeSPADlt>) dao.findForList("IncomeSPADltMapper.getlistPage", page);
	}
	/**
	 * 企业现金流量表整笔删除请求记录
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getAcctInfSgmtById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("IncomeSPADltMapper.getAcctInfSgmtById", pd);
	}
	/**
	 * 查询 主键是否存在
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int getAcctBsSgmtKey(Map<String, Object> map) throws Exception{
		return (int) dao.findForObject("IncomeSPADltMapper.getAcctBsSgmtKey", map);
	}

	/**
	 * 新增   
	 * @param pd
	 * @throws Exception
	 */
	public void insertAcctBsSgmt(Map<String, Object> map) throws Exception{
		dao.save("IncomeSPADltMapper.insertAcctBsSgmt", map);
	}
	
	/**
	 * 修改   
	 * @param pd
	 * @throws Exception
	 */
	public void updateAcctBsSgmt(Map<String, Object> map) throws Exception{
		dao.update("IncomeSPADltMapper.updateAcctBsSgmt", map);
	}
	
	/**
	 * 删除   
	 * @param map
	 * @throws Exception
	 */
	public void deleteAcctBsSgmt(Map<String, Object> map) throws Exception{
		dao.delete("IncomeSPADltMapper.delAcctBsSgmtById", map);
	}
}


