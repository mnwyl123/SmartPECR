package com.dcits.supervise.pecr.ent.service.dataRecode;

import java.util.List;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.ent.entity.MotgaCltalCtrctBsSgmt;

public interface MoChangeManager {
	
	
	public List<MotgaCltalCtrctBsSgmt> getMotgaContractInfoList(Page page) throws Exception;

	public void deleteMotgaCltalBsSgmt(PageData pd) throws Exception;
	
	/**
	 * 新增   基本信息段
	 * @param map
	 * @throws Exception
	 */
	public void insertMotgaCltalInfo(PageData pd) throws Exception;
	
	/**
	 * 修改   基本信息段
	 * @param map
	 * @throws Exception
	 */
	public void updateMotgaCltalInfo(PageData pd) throws Exception;
	
	
}
