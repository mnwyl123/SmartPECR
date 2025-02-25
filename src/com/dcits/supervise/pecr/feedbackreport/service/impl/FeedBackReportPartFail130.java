package com.dcits.supervise.pecr.feedbackreport.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.dom4j.Document;
import org.dom4j.Element;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.dcits.supervise.pecr.feedbackreport.entity.ConditionColumAndValue;
import com.dcits.supervise.pecr.feedbackreport.mapper.ReportFeedBackMessageMapper;
import com.dcits.supervise.pecr.util.ReportType;
public class FeedBackReportPartFail130 extends FeedBackReportPartFailService{

	private ReportFeedBackMessageMapper reportFeedBackMessageMapper;
	
	private static final Logger logger = LoggerFactory.getLogger(FeedBackReportPartFail130.class);
	
	public FeedBackReportPartFail130(ReportFeedBackMessageMapper reportFeedBackMessageMapper){
		this.reportFeedBackMessageMapper=reportFeedBackMessageMapper;
	}
	
	@Override
	String selectIdByJSONObject(Document reportDocument) throws Exception {
		logger.info("开始获取对应数据ID");
		Map<String, Object> conditionMap = new HashMap<>();
		Element rootElt = reportDocument.getRootElement();
		Element sgmt = rootElt.element("InIDEfctInf");
		String table_name = ReportType.getReportTypeBaseTable(ReportType.REPORT_130);
		String pk = ReportType.getReportTypePrimaryKey(ReportType.REPORT_130);
		List<ConditionColumAndValue> list = new ArrayList<>();
		list.add(new ConditionColumAndValue("NAME",sgmt.element("Name").getStringValue()));
		list.add(new ConditionColumAndValue("ID_TYPE",sgmt.element("IDType").getStringValue()));
		list.add(new ConditionColumAndValue("ID_NUM",sgmt.element("IDNum").getStringValue()));
		list.add(new ConditionColumAndValue("CIMOC",sgmt.element("Cimoc").getStringValue()));
		list.add(new ConditionColumAndValue("RPT_DATE",sgmt.element("RptDate").getStringValue()));
		conditionMap.put("table_name", table_name);
		conditionMap.put("pk", pk);
		conditionMap.put("list", list);
		String recordId = reportFeedBackMessageMapper.findRecordIdByConditionMap(conditionMap);
		return recordId;
	}

}
