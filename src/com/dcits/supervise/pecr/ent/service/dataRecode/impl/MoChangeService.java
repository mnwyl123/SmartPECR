package com.dcits.supervise.pecr.ent.service.dataRecode.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.ent.entity.MotgaCltalCtrctBsSgmt;
import com.dcits.supervise.pecr.ent.service.dataRecode.MoChangeManager;

@Service("MoChangeManager")
public class MoChangeService  implements  MoChangeManager{
	@Resource(name = "daoSupportPecr")
	private DaoSupportPecr dao;
	
	

	@Override
	public void insertMotgaCltalInfo(PageData pd) throws Exception {
		dao.findForObject("MochangeMapper.addMo", pd);
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MotgaCltalCtrctBsSgmt> getMotgaContractInfoList(Page page) throws Exception {
		return (List<MotgaCltalCtrctBsSgmt>) dao.findForList("MochangeMapper.accountlistPage", page);
	}

	@Override
	public void deleteMotgaCltalBsSgmt(PageData pd) throws Exception {
		dao.delete("MochangeMapper.delMo", pd);
		
	}

	@Override
	public void updateMotgaCltalInfo(PageData pd) throws Exception {
		dao.save("MochangeMapper.updateMo", pd);
		
	}

}
