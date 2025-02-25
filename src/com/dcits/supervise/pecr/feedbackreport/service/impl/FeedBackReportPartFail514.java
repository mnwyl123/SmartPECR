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
public class FeedBackReportPartFail514 extends FeedBackReportPartFailService{

	private ReportFeedBackMessageMapper reportFeedBackMessageMapper;
	
	private static final Logger logger = LoggerFactory.getLogger(FeedBackReportPartFail514.class);
	
	public FeedBackReportPartFail514(ReportFeedBackMessageMapper reportFeedBackMessageMapper){
		this.reportFeedBackMessageMapper=reportFeedBackMessageMapper;
	}
	
	@Override
	String selectIdByJSONObject(Document reportDocument) throws Exception {
		logger.info("开始获取对应数据ID");
		Map<String, Object> conditionMap = new HashMap<>();
		Element rootElt = reportDocument.getRootElement();
		Element sgmt = rootElt.element("MoCEntDel");
		String table_name = ReportType.getReportTypeBaseTable(ReportType.REPORT_514);
		String pk = ReportType.getReportTypePrimaryKey(ReportType.REPORT_514);
		List<ConditionColumAndValue> list = new ArrayList<>();
		list.add(new ConditionColumAndValue("INF_REC_TYPE",sgmt.element("InfRecType").getStringValue()));
		list.add(new ConditionColumAndValue("DEL_REC_CODE",sgmt.element("DelRecCode").getStringValue()));
		conditionMap.put("table_name", table_name);
		conditionMap.put("pk", pk);
		conditionMap.put("list", list);
		String recordId = reportFeedBackMessageMapper.findRecordIdByConditionMap(conditionMap);
		return recordId;
	}

}
