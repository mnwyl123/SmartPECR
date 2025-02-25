package com.dcits.supervise.pecr.ent.service.seo.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.ent.entity.EnIcdnRltpInf;
import com.dcits.supervise.pecr.ent.service.seo.EnIcdnRltpInfSeoManager;

@Service("EnIcdnRltpInfSeoService")
public class EnIcdnRltpInfSeoService implements EnIcdnRltpInfSeoManager{

	@Resource(name = "daoSupportPecr")
	private DaoSupportPecr dao;

	/**
	 * 查询 中间表
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
    @SuppressWarnings("unchecked")
	@Override
    public List<PageData> dataList(Page page) throws Exception {
        return (List<PageData>) dao.findForList("EnIcdnRltpInfSeoMapper.datalistPage", page);
    }
    /**
	 * 查询 当前表+历史表
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
    @SuppressWarnings("unchecked")
	@Override
    public List<EnIcdnRltpInf> dataHistList(Page page) throws Exception {
        return (List<EnIcdnRltpInf>) dao.findForList("EnIcdnRltpInfSeoMapper.dataHistlistPage", page);
    }
    /**
   	 * 更新状态到10
   	 * 
   	 * @param pd
   	 * @return
   	 * @throws Exception
   	 */
	@Override
	public void updateStatus(Map<String, Object> map) throws Exception {
		dao.update("EnIcdnRltpInfSeoMapper.updateStatus", map);		
	}
	/**
   	 * 更新状态到20
   	 * 
   	 * @param pd
   	 * @return
   	 * @throws Exception
   	 */
	@Override
	public void backdate(Map<String, Object> map) throws Exception {
		dao.update("EnIcdnRltpInfSeoMapper.backdate", map);		
	}
	/**
   	 * 删除报文数据信息
   	 * 
   	 * @param pd
   	 * @return
   	 * @throws Exception
   	 */
	@Override
	public void deletedate(Map<String, Object> map) throws Exception {
		dao.delete("EnIcdnRltpInfSeoMapper.deletedate", map);
	}
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
		return (PageData) dao.findForObject("EnIcdnRltpInfSeoMapper.EnIcdnRltpInfbyId", pd);
	}

}
