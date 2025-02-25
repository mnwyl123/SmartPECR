package com.dcits.supervise.pecr.ent.service.dataRecode.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.supervise.pecr.ent.service.dataRecode.EntUpDaccountDataManager;
import com.dcits.supervise.pecr.indv.entity.UpDaccountData;
import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.UuidUtil;
@Service("EntUpDaccountDataService")
public class UpDaccountDataService implements EntUpDaccountDataManager{
	@Resource(name = "daoSupportPecr")
	private DaoSupportPecr dao;
    /**
               * 获取列表
     */
	@SuppressWarnings("unchecked")
	@Override
	public List<UpDaccountData> findList(Page page) throws Exception {
		return (List<UpDaccountData>) dao.findForList("EntUpDaccountDataMapper.findUpDaccountDatalistPage", page);
	}
	/**
	 * 插入数据
	 */
	@Override
	public void inseretUpDaccountData(PageData pd) throws Exception {
		pd.put("UUID",UuidUtil.get32UUID());
		dao.save("EntUpDaccountDataMapper.inseretUpDaccountData", pd);
	}
	/**
	    * 删除数据
	 */
	@Override
	public void deleteUpDaccountData(PageData pd) throws Exception {
		dao.delete("EntUpDaccountDataMapper.deleteUpDaccountData", pd);
	}
	/**
	    * 更改数据
	 */
	@Override
	public void update(PageData pd) throws Exception {
		dao.delete("EntUpDaccountDataMapper.updateData", pd);
	}
}
