package com.dcits.supervise.pecr.ent.service.dataRecode;

import java.util.List;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.ent.entity.EnIcdnRltpInf;
import java.util.Map;
public interface EnIcdnRltpInfManager {

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
	/**
	 * 新增   
	 * @param pd
	 * @throws Exception
	 */
	public void insertEnIcdnRltpInf(Map<String, Object> map) throws Exception;
	
	/**
	 * 修改  
	 * @param map
	 * @throws Exception
	 */
	public void updateEnIcdnRltpInf(Map<String, Object> map) throws Exception;
	
	/**
	 * 删除   
	 * @param map
	 * @throws Exception
	 */
	public void deleteEnIcdnRltpInf(PageData pd) throws Exception;
}
