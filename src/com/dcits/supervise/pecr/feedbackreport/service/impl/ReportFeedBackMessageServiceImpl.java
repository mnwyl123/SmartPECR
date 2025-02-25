package com.dcits.supervise.pecr.feedbackreport.service.impl;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.apache.commons.io.FileUtils;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.UuidUtil;
import com.dcits.supervise.pecr.exceptions.BusinessException;
import com.dcits.supervise.pecr.feedbackreport.entity.FeedBackReportCode;
import com.dcits.supervise.pecr.feedbackreport.entity.FeedBackReportErrorMessage;
import com.dcits.supervise.pecr.feedbackreport.mapper.ReportFeedBackMessageMapper;
import com.dcits.supervise.pecr.feedbackreport.service.ReportFeedBackMessageService;
import com.dcits.supervise.pecr.generateReport.entity.ReportAndBackMessageEnt;
import com.dcits.supervise.pecr.generateReport.service.ReportMessageManager;
import com.dcits.supervise.pecr.util.Base64;
import com.dcits.supervise.pecr.util.FileUtil;
import com.dcits.supervise.pecr.util.IdUtil;
import com.dcits.supervise.pecr.util.PecrConstantUtil;
import com.dcits.supervise.pecr.util.ReportType;
import com.dcits.supervise.pecr.util.StringDateUtil;

import Decoder.BASE64Decoder;

@Service
public class ReportFeedBackMessageServiceImpl implements ReportFeedBackMessageService {
	private static final Logger logger;
	@Autowired
	public ReportMessageManager reportMessageService;
	@Autowired
	private FeedBackReportAllSuccessService feedBackReportAllSuccessService;
	@Autowired
	private FeedBackReportAllFailService feedBackReportAllFailService;
	
	private FeedBackReportPartFailService feedBackReportPartFailService;
	@Autowired
	private PartFailSwitchService partFailSwitchService;
	@Autowired
	private ReportFeedBackMessageMapper reportFeedBackMessageManageService;
	@Autowired
	private ReportFeedBackMessageMapper reportMessageMapper;

