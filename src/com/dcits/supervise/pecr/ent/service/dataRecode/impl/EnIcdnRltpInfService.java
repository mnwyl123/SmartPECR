package com.dcits.supervise.pecr.ent.service.dataRecode.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.ent.entity.EnIcdnRltpInf;
import com.dcits.supervise.pecr.ent.service.dataRecode.EnIcdnRltpInfManager;

@Service("EnIcdnRltpInfService")
public class EnIcdnRltpInfService implements EnIcdnRltpInfManager{

	@Resource(name = "daoSupportPecr")
	private DaoSupportPecr dao;

	/**
	 * 企业间关联关系 
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<EnIcdnRltpInf> List(Page page)
			throws Exception {
		return (List<EnIcdnRltpInf>) dao.findForList(
				"EnIcdnRltpInfMapper.enIcdnRltpInflistPage", page);
	}
	/**
	 * 企业间关联关系 查询
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData EnIcdnRltpInfbyId(PageData pd) throws Exception {
		return (PageData) dao.findForObject("EnIcdnRltpInfMapper.EnIcdnRltpInfbyId", pd);
	}
	/**
	 * 新增 
	 * @param pd
	 * @throws Exception
	 */
	public void insertEnIcdnRltpInf(Map<String, Object> map) throws Exception{
		dao.save("EnIcdnRltpInfMapper.insertEnIcdnRltpInf", map);
	}
	
	/**
	 * 修改  
	 * @param pd
	 * @throws Exception
	 */
	public void updateEnIcdnRltpInf(Map<String, Object> map) throws Exception{
		dao.update("EnIcdnRltpInfMapper.updateEnIcdnRltpInf", map);
	}
	
	/**
	 * 删除 
	 * @param map
	 * @throws Exception
	 */
	public void deleteEnIcdnRltpInf(PageData pd) throws Exception{
		dao.delete("EnIcdnRltpInfMapper.deleteEnIcdnRltpInf", pd);
	}
}
