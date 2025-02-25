package com.dcits.supervise.pecr.ent.service.seo;

import java.util.List;
import java.util.Map;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.indv.entity.PecrIndvBsSgmt;

public interface MotgaCltalBsInfoSeoManager {
	/**
	 * 查询 中间表
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> dataList(Page page) throws Exception;
	/**
	 * 查询 当前表+历史表
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PecrIndvBsSgmt> dataHistList(Page page) throws Exception;
	/**
   	 * 更新状态到11
   	 * 
   	 * @param pd
   	 * @return
   	 * @throws Exception
   	 */
    public void updateStatus(Map<String, Object> map) throws Exception;
    /**
   	 * 更新状态到20
   	 * 
   	 * @param pd
   	 * @return
   	 * @throws Exception
   	 */
    public void backdate(Map<String, Object> map) throws Exception;
    /**
   	 * 删除报文数据信息
   	 * 
   	 * @param pd
   	 * @return
   	 * @throws Exception
   	 */
    public void deletedate(Map<String, Object> map) throws Exception;
    /**
	 * 抵（质）押合同信息 基础段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getMotgaCltalBsSgmtById(PageData pd) throws Exception;
	
	/**
	 * 抵（质）押合同信息 基本信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getMotgaCltalInfById(PageData pd) throws Exception;
	/**
	 * 抵（质）押合同信息 其他债务人信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getComRecInfSgmtById(Page page) throws Exception;
	/**
	 * 抵（质）押合同信息 抵押物信息段 
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getMotgaProptInfListById(Page page) throws Exception;
	/**
	 * 抵（质）押合同信息 质物信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getCltalInfListById(Page pd) throws Exception;
}