	@Override
	/**
	 * 根据追踪：paramString:代表前端回执上传解析的文件保存路径。20210113,将此处的文件后缀改成txt,因此后续下载反馈文件的时候下载的也是同路径下的txt文件，而不是enc文件。
	 * 此处的 MultipartFile 要么是来源于前端页面上手动上传的.enc文件解密解压后生成的.txt；要么是生成报文后进行校验出现错误的.bad文件
	 * 但实际在处理的时候：生成报文后进行校验出现错误的.bad文件在模拟上传文件流的时候文件名和原文件名都设置成了报文文件名
	 * 因此此处均是.txt后缀的文件，除去后缀的文件名结尾为0：代表校验出现错误的.bad文件，1/2/3:代表上传的反馈报文
	 * .bad文件就相当于人行返回回来的.enc文件解密解压后的.txt文件，且反馈标识为：3-代表原数据报送文件中部分信息记录已成功入库，部分记录存在错误未能入库
	 * 20210224新增反馈报文解析时的法人信息
	 */
	public String importFeedBackReport(Map<String,Object> paramMap, MultipartFile[] files,Boolean isLocal) throws Exception {
		String feedFilePath = paramMap.get("feedFilePath").toString();
		String company = paramMap.get("company").toString();
		String errorMessage = "fail";
		//最后更改基础表中数据状态的所需参数
		Map<String, Object> reportParam = new HashMap<String, Object>();
		for (MultipartFile file : files) {
			//此处获取的txtFileName是原上传文件文件名，带有后缀。
			String txtFileName = file.getOriginalFilename();
			if (txtFileName.length() != 34) {
				throw new BusinessException("反馈报文文件名错误");
			}
	        String encFileName = "";
	        String encFilePath = "";
	        String header = "";
	        //待解析报文使用
	        InputStreamReader in = null;
	        BufferedReader reader = null;
			try {
				//获取带解析文件对应的报文名
				String reportFileName = "";
				if(isLocal){
					reportFileName = txtFileName.substring(0, 30);
					encFilePath = feedFilePath;
				}else{
					reportFileName = txtFileName.substring(0, 29) + "0";
					encFileName = txtFileName.replace(".txt", ".enc");
					encFilePath = feedFilePath;
				}
				
				ReportAndBackMessageEnt reportMessage = reportFeedBackMessageManageService.selectOneReportMessageByName(reportFileName);
				if (reportMessage == null) {
					throw new BusinessException("没有对应的报文信息记录");
				}
				//20210308，新增放置页面重复上传文件判断。
				if (reportMessage != null && 
						(PecrConstantUtil.REPORT_STATUS_BACK_ALL_ERROR.equals(reportMessage.getReport_message_status())
							|| PecrConstantUtil.REPORT_STATUS_BACK_ALL_OK.equals(reportMessage.getReport_message_status())
							|| PecrConstantUtil.REPORT_STATUS_BACK_PORT_ERROR.equals(reportMessage.getReport_message_status())
								)) {
					throw new BusinessException("该反馈报文已上传解析过，请不要重复上传！");
				}
				
				//获取反馈标识
				String feedbackIdentity = txtFileName.substring(29, 30);
				if ("1".equals(feedbackIdentity)) {
					reportMessage.setDescription("全部成功");
					reportMessage.setFeedback_message_rec_time(StringDateUtil.getDateString("yyyy-MM-dd"));
					reportMessage.setFeedback_message_file_path(encFilePath);
					reportMessage.setFeedback_message_file_name(encFileName);
					reportMessage.setFeedback_message_identify(feedbackIdentity);
					if(!isLocal) {
						reportMessage.setReport_message_status(PecrConstantUtil.REPORT_STATUS_BACK_ALL_OK);     
						feedBackReportAllSuccessService.processingData(reportMessage);	
					}
				}
				//逻辑上来讲不可能出现feedbackIdentity = 2 的这种情况，在报文预处理校验的时候已经避免。
				if ("3".equals(feedbackIdentity)||"0".equals(feedbackIdentity)) {
					int lineNum = 0;
					String fileBody = "";
					String line = "";
					Map<String, Object> lablePd = new HashMap<>();
					List<FeedBackReportErrorMessage> feedBackReportErrorMessageList = new ArrayList<FeedBackReportErrorMessage>();
					
					in = new InputStreamReader(file.getInputStream());
					reader = new BufferedReader(in);
					
					//错误信息记录数
					int error_num = 0;
					while ((line = reader.readLine()) != null) {
						if (++lineNum == 1) {
							header = line;
						}else{
							error_num++;
							fileBody = line;
							Document document = DocumentHelper.parseText(fileBody);
							Element rootElt = document.getRootElement();
							Element fbInf = rootElt.element("FbInf");
							Element fbErrNumE = fbInf.element("FbErrNum");
							Element errRecIdE = fbInf.element("ErrRecId");
							//Element errRecE = fbInf.element("ErrRec");
							int fbErrNum = Integer.valueOf(fbErrNumE.getStringValue());
							//20210112,新增是否为空判断，解析文件头错误生成的.bad文件
							String errRecId = "";
							if(errRecIdE != null){
								errRecId = errRecIdE.getStringValue();
							}
							/*String errRecBase64 = errRecE.getStringValue();
							//base64解码
							byte[] buffer = new BASE64Decoder().decodeBuffer(errRecBase64);
							String errRec = new String(buffer,"utf-8");*/
							if (fbErrNum > 0) {
								List<Element> elements = fbInf.elements();
								for (Element element : elements) {
									
									if (element.getName().equals("ErrInf")) {
										String fbCode = element.element("FbCode").getStringValue();
										String fbMsg = element.element("FbMsg").getStringValue();
										lablePd.put("lable", fbMsg);
										// lable_table
										//List<Map<String, Object>> listPd = reportMessageService.getlableCN(lablePd);
										// feed_back_report_code,由于此处存在特殊情况的 FbMsg 此方法逻辑层进行修改
										FeedBackReportCode feedBackReportCode = reportFeedBackMessageManageService.selectByCodeAndTag(fbCode, fbMsg);
										FeedBackReportErrorMessage feedBackReportErrorMessage = new FeedBackReportErrorMessage();
										//20220622,把原来的获取主键的形式由IdUtil.randomUUID()转换成UuidUtil.get32UUID()
										//feedBackReportErrorMessage.setFeedBackReportErrorMessId(IdUtil.randomUUID());
										feedBackReportErrorMessage.setFeedBackReportErrorMessId(UuidUtil.get32UUID());
										feedBackReportErrorMessage.setReportMessageId(reportMessage.getReport_message_id());
										feedBackReportErrorMessage.setReportMessageType(reportMessage.getReport_message_type());
										//放置主键，回头更新数据的时候进行更新
										//feedBackReportErrorMessage.setRecordId();
										//20210625，对此处进行调整，无论是否库中存在FbCode和FbMsg都应该进行手动组装生成feedBackReportErrorMessage信息，与后续的校验错误信息组装操作息息相关。
										if (feedBackReportCode != null) {
											feedBackReportErrorMessage.setFeedBackReportCodeId(feedBackReportCode.getFeedBackReportCodeId());
											feedBackReportErrorMessage.setErrorMessage(feedBackReportCode.getMessage());
										}else{
											logger.error("请维护表：FEED_BACK_REPORT_CODE中的数据。FbCode："+fbCode+";FbMsg:"+fbMsg);
											feedBackReportErrorMessage.setFeedBackReportCodeId("");
											feedBackReportErrorMessage.setErrorMessage("FbCode："+fbCode+";FbMsg:"+fbMsg);
										}
										feedBackReportErrorMessage.setCreateTime(StringDateUtil.getDateString("yyyy-MM-dd"));
										feedBackReportErrorMessage.setReportMessageName(reportMessage.getReport_message_file_name());
										feedBackReportErrorMessage.setFeedBackReportName(encFileName);
										feedBackReportErrorMessage.setFbCode(fbCode);
										feedBackReportErrorMessage.setFbTag(fbMsg);
										//ErrRecId：填写出错记录在原数据报送文件中的行号
										//20210702,发现bad文件中ErrRecId是原文件中行号减 1(与目前基础表中的REPORT_FILE_COLNUM字段记录一致)，人行反馈中就是本身的定义，所以人行反馈的进行减 1 操作。
										//为3的是人行反馈报文解析情形
										if("3".equals(feedbackIdentity)){
											feedBackReportErrorMessage.setRecordBsId(String.valueOf(Integer.parseInt(errRecId)-1));
										}else{
											feedBackReportErrorMessage.setRecordBsId(errRecId);
										}
										feedBackReportErrorMessage.setIsEdit("0");
										feedBackReportErrorMessage.setCompany(company);
										//预处理还是反馈
										if(isLocal){
											feedBackReportErrorMessage.setIsCheck("0");
										}else{
											feedBackReportErrorMessage.setIsCheck("1");
										}
										feedBackReportErrorMessageList.add(feedBackReportErrorMessage);
									}
								}
							}
						}
					}
					//批量插入表feed_back_report_err_message信息
					if(feedBackReportErrorMessageList != null && feedBackReportErrorMessageList.size() > 0){
						//20210709,测试发现 feedBackReportErrorMessageList 过大会导致插入语句拼接出现异常
						int listSize = feedBackReportErrorMessageList.size();
						if(listSize <= 1000){
							reportMessageMapper.saveFeedBackErrorList(feedBackReportErrorMessageList);
						}else{
							int times = listSize / 1000 + (listSize % 1000 == 0 ? 0 : 1);
							for (int i = 0; i < times; i++) {
								reportMessageMapper.saveFeedBackErrorList(feedBackReportErrorMessageList.subList(i*1000, Math.min((i+1)*1000, listSize)));
							}
						}
						//在插入完成之后强制释放feedBackReportErrorMessageList占用的内存
						feedBackReportErrorMessageList.clear();
					}
					
					//调用更新基础数据表中数据的数据状态
					String reportMessageType = txtFileName.substring(22, 25);
					//在此处根据 errRecId(行数)+报文名称 获取对应的数据
					reportParam.put("reportFileName", reportFileName);
					reportParam.put("reportMessageType", reportMessageType);
					//预处理还是反馈
					Map<String,Object> param = new HashMap<String,Object>();
					if(isLocal){
						reportMessage.setFeedback_message_file_path(encFilePath);
						//更新数据状态的首次默认更改
						param.put("isLocal", "0");
						feedBackReportAllFailService.processingData(reportMessage,param);
						//设定每一条数据的最终状态-预处理错误
						reportParam.put("businessStates",PecrConstantUtil.BUSINESS_STATUS_110);
					}else{
						String successNum2 = header.substring(58, 65);
						String failNum2 = header.substring(65, 72);
						reportMessage.setFeedback_message_rec_time(StringDateUtil.getDateString("YYYY-MM-dd"));
						reportMessage.setFeedback_message_file_path(encFilePath);
						reportMessage.setFeedback_message_file_name(encFileName);
						reportMessage.setFk_success_number(Float.valueOf(successNum2));
						reportMessage.setFk_fail_number(Float.valueOf(failNum2));
						reportMessage.setDescription("部分信息出錯");
						reportMessage.setFeedback_message_identify(feedbackIdentity);
						//更新表report_message报文状态以及数据状态的首次默认更改
						if(reportMessage.getRecord_num()==error_num){
							reportMessage.setReport_message_status(PecrConstantUtil.REPORT_STATUS_BACK_ALL_ERROR);
						}else {
							reportMessage.setReport_message_status(PecrConstantUtil.REPORT_STATUS_BACK_PORT_ERROR);
						}
						param.put("isLocal", "1");
						feedBackReportAllFailService.processingData(reportMessage,param);
						//设定每一条数据的最终状态-反馈错误
						reportParam.put("businessStates",PecrConstantUtil.BUSINESS_STATUS_80);
					}
					//将反馈或者校验错误的数据状态进行标记
					changeDateStatusByFeedErId(reportParam);
					//进行数据的移植和删除,报文反馈解析的时候执行。
					if(!isLocal){
						feedBackReportAllFailService.processingMoveAndDelData(reportMessage);
					}
				}
				errorMessage = "success";
			} catch (Exception ex) {
				logger.error("导入失败：", (Throwable) ex);
				errorMessage = errorMessage + txtFileName + "导入失败:" + ex.getMessage();
			}finally{
				if(reader != null){
					reader.close();
				}
				if(in != null){
					in.close();
				}
			}
		}
		return errorMessage;
	}
	
