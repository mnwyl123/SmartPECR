package com.dcits.supervise.pecr.indv.service.dataRecode.impl;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.indv.entity.InSpcEvtDscInf;
import com.dcits.supervise.pecr.indv.service.dataRecode.InSpcEvtDscInfManager;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class InSpcEvtDscInfService implements InSpcEvtDscInfManager {

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
	public List<InSpcEvtDscInf> List(Page page) throws Exception {
		return (List<InSpcEvtDscInf>) dao.findForList("InSpcEvtDscInfMapper.datalistPage", page);
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
		dao.update("InSpcEvtDscInfMapper.updateData", pd);
	}
	/**
	 * 更新数据状态
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	public void updatestatus(PageData pd) throws Exception {
		dao.update("InSpcEvtDscInfMapper.updatestatus", pd);
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
		dao.save("InSpcEvtDscInfMapper.addData", pd);
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
		dao.delete("InSpcEvtDscInfMapper.deleteData", pd);
	}
}
