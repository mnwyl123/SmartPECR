package com.dcits.supervise.pecr.indv.service.seo;

import java.util.List;
import java.util.Map;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.indv.entity.PecrIndvBsSgmt;
import com.dcits.supervise.pecr.indv.entity.PecrIndvIdSgmt;

public interface IndvBasicsInfoSeoManager {

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
	 * 查询 历史表其他标识段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PecrIndvIdSgmt> getPecrIndvIdSgmtById(Page page) throws Exception;
	/**
	 * 查询 历史表基础段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getPcBasBsSgmtById(PageData pd)throws Exception;
	/**
	 * 查询 历史表基本概况信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getPcBasFcsInfSgmtById(PageData pd)throws Exception;
	/**
	 * 查询 历史表婚姻信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
    public PageData getPcBasSpsInfSgmtById(PageData pd)throws Exception;
    /**
	 * 查询 历史表教育信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
    public PageData getPcBasEduInfSgmtById(PageData pd)throws Exception;
    /**
	 * 查询 历史表职业信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
    public PageData getPcBasOctpnInfSgmtById(PageData pd)throws Exception;
    /**
	 * 查询 历史表居住地址段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
    public PageData getPcBasRedncInfSgmtById(PageData pd)throws Exception;
    /**
	 * 查询 历史表通讯地址段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
    public PageData getPcBasMlgInfSgmtById(PageData pd)throws Exception;
    /**
	 * 查询 历史表收入信息段
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
    public PageData getPcBasIncInfSgmtById(PageData pd)throws Exception;
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
}