	/**
	 * 根据报文名和信息类型查询表feed_back_report_err_message中对应的错误行数，更新对应基础信息表中的数据状态
	 * 此处暂时没有考虑企业：340  企业身份标识整合信息记录
	 * 将对应的错误信息插入表：VALIDATE_ERROR_MESSAGE中。
	 * 20210223,判断条件中新增特殊类报文的判断
	 * @param reportParam
	 * @throws Exception
	 */
	public void changeDateStatusByFeedErId(Map<String, Object> reportParam) throws Exception{
		String type = reportParam.get("reportMessageType").toString();
		String pkName = ReportType.getReportTypePrimaryKey(type);
		String tableName = ReportType.getReportTypeBaseTable(type);
		//20210309,将其注释掉，统一使用ReportType.java类中的定义
		/*if(type.equals(PecrConstantUtil.CTRCT_BS_SGMT)){
			pkName = "PCA_CTRCT_BS_SGMT_ID";
			tableName = "I_CTRCT_BS";
		}else if(type.equals(PecrConstantUtil.INDV_BS_SGMT)){
			pkName = "PAA_BS_SGMT_ID";
			tableName = "I_BS";
		}else if(type.equals(PecrConstantUtil.IN_FAL_MMBS_INF)){
			pkName = "PAJ_IN_FAL_MMBS_INF_ID";
			tableName = "I_IN_FAL_MMBS_INF";
		}else if(type.equals(PecrConstantUtil.IN_ID_EFCT_INF)){
			pkName = "PAK_IN_ID_EFCT_INF_ID";
			tableName = "I_IN_ID_EFCT_INF";
		}else if(type.equals(PecrConstantUtil.IN_SEC_ACCT_INF)){
			pkName = "PDA_GUAR_ACCT_BS_SGMT_ID";
			tableName = "I_GUAR_ACCT_BS";
		}else if(type.equals(PecrConstantUtil.ACCT_BS_SGMT)){
			pkName = "PBA_ACCT_BS_SGMT_ID";
			tableName = "I_ACCT_BS";
		}else if(type.equals(PecrConstantUtil.IN_SPC_EVT_DSC_INF)){
			pkName = "PBK_IN_SPC_EVT_DSC_INF_ID";
			tableName = "I_IN_SPC_EVT_DSC_INF";
		}else if(type.equals(PecrConstantUtil.IN_CTF_ITG_INF)){
			pkName = "PAL_IN_CTF_ITG_INF_ID";
			tableName = "I_IN_CTF_ITG_INF";
		}else if(type.equals(PecrConstantUtil.ENT_BS_SGMT)){
			pkName = "EAA_BS_SGMT_ID";
			tableName = "E_BS";
		}else if(type.equals(PecrConstantUtil.ENT_INCOME_AND_EXPENSE_STATEME_BS)){  
			pkName = "ELA_INCOME_AND_EXPENSE_STAT_ID";
			tableName = "E_INCOME_EXPENSE_BS";
		}else if(type.equals(PecrConstantUtil.ENT_EN_ICDN_RLTP_INF)){  
			pkName = "ECA_EN_ICDN_RLTP_INF_ID";
			tableName = "E_ICDN_RLTP_INF";
		}else if(type.equals(PecrConstantUtil.ENT_ACCT_BS_SGMT)){  
			pkName = "EDA_ACCT_BS_SGMT_ID";
			tableName = "E_ACCT_BS";
		}else if(type.equals(PecrConstantUtil.ENT_GUAR_ACCT_BS_SGMT)){  
			pkName = "EEA_GUAR_ACCT_BS_SGMT_ID";
			tableName = "E_GUAR_ACCT_BS";
		}else if(type.equals(PecrConstantUtil.ENT_EN_CTRCT_INF)){  
			pkName = "EGA_CTRCT_BS_SGMT_ID";
			tableName = "E_CTRCT_BS";
		}else if(type.equals(PecrConstantUtil.ENT_BALANCE_SHEET)){  
			pkName = "EHA_BALANCE_SHEET_BS_SGMT_ID";
			tableName = "E_BALANCE_SHEET_BS";
		}else if(type.equals(PecrConstantUtil.ENT_CASH_FLOWS)){  
			pkName = "EJA_CASH_FLOWS_BS_SGMT_ID";
			tableName = "E_CASH_FLOWS_BS";
		}else if(type.equals(PecrConstantUtil.ENT_INCODE_STATE_PRO)){  
			pkName = "EIA_INCOME_STATEMENT_PROFIT_ID";
			tableName = "E_INCOME_STATEMENT";
		}else if(type.equals(PecrConstantUtil.ENT_INST_BALANCE)){  
			pkName = "EKA_INSTITUTION_BALANCE_SHT_ID";
			tableName = "E_INSTITU_BALANCE_BS";
		}else if(type.equals(PecrConstantUtil.IN_BS_INF_DLT)){
			pkName = "PAY_IN_BS_INF_DLT_ID";
			tableName = "I_IN_BS_INF_DLT";
		}else if(type.equals(PecrConstantUtil.IN_ID_EFCT_INF_DLT)){
			pkName = "PAZ_IN_ID_EFCT_INF_DLT_ID";
			tableName = "I_IN_ID_EFCT_INF_DLT";
		}else if(type.equals(PecrConstantUtil.IN_ACCT_ID_CAGS_INF)){
			pkName = "PBW_IN_ACCT_ID_CAGS_INF_ID";
			tableName = "I_IN_ACCT_ID_CAGS_INF";
		}else if(type.equals(PecrConstantUtil.IN_ACCT_MDFC)){
			pkName = "PBA_ACCT_BS_SGMT_ID";
			tableName = "I_ACCT_BS";
		}else if(type.equals(PecrConstantUtil.IN_ACCT_DEL)){
			pkName = "PBY_IN_ACCT_DEL_ID";
			tableName = "I_IN_ACCT_DEL";
		}else if(type.equals(PecrConstantUtil.IN_ACCT_ENT_DEL)){
			pkName = "PBZ_IN_ACCT_ENT_DEL_ID";
			tableName = "I_IN_ACCT_ENT_DEL";
		}else if(type.equals(PecrConstantUtil.IN_CTRCT_ID_CAGS_INF)){
			pkName = "PCW_IN_CTRCTID_CAGS_INF_ID";
			tableName = "I_IN_CTRCTID_CAGS_INF";
		}else if(type.equals(PecrConstantUtil.IN_CTRCT_MDFC)){
			pkName = "PCA_CTRCT_BS_SGMT_ID";
			tableName = "I_CTRCT_BS";
		}else if(type.equals(PecrConstantUtil.IN_CTRCT_DEL)){
			pkName = "PCY_IN_CTRCT_DEL_ID";
			tableName = "I_IN_CTRCT_DEL";
		}else if(type.equals(PecrConstantUtil.IN_CTRCT_ENT_DEL)){
			pkName = "PCZ_IN_CTRCT_ENT_DEL_ID";
			tableName = "I_IN_CTRCT_ENT_DEL";
		}else if(type.equals(PecrConstantUtil.IN_SEC_ACCT_ID_CAGS_INF)){
			pkName = "PDW_INSECACCTID_CAGSINF_ID";
			tableName = "I_INSECACCTID_CAGSINF";
		}else if(type.equals(PecrConstantUtil.IN_SEC_ACCT_MDFC)){
			pkName = "PDA_GUAR_ACCT_BS_SGMT_ID";
			tableName = "I_GUAR_ACCT_BS";
		}else if(type.equals(PecrConstantUtil.IN_SEC_ACCT_DEL)){
			pkName = "PDY_IN_SEC_ACCT_DEL_ID";
			tableName = "I_IN_SEC_ACCT_DEL";
		}else if(type.equals(PecrConstantUtil.IN_SEC_ACCT_ENT_DEL)){
			pkName = "PDZ_IN_SEC_ACCT_ENT_DEL_ID";
			tableName = "I_IN_SEC_ACCT_ENT_DEL";
		}else if(type.equals(PecrConstantUtil.MOTGA_CLTAL_CTRCT_INF)){
			pkName = "EFA_MOTGA_CLTAL_CTRCT_BS_ID";
			tableName = "MOTGA_CLTAL_CTRCT_BS";
		}else if(type.equals(PecrConstantUtil.MOC_ID_CAGS_INF)){
			pkName = "EFW_MOC_ID_CAGS_INF_ID";
			tableName = "MOC_ID_CAGS_INF";
		}else if(type.equals(PecrConstantUtil.MOC_ENT_DEL)){
			pkName = "EFZ_MOC_ENT_DEL_ID";
			tableName = "MOC_ENT_DEL";
		}*/
		
		if(pkName != null && !"".equals(pkName) && tableName != null && !"".equals(tableName)){
			reportParam.put("pkName", pkName);
			reportParam.put("tableName", tableName);
			reportMessageService.editInCtrctInfStatus(reportParam);
			
			//获取所有的反馈信息，组装一下，批量插入 校验错误信息表中 VALIDATE_ERROR_MESSAGE
			//获取正常的反馈信息A.FB_CODE, A.FB_TAG 匹配表 feed_back_report_code 中的数据和特殊类A.FB_CODE的
			//根据20210625的调整feedMessageLists的查询结果不会为空
			List<PageData> feedMessageLists = reportMessageMapper.findFeedMessageByFilenameAndType(reportParam);
			List<PageData> validateMessageLists = new ArrayList<PageData>();
			if(feedMessageLists != null && feedMessageLists.size() > 0){
				for (int i = 0; i < feedMessageLists.size(); i++) {
					PageData feedMessagePd = feedMessageLists.get(i);
					feedMessagePd.put("UUID", UuidUtil.get32UUID());
					String IS_MASTER = feedMessagePd.getString("IS_MASTER");
					String TABLE_PK_VAL = "";
					//之所以将 "N".equals(IS_MASTER) 写在前边是因为有 IS_MASTER 为空的情况（fbTag:0000），优先处理符合子表的情形，其他情况均当做主表校验错误处理。
					if("N".equals(IS_MASTER)){
						List<PageData> pkValPdLists = reportMessageMapper.findPKByMasterPK(feedMessagePd);
						//当子表中的信息记录数大于1 的时候，还是无法定位到具体的一条数据，因此，还是作为主表校验错误信息的形式进行插入
						if(pkValPdLists != null && pkValPdLists.size() == 1){
							TABLE_PK_VAL = pkValPdLists.get(0).getString("TABLE_PK_VAL");
						}else{
							TABLE_PK_VAL = feedMessagePd.getString("MASTER_PK_VAL");
							String MASTER_TABLE = feedMessagePd.getString("MASTER_TABLE");
							feedMessagePd.put("TABLE_NAME", MASTER_TABLE);
						}
						feedMessagePd.put("TABLE_PK_VAL", TABLE_PK_VAL);
						validateMessageLists.add(feedMessagePd);
					}else{
						TABLE_PK_VAL = feedMessagePd.getString("MASTER_PK_VAL");
						feedMessagePd.put("TABLE_PK_VAL", TABLE_PK_VAL);
						String MASTER_TABLE = feedMessagePd.getString("MASTER_TABLE");
						feedMessagePd.put("TABLE_NAME", MASTER_TABLE);
						validateMessageLists.add(feedMessagePd);
					}
				}
				//批量执行插入语句其中 IS_MULTI_TABLE 字段后续测试发现需要设置为N
				//20210709,测试发现 validateMessageLists 过大会导致插入语句拼接出现异常
				int listSize = validateMessageLists.size();
				if(listSize <= 1000){
					reportMessageMapper.insertValidateErrorMessage(validateMessageLists);
				}else{
					int times = listSize / 1000 + (listSize % 1000 == 0 ? 0 : 1);
					for (int i = 0; i < times; i++) {
						reportMessageMapper.insertValidateErrorMessage(validateMessageLists.subList(i*1000, Math.min((i+1)*1000, listSize)));
					}
				}
			}
		}else{
			logger.error("+++++++++++++++++++++++++++++请维护类 ReportType.java 中此信息记录类型对应的基础表和主键+++++++++++++++++++++++++++++++++++");
		}
	}
	
	

