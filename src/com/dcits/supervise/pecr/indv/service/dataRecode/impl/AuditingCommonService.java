package com.dcits.supervise.pecr.indv.service.dataRecode.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.indv.service.dataRecode.AuditingCommonManager;

@Service
public class AuditingCommonService implements AuditingCommonManager {

	@Resource(name = "daoSupportPecr")
	private DaoSupportPecr dao;
	
	@Override
	public void updateAuditing(PageData pd) throws Exception {
		dao.update("AuditingMapper.updateAuditing", pd);
	}

}
