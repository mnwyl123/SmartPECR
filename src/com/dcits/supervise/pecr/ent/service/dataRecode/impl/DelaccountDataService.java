package com.dcits.supervise.pecr.ent.service.dataRecode.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.supervise.pecr.ent.service.dataRecode.EntDelaccountDataManager;
import com.dcits.supervise.pecr.indv.entity.inDel;
import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
@Service("EntDelAccountDataService")
public class DelaccountDataService implements EntDelaccountDataManager{
	@Resource(name="daoSupportPecr")
	private DaoSupportPecr dao;
	 /**
	  * 获取列表
	  */
	@SuppressWarnings("unchecked")
	@Override
	public List<inDel> listDelaccountData(Page page) throws Exception {
		return (List<inDel>)dao.findForList("EntDelaccountDataMapper.delaccountDatalistPage", page);
	}
	@Override
	//删除413-企业借贷账户信息按段删除请求记录
	public void delLoan(PageData pd) throws Exception {
		dao.delete("EntDelaccountDataMapper.delLoan",pd);
		
	}
	@Override
	// 删除443-企业担保账户信息按段删除类请求 
	public void delGua(PageData pd) throws Exception {
		dao.delete("EntDelaccountDataMapper.delGua",pd);
	}

	@Override
	//删除423-企业授信协议信息按段删除类请求
	public void delPro(PageData pd) throws Exception {
		dao.delete("EntDelaccountDataMapper.delPro",pd);	
	}
	@Override
	//删除444-企业担保账户信息整笔删除请求 
	public void delGuaEnt(PageData pd) throws Exception {
		dao.delete("EntDelaccountDataMapper.delGuaEnt",pd);
		
	}
	@Override
	//删除414-企业借贷账户整笔删除请求记录
	public void delLoanEnt(PageData pd) throws Exception {
		dao.delete("EntDelaccountDataMapper.delLoanEnt",pd);
	}
	@Override
	//删除424-企业授信协议信息整笔删除请求 
	public void delProEnt(PageData pd) throws Exception {
		dao.delete("EntDelaccountDataMapper.delProEnt",pd);
		
	}
	@Override
	//删除314-企业基本信息整笔删除请求信息段
	public void delBsEnt(PageData pd) throws Exception {
		dao.delete("EntDelaccountDataMapper.delBsEnt",pd);
		
	}
	@Override
	//删除614-企业资产负债表整笔删除请求记录 
	public void delBlanceEnt(PageData pd) throws Exception {
		dao.delete("EntDelaccountDataMapper.delBlanceEnt",pd);
		
	}
	@Override
	//删除624-企业利润及利润分配表整笔删除请求记录
	public void delInComeEnt(PageData pd) throws Exception {
		dao.delete("EntDelaccountDataMapper.delInComeEnt",pd);
		
	}
	@Override
	//删除634-企业现金流量表整笔删除请求记录  
	public void delCashEnt(PageData pd) throws Exception {
		dao.delete("EntDelaccountDataMapper.delCashEnt",pd);
		
	}
	@Override
	//删除634-企业现金流量表整笔删除请求记录  
	public void delAssetsEnt(PageData pd) throws Exception {
		dao.delete("EntDelaccountDataMapper.delAssetsEnt",pd);
		
	}
	@Override
	//删除634-企业现金流量表整笔删除请求记录  
	public void delInOutEnt(PageData pd) throws Exception {
		dao.delete("EntDelaccountDataMapper.delInOutEnt",pd);
		
	}
	@Override
	public void saveLoan(PageData pd) throws Exception {
		dao.save("EntDelaccountDataMapper.saveLoan", pd);
		
	}

	@Override
	public void saveGua(PageData pd) throws Exception {
		dao.save("EntDelaccountDataMapper.saveGua", pd);
		
	}

	@Override
	public void savePro(PageData pd) throws Exception {
		dao.save("EntDelaccountDataMapper.savePro", pd);
		
	}
	@Override
	public void saveGuaEnt(PageData pd) throws Exception {
		dao.save("EntDelaccountDataMapper.saveGuaEnt", pd);
		
	}
	@Override
	public void saveLoanEnt(PageData pd) throws Exception {
		dao.save("EntDelaccountDataMapper.saveLoanEnt", pd);
		
	}
	@Override
	public void saveProEnt(PageData pd) throws Exception {
		dao.save("EntDelaccountDataMapper.saveProEnt", pd);
		
	}
	@Override
	public void saveBsEnt(PageData pd) throws Exception {
		dao.save("EntDelaccountDataMapper.saveBsEnt", pd);
		
	}
	@Override
	public void saveBlanceEnt(PageData pd) throws Exception {
		dao.save("EntDelaccountDataMapper.saveBlanceEnt", pd);
		
	}
	@Override
	public void saveInComeEnt(PageData pd) throws Exception {
		dao.save("EntDelaccountDataMapper.saveInComeEnt", pd);
		
	}
	@Override
	public void saveCashEnt(PageData pd) throws Exception {
		dao.save("EntDelaccountDataMapper.saveCashEnt", pd);
		
	}
	@Override
	public void saveAssetsEnt(PageData pd) throws Exception {
		dao.save("EntDelaccountDataMapper.saveAssetsEnt", pd);
		
	}
	@Override
	public void saveInOutEnt(PageData pd) throws Exception {
		dao.save("EntDelaccountDataMapper.saveInOutEnt", pd);
		
	}
	@Override
	public void updateLoan(PageData pd) throws Exception {
		dao.update("EntDelaccountDataMapper.updateLoan", pd);
	}

	@Override
	public void updateGua(PageData pd) throws Exception {
		dao.update("EntDelaccountDataMapper.updateGua", pd);
		
	}

	@Override
	public void updatePro(PageData pd) throws Exception {
		dao.update("EntDelaccountDataMapper.updatePro", pd);
	}
	@Override
	public void updateGuaEnt(PageData pd) throws Exception {
		dao.update("EntDelaccountDataMapper.updateGuaEnt", pd);
		
	}
	@Override
	public void updateLoanEnt(PageData pd) throws Exception {
		dao.update("EntDelaccountDataMapper.updateLoanEnt", pd);
	}
	@Override
	public void updateProEnt(PageData pd) throws Exception {
		dao.update("EntDelaccountDataMapper.updateProEnt", pd);
		
	}
	@Override
	public void updateBsEnt(PageData pd) throws Exception {
		dao.update("EntDelaccountDataMapper.updateBsEnt", pd);
		
	}
	@Override
	public void updateBlanceEnt(PageData pd) throws Exception {
		dao.update("EntDelaccountDataMapper.updateBlanceEnt", pd);
		
	}
	@Override
	public void updateInComeEnt(PageData pd) throws Exception {
		dao.update("EntDelaccountDataMapper.updateInComeEnt", pd);
		
	}
	@Override
	public void updateCashEnt(PageData pd) throws Exception {
		dao.update("EntDelaccountDataMapper.updateCashEnt", pd);
		
	}
	@Override
	public void updateAssetsEnt(PageData pd) throws Exception {
		dao.update("EntDelaccountDataMapper.updateAssetsEnt", pd);
		
	}
	@Override
	public void updateInOutEnt(PageData pd) throws Exception {
		dao.update("EntDelaccountDataMapper.updateInOutEnt", pd);
		
	}
}

