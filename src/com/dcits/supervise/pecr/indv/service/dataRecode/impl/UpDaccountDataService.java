package com.dcits.supervise.pecr.indv.service.dataRecode.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;


import com.dcits.supervise.pecr.indv.entity.UpDaccountData;
import com.dcits.supervise.pecr.indv.service.dataRecode.UpDaccountDataManager;
import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.UuidUtil;
@Service("upDaccountDataService")
public class UpDaccountDataService implements UpDaccountDataManager{
	@Resource(name = "daoSupportPecr")
	private DaoSupportPecr dao;
    /**
               * 获取列表
     */
	@SuppressWarnings("unchecked")
	@Override
	public List<UpDaccountData> findList(Page page) throws Exception {
		return (List<UpDaccountData>) dao.findForList("UpDaccountDataMapper.findUpDaccountDatalistPage", page);
	}
	/**
	 * 插入数据
	 */
	@Override
	public void inseretUpDaccountData(PageData pd) throws Exception {
		pd.put("UUID",UuidUtil.get32UUID());
		dao.save("UpDaccountDataMapper.inseretUpDaccountData", pd);
	}
	/**
	    * 删除数据
	 */
	@Override
	public void deleteUpDaccountData(PageData pd) throws Exception {
		dao.delete("UpDaccountDataMapper.deleteUpDaccountData", pd);
	}
	/**
	    * 更改数据
	 */
	@Override
	public void update(PageData pd) throws Exception {
		dao.delete("UpDaccountDataMapper.updateData", pd);
	}
	
	@Override
	public List<PageData> findHistIndivAcctList(Page page) throws Exception {
		return (List<PageData>) dao.findForList("UpDaccountDataMapper.findHistIndivAcctlistPage", page);
	}
	@Override
	public List<PageData> findHistIndivProtocolList(Page page) throws Exception {
		return (List<PageData>) dao.findForList("UpDaccountDataMapper.findHistIndivProtocollistPage", page);
	}
	@Override
	public List<PageData> findHistIndivGuaranteeList(Page page) throws Exception {
		return (List<PageData>) dao.findForList("UpDaccountDataMapper.findHistIndivGuaranteelistPage", page);
	}
}
