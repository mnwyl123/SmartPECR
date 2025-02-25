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
public class FeedBackReportPartFail624 extends FeedBackReportPartFailService{

	private ReportFeedBackMessageMapper reportFeedBackMessageMapper;
	
	private static final Logger logger = LoggerFactory.getLogger(FeedBackReportPartFail624.class);
	
	public FeedBackReportPartFail624(ReportFeedBackMessageMapper reportFeedBackMessageMapper){
		this.reportFeedBackMessageMapper=reportFeedBackMessageMapper;
	}
	
	@Override
	String selectIdByJSONObject(Document reportDocument) throws Exception {
		logger.info("开始获取对应数据ID");
		Map<String, Object> conditionMap = new HashMap<>();
		Element rootElt = reportDocument.getRootElement();
		Element sgmt = rootElt.element("IncomeStatementProfitAppropriationDlt");
		String table_name = ReportType.getReportTypeBaseTable(ReportType.REPORT_624);
		String pk = ReportType.getReportTypePrimaryKey(ReportType.REPORT_624);
		List<ConditionColumAndValue> list = new ArrayList<>();
		list.add(new ConditionColumAndValue("INF_REC_TYPE",sgmt.element("InfRecType").getStringValue()));
		list.add(new ConditionColumAndValue("ENT_NAME",sgmt.element("EntName").getStringValue()));
		list.add(new ConditionColumAndValue("ENT_CERT_TYPE",sgmt.element("EntCertType").getStringValue()));
		list.add(new ConditionColumAndValue("ENT_CERT_NUM",sgmt.element("EntCertNum").getStringValue()));
		list.add(new ConditionColumAndValue("SHEET_YEAR",sgmt.element("SheetYear").getStringValue()));
		list.add(new ConditionColumAndValue("SHEET_TYPE",sgmt.element("SheetType").getStringValue()));
		list.add(new ConditionColumAndValue("SHEET_TYPE_DIVIDE",sgmt.element("SheetTypeDivide").getStringValue()));
		conditionMap.put("table_name", table_name);
		conditionMap.put("pk", pk);
		conditionMap.put("list", list);
		String recordId = reportFeedBackMessageMapper.findRecordIdByConditionMap(conditionMap);
		return recordId;
	}

}
