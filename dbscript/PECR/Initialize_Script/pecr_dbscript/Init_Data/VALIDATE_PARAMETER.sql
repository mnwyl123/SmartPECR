DELETE FROM VALIDATE_PARAMETER;
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('Identity_Matching_04', '''2''', '出资人身份类别要与出资人身份标识类型匹配', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('Identity_Matching_05', '1'',''2'',''5'',''6'',''8'',''9'',''A'',''B'',''C'',''X'',''10'',''20', '出资人身份类别要与出资人身份标识类型匹配', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('Identity_Matching_06', 'SHAR_HOD_ID_TYPE', '出资人身份类别要与出资人身份标识类型匹配', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ENT_CERT_NUM_lengthfor40', '40', '企业身份标识号码长度不能超过40', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('INF_SURC_CODE_lengthfor20', '20', '信息来源编码长度不能超过20', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('CIMOC_lengthfor14', '14', '客户资料维护机构代码长度不能超过14', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('OTH_ENT_CERT_NUM_lengthfor40', '40', '其他标识信息段企业身份标识号码长度不能超过40', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('REG_ADD_lengthfor100', '100', '基本概况信息登记地址长度校验不能超过100', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('BIZ_RANGE_lengthfor400', '400', '基本概况信息业务范围长度校验不能超过400', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('MMB_ALIAS_lengthfor30', '30', '主要组成人员姓名长度不能超过30', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('MMB_ID_NUM_lengthfor20', '20', '主要组成人员证件号码长度不能超过20', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('REG_CAP_lengthfor15', '15', '注册资本长度不能超过15', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('SHAR_HOD_NAME_lengthfor80', '80', '出资人名称长度不能超过80', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('SHAR_HOD_ID_NUM_lengthfor40', '40', '出资人身份标识号码长度不能超过40', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_ACCT_CODE_01', 'ACCT_CODE', '借贷账户待删除的业务标识码必须在库中存在', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_EDA_01', 'E_ACCT_BS', '借贷账户待删除的业务标识码必须在库中存在', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_ACCT_CODE_02', 'ACCT_CODE', '担保账户待删除的业务标识码必须在库中存在', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_EDA_02', 'E_GUAR_ACCT_BS', '担保账户待删除的业务标识码必须在库中存在', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_ACCT_CODE_03', 'CONTRACT_CODE', '授信协议待删除的业务标识码必须在库中存在', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_EDA_03', 'E_CTRCT_BS', '授信协议待删除的业务标识码必须在库中存在', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_ACCT_CODE_04', 'CC_CODE', '抵质押待删除的业务标识码必须在库中存在', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_EDA_04', 'MOTGA_CLTAL_CTRCT_BS', '抵质押待删除的业务标识码必须在库中存在', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_BS_SGMT_02', 'E_ACCT_BS', '借贷原本业务标识码必须是库中已有且正在使用的', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_LBLTY_INF_SGMT_01', 'E_ACT_LBLTY_INF', '借贷原本业务标识码必须是库中已有且正在使用的', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_pk_BS_SGMT_ID_01', 'EDA_ACCT_BS_SGMT_ID', '借贷原本业务标识码必须是库中已有且正在使用的', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_ACCT_STATUS_01', 'ACCT_STATUS', '借贷原本业务标识码必须是库中已有且正在使用的', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('acct_status_01', '21', '借贷原本业务标识码必须是库中已有且正在使用的', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_ACCT_CODe1_01', 'ACCT_CODE', '借贷原本业务标识码必须是库中已有且正在使用的', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_BS_SGMT2_01', 'E_ACCT_BS', '借贷新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_LBLTY_INF_SGMT2_01', 'E_ACT_LBLTY_INF', '借贷新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_pk_BS_SGMT_ID2_01', 'EDA_ACCT_BS_SGMT_ID', '借贷新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_ACCT_STATUS2_01', 'ACCT_STATUS', '借贷新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('acct_status2_01', '21', '借贷新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('inf_rec_type_01', '614', '企业身份标识类型+企业身份标识代码+报表年份+报表类型+报表类型细分+数据提供机构区段码必须在库中存在', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_SHEET_BS_SGMT_01', 'E_BALANCE_SHEET_BS', '企业身份标识类型+企业身份标识代码+报表年份+报表类型+报表类型细分+数据提供机构区段码必须在库中存在', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_SHEET_BS_SGMT_02', 'E_CASH_FLOWS_BS', '企业身份标识类型+企业身份标识代码+报表年份+报表类型+报表类型细分+数据提供机构区段码必须在库中存在', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('inf_rec_type_02', '634', '企业身份标识类型+企业身份标识代码+报表年份+报表类型+报表类型细分+数据提供机构区段码必须在库中存在', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_SHEET_BS_SGMT_03', 'E_INCOME_STATEMENT', '企业身份标识类型+企业身份标识代码+报表年份+报表类型+报表类型细分+数据提供机构区段码必须在库中存在', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('inf_rec_type_03', '624', '企业身份标识类型+企业身份标识代码+报表年份+报表类型+报表类型细分+数据提供机构区段码必须在库中存在', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_SHEET_BS_SGMT_04', 'E_INSTITU_BALANCE_BS', '企业身份标识类型+企业身份标识代码+报表年份+报表类型+报表类型细分+数据提供机构区段码必须在库中存在', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('inf_rec_type_04', '644', '企业身份标识类型+企业身份标识代码+报表年份+报表类型+报表类型细分+数据提供机构区段码必须在库中存在', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_SHEET_BS_SGMT_05', 'E_INCOME_EXPENSE_BS', '企业身份标识类型+企业身份标识代码+报表年份+报表类型+报表类型细分+数据提供机构区段码必须在库中存在', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('inf_rec_type_05', '654', '企业身份标识类型+企业身份标识代码+报表年份+报表类型+报表类型细分+数据提供机构区段码必须在库中存在', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_OD_BNES_CODE_02', 'OD_BNES_CODE', '担保原业务标识码和新业务标识码不能相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_OD_BNES_CODE_03', 'OD_BNES_CODE', '授信原业务标识码和新业务标识码不能相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_OD_BNES_CODE_04', 'OD_BNES_CODE', '抵质押原业务标识码和新业务标识码不能相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_LBLTY_INF_SGMT_02', 'E_GUAR_INSURANCE_INF', '担保原本业务标识码必须是库中已有且正在使用的', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_BS_SGMT_03', 'E_GUAR_ACCT_BS', '担保原本业务标识码必须是库中已有且正在使用的', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_pk_BS_SGMT_ID_02', 'EEA_GUAR_ACCT_BS_SGMT_ID', '担保原本业务标识码必须是库中已有且正在使用的', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_ACCT_STATUS_02', 'ACCT_STATUS', '担保原本业务标识码必须是库中已有且正在使用的', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_OD_BNES_CODE_01', 'OD_BNES_CODE', '原业务标识码和新业务标识码不能相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('acct_status_02', '2', '担保原本业务标识码必须是库中已有且正在使用的', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_ACCT_CODe1_02', 'ACCT_CODE', '担保原本业务标识码必须是库中已有且正在使用的', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_LBLTY_INF_SGMT_03', 'E_CREDIT_LIM', '授信原本业务标识码必须是库中已有且正在使用的', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_BS_SGMT_04', 'E_CTRCT_BS', '授信原本业务标识码必须是库中已有且正在使用的', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_pk_BS_SGMT_ID_03', 'EGA_CTRCT_BS_SGMT_ID', '授信原本业务标识码必须是库中已有且正在使用的', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_A_accttype_not_04', 'ACCT_TYPE', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为D2,C1不应包含抵质押物信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('acct_status_03', '2', '授信原本业务标识码必须是库中已有且正在使用的', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_ACCT_CODe1_03', 'CONTRACT_CODE', '授信原本业务标识码必须是库中已有且正在使用的', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_LBLTY_INF_SGMT_04', 'MOTGA_CLTAL_BS_INF', '抵质押原本业务标识码必须是库中已有且正在使用的', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_BS_SGMT_05', 'MOTGA_CLTAL_CTRCT_BS', '抵质押原本业务标识码必须是库中已有且正在使用的', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_pk_BS_SGMT_ID_04', 'EFA_MOTGA_CLTAL_CTRCT_BS_ID', '抵质押原本业务标识码必须是库中已有且正在使用的', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_ACCT_STATUS_03', 'CON_STATUS', '授信原本业务标识码必须是库中已有且正在使用的', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m13_01', '现金及现金等价物净增加额', '现金及现金等价物净增加额＝筹集活动产生的现金流量净额＋汇率变动对现金的影响＋经营活动产生的现金流量净额＋投资活动产生的现金流量净额', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m14_01', '筹集活动产生的现金流量净额', '现金及现金等价物净增加额＝筹集活动产生的现金流量净额＋汇率变动对现金的影响＋经营活动产生的现金流量净额＋投资活动产生的现金流量净额', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m15_01', '汇率变动对现金的影响', '现金及现金等价物净增加额＝筹集活动产生的现金流量净额＋汇率变动对现金的影响＋经营活动产生的现金流量净额＋投资活动产生的现金流量净额', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m16_01', '经营活动产生的现金流量净额', '现金及现金等价物净增加额＝筹集活动产生的现金流量净额＋汇率变动对现金的影响＋经营活动产生的现金流量净额＋投资活动产生的现金流量净额', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m17_01', '投资活动产生的现金流量净额', '现金及现金等价物净增加额＝筹集活动产生的现金流量净额＋汇率变动对现金的影响＋经营活动产生的现金流量净额＋投资活动产生的现金流量净额', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_CURRENT_ASSETS2_01', 'NET_CASH_FLOWS_FROM_FINANCING_', '现金及现金等价物净增加额＝筹集活动产生的现金流量净额＋汇率变动对现金的影响＋经营活动产生的现金流量净额＋投资活动产生的现金流量净额', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_NON_CURRENT_ASSETS2_01', 'EFFECT_OF_EXCHANG_RATE_CHANGES', '现金及现金等价物净增加额＝筹集活动产生的现金流量净额＋汇率变动对现金的影响＋经营活动产生的现金流量净额＋投资活动产生的现金流量净额', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_TOTAL_EQUITY2_01', 'NET_CASH_FLOWS_FROM_OPERATING', '现金及现金等价物净增加额＝筹集活动产生的现金流量净额＋汇率变动对现金的影响＋经营活动产生的现金流量净额＋投资活动产生的现金流量净额', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_FROM_INVESTING2_01', 'NET_CASH_FLOWS_FROM_INVESTING_', '现金及现金等价物净增加额＝筹集活动产生的现金流量净额＋汇率变动对现金的影响＋经营活动产生的现金流量净额＋投资活动产生的现金流量净额', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m1_07', '经营活动产生的现金流量净额', '经营活动产生的现金流量净额=经营活动现金流入小计－经营活动现金流出小计', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m2_07', '经营活动现金流入小计', '经营活动产生的现金流量净额=经营活动现金流入小计－经营活动现金流出小计', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m3_07', '经营活动现金流出小计', '经营活动产生的现金流量净额=经营活动现金流入小计－经营活动现金流出小计', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_REVENUE_07', 'TOTAL_CASH_INFLOWS_FROM_OPERAT', '经营活动产生的现金流量净额=经营活动现金流入小计－经营活动现金流出小计', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('org_type_01', '1'',''11'',''13'',''17'',''19'',''5'',''51'',''59'',''7'',''71'',''79', '首次新增客户资料/首次上报,对于企业、事业单位、社会团体（三类组织的分支机构除外），需要报送注册资本及主要出资人段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('org_type_02', '10', '首次新增客户资料/首次上报,对于企业、事业单位、社会团体（三类组织的分支机构除外），需要报送注册资本及主要出资人段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('org_type_03', 'RPT_DATE_CODE', '首次新增客户资料/首次上报,对于企业、事业单位、社会团体（三类组织的分支机构除外），需要报送注册资本及主要出资人段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('org_type_04', 'E_MN_SHA_HOD_INF', '首次新增客户资料/首次上报,对于企业、事业单位、社会团体（三类组织的分支机构除外），需要报送注册资本及主要出资人段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('OrgType_for_value_01', '3'',''31'',''32'',''33'',''34'',''35'',''36'',''37'',''39', '组织机构类型为机关类型时，注册资本及主要出资人段不能出现', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('OrgType_for_value_02', 'E_MN_SHA_HOD_INF', '组织机构类型为机关类型时，注册资本及主要出资人段不能出现', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('Reg_Add_is_Null_01', '''CHN''', '当国别代码为CHN时，登记地址不能为空', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('Reg_Add_is_Null_02', 'REG_ADD', '当国别代码为CHN时，登记地址不能为空', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('Reg_Add_not_Null_01', '''CHN''', '当国别代码不为CHN时，登记地址统一为空', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('Reg_Add_not_Null_02', 'REG_ADD', '当国别代码不为CHN时，登记地址统一为空', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('Establish_Date_01', 'ESTABLISH_DATE', '基本概况信息段中成立日期要不晚于信息更新日期', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('Between_Two_Numbers_01', '0', '注册资本及主要出资人段中的出资比例大于0', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('Between_Two_Numbers_02', '100', '注册资本及主要出资人段中的出资比例大于0', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('Identity_Matching_01', '''1''', '出资人身份类别要与出资人身份标识类型匹配', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('Identity_Matching_02', '41'',''10'',''20'',''30'',''01'',''02'',''03'',''04'',''05'',''06'',''07'',''08'',''42', '出资人身份类别要与出资人身份标识类型匹配', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('lengthfor80', '80', '企业名称长度不能超过80', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('Identity_Matching_03', 'SHAR_HOD_ID_TYPE', '出资人身份类别要与出资人身份标识类型匹配', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_ACCT_STATUS_04', 'CC_STATUS', '抵质押原本业务标识码必须是库中已有且正在使用的', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('acct_status_04', '2', '抵质押原本业务标识码必须是库中已有且正在使用的', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_ACCT_CODe1_04', 'CC_CODE', '抵质押原本业务标识码必须是库中已有且正在使用的', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_BS_SGMT2_02', 'E_GUAR_ACCT_BS', '担保新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_LBLTY_INF_SGMT2_02', 'E_GUAR_INSURANCE_INF', '担保新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_pk_BS_SGMT_ID2_02', 'EEA_GUAR_ACCT_BS_SGMT_ID', '担保新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_ACCT_STATUS2_02', 'ACCT_STATUS', '担保新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('acct_status2_02', '2', '担保新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_ACCT_CODe2_02', 'ACCT_CODE', '担保新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_BS_SGMT2_03', 'E_CTRCT_BS', '授信新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_LBLTY_INF_SGMT2_03', 'E_CREDIT_LIM', '授信新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_pk_BS_SGMT_ID2_03', 'EGA_CTRCT_BS_SGMT_ID', '授信新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_ACCT_STATUS2_03', 'CON_STATUS', '授信新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('acct_status2_03', '2', '授信新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_ACCT_CODe2_03', 'ACCT_CODE', '授信新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_BS_SGMT2_04', 'MOTGA_CLTAL_CTRCT_BS', '抵质押新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_LBLTY_INF_SGMT2_04', 'MOTGA_CLTAL_BS_INF', '抵质押新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_pk_BS_SGMT_ID2_04', 'EFA_MOTGA_CLTAL_CTRCT_BS_ID', '抵质押新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_ACCT_STATUS2_04', 'CC_STATUS', '抵质押新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('acct_status2_04', '2', '抵质押新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_ACCT_CODe2_04', 'CC_CODE', '抵质押新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('inf_rec_type2_01', '412', '借贷待更正业务标识码必须在库中存在', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('inf_rec_type3_01', '410', '借贷待更正业务标识码必须在库中存在', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('mdfc_sgmt_code2_01', 'B', '借贷更正基础段时，待入库的更正请求记录的信息报告日期应等于库中相应信息段最新的信息报告日期', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('inf_rec_type2_02', '442', '担保待更正业务标识码必须在库中存在', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('inf_rec_type3_02', '440', '担保待更正业务标识码必须在库中存在', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_INF_REC_TYPE1_02', 'INF_REC_TYPE', '担保待更正业务标识码必须在库中存在', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('inf_rec_type5_02', '440', '担保待更正记录基础段的“账户类型”应与库中“账户类型”一致', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('inf_rec_type6_02', '442', '担保待更正记录基础段的“账户类型”应与库中“账户类型”一致', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_pk_SGMT_ID3_02', 'EEA_GUAR_ACCT_BS_SGMT_ID', '担保更正相关还款责任人段时，责任人两标与借款人两标不能相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_BS_SGMT3_02', 'E_GUAR_ACCT_BS', '担保更正相关还款责任人段时，责任人两标与借款人两标不能相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('inf_rec_type7_02', '440', '担保更正相关还款责任人段时，责任人两标与借款人两标不能相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('mdfc_sgmt_code_02', 'H', '担保更正相关还款责任人段时，责任人两标与借款人两标不能相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_CERT_TYPE_02', 'ARLP_CERT_TYPE', '担保更正相关还款责任人段时，责任人两标与借款人两标不能相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_ACCT_CODE1_02', 'ACCT_CODE', '担保更正相关还款责任人段时，责任人两标与借款人两标不能相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m24_02', '责任人两标', '担保更正相关还款责任人段时，责任人两标与借款人两标不能相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m25_02', '借款人两标', '担保更正相关还款责任人段时，责任人两标与借款人两标不能相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('inf_rec_type8_02', '440', '担保更正基础段时，待入库的更正请求记录的信息报告日期应等于库中相应信息段最新的信息报告日期', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('mdfc_sgmt_code2_02', 'B', '担保更正基础段时，待入库的更正请求记录的信息报告日期应等于库中相应信息段最新的信息报告日期', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('inf_rec_type2_03', '422', '授信待更正业务标识码必须在库中存在', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('inf_rec_type3_03', '420', '授信待更正业务标识码必须在库中存在', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_INF_REC_TYPE1_03', 'INF_REC_TYPE', '授信待更正业务标识码必须在库中存在', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_pk_SGMT_ID3_03', 'EGA_CTRCT_BS_SGMT_ID', '授信更正共同受信人信息段时，共同受信人两标与受信人两标不能相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_BS_SGMT3_03', 'E_CTRCT_BS', '授信更正共同受信人信息段时，共同受信人两标与受信人两标不能相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('inf_rec_type7_03', '420', '授信更正共同受信人信息段时，共同受信人两标与受信人两标不能相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('mdfc_sgmt_code_03', 'C', '授信更正共同受信人信息段时，共同受信人两标与受信人两标不能相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_CERT_TYPE_03', 'CERT_REL_IDTYPE', '授信更正共同受信人信息段时，共同受信人两标与受信人两标不能相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_ACCT_CODE1_03', 'CONTRACT_CODE', '授信更正共同受信人信息段时，共同受信人两标与受信人两标不能相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m24_03', '共同受信人两标', '授信更正共同受信人信息段时，共同受信人两标与受信人两标不能相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m25_03', '受信人两标', '授信更正共同受信人信息段时，共同受信人两标与受信人两标不能相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_EDA_05', 'E_CTRCT_BS', '授信协议按段删除待删除的业务标识码必须在库中存在', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_ACCT_CODE_05', 'CONTRACT_CODE', '授信协议按段删除待删除的业务标识码必须在库中存在', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_DEL_END_DATE_01', 'DEL_END_DATE', '授信待删除起始日期,待删除的终止日期不能同时为空值', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_DEL_START_DATE_01', 'DEL_START_DATE', '授信待删除起始日期必须小于等于待删除的结束日期', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m19_01', '待删除起始日期', '授信待删除起始日期必须小于等于待删除的结束日期', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m20_01', '待删除的结束日期', '授信待删除起始日期必须小于等于待删除的结束日期', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m21_01', '小于等于', '授信待删除起始日期必须小于等于待删除的结束日期', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_EDA_06', 'E_GUAR_ACCT_BS', '担保按段删除待删除的业务标识码必须在库中存在', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_ACCT_CODE_06', 'ACCT_CODE', '担保按段删除待删除的业务标识码必须在库中存在', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_DEL_END_DATE_02', 'DEL_END_DATE', '担保待删除起始日期,待删除的终止日期不能同时为空值', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_DEL_START_DATE_02', 'DEL_START_DATE', '担保待删除起始日期必须小于等于待删除的结束日期', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m19_02', '待删除起始日期', '担保待删除起始日期必须小于等于待删除的结束日期', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m20_02', '待删除的结束日期', '担保待删除起始日期必须小于等于待删除的结束日期', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('inf_rec_type8_01', '410', '借贷更正基础段时，待入库的更正请求记录的信息报告日期应等于库中相应信息段最新的信息报告日期', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m21_02', '小于等于', '担保待删除起始日期必须小于等于待删除的结束日期', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_A2_code2_01', 'RPT_DATE_CODE', '报送时点说明代码为10-新开户/首次报送，账户类型为D1且分次放款标识为1,2，则应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_code2_01', '''10''', '报送时点说明代码为10-新开户/首次报送，账户类型为D1且分次放款标识为1,2，则应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_accttype2_01', 'ACCT_TYPE', '报送时点说明代码为10-新开户/首次报送，账户类型为D1且分次放款标识为1,2，则应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_accttype_04', 'ACCT_TYPE', '报送时点说明代码为41-五级分类调整，账户类型为D1,D2,R4,C1应包含还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('accttype_04', '''D1'',''D2'',''R4'',''C1''', '报送时点说明代码为41-五级分类调整，账户类型为D1,D2,R4,C1应包含还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_A_pk_04', 'EDG_ACT_LBLTY_INF_SGMT_ID', '报送时点说明代码为41-五级分类调整，账户类型为D1,D2,R4,C1应包含还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms1_04', '41-五级分类调整', '报送时点说明代码为41-五级分类调整，账户类型为D1,D2,R4,C1应包含还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms2_04', 'D1,D2,R4,C1', '报送时点说明代码为41-五级分类调整，账户类型为D1,D2,R4,C1应包含还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms3_04', '还款表现信息段', '报送时点说明代码为41-五级分类调整，账户类型为D1,D2,R4,C1应包含还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_code4_04', '41', '账户类型为R1不适用41-五级分类调整的报送时点', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_accttype4_04', 'ACCT_TYPE', '账户类型为R1不适用41-五级分类调整的报送时点', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('accttype4_04', '''R1''', '账户类型为R1不适用41-五级分类调整的报送时点', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms14_04', 'R1', '账户类型为R1不适用41-五级分类调整的报送时点', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms15_04', '41-五级分类调整', '账户类型为R1不适用41-五级分类调整的报送时点', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_A1_not_null_03', 'E_ACT_LBLTY_INF', '报送时点说明代码为42-展期发生，账户类型为D1,R4应包含还款表现信息段、特定交易说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_B1_not_null_03', 'E_ACCT_SPEC_TRST', '报送时点说明代码为42-展期发生，账户类型为D1,R4应包含还款表现信息段、特定交易说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_code1_03', '42', '报送时点说明代码为42-展期发生，账户类型为D1,R4应包含还款表现信息段、特定交易说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_accttype1_03', 'ACCT_TYPE', '报送时点说明代码为42-展期发生，账户类型为D1,R4应包含还款表现信息段、特定交易说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('accttype1_03', '''D1'',''R4''', '报送时点说明代码为42-展期发生，账户类型为D1,R4应包含还款表现信息段、特定交易说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_A1_pk_not_null_03', 'EDG_ACT_LBLTY_INF_SGMT_ID', '报送时点说明代码为42-展期发生，账户类型为D1,R4应包含还款表现信息段、特定交易说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_B1_pk_not_null_03', 'EDH_ACCT_SPEC_TRST_DSPN_SG_ID', '报送时点说明代码为42-展期发生，账户类型为D1,R4应包含还款表现信息段、特定交易说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms4_03', '42-展期发生', '报送时点说明代码为42-展期发生，账户类型为D1,R4应包含还款表现信息段、特定交易说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms5_03', 'D1,R4', '报送时点说明代码为42-展期发生，账户类型为D1,R4应包含还款表现信息段、特定交易说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms6_03', '还款表现信息段、特定交易说明', '报送时点说明代码为42-展期发生，账户类型为D1,R4应包含还款表现信息段、特定交易说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_code4_05', '42', '账户类型为D2,R1,C1不适用42-展期发生的报送时点', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_accttype4_05', 'ACCT_TYPE', '账户类型为D2,R1,C1不适用42-展期发生的报送时点', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('accttype4_05', '''D2'',''R1'',''C1''', '账户类型为D2,R1,C1不适用42-展期发生的报送时点', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms14_05', 'D2,R1,C1', '账户类型为D2,R1,C1不适用42-展期发生的报送时点', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms15_05', '42-展期发生', '账户类型为D2,R1,C1不适用42-展期发生的报送时点', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_A_not_null_05', 'E_ACT_LBLTY_INF', '报送时点说明代码为49-其他报送日，账户类型为D1,D2,R1,R4,C1应包含还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_code_05', '49', '报送时点说明代码为49-其他报送日，账户类型为D1,D2,R1,R4,C1应包含还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_A_null_04', 'E_ACCT_BS', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为D2,C1不应包含抵质押物信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_A_pk_null_04', 'EDA_ACCT_BS_SGMT_ID', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为D2,C1不应包含抵质押物信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_A_rptdatecode_not_04', 'RPT_DATE_CODE', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为D2,C1不应包含抵质押物信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('rptdatecode_not_04', '''10'',''20'',''32'',''33'',''41'',''49''', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为D2,C1不应包含抵质押物信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_EXPENDITURE_07', 'TOTAL_CASH_OUTFLOWS_FROM_OPERA', '经营活动产生的现金流量净额=经营活动现金流入小计－经营活动现金流出小计', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m1_08', '投资活动产生的现金流量净额', '投资活动产生的现金流量净额＝投资活动现金流入小计－投资活动现金流出小计', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m2_08', '投资活动现金流入小计', '投资活动产生的现金流量净额＝投资活动现金流入小计－投资活动现金流出小计', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m3_08', '投资活动现金流出小计', '投资活动产生的现金流量净额＝投资活动现金流入小计－投资活动现金流出小计', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_REVENUE_08', 'TOTAL_CASH_INFLOWS_FROM_INVEST', '投资活动产生的现金流量净额＝投资活动现金流入小计－投资活动现金流出小计', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_EXPENDITURE_08', 'SUB_TOTAL_OF_CASH_OUTFLOWS', '投资活动产生的现金流量净额＝投资活动现金流入小计－投资活动现金流出小计', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m1_09', '筹资活动产生的现金流量净额', '筹资活动产生的现金流量净额＝筹资活动现金流入小计－筹资活动现金流出小计', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m2_09', '筹资活动现金流入小计', '筹资活动产生的现金流量净额＝筹资活动现金流入小计－筹资活动现金流出小计', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m3_09', '筹资活动现金流出小计', '筹资活动产生的现金流量净额＝筹资活动现金流入小计－筹资活动现金流出小计', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_REVENUE_09', 'TOTAL_CASH_INFLOWS_FROM_FINANC', '筹资活动产生的现金流量净额＝筹资活动现金流入小计－筹资活动现金流出小计', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_EXPENDITURE_09', 'TOTAL_CASH_OUTFLOWS_FROM_FINAN', '筹资活动产生的现金流量净额＝筹资活动现金流入小计－筹资活动现金流出小计', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m13_02', '现金及现金等价物净增加额', '现金及现金等价物净增加额=经营活动产生的现金流量净额+投资活动产生的现金流量净额+筹资活动产生的现金流量净额+汇率变动对现金及现金等价物的影响', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m14_02', '经营活动产生的现金流量净额', '现金及现金等价物净增加额=经营活动产生的现金流量净额+投资活动产生的现金流量净额+筹资活动产生的现金流量净额+汇率变动对现金及现金等价物的影响', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m15_02', '投资活动产生的现金流量净额', '现金及现金等价物净增加额=经营活动产生的现金流量净额+投资活动产生的现金流量净额+筹资活动产生的现金流量净额+汇率变动对现金及现金等价物的影响', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m16_02', '筹资活动产生的现金流量净额', '现金及现金等价物净增加额=经营活动产生的现金流量净额+投资活动产生的现金流量净额+筹资活动产生的现金流量净额+汇率变动对现金及现金等价物的影响', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m17_02', '汇率变动对现金及现金等价物的影响', '现金及现金等价物净增加额=经营活动产生的现金流量净额+投资活动产生的现金流量净额+筹资活动产生的现金流量净额+汇率变动对现金及现金等价物的影响', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_CURRENT_ASSETS2_02', 'NET_CASH_FLOWS_FROM_OPERATING', '现金及现金等价物净增加额=经营活动产生的现金流量净额+投资活动产生的现金流量净额+筹资活动产生的现金流量净额+汇率变动对现金及现金等价物的影响', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_NON_CURRENT_ASSETS2_02', 'NET_CASH_FLOWS_FROM_INVESTING_', '现金及现金等价物净增加额=经营活动产生的现金流量净额+投资活动产生的现金流量净额+筹资活动产生的现金流量净额+汇率变动对现金及现金等价物的影响', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_TOTAL_EQUITY2_02', 'NET_CASH_FLOWS_FROM_INVESTING_', '现金及现金等价物净增加额=经营活动产生的现金流量净额+投资活动产生的现金流量净额+筹资活动产生的现金流量净额+汇率变动对现金及现金等价物的影响', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_FROM_INVESTING2_02', 'EFFECT_OF_EXCHANG_RATE_CHANGES', '现金及现金等价物净增加额=经营活动产生的现金流量净额+投资活动产生的现金流量净额+筹资活动产生的现金流量净额+汇率变动对现金及现金等价物的影响', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m4_05', '期末现金及现金等价物余额', '期末现金及现金等价物余额=现金及现金等价物净增加额+期初现金及现金等价物余额', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m5_05', '现金及现金等价物净增加额', '期末现金及现金等价物余额=现金及现金等价物净增加额+期初现金及现金等价物余额', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m6_05', '期初现金及现金等价物余额', '期末现金及现金等价物余额=现金及现金等价物净增加额+期初现金及现金等价物余额', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_CURRENT_ASSETS_05', 'NETINCREASEIN_CASH_AND_CASH_EQ', '期末现金及现金等价物余额=现金及现金等价物净增加额+期初现金及现金等价物余额', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('accttype_not_02', '''D1'',''R4''', '报送时点说明代码为33-实际还款,42-展期发生且账户类型为D1,R4不应包含初始债权说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_NON_CURRENT_ASSETS_05', 'INITIAL_CASH_AND_CASH_EQUIVALE', '期末现金及现金等价物余额=现金及现金等价物净增加额+期初现金及现金等价物余额', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_EGC_CREDIT_LIM_SGMT_01', 'E_CREDIT_LIM', '企业授信协议记录报送时，基础段和额度信息段必须出现', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('INF_REC_TYPE001_01', '420', '企业授信协议记录报送时，基础段和额度信息段必须出现', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_pk_EGC_CREDIT_LIM_SGMT_ID_01', 'EGC_CREDIT_LIM_SGMT_ID', '企业授信协议记录报送时，基础段和额度信息段必须出现', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m18_01', '额度信息段', '企业授信协议记录报送时，基础段和额度信息段必须出现', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_DEL_START_DATE_04', 'CON_EFF_DATE', '额度生效日期必须不晚于额度到期日期', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m19_04', '额度生效日期', '额度生效日期必须不晚于额度到期日期', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m20_04', '额度到期日期', '额度生效日期必须不晚于额度到期日期', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m21_04', '不晚于', '额度生效日期必须不晚于额度到期日期', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_CREDIT_REST CREDIT_REST_01', 'CREDIT_REST', '授信限额编号、授信限额其中之一不为空时，另一个应不为空', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m22_01', '授信限额编号', '授信限额编号、授信限额其中之一不为空时，另一个应不为空', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m23_01', '授信限额', '授信限额编号、授信限额其中之一不为空时，另一个应不为空', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_EGA_CTRCT_BS_SGMT1_01', 'E_CTRCT_BS', '受信人两标与共同受信人两标不能相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_SGMT_ID1_01', 'EGA_CTRCT_BS_SGMT_ID', '受信人两标与共同受信人两标不能相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_TYPE1_01', 'ID_TYPE', '受信人两标与共同受信人两标不能相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_IDTYPE1_01', 'CERT_REL_IDTYPE', '受信人两标与共同受信人两标不能相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_NUM1_01', 'ID_NUM', '受信人两标与共同受信人两标不能相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m26_01', '受信人两标', '受信人两标与共同受信人两标不能相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m27_01', '共同受信人两标', '受信人两标与共同受信人两标不能相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_EGC_CREDIT_LIM_SGMT_02', 'MOTGA_CLTAL_BS_INF', '抵质押基本信息段必须出现', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('INF_REC_TYPE001_02', '510', '抵质押基本信息段必须出现', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_pk_EGC_CREDIT_LIM_SGMT_ID_02', 'EFB_MOTGA_CLTAL_BS_INF_SGMT_ID', '抵质押基本信息段必须出现', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m18_02', '基本信息段', '抵质押基本信息段必须出现', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_DEL_START_DATE_05', 'CC_VAL_DATE', '抵质押合同生效日期不晚于合同到期日期', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m19_05', '生效日期', '抵质押合同生效日期不晚于合同到期日期', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m20_05', '到期日期', '抵质押合同生效日期不晚于合同到期日期', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m21_05', '不晚于', '抵质押合同生效日期不晚于合同到期日期', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_EFA_SGMT1_01', 'MOTGA_CLTAL_CTRCT_BS', '抵押物个数应大于 0', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_EFA_BS_ID1_01', 'EFA_MOTGA_CLTAL_CTRCT_BS_ID', '抵押物个数应大于 0', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_EFD_SGMT1_01', 'MOTGA_PROPT_INF', '抵押物个数应大于 0', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_EFD_SGMT_ID1_01', 'EFD_MOTGA_PROPT_INF_SGMT_ID', '抵押物个数应大于 0', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('GUAR_TYPE1_01', '1', '抵押物个数应大于 0', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m31_01', '抵押物', '抵押物个数应大于 0', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m32_01', '0', '抵押物个数应大于 0', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_EFA_SGMT1_02', 'MOTGA_CLTAL_CTRCT_BS', '质押物个数应大于 0', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_EFA_BS_ID1_02', 'EFA_MOTGA_CLTAL_CTRCT_BS_ID', '质押物个数应大于 0', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_EFD_SGMT1_02', 'MOTGA_CLTAL_INF', '质押物个数应大于 0', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_EFD_SGMT_ID1_02', 'EFE_CLTAL_INF_SGMT_ID', '质押物个数应大于 0', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('GUAR_TYPE1_02', '2', '质押物个数应大于 0', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m31_02', '质押物', '质押物个数应大于 0', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m32_02', '0', '质押物个数应大于 0', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_EGA_CTRCT_BS_SGMT1_02', 'MOTGA_CLTAL_CTRCT_BS', '债务人两标与其他债务人两标不能相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_SGMT_ID1_02', 'EFA_MOTGA_CLTAL_CTRCT_BS_ID', '债务人两标与其他债务人两标不能相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_TYPE1_02', 'CERT_TYPE', '债务人两标与其他债务人两标不能相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_IDTYPE1_02', 'GUAR_CERT_TYPE', '债务人两标与其他债务人两标不能相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_NUM1_02', 'CERT_NUM', '债务人两标与其他债务人两标不能相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m26_02', '债务人两标', '债务人两标与其他债务人两标不能相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m27_02', '其他债务人两标', '债务人两标与其他债务人两标不能相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_A1_not_null_01', 'E_ACCT_BS_INF', '报送时点说明代码为10-新开户/首次报送，账户类型为D2,C1应包含基本信息段、还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_B1_not_null_01', 'E_ACT_LBLTY_INF', '报送时点说明代码为10-新开户/首次报送，账户类型为D2,C1应包含基本信息段、还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_code1_01', '10', '报送时点说明代码为10-新开户/首次报送，账户类型为D2,C1应包含基本信息段、还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_accttype_05', 'ACCT_TYPE', '报送时点说明代码为49-其他报送日，账户类型为D1,D2,R1,R4,C1应包含还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('accttype_05', '''D1'',''D2'',''R1'',''R4'',''C1''', '报送时点说明代码为49-其他报送日，账户类型为D1,D2,R1,R4,C1应包含还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_A_pk_05', 'EDG_ACT_LBLTY_INF_SGMT_ID', '报送时点说明代码为49-其他报送日，账户类型为D1,D2,R1,R4,C1应包含还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms1_05', '49-其他报送日', '报送时点说明代码为49-其他报送日，账户类型为D1,D2,R1,R4,C1应包含还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms2_05', 'D1,D2,R1,R4,C1', '报送时点说明代码为49-其他报送日，账户类型为D1,D2,R1,R4,C1应包含还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms3_05', '还款表现信息段', '报送时点说明代码为49-其他报送日，账户类型为D1,D2,R1,R4,C1应包含还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_A_null_01', 'E_ACCT_BS', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算，49-其他报送日且账户类型为D1,R1,R4不应包含初始债权说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_A_pk__null_01', 'EDA_ACCT_BS_SGMT_ID', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算，49-其他报送日且账户类型为D1,R1,R4不应包含初始债权说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_A_rptdatecode_not_01', 'RPT_DATE_CODE', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算，49-其他报送日且账户类型为D1,R1,R4不应包含初始债权说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('rptdatecode_not_01', '''10'',''20'',''32'',''49''', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算，49-其他报送日且账户类型为D1,R1,R4不应包含初始债权说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_A_accttype_not_01', 'ACCT_TYPE', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算，49-其他报送日且账户类型为D1,R1,R4不应包含初始债权说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_EDA_07', 'E_ACCT_BS', '借贷按段删除待删除的业务标识码必须在库中存在', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_ACCT_CODE_07', 'ACCT_CODE', '借贷按段删除待删除的业务标识码必须在库中存在', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ent_cert_type_01', '10', '企业基本信息记录基础段企业身份标识类型为中征码', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ent_cert_type_02', '20', '企业基本信息记录基础段企业身份标识类型为统一社会信用代码', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ent_cert_type_03', '30', '企业基本信息记录基础段企业身份标识类型为组织机构代码', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('oth_ent_cert_type_03', '10'',''20'',''30', '企业基本信息记录其他标识信息段企业身份标识类型为组织机构代码', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_EAB_ID_SGMT', 'E_ID', '企业基本信息记录其他标识信息段企业身份标识类型插入顺序', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('field_OTH_ENT_CERT_TYPE', 'OTH_ENT_CERT_TYPE', '企业基本信息记录其他标识信息段企业身份标识类型插入顺序', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('rpt_date_code', '10', '首次新增上报时企业基本信息基本必须报送基础段、基本概况段、主要组成人员段、联系方式段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('eac_fcs_inf_sgmt', 'E_FCS_INF', '首次新增上报时企业基本信息基本必须报送基础段、基本概况段、主要组成人员段、联系方式段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ead_mn_mmb_inf_sgmt', 'E_MN_MMB_INF', '首次新增上报时企业基本信息基本必须报送基础段、基本概况段、主要组成人员段、联系方式段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('eah_cota_inf_sgmt', 'E_COTA_INF', '首次新增上报时企业基本信息基本必须报送基础段、基本概况段、主要组成人员段、联系方式段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m10_01', '负债合计', '负债和所有者权益总计=负债合计+少数股东权益+所有者权益合计', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m11_01', '少数股东权益', '负债和所有者权益总计=负债合计+少数股东权益+所有者权益合计', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m12_01', '所有者权益合计', '负债和所有者权益总计=负债合计+少数股东权益+所有者权益合计', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_CURRENT_ASSETS1_01', 'TOTALLIABILITIES', '负债和所有者权益总计=负债合计+少数股东权益+所有者权益合计', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_NON_CURRENT_ASSETS1_01', 'MINORITY_INTEREST', '负债和所有者权益总计=负债合计+少数股东权益+所有者权益合计', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_TOTAL_EQUITY1_01', 'TOTAL_EQUITY', '负债和所有者权益总计=负债合计+少数股东权益+所有者权益合计', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_TOTAL_LIABILITIES_AND_NET_ASSE_02', 'TOTAL_EQUITY_AND_LIABILITIES', '负债和所有者权益总计=资产总计', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m7_02', '负债和所有者权益总计', '负债和所有者权益总计=资产总计', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m8_02', '资产总计', '负债和所有者权益总计=资产总计', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m6_04', '所有者权益合计', '负债和所有者权益合计=负债合计+所有者权益合计', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_CURRENT_ASSETS_04', 'TOTAL_LIABILITIES', '负债和所有者权益合计=负债合计+所有者权益合计', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_NON_CURRENT_ASSETS_04', 'TOTAL_EQUITY', '负债和所有者权益合计=负债合计+所有者权益合计', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_TOTAL_LIABILITIES_AND_NET_ASSE_03', 'TOTAL_EQUITY_AND_LIABILITIES', '负债和所有者权益总计=资产总计', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m7_03', '资产总计', '负债和所有者权益总计=资产总计', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m8_03', '负债和所有者权益合计', '负债和所有者权益总计=资产总计', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m1_04', '经营活动产生的现金流量净额', '经营活动产生的现金流量净额＝经营活动现金流入小计－经营活动现金流出小计', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m2_04', '经营活动现金流入小计', '经营活动产生的现金流量净额＝经营活动现金流入小计－经营活动现金流出小计', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m3_04', '经营活动现金流出小计', '经营活动产生的现金流量净额＝经营活动现金流入小计－经营活动现金流出小计', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_REVENUE_04', 'TOTAL_CASH_INFLOWS_FROM_OPERAT', '经营活动产生的现金流量净额＝经营活动现金流入小计－经营活动现金流出小计', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_EXPENDITURE_04', 'TOTAL_CASH_OUTFLOWS_FROM_OPERA', '经营活动产生的现金流量净额＝经营活动现金流入小计－经营活动现金流出小计', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m1_05', '投资活动产生的现金流量净额', '投资活动产生的现金流量净额＝投资活动现金流入小计－投资活动现金流出小计', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m2_05', '投资活动现金流入小计', '投资活动产生的现金流量净额＝投资活动现金流入小计－投资活动现金流出小计', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m3_05', '投资活动现金流出小计', '投资活动产生的现金流量净额＝投资活动现金流入小计－投资活动现金流出小计', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_REVENUE_05', 'TOTAL_CASH_INFLOWS_FROM_INVEST', '投资活动产生的现金流量净额＝投资活动现金流入小计－投资活动现金流出小计', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_EXPENDITURE_05', 'TOTAL_CASH_OUTFLOWS_FROM_INVES', '投资活动产生的现金流量净额＝投资活动现金流入小计－投资活动现金流出小计', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m1_06', '筹集活动产生的现金流量净额', '筹集活动产生的现金流量净额＝筹资活动现金流入小计－筹资活动现金流出小计', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m2_06', '筹资活动现金流入小计', '筹集活动产生的现金流量净额＝筹资活动现金流入小计－筹资活动现金流出小计', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m3_06', '筹资活动现金流出小计', '筹集活动产生的现金流量净额＝筹资活动现金流入小计－筹资活动现金流出小计', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_REVENUE_06', 'TOTAL_CASH_INFLOWS_FROM_FINANC', '筹集活动产生的现金流量净额＝筹资活动现金流入小计－筹资活动现金流出小计', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_EXPENDITURE_06', 'TOTAL_CASH_OUTFLOWS_FROM_FINAN', '筹集活动产生的现金流量净额＝筹资活动现金流入小计－筹资活动现金流出小计', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_accttype1_01', 'ACCT_TYPE', '报送时点说明代码为10-新开户/首次报送，账户类型为D2,C1应包含基本信息段、还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('accttype1_01', '''D1'',''D2'',''C1''', '报送时点说明代码为10-新开户/首次报送，账户类型为D2,C1应包含基本信息段、还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_A1_pk_not_null_01', 'EDB_ACCT_BS_INF_SGMT_ID', '报送时点说明代码为10-新开户/首次报送，账户类型为D2,C1应包含基本信息段、还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_B1_pk_not_null_01', 'EDG_ACT_LBLTY_INF_SGMT_ID', '报送时点说明代码为10-新开户/首次报送，账户类型为D2,C1应包含基本信息段、还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms4_01', '10-新开户/首次报送', '报送时点说明代码为10-新开户/首次报送，账户类型为D2,C1应包含基本信息段、还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms5_01', 'D1,D2,C1', '报送时点说明代码为10-新开户/首次报送，账户类型为D2,C1应包含基本信息段、还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms6_01', '基本信息段、还款表现信息段', '报送时点说明代码为10-新开户/首次报送，账户类型为D2,C1应包含基本信息段、还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_A1_not_null_02', 'E_ACCT_BS_INF', '报送时点说明代码为20-账户关闭，账户类型为D1,D2,R1,R4,C1应包含基本信息段、还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_B1_not_null_02', 'E_ACT_LBLTY_INF', '报送时点说明代码为20-账户关闭，账户类型为D1,D2,R1,R4,C1应包含基本信息段、还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_code1_02', '''20''', '报送时点说明代码为20-账户关闭，账户类型为D1,D2,R1,R4,C1应包含基本信息段、还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_accttype1_02', 'ACCT_TYPE', '报送时点说明代码为20-账户关闭，账户类型为D1,D2,R1,R4,C1应包含基本信息段、还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('accttype1_02', '''D1'',''D2'',''R1'',''R4'',''C1''', '报送时点说明代码为20-账户关闭，账户类型为D1,D2,R1,R4,C1应包含基本信息段、还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_A1_pk_not_null_02', 'EDB_ACCT_BS_INF_SGMT_ID', '报送时点说明代码为20-账户关闭，账户类型为D1,D2,R1,R4,C1应包含基本信息段、还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_B1_pk_not_null_02', 'EDG_ACT_LBLTY_INF_SGMT_ID', '报送时点说明代码为20-账户关闭，账户类型为D1,D2,R1,R4,C1应包含基本信息段、还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms4_02', '20-账户关闭', '报送时点说明代码为20-账户关闭，账户类型为D1,D2,R1,R4,C1应包含基本信息段、还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms5_02', 'D1,D2,R1,R4,C1', '报送时点说明代码为20-账户关闭，账户类型为D1,D2,R1,R4,C1应包含基本信息段、还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms6_02', '基本信息段、还款表现信息段', '报送时点说明代码为20-账户关闭，账户类型为D1,D2,R1,R4,C1应包含基本信息段、还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_A2_not_null_01', 'E_ACCT_BS', '报送时点说明代码为10-新开户/首次报送，账户类型为D1且分次放款标识为1,2，则应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_A2_PK_01', 'EDA_ACCT_BS_SGMT_ID', '报送时点说明代码为10-新开户/首次报送，账户类型为D1且分次放款标识为1,2，则应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_B2_not_null_01', 'E_ACCT_CRED', '报送时点说明代码为10-新开户/首次报送，账户类型为D1且分次放款标识为1,2，则应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_A_null_08', 'E_ACCT_BS', '报送时点说明代码为20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含初始债权说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_A_pk_null_08', 'EDA_ACCT_BS_SGMT_ID', '报送时点说明代码为20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含初始债权说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_A_rptdatecode_not_08', 'RPT_DATE_CODE', '报送时点说明代码为20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含初始债权说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('rptdatecode_not_08', '''20'',''33'',''41'',''49''', '报送时点说明代码为20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含初始债权说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_A_accttype_not_08', 'ACCT_TYPE', '报送时点说明代码为20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含初始债权说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('accttype_not_08', '''C1''', '报送时点说明代码为20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含初始债权说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('accttype2_01', '''D1''', '报送时点说明代码为10-新开户/首次报送，账户类型为D1且分次放款标识为1,2，则应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('flag2_01', '''1'',''2''', '报送时点说明代码为10-新开户/首次报送，账户类型为D1且分次放款标识为1,2，则应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_B2_pk_not_null_01', 'EDE_ACCT_CRED_SGMT_ID', '报送时点说明代码为10-新开户/首次报送，账户类型为D1且分次放款标识为1,2，则应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms7_01', '10-新开户/首次报送', '报送时点说明代码为10-新开户/首次报送，账户类型为D1且分次放款标识为1,2，则应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms8_01', 'D1', '报送时点说明代码为10-新开户/首次报送，账户类型为D1且分次放款标识为1,2，则应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms9_01', '1,2', '报送时点说明代码为10-新开户/首次报送，账户类型为D1且分次放款标识为1,2，则应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms10_01', '授信额度信息段', '报送时点说明代码为10-新开户/首次报送，账户类型为D1且分次放款标识为1,2，则应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_A3_not_null_01', 'E_ACCT_BS_INF', '报送时点说明代码为10-新开户/首次报送，账户类型为R1,R4应包含基本信息段、授信额度信息段、还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_B3_not_null_01', 'E_ACCT_CRED', '报送时点说明代码为10-新开户/首次报送，账户类型为R1,R4应包含基本信息段、授信额度信息段、还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_C3_not_null_01', 'E_ACT_LBLTY_INF', '报送时点说明代码为10-新开户/首次报送，账户类型为R1,R4应包含基本信息段、授信额度信息段、还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_code3_01', '''10''', '报送时点说明代码为10-新开户/首次报送，账户类型为R1,R4应包含基本信息段、授信额度信息段、还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_accttype3_01', 'ACCT_TYPE', '报送时点说明代码为10-新开户/首次报送，账户类型为R1,R4应包含基本信息段、授信额度信息段、还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('accttype3_01', '''R1'',''R4''', '报送时点说明代码为10-新开户/首次报送，账户类型为R1,R4应包含基本信息段、授信额度信息段、还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_A3_PK_not_null_01', 'EDB_ACCT_BS_INF_SGMT_ID', '报送时点说明代码为10-新开户/首次报送，账户类型为R1,R4应包含基本信息段、授信额度信息段、还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_B3_PK_not_null_01', 'EDE_ACCT_CRED_SGMT_ID', '报送时点说明代码为10-新开户/首次报送，账户类型为R1,R4应包含基本信息段、授信额度信息段、还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_C3_PK_not_null_01', 'EDG_ACT_LBLTY_INF_SGMT_ID', '报送时点说明代码为10-新开户/首次报送，账户类型为R1,R4应包含基本信息段、授信额度信息段、还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms11_01', '10-新开户/首次报送', '报送时点说明代码为10-新开户/首次报送，账户类型为R1,R4应包含基本信息段、授信额度信息段、还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms12_01', 'R1,R4', '报送时点说明代码为10-新开户/首次报送，账户类型为R1,R4应包含基本信息段、授信额度信息段、还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms13_01', '基本信息段、授信额度信息段、还款表现信息段', '报送时点说明代码为10-新开户/首次报送，账户类型为R1,R4应包含基本信息段、授信额度信息段、还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_code4_01', '''31''', '账户类型为R1、R4、C1，不适用31-开户后放款的报送时点', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_accttype4_01', 'ACCT_TYPE', '账户类型为R1、R4、C1，不适用31-开户后放款的报送时点', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('accttype4_01', '''D2'',''R1'',''R4'',''C1''', '账户类型为R1、R4、C1，不适用31-开户后放款的报送时点', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms14_01', 'D2、R1、R4、C1', '账户类型为R1、R4、C1，不适用31-开户后放款的报送时点', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms15_01', '31-开户后放款', '账户类型为R1、R4、C1，不适用31-开户后放款的报送时点', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_A_not_null_01', 'E_ACT_LBLTY_INF', '报送时点说明代码为20-账户关闭，账户类型为D1,D2,R1,R4,C1应包含还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_code_01', '20', '报送时点说明代码为20-账户关闭，账户类型为D1,D2,R1,R4,C1应包含还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_accttype_01', 'ACCT_TYPE', '报送时点说明代码为20-账户关闭，账户类型为D1,D2,R1,R4,C1应包含还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('accttype_01', '''D1'',''D2'',''R4'',''R1'',''C1''', '报送时点说明代码为20-账户关闭，账户类型为D1,D2,R1,R4,C1应包含还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_A_pk_01', 'EDG_ACT_LBLTY_INF_SGMT_ID', '报送时点说明代码为20-账户关闭，账户类型为D1,D2,R1,R4,C1应包含还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms1_01', '20-账户关闭', '报送时点说明代码为20-账户关闭，账户类型为D1,D2,R1,R4,C1应包含还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms2_01', 'D1,D2,R1,R4,C1', '报送时点说明代码为20-账户关闭，账户类型为D1,D2,R1,R4,C1应包含还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms3_01', '还款表现信息段', '报送时点说明代码为20-账户关闭，账户类型为D1,D2,R1,R4,C1应包含还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_A_not_null_02', 'E_ACT_LBLTY_INF', '报送时点说明代码为32-约定还款日结算，账户类型为D1,D2,R4应包含还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_code_02', '32', '报送时点说明代码为32-约定还款日结算，账户类型为D1,D2,R4应包含还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_accttype_02', 'ACCT_TYPE', '报送时点说明代码为32-约定还款日结算，账户类型为D1,D2,R4应包含还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('accttype_02', '''D1'',''D2'',''R4''', '报送时点说明代码为32-约定还款日结算，账户类型为D1,D2,R4应包含还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_A_pk_02', 'EDG_ACT_LBLTY_INF_SGMT_ID', '报送时点说明代码为32-约定还款日结算，账户类型为D1,D2,R4应包含还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms1_02', '32-约定还款日结算', '报送时点说明代码为32-约定还款日结算，账户类型为D1,D2,R4应包含还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms2_02', 'D1,D2,R4', '报送时点说明代码为32-约定还款日结算，账户类型为D1,D2,R4应包含还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms3_02', '还款表现信息段', '报送时点说明代码为32-约定还款日结算，账户类型为D1,D2,R4应包含还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_code4_02', '32', '账户类型为R1、C1不适用32-约定还款日结算的报送时点', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_accttype4_02', 'ACCT_TYPE', '账户类型为R1、C1不适用32-约定还款日结算的报送时点', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('accttype4_02', '''R1'',''C1''', '账户类型为R1、C1不适用32-约定还款日结算的报送时点', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms14_02', 'R1、C1', '账户类型为R1、C1不适用32-约定还款日结算的报送时点', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms15_02', '32-约定还款日结算', '账户类型为R1、C1不适用32-约定还款日结算的报送时点', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_A_not_null_03', 'E_ACT_LBLTY_INF', '报送时点说明代码为33-实际还款，账户类型为D1,D2,R4,C1应包含还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_code_03', '33', '报送时点说明代码为33-实际还款，账户类型为D1,D2,R4,C1应包含还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_accttype_03', 'ACCT_TYPE', '报送时点说明代码为33-实际还款，账户类型为D1,D2,R4,C1应包含还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_INF_REC_TYPE1_01', 'INF_REC_TYPE', '借贷待更正业务标识码必须在库中存在', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_A_pk_null_09', 'EDA_ACCT_BS_SGMT_ID', '报送时点说明代码为20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含相关还款责任人段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_A_rptdatecode_not_09', 'RPT_DATE_CODE', '报送时点说明代码为20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含相关还款责任人段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('rptdatecode_not_09', '''20'',''33'',''41'',''49''', '报送时点说明代码为20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含相关还款责任人段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_A_accttype_not_09', 'ACCT_TYPE', '报送时点说明代码为20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含相关还款责任人段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('accttype_not_09', '''C1''', '报送时点说明代码为20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含相关还款责任人段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms16_09', '20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日', '报送时点说明代码为20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含相关还款责任人段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('accttype4_03', '''R1''', '账户类型为R1不适用33-实际还款的报送时点', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms14_03', 'R1', '账户类型为R1不适用33-实际还款的报送时点', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms15_03', '33-实际还款', '账户类型为R1不适用33-实际还款的报送时点', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_A_not_null_04', 'E_ACT_LBLTY_INF', '报送时点说明代码为41-五级分类调整，账户类型为D1,D2,R4,C1应包含还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_code_04', '41', '报送时点说明代码为41-五级分类调整，账户类型为D1,D2,R4,C1应包含还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('accttype_not_05', '''D2''', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为D2不应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms16_05', '10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,49-其他报送日', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为D2不应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms17_05', 'D2', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为D2不应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms18_05', '授信额度信息段', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为D2不应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_A_null_06', 'E_ACCT_BS', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含抵质押物信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_A_pk_null_06', 'EDA_ACCT_BS_SGMT_ID', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含抵质押物信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_A_rptdatecode_not_06', 'RPT_DATE_CODE', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含抵质押物信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('rptdatecode_not_06', '''10'',''20'',''33'',''41'',''49''', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含抵质押物信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_A_accttype_not_06', 'ACCT_TYPE', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含抵质押物信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('accttype_not_06', '''C1''', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含抵质押物信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms16_06', '10-新开户/首次报送,20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含抵质押物信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms17_06', 'C1', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含抵质押物信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms18_06', '抵质押物信息段', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含抵质押物信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('accttype_not_01', '''D1'',''R1'',''R4''', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算，49-其他报送日且账户类型为D1,R1,R4不应包含初始债权说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms16_01', '10-新开户/首次报送,20-账户关闭,32-约定还款日结算，49-其他报送日', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算，49-其他报送日且账户类型为D1,R1,R4不应包含初始债权说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms17_01', 'D1,R1,R4', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算，49-其他报送日且账户类型为D1,R1,R4不应包含初始债权说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms18_01', '初始债权说明段', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算，49-其他报送日且账户类型为D1,R1,R4不应包含初始债权说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_A_null_02', 'E_ACCT_BS', '报送时点说明代码为33-实际还款,42-展期发生且账户类型为D1,R4不应包含初始债权说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_A_pk_null_02', 'EDA_ACCT_BS_SGMT_ID', '报送时点说明代码为33-实际还款,42-展期发生且账户类型为D1,R4不应包含初始债权说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_A_rptdatecode_not_02', 'RPT_DATE_CODE', '报送时点说明代码为33-实际还款,42-展期发生且账户类型为D1,R4不应包含初始债权说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('rptdatecode_not_02', '''33'',''42''', '报送时点说明代码为33-实际还款,42-展期发生且账户类型为D1,R4不应包含初始债权说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_A_accttype_not_02', 'ACCT_TYPE', '报送时点说明代码为33-实际还款,42-展期发生且账户类型为D1,R4不应包含初始债权说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('NUM_21', '21', '数值：21', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ACCT_BAL_Column', 'ACCT_BAL', '余额', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('TOT_OVERD_Column', 'TOT_OVERD', '当前逾期总额', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('OVERD_PRINC_Column', 'OVERD_PRINC', '当前逾期本金', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms16_02', '33-实际还款,42-展期发生', '报送时点说明代码为33-实际还款,42-展期发生且账户类型为D1,R4不应包含初始债权说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms17_02', 'D1,R4', '报送时点说明代码为33-实际还款,42-展期发生且账户类型为D1,R4不应包含初始债权说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms18_02', '初始债权说明段', '报送时点说明代码为33-实际还款,42-展期发生且账户类型为D1,R4不应包含初始债权说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_A_null_03', 'E_ACCT_BS', '报送时点说明代码为41-五级分类调整且账户类型为R1不应包含初始债权说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_A_pk_null_03', 'EDA_ACCT_BS_SGMT_ID', '报送时点说明代码为41-五级分类调整且账户类型为R1不应包含初始债权说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_A_rptdatecode_not_03', 'RPT_DATE_CODE', '报送时点说明代码为41-五级分类调整且账户类型为R1不应包含初始债权说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('rptdatecode_not_03', '41', '报送时点说明代码为41-五级分类调整且账户类型为R1不应包含初始债权说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_A_accttype_not_03', 'ACCT_TYPE', '报送时点说明代码为41-五级分类调整且账户类型为R1不应包含初始债权说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('accttype_not_03', '''R1''', '报送时点说明代码为41-五级分类调整且账户类型为R1不应包含初始债权说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms16_03', '41-五级分类调整', '报送时点说明代码为41-五级分类调整且账户类型为R1不应包含初始债权说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms17_03', 'R1', '报送时点说明代码为41-五级分类调整且账户类型为R1不应包含初始债权说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms18_03', '初始债权说明段', '报送时点说明代码为41-五级分类调整且账户类型为R1不应包含初始债权说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('inf_rec_type5_01', '410', '借贷待更正记录基础段的“账户类型”应与库中“账户类型”一致', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('inf_rec_type6_01', '412', '借贷待更正记录基础段的“账户类型”应与库中“账户类型”一致', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_pk_SGMT_ID3_01', 'EDA_ACCT_BS_SGMT_ID', '借贷更正相关还款责任人段时，责任人两标与借款人两标不能相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_BS_SGMT3_01', 'E_ACCT_BS', '借贷更正相关还款责任人段时，责任人两标与借款人两标不能相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('inf_rec_type7_01', '410', '借贷更正相关还款责任人段时，责任人两标与借款人两标不能相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('mdfc_sgmt_code_01', 'D', '借贷更正相关还款责任人段时，责任人两标与借款人两标不能相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_CERT_TYPE_01', 'ARLP_CERT_TYPE', '借贷更正相关还款责任人段时，责任人两标与借款人两标不能相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_ACCT_CODE1_01', 'ACCT_CODE', '借贷更正相关还款责任人段时，责任人两标与借款人两标不能相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m24_01', '责任人两标', '借贷更正相关还款责任人段时，责任人两标与借款人两标不能相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_DEL_START_DATE_03', 'DEL_START_DATE', '借贷待删除起始日期必须小于等于待删除结束日期', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m19_03', '待删除起始日期', '借贷待删除起始日期必须小于等于待删除结束日期', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m20_03', '待删除结束日期', '借贷待删除起始日期必须小于等于待删除结束日期', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m21_03', '小于等于', '借贷待删除起始日期必须小于等于待删除结束日期', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_ENT_CERT_TYPE_01', 'ENT_CERT_TYPE', '两组企业身份标识类型企业身份标识号码不能完全相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_ASSO_ENT_CERT_TYPE_01', 'ASSO_ENT_CERT_TYPE', '两组企业身份标识类型企业身份标识号码不能完全相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_ENT_CERT_NUM_01', 'ENT_CERT_NUM', '两组企业身份标识类型企业身份标识号码不能完全相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('sheet_type_01', '10', '报表类型必须填写10', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('sheet_type_02', '10', '报表类型必须填写10', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m1_01', '本期财政补助结转结余', '本期财政补助结转结余值不正确', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m2_01', '财政补助收入', '本期财政补助结转结余值不正确', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m3_01', '事业支出（财政补助支出）', '本期财政补助结转结余值不正确', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_REVENUE_01', 'FINANCIAL_SUBSIDY_REVENUE', '本期财政补助结转结余值不正确', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_EXPENDITURE_01', 'UNDERTAKINGS_EXPENDITURE_FINAN', '本期财政补助结转结余值不正确', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m1_02', '本期事业结转结余', '本期事业结转结余值不正确', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m2_02', '事业类收入', '本期事业结转结余值不正确', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m3_02', '事业类支出', '本期事业结转结余值不正确', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_REVENUE_02', 'UNDERTAKINGS_CLASS_REVENUE', '本期事业结转结余值不正确', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m25_01', '借款人两标', '借贷更正相关还款责任人段时，责任人两标与借款人两标不能相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_DEL_END_DATE_03', 'DEL_END_DATE', '借贷待删除起始日期,待删除的终止日期不能同时为空值', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_EXPENDITURE_02', 'UNDERTAKINGS_CLASS_EXPENDITURE', '本期事业结转结余值不正确', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m1_03', '本期经营结余', '本期经营结余值不正确', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m2_03', '经营收入', '本期经营结余值不正确', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m3_03', '经营支出', '本期经营结余值不正确', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_REVENUE_03', 'OPERATING_REVENUE', '本期经营结余值不正确', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_EXPENDITURE_03', 'OPERATING_EXPENDITURE', '本期经营结余值不正确', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m4_01', '资产总计', '资产总计值不正确', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m5_01', '流动资产合计', '资产总计值不正确', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m6_01', '非流动资产合计', '资产总计值不正确', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_CURRENT_ASSETS_01', 'TOTAL_CURRENT_ASSETS', '资产总计值不正确', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_NON_CURRENT_ASSETS_01', 'TOTAL_NON_CURRENT_ASSETS', '资产总计值不正确', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m4_02', '负债合计', '负债合计值不正确', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m5_02', '流动负债合计', '负债合计值不正确', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m6_02', '非流动负债合计', '负债合计值不正确', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_CURRENT_ASSETS_02', 'TOTAL_CURRENT_LIABILITIES', '负债合计值不正确', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_NON_CURRENT_ASSETS_02', 'TOTAL_NON_CURRENT_LIABILITIES', '负债合计值不正确', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m4_03', '负债和净资产总计', '负债和净资产总计值不正确', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m5_03', '负债合计', '负债和净资产总计值不正确', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m6_03', '净资产合计', '负债和净资产总计值不正确', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_CURRENT_ASSETS_03', 'TOTAL_LIABILITIES', '负债和净资产总计值不正确', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_NON_CURRENT_ASSETS_03', 'TOTAL_NET_ASSETS', '负债和净资产总计值不正确', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_TOTAL_LIABILITIES_AND_NET_ASSE_01', 'TOTAL_LIABILITIES_AND_NET_ASSE', '资产总计=负债和净资产总计', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m7_01', '资产总计', '资产总计=负债和净资产总计', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m8_01', '负债和净资产总计', '资产总计=负债和净资产总计', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m9_01', '负债和所有者权益总计', '负债和所有者权益总计=负债合计+少数股东权益+所有者权益合计', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_EDA_12', 'I_GUAR_ACCT_BS', '个人担保协议待删除的业务标识码必须在库中存在', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_DEL_END_DATE_12', 'DEL_END_DATE', '个人担保待删除起始日期,待删除的终止日期不能同时为空值', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_DEL_START_DATE_12', 'DEL_START_DATE', '个人担保待删除起始日期必须小于等于待删除的结束日期', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m19_12', '待删除起始日期', '个人担保待删除起始日期必须小于等于待删除的结束日期', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m21_12', '小于等于', '个人担保待删除起始日期必须小于等于待删除的结束日期', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m20_12', '待删除的结束', '个人担保待删除起始日期必须小于等于待删除的结束日期', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_ACCT_CODE_13', 'ACCT_CODE', '个人借贷待删除的业务标识码必须在库中存在', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_EDA_13', 'I_ACCT_BS', '个人借贷待删除的业务标识码必须在库中存在', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('RPT_DATE_CODE_10_1', '10', '“报告时点说明代码”为“10-新开户/首次上报”', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('EEB_GUAR_ACCT_BS_INF_SGMT_Table', 'E_GUAR_ACCT_BS_INF', '企业担保账户基本信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('EEF_GUAR_RLT_REPYMT_INF_SGMT_Table', 'E_GUAR_INSURANCE_INF', '企业担保账户在保责任信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('RPT_DATE_CODE_20_1', '20', '“报告时点说明代码”为“20-账户关闭”', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('RPT_DATE_CODE_30_1', '30', '“报告时点说明代码”为“30-在保责任变化”', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('RPT_DATE_CODE_50_1', '50', '“报告时点说明代码”为“50-其他信息变化”', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('RPT_DATE_CODE_40_1', '40', '“报告时点说明代码”为“40-五级分类调整”', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('GUAR_MODE_1_1', '1', '“反担保方式”为“1-保证”', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('EEC_RLT_REPYMT_INF_SGMT_Table', 'E_SEC_RLT_REPYMT_INF', '企业担保账户相关还款责任人段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('GUAR_MODE_Column', 'GUAR_MODE', '反担保方式', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('DUE_DATE_Column', 'DUE_DATE', '到期日期', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name2_E_1015', 'I_SPEC_PRD', '当报告时点说明代码为10-新开户时：若账户类型为D1/R1/R3/R4，不应包含初始债权说明段、非月度表现信息段、特殊交易说明段、大额专项分期信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_A_rptdatecode_not_07', 'RPT_DATE_CODE', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('rptdatecode_not_07', '''10'',''20'',''33'',''41'',''49''', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_A_accttype_not_07', 'ACCT_TYPE', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('accttype_not_07', '''C1''', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms16_07', '10-新开户/首次报送,20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms17_07', 'C1', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms18_07', '授信额度信息段', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field2_a1_0003', 'SPO_NAME', '若婚姻状况为20-已婚、21-初婚、22-再婚、24-复婚时，配偶姓名、配偶证件类型、配偶证件号码、配偶联系电话、配偶工作单位必须出现；若婚姻状况为上述以外的代码，上述数据项不能出现。', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field2_a2_0003', 'SPO_ID_TYPE', '若婚姻状况为20-已婚、21-初婚、22-再婚、25-复婚时，配偶姓名、配偶证件类型、配偶证件号码、配偶联系电话、配偶工作单位必须出现；若婚姻状况为上述以外的代码，上述数据项不能出现。', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('accttype_03', '''D1'',''D2'',''R4'',''C1''', '报送时点说明代码为33-实际还款，账户类型为D1,D2,R4,C1应包含还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field2_a3_0003', 'SPO_ID_NUM', '若婚姻状况为20-已婚、21-初婚、22-再婚、26-复婚时，配偶姓名、配偶证件类型、配偶证件号码、配偶联系电话、配偶工作单位必须出现；若婚姻状况为上述以外的代码，上述数据项不能出现。', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field2_a4_0003', 'SPO_TEL', '若婚姻状况为20-已婚、21-初婚、22-再婚、27-复婚时，配偶姓名、配偶证件类型、配偶证件号码、配偶联系电话、配偶工作单位必须出现；若婚姻状况为上述以外的代码，上述数据项不能出现。', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field2_a5_0003', 'SPS_CMPY_NM', '若婚姻状况为20-已婚、21-初婚、22-再婚、28-复婚时，配偶姓名、配偶证件类型、配偶证件号码、配偶联系电话、配偶工作单位必须出现；若婚姻状况为上述以外的代码，上述数据项不能出现。', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field3_a1_0004', 'FCS_INFO_UP_DATE', '出生日期应不晚于信息更新日期', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field4_a1_0005', 'SPO_ID_NUM', '配偶证件类型、配偶证件号码其中之一不为空时，另一个应不为空', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field5_a1_0006', 'ACA_DEGREE', '当学历为30-大专、40-中专、职高、技校、70-初中、80-小学时，学位只能为5-无或9-未知', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms16_08', '20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日', '报送时点说明代码为20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含初始债权说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms17_08', 'C1', '报送时点说明代码为20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含初始债权说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms18_08', '初始债权说明段', '报送时点说明代码为20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含初始债权说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_A_null_09', 'E_ACCT_BS', '报送时点说明代码为20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含相关还款责任人段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_ACCT_STATUS_05', 'ACCT_STATUS', '个人担保标识变更原业务标识码必须是库中已有且正在使用的', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('acct_status_05', '2', '个人担保标识变更原业务标识码必须是库中已有且正在使用的', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_ACCT_CODe1_05', 'ACCT_CODE', '个人担保标识变更原业务标识码必须是库中已有且正在使用的', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_BS_SGMT2_05', 'I_GUAR_ACCT_BS', '个人担保标识变更新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_LBLTY_INF_SGMT2_05', 'I_GR_REPYMT_INF', '个人担保标识变更新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_pk_BS_SGMT_ID2_05', 'PDA_GUAR_ACCT_BS_SGMT_ID', '个人担保标识变更新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_ACCT_STATUS2_05', 'ACCT_STATUS', '个人担保标识变更新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('acct_status2_05', '2', '个人担保标识变更新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_ACCT_CODe2_05', 'ACCT_CODE', '个人担保标识变更新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_BS_SGMT_07', 'I_CTRCT_BS', '个人授信标识变更原业务标识码必须是库中已有且正在使用的', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_LBLTY_INF_SGMT_06', 'I_CREDIT_LIM', '个人授信标识变更原业务标识码必须是库中已有且正在使用的', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_pk_BS_SGMT_ID_06', 'PCA_CTRCT_BS_SGMT_ID', '个人授信标识变更原业务标识码必须是库中已有且正在使用的', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_ACCT_STATUS_06', 'CON_STATUS', '个人授信标识变更原业务标识码必须是库中已有且正在使用的', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('acct_status_06', '2', '个人授信标识变更原业务标识码必须是库中已有且正在使用的', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_ACCT_CODe1_06', 'CONTRACT_CODE', '个人授信标识变更原业务标识码必须是库中已有且正在使用的', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_BS_SGMT2_06', 'I_CTRCT_BS', '个人授信标识变更新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_LBLTY_INF_SGMT2_06', 'I_CREDIT_LIM', '个人授信标识变更新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_pk_BS_SGMT_ID2_06', 'PCA_CTRCT_BS_SGMT_ID', '个人授信标识变更新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_ACCT_STATUS2_06', 'CON_STATUS', '个人授信标识变更新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('acct_status2_06', '2', '个人授信标识变更新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_ACCT_CODe2_06', 'CONTRACT_CODE', '个人授信标识变更新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_ACCT_CODE_11', 'CONTRACT_CODE', '个人授信按段删除待删除的业务标识码必须在库中存在', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_EDA_11', 'I_CTRCT_BS', '个人授信按段删除待删除的业务标识码必须在库中存在', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_DEL_END_DATE_11', 'DEL_END_DATE', '个人授信待删除起始日期,待删除的终止日期不能同时为空值', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_DEL_START_DATE_11', 'DEL_START_DATE', '个人授信待删除起始日期必须小于等于待删除的结束日期', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m19_11', '待删除起始日期', '个人授信待删除起始日期必须小于等于待删除的结束日期', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m21_11', '小于等于', '个人授信待删除起始日期必须小于等于待删除的结束日期', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m20_11', '待删除的结束', '个人授信待删除起始日期必须小于等于待删除的结束日期', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_ACCT_CODE_12', 'ACCT_CODE', '个人担保协议待删除的业务标识码必须在库中存在', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms19_01', '10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,42-展期发生,49-其他报送', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,42-展期发生,49-其他报送日账户类型为D1且分次放款标识为0，则不应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms20_01', 'D1', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,42-展期发生,49-其他报送日账户类型为D1且分次放款标识为0，则不应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms21_01', '分次放款标识为0', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,42-展期发生,49-其他报送日账户类型为D1且分次放款标识为0，则不应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms22_01', '授信额度信息段', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,42-展期发生,49-其他报送日账户类型为D1且分次放款标识为0，则不应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_A2_null_02', 'E_ACCT_BS', '报送时点说明代码为31-开户后放款账户类型为D1且分次放款标识为2，则不应包含初始债权说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_B2_null_02', 'E_ACCT_BS_INF', '报送时点说明代码为31-开户后放款账户类型为D1且分次放款标识为2，则不应包含初始债权说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_A2_rptdatecode_not_02', 'RPT_DATE_CODE', '报送时点说明代码为31-开户后放款账户类型为D1且分次放款标识为2，则不应包含初始债权说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('rptdatecode_not2_02', '31', '报送时点说明代码为31-开户后放款账户类型为D1且分次放款标识为2，则不应包含初始债权说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_B2_flag_not_02', 'FLAG', '报送时点说明代码为31-开户后放款账户类型为D1且分次放款标识为2，则不应包含初始债权说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('flag_not2_02', '2', '报送时点说明代码为31-开户后放款账户类型为D1且分次放款标识为2，则不应包含初始债权说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_A2_accttype_not_02', 'ACCT_TYPE', '报送时点说明代码为31-开户后放款账户类型为D1且分次放款标识为2，则不应包含初始债权说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('accttype_not2_02', '''D1''', '报送时点说明代码为31-开户后放款账户类型为D1且分次放款标识为2，则不应包含初始债权说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms19_02', '31-开户后放款', '报送时点说明代码为31-开户后放款账户类型为D1且分次放款标识为2，则不应包含初始债权说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms20_02', 'D1', '报送时点说明代码为31-开户后放款账户类型为D1且分次放款标识为2，则不应包含初始债权说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms21_02', '分次放款标识为2', '报送时点说明代码为31-开户后放款账户类型为D1且分次放款标识为2，则不应包含初始债权说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms22_02', '初始债权说明段', '报送时点说明代码为31-开户后放款账户类型为D1且分次放款标识为2，则不应包含初始债权说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_A5_not_null_01', 'E_ACCT_BS', '账户类型为D1，分次放款标识为0、1则不适用31-开户后放款', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_A5_PK_01', 'EDA_ACCT_BS_SGMT_ID', '账户类型为D1，分次放款标识为0、1则不适用31-开户后放款', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_A5_code5_01', 'RPT_DATE_CODE', '账户类型为D1，分次放款标识为0、1则不适用31-开户后放款', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_code5_01', '''31''', '账户类型为D1，分次放款标识为0、1则不适用31-开户后放款', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_accttype5_01', 'ACCT_TYPE', '账户类型为D1，分次放款标识为0、1则不适用31-开户后放款', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('accttype5_01', '''D1''', '账户类型为D1，分次放款标识为0、1则不适用31-开户后放款', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('flag5_01', '''0'',''1''', '账户类型为D1，分次放款标识为0、1则不适用31-开户后放款', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_ACCT_CODE_08', 'ACCT_CODE', '对于个人借贷账户整笔删除请求记录，待删除业务标识码必须在库中存在', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_EDA_08', 'I_ACCT_BS', '对于个人借贷账户整笔删除请求记录，待删除业务标识码必须在库中存在', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms10_field1_1018', '当报告时点说明代码为10-新开户时，若账户类型为R2，不应包含初始债权说明段、非月度表现信息段、特殊交易说明段', '当报告时点说明代码为10-新开户时，若账户类型为R2，不应包含初始债权说明段、非月度表现信息段、特殊交易说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name2_B_1019', 'I_OC_INF', '当报告时点说明代码为30-月度结算,31-月结日首次上报存量账户,32-月结日账户关闭时：若账户类型为D1/R1/R3/R4，不应包含初始债权说明段、非月度表现信息段、大额专项分期信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name2_C_1019', 'I_ACCT_DBT_INF', '当报告时点说明代码为30-月度结算,31-月结日首次上报存量账户,32-月结日账户关闭时：若账户类型为D1/R1/R3/R4，不应包含初始债权说明段、非月度表现信息段、大额专项分期信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name2_D_1019', 'I_SPEC_PRD', '当报告时点说明代码为30-月度结算,31-月结日首次上报存量账户,32-月结日账户关闭时：若账户类型为D1/R1/R3/R4，不应包含初始债权说明段、非月度表现信息段、大额专项分期信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field_type1_1019', 'ACCT_TYPE', '当报告时点说明代码为30-月度结算,31-月结日首次上报存量账户,32-月结日账户关闭时：若账户类型为D1/R1/R3/R4，不应包含初始债权说明段、非月度表现信息段、大额专项分期信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field1_1019', '''D1'',''R1'',''R3'',''R4''', '当报告时点说明代码为30-月度结算,31-月结日首次上报存量账户,32-月结日账户关闭时：若账户类型为D1/R1/R3/R4，不应包含初始债权说明段、非月度表现信息段、大额专项分期信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field2_1019', '''31'',''30'',''20'',''32''', '当报告时点说明代码为20-账户关闭,30-月度结算,31-月结日首次上报存量账户,32-月结日账户关闭时：若账户类型为D1/R1/R3/R4，不应包含初始债权说明段、非月度表现信息段、大额专项分期信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms10_field1_1019', '当报告时点说明代码为20-账户关闭,30-月度结算,31-月结日首次上报存量账户,32-月结日账户关闭时：若账户类型为D1/R1/R3/R4，不应包含初始债权说明段、非月度表现信息段、大额专项分期信息段', '当报告时点说明代码为20-账户关闭,30-月度结算,31-月结日首次上报存量账户,32-月结日账户关闭时：若账户类型为D1/R1/R3/R4，不应包含初始债权说明段、非月度表现信息段、大额专项分期信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name2_B_1020', 'I_OC_INF', '当报告时点说明代码为31-月结日首次上报存量账户,20-账户关闭,32-月结日账户关闭,若账户类型为R2，不应包含初始债权说明段、非月度表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name2_C_1020', 'I_ACCT_DBT_INF', '当报告时点说明代码为31-月结日首次上报存量账户,20-账户关闭,32-月结日账户关闭,若账户类型为R2，不应包含初始债权说明段、非月度表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field_type1_1020', 'ACCT_TYPE', '当报告时点说明代码为31-月结日首次上报存量账户,20-账户关闭,32-月结日账户关闭,若账户类型为R2，不应包含初始债权说明段、非月度表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_A_pk_03', 'EDG_ACT_LBLTY_INF_SGMT_ID', '报送时点说明代码为33-实际还款，账户类型为D1,D2,R4,C1应包含还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms1_03', '33-实际还款', '报送时点说明代码为33-实际还款，账户类型为D1,D2,R4,C1应包含还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms2_03', 'D1,D2,R4,C1', '报送时点说明代码为33-实际还款，账户类型为D1,D2,R4,C1应包含还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms3_03', '还款表现信息段', '报送时点说明代码为33-实际还款，账户类型为D1,D2,R4,C1应包含还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_code4_03', '33', '账户类型为R1不适用33-实际还款的报送时点', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_accttype4_03', 'ACCT_TYPE', '账户类型为R1不适用33-实际还款的报送时点', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('accttype_not_04', '''D2''', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为D2,C1不应包含抵质押物信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms16_04', '10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,49-其他报送日', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为D2,C1不应包含抵质押物信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms17_04', 'D2', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为D2,C1不应包含抵质押物信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms18_04', '抵质押物信息段', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为D2,C1不应包含抵质押物信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_A_null_05', 'E_ACCT_BS', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为D2不应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_A_pk_null_05', 'EDA_ACCT_BS_SGMT_ID', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为D2不应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_A_rptdatecode_not_05', 'RPT_DATE_CODE', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为D2不应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('rptdatecode_not_05', '''10'',''20'',''32'',''33'',''41'',''49''', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为D2不应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_A_accttype_not_05', 'ACCT_TYPE', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为D2不应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('b1_field1_1007', 'BUSI_DTL_LINES', '当报告时点说明代码为10-新开户时，至少包含基本信息段：若账户类型为R2，还应包含月度表现段。如果基本信息段中的借贷业务种类细分不是大额专项分期卡，还应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('lines_1007', '''82''', '当报告时点说明代码为10-新开户时，至少包含基本信息段：若账户类型为R2，还应包含月度表现段。如果基本信息段中的借贷业务种类细分不是大额专项分期卡，还应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms3_field1_1007', '10-新开户时、31-月结日首次上报存量账户', '当报告时点说明代码为10-新开户时，至少包含基本信息段：若账户类型为R2，还应包含月度表现段。如果基本信息段中的借贷业务种类细分不是大额专项分期卡，还应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms3_field2_1007', '基本信息段', '当报告时点说明代码为10-新开户时，至少包含基本信息段：若账户类型为R2，还应包含月度表现段。如果基本信息段中的借贷业务种类细分不是大额专项分期卡，还应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms3_field3_1007', 'R2', '当报告时点说明代码为10-新开户时，至少包含基本信息段：若账户类型为R2，还应包含月度表现段。如果基本信息段中的借贷业务种类细分不是大额专项分期卡，还应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms3_field4_1007', '月度表现段', '当报告时点说明代码为10-新开户时，至少包含基本信息段：若账户类型为R2，还应包含月度表现段。如果基本信息段中的借贷业务种类细分不是大额专项分期卡，还应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms3_field5_1007', '82-大额专项分期卡', '当报告时点说明代码为10-新开户时，至少包含基本信息段：若账户类型为R2，还应包含月度表现段。如果基本信息段中的借贷业务种类细分不是大额专项分期卡，还应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms3_field6_1007', '授信额度信息段', '当报告时点说明代码为10-新开户时，至少包含基本信息段：若账户类型为R2，还应包含月度表现段。如果基本信息段中的借贷业务种类细分不是大额专项分期卡，还应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name2_B_1008', 'I_AMBLG_INF', '当报告时点说明代码为10-新开户时，除基础段外，至少包含基本信息段：若账户类型为R1/R3/R4，还应包含月度表现信息段、授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name2_C_1008', 'I_ACCT_CRED', '当报告时点说明代码为10-新开户时，除基础段外，至少包含基本信息段：若账户类型为R1/R3/R4，还应包含月度表现信息段、授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_type_1008', 'ACCT_TYPE', '当报告时点说明代码为10-新开户时，除基础段外，至少包含基本信息段：若账户类型为R1/R3/R4，还应包含月度表现信息段、授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field2_1008', '''R1'',''R3'',''R4''', '当报告时点说明代码为10-新开户时，除基础段外，至少包含基本信息段：若账户类型为R1/R3/R4，还应包含月度表现信息段、授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field1_1008', '''10'',''31''', '当报告时点说明代码为10-新开户时，除基础段外，至少包含基本信息段：若账户类型为R1/R3/R4，还应包含月度表现信息段、授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms4_field1_1008', '10-新开户时、31-月结日首次上报存量账户', '当报告时点说明代码为10-新开户时，除基础段外，至少包含基本信息段：若账户类型为R1/R3/R4，还应包含月度表现信息段、授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms4_field2_1008', '基本信息段', '当报告时点说明代码为10-新开户时，除基础段外，至少包含基本信息段：若账户类型为R1/R3/R4，还应包含月度表现信息段、授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms4_field3_1008', 'R1/R3/R4', '当报告时点说明代码为10-新开户时，除基础段外，至少包含基本信息段：若账户类型为R1/R3/R4，还应包含月度表现信息段、授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms4_field4_1008', '月度表现信息段、授信额度信息段', '当报告时点说明代码为10-新开户时，除基础段外，至少包含基本信息段：若账户类型为R1/R3/R4，还应包含月度表现信息段、授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name2_B_1009', 'I_OC_INF', '当报告时点说明代码为10-新开户时，除基础段外，至少包含基本信息段，若账户类型为C1，还应包含初始债权说明段、非月度表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name2_C_1009', 'I_ACCT_DBT_INF', '当报告时点说明代码为10-新开户时，除基础段外，至少包含基本信息段，若账户类型为C1，还应包含初始债权说明段、非月度表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field_type1_1015', 'ACCT_TYPE', '当报告时点说明代码为10-新开户时：若账户类型为D1/R1/R3/R4，不应包含初始债权说明段、非月度表现信息段、特殊交易说明段、大额专项分期信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field1_1015', '''D1'',''R1'',''R3'',''R4''', '当报告时点说明代码为10-新开户时：若账户类型为D1/R1/R3/R4，不应包含初始债权说明段、非月度表现信息段、特殊交易说明段、大额专项分期信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field2_1015', '''10''', '当报告时点说明代码为10-新开户时：若账户类型为D1/R1/R3/R4，不应包含初始债权说明段、非月度表现信息段、特殊交易说明段、大额专项分期信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms9_field1_1015', '当报告时点说明代码为10-新开户时：若账户类型为D1/R1/R3/R4，不应包含初始债权说明段、非月度表现信息段、特殊交易说明段、大额专项分期信息段', '当报告时点说明代码为10-新开户时：若账户类型为D1/R1/R3/R4，不应包含初始债权说明段、非月度表现信息段、特殊交易说明段、大额专项分期信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name2_B_1016', 'I_AMBLG_INF', '10-新开户,20-账户关闭时若账户类型为C1，不应包含月度表现段、大额专项分期信息段、抵质押物信息段、授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name2_C_1016', 'I_SPEC_PRD', '10-新开户,20-账户关闭时若账户类型为C1，不应包含月度表现段、大额专项分期信息段、抵质押物信息段、授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name2_D_1016', 'I_MCC_INF', '10-新开户,20-账户关闭时若账户类型为C1，不应包含月度表现段、大额专项分期信息段、抵质押物信息段、授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name2_E_1016', 'I_ACCT_CRED', '10-新开户,20-账户关闭时若账户类型为C1，不应包含月度表现段、大额专项分期信息段、抵质押物信息段、授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field_type1_1016', 'ACCT_TYPE', '10-新开户,20-账户关闭时若账户类型为C1，不应包含月度表现段、大额专项分期信息段、抵质押物信息段、授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field1_1016', '''C1''', '10-新开户,20-账户关闭时若账户类型为C1，不应包含月度表现段、大额专项分期信息段、抵质押物信息段、授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field2_1016', '''10'',''20''', '10-新开户,20-账户关闭时若账户类型为C1，不应包含月度表现段、大额专项分期信息段、抵质押物信息段、授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms9_field1_1016', '10-新开户,20-账户关闭时若账户类型为C1，不应包含月度表现段、大额专项分期信息段、抵质押物信息段、授信额度信息段', '10-新开户,20-账户关闭时若账户类型为C1，不应包含月度表现段、大额专项分期信息段、抵质押物信息段、授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name2_B_1017', 'I_OC_INF', '当报告时点说明代码为40-收回逾期款项时：若账户类型为D1/R1/R2/R4还不应包含初债权说明段、特殊交易说明段、基本信息段、相关还款责任人段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name2_C_1017', 'I_AS_TRST_DSPN', '当报告时点说明代码为40-收回逾期款项时：若账户类型为D1/R1/R2/R4还不应包含初债权说明段、特殊交易说明段、基本信息段、相关还款责任人段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name2_D_1017', 'I_ACCT_BS_INF', '当报告时点说明代码为40-收回逾期款项时：若账户类型为D1/R1/R2/R4还不应包含初债权说明段、特殊交易说明段、基本信息段、相关还款责任人段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name2_E_1017', 'I_LOAN_RLT_REPYMT_INF', '当报告时点说明代码为40-收回逾期款项时：若账户类型为D1/R1/R2/R4还不应包含初债权说明段、特殊交易说明段、基本信息段、相关还款责任人段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field_type1_1017', 'ACCT_TYPE', '当报告时点说明代码为40-收回逾期款项时：若账户类型为D1/R1/R2/R4还不应包含初债权说明段、特殊交易说明段、基本信息段、相关还款责任人段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field1_1017', '''D1'',''R1'',''R2'',''R4''', '当报告时点说明代码为40-收回逾期款项时：若账户类型为D1/R1/R2/R4还不应包含初债权说明段、特殊交易说明段、基本信息段、相关还款责任人段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field2_1017', '''40''', '当报告时点说明代码为40-收回逾期款项时：若账户类型为D1/R1/R2/R4还不应包含初债权说明段、特殊交易说明段、基本信息段、相关还款责任人段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms9_field1_1017', '当报告时点说明代码为40-收回逾期款项时：若账户类型为D1/R1/R2/R4还不应包含初债权说明段、特殊交易说明段、基本信息段、相关还款责任人段', '当报告时点说明代码为40-收回逾期款项时：若账户类型为D1/R1/R2/R4还不应包含初债权说明段、特殊交易说明段、基本信息段、相关还款责任人段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name2_B_1018', 'I_OC_INF', '当报告时点说明代码为10-新开户时，若账户类型为R2，不应包含初始债权说明段、非月度表现信息段、特殊交易说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name2_C_1018', 'I_ACCT_DBT_INF', '当报告时点说明代码为10-新开户时，若账户类型为R2，不应包含初始债权说明段、非月度表现信息段、特殊交易说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name2_D_1018', 'I_AS_TRST_DSPN', '当报告时点说明代码为10-新开户时，若账户类型为R2，不应包含初始债权说明段、非月度表现信息段、特殊交易说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field_type1_1018', 'ACCT_TYPE', '当报告时点说明代码为10-新开户时，若账户类型为R2，不应包含初始债权说明段、非月度表现信息段、特殊交易说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field1_1018', '''R2''', '当报告时点说明代码为10-新开户时，若账户类型为R2，不应包含初始债权说明段、非月度表现信息段、特殊交易说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field2_1018', '''10''', '当报告时点说明代码为10-新开户时，若账户类型为R2，不应包含初始债权说明段、非月度表现信息段、特殊交易说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field_type1_1013', 'ACCT_TYPE', '当报告时点说明代码为10-新开户,31-月结日首次上报存量账户,如果基本信息段中分次放款标志为0，还不应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ARLP_CERT_TYPE_2', '''10'',''20'',''30''', '‘身份类别为‘2-组织机构’时对应的‘责任人身份标识类型’', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_A_0009', 'I_BS', '证件类型、证件号码不能与基础段中的证件类型、证件号码完全相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_A_ID_0009', 'PAA_BS_SGMT_ID', '证件类型、证件号码不能与基础段中的证件类型、证件号码完全相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field7_a1_0009', 'ID_TYPE', '证件类型、证件号码不能与基础段中的证件类型、证件号码完全相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('OVERD_DY_Column', 'OVERD_DY', '当前逾期天数', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('NUM_0', '0', '数值：0', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ACCT_STATUS_1', '''31'',''32''', '账户状态:31-呆账（已核销）、32-呆账（进入核销认定程序，等待核销）', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ACCT_TYPE_1', '''D1'',''D2'',''R1'',''R4''', 'D1/D2/R1/R4 账户', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('LAT_RPY_AMT_Column', 'LAT_RPY_AMT', '最近一次实际还款金额', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('BAL_CHG_DATE_Column', 'BAL_CHG_DATE', '余额变化日期     ', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('LAT_RPY_DATE_Column', 'LAT_RPY_DATE', '最近一次实际还款日期', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('LAT_AGRR_RPY_DATE_Column', 'LAT_AGRR_RPY_DATE', '最近一次约定还款日', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('NXT_AGRR_RPY_DATE_Column', 'NXT_AGRR_RPY_DATE', '下一次约定还款日期', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('EDG_ACT_LBLTY_INF_SGMT_Table', 'E_ACT_LBLTY_INF', '企业借贷还款表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('NUM_11', '11', '数值：11', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('DUE_TRAN_MON_Column', 'DUE_TRAN_MON', '到期日期变更月数', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('OPEN_DATE_Column', 'OPEN_DATE', '开户日期', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('NUM_20', '21', '数值：20', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ACCT_STATUS_Column', 'ACCT_STATUS', '账户状态', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ACCT_TYPE_C1', 'C1', '账户类型:C1', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('BUSI_LINES1_1', '''41'',''51''', '信贷业务大类:51-资产处置、41-垫款', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('EDB_ACCT_BS_INF_SGMT_Table', 'E_ACCT_BS_INF', '企业借贷基本信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('LOAN_AMT_Column', 'LOAN_AMT', '借款金额', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ACCT_TYPE_D1', 'D1', '账户类型:D1', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('REPAY_MODE_D1', '''31'',''32'',''33'',''39''', '还款方式：账户类型为D1时对应的还款方式', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ACCT_TYPE_R1_1', 'R1', '账户类型:R1', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('REPAY_MODE_R1', '''11'',''12'',''13'',''14'',''15'',''19'',''21'',''22'',''23'',''29''', '还款方式：账户类型为R1时对应的还款方式', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ACCT_TYPE_R4', 'R4', '账户类型:R4', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('REPAY_MODE_R4', '''31'',''32'',''33'',''39''', '还款方式：账户类型为R1时对应的还款方式', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('PCB_CTRCT_CERT_REL_SGMT_Table', 'I_CTRCT_CERT_REL', '共同受信人信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('PCC_CREDIT_LIM_SGMT_Table', 'I_CREDIT_LIM', '额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('MDFC_SGMT_CODE_B', 'B', '待更正段段标：B', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('MDFC_SGMT_CODE_C', 'C', '待更正段段标：C', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('MDFC_SGMT_CODE_D', 'D', '待更正段段标：D', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('PBB_ACCT_BS_INF_SGMT_Table', 'I_ACCT_BS_INF', '基本信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('PBC_RLT_REPYMT_INF_SGMT_Table', 'I_LOAN_RLT_REPYMT_INF', '相关还款责任人段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('PBD_MCC_INF_SGMT_Table', 'I_MCC_INF', '抵质押物信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('PBE_ACCT_CRED_SGMT_Table', 'I_ACCT_CRED', '授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('PBF_OC_INF_SGMT_Table', 'I_OC_INF', '初始债权说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('PBG_AMBLG_INF_SGMT_Table', 'I_AMBLG_INF', '月度表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('PBH_SPEC_PRD_SGMT_Table', 'I_SPEC_PRD', '大额专项分期信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('PBI_ACCT_DBT_INF_SGMT_Table', 'I_ACCT_DBT_INF', '非月度表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('PBJ_AS_TRST_DSPN_SGMT_Table', 'I_AS_TRST_DSPN', '特殊交易说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('MDFC_SGMT_CODE_E', 'E', '待更正段段标：E', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('MDFC_SGMT_CODE_F', 'F', '待更正段段标：F', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('MDFC_SGMT_CODE_G', 'G', '待更正段段标：G', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('MDFC_SGMT_CODE_H', 'H', '待更正段段标：H', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('MDFC_SGMT_CODE_I', 'I', '待更正段段标：I', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('MDFC_SGMT_CODE_J', 'J', '待更正段段标：J', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('MDFC_SGMT_CODE_K', 'K', '待更正段段标：K', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('LAST_UPDATE_TIME_Column', 'LAST_UPDATE_TIME', '最后更新时间', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('OPERATOR_USER_Column', 'OPERATOR_USER', '操作员', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ORG_NAME_Column', 'ORG_NAME', '数据来源机构名称', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ORG_CODE_Column', 'ORG_CODE', '数据来源机构编号', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('BUSINESS_STATES_Column', 'BUSINESS_STATES', '数据状态', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('REJECT_REASON_Column', 'REJECT_REASON', '驳回原因', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('IS_FILTER_Column', 'IS_FILTER', '是否过滤标识(默认为N-不过滤)', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('REPORT_MESSAGE_ID_Column', 'REPORT_MESSAGE_ID', '报文文件ID', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('EXTEND1_Column', 'EXTEND1', '预留字段1', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('EXTEND2_Column', 'EXTEND2', '预留字段2', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('EXTEND3_Column', 'EXTEND3', '预留字段3', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('INF_REC_TYPE_Column', 'INF_REC_TYPE', '信息记录类型', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_A_null_07', 'E_ACCT_BS', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_A_pk_null_07', 'EDA_ACCT_BS_SGMT_ID', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m4_04', '负债和所有者权益合计', '负债和所有者权益合计=负债合计+所有者权益合计', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m5_04', '负债合计', '负债和所有者权益合计=负债合计+所有者权益合计', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_ACCT_CODE_09', 'CONTRACT_CODE', '对于个人授信协议整笔删除请求记录，待删除业务标识码必须在库中存在', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_EDA_09', 'I_CTRCT_BS', '对于个人授信协议整笔删除请求记录，待删除业务标识码必须在库中存在', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_ACCT_CODE_10', 'ACCT_CODE', '对于个人担保账户整笔删除请求记录，待删除业务标识码必须在库中存在', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_EDA_10', 'I_GUAR_ACCT_BS', '对于个人担保账户整笔删除请求记录，待删除业务标识码必须在库中存在', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_OD_BNES_CODE_05', 'OD_BNES_CODE', '个人借贷标识变更原业务标识码和新业务标识码不能相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_OD_BNES_CODE_06', 'OD_BNES_CODE', '个人授信标识变更原业务标识码和新业务标识码不能相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_OD_BNES_CODE_07', 'OD_BNES_CODE', '个人担保标识变更原业务标识码和新业务标识码不能相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_B001_01', 'I_ACCT_BS', '个人借贷原业务标识码必须是库中已有且正在使用的', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_C001_01', 'I_AMBLG_INF', '个人借贷原业务标识码必须是库中已有且正在使用的', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_B001_PK_01', 'PBA_ACCT_BS_SGMT_ID', '个人借贷原业务标识码必须是库中已有且正在使用的', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_D001_01', 'I_ACCT_DBT_INF', '个人借贷原业务标识码必须是库中已有且正在使用的', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_B001_acctcode_01', 'ACCT_CODE', '个人借贷原业务标识码必须是库中已有且正在使用的', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_B001_business_01', 'BUSINESS_STATES', '个人借贷原业务标识码必须是库中已有且正在使用的', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('business_01', 'RKCG', '个人借贷原业务标识码必须是库中已有且正在使用的', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_C001_acctstatus_01', 'ACCT_STATUS', '个人借贷原业务标识码必须是库中已有且正在使用的', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('acctstatus_01', '3', '个人借贷原业务标识码必须是库中已有且正在使用的', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_D001_nomonthacctstatus_01', 'NOMONTH_ACCT_STATUS', '个人借贷原业务标识码必须是库中已有且正在使用的', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('nomonthacctstatus_01', '3', '个人借贷原业务标识码必须是库中已有且正在使用的', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_B002_01', 'I_ACCT_BS', '个人借贷新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_C002_01', 'I_AMBLG_INF', '个人借贷新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_B002_PK_01', 'PBA_ACCT_BS_SGMT_ID', '个人借贷新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_D002_01', 'I_ACCT_DBT_INF', '个人借贷新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_B002_acctcode_01', 'ACCT_CODE', '个人借贷新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_B002_business_01', 'BUSINESS_STATES', '个人借贷新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('business2_01', 'RKCG', '个人借贷新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_C002_acctstatus_01', 'ACCT_STATUS', '个人借贷新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('acctstatus2_01', '3', '个人借贷新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_D002_nomonthacctstatus_01', 'NOMONTH_ACCT_STATUS', '个人借贷新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('nomonthacctstatus2_01', '3', '个人借贷新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_BS_SGMT_06', 'I_GUAR_ACCT_BS', '个人担保标识变更原业务标识码必须是库中已有且正在使用的', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_LBLTY_INF_SGMT_05', 'I_GR_REPYMT_INF', '个人担保标识变更原业务标识码必须是库中已有且正在使用的', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_pk_BS_SGMT_ID_05', 'PDA_GUAR_ACCT_BS_SGMT_ID', '个人担保标识变更原业务标识码必须是库中已有且正在使用的', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a_field2_0002', '''11'',''13'',''17'',''21'',''24'',''91''', '若就业状况为11-国家公务员、13-专业技术人员、17-职员、21-企业管理人员、24-工人或91-在职时，单位名称、单位性质、单位所属行业、单位详细地址、单位所在地邮编、单位所在地行政区划、单位电话、职业、职务、职称和本单位工作起始年份必须出现；若“就业状况为上述以外的代码，上述数据项不能出现。', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_a1_0002', 'CPN_NAME', '若就业状况为11-国家公务员、13-专业技术人员、17-职员、21-企业管理人员、24-工人或92-在职时，单位名称、单位性质、单位所属行业、单位详细地址、单位所在地邮编、单位所在地行政区划、单位电话、职业、职务、职称和本单位工作起始年份必须出现；若“就业状况为上述以外的代码，上述数据项不能出现。', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_a2_0002', 'CPN_TYPE', '若就业状况为11-国家公务员、13-专业技术人员、17-职员、21-企业管理人员、24-工人或93-在职时，单位名称、单位性质、单位所属行业、单位详细地址、单位所在地邮编、单位所在地行政区划、单位电话、职业、职务、职称和本单位工作起始年份必须出现；若“就业状况为上述以外的代码，上述数据项不能出现。', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_a3_0002', 'INDUSTRY', '若就业状况为11-国家公务员、13-专业技术人员、17-职员、21-企业管理人员、24-工人或94-在职时，单位名称、单位性质、单位所属行业、单位详细地址、单位所在地邮编、单位所在地行政区划、单位电话、职业、职务、职称和本单位工作起始年份必须出现；若“就业状况为上述以外的代码，上述数据项不能出现。', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_a4_0002', 'CPN_ADDR', '若就业状况为11-国家公务员、13-专业技术人员、17-职员、21-企业管理人员、24-工人或95-在职时，单位名称、单位性质、单位所属行业、单位详细地址、单位所在地邮编、单位所在地行政区划、单位电话、职业、职务、职称和本单位工作起始年份必须出现；若“就业状况为上述以外的代码，上述数据项不能出现。', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_a5_0002', 'CPN_PC', '若就业状况为11-国家公务员、13-专业技术人员、17-职员、21-企业管理人员、24-工人或96-在职时，单位名称、单位性质、单位所属行业、单位详细地址、单位所在地邮编、单位所在地行政区划、单位电话、职业、职务、职称和本单位工作起始年份必须出现；若“就业状况为上述以外的代码，上述数据项不能出现。', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_a6_0002', 'CPN_DIST', '若就业状况为11-国家公务员、13-专业技术人员、17-职员、21-企业管理人员、24-工人或97-在职时，单位名称、单位性质、单位所属行业、单位详细地址、单位所在地邮编、单位所在地行政区划、单位电话、职业、职务、职称和本单位工作起始年份必须出现；若“就业状况为上述以外的代码，上述数据项不能出现。', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_a7_0002', 'CPN_T_E_L', '若就业状况为11-国家公务员、13-专业技术人员、17-职员、21-企业管理人员、24-工人或98-在职时，单位名称、单位性质、单位所属行业、单位详细地址、单位所在地邮编、单位所在地行政区划、单位电话、职业、职务、职称和本单位工作起始年份必须出现；若“就业状况为上述以外的代码，上述数据项不能出现。', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_a8_0002', 'OCCUPATION', '若就业状况为11-国家公务员、13-专业技术人员、17-职员、21-企业管理人员、24-工人或99-在职时，单位名称、单位性质、单位所属行业、单位详细地址、单位所在地邮编、单位所在地行政区划、单位电话、职业、职务、职称和本单位工作起始年份必须出现；若“就业状况为上述以外的代码，上述数据项不能出现。', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_a9_0002', 'TITLE', '若就业状况为11-国家公务员、13-专业技术人员、17-职员、21-企业管理人员、24-工人或100-在职时，单位名称、单位性质、单位所属行业、单位详细地址、单位所在地邮编、单位所在地行政区划、单位电话、职业、职务、职称和本单位工作起始年份必须出现；若“就业状况为上述以外的代码，上述数据项不能出现。', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_a10_0002', 'TECH_TITLE', '若就业状况为11-国家公务员、13-专业技术人员、17-职员、21-企业管理人员、24-工人或101-在职时，单位名称、单位性质、单位所属行业、单位详细地址、单位所在地邮编、单位所在地行政区划、单位电话、职业、职务、职称和本单位工作起始年份必须出现；若“就业状况为上述以外的代码，上述数据项不能出现。', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_a11_0002', 'WORK_START_DATE', '若就业状况为11-国家公务员、13-专业技术人员、17-职员、21-企业管理人员、24-工人或102-在职时，单位名称、单位性质、单位所属行业、单位详细地址、单位所在地邮编、单位所在地行政区划、单位电话、职业、职务、职称和本单位工作起始年份必须出现；若“就业状况为上述以外的代码，上述数据项不能出现。', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a2_field_0003', '''20'',''21'',''22'',''23''', '若婚姻状况为20-已婚、21-初婚、22-再婚、23-复婚时，配偶姓名、配偶证件类型、配偶证件号码、配偶联系电话、配偶工作单位必须出现；若婚姻状况为上述以外的代码，上述数据项不能出现。', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_A_CODE_002', 'RPT_DATE_CODE', '报告时点说明代码为10-新开户/首次上报且反担保方式为3-保证时，应出现相关还款责任人信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('A_CODE3_002', '''10''', '报告时点说明代码为10-新开户/首次上报且反担保方式为4-保证时，应出现相关还款责任人信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('C_MODE_002', '''1''', '报告时点说明代码为10-新开户/首次上报且反担保方式为5-保证时，应出现相关还款责任人信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_A_003', 'I_GUAR_ACCT_BS', '报告时点说明代码为50-其他信息变化时，不包括在保责任信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_A_ID_003', 'PDA_GUAR_ACCT_BS_SGMT_ID', '报告时点说明代码为51-其他信息变化时，不包括在保责任信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_A_003', 'RPT_DATE_CODE', '报告时点说明代码为52-其他信息变化时，不包括在保责任信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('A_CODE4_003', '''50''', '报告时点说明代码为53-其他信息变化时，不包括在保责任信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_DUE_004', 'DUE_DATE', '开户日期应不晚于到期日期', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_A_005', 'ACCT_STATUS', '如果账户状态为2-关闭，则账户关闭日期不能为空值', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('A_STATUS_005', '''2''', '如果账户状态为2-关闭，则账户关闭日期不能为空值', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_TYPE_006', '''2''', '当还款责任人类型为2-反担保人时，联保标志、保证合同编号不应为空', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_WARTY_SIGN_006', 'WARTY_SIGN', '当还款责任人类型为3-反担保人时，联保标志、保证合同编号不应为空', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_MAX_GUAR_MCC_006', 'MAX_GUAR_MCC', '当还款责任人类型为4-反担保人时，联保标志、保证合同编号不应为空', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_A_007', 'I_GUAR_ACCT_BS', '债务人两标与责任人两标不能相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_A_ID_007', 'PDA_GUAR_ACCT_BS_SGMT_ID', '债务人两标与责任人两标不能相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_ID_TYPE_007', 'ID_TYPE', '债务人两标与责任人两标不能相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_CERT_TYPE_007', 'ARLP_CERT_TYPE', '债务人两标与责任人两标不能相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_ID_NUM_007', 'ID_NUM', '债务人两标与责任人两标不能相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_B_0001', 'I_FCS_INF', '对于个人基本信息记录，若报告时点说明代码为10-新增客户/首次上报，该记录至少包含基本概况信息段、教育信息段、居住地址段、通讯地址段、婚姻信息段、职业信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a5_field1_0006', '''30'',''40'',''70'',''80''', '当学历为30-大专、40-中专、职高、技校、70-初中、80-小学时，学位只能为5-无或10-未知', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a5_field2_0006', '''5'',''9''', '当学历为30-大专、40-中专、职高、技校、70-初中、80-小学时，学位只能为5-无或11-未知', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field6_a1_0007', 'OCCUPATION', '当单位性质为30-外资企业、40-个体、私营企业、50-其他（包括三资企业、民营企业、民间团体等）时，职业不能为0-国家机关、党群组织、企业、事业单位负责人、X-军人', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field1_1020', '''R2''', '当报告时点说明代码为31-月结日首次上报存量账户,20-账户关闭,32-月结日账户关闭,若账户类型为R2，不应包含初始债权说明段、非月度表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field2_1020', '''31'',''20'',''32'',''30''', '当报告时点说明代码为31-月结日首次上报存量账户,20-账户关闭,32-月结日账户关闭,若账户类型为R2，不应包含初始债权说明段、非月度表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms11_field1_1020', '当报告时点说明代码为31-月结日首次上报存量账户,20-账户关闭,32-月结日账户关闭,30-月度结算,若账户类型为R2，不应包含初始债权说明段、非月度表现信息段', '当报告时点说明代码为31-月结日首次上报存量账户,20-账户关闭,32-月结日账户关闭,若账户类型为R2，不应包含初始债权说明段、非月度表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name2_B_1021', 'I_AMBLG_INF', '当报告时点说明代码为40-收回逾期款项时：不应包含月度表现信息段、大额专项分期信息段、抵质押物信息段、授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name2_C_1021', 'I_SPEC_PRD', '当报告时点说明代码为40-收回逾期款项时：不应包含月度表现信息段、大额专项分期信息段、抵质押物信息段、授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name2_D_1021', 'I_MCC_INF', '当报告时点说明代码为40-收回逾期款项时：不应包含月度表现信息段、大额专项分期信息段、抵质押物信息段、授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name2_E_1021', 'I_ACCT_CRED', '当报告时点说明代码为40-收回逾期款项时：不应包含月度表现信息段、大额专项分期信息段、抵质押物信息段、授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field2_1021', '''40''', '当报告时点说明代码为40-收回逾期款项时：不应包含月度表现信息段、大额专项分期信息段、抵质押物信息段、授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('field1_2000', '''90''', '若“还款方式”为“90-汇总报送，不区分还款方式”，则“还款频率”为“03-月”', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field1_2000', 'REPAY_FREQCY', '若“还款方式”为“90-汇总报送，不区分还款方式”，则“还款频率”为“03-月”', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('field2_2000', '''03''', '若“还款方式”为“90-汇总报送，不区分还款方式”，则“还款频率”为“03-月”', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('field1_2001', '''2%''', '若“还款方式”代码以“2”开头，则“还款期数”必须为 0。', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field1_2001', 'REPAY_PRD', '若“还款方式”代码以“2”开头，则“还款期数”必须为 1。', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('field2_2001', '''0''', '若“还款方式”代码以“2”开头，则“还款期数”必须为 2。', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_F_0001', 'I_MLG_INF', '对于个人基本信息记录，若报告时点说明代码为14-新增客户/首次上报，该记录至少包含基本概况信息段、教育信息段、居住地址段、通讯地址段、婚姻信息段、职业信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_type_1009', 'ACCT_TYPE', '当报告时点说明代码为10-新开户时，除基础段外，至少包含基本信息段，若账户类型为C1，还应包含初始债权说明段、非月度表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field2_1009', '''C1''', '当报告时点说明代码为10-新开户时，除基础段外，至少包含基本信息段，若账户类型为C1，还应包含初始债权说明段、非月度表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field1_1009', '''10''', '当报告时点说明代码为10-新开户时，除基础段外，至少包含基本信息段，若账户类型为C1，还应包含初始债权说明段、非月度表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms4_field1_1009', '10-新开户时', '当报告时点说明代码为10-新开户时，除基础段外，至少包含基本信息段，若账户类型为C1，还应包含初始债权说明段、非月度表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms4_field2_1009', '基本信息段', '当报告时点说明代码为10-新开户时，除基础段外，至少包含基本信息段，若账户类型为C1，还应包含初始债权说明段、非月度表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms4_field3_1009', 'C1', '当报告时点说明代码为10-新开户时，除基础段外，至少包含基本信息段，若账户类型为C1，还应包含初始债权说明段、非月度表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms4_field4_1009', '初始债权说明段、非月度表现信息段', '当报告时点说明代码为10-新开户时，除基础段外，至少包含基本信息段，若账户类型为C1，还应包含初始债权说明段、非月度表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name2_B_1010', 'I_ACCT_BS_INF', '报告时点说明代码为10-新开户时，除基础段外，个人借贷账户信息记录至少包含基本信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field1_1010', '''10''', '报告时点说明代码为10-新开户时，除基础段外，个人借贷账户信息记录至少包含基本信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms5_field1_1010', '10-新开户', '报告时点说明代码为10-新开户时，除基础段外，个人借贷账户信息记录至少包含基本信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms5_field2_1010', '基本信息段', '报告时点说明代码为10-新开户时，除基础段外，个人借贷账户信息记录至少包含基本信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name2_B_1011', 'I_ACCT_BS_INF', '报告时点说明代码为10-新开户时，至少包含基本信息段：账户类型为D1，还应包含月度表现信息段。基本信息段中分次放款标志大于 0，应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name2_C_1011', 'I_ACCT_CRED', '报告时点说明代码为10-新开户时，至少包含基本信息段：账户类型为D1，还应包含月度表现信息段。基本信息段中分次放款标志大于 0，应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field1_1011', '''10'',''31''', '报告时点说明代码为10-新开户时，至少包含基本信息段：账户类型为D1，还应包含月度表现信息段。基本信息段中分次放款标志大于 0，应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field_type_1011', 'ACCT_TYPE', '报告时点说明代码为10-新开户时，至少包含基本信息段：账户类型为D1，还应包含月度表现信息段。基本信息段中分次放款标志大于 0，应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field2_1011', '''D1''', '报告时点说明代码为10-新开户时，至少包含基本信息段：账户类型为D1，还应包含月度表现信息段。基本信息段中分次放款标志大于 0，应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field_FLAG1_1011', 'FLAG', '报告时点说明代码为10-新开户时，至少包含基本信息段：账户类型为D1，还应包含月度表现信息段。基本信息段中分次放款标志大于 0，应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('flag1_1011', '0', '报告时点说明代码为10-新开户时，至少包含基本信息段：账户类型为D1，还应包含月度表现信息段。基本信息段中分次放款标志大于 0，应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms6_field1_1011', '报告时点说明代码为10-新开户时、31-月结日首次上报存量账户，至少包含基本信息段：账户类型为D1，还应包含月度表现信息段。基本信息段中分次放款标志大于 0，应包含授信额度信息段', '报告时点说明代码为10-新开户时，至少包含基本信息段：账户类型为D1，还应包含月度表现信息段。基本信息段中分次放款标志大于 0，应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name2_A_1012', 'I_ACCT_BS', '报告时点说明代码为10-新开户时，至少包含基本信息段：账户类型为D1，还应包含月度表现信息段。基本信息段中分次放款标志大于 1，应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name2_A_PK_1012', 'PBA_ACCT_BS_SGMT_ID', '报告时点说明代码为10-新开户时，至少包含基本信息段：账户类型为D1，还应包含月度表现信息段。基本信息段中分次放款标志大于 1，应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name2_C_1012', 'I_LOAN_RLT_REPYMT_INF', '报告时点说明代码为10-新开户时，至少包含基本信息段：账户类型为D1，还应包含月度表现信息段。基本信息段中分次放款标志大于 1，应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field_type1_1012', 'ACCT_TYPE', '报告时点说明代码为10-新开户时，至少包含基本信息段：账户类型为D1，还应包含月度表现信息段。基本信息段中分次放款标志大于 1，应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field1_1012', '''D1'',''R1'',''R2'',''R3'',''R4''', '报告时点说明代码为10-新开户时，至少包含基本信息段：账户类型为D1，还应包含月度表现信息段。基本信息段中分次放款标志大于 1，应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field_code1_1012', 'RPT_DATE_CODE', '报告时点说明代码为10-新开户时，至少包含基本信息段：账户类型为D1，还应包含月度表现信息段。基本信息段中分次放款标志大于 1，应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field2_1012', '''10'',''31''', '报告时点说明代码为10-新开户时，至少包含基本信息段：账户类型为D1，还应包含月度表现信息段。基本信息段中分次放款标志大于 1，应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field3_1012', '''3'',''5''', '报告时点说明代码为10-新开户时，至少包含基本信息段：账户类型为D1，还应包含月度表现信息段。基本信息段中分次放款标志大于 1，应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name2_A_1013', 'I_ACCT_BS', '当报告时点说明代码为10-新开户,31-月结日首次上报存量账户,如果基本信息段中分次放款标志为0，还不应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name2_C_1013', 'I_ACCT_CRED', '当报告时点说明代码为10-新开户,31-月结日首次上报存量账户,如果基本信息段中分次放款标志为0，还不应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_A_pk_1013', 'PBA_ACCT_BS_SGMT_ID', '当报告时点说明代码为10-新开户,31-月结日首次上报存量账户,如果基本信息段中分次放款标志为0，还不应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_A2_pk_null_02', 'EDA_ACCT_BS_SGMT_ID', '报送时点说明代码为31-开户后放款账户类型为D1且分次放款标识为2，则不应包含初始债权说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name2_C_1007', 'I_AMBLG_INF', '当报告时点说明代码为10-新开户时，至少包含基本信息段：若账户类型为R2，还应包含月度表现段。如果基本信息段中的借贷业务种类细分不是大额专项分期卡，还应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name2_D_1007', 'I_ACCT_CRED', '当报告时点说明代码为10-新开户时，至少包含基本信息段：若账户类型为R2，还应包含月度表现段。如果基本信息段中的借贷业务种类细分不是大额专项分期卡，还应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field1_1007', '''10'',''31''', '当报告时点说明代码为10-新开户时，至少包含基本信息段：若账户类型为R2，还应包含月度表现段。如果基本信息段中的借贷业务种类细分不是大额专项分期卡，还应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field_type_1007', 'ACCT_TYPE', '当报告时点说明代码为10-新开户时，至少包含基本信息段：若账户类型为R2，还应包含月度表现段。如果基本信息段中的借贷业务种类细分不是大额专项分期卡，还应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field2_1007', '''R2''', '当报告时点说明代码为10-新开户时，至少包含基本信息段：若账户类型为R2，还应包含月度表现段。如果基本信息段中的借贷业务种类细分不是大额专项分期卡，还应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m19_0101', '待删除起始日期', '个人借贷待删除起始日期必须小于等于待删除结束日期', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m20_0101', '待删除结束日期', '个人借贷待删除起始日期必须小于等于待删除结束日期', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('m21_0101', '小于等于', '个人借贷待删除起始日期必须小于等于待删除结束日期', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_eab_id_sgmt', 'E_ID', '企业基本信息记录其他标识段企业身份标识类型顺序映射', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('field_oth_ent_cert_type', 'OTH_ENT_CERT_TYPE', '企业基本信息记录其他标识段企业身份标识类型顺序映射', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ENT_NAME_lengthfor80', '80', '字段不允许大于80', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, SERVICE_NAME)
 Values
   ('table_field_ACCT_CODe2_01', 'ACCT_CODE', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, SERVICE_NAME)
 Values
   ('table_field_ACCT_CODe2_003', 'CONTRACT_CODE', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_INF_REC_TYPE1_0101', 'INF_REC_TYPE', '授信待更正业务标识码必须在库中存在', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ACCT_TYPE_Column2', 'ACCT_TYPE', '账户类型', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ACCT_CODE_Column', 'ACCT_CODE', '账户标识码', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('RPT_DATE_Column', 'RPT_DATE', '信息报告日期', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('RPT_DATE_CODE_Column2', 'RPT_DATE_CODE', '报告时点说明代码', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_E_0001', 'I_REDNC_INF', '对于个人基本信息记录，若报告时点说明代码为13-新增客户/首次上报，该记录至少包含基本概况信息段、教育信息段、居住地址段、通讯地址段、婚姻信息段、职业信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_A2_rptdatecode_not_01', 'RPT_DATE_CODE', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,42-展期发生,49-其他报送日账户类型为D1且分次放款标识为0，则不应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('rptdatecode_not2_01', '''10'',''20'',''32'',''33'',''41'',''42'',''49''', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,42-展期发生,49-其他报送日账户类型为D1且分次放款标识为0，则不应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_B2_flag_not_01', 'FLAG', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,42-展期发生,49-其他报送日账户类型为D1且分次放款标识为0，则不应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('flag_not2_01', '0', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,42-展期发生,49-其他报送日账户类型为D1且分次放款标识为0，则不应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_A2_accttype_not_01', 'ACCT_TYPE', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,42-展期发生,49-其他报送日账户类型为D1且分次放款标识为0，则不应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('accttype_not2_01', '''D1''', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,42-展期发生,49-其他报送日账户类型为D1且分次放款标识为0，则不应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a6_field1_0007', '''30'',''40'',''50''', '当单位性质为30-外资企业、40-个体、私营企业、50-其他（包括三资企业、民营企业、民间团体等）时，职业不能为1-国家机关、党群组织、企业、事业单位负责人、X-军人', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a6_field2_0007', '''0'',''X''', '当单位性质为30-外资企业、40-个体、私营企业、50-其他（包括三资企业、民营企业、民间团体等）时，职业不能为2-国家机关、党群组织、企业、事业单位负责人、X-军人', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_A_0008', 'I_BS', '证件类型、证件号码不能与基础段中的证件类型、证件号码完全相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_A_ID_0008', 'PAA_BS_SGMT_ID', '证件类型、证件号码不能与基础段中的证件类型、证件号码完全相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field7_a1_0008', 'ID_TYPE', '证件类型、证件号码不能与基础段中的证件类型、证件号码完全相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field7_a2_0008', 'ID_NUM', '证件类型、证件号码不能与基础段中的证件类型、证件号码完全相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field7_b2_0008', 'OTH_ID_NUM', '证件类型、证件号码不能与基础段中的证件类型、证件号码完全相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, SERVICE_NAME)
 Values
   ('table_pk_id', 'EDA_ACCT_BS_SGMT_ID', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, SERVICE_NAME)
 Values
   ('EDB_ACCT_BS_INF_SGMT_table_1', 'E_ACCT_BS_INF', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, SERVICE_NAME)
 Values
   ('EDH_ACCT_SPEC_TRST_DSPN_SGMT_table_3', 'E_ACCT_SPEC_TRST', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field7_a2_0009', 'ID_NUM', '证件类型、证件号码不能与基础段中的证件类型、证件号码完全相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field7_b2_0009', 'SPO_ID_NUM', '证件类型、证件号码不能与基础段中的证件类型、证件号码完全相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name2_B_1001', 'I_AMBLG_INF', '当报告时点说明代码为30-月度结算时：除基础段外，至少还应包含月度表现信息段；账户类型不能为C1。', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field1_1001', '''30''', '当报告时点说明代码为30-月度结算时：除基础段外，至少还应包含月度表现信息段；账户类型不能为C1。', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field_type_1001', 'ACCT_TYPE', '当报告时点说明代码为30-月度结算时：除基础段外，至少还应包含月度表现信息段；账户类型不能为C1。', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field2_1001', '''C1''', '当报告时点说明代码为30-月度结算时：除基础段外，至少还应包含月度表现信息段；账户类型不能为C1。', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms_field1_1001', '30-月度结算', '当报告时点说明代码为30-月度结算时：除基础段外，至少还应包含月度表现信息段；账户类型不能为C1。', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms_field2_1001', '月度表现信息段', '当报告时点说明代码为30-月度结算时：除基础段外，至少还应包含月度表现信息段；账户类型不能为C1。', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms_field3_1001', 'C1', '当报告时点说明代码为30-月度结算时：除基础段外，至少还应包含月度表现信息段；账户类型不能为C1。', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name2_B_1002', 'I_ACCT_BS_INF', '当报告时点说明代码为31-月结日首次上报存量账户时，除基础段外，至少包含基本信息段，账户类型不能为C1', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field1_1002', '''31''', '当报告时点说明代码为31-月结日首次上报存量账户时，除基础段外，至少包含基本信息段，账户类型不能为C1', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field_type_1002', 'ACCT_TYPE', '当报告时点说明代码为31-月结日首次上报存量账户时，除基础段外，至少包含基本信息段，账户类型不能为C1', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field2_1002', '''C1''', '当报告时点说明代码为31-月结日首次上报存量账户时，除基础段外，至少包含基本信息段，账户类型不能为C1', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms_field1_1002', '31-月结日首次上报存量账户', '当报告时点说明代码为31-月结日首次上报存量账户时，除基础段外，至少包含基本信息段，账户类型不能为C1', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms_field2_1002', '基本信息段', '当报告时点说明代码为31-月结日首次上报存量账户时，除基础段外，至少包含基本信息段，账户类型不能为C1', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms_field3_1002', 'C1', '当报告时点说明代码为31-月结日首次上报存量账户时，除基础段外，至少包含基本信息段，账户类型不能为C1', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name2_B_1003', 'I_AMBLG_INF', '当报告时点说明代码为32-月结日账户关闭时：除基础段外，至少还应包括月度表现信息段，账户类型不能为C1。', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field1_1003', '''32''', '当报告时点说明代码为32-月结日账户关闭时：除基础段外，至少还应包括月度表现信息段，账户类型不能为C1。', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field_type_1003', 'ACCT_TYPE', '当报告时点说明代码为32-月结日账户关闭时：除基础段外，至少还应包括月度表现信息段，账户类型不能为C1。', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field2_1003', '''C1''', '当报告时点说明代码为32-月结日账户关闭时：除基础段外，至少还应包括月度表现信息段，账户类型不能为C1。', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms_field1_1003', '32-月结日账户关闭', '当报告时点说明代码为32-月结日账户关闭时：除基础段外，至少还应包括月度表现信息段，账户类型不能为C1。', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms_field2_1003', '月度表现信息段', '当报告时点说明代码为32-月结日账户关闭时：除基础段外，至少还应包括月度表现信息段，账户类型不能为C1。', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms_field3_1003', 'C1', '当报告时点说明代码为32-月结日账户关闭时：除基础段外，至少还应包括月度表现信息段，账户类型不能为C1。', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name2_B_1004', 'I_ACCT_DBT_INF', '当报告时点说明代码为40-收回逾期款项时：除基础段外，至少还应包含非月度表现信息段；账户类型不能为R3', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field1_1004', '''40''', '当报告时点说明代码为40-收回逾期款项时：除基础段外，至少还应包含非月度表现信息段；账户类型不能为R3', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field_type_1004', 'ACCT_TYPE', '当报告时点说明代码为40-收回逾期款项时：除基础段外，至少还应包含非月度表现信息段；账户类型不能为R3', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field2_1004', '''R3''', '当报告时点说明代码为40-收回逾期款项时：除基础段外，至少还应包含非月度表现信息段；账户类型不能为R3', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms_field1_1004', '40-收回逾期款项', '当报告时点说明代码为40-收回逾期款项时：除基础段外，至少还应包含非月度表现信息段；账户类型不能为R3', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms_field2_1004', '非月度表现信息段', '当报告时点说明代码为40-收回逾期款项时：除基础段外，至少还应包含非月度表现信息段；账户类型不能为R3', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms_field3_1004', 'R3', '当报告时点说明代码为40-收回逾期款项时：除基础段外，至少还应包含非月度表现信息段；账户类型不能为R3', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name2_B_1005', 'I_AMBLG_INF', '当报告时点说明代码为20-账户关闭时，除基础段，若账户类型为D1/R1/R2/R3/R4，还应包含月度表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field1_1005', '''20''', '当报告时点说明代码为20-账户关闭时，除基础段，若账户类型为D1/R1/R2/R3/R4，还应包含月度表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field_type_1005', 'ACCT_TYPE', '当报告时点说明代码为20-账户关闭时，除基础段，若账户类型为D1/R1/R2/R3/R4，还应包含月度表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field2_1005', '''D1'',''R1'',''R2'',''R3'',''R4''', '当报告时点说明代码为20-账户关闭时，除基础段，若账户类型为D1/R1/R2/R3/R4，还应包含月度表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms2_field1_1005', '20-账户关闭', '当报告时点说明代码为20-账户关闭时，除基础段，若账户类型为D1/R1/R2/R3/R4，还应包含月度表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms2_field2_1005', 'D1/R1/R2/R3/R4', '当报告时点说明代码为20-账户关闭时，除基础段，若账户类型为D1/R1/R2/R3/R4，还应包含月度表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms2_field3_1005', '月度表现信息段', '当报告时点说明代码为20-账户关闭时，除基础段，若账户类型为D1/R1/R2/R3/R4，还应包含月度表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name2_B_1006', 'I_ACCT_DBT_INF', '当报告时点说明代码为20-账户关闭时，除基础段,若账户类型为C1，还应包含非月度表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field1_1006', '''20''', '当报告时点说明代码为20-账户关闭时，除基础段,若账户类型为C1，还应包含非月度表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field_type_1006', 'ACCT_TYPE', '当报告时点说明代码为20-账户关闭时，除基础段,若账户类型为C1，还应包含非月度表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field2_1006', '''C1''', '当报告时点说明代码为20-账户关闭时，除基础段,若账户类型为C1，还应包含非月度表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms2_field1_1006', '20-账户关闭', '当报告时点说明代码为20-账户关闭时，除基础段,若账户类型为C1，还应包含非月度表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms2_field2_1006', 'C1', '当报告时点说明代码为20-账户关闭时，除基础段,若账户类型为C1，还应包含非月度表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms2_field3_1006', '非月度表现信息段', '当报告时点说明代码为20-账户关闭时，除基础段,若账户类型为C1，还应包含非月度表现信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name2_B_1007', 'I_ACCT_BS_INF', '当报告时点说明代码为10-新开户时，至少包含基本信息段：若账户类型为R2，还应包含月度表现段。如果基本信息段中的借贷业务种类细分不是大额专项分期卡，还应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('CONTRACT_CODE_Column', 'CONTRACT_CODE', '授信协议标识码', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('PDA_GUAR_ACCT_BS_SGMT_Table', 'I_GUAR_ACCT_BS', '个人担保账户基础段/个人担保账户按段更正类请求记录', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('PDA_GUAR_ACCT_BS_SGMT_ID_Column', 'PDA_GUAR_ACCT_BS_SGMT_ID', 'PDA_GUAR_ACCT_BS_SGMT主键', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('PBA_ACCT_BS_SGMT_Table', 'I_ACCT_BS', '基础段/个人借贷按段更正请求记录信息', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('PBA_ACCT_BS_SGMT_ID_Column', 'PBA_ACCT_BS_SGMT_ID', 'PBA_ACCT_BS_SGMT表主键', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('SPEC_EFCT_DATE_Column', 'SPEC_EFCT_DATE', '分期额度生效日期', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('PBK_IN_SPC_EVT_DSC_INF_Table', 'I_IN_SPC_EVT_DSC_INF', '个人借贷账户特殊事件说明记录', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('OPETN_TYPE_Column', 'OPETN_TYPE', '事件类型', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('NUM_12', '12', '数值：12', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('NUM_4', '4', '数值：4', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ACCT_TYPE_R2', 'R2', '账户类型：R2-贷记卡账户', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ACCT_STATUS_3_4', '''3'',''4''', '账户状态：3-关闭、4-销户', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('PCA_CTRCT_BS_SGMT_Table', 'I_CTRCT_BS', '基础段/个人授信协议按段更正类请求记录', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('PCA_CTRCT_BS_SGMT_ID_Column', 'PCA_CTRCT_BS_SGMT_ID', 'PCA_CTRCT_BS_SGMT表主键', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ACCT_TYPE_PDA', '''G1'',''G2''', '个人担保账户类型', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ACCT_TYPE_PBA', '''D1'',''R1'',''R2'',''R3'',''R4'',''C1''', '个人借贷账户类型', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_B_001', 'I_GUAR_ACCT_INF', '报告时点说明代码为10-新开户/首次上报，至少应出现账户基本信息段、在保责任信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_C_001', 'I_GR_REPYMT_INF', '报告时点说明代码为10-新开户/首次上报，至少应出现账户基本信息段、在保责任信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('A_CODE_001', '''10''', '报告时点说明代码为10-新开户/首次上报，至少应出现账户基本信息段、在保责任信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_B2_001', 'I_GR_REPYMT_INF', '报告时点说明代码为20-账户关闭,30-在保责任变化,40-五级分类调整时，至少应出现在保责任信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('A_CODE2_001', '''20'',''30'',''40''', '报告时点说明代码为20-账户关闭,30-在保责任变化,41-五级分类调整时，至少应出现在保责任信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_A_002', 'I_GUAR_ACCT_BS', '报告时点说明代码为10-新开户/首次上报且反担保方式为1-保证时，应出现相关还款责任人信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_B_002', 'I_GUAR_RLT_REPYMT_INF', '报告时点说明代码为10-新开户/首次上报且反担保方式为2-保证时，应出现相关还款责任人信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('field1_2018', '''2''', '若“账户状态”为“2-结束”，则“账户关闭日期”不能为空值', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field1_2018', 'NOMONTH_CLOSE_DATE', '若“账户状态”为“2-结束”，则“账户关闭日期”不能为空值', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('field1_2019', '''3'',''4''', '当账户状态为“关闭”/“销户”时，“当前逾期总额”、“当前逾期期数”应为 0', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field1_2019', 'OVERD_PRD', '当账户状态为“关闭”/“销户”时，“当前逾期总额”、“当前逾期期数”应为 0', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('field2_2019', '''0''', '当账户状态为“关闭”/“销户”时，“当前逾期总额”、“当前逾期期数”应为 0', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field2_2019', 'TOT_OVERD', '当账户状态为“关闭”/“销户”时，“当前逾期总额”、“当前逾期期数”应为 0', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field1_2020', 'SPEC_END_DATE', '“分期额度生效日期”应不晚于“分期额度到期日期', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('inf_rec_type2_0101', '222', '授信待更正业务标识码必须在库中存在', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('inf_rec_type3_0101', '220', '授信待更正业务标识码必须在库中存在', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_INF_REC_TYPE1_0202', 'INF_REC_TYPE', '担保待更正业务标识码必须在库中存在', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('inf_rec_type2_0202', '232', '担保待更正业务标识码必须在库中存在', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('inf_rec_type3_0202', '230', '担保待更正业务标识码必须在库中存在', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_ENT_CERT_NUM_0001', 'ID_NUM', '
两组身份标识类型身份标识号码不能完全相同
', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_ENT_CERT_TYPE_0001', 'ID_TYPE', '两组身份标识类型身份标识号码不能完全相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_ASSO_ENT_CERT_TYPE_0001', 'FAM_MEM_CERT_TYPE', '
两组身份标识类型身份标识号码不能完全相同
', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_B_1001', 'I_CREDIT_LIM', '个人授信协议记录报送时，“基础段”和“额度信息段”必须出现', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ARLP_TYPE_Column', 'ARLP_CERT_TYPE', '债务人两标与相关还款责任人两标不能相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ID_TYPE_Column', 'ID_TYPE', '债务人两标与相关还款责任人两标不能相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('n3_0101', '1-保证', '当“报告时点说明代码”为“10-新开户/首次上报”，若“基本信息段”的“担保方式”为“1-保证”时，必须报送相关还款责任人段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('EDH_ACCT_SPEC_TRST_DSPN_Table', 'E_ACCT_SPEC_TRST', '企业借贷特定交易说明段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_EDA_ACCT_BS_SGMT', 'E_ACCT_BS', 'EDA_ACCT_BS_SGMT', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('n2_num', '31,32,33,39', '还款方式：31,32,33,39', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('n2_num2', '11,12,13,14,15,19,21,22,23,29', '11'',''12'',''13'',''14'',''15'',''19'',''21'',''22'',''23'',''29''', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('n3_num2', '2-质押、3-抵押', '担保方式:2-质押、3-抵押', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, SERVICE_NAME)
 Values
   ('EDA_ACCT_BS_SGMT_ID', 'E_ACCT_BS', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, SERVICE_NAME)
 Values
   ('n1_num2', 'R4,D1', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, SERVICE_NAME)
 Values
   ('n1_num1', 'R1', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_C_0001', 'I_EDU_INF', '对于个人基本信息记录，若报告时点说明代码为11-新增客户/首次上报，该记录至少包含基本概况信息段、教育信息段、居住地址段、通讯地址段、婚姻信息段、职业信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_D_0001', 'I_OCTPN_INF', '对于个人基本信息记录，若报告时点说明代码为12-新增客户/首次上报，该记录至少包含基本概况信息段、教育信息段、居住地址段、通讯地址段、婚姻信息段、职业信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field1_1013', '''D1''', '当报告时点说明代码为10-新开户,31-月结日首次上报存量账户,如果基本信息段中分次放款标志为0，还不应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_code1_1013', 'RPT_DATE_CODE', '当报告时点说明代码为10-新开户,31-月结日首次上报存量账户,如果基本信息段中分次放款标志为0，还不应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field2_1013', '''10'',''31'',''20'',''32'',''30''', '当报告时点说明代码为10-新开户,31-月结日首次上报存量账户,如果基本信息段中分次放款标志为0，还不应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('b1_field3_1013', '''0''', '当报告时点说明代码为10-新开户,31-月结日首次上报存量账户,如果基本信息段中分次放款标志为0，还不应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms8_field1_1013', '当报告时点说明代码为10-新开户,31-月结日首次上报存量账户,30-月度结算,如果基本信息段中分次放款标志为0，还不应包含授信额度信息段', '当报告时点说明代码为10-新开户,31-月结日首次上报存量账户,如果基本信息段中分次放款标志为0，还不应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name2_A_1014', 'I_ACCT_BS', '当报告时点说明代码为10-新开户,31-月结日首次上报存量账户,30-月度结算时，若账户类型为R2基本信息段中的借贷业务种类细分是82-大额专项分期卡，则还不应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name2_C_1014', 'I_ACCT_CRED', '当报告时点说明代码为10-新开户,31-月结日首次上报存量账户,30-月度结算时，若账户类型为R2基本信息段中的借贷业务种类细分是82-大额专项分期卡，则还不应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_A_pk_1014', 'PBA_ACCT_BS_SGMT_ID', '当报告时点说明代码为10-新开户,31-月结日首次上报存量账户,30-月度结算时，若账户类型为R2基本信息段中的借贷业务种类细分是82-大额专项分期卡，则还不应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field_type1_1014', 'ACCT_TYPE', '当报告时点说明代码为10-新开户,31-月结日首次上报存量账户,30-月度结算时，若账户类型为R2基本信息段中的借贷业务种类细分是82-大额专项分期卡，则还不应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field1_1014', '''R2''', '当报告时点说明代码为10-新开户,31-月结日首次上报存量账户,30-月度结算时，若账户类型为R2基本信息段中的借贷业务种类细分是82-大额专项分期卡，则还不应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_code1_1014', 'RPT_DATE_CODE', '当报告时点说明代码为10-新开户,31-月结日首次上报存量账户,30-月度结算时，若账户类型为R2基本信息段中的借贷业务种类细分是82-大额专项分期卡，则还不应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field2_1014', '''10'',''31'',''30'',''20'',''32''', '当报告时点说明代码为10-新开户,31-月结日首次上报存量账户,30-月度结算时，若账户类型为R2基本信息段中的借贷业务种类细分是82-大额专项分期卡，则还不应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('b1_field3_1014', '''82''', '当报告时点说明代码为10-新开户,31-月结日首次上报存量账户,30-月度结算时，若账户类型为R2基本信息段中的借贷业务种类细分是82-大额专项分期卡，则还不应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms8_field1_1014', '当报告时点说明代码为10-新开户,20-账户关闭,31-月结日首次上报存量账户,30-月度结算时，若账户类型为R2基本信息段中的借贷业务种类细分是82-大额专项分期卡，则还不应包含授信额度信息段', '当报告时点说明代码为10-新开户,31-月结日首次上报存量账户,30-月度结算时，若账户类型为R2基本信息段中的借贷业务种类细分是82-大额专项分期卡，则还不应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name2_B_1015', 'I_OC_INF', '当报告时点说明代码为10-新开户时：若账户类型为D1/R1/R3/R4，不应包含初始债权说明段、非月度表现信息段、特殊交易说明段、大额专项分期信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name2_C_1015', 'I_ACCT_DBT_INF', '当报告时点说明代码为10-新开户时：若账户类型为D1/R1/R3/R4，不应包含初始债权说明段、非月度表现信息段、特殊交易说明段、大额专项分期信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name2_D_1015', 'I_AS_TRST_DSPN', '当报告时点说明代码为10-新开户时：若账户类型为D1/R1/R3/R4，不应包含初始债权说明段、非月度表现信息段、特殊交易说明段、大额专项分期信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field1_2010', 'OVERD_PRD', '若“当前还款状态”为“N”或“M”，则“当前逾期期数”、“当前逾期总额”必须为0（若此账户没有上述数据项，则不校验此数据项）', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_G_0001', 'I_SPS_INF', '对于个人基本信息记录，若报告时点说明代码为15-新增客户/首次上报，该记录至少包含基本概况信息段、教育信息段、居住地址段、通讯地址段、婚姻信息段、职业信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a_field_0001', '''10''', '对于个人基本信息记录，若报告时点说明代码为16-新增客户/首次上报，该记录至少包含基本概况信息段、教育信息段、居住地址段、通讯地址段、婚姻信息段、职业信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms17_09', 'C1', '报送时点说明代码为20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含相关还款责任人段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ms18_09', '相关还款责任人段', '报送时点说明代码为20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含相关还款责任人段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_A2_null_01', 'E_ACCT_BS', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,42-展期发生,49-其他报送日账户类型为D1且分次放款标识为0，则不应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_B2_null_01', 'E_ACCT_BS_INF', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,42-展期发生,49-其他报送日账户类型为D1且分次放款标识为0，则不应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_A2_pk_null_01', 'EDA_ACCT_BS_SGMT_ID', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,42-展期发生,49-其他报送日账户类型为D1且分次放款标识为0，则不应包含授信额度信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('BUSI_DTIL_LINES_Column', 'BUSI_DTIL_LINES', '担保业务种类细分', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('BUSI_LINES_1', '''1''', '担保业务大类：1-融资担保', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('BUSI_DTIL_LINES_1', '''01'',''02'',''03'',''04'',''06'',''10''', '担保业务种类细分：融资性担保： 01-贷款担保； 02-票据承兑担保； 03-贸易融资担保； 04-项目融资担保； 06-其他融资性担保； 10-债券发行担保；', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('BUSI_LINES_2', '2', '担保业务大类：2-其他非融资担保', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('BUSI_DTIL_LINES_2', '''07'',''08'',''09''', '担保业务种类细分：非融资性担保： 07-诉讼保全担保； 08-履约担保； 09-其他非融资性担保；', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('BUSI_LINES_3', '3', '担保业务大类：3-再担保', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('BUSI_DTIL_LINES_3', '''11''', '担保业务种类细分：再担保： 11-再担保', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('BUSI_LINES_4', '4', '担保业务大类：4-保证保险', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('BUSI_DTIL_LINES_4', '''12''', '担保业务种类细分：保证保险： 12-贷款保证保险', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('BUSI_LINES_5', '5', '担保业务大类：5-信用证', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('BUSI_DTIL_LINES_5', '''51''', '担保业务种类细分：信用证 51-信用证', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('BUSI_LINES_6', '6', '担保业务大类：6-承兑汇票', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('BUSI_DTIL_LINES_6', '''61'',''62''', '担保业务种类细分：承兑汇票： 61-银行承兑汇票 62-商业承兑汇票', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('BUSI_LINES_7', '7', '担保业务大类：7-保函', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('BUSI_DTIL_LINES_7', '''71'',''72''', '担保业务种类细分：保函： 71-融资类保函 72-非融资类保函 ', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('CLOSE_DATE_Column', 'CLOSE_DATE', '账户关闭日期', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ACCT_STATUS_2', '2', '账户状态:2-关闭', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('REPAY_PRD_Column', 'REPAY_PRD', '余额变化日期', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('FIVE_CATE_ADJ_DATE_Column', 'FIVE_CATE_ADJ_DATE', '五级分类认定日期', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ARLP_CERT_TYPE_Column', 'ARLP_CERT_TYPE', '相关还款责任人身份标识类型', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('NUM_1', '1', '数值：1', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ARLPCERTTYPE_BELONGTO_INFOIDTYPE1', '''1'',''2'',''5'',''6'',''8'',''9'',''A'',''B'',''C'',''X'',''10'',''20''', '相关还款责任人身份标识类型(1-自然人)', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('NUM_2', '2', '数值：2', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ARLPCERTTYPE_BELONGTO_INFOIDTYPE2', '''10'',''20'',''30''', '相关还款责任人身份标识类型(2-组织机构)', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('MAX_GUAR_MCC_Column', 'MAX_GUAR_MCC', '保证合同编号', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('WARTY_SIGN_Column', 'WARTY_SIGN', '联保标志', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('EEA_GUAR_ACCT_BS_SGMT_ID_Column', 'EEA_GUAR_ACCT_BS_SGMT_ID', 'EEA_GUAR_ACCT_BS_SGMT表主键', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('EEA_GUAR_ACCT_BS_SGMT_Table', 'E_GUAR_ACCT_BS', '企业担保账户基础段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ARLP_NAME_Column', 'ARLP_NAME', '相关还款责任人名称', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ID_NUM_Column', 'ID_NUM', '债务人身份标识号码', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('NAME_Column', 'NAME', '债务人名称', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('EDA_ACCT_BS_SGMT_ID_Column', 'EDA_ACCT_BS_SGMT_ID', 'EDA_ACCT_BS_SGMT主键', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('EDA_ACCT_BS_SGMT_Table', 'E_ACCT_BS', '企业借贷基础段/企业借贷账户按段更正类请求记录', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('EDC_RLT_REPYMT_INF_SGMT_Table', 'E_RLT_REPYMT_INF', '企业借贷相关还款责任人段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('RPT_DATE_CODE_Column', 'RPT_DATE_CODE', '报告时点说明代码', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('NUM_10', '10', '数值：10', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('EDD_MOTGA_CLTAL_CTRCT_INF_SGMT_Table', 'E_MOTGA_CLTAL_CTRCT_INF', '企业借贷抵质押物信息段', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('GUAR_MODE_2AND3', '''2'',''3''', '担保方式:2-质押、3-抵押', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('TRAN_DATE_Column', 'TRAN_DATE', '交易日期', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('NUM_90', '90', '数值：90', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('REPAY_FREQCY_Column', 'REPAY_FREQCY', '还款频率', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('REPAY_MODE_2%', '2%', '还款方式：以“2”开头', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('NUM_99', '''99''', '数值：90', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ACCT_TYPE_Column1', 'ACCT_TYPE', '账户类型', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ACCT_TYPE_R4_AND_D1', '''R4'',''D1''', '账户类型：R4,D1', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('REPAY_MODE_3%', '''31'',''32'',''33'',''39''', '还款方式：31,32,33,39', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ACCT_TYPE_R1', '''R1''', '账户类型：R1', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('REPAY_MODE_1%_AND_3%', '''11'',''12'',''13'',''14'',''15'',''19'',''21'',''22'',''23'',''29''', '还款方式：11,12,13,14,15,19,21,22,23,29', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ARLP_TYPE_1', '''2'',''3'',''4'',''5'',''9''', '还款责任人类型:2-保证人,3-票据承兑人,4-应收账款债务人,5-供应链中核心企业,9-其他', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ARLP_AMT_Column', 'ARLP_AMT', '还款责任金额', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('WARTY_SIGN_Column1', 'WARTY_SIGN', '联保标志', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('MAX_GUAR_MCC_Column1', 'MAX_GUAR_MCC', '保证合同编号', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ARLP_CERT_TYPE_Column1', 'ARLP_CERT_TYPE', '责任人身份标识类型', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('ARLP_CERT_TYPE_1', '''1'',''2'',''3'',''4'',''5'',''6'',''10'',''20'',''A'',''B'',''C'',''X''', '身份类别为1-自然人时对应的‘责任人身份标识类型’', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_A_3005', 'I_ACCT_BS', '借款人证件类型、证件号码和责任人身份标识类型、责任人身份标识号码不能完全相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_A_pk_3005', 'PBA_ACCT_BS_SGMT_ID', '借款人证件类型、证件号码和责任人身份标识类型、责任人身份标识号码不能完全相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field1_3005', 'ID_TYPE', '借款人证件类型、证件号码和责任人身份标识类型、责任人身份标识号码不能完全相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('b1_field2_3005', 'ARLP_CERT_TYPE', '借款人证件类型、证件号码和责任人身份标识类型、责任人身份标识号码不能完全相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field2_3005', 'ID_NUM', '借款人证件类型、证件号码和责任人身份标识类型、责任人身份标识号码不能完全相同', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_A_3006', 'I_ACCT_BS', '对于 C1 外的其他账户，非月度表现中的账户状态不应为关闭或销户', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_A_pk_3006', 'PBA_ACCT_BS_SGMT_ID', '对于 C2 外的其他账户，非月度表现中的账户状态不应为关闭或销户', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field1_3006', 'ACCT_TYPE', '对于 C3 外的其他账户，非月度表现中的账户状态不应为关闭或销户', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field_code1_3006', '''C1''', '对于 C4 外的其他账户，非月度表现中的账户状态不应为关闭或销户', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('b1_field1_3006', '''3'',''5''', '对于 C5 外的其他账户，非月度表现中的账户状态不应为关闭或销户', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, SERVICE_NAME)
 Values
   ('MDFC_SGMT_CODE_Column', 'MDFC_SGMT_CODE', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, SERVICE_NAME)
 Values
   ('PDB_GUAR_ACCT_BS_INF_SGMT_Table', 'I_GUAR_ACCT_INF', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, SERVICE_NAME)
 Values
   ('PDC_RLT_REPYMT_INF_SGMT_Table', 'I_GUAR_RLT_REPYMT_INF', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, SERVICE_NAME)
 Values
   ('PDD_GUAR_MCC_INF_SGMT_Table', 'I_GUAR_MCC_INF', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, SERVICE_NAME)
 Values
   ('PDE_GR_REPYMT_INF_SGMT_Table', 'I_GR_REPYMT_INF', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field1_1010', 'RPT_DATE', '借贷账户特殊事件说明记录的“信息报告日期”与“发生月份”中的年、月相等', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_DEL_END_DATE_0101', 'DEL_END_DATE', '待删除起始日期,待删除的终止日期不能同时为空值', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_DEL_START_DATE_0101', 'DEL_START_DATE', '个人借贷待删除起始日期必须小于等于待删除结束日期', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, SERVICE_NAME)
 Values
   ('table_field_TOTAL_LIABILITIES_AND_NET_ASSE_04', 'TOTAL_EQUITY_AND_LIABILITIES', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, SERVICE_NAME)
 Values
   ('num5_0001', 'D', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('HY_BUSI_LINES_2', '''51'',''41''', '信贷业务大类:51-资产处置、41-垫款', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('inf_rec_type2_0303', '212', '借贷待更正业务标识码必须在库中存在', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('field1_2021', '''N''', '“当前还款状态”只能为“N-正常', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field1_2022', 'NOMONTH_LAT_RPY_DATE', '若“账户关闭日期”数据项不为空，则“账户关闭日期”应不早于“最近一次实际还款日期”、五级分类认定日期', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field2_2022', 'NOMONTH_FIVE_CATE_ADJ_DATE', '若“账户关闭日期”数据项不为空，则“账户关闭日期”应不早于“最近一次实际还款日期”、五级分类认定日期', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('field1_2023', '''2''', '若“账户状态”为“2-结束”，则“余额”应为 0', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field1_2023', 'NOMONTH_ACCT_BAL', '若“账户状态”为“2-结束”，则“余额”应为 0', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('field2_2023', '''0''', '若“账户状态”为“2-结束”，则“余额”应为 0', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_A_3000', 'I_ACCT_BS', '当账户信息记录中账户类型为R3时，透支 180 天以上未还余额应该小于等于余额', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_A_pk_3000', 'PBA_ACCT_BS_SGMT_ID', '当账户信息记录中账户类型为R3时，透支 181 天以上未还余额应该小于等于余额', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field2_3000', 'ACCT_TYPE', '当账户信息记录中账户类型为R3时，透支 182 天以上未还余额应该小于等于余额', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field_type1_3000', '''R3''', '当账户信息记录中账户类型为R3时，透支 183 天以上未还余额应该小于等于余额', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('b1_field1_3000', 'ACCT_BAL', '当账户信息记录中账户类型为R3时，透支 184 天以上未还余额应该小于等于余额', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_A_3001', 'I_ACCT_BS', '当账户信息记录中账户类型为R3时，当前还款状态为*时，余额必须为 0', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_A_pk_3001', 'PBA_ACCT_BS_SGMT_ID', '当账户信息记录中账户类型为R3时，当前还款状态为*时，余额必须为 1', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field2_3001', 'ACCT_TYPE', '当账户信息记录中账户类型为R3时，当前还款状态为*时，余额必须为 2', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field_type1_3001', '''R3''', '当账户信息记录中账户类型为R3时，当前还款状态为*时，余额必须为 3', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('b1_field1_3001', 'RPY_STATUS', '当账户信息记录中账户类型为R3时，当前还款状态为*时，余额必须为 4', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('b1_field_type1_3001', '''*''', '当账户信息记录中账户类型为R3时，当前还款状态为*时，余额必须为 5', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('b2_field_type2_3001', '''0''', '当账户信息记录中账户类型为R3时，当前还款状态为*时，余额必须为 6', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_A_3002', 'I_ACCT_BS', '当账户信息记录中账户类型为R3时，当前还款状态为数字1-7时，余额必须大于 0', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_A_pk_3002', 'PBA_ACCT_BS_SGMT_ID', '当账户信息记录中账户类型为R3时，当前还款状态为数字1-7时，余额必须大于 1', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field1_3002', 'ACCT_TYPE', '当账户信息记录中账户类型为R3时，当前还款状态为数字1-7时，余额必须大于 2', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field_type1_3002', '''R3''', '当账户信息记录中账户类型为R3时，当前还款状态为数字1-7时，余额必须大于 3', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('b1_field1_3002', 'RPY_STATUS', '当账户信息记录中账户类型为R3时，当前还款状态为数字1-7时，余额必须大于 4', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('b1_field_type1_3002', '''1'',''2'',''3'',''4'',''5'',''6'',''7''', '当账户信息记录中账户类型为R3时，当前还款状态为数字1-7时，余额必须大于 5', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('b1_field_type2_3002', '''0''', '当账户信息记录中账户类型为R3时，当前还款状态为数字1-7时，余额必须大于 6', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_A_3003', 'I_ACCT_BS', '当账户类型为C1时，借贷业务大类只能为5-资产处置、6-垫款 当账户类型为R2/R3时，借贷业务大类只能为2-信用卡', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_A_pk_3003', 'PBA_ACCT_BS_SGMT_ID', '当账户类型为C1时，借贷业务大类只能为5-资产处置、6-垫款 当账户类型为R2/R3时，借贷业务大类只能为3-信用卡', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field1_3003', 'ACCT_TYPE', '当账户类型为C1时，借贷业务大类只能为5-资产处置、6-垫款 当账户类型为R2/R3时，借贷业务大类只能为4-信用卡', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field_type1_3003', '''C1''', '当账户类型为C1时，借贷业务大类只能为5-资产处置、6-垫款 当账户类型为R2/R3时，借贷业务大类只能为5-信用卡', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('b1_field1_3003', '''5'',''6''', '当账户类型为C1时，借贷业务大类只能为5-资产处置、6-垫款 当账户类型为R2/R3时，借贷业务大类只能为6-信用卡', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field_type2_3003', '''R2'',''R3''', '当账户类型为C1时，借贷业务大类只能为5-资产处置、6-垫款 当账户类型为R2/R3时，借贷业务大类只能为7-信用卡', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('b1_field2_3003', '''2''', '当账户类型为C1时，借贷业务大类只能为5-资产处置、6-垫款 当账户类型为R2/R3时，借贷业务大类只能为8-信用卡', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_A_3004', 'I_ACCT_BS', '若报告时点说明代码为32-月结日账户关闭和20-账户关闭时，账户状态为3-关闭,4-销户', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_A_pk_3004', 'PBA_ACCT_BS_SGMT_ID', '若报告时点说明代码为32-月结日账户关闭和20-账户关闭时，账户状态为3-关闭,5-销户', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_C_3004', 'I_ACCT_DBT_INF', '若报告时点说明代码为32-月结日账户关闭和20-账户关闭时，账户状态为3-关闭,6-销户', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field1_3004', 'RPT_DATE_CODE', '若报告时点说明代码为32-月结日账户关闭和20-账户关闭时，账户状态为3-关闭,7-销户', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('a1_field_code1_3004', '''32'',''20''', '若报告时点说明代码为32-月结日账户关闭和20-账户关闭时，账户状态为3-关闭,8-销户', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('b1_field1_3004', '''3'',''4''', '若报告时点说明代码为32-月结日账户关闭和20-账户关闭时，账户状态为3-关闭,9-销户', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('inf_rec_type3_0303', '210', '借贷待更正业务标识码必须在库中存在', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_INF_REC_TYPE1_0303', 'INF_REC_TYPE', '借贷待更正业务标识码必须在库中存在', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field1_2002', 'DUE_DATE', '“开户日期”应不晚于“到期日期”', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('field1_2003', '''2''', '若“还款责任人类型”为“2-保证人”，则“还款责任金额”不能为空值', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field1_2003', 'ARLP_AMT', '若“还款责任人类型”为“2-保证人”，则“还款责任金额”不能为空值', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('field1_2004', '''2''', '当“还款责任人类型”为“2-保证人”时，“联保标志”、“保证合同编号”不应为空', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field1_2004', 'WARTY_SIGN', '当“还款责任人类型”为“3-保证人”时，“联保标志”、“保证合同编号”不应为空', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field2_2004', 'MAX_GUAR_MCC', '当“还款责任人类型”为“4-保证人”时，“联保标志”、“保证合同编号”不应为空', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('field1_2005', '''*''', '对于 R2 账户，“当前还款状态”为“*-当月未使用额度且不需要还款”时，“实际还款比例”应为空值', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field1_2005', 'RPY_PRCT', '对于 R2 账户，“当前还款状态”为“*-当月未使用额度且不需要还款”时，“实际还款比例”应为空值', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field1_2006', 'MONTH', '“结算/应还款日”与“月份”中的年、月必须保持一致', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('field1_2007', '''41'',''51'',''42'',''52''', '若账户信息记录中的“账户状态”为“41-呆账（进入核销认定程序，等待核销）”/“51-呆账（进入核销认定程序，等待核销）”、“42-呆账（已核销）”/“52-呆账（已核销）”时，“当前逾期总额”不能为 0', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field1_2007', 'OVERD_PRD', '若账户信息记录中的“账户状态”为“41-呆账（进入核销认定程序，等待核销）”/“51-呆账（进入核销认定程序，等待核销）”、“42-呆账（已核销）”/“52-呆账（已核销）”时，“当前逾期总额”不能为 1', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('field2_2007', '''0''', '若账户信息记录中的“账户状态”为“41-呆账（进入核销认定程序，等待核销）”/“51-呆账（进入核销认定程序，等待核销）”、“42-呆账（已核销）”/“52-呆账（已核销）”时，“当前逾期总额”不能为 2', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('field1_2008', '''6''', '若“账户状态”为“6-未激活”时，则“余额”、“当前逾期期数”、“当前逾期总额”必须为 0，“当前还款状态”必须为“*”（若此账户没有上述数据项，则不校验此数据项）。', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field1_2008', 'ACCT_BAL', '若“账户状态”为“6-未激活”时，则“余额”、“当前逾期期数”、“当前逾期总额”必须为 0，“当前还款状态”必须为“*”（若此账户没有上述数据项，则不校验此数据项）。', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('field2_2008', '''0''', '若“账户状态”为“6-未激活”时，则“余额”、“当前逾期期数”、“当前逾期总额”必须为 0，“当前还款状态”必须为“*”（若此账户没有上述数据项，则不校验此数据项）。', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field2_2008', 'OVERD_PRD', '若“账户状态”为“6-未激活”时，则“余额”、“当前逾期期数”、“当前逾期总额”必须为 0，“当前还款状态”必须为“*”（若此账户没有上述数据项，则不校验此数据项）。', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field3_2008', 'TOT_OVERD', '若“账户状态”为“6-未激活”时，则“余额”、“当前逾期期数”、“当前逾期总额”必须为 0，“当前还款状态”必须为“*”（若此账户没有上述数据项，则不校验此数据项）。', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field4_2008', 'RPY_STATUS', '若“账户状态”为“6-未激活”时，则“余额”、“当前逾期期数”、“当前逾期总额”必须为 0，“当前还款状态”必须为“*”（若此账户没有上述数据项，则不校验此数据项）。', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('field3_2008', '''*''', '若“账户状态”为“6-未激活”时，则“余额”、“当前逾期期数”、“当前逾期总额”必须为 0，“当前还款状态”必须为“*”（若此账户没有上述数据项，则不校验此数据项）。', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('field1_2009', '''*''', '若“当前还款状态”为“*”，则“本月应还款金额”、“当前逾期期数”、“当前逾期总额”、“本期账单余额”必须为 0（若此账户没有上述数据项，则不校验此数据项）', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field1_2009', 'CUR_RPY_AMT', '若“当前还款状态”为“*”，则“本月应还款金额”、“当前逾期期数”、“当前逾期总额”、“本期账单余额”必须为 0（若此账户没有上述数据项，则不校验此数据项）', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('field2_2009', '''0''', '若“当前还款状态”为“*”，则“本月应还款金额”、“当前逾期期数”、“当前逾期总额”、“本期账单余额”必须为 0（若此账户没有上述数据项，则不校验此数据项）', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field2_2009', 'OVERD_PRD', '若“当前还款状态”为“*”，则“本月应还款金额”、“当前逾期期数”、“当前逾期总额”、“本期账单余额”必须为 0（若此账户没有上述数据项，则不校验此数据项）', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field3_2009', 'TOT_OVERD', '若“当前还款状态”为“*”，则“本月应还款金额”、“当前逾期期数”、“当前逾期总额”、“本期账单余额”必须为 0（若此账户没有上述数据项，则不校验此数据项）', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field4_2009', 'PRID_ACCT_BAL', '若“当前还款状态”为“*”，则“本月应还款金额”、“当前逾期期数”、“当前逾期总额”、“本期账单余额”必须为 0（若此账户没有上述数据项，则不校验此数据项）', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('field3_2009', '''0''', '若“当前还款状态”为“*”，则“本月应还款金额”、“当前逾期期数”、“当前逾期总额”、“本期账单余额”必须为 0（若此账户没有上述数据项，则不校验此数据项）', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('field1_2010', '''N'',''M''', '若“当前还款状态”为“N”或“M”，则“当前逾期期数”、“当前逾期总额”必须为0（若此账户没有上述数据项，则不校验此数据项）', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('field2_2010', '''0''', '若“当前还款状态”为“N”或“M”，则“当前逾期期数”、“当前逾期总额”必须为0（若此账户没有上述数据项，则不校验此数据项）', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field2_2010', 'TOT_OVERD', '若“当前还款状态”为“N”或“M”，则“当前逾期期数”、“当前逾期总额”必须为0（若此账户没有上述数据项，则不校验此数据项）', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('field3_2010', '''0''', '若“当前还款状态”为“N”或“M”，则“当前逾期期数”、“当前逾期总额”必须为0（若此账户没有上述数据项，则不校验此数据项）', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('field1_2011', '''N'',''M''', '若“当前还款状态”为“N”或“M”，则“当前逾期期数”、“当前逾期总额”必须为0', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field1_2011', 'NOMONTH_OVERD_PRD', '若“当前还款状态”为“N”或“M”，则“当前逾期期数”、“当前逾期总额”必须为0', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('field2_2011', '''0''', '若“当前还款状态”为“N”或“M”，则“当前逾期期数”、“当前逾期总额”必须为0', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field2_2011', 'NOMONTH_TOT_OVERD', '若“当前还款状态”为“N”或“M”，则“当前逾期期数”、“当前逾期总额”必须为0', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('field3_2011', '''0''', '若“当前还款状态”为“N”或“M”，则“当前逾期期数”、“当前逾期总额”必须为0', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('field1_2012', '''1'',''2'',''3'',''4'',''5'',''6'',''7''', '若“当前还款状态”为数字“1-7”，则“当前逾期期数”、“当前逾期总额”必须大于0', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field1_2012', 'OVERD_PRD', '若“当前还款状态”为数字“1-7”，则“当前逾期期数”、“当前逾期总额”必须大于0', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('field2_2012', '''0''', '若“当前还款状态”为数字“1-7”，则“当前逾期期数”、“当前逾期总额”必须大于0', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field2_2012', 'TOT_OVERD', '若“当前还款状态”为数字“1-7”，则“当前逾期期数”、“当前逾期总额”必须大于0', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_name_B_2013', 'I_ACCT_BS', '对于 D1/R1/R4 账户，信息记录中“当前逾期本金”必须小于等于“当前逾期总额', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field_B_PK_2013', 'PBA_ACCT_BS_SGMT_ID', '对于 D1/R1/R4 账户，信息记录中“当前逾期本金”必须小于等于“当前逾期总额', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field1_2013', 'ACCT_TYPE', '对于 D1/R1/R4 账户，信息记录中“当前逾期本金”必须小于等于“当前逾期总额', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('field1_2013', '''D1'',''R1'',''R4''', '对于 D1/R1/R4 账户，信息记录中“当前逾期本金”必须小于等于“当前逾期总额', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field2_2013', 'TOT_OVERD', '对于 D1/R1/R4 账户，信息记录中“当前逾期本金”必须小于等于“当前逾期总额', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('field1_2014', '''3'',''4''', '若“账户状态”为“3-关闭”/“4-销户”，“余额”应为 0', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field1_2014', 'ACCT_BAL', '若“账户状态”为“3-关闭”/“4-销户”，“余额”应为 0', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('field2_2014', '''0''', '若“账户状态”为“3-关闭”/“4-销户”，“余额”应为 0', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('field1_2015', '''3'',''4''', '“账户状态”和“当前还款状态”需要保持一致：“账户状态”为“3-关闭”/“4-销户”时，“当前还款状态”应为“C-结清”/“C-销户”、“G-结束', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field2_2015', 'RPY_STATUS', '“账户状态”和“当前还款状态”需要保持一致：“账户状态”为“3-关闭”/“4-销户”时，“当前还款状态”应为“C-结清”/“C-销户”、“G-结束', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('field2_2015', '''C'',''G''', '“账户状态”和“当前还款状态”需要保持一致：“账户状态”为“3-关闭”/“4-销户”时，“当前还款状态”应为“C-结清”/“C-销户”、“G-结束', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field1_2016', 'SETT_DATE', '若“账户关闭日期”数据项不为空，则“账户关闭日期”应不早于“结算/应还款日”、最近一次实际还款日期”、五级分类认定日期', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field2_2016', 'LAT_RPY_DATE', '若“账户关闭日期”数据项不为空，则“账户关闭日期”应不早于“结算/应还款日”、最近一次实际还款日期”、五级分类认定日期', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field3_2016', 'FIVE_CATE_ADJ_DATE', '若“账户关闭日期”数据项不为空，则“账户关闭日期”应不早于“结算/应还款日”、最近一次实际还款日期”、五级分类认定日期', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('field1_2017', '''3'',''4''', '若“账户状态”为“3-关闭”/“4-销户”，“账户关闭日期”不能为空值', 'analyticValidateParameterServiceImpl_string');
Insert into VALIDATE_PARAMETER
   (PARAMETER_NAME, PARAMETER_VALUE, PARAMETER_COMMENT, SERVICE_NAME)
 Values
   ('table_field1_2017', 'CLOSE_DATE', '若“账户状态”为“3-关闭”/“4-销户”，“账户关闭日期”不能为空值', 'analyticValidateParameterServiceImpl_string');
COMMIT;
