package com.dcits.supervise.pecr.ent.service.dataRecode.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.ent.entity.MotgaCltalCtrctBsSgmt;
import com.dcits.supervise.pecr.ent.service.dataRecode.MoDelManager;

@Service("MoDelManager")
public class MoDelService  implements  MoDelManager{
	@Resource(name = "daoSupportPecr")
	private DaoSupportPecr dao;
	
	

	@Override
	public void insertMotgaCltalInfo(PageData pd) throws Exception {
		dao.findForObject("MoDelMapper.addMo", pd);
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MotgaCltalCtrctBsSgmt> getMotgaContractInfoList(Page page) throws Exception {
		return (List<MotgaCltalCtrctBsSgmt>) dao.findForList("MoDelMapper.accountlistPage", page);
	}

	@Override
	public void deleteMotgaCltalBsSgmt(PageData pd) throws Exception {
		dao.delete("MoDelMapper.delMo", pd);
		
	}

	@Override
	public void updateMotgaCltalInfo(PageData pd) throws Exception {
		dao.save("MoDelMapper.updateMo", pd);
		
	}

}