	public String appendEsql(String startTime, String endTime, boolean isTrue) {
		String param = isTrue ? " WHERE REPORT_MESSAGE_ID IS NOT NULL AND BUSINESS_STATES = 'RKCG' GROUP BY RPT_DATE"
				: " WHERE REPORT_MESSAGE_ID IS NOT NULL GROUP BY RPT_DATE";
		StringBuilder stringBuilderSql = new StringBuilder();
		stringBuilderSql.append(" select a.RPT_DATE ,sum(a.count) as sums from ( ");
		stringBuilderSql.append(" SELECT RPT_DATE ,count(1) as count FROM EAA_BS_SGMT " + param);
		stringBuilderSql.append(" UNION ALL ");
		stringBuilderSql.append(" SELECT RPT_DATE ,count(1) as count FROM ECA_EN_ICDN_RLTP_INF " + param);
		stringBuilderSql.append(" UNION ALL ");
		stringBuilderSql.append(" SELECT RPT_DATE ,count(1) as count FROM EAZ_EN_BS_INF_DLT " + param);
		stringBuilderSql.append(" UNION ALL ");
		stringBuilderSql.append(" SELECT RPT_DATE ,count(1) as count from EDA_ACCT_BS_SGMT " + param);
		stringBuilderSql.append(" UNION ALL ");
		stringBuilderSql.append(" SELECT RPT_DATE ,count(1) as count from EDW_EN_ACCT_INF_ID_CAGS_INF " + param);
		stringBuilderSql.append(" UNION ALL ");
		stringBuilderSql.append(" SELECT RPT_DATE ,count(1) as count from EDY_EN_ACCT_INF_DEL " + param);
		stringBuilderSql.append(" UNION ALL ");
		stringBuilderSql.append(" SELECT RPT_DATE ,count(1) as count from EDZ_EN_ACCT_INF_ENT_DEL " + param);
		stringBuilderSql.append(" UNION ALL ");
		stringBuilderSql.append(" SELECT RPT_DATE ,count(1) as count FROM EEA_GUAR_ACCT_BS_SGMT " + param);
		stringBuilderSql.append(" UNION ALL ");
		stringBuilderSql.append(" SELECT RPT_DATE ,count(1) as count FROM EEW_EN_SEC_ACCT_ID_CAGS_INF " + param);
		stringBuilderSql.append(" UNION ALL ");
		stringBuilderSql.append(" SELECT RPT_DATE ,count(1) as count FROM EEY_EN_SEC_ACCT_DEL " + param);
		stringBuilderSql.append(" UNION ALL ");
		stringBuilderSql.append(" SELECT RPT_DATE ,count(1) as count FROM EEZ_EN_SEC_ACCT_ENT_DEL_SGMT " + param);
		stringBuilderSql.append(" UNION ALL ");
		stringBuilderSql.append(" SELECT RPT_DATE ,count(1) as count from EFA_MOTGA_CLTAL_CTRCT_BS_SGMT" + param);
		stringBuilderSql.append(" UNION ALL ");
		stringBuilderSql.append(" SELECT RPT_DATE ,count(1) as count from EFW_MOC_ID_CAGS_INF" + param);
		stringBuilderSql.append(" UNION ALL ");
		stringBuilderSql.append(" SELECT RPT_DATE ,count(1) as count from EFZ_MOC_ENT_DEL" + param);
		stringBuilderSql.append(" UNION ALL ");
		stringBuilderSql.append(" SELECT RPT_DATE ,count(1) as count from EGA_CTRCT_BS_SGMT" + param);
		stringBuilderSql.append(" UNION ALL ");
		stringBuilderSql.append(" SELECT RPT_DATE ,count(1) as count from EGW_EN_ACCT_INF_ID_CAGS_INF" + param);
		stringBuilderSql.append(" UNION ALL ");
		stringBuilderSql.append(" SELECT RPT_DATE ,count(1) as count from EGY_EN_CTRCT_INF_DEL" + param);
		stringBuilderSql.append(" UNION ALL ");
		stringBuilderSql.append(" SELECT RPT_DATE ,count(1) as count from EGZ_EN_CTRCT_INF_ENT_DEL" + param);
		stringBuilderSql.append(" UNION ALL ");
		stringBuilderSql.append(" SELECT RPT_DATE ,count(1) as count from EHA_BALANCE_SHEET_BS_SGMT " + param);
		stringBuilderSql.append(" UNION ALL ");
		stringBuilderSql.append(" SELECT RPT_DATE ,count(1) as count from EIA_INCOME_STATEMENT_PROFIT " + param);
		stringBuilderSql.append(" UNION ALL ");
		stringBuilderSql.append(" SELECT RPT_DATE ,count(1) as count from EJA_CASH_FLOWS_BS_SGMT " + param);
		stringBuilderSql.append(" UNION ALL ");
		stringBuilderSql.append(" SELECT RPT_DATE ,count(1) as count from EKA_INSTITUTION_BALANCE_SHEET " + param);
		stringBuilderSql.append(" UNION ALL ");
		stringBuilderSql.append(" SELECT RPT_DATE ,count(1) as count from ELA_INCOME_AND_EXPENSE_STATEME " + param);
		stringBuilderSql.append(" UNION ALL ");
		stringBuilderSql.append(" SELECT RPT_DATE ,count(1) as count from EMZ_BALANCE_SHEET_DLT " + param);
		stringBuilderSql.append(") a GROUP BY a.RPT_DATE");
		stringBuilderSql.append(" HAVING RPT_DATE BETWEEN '" + startTime + "' and '" + endTime + "' ");
		return stringBuilderSql.toString();
	}

