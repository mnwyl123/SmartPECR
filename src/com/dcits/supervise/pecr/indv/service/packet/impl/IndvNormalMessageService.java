package com.dcits.supervise.pecr.indv.service.packet.impl;

import com.dcits.common.DaoSupportPecr;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.generateReport.entity.NeedReportDetail;
import com.dcits.supervise.pecr.indv.service.packet.IndvNormalMessageManager;
import com.dcits.supervise.pecr.util.ReportType;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class IndvNormalMessageService implements IndvNormalMessageManager {
    @Resource(name = "daoSupportPecr")
    private DaoSupportPecr dao;

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> getNormalMessage(Page page) throws Exception {
		return  (List<Map<String, Object>>) dao.findForList("IndvNormalMessageMapper.getNormalMessagelistPage", page);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> autoNormalMessage(Page page) throws Exception {
		return  (List<Map<String, Object>>) dao.findForList("IndvNormalMessageMapper.autoNormalMessagelistPage", page);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> getAbnormalMessage(Page page) throws Exception {
		return  (List<Map<String, Object>>) dao.findForList("IndvNormalMessageMapper.getAbnormalMessagelistPage", page);
	}

	@Override
	public boolean checkReportStatusNumEqu(PageData pd) throws Exception {
		int allReportNum = (int) dao.findForObject("IndvNormalMessageMapper.getReportNumByRptDate", pd);
		int reportStatus60Num = (int) dao.findForObject("IndvNormalMessageMapper.getReport60NumByRptDate", pd);
		if(allReportNum != 0 && allReportNum == reportStatus60Num){
			return true;
		}else{
			return false;
		}
	}

	@Override
	/**
	 * 先查询对应的基础表中还有没有状态为30：审核通过且报文名字段为空或者85：中间状态（审核成功--生成报文中）；90：生成报文中；的数据
	 * 再查询信息记录类型+报告日期+法人，查询报文状态为10：待校验的。
	 * 如果有则不能对此记录进行操作，等待下一次。以上描述情形属于某天上报的基本信息超过100万数据
	 * 如果均等于0则将其原report_message的记录状态改为20：已弃用。然后重新生成报文。
	 */
	public List<NeedReportDetail> getReport80StatusNum(PageData pd) throws Exception {
		List<NeedReportDetail> needReDeLists = new ArrayList<NeedReportDetail>();
		//获取到报文状态为校验部分失败的80数据
		List<PageData> reportInfo80Lists = (List<PageData>) dao.findForList("IndvNormalMessageMapper.getReport80InfoByRptDate", pd);
		Map<String,PageData> maps = new HashMap<String,PageData>();//作用是以信息记录类型去重
		for (PageData pageData : reportInfo80Lists) {
			pageData.put("tableName", ReportType.getReportTypeBaseTable(pageData.getString("REPORT_MESSAGE_TYPE")));
			int basicNums = (int) dao.findForObject("IndvNormalMessageMapper.getBasicTBNumByRptDate", pageData);
			int reportStatusNums = (int) dao.findForObject("IndvNormalMessageMapper.getReportStatus10NumByRptDate", pageData);
			//以下这个判断其实就是要求同一天的同个信息记录类型的报文必须全部校验完成，然后才能进行第二次的报文生成！
			if(basicNums == 0 && reportStatusNums == 0){
				dao.update("IndvNormalMessageMapper.updateReportStatus80To20ById", pageData);
				maps.put(pageData.getString("REPORT_MESSAGE_TYPE"), pageData);
			}else{
				return null;
			}
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar calendar =  Calendar.getInstance();
		//此处使用 pd 中的RPT_DATE和使用for循环中valuePd 中的REPORT_TIME是一样的。
		calendar.setTime(sdf.parse(pd.getString("RPT_DATE")));
		calendar.add(Calendar.DAY_OF_YEAR, -1);
		String yesterdayDate = sdf.format(calendar.getTime());
		for(String infRecType : maps.keySet()){
			PageData valuePd = maps.get(infRecType);
			//此处的日期不能这么简单的处理，应该同一信息记录类型的进行合并，注意：目前自动生成报文的逻辑可以默认带上前一天的人工补录数据
			List<String> rptDateList = new ArrayList<String>();
			rptDateList.add(valuePd.getString("REPORT_TIME"));
			rptDateList.add(yesterdayDate);
			List<String> companyList = new ArrayList<String>();
			companyList.add(valuePd.getString("COMPANY"));
			NeedReportDetail needReportDetail = new NeedReportDetail
					(valuePd.getString("REPORT_MESSAGE_TYPE"), rptDateList, companyList, null);
			needReDeLists.add(needReportDetail);
		}
		return needReDeLists;
	}
	
}
