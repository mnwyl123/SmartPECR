package com.dcits.supervise.pecr.feedbackreport.mapper;

import java.util.List;
import java.util.Map;

import com.dcits.platform.util.PageData;
import com.dcits.supervise.pecr.feedbackreport.entity.FeedBackReportCode;
import com.dcits.supervise.pecr.feedbackreport.entity.FeedBackReportErrorMessage;
import com.dcits.supervise.pecr.generateReport.entity.ReportAndBackMessageEnt;

public interface ReportFeedBackMessageMapper {


	/**
	 * 更新报文表数据
	 * @param reportMessage
	 * @throws Exception
	 */
	public abstract void updateByPrimaryKeySelective(ReportAndBackMessageEnt reportMessage)throws Exception;
	/**
	 * 更新当前表的数据状态
	 * @param conditionMap
	 */
	public abstract void UpdateBusinessStateByCondition(Map<String, Object>  conditionMap)throws Exception;
	/**
	 * 更新历史数据表的数据
	 * @param conditionMap
	 */
	public abstract void UpdateBusinessStateHistByCondition(Map<String, Object>  conditionMap)throws Exception;
	
	/**
	 * 预校验更新当前数据表的数据
	 * @param conditionMap
	 */
	public abstract void UpdateBusinessStateCheckByCondition(Map<String, Object>  conditionMap)throws Exception;
	/**
	 * 移动数据从当前表到历史表
	 * @throws Exception
	 */
	public abstract void moveData(Map<String, Object> conditionMap)throws Exception;
	/**
	 * 保存反馈错误信息数据
	 * @param list
	 * @throws Exception
	 */
	public abstract void saveFeedBackErrorList(List<FeedBackReportErrorMessage> list)throws Exception;
	/**
	 * 通过fbCode和fbMsg获取对应的反馈规则数据
	 * @param fbCode
	 * @param fbMsg
	 * @return
	 * @throws Exception
	 */
	public abstract FeedBackReportCode selectByCodeAndTag(String fbCode , String fbMsg)throws Exception;
	
	/**
	 * 通过文件名获取报文表数据
	 * @param reportName
	 * @return
	 * @throws Exception
	 */
	public abstract ReportAndBackMessageEnt selectOneReportMessageByName( String reportName)throws Exception;

	/**
	 * 通过条件获取各表的具体数据的Id值
	 * @param conditionMap
	 * @return
	 * @throws Exception
	 */
	public String findRecordIdByConditionMap(Map<String, Object> conditionMap) throws Exception;
	
	
	/**
	 * 根据报文名和信息记录类型查询反馈报文解析的数据
	 * @param conditionMap
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findFeedMessageByFilenameAndType(Map<String, Object> conditionMap)throws Exception;
	
	/**
	 * 根据主表（基础段的表）主键查询对应附属表的主键值
	 * @param conditionMap
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findPKByMasterPK(Map<String, Object> conditionMap)throws Exception;
	
	/**
	 * 插入校验错误信息表
	 * @param pdLists
	 * @throws Exception
	 */
	public void insertValidateErrorMessage(List<PageData> pdLists)throws Exception;
	
	/**
	 * 移动当前表数据到主表，主要针对信息记录类型的基础表对应的相关干系表
	 * @param pdLists
	 * @throws Exception
	 */
	public void moveRealTableData(Map<String, Object> conditionMap)throws Exception;
	
	/**
	 * 删除基础表对应的相关干系表
	 * @param pdLists
	 * @throws Exception
	 */
	public void deleteRealTableData(Map<String, Object> conditionMap)throws Exception;
	
	/**
	 * 删除基础表数据
	 * @param pdLists
	 * @throws Exception
	 */
	public void deleteTableData(Map<String, Object> conditionMap)throws Exception;
}
