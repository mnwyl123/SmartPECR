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
public class FeedBackReportPartFail350 extends FeedBackReportPartFailService{

	private ReportFeedBackMessageMapper reportFeedBackMessageMapper;
	
	private static final Logger logger = LoggerFactory.getLogger(FeedBackReportPartFail350.class);
	
	public FeedBackReportPartFail350(ReportFeedBackMessageMapper reportFeedBackMessageMapper){
		this.reportFeedBackMessageMapper=reportFeedBackMessageMapper;
	}
	
	@Override
	String selectIdByJSONObject(Document reportDocument) throws Exception {
		logger.info("开始获取对应数据ID");
		Map<String, Object> conditionMap = new HashMap<>();
		Element rootElt = reportDocument.getRootElement();
		Element sgmt = rootElt.element("EnIcdnRltpInf");
		String table_name = ReportType.getReportTypeBaseTable(ReportType.REPORT_350);
		String pk = ReportType.getReportTypePrimaryKey(ReportType.REPORT_350);
		List<ConditionColumAndValue> list = new ArrayList<>();
		list.add(new ConditionColumAndValue("ENT_NAME",sgmt.element("EntName").getStringValue()));
		list.add(new ConditionColumAndValue("ENT_CERT_TYPE",sgmt.element("EntCertType").getStringValue()));
		list.add(new ConditionColumAndValue("ENT_CERT_NUM",sgmt.element("EntCertNum").getStringValue()));
		list.add(new ConditionColumAndValue("ASSO_ENT_NAME",sgmt.element("AssoEntName").getStringValue()));
		list.add(new ConditionColumAndValue("ASSO_ENT_CERT_TYPE",sgmt.element("AssoEntCertType").getStringValue()));
		list.add(new ConditionColumAndValue("ASSO_ENT_CERT_NUM",sgmt.element("AssoEntCertNum").getStringValue()));
		list.add(new ConditionColumAndValue("RPT_DATE",sgmt.element("RptDate").getStringValue()));
		conditionMap.put("table_name", table_name);
		conditionMap.put("pk", pk);
		conditionMap.put("list", list);
		String recordId = reportFeedBackMessageMapper.findRecordIdByConditionMap(conditionMap);
		return recordId;
	}

}
