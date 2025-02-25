package com.dcits.supervise.pecr.common.service.impl;

import com.dcits.supervise.pecr.common.service.MiddleDataChangeMapper;
import com.dcits.supervise.pecr.common.service.MiddleDataChangeService;
import com.dcits.supervise.pecr.util.ReportType;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class MiddleDataChangeServiceImpl implements MiddleDataChangeService{

	private Logger logger = LoggerFactory.getLogger(MiddleDataChangeServiceImpl.class);
	
	@Autowired
	private MiddleDataChangeMapper middleDataChangeMapper;
	
	
	@Override
	public void changeMiddleData(String infRecType, String pk, String addOrDelete) throws Exception {
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		String table_name = ReportType.getReportTypeBaseTable(infRecType);
		String primaryKey = ReportType.getReportTypePrimaryKey(infRecType);
		String colum = ReportType.getReportTypeBusinessPrimaryKey(infRecType);
		String colum0 = "";
		String colum1 = "";
		if(colum.contains(",")){
			colum0=colum.split(",")[0];
			colum1=colum.split(",")[1];
			conditionMap.put("colum0", colum0);
			conditionMap.put("colum1", colum1);
		}else{
			conditionMap.put("colum", colum);
		}
		conditionMap.put("table_name", table_name);
		conditionMap.put("table_name_middle", table_name+"_middle");
		conditionMap.put("table_name_hist", table_name+"_hist");
		conditionMap.put("primaryKey", primaryKey);
		conditionMap.put("pk", pk);
		logger.info("获取当前表数据的业务主键");
		Map<String, Object> businessKey = middleDataChangeMapper.getBusinessParameterKey(conditionMap);
		logger.info("当前表数据获取完成");
		logger.info("检测中间表是否有数据");
		if(colum.contains(",")){
			conditionMap.put("colum0Value", businessKey.get(colum0));
			conditionMap.put("colum1Value", businessKey.get(colum1));
		}else{
			conditionMap.put("columValue", businessKey.get(colum));
		}
		Map<String, Object> middleData = middleDataChangeMapper.compareMiddleData(conditionMap);
		logger.info("中间表检测完成");
		if(middleData!=null&&middleData.size()>0){
			logger.info("中间表包含当前业务主键数据");
			if(addOrDelete.equals("add")){
				logger.info("中间表数据操作完成");
			}else if(addOrDelete.equals("delete")){
				boolean flag = middleDataChangeMapper.findHistTableData(conditionMap);
				if(flag){
					logger.info("包含历史数据，中间表数据无需删除");
				}else{
					middleDataChangeMapper.deleteMiddleData(conditionMap);
				}
			}
		}else{
			logger.info("中间表不包含当前业务主键数据");
			if(addOrDelete.equals("add")){
				middleDataChangeMapper.addMiddleData(conditionMap);
				logger.info("中间表数据插入完成");
			}else if(addOrDelete.equals("delete")){
				boolean flag = middleDataChangeMapper.findHistTableData(conditionMap);
				if(flag){
					logger.info("包含历史数据，中间表无数据，向中间表插入数据");
					middleDataChangeMapper.addMiddleData(conditionMap);
					logger.info("中间表数据插入完成");
				}else{
					logger.info("不包含历史数据，中间表无数据，无需删除");
				}
			}
		}
	}


	@Override
	public void changeMiddleDataMCom(String infRecType, String pk, String addOrDelete, String company)
			throws Exception {
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		conditionMap.put("COMPANY", company);
		String table_name = ReportType.getReportTypeBaseTable(infRecType);
		String primaryKey = ReportType.getReportTypePrimaryKey(infRecType);
		String colum = ReportType.getReportTypeBusinessPrimaryKey(infRecType);
		String colum0 = "";
		String colum1 = "";
		if(colum.contains(",")){
			colum0=colum.split(",")[0];
			colum1=colum.split(",")[1];
			conditionMap.put("colum0", colum0);
			conditionMap.put("colum1", colum1);
		}else{
			conditionMap.put("colum", colum);
		}
		conditionMap.put("table_name", table_name);
		conditionMap.put("table_name_middle", table_name+"_middle");
		conditionMap.put("table_name_hist", table_name+"_hist");
		conditionMap.put("primaryKey", primaryKey);
		conditionMap.put("pk", pk);
		logger.info("获取当前表数据的业务主键");
		Map<String, Object> businessKey = middleDataChangeMapper.getBusinessParameterKey(conditionMap);
		logger.info("当前表数据获取完成");
		logger.info("检测中间表是否有数据");
		if(colum.contains(",")){
			conditionMap.put("colum0Value", businessKey.get(colum0));
			conditionMap.put("colum1Value", businessKey.get(colum1));
		}else{
			conditionMap.put("columValue", businessKey.get(colum));
		}
		Map<String, Object> middleData = middleDataChangeMapper.compareMiddleData(conditionMap);
		logger.info("中间表检测完成");
		if(middleData!=null&&middleData.size()>0){
			logger.info("中间表包含当前业务主键数据");
			if(addOrDelete.equals("add")){
				logger.info("中间表数据操作完成");
			}else if(addOrDelete.equals("delete")){
				boolean flag = middleDataChangeMapper.findHistTableData(conditionMap);
				if(flag){
					logger.info("包含历史数据，中间表数据无需删除");
				}else{
					middleDataChangeMapper.deleteMiddleData(conditionMap);
				}
			}else if("update".equals(addOrDelete)){//根据组合主键查询历史表和当前表不等于该主键的数据，如果不存在，则新增。
				logger.info("中间表数据操作完成");
			}
		}else{
			logger.info("中间表不包含当前业务主键数据");
			if(addOrDelete.equals("add")){
				middleDataChangeMapper.addMiddleData(conditionMap);
				logger.info("中间表数据插入完成---add");
			}else if(addOrDelete.equals("delete")){
				boolean flag = middleDataChangeMapper.findHistTableData(conditionMap);
				if(flag){
					logger.info("包含历史数据，中间表无数据，向中间表插入数据");
					middleDataChangeMapper.addMiddleData(conditionMap);
					logger.info("中间表数据插入完成");
				}else{
					logger.info("不包含历史数据，中间表无数据，无需删除");
				}
			}else if("update".equals(addOrDelete)){//根据组合主键查询历史表和当前表不等于该主键的数据，如果不存在，则新增。
				middleDataChangeMapper.addMiddleData(conditionMap);
				logger.info("中间表数据插入完成---update");
			}
		}
		
	}

}
