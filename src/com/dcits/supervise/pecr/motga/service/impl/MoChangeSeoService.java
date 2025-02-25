package com.dcits.supervise.pecr.motga.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.ent.entity.MotgaCltalCtrctBsSgmt;
import com.dcits.supervise.pecr.motga.service.MoChangeSeoManager;

@Service("MoChangeSeoManager")
public class MoChangeSeoService  implements  MoChangeSeoManager{
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
        return (List<PageData>) dao.findForList("MoChangeSeoMapper.datalistPage", page);
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
    public List<MotgaCltalCtrctBsSgmt> dataHistList(Page page) throws Exception {
        return (List<MotgaCltalCtrctBsSgmt>) dao.findForList("MoChangeSeoMapper.dataHistlistPage", page);
    }
    /**
   	 * 更新状态到11
   	 * 
   	 * @param pd
   	 * @return
   	 * @throws Exception
   	 */
	@Override
	public void updateStatus(Map<String, Object> map) throws Exception {
		dao.update("MoChangeSeoMapper.updateStatusSec", map);		
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
		dao.update("MoChangeSeoMapper.backdate", map);		
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
		dao.delete("MoChangeSeoMapper.deletedate", map);
	}

	
}
