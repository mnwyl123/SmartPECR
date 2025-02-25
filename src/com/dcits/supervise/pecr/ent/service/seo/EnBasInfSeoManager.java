package com.dcits.supervise.pecr.ent.service.seo;

import java.util.List;
import java.util.Map;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.ent.entity.EnBasInf;
import com.dcits.supervise.pecr.ent.entity.EntActuCotrlInfSgmt;
import com.dcits.supervise.pecr.ent.entity.EntIdSgmt;
import com.dcits.supervise.pecr.ent.entity.EntMnMmbInfSgmt;
import com.dcits.supervise.pecr.ent.entity.EntMnShaHodInfSgmt;

public interface EnBasInfSeoManager {
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
	public List<EnBasInf> dataHistList(Page page) throws Exception;
	/**
   	 * 更新状态到10
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
     * 企业基本信息记录 基础段信息
     * @param pd
     * @return
     * @throws Exception
     */
    public PageData getEntBsSgmtData(PageData pd) throws Exception;
    /**
	 * 企业基本信息 其他标识信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<EntIdSgmt> getentIdSgmtById(PageData pd) throws Exception;
	/**
	 * 企业基本信息 基本概况信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getentFcsInfSgmtById(PageData pd) throws Exception;
	/**
	 * 企业基本信息 主要组成人员段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<EntMnMmbInfSgmt> getentMnMmbInfSgmtById(PageData pd) throws Exception;
	/**
	 * 企业基本信息 注册资本及主要出资人段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<EntMnShaHodInfSgmt> getentMnShaHodInfSgmtById(PageData pd) throws Exception;
	/**
	 * 企业基本信息 实际控制人段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<EntActuCotrlInfSgmt> getentActuCotrlInfSgmtById(PageData pd) throws Exception;
	/**
	 * 企业基本信息 上级机构段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getentSpvsgAthrtyInfSgmtById(PageData pd) throws Exception;
	/**
	 * 企业基本信息 联系方式段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getentCotaInfSgmtById(PageData pd) throws Exception;
}
