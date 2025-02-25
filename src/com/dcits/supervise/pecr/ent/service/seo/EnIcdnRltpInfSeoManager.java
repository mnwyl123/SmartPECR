package com.dcits.supervise.pecr.ent.service.seo;

import java.util.List;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.ent.entity.EnBasInf;
import com.dcits.supervise.pecr.ent.entity.EnIcdnRltpInf;
import java.util.Map;
public interface EnIcdnRltpInfSeoManager {

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
	public List<EnIcdnRltpInf> dataHistList(Page page) throws Exception;
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
	 * 企业间关联关系 
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<EnIcdnRltpInf> List(Page page)
			throws Exception;
	/**
	 * 企业间关联关系 查询
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData EnIcdnRltpInfbyId(PageData pd) throws Exception;
	
}
