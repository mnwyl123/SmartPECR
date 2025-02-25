package com.dcits.supervise.pecr.indv.service.dataRecode.impl;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.indv.entity.InIDEfctInf;
import com.dcits.supervise.pecr.indv.service.dataRecode.InIDEfctInfManager;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class InIDEfctInfService implements InIDEfctInfManager {

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
	public List<InIDEfctInf> List(Page page) throws Exception {
		return (List<InIDEfctInf>) dao.findForList("InIDEfctInfMapper.datalistPage", page);
	}
	/**
	 * 更新
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	public void updateData(PageData pd) throws Exception {
		dao.update("InIDEfctInfMapper.updateData", pd);
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
		dao.update("InIDEfctInfMapper.updatestatus", pd);
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
		dao.delete("InIDEfctInfMapper.deleteData", pd);
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
		dao.save("InIDEfctInfMapper.addData", pd);
	}
	/**
	 * 判断
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	public InIDEfctInf getData(PageData pd) throws Exception {
		return (InIDEfctInf) dao.findForObject("InIDEfctInfMapper.getData", pd);
	}
	/**
	 * 校验
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	public InIDEfctInf getDatabyname(PageData pd) throws Exception {
		return (InIDEfctInf) dao.findForObject("InIDEfctInfMapper.getDatabyname", pd);
	}
}
