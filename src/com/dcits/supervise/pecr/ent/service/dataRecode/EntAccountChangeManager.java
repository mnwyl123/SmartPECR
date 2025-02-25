package com.dcits.supervise.pecr.ent.service.dataRecode;

import java.util.List;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.indv.entity.Accountchange;

	/**
	 * 标识变更service层
	 * @author wangyanaaa
	 *
	 */

public interface EntAccountChangeManager {

		/**
		 * 获取列表
		 * @param page
		 * @return
		 * @throws Exception
		 */
		public List<Accountchange> listaccount(Page page)throws Exception;
		/**
		 * 新增授信协议标识变更
		 * @param pd
		 * @throws Exception
		 */
		public void	proAccountChange(PageData pd)throws Exception;	
		/**
		 * 新增担保标识变更
		 * @param pd
		 * @throws Exception
		 */
		public void	guaAccountChange(PageData pd)throws Exception;	
		/**
		 * 新增借贷标识变更
		 * @param pd
		 * @throws Exception
		 */
		public void	loanAccountChange(PageData pd)throws Exception;	
		
		/**
		 * 修改授信
		 * @param pd
		 * @throws Exception
		 */
		public void updatePro(PageData pd)throws Exception;
		/**
		 * 修改借贷
		 * @param pd
		 * @throws Exception
		 */
		public void updateLoan(PageData pd)throws Exception;
		/**
		 * 修改担保
		 * @param pd
		 * @throws Exception
		 */
		public void updateGua(PageData pd)throws Exception;
		
		/**
		 * 删除授信
		 * @param pd
		 * @throws Exception
		 */
		public void deletePro(PageData pd) throws Exception;
		/**
		 * 删除借贷
		 * @param pd
		 * @throws Exception
		 */
		public void deleteLoan(PageData pd) throws Exception;
		/**
		 * 删除担保
		 * @param pd
		 * @throws Exception
		 */
		public void deleteGua(PageData pd) throws Exception;
		

}
