package com.dcits.supervise.pecr.indv.service.dataRecode;

import java.util.List;

import com.dcits.supervise.pecr.indv.entity.UpDaccountData;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
/**
 * 特殊报文按段更正service层
 * @author 穆楠
 *
 */
public interface UpDaccountDataManager {
	/**
	 * 获取列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<UpDaccountData> findList(Page page)throws Exception;
	/**
	 * 新增方法
	 * @param pd
	 * @throws Exception
	 */
	public void	inseretUpDaccountData(PageData pd)throws Exception;	  
	/**
	 * 删除方法
	 * @param pd
	 * @throws Exception
	 */
	public void deleteUpDaccountData(PageData pd) throws Exception;
	/**
	 * 修改方法
	 * @param pd
	 * @throws Exception
	 */
	public void update(PageData pd)throws Exception;
	
	
	/**
	 * 查询借贷交易历史上报数据
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findHistIndivAcctList(Page page)throws Exception;
	
	
	/**
	 * 查询授信信息历史上报数据
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findHistIndivProtocolList(Page page)throws Exception;

	/**
	 * 查询担保协议历史上报数据
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findHistIndivGuaranteeList(Page page)throws Exception;

}
