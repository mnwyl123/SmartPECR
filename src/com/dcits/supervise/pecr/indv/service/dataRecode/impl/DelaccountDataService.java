package com.dcits.supervise.pecr.indv.service.dataRecode.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.supervise.pecr.indv.entity.inDel;
import com.dcits.supervise.pecr.indv.service.dataRecode.DelaccountDataManager;
import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.UuidUtil;
@Service
public class DelaccountDataService implements DelaccountDataManager{
	@Resource(name="daoSupportPecr")
	private DaoSupportPecr dao;
	 /**
	  * 获取列表
	  */
	@SuppressWarnings("unchecked")
	@Override
	public List<inDel> listDelaccountData(Page page) throws Exception {
		return (List<inDel>)dao.findForList("DelaccountDataMapper.delaccountDatalistPage", page);
	}

	@Override
	public void delLoan(PageData pd) throws Exception {
		dao.delete("DelaccountDataMapper.delLoan",pd);
		
	}
	@Override
	public void delIDE(PageData pd) throws Exception {
		dao.delete("DelaccountDataMapper.delIDE",pd);
		
	}
	@Override
	public void delGua(PageData pd) throws Exception {
		dao.delete("DelaccountDataMapper.delGua",pd);
	}
	@Override
	public void delBasic(PageData pd) throws Exception {
		dao.delete("DelaccountDataMapper.delBasic",pd);
		
	}
	@Override
	public void delPro(PageData pd) throws Exception {
		dao.delete("DelaccountDataMapper.delPro",pd);	
	}
	@Override
	public void delGuaEnt(PageData pd) throws Exception {
		dao.delete("DelaccountDataMapper.delGuaEnt",pd);
		
	}
	@Override
	public void delLoanEnt(PageData pd) throws Exception {
		dao.delete("DelaccountDataMapper.delLoanEnt",pd);
	}
	@Override
	public void delProEnt(PageData pd) throws Exception {
		dao.delete("DelaccountDataMapper.delProEnt",pd);
		
	}
	@Override
	public void saveLoan(PageData pd) throws Exception {
		dao.save("DelaccountDataMapper.saveLoan", pd);
		
	}
	@Override
	public void saveIDE(PageData pd) throws Exception {
		dao.save("DelaccountDataMapper.saveIDE", pd);
		
	}
	@Override
	public void saveGua(PageData pd) throws Exception {
		dao.save("DelaccountDataMapper.saveGua", pd);
		
	}
	@Override
	public void saveBasic(PageData pd) throws Exception {
		dao.save("DelaccountDataMapper.saveBasic", pd);
		
	}
	@Override
	public void savePro(PageData pd) throws Exception {
		dao.save("DelaccountDataMapper.savePro", pd);
		
	}
	@Override
	public void saveGuaEnt(PageData pd) throws Exception {
		dao.save("DelaccountDataMapper.saveGuaEnt", pd);
		
	}
	@Override
	public void saveLoanEnt(PageData pd) throws Exception {
		dao.save("DelaccountDataMapper.saveLoanEnt", pd);
		
	}
	@Override
	public void saveProEnt(PageData pd) throws Exception {
		dao.save("DelaccountDataMapper.saveProEnt", pd);
		
	}
	@Override
	public void updateLoan(PageData pd) throws Exception {
		dao.update("DelaccountDataMapper.updateLoan", pd);
		
	}
	@Override
	public void updateIDE(PageData pd) throws Exception {
		dao.update("DelaccountDataMapper.updateIDE", pd);
		
	}
	@Override
	public void updateGua(PageData pd) throws Exception {
		dao.update("DelaccountDataMapper.updateGua", pd);
		
	}
	@Override
	public void updateBasic(PageData pd) throws Exception {
		dao.update("DelaccountDataMapper.updateBasic", pd);
		
	}
	@Override
	public void updatePro(PageData pd) throws Exception {
		dao.update("DelaccountDataMapper.updatePro", pd);
	}
	@Override
	public void updateGuaEnt(PageData pd) throws Exception {
		dao.update("DelaccountDataMapper.updateGuaEnt", pd);
		
	}
	@Override
	public void updateLoanEnt(PageData pd) throws Exception {
		dao.update("DelaccountDataMapper.updateLoanEnt", pd);
	}
	@Override
	public void updateProEnt(PageData pd) throws Exception {
		dao.update("DelaccountDataMapper.updateProEnt", pd);
		
	}

	@Override
	public void saveIDelBatchInfo(List<Map<String, String>> listMap) throws Exception {
		dao.update("DelaccountDataMapper.saveIDelBatchInfo", listMap);
	}

	@Override
	public int saveDelInfoByBatchList(PageData pd) throws Exception {
		String infRecType = pd.getString("INF_REC_TYPE");
		int nums = 0;
		pd.put("UUID",UuidUtil.get32UUID());
		if("114".equals(infRecType)){//个人基本信息整笔删除
			nums = (int) dao.save("DelaccountDataMapper.saveBasicByBatchList", pd);
			//修改表I_DEL_ENTDEL_BATCH_INFO中的数据状态
			dao.update("DelaccountDataMapper.updateBatchStatusByIEntDel", pd);
		}else if("134".equals(infRecType)){//个人证件有效期整笔删除
			nums = (int) dao.save("DelaccountDataMapper.saveIDEByBatchList", pd);
			dao.update("DelaccountDataMapper.updateBatchStatusByIDEEntDel", pd);
		}else if("213".equals(infRecType)){//个人借贷按段删除
			nums = (int) dao.save("DelaccountDataMapper.saveLoanSgmtByBatchList", pd);
			dao.update("DelaccountDataMapper.updateBatchStatusByLoanSgmt", pd);
		}else if("223".equals(infRecType)){//个人授信按段删除
			nums = (int) dao.save("DelaccountDataMapper.saveCtrctSgmtByBatchList", pd);
			dao.update("DelaccountDataMapper.updateBatchStatusByCtrctSgmt", pd);
		}else if("233".equals(infRecType)){//个人担保按段删除
			nums = (int) dao.save("DelaccountDataMapper.saveSecSgmtByBatchList", pd);
			dao.update("DelaccountDataMapper.updateBatchStatusBySecSgmt", pd);
		}else if("214".equals(infRecType)){//个人借贷整笔删除
			nums = (int) dao.save("DelaccountDataMapper.saveLoanEntByBatchList", pd);
			dao.update("DelaccountDataMapper.updateBatchStatusByLoanEnt", pd);
		}else if("224".equals(infRecType)){//个人授信整笔删除
			nums = (int) dao.save("DelaccountDataMapper.saveCtrctEntByBatchList", pd);
			dao.update("DelaccountDataMapper.updateBatchStatusByCtrctEnt", pd);
		}else if("234".equals(infRecType)){//个人担保整笔删除
			nums = (int) dao.save("DelaccountDataMapper.saveSecEntByBatchList", pd);
			dao.update("DelaccountDataMapper.updateBatchStatusBySecEnt", pd);
		}
		
		return nums;
	}
}

