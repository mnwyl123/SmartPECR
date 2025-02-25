package com.dcits.supervise.pecr.indv.service.dataRecode.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.indv.entity.InFalMmbsInf;
import com.dcits.supervise.pecr.indv.entity.InIDEfctInf;
import com.dcits.supervise.pecr.indv.service.dataRecode.InFalMmbsInfManager;

@Service
public class InFalMmbsInfService implements InFalMmbsInfManager {

	@Resource(name = "daoSupportPecr")
	private DaoSupportPecr dao;
	
	/**
	 * 查询
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<InFalMmbsInf> List(Page page) throws Exception {
		return (List<InFalMmbsInf>) dao.findForList("InFalMmbsInfMapper.datalistPage", page);
	}
	/**
	 * 修改
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	public void updateData(PageData pd) throws Exception {
		dao.update("InFalMmbsInfMapper.updateData", pd);
	}
	/**
	 * 更新状态
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	public void updatestatus(PageData pd) throws Exception {
		dao.update("InFalMmbsInfMapper.updatestatus", pd);
	}
	/**
	 * 删除
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	public void deleteData(PageData pd) throws Exception {
		dao.delete("InFalMmbsInfMapper.deleteData", pd);
	}
	/**
	 * 新增
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	public void addData(PageData pd) throws Exception {
		dao.save("InFalMmbsInfMapper.addData", pd);
	}
	/**
	 * 判断
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	public InFalMmbsInf getData(PageData pd) throws Exception {
		return (InFalMmbsInf) dao.findForObject("InFalMmbsInfMapper.getData", pd);
	}
	/**
	 * 校验
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	public InFalMmbsInf getDatabyname(PageData pd) throws Exception {
		return (InFalMmbsInf) dao.findForObject("InFalMmbsInfMapper.getDatabyname", pd);
	}
}