	public String appendPsql(String startTime, String endTime, boolean isTrue) {
		String param = isTrue ? " WHERE REPORT_MESSAGE_ID IS NOT NULL AND BUSINESS_STATES = 'RKCG' GROUP BY RPT_DATE"
				: " WHERE REPORT_MESSAGE_ID IS NOT NULL GROUP BY RPT_DATE";
		StringBuilder stringBuilderSql = new StringBuilder();
		stringBuilderSql.append(" select a.RPT_DATE ,sum(a.count) as sums from ( ");
		stringBuilderSql.append(" SELECT RPT_DATE ,count(1) as count from PAA_BS_SGMT " + param);
		stringBuilderSql.append(" UNION ALL");
		stringBuilderSql.append(" SELECT RPT_DATE ,count(1) as count from PAJ_IN_FAL_MMBS_INF " + param);
		stringBuilderSql.append(" UNION ALL");
		stringBuilderSql.append(" SELECT RPT_DATE ,count(1) as count from PAK_IN_ID_EFCT_INF " + param);
		stringBuilderSql.append(" UNION ALL");
		stringBuilderSql.append(" SELECT RPT_DATE ,count(1) as count from PAY_IN_BS_INF_DLT " + param);
		stringBuilderSql.append(" UNION ALL");
		stringBuilderSql.append(" SELECT RPT_DATE ,count(1) as count from PAZ_IN_ID_EFCT_INF_DLT " + param);
		stringBuilderSql.append(" UNION ALL");
		stringBuilderSql.append(" SELECT RPT_DATE ,count(1) as count FROM PBA_ACCT_BS_SGMT " + param);
		stringBuilderSql.append(" UNION ALL");
		stringBuilderSql.append(" SELECT RPT_DATE ,count(1) as count FROM PBK_IN_SPC_EVT_DSC_INF " + param);
		stringBuilderSql.append(" UNION ALL");
		stringBuilderSql.append(" SELECT RPT_DATE ,count(1) as count FROM PBW_IN_ACCT_ID_CAGS_INF " + param);
		stringBuilderSql.append(" UNION ALL");
		stringBuilderSql.append(" SELECT RPT_DATE ,count(1) as count FROM PBY_IN_ACCT_DEL " + param);
		stringBuilderSql.append(" UNION ALL");
		stringBuilderSql.append(" SELECT RPT_DATE ,count(1) as count FROM PBZ_IN_ACCT_ENT_DEL " + param);
		stringBuilderSql.append(" UNION ALL");
		stringBuilderSql.append(" SELECT RPT_DATE ,count(1) as count FROM PCA_CTRCT_BS_SGMT " + param);
		stringBuilderSql.append(" UNION ALL");
		stringBuilderSql.append(" SELECT RPT_DATE ,count(1) as count FROM PCW_IN_CTRCTID_CAGS_INF " + param);
		stringBuilderSql.append(" UNION ALL");
		stringBuilderSql.append(" SELECT RPT_DATE ,count(1) as count FROM PCY_IN_CTRCT_DEL " + param);
		stringBuilderSql.append(" UNION ALL");
		stringBuilderSql.append(" SELECT RPT_DATE ,count(1) as count FROM PCZ_IN_CTRCT_ENT_DEL " + param);
		stringBuilderSql.append(" UNION ALL");
		stringBuilderSql.append(" SELECT RPT_DATE ,count(1) as count FROM PDA_GUAR_ACCT_BS_SGMT " + param);
		stringBuilderSql.append(" UNION ALL");
		stringBuilderSql.append(" SELECT RPT_DATE ,count(1) as count FROM PDW_INSECACCTID_CAGSINF " + param);
		stringBuilderSql.append(" UNION ALL");
		stringBuilderSql.append(" SELECT RPT_DATE ,count(1) as count FROM PDY_IN_SEC_ACCT_DEL " + param);
		stringBuilderSql.append(" UNION ALL");
		stringBuilderSql.append(" SELECT RPT_DATE ,count(1) as count FROM PDZ_IN_SEC_ACCT_ENT_DEL " + param);
		stringBuilderSql.append(") a GROUP BY a.RPT_DATE");
		stringBuilderSql.append(" HAVING RPT_DATE BETWEEN '" + startTime + "' and '" + endTime + "' ");
		return stringBuilderSql.toString();
	}

