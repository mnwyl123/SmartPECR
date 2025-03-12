package com.dcits.supervise.pecr.common.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.common.service.DataCheckResultMapper;

/**
 * 校验结果查看
 * @author 穆楠
 *
 */
@Service("dataCheckResultService")
public class DataCheckResultService implements DataCheckResultMapper{
	
	@Resource(name = "daoSupportPecr")
	private DaoSupportPecr dao;
	
	/**
	 * 校验结果查看
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> findResultList(Page page) throws Exception {
		return (List<PageData>) dao.findForList("DataCheckResultMapper.findResultlistPage", page);
	}

}
