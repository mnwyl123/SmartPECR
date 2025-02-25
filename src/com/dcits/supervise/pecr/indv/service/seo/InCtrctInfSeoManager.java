package com.dcits.supervise.pecr.indv.service.seo;

import java.util.List;
import java.util.Map;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.indv.entity.PecrIndvBsSgmt;

public interface InCtrctInfSeoManager {

	/**
	 * 查询 中间表
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> dataList(Page page) throws Exception;
	public List<PageData> dataListForUpdate(Page page) throws Exception;
	/**
	 * 查询 当前表+历史表
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PecrIndvBsSgmt> dataHistList(Page page) throws Exception;
	public List<PecrIndvBsSgmt> dataHistListForUpdate(Page page) throws Exception;
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
     * 个人授信协议信息记录 基础段信息
     * @param pd
     * @return
     * @throws Exception
     */
    public PageData getCtrctBsSgmtData(PageData pd) throws Exception;

    /**
     * 个人授信协议信息记录   共同受信人信息段
     * @param pd
     * @return
     * @throws Exception
     */
    public List<PageData> getCertRelSgmtList(Page page) throws Exception;

    /**
     * 个人授信协议信息记录   额度信息段
     * @param pd
     * @return
     * @throws Exception
     */
    public PageData getCreditLimSgmtData(PageData pd) throws Exception;
}