	public static String percentage(Integer rkcg, Integer total) {
		String result = "0";
		NumberFormat numberFormat = NumberFormat.getInstance();
		numberFormat.setMaximumFractionDigits(2);
		if (total != 0) {
			result = numberFormat.format(rkcg / (float) total * 100.0f);
		}
		return result + "%";
	}

	static {
		logger = LoggerFactory.getLogger( ReportFeedBackMessageServiceImpl.class);
	}
	
	/**
     * 获取配置文件信息
     *
     * @param key
     * @return
     * @throws IOException
     */
    private String getPropertieValue(String key) throws IOException {
        Properties properties = new Properties();
        properties.load(BaseController.class.getClassLoader().getResourceAsStream("serverThread.properties"));
        return (String) properties.get(key);
    }
    
    private Map<String, Object> getFileData(int line,BufferedReader b,String type) throws IOException {
    	
    	String item="";
		Map<String, Object> reportCount = new HashMap<String, Object>();
		int i= 1;
		Document document;
		while ((item = b.readLine()) != null) {
			if (i++ == line) {
				try {
					document = DocumentHelper.parseText(item);
					Element rootElt = document.getRootElement();
					if(type.equals(PecrConstantUtil.CTRCT_BS_SGMT)){
						Element fbInf = rootElt.element("InCtrctInf");
						Element ctrctBsSgmt = fbInf.element("CtrctBsSgmt");
						Element contractCode = ctrctBsSgmt.element("ContractCode");
						Element rptDate = ctrctBsSgmt.element("RptDate");
						reportCount.put("rptDate", rptDate.getStringValue());
						reportCount.put("contractCode", contractCode.getStringValue());
			    	}else if(type.equals(PecrConstantUtil.INDV_BS_SGMT)){
			    		Element fbInf = rootElt.element("InBasInf");
						Element ctrctBsSgmt = fbInf.element("BsSgmt");
						Element name = ctrctBsSgmt.element("Name");
						Element iDType = ctrctBsSgmt.element("IDType");
						Element iDNum = ctrctBsSgmt.element("IDNum");
						Element infSurcCode = ctrctBsSgmt.element("InfSurcCode");
						Element rptDate = ctrctBsSgmt.element("RptDate");
						reportCount.put("name", name.getStringValue());
						reportCount.put("iDType", iDType.getStringValue());
						reportCount.put("iDNum", iDNum.getStringValue());
						reportCount.put("infSurcCode", infSurcCode.getStringValue());
						reportCount.put("rptDate", rptDate.getStringValue());
			    	}else if(type.equals(PecrConstantUtil.IN_FAL_MMBS_INF)){
			    		Element fbInf = rootElt.element("InFalMmbsInf");
						Element name = fbInf.element("Name");
						Element iDType = fbInf.element("IDType");
						Element iDNum = fbInf.element("IDNum");
						
						Element famMemName  = fbInf.element("FamMemName");
						Element famMemCertType  = fbInf.element("FamMemCertType");
						Element famMemCertNum   = fbInf.element("FamMemCertNum");
						
						Element infSurcCode = fbInf.element("InfSurcCode");
						Element rptDate = fbInf.element("RptDate");
						
						reportCount.put("name", name.getStringValue());
						reportCount.put("iDType", iDType.getStringValue());
						reportCount.put("iDNum", iDNum.getStringValue());
						
						reportCount.put("famMemName", famMemName.getStringValue());
						reportCount.put("famMemCertType", famMemCertType.getStringValue());
						reportCount.put("famMemCertNum", famMemCertNum.getStringValue());
						 
						reportCount.put("infSurcCode", infSurcCode.getStringValue());
						reportCount.put("rptDate", rptDate.getStringValue());
			    	}else if(type.equals(PecrConstantUtil.IN_ID_EFCT_INF)){
			    		Element fbInf = rootElt.element("InIDEfctInf");
						
						Element name = fbInf.element("Name");
						Element iDType = fbInf.element("IDType");
						Element iDNum = fbInf.element("IDNum");
						
						Element infSurcCode = fbInf.element("InfSurcCode");
						Element rptDate = fbInf.element("RptDate");
						
						reportCount.put("name", name.getStringValue());
						reportCount.put("iDType", iDType.getStringValue());
						reportCount.put("iDNum", iDNum.getStringValue());
						reportCount.put("infSurcCode", infSurcCode.getStringValue());
						reportCount.put("rptDate", rptDate.getStringValue());
			    	}else if(type.equals(PecrConstantUtil.IN_SEC_ACCT_INF)){
			    		Element fbInf = rootElt.element("InSecAcctInf");
			    		Element ctrctBsSgmt = fbInf.element("GuarAcctBsSgmt");
			    		
						Element acctCode = ctrctBsSgmt.element("AcctCode");
						Element rptDate = ctrctBsSgmt.element("RptDate");
						
						reportCount.put("acctCode", acctCode.getStringValue()); 
						reportCount.put("rptDate", rptDate.getStringValue());
			    	}else if(type.equals(PecrConstantUtil.ACCT_BS_SGMT)){
			    		Element fbInf = rootElt.element("InAcctInf");
			    		Element ctrctBsSgmt = fbInf.element("AcctBsSgmt");
			    		
						Element acctCode = ctrctBsSgmt.element("AcctCode");
						Element rptDate = ctrctBsSgmt.element("RptDate");
						
						reportCount.put("acctCode", acctCode.getStringValue());
						reportCount.put("rptDate", rptDate.getStringValue());
			    	}else if(type.equals(PecrConstantUtil.IN_SPC_EVT_DSC_INF)){
			    		Element fbInf = rootElt.element("InSpcEvtDscInf");
			    		
						Element acctCode = fbInf.element("AcctCode");
						Element rptDate = fbInf.element("RptDate");
						
						reportCount.put("acctCode", acctCode.getStringValue());
						reportCount.put("rptDate", rptDate.getStringValue());
			    	}else if(type.equals(PecrConstantUtil.ENT_BS_SGMT)){  //------------------------------
			    		Element fbInf = rootElt.element("EnBasInf");
			    		Element ctrctBsSgmt = fbInf.element("BsSgmt");
			    		
			    		Element entName = ctrctBsSgmt.element("EntName");
						Element EntCertType = ctrctBsSgmt.element("EntCertType");
						Element EntCertNum = ctrctBsSgmt.element("EntCertNum");
						Element InfSurcCode = ctrctBsSgmt.element("InfSurcCode");
						Element rptDate = ctrctBsSgmt.element("RptDate");
						
						reportCount.put("entName", entName.getStringValue()); 
						reportCount.put("entCertType", EntCertType.getStringValue());
						reportCount.put("entCertNum", EntCertNum.getStringValue());
						reportCount.put("infSurcCode", InfSurcCode.getStringValue());
						reportCount.put("rptDate", rptDate.getStringValue());
						
			    	}else if(type.equals(PecrConstantUtil.ENT_INCOME_AND_EXPENSE_STATEME_BS)){  
			    		Element fbInf = rootElt.element("IncomeAndExpenseStatement");
			    		Element ctrctBsSgmt = fbInf.element("IncomeAndExpenseStatementBsSgmt");
			    		
			    		Element entName = ctrctBsSgmt.element("EntName");
						Element EntCertType = ctrctBsSgmt.element("EntCertType");
						Element EntCertNum = ctrctBsSgmt.element("EntCertNum");
						
						Element sheetYear = ctrctBsSgmt.element("SheetYear");
						Element sheetType = ctrctBsSgmt.element("SheetType");
						Element sheetTypeDivide = ctrctBsSgmt.element("SheetTypeDivide");
						
						Element cimoc = ctrctBsSgmt.element("Cimoc");
						Element rptDate = ctrctBsSgmt.element("RptDate");
						
						reportCount.put("entName", entName.getStringValue());
						reportCount.put("entCertType", EntCertType.getStringValue());
						reportCount.put("entCertNum", EntCertNum.getStringValue());
						
						reportCount.put("sheetYear", sheetYear.getStringValue());
						reportCount.put("sheetType", sheetType.getStringValue());
						reportCount.put("sheetTypeDivide", sheetTypeDivide.getStringValue());
						reportCount.put("cimoc", cimoc.getStringValue());
						
						reportCount.put("rptDate", rptDate.getStringValue());
						
			    	}else if(type.equals(PecrConstantUtil.ENT_EN_ICDN_RLTP_INF)){  
			    		Element fbInf = rootElt.element("EnIcdnRltpInf");
			    		
			    		Element entName = fbInf.element("EntName");
						Element entCertType = fbInf.element("EntCertType");
						Element entCertNum = fbInf.element("EntCertNum");
						
						Element assoEntName = fbInf.element("AssoEntName");
						Element assoEntCertType = fbInf.element("AssoEntCertType");
						Element assoEntCertNum = fbInf.element("AssoEntCertNum");
						
						Element rptDate = fbInf.element("RptDate");
						
						reportCount.put("entName", entName.getStringValue());
						reportCount.put("entCertType", entCertType.getStringValue());
						reportCount.put("entCertNum", entCertNum.getStringValue());
						
						reportCount.put("assoEntName", assoEntName.getStringValue());
						reportCount.put("assoEntCertType", assoEntCertType.getStringValue());
						reportCount.put("assoEntCertNum", assoEntCertNum.getStringValue());
						
						reportCount.put("rptDate", rptDate.getStringValue());
						
			    	}else if(type.equals(PecrConstantUtil.ENT_ACCT_BS_SGMT)){  //..
			    		Element fbInf = rootElt.element("EnAcctInf");
			    		Element ctrctBsSgmt = fbInf.element("AcctBsSgmt");
			    		
			    		Element acctCode = ctrctBsSgmt.element("AcctCode");
						
						Element rptDate = ctrctBsSgmt.element("RptDate");
						
						reportCount.put("acctCode", acctCode.getStringValue());
						
						reportCount.put("rptDate", rptDate.getStringValue());
						
			    	}else if(type.equals(PecrConstantUtil.ENT_GUAR_ACCT_BS_SGMT)){  //..
			    		
			    		Element fbInf = rootElt.element("EnSecAcctInf");
			    		Element ctrctBsSgmt = fbInf.element("GuarAcctBsSgmt");
			    		
			    		
			    		Element acctCode = ctrctBsSgmt.element("AcctCode");
						
						Element rptDate = ctrctBsSgmt.element("RptDate");
						
						reportCount.put("acctCode", acctCode.getStringValue());
						
						reportCount.put("rptDate", rptDate.getStringValue());
						
			    	}else if(type.equals(PecrConstantUtil.ENT_EN_CTRCT_INF)){   //..
			    		Element fbInf = rootElt.element("EnCtrctInf");
			    		Element ctrctBsSgmt = fbInf.element("CtrctBsSgmt");
			    		
			    		Element contractCode = ctrctBsSgmt.element("ContractCode");
						
						Element rptDate = ctrctBsSgmt.element("RptDate");
						
						reportCount.put("contractCode", contractCode.getStringValue());
						
						reportCount.put("rptDate", rptDate.getStringValue());
						
			    	}else if(type.equals(PecrConstantUtil.ENT_BALANCE_SHEET)){  //..
			    		Element fbInf = rootElt.element("BalanceSheet");
			    		Element ctrctBsSgmt = fbInf.element("BalanceSheetBsSgmt");
			    		
			    		Element entName = ctrctBsSgmt.element("EntName");
						Element entCertType = ctrctBsSgmt.element("EntCertType");
						Element entCertNum = ctrctBsSgmt.element("EntCertNum");
						Element sheetYear = ctrctBsSgmt.element("SheetYear");
						Element sheetType = ctrctBsSgmt.element("SheetType");
						Element sheetTypeDivide = ctrctBsSgmt.element("SheetTypeDivide");
						Element cimoc = ctrctBsSgmt.element("Cimoc");
						Element rptDate = ctrctBsSgmt.element("RptDate");
						
						reportCount.put("entName", entName.getStringValue());
						reportCount.put("entCertType", entCertType.getStringValue());
						reportCount.put("entCertNum", entCertNum.getStringValue());
						reportCount.put("sheetYear", sheetYear.getStringValue());
						reportCount.put("sheetType", sheetType.getStringValue());
						reportCount.put("sheetTypeDivide", sheetTypeDivide.getStringValue());
						reportCount.put("cimoc", cimoc.getStringValue());
						reportCount.put("rptDate", rptDate.getStringValue());
						
			    	}else if(type.equals(PecrConstantUtil.ENT_CASH_FLOWS)){   //..
			    		Element fbInf = rootElt.element("CashFlows");
			    		Element ctrctBsSgmt = fbInf.element("CashFlowsBsSgmt");
			    		
			    		Element entName = ctrctBsSgmt.element("EntName");
						Element entCertType = ctrctBsSgmt.element("EntCertType");
						Element entCertNum = ctrctBsSgmt.element("EntCertNum");
						Element sheetYear = ctrctBsSgmt.element("SheetYear");
						Element sheetType = ctrctBsSgmt.element("SheetType");
						Element sheetTypeDivide = ctrctBsSgmt.element("SheetTypeDivide");
						Element cimoc = ctrctBsSgmt.element("Cimoc");
						Element rptDate = ctrctBsSgmt.element("RptDate");
						
						reportCount.put("entName", entName.getStringValue());
						reportCount.put("entCertType", entCertType.getStringValue());
						reportCount.put("entCertNum", entCertNum.getStringValue());
						reportCount.put("sheetYear", sheetYear.getStringValue());
						reportCount.put("sheetType", sheetType.getStringValue());
						reportCount.put("sheetTypeDivide", sheetTypeDivide.getStringValue());
						reportCount.put("cimoc", cimoc.getStringValue());
						reportCount.put("rptDate", rptDate.getStringValue());
						
			    	}else if(type.equals(PecrConstantUtil.ENT_INCODE_STATE_PRO)){  //..
			    		Element fbInf = rootElt.element("IncomeStatementProfitAppropriation");
			    		Element ctrctBsSgmt = fbInf.element("IncomeStatementProfitAppropriationBsSgmt");
			    		
			    		Element entName = ctrctBsSgmt.element("EntName");
						Element entCertType = ctrctBsSgmt.element("EntCertType");
						Element entCertNum = ctrctBsSgmt.element("EntCertNum");
						Element sheetYear = ctrctBsSgmt.element("SheetYear");
						Element sheetType = ctrctBsSgmt.element("SheetType");
						Element sheetTypeDivide = ctrctBsSgmt.element("SheetTypeDivide");
						Element cimoc = ctrctBsSgmt.element("Cimoc");
						Element rptDate = ctrctBsSgmt.element("RptDate");
						
						reportCount.put("entName", entName.getStringValue());
						reportCount.put("entCertType", entCertType.getStringValue());
						reportCount.put("entCertNum", entCertNum.getStringValue());
						reportCount.put("sheetYear", sheetYear.getStringValue());
						reportCount.put("sheetType", sheetType.getStringValue());
						reportCount.put("sheetTypeDivide", sheetTypeDivide.getStringValue());
						reportCount.put("cimoc", cimoc.getStringValue());
						reportCount.put("rptDate", rptDate.getStringValue());
						
			    	}else if(type.equals(PecrConstantUtil.ENT_INST_BALANCE)){  //..
			    		Element fbInf = rootElt.element("InstitutionBalanceSheet");
			    		Element ctrctBsSgmt = fbInf.element("InstitutionBalanceSheetBsSgmt");
			    		
			    		Element entName = ctrctBsSgmt.element("EntName");
						Element entCertType = ctrctBsSgmt.element("EntCertType");
						Element entCertNum = ctrctBsSgmt.element("EntCertNum");
						Element sheetYear = ctrctBsSgmt.element("SheetYear");
						Element sheetType = ctrctBsSgmt.element("SheetType");
						Element sheetTypeDivide = ctrctBsSgmt.element("SheetTypeDivide");
						Element cimoc = ctrctBsSgmt.element("Cimoc");
						Element rptDate = ctrctBsSgmt.element("RptDate");
						
						reportCount.put("entName", entName.getStringValue());
						reportCount.put("entCertType", entCertType.getStringValue());
						reportCount.put("entCertNum", entCertNum.getStringValue());
						reportCount.put("sheetYear", sheetYear.getStringValue());
						reportCount.put("sheetType", sheetType.getStringValue());
						reportCount.put("sheetTypeDivide", sheetTypeDivide.getStringValue());
						reportCount.put("cimoc", cimoc.getStringValue());
						reportCount.put("rptDate", rptDate.getStringValue());
			    	}
				} catch (DocumentException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return reportCount;
			}
		}
		return reportCount;
    }
}
