DELETE FROM VALIDATE_MAPPING;
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('427', '106', 'ms14_04', 'ms14', '账户类型为R1不适用41-五级分类调整的报送时点');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('428', '106', 'ms15_04', 'ms15', '账户类型为R1不适用41-五级分类调整的报送时点');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('429', '107', 'table_name_A1_not_null_03', 'table_name_A1_not_null', '报送时点说明代码为42-展期发生，账户类型为D1,R4应包含还款表现信息段、特定交易说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('430', '107', 'table_name_B1_not_null_03', 'table_name_B1_not_null', '报送时点说明代码为42-展期发生，账户类型为D1,R4应包含还款表现信息段、特定交易说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('431', '107', 'table_field_code1_03', 'table_field_code1', '报送时点说明代码为42-展期发生，账户类型为D1,R4应包含还款表现信息段、特定交易说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('432', '107', 'table_field_accttype1_03', 'table_field_accttype1', '报送时点说明代码为42-展期发生，账户类型为D1,R4应包含还款表现信息段、特定交易说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('538', '119', 'table_field_B2_flag_not_01', 'table_field_B2_flag_not', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,42-展期发生,49-其他报送日账户类型为D1且分次放款标识为0，则不应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('539', '119', 'flag_not2_01', 'flag_not2', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,42-展期发生,49-其他报送日账户类型为D1且分次放款标识为0，则不应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('511', '116', 'accttype_not_07', 'accttype_not', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('512', '116', 'ms16_07', 'ms16', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('513', '116', 'ms17_07', 'ms17', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('514', '116', 'ms18_07', 'ms18', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('515', '117', 'table_name_A_null_08', 'table_name_A_null', '报送时点说明代码为20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含初始债权说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('516', '117', 'table_field_A_pk_null_08', 'table_field_A_pk_null', '报送时点说明代码为20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含初始债权说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('517', '117', 'table_field_A_rptdatecode_not_08', 'table_field_A_rptdatecode_not', '报送时点说明代码为20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含初始债权说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('518', '117', 'rptdatecode_not_08', 'rptdatecode_not', '报送时点说明代码为20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含初始债权说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('519', '117', 'table_field_A_accttype_not_08', 'table_field_A_accttype_not', '报送时点说明代码为20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含初始债权说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('520', '117', 'accttype_not_08', 'accttype_not', '报送时点说明代码为20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含初始债权说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('521', '117', 'ms16_08', 'ms16', '报送时点说明代码为20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含初始债权说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('522', '117', 'ms17_08', 'ms17', '报送时点说明代码为20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含初始债权说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('75', '35', 'table_field_OD_BNES_CODE_02', 'table_field_OD_BNES_CODE', '担保原业务标识码和新业务标识码不能相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('76', '36', 'table_field_OD_BNES_CODE_03', 'table_field_OD_BNES_CODE', '授信原业务标识码和新业务标识码不能相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('77', '37', 'table_field_OD_BNES_CODE_04', 'table_field_OD_BNES_CODE', '抵质押原业务标识码和新业务标识码不能相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('78', '38', 'table_name_LBLTY_INF_SGMT_02', 'table_name_LBLTY_INF_SGMT', '担保原本业务标识码必须是库中已有且正在使用的');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('79', '38', 'table_name_BS_SGMT_03', 'table_name_BS_SGMT', '担保原本业务标识码必须是库中已有且正在使用的');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('80', '38', 'table_pk_BS_SGMT_ID_02', 'table_pk_BS_SGMT_ID', '担保原本业务标识码必须是库中已有且正在使用的');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('81', '38', 'table_field_ACCT_STATUS_02', 'table_field_ACCT_STATUS', '担保原本业务标识码必须是库中已有且正在使用的');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('82', '38', 'acct_status_02', 'acct_status', '担保原本业务标识码必须是库中已有且正在使用的');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('83', '38', 'table_field_ACCT_CODe1_02', 'table_field_ACCT_CODe1', '担保原本业务标识码必须是库中已有且正在使用的');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('84', '39', 'table_name_LBLTY_INF_SGMT_03', 'table_name_LBLTY_INF_SGMT', '授信原本业务标识码必须是库中已有且正在使用的');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('85', '39', 'table_name_BS_SGMT_04', 'table_name_BS_SGMT', '授信原本业务标识码必须是库中已有且正在使用的');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('86', '39', 'table_pk_BS_SGMT_ID_03', 'table_pk_BS_SGMT_ID', '授信原本业务标识码必须是库中已有且正在使用的');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('87', '39', 'table_field_ACCT_STATUS_03', 'table_field_ACCT_STATUS', '授信原本业务标识码必须是库中已有且正在使用的');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('88', '39', 'acct_status_03', 'acct_status', '授信原本业务标识码必须是库中已有且正在使用的');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('89', '39', 'table_field_ACCT_CODe1_03', 'table_field_ACCT_CODe1', '授信原本业务标识码必须是库中已有且正在使用的');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('90', '40', 'table_name_LBLTY_INF_SGMT_04', 'table_name_LBLTY_INF_SGMT', '抵质押原本业务标识码必须是库中已有且正在使用的');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('91', '40', 'table_name_BS_SGMT_05', 'table_name_BS_SGMT', '抵质押原本业务标识码必须是库中已有且正在使用的');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('61', '33', 'table_pk_BS_SGMT_ID2_01', 'table_pk_BS_SGMT_ID2', '借贷新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('92', '40', 'table_pk_BS_SGMT_ID_04', 'table_pk_BS_SGMT_ID', '抵质押原本业务标识码必须是库中已有且正在使用的');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('93', '40', 'table_field_ACCT_STATUS_04', 'table_field_ACCT_STATUS', '抵质押原本业务标识码必须是库中已有且正在使用的');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('231', '76', 'm8_03', 'm8', '负债和所有者权益总计=资产总计');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('94', '40', 'acct_status_04', 'acct_status', '抵质押原本业务标识码必须是库中已有且正在使用的');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('95', '40', 'table_field_ACCT_CODe1_04', 'table_field_ACCT_CODe1', '抵质押原本业务标识码必须是库中已有且正在使用的');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('96', '41', 'table_name_BS_SGMT2_02', 'table_name_BS_SGMT2', '担保新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('97', '41', 'table_name_LBLTY_INF_SGMT2_02', 'table_name_LBLTY_INF_SGMT2', '担保新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('98', '41', 'table_pk_BS_SGMT_ID2_02', 'table_pk_BS_SGMT_ID2', '担保新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('99', '41', 'table_field_ACCT_STATUS2_02', 'table_field_ACCT_STATUS2', '担保新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('100', '41', 'acct_status2_02', 'acct_status2', '担保新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('102', '42', 'table_name_BS_SGMT2_03', 'table_name_BS_SGMT2', '授信新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('103', '42', 'table_name_LBLTY_INF_SGMT2_03', 'table_name_LBLTY_INF_SGMT2', '授信新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('104', '42', 'table_pk_BS_SGMT_ID2_03', 'table_pk_BS_SGMT_ID2', '授信新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('105', '42', 'table_field_ACCT_STATUS2_03', 'table_field_ACCT_STATUS2', '授信新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('106', '42', 'acct_status2_03', 'acct_status2', '授信新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('109', '43', 'table_name_LBLTY_INF_SGMT2_04', 'table_name_LBLTY_INF_SGMT2', '抵质押新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('110', '43', 'table_pk_BS_SGMT_ID2_04', 'table_pk_BS_SGMT_ID2', '抵质押新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('111', '43', 'table_field_ACCT_STATUS2_04', 'table_field_ACCT_STATUS2', '抵质押新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('112', '43', 'acct_status2_04', 'acct_status2', '抵质押新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('114', '44', 'inf_rec_type2_01', 'inf_rec_type2', '借贷待更正业务标识码必须在库中存在');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('115', '44', 'inf_rec_type3_01', 'inf_rec_type3', '借贷待更正业务标识码必须在库中存在');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('116', '44', 'table_field_INF_REC_TYPE1_01', 'table_field_INF_REC_TYPE1', '借贷待更正业务标识码必须在库中存在');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('117', '45', 'inf_rec_type5_01', 'inf_rec_type5', '借贷待更正记录基础段的“账户类型”应与库中“账户类型”一致');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('118', '45', 'inf_rec_type6_01', 'inf_rec_type6', '借贷待更正记录基础段的“账户类型”应与库中“账户类型”一致');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('119', '46', 'table_pk_SGMT_ID3_01', 'table_pk_SGMT_ID3', '借贷更正相关还款责任人段时，责任人两标与借款人两标不能相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('120', '46', 'table_name_BS_SGMT3_01', 'table_name_BS_SGMT3', '借贷更正相关还款责任人段时，责任人两标与借款人两标不能相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('121', '46', 'inf_rec_type7_01', 'inf_rec_type7', '借贷更正相关还款责任人段时，责任人两标与借款人两标不能相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('122', '46', 'mdfc_sgmt_code_01', 'mdfc_sgmt_code', '借贷更正相关还款责任人段时，责任人两标与借款人两标不能相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('123', '46', 'table_field_CERT_TYPE_01', 'table_field_CERT_TYPE', '借贷更正相关还款责任人段时，责任人两标与借款人两标不能相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('124', '46', 'table_field_ACCT_CODE1_01', 'table_field_ACCT_CODE1', '借贷更正相关还款责任人段时，责任人两标与借款人两标不能相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('125', '46', 'm24_01', 'm24', '借贷更正相关还款责任人段时，责任人两标与借款人两标不能相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('126', '46', 'm25_01', 'm25', '借贷更正相关还款责任人段时，责任人两标与借款人两标不能相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('127', '47', 'inf_rec_type8_01', 'inf_rec_type8', '借贷更正基础段时，待入库的更正请求记录的信息报告日期应等于库中相应信息段最新的信息报告日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('128', '47', 'mdfc_sgmt_code2_01', 'mdfc_sgmt_code', '借贷更正基础段时，待入库的更正请求记录的信息报告日期应等于库中相应信息段最新的信息报告日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('129', '48', 'inf_rec_type2_02', 'inf_rec_type2', '担保待更正业务标识码必须在库中存在');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('130', '48', 'inf_rec_type3_02', 'inf_rec_type3', '担保待更正业务标识码必须在库中存在');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('131', '48', 'table_field_INF_REC_TYPE1_02', 'table_field_INF_REC_TYPE1', '担保待更正业务标识码必须在库中存在');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('132', '49', 'inf_rec_type5_02', 'inf_rec_type5', '担保待更正记录基础段的“账户类型”应与库中“账户类型”一致');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('133', '49', 'inf_rec_type6_02', 'inf_rec_type6', '担保待更正记录基础段的“账户类型”应与库中“账户类型”一致');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('134', '50', 'table_pk_SGMT_ID3_02', 'table_pk_SGMT_ID3', '担保更正相关还款责任人段时，责任人两标与借款人两标不能相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('135', '50', 'table_name_BS_SGMT3_02', 'table_name_BS_SGMT3', '担保更正相关还款责任人段时，责任人两标与借款人两标不能相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('136', '50', 'inf_rec_type7_02', 'inf_rec_type7', '担保更正相关还款责任人段时，责任人两标与借款人两标不能相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('137', '50', 'mdfc_sgmt_code_02', 'mdfc_sgmt_code', '担保更正相关还款责任人段时，责任人两标与借款人两标不能相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('138', '50', 'table_field_CERT_TYPE_02', 'table_field_CERT_TYPE', '担保更正相关还款责任人段时，责任人两标与借款人两标不能相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('139', '50', 'table_field_ACCT_CODE1_02', 'table_field_ACCT_CODE1', '担保更正相关还款责任人段时，责任人两标与借款人两标不能相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('140', '50', 'm24_02', 'm24', '担保更正相关还款责任人段时，责任人两标与借款人两标不能相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('141', '50', 'm25_02', 'm25', '担保更正相关还款责任人段时，责任人两标与借款人两标不能相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('142', '51', 'inf_rec_type8_02', 'inf_rec_type8', '担保更正基础段时，待入库的更正请求记录的信息报告日期应等于库中相应信息段最新的信息报告日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('143', '51', 'mdfc_sgmt_code2_02', 'mdfc_sgmt_code', '担保更正基础段时，待入库的更正请求记录的信息报告日期应等于库中相应信息段最新的信息报告日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('144', '52', 'inf_rec_type2_03', 'inf_rec_type2', '授信待更正业务标识码必须在库中存在');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('145', '52', 'inf_rec_type3_03', 'inf_rec_type3', '授信待更正业务标识码必须在库中存在');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('108', '43', 'table_name_BS_SGMT2_04', 'table_name_BS_SGMT2', '抵质押新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('146', '52', 'table_field_INF_REC_TYPE1_03', 'table_field_INF_REC_TYPE1', '授信待更正业务标识码必须在库中存在');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('147', '53', 'table_pk_SGMT_ID3_03', 'table_pk_SGMT_ID3', '授信更正共同受信人信息段时，共同受信人两标与受信人两标不能相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('148', '53', 'table_name_BS_SGMT3_03', 'table_name_BS_SGMT3', '授信更正共同受信人信息段时，共同受信人两标与受信人两标不能相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('149', '53', 'inf_rec_type7_03', 'inf_rec_type7', '授信更正共同受信人信息段时，共同受信人两标与受信人两标不能相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('150', '53', 'mdfc_sgmt_code_03', 'mdfc_sgmt_code', '授信更正共同受信人信息段时，共同受信人两标与受信人两标不能相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('151', '53', 'table_field_CERT_TYPE_03', 'table_field_CERT_TYPE', '授信更正共同受信人信息段时，共同受信人两标与受信人两标不能相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('152', '53', 'table_field_ACCT_CODE1_03', 'table_field_ACCT_CODE1', '授信更正共同受信人信息段时，共同受信人两标与受信人两标不能相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('153', '53', 'm24_03', 'm24', '授信更正共同受信人信息段时，共同受信人两标与受信人两标不能相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('154', '53', 'm25_03', 'm25', '授信更正共同受信人信息段时，共同受信人两标与受信人两标不能相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('155', '54', 'table_name_EDA_05', 'table_name_EDA', '授信协议按段删除待删除的业务标识码必须在库中存在');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('156', '54', 'table_field_ACCT_CODE_05', 'table_field_ACCT_CODE', '授信协议按段删除待删除的业务标识码必须在库中存在');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('157', '55', 'table_field_DEL_END_DATE_01', 'table_field_DEL_END_DATE', '授信待删除起始日期,待删除的终止日期不能同时为空值');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('158', '56', 'table_field_DEL_START_DATE_01', 'table_field_DEL_START_DATE', '授信待删除起始日期必须小于等于待删除的结束日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('159', '56', 'm19_01', 'm19', '授信待删除起始日期必须小于等于待删除的结束日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('160', '56', 'm20_01', 'm20', '授信待删除起始日期必须小于等于待删除的结束日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('161', '56', 'm21_01', 'm21', '授信待删除起始日期必须小于等于待删除的结束日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('162', '57', 'table_name_EDA_06', 'table_name_EDA', '担保按段删除待删除的业务标识码必须在库中存在');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('277', '84', 'table_field_NON_CURRENT_ASSETS2_02', 'table_field_NON_CURRENT_ASSETS2', '现金及现金等价物净增加额=经营活动产生的现金流量净额+投资活动产生的现金流量净额+筹资活动产生的现金流量净额+汇率变动对现金及现金等价物的影响');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('164', '58', 'table_field_DEL_END_DATE_02', 'table_field_DEL_END_DATE', '担保待删除起始日期,待删除的终止日期不能同时为空值');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('165', '59', 'table_field_DEL_START_DATE_02', 'table_field_DEL_START_DATE', '担保待删除起始日期必须小于等于待删除的结束日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('166', '59', 'm19_02', 'm19', '担保待删除起始日期必须小于等于待删除的结束日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('167', '59', 'm20_02', 'm20', '担保待删除起始日期必须小于等于待删除的结束日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('163', '57', 'table_field_ACCT_CODE_06', 'table_field_ACCT_CODE', '担保按段删除待删除的业务标识码必须在库中存在');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('168', '59', 'm21_02', 'm21', '担保待删除起始日期必须小于等于待删除的结束日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('169', '60', 'table_name_EDA_07', 'table_name_EDA', '借贷按段删除待删除的业务标识码必须在库中存在');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('170', '60', 'table_field_ACCT_CODE_07', 'table_field_ACCT_CODE', '借贷按段删除待删除的业务标识码必须在库中存在');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('171', '61', 'table_field_DEL_END_DATE_03', 'table_field_DEL_END_DATE', '借贷待删除起始日期,待删除的终止日期不能同时为空值');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('172', '62', 'table_field_DEL_START_DATE_03', 'table_field_DEL_START_DATE', '借贷待删除起始日期必须小于等于待删除的结束日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('173', '62', 'm19_03', 'm19', '借贷待删除起始日期必须小于等于待删除的结束日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('174', '62', 'm20_03', 'm20', '借贷待删除起始日期必须小于等于待删除的结束日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('175', '62', 'm21_03', 'm21', '借贷待删除起始日期必须小于等于待删除的结束日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('176', '63', 'table_field_ENT_CERT_TYPE_01', 'table_field_ENT_CERT_TYPE', '两组企业身份标识类型企业身份标识号码不能完全相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('177', '63', 'table_field_ASSO_ENT_CERT_TYPE_01', 'table_field_ASSO_ENT_CERT_TYPE', '两组企业身份标识类型企业身份标识号码不能完全相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('178', '63', 'table_field_ENT_CERT_NUM_01', 'table_field_ENT_CERT_NUM', '两组企业身份标识类型企业身份标识号码不能完全相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('179', '64', 'sheet_type_01', 'sheet_type', '报表类型必须填写10');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('180', '65', 'sheet_type_02', 'sheet_type', '报表类型必须填写10');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('181', '66', 'm1_01', 'm1', '本期财政补助结转结余值不正确');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('182', '66', 'm2_01', 'm2', '本期财政补助结转结余值不正确');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('183', '66', 'm3_01', 'm3', '本期财政补助结转结余值不正确');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('184', '66', 'table_field_REVENUE_01', 'table_field_REVENUE', '本期财政补助结转结余值不正确');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('185', '66', 'table_field_EXPENDITURE_01', 'table_field_EXPENDITURE', '本期财政补助结转结余值不正确');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('186', '67', 'm1_02', 'm1', '本期事业结转结余值不正确');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('187', '67', 'm2_02', 'm2', '本期事业结转结余值不正确');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('188', '67', 'm3_02', 'm3', '本期事业结转结余值不正确');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('189', '67', 'table_field_REVENUE_02', 'table_field_REVENUE', '本期事业结转结余值不正确');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('190', '67', 'table_field_EXPENDITURE_02', 'table_field_EXPENDITURE', '本期事业结转结余值不正确');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('191', '68', 'm1_03', 'm1', '本期经营结余值不正确');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('192', '68', 'm2_03', 'm2', '本期经营结余值不正确');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('193', '68', 'm3_03', 'm3', '本期经营结余值不正确');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('194', '68', 'table_field_REVENUE_03', 'table_field_REVENUE', '本期经营结余值不正确');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('195', '68', 'table_field_EXPENDITURE_03', 'table_field_EXPENDITURE', '本期经营结余值不正确');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('196', '69', 'm4_01', 'm4', '资产总计值不正确');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('197', '69', 'm5_01', 'm5', '资产总计值不正确');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('198', '69', 'm6_01', 'm6', '资产总计值不正确');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('199', '69', 'table_field_CURRENT_ASSETS_01', 'table_field_CURRENT_ASSETS', '资产总计值不正确');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('200', '69', 'table_field_NON_CURRENT_ASSETS_01', 'table_field_NON_CURRENT_ASSETS', '资产总计值不正确');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('201', '70', 'm4_02', 'm4', '负债合计值不正确');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('202', '70', 'm5_02', 'm5', '负债合计值不正确');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('203', '70', 'm6_02', 'm6', '负债合计值不正确');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('204', '70', 'table_field_CURRENT_ASSETS_02', 'table_field_CURRENT_ASSETS', '负债合计值不正确');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('205', '70', 'table_field_NON_CURRENT_ASSETS_02', 'table_field_NON_CURRENT_ASSETS', '负债合计值不正确');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('206', '71', 'm4_03', 'm4', '负债和净资产总计值不正确');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('207', '71', 'm5_03', 'm5', '负债和净资产总计值不正确');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('208', '71', 'm6_03', 'm6', '负债和净资产总计值不正确');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('209', '71', 'table_field_CURRENT_ASSETS_03', 'table_field_CURRENT_ASSETS', '负债和净资产总计值不正确');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('210', '71', 'table_field_NON_CURRENT_ASSETS_03', 'table_field_NON_CURRENT_ASSETS', '负债和净资产总计值不正确');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('211', '72', 'table_field_TOTAL_LIABILITIES_AND_NET_ASSE_01', 'table_field_TOTAL_LIABILITIES_AND_NET_ASSE', '资产总计=负债和净资产总计');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('212', '72', 'm7_01', 'm7', '资产总计=负债和净资产总计');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('213', '72', 'm8_01', 'm8', '资产总计=负债和净资产总计');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('214', '73', 'm9_01', 'm9', '负债和所有者权益总计=负债合计+少数股东权益+所有者权益合计');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('215', '73', 'm10_01', 'm10', '负债和所有者权益总计=负债合计+少数股东权益+所有者权益合计');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('216', '73', 'm11_01', 'm11', '负债和所有者权益总计=负债合计+少数股东权益+所有者权益合计');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('217', '73', 'm12_01', 'm12', '负债和所有者权益总计=负债合计+少数股东权益+所有者权益合计');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('218', '73', 'table_field_CURRENT_ASSETS1_01', 'table_field_CURRENT_ASSETS1', '负债和所有者权益总计=负债合计+少数股东权益+所有者权益合计');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('219', '73', 'table_field_NON_CURRENT_ASSETS1_01', 'table_field_NON_CURRENT_ASSETS1', '负债和所有者权益总计=负债合计+少数股东权益+所有者权益合计');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('220', '73', 'table_field_TOTAL_EQUITY1_01', 'table_field_TOTAL_EQUITY1', '负债和所有者权益总计=负债合计+少数股东权益+所有者权益合计');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('221', '74', 'table_field_TOTAL_LIABILITIES_AND_NET_ASSE_02', 'table_field_TOTAL_LIABILITIES_AND_NET_ASSE', '负债和所有者权益总计=资产总计');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('3', '3', 'ent_cert_type_02', 'num10', '企业基本信息记录基础段企业身份标识类型顺序映射');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('4', '3', 'ent_cert_type_03', 'num10', '企业基本信息记录基础段企业身份标识类型顺序映射');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('7', '3', 'oth_ent_cert_type_03', 'num20', '企业基本信息记录其他标识段企业身份标识类型顺序映射');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('8', '3', 'table_eab_id_sgmt', 'table_1', '企业基本信息记录其他标识段企业身份标识类型顺序映射');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('9', '3', 'field_oth_ent_cert_type', 'table_field_1', '企业基本信息记录其他标识段企业身份标识类型顺序映射');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('10', '4', 'rpt_date_code', 'num30', '当值为“10-新增客户资料/首次上报”时，企业基本信息基本必须报送基础段、基本概况段、主要组成人员段、联系方式段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('11', '4', 'eac_fcs_inf_sgmt', 'table_1', '当值为“10-新增客户资料/首次上报”时，企业基本信息基本必须报送基础段、基本概况段、主要组成人员段、联系方式段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('12', '4', 'ead_mn_mmb_inf_sgmt', 'table_2', '当值为“10-新增客户资料/首次上报”时，企业基本信息基本必须报送基础段、基本概况段、主要组成人员段、联系方式段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('13', '4', 'eah_cota_inf_sgmt', 'table_3', '当值为“10-新增客户资料/首次上报”时，企业基本信息基本必须报送基础段、基本概况段、主要组成人员段、联系方式段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('14', '5', 'org_type_01', 'num10', '当值为“10-新增客户资料/首次上报”时,对于企业、事业单位、社会团体（三类组织的分支机构除外），需要报送注册资本及主要出资人段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('15', '5', 'org_type_02', 'num20', '当值为“10-新增客户资料/首次上报”时,对于企业、事业单位、社会团体（三类组织的分支机构除外），需要报送注册资本及主要出资人段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('16', '5', 'org_type_03', 'table_field_1', '当值为“10-新增客户资料/首次上报”时,对于企业、事业单位、社会团体（三类组织的分支机构除外），需要报送注册资本及主要出资人段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('17', '5', 'org_type_04', 'table_1', '当值为“10-新增客户资料/首次上报”时,对于企业、事业单位、社会团体（三类组织的分支机构除外），需要报送注册资本及主要出资人段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('18', '6', 'OrgType_for_value_01', 'num10', '组织机构类型为机关类型时，注册资本及主要出资人段不能出现');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('19', '6', 'OrgType_for_value_02', 'table_1', '组织机构类型为机关类型时，注册资本及主要出资人段不能出现');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('20', '7', 'Reg_Add_is_Null_01', 'num10', '当国别代码为CHN时，登记地址不能为空');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('21', '7', 'Reg_Add_is_Null_02', 'table_field_1', '当国别代码为CHN时，登记地址不能为空');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('22', '8', 'Reg_Add_not_Null_01', 'num10', '当国别代码不为CHN时，登记地址统一为空');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('23', '8', 'Reg_Add_not_Null_02', 'table_field_1', '当国别代码不为CHN时，登记地址统一为空');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('24', '9', 'Establish_Date_01', 'table_field_1', '成立日期要不晚于信息更新日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('25', '10', 'Between_Two_Numbers_01', 'num10', '注册资本及主要出资人段中的出资比例大于 0， 小于或等于 100');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('26', '10', 'Between_Two_Numbers_02', 'num20', '注册资本及主要出资人段中的出资比例大于 0， 小于或等于 100');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('27', '11', 'Identity_Matching_01', 'num10', '出资人身份类别要与出资人身份标识类型匹配');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('28', '11', 'Identity_Matching_02', 'num20', '出资人身份类别要与出资人身份标识类型匹配');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('29', '11', 'Identity_Matching_03', 'table_field_1', '出资人身份类别要与出资人身份标识类型匹配');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('30', '11', 'Identity_Matching_04', 'num10', '出资人身份类别要与出资人身份标识类型匹配');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('31', '11', 'Identity_Matching_05', 'num20', '出资人身份类别要与出资人身份标识类型匹配');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('32', '11', 'Identity_Matching_06', 'table_field_1', '出资人身份类别要与出资人身份标识类型匹配');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('33', '12', 'ENT_CERT_NUM_lengthfor40', 'len', '企业身份标识号码长度校验');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('34', '13', 'INF_SURC_CODE_lengthfor20', 'len', '信息来源编码长度校验');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('35', '14', 'CIMOC_lengthfor14', 'len', '客户资料维护机构代码长度校验');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('36', '15', 'OTH_ENT_CERT_NUM_lengthfor40', 'len', '其他标识信息段企业身份标识号码长度校验');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('37', '16', 'REG_ADD_lengthfor100', 'len', '基本概况信息登记地址长度校验');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('38', '17', 'BIZ_RANGE_lengthfor400', 'len', '基本概况信息业务范围长度校验');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('39', '18', 'MMB_ALIAS_lengthfor30', 'len', '主要组成人员姓名长度校验');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('40', '19', 'MMB_ID_NUM_lengthfor20', 'len', '主要组成人员证件号码长度校验');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('41', '20', 'REG_CAP_lengthfor15', 'len', '注册资本长度校验');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('42', '21', 'SHAR_HOD_NAME_lengthfor80', 'len', '出资人名称长度校验');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('43', '22', 'SHAR_HOD_ID_NUM_lengthfor40', 'len', '出资人身份标识号码长度校验');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('1', '1', 'ENT_NAME_lengthfor80', 'len', '企业名称长度校验');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('44', '27', 'table_field_ACCT_CODE_01', 'table_field_ACCT_CODE', '借贷账户待删除的业务标识码必须在库中存在');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('45', '27', 'table_name_EDA_01', 'table_name_EDA', '借贷账户待删除的业务标识码必须在库中存在');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('46', '28', 'table_field_OD_BNES_CODE_01', 'table_field_OD_BNES_CODE', '原业务标识码和新业务标识码不能相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('47', '29', 'table_field_ACCT_CODE_02', 'table_field_ACCT_CODE', '担保账户待删除的业务标识码必须在库中存在');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('48', '29', 'table_name_EDA_02', 'table_name_EDA', '担保账户待删除的业务标识码必须在库中存在');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('49', '30', 'table_field_ACCT_CODE_03', 'table_field_ACCT_CODE', '授信协议待删除的业务标识码必须在库中存在');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('50', '30', 'table_name_EDA_03', 'table_name_EDA', '授信协议待删除的业务标识码必须在库中存在');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('51', '31', 'table_field_ACCT_CODE_04', 'table_field_ACCT_CODE', '抵质押待删除的业务标识码必须在库中存在');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('52', '31', 'table_name_EDA_04', 'table_name_EDA', '抵质押待删除的业务标识码必须在库中存在');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('53', '32', 'table_name_LBLTY_INF_SGMT_01', 'table_name_LBLTY_INF_SGMT', '借贷原本业务标识码必须是库中已有且正在使用的');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('54', '32', 'table_name_BS_SGMT_02', 'table_name_BS_SGMT', '借贷原本业务标识码必须是库中已有且正在使用的');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('55', '32', 'table_pk_BS_SGMT_ID_01', 'table_pk_BS_SGMT_ID', '借贷原本业务标识码必须是库中已有且正在使用的');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('56', '32', 'table_field_ACCT_STATUS_01', 'table_field_ACCT_STATUS', '借贷原本业务标识码必须是库中已有且正在使用的');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('57', '32', 'acct_status_01', 'acct_status', '借贷原本业务标识码必须是库中已有且正在使用的');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('58', '32', 'table_field_ACCT_CODe1_01', 'table_field_ACCT_CODe1', '借贷原本业务标识码必须是库中已有且正在使用的');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('59', '33', 'table_name_BS_SGMT2_01', 'table_name_BS_SGMT2', '借贷新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('60', '33', 'table_name_LBLTY_INF_SGMT2_01', 'table_name_LBLTY_INF_SGMT2', '借贷新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('62', '33', 'table_field_ACCT_STATUS2_01', 'table_field_ACCT_STATUS2', '借贷新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('63', '33', 'acct_status2_01', 'acct_status2', '借贷新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('65', '34', 'table_name_SHEET_BS_SGMT_01', 'table_name_SHEET_BS_SGMT', '待删除的信息记录类型+企业身份标识类型+企业身份标识代码+报表年份+报表类型+报表类型细分+数据提供机构区段码必须在库中存在');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('66', '34', 'inf_rec_type_01', 'inf_rec_type', '待删除的信息记录类型+企业身份标识类型+企业身份标识代码+报表年份+报表类型+报表类型细分+数据提供机构区段码必须在库中存在');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('67', '34', 'table_name_SHEET_BS_SGMT_02', 'table_name_SHEET_BS_SGMT', '待删除的信息记录类型+企业身份标识类型+企业身份标识代码+报表年份+报表类型+报表类型细分+数据提供机构区段码必须在库中存在');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('68', '34', 'inf_rec_type_02', 'inf_rec_type', '待删除的信息记录类型+企业身份标识类型+企业身份标识代码+报表年份+报表类型+报表类型细分+数据提供机构区段码必须在库中存在');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('69', '34', 'table_name_SHEET_BS_SGMT_03', 'table_name_SHEET_BS_SGMT', '待删除的信息记录类型+企业身份标识类型+企业身份标识代码+报表年份+报表类型+报表类型细分+数据提供机构区段码必须在库中存在');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('70', '34', 'inf_rec_type_03', 'inf_rec_type', '待删除的信息记录类型+企业身份标识类型+企业身份标识代码+报表年份+报表类型+报表类型细分+数据提供机构区段码必须在库中存在');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('71', '34', 'table_name_SHEET_BS_SGMT_04', 'table_name_SHEET_BS_SGMT', '待删除的信息记录类型+企业身份标识类型+企业身份标识代码+报表年份+报表类型+报表类型细分+数据提供机构区段码必须在库中存在');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('72', '34', 'inf_rec_type_04', 'inf_rec_type', '待删除的信息记录类型+企业身份标识类型+企业身份标识代码+报表年份+报表类型+报表类型细分+数据提供机构区段码必须在库中存在');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('73', '34', 'table_name_SHEET_BS_SGMT_05', 'table_name_SHEET_BS_SGMT', '待删除的信息记录类型+企业身份标识类型+企业身份标识代码+报表年份+报表类型+报表类型细分+数据提供机构区段码必须在库中存在');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('74', '34', 'inf_rec_type_05', 'inf_rec_type', '待删除的信息记录类型+企业身份标识类型+企业身份标识代码+报表年份+报表类型+报表类型细分+数据提供机构区段码必须在库中存在');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('389', '100', 'ms3_01', 'ms3', '报送时点说明代码为20-账户关闭，账户类型为D1,D2,R1,R4,C1应包含还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('390', '101', 'table_name_A_not_null_02', 'table_name_A_not_null', '报送时点说明代码为32-约定还款日结算，账户类型为D1,D2,R4应包含还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('391', '101', 'table_field_code_02', 'table_field_code', '报送时点说明代码为32-约定还款日结算，账户类型为D1,D2,R4应包含还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('392', '101', 'table_field_accttype_02', 'table_field_accttype', '报送时点说明代码为32-约定还款日结算，账户类型为D1,D2,R4应包含还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('393', '101', 'accttype_02', 'accttype', '报送时点说明代码为32-约定还款日结算，账户类型为D1,D2,R4应包含还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('394', '101', 'table_field_A_pk_02', 'table_field_A_pk', '报送时点说明代码为32-约定还款日结算，账户类型为D1,D2,R4应包含还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('395', '101', 'ms1_02', 'ms1', '报送时点说明代码为32-约定还款日结算，账户类型为D1,D2,R4应包含还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('396', '101', 'ms2_02', 'ms2', '报送时点说明代码为32-约定还款日结算，账户类型为D1,D2,R4应包含还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('397', '101', 'ms3_02', 'ms3', '报送时点说明代码为32-约定还款日结算，账户类型为D1,D2,R4应包含还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('398', '102', 'table_field_code4_02', 'table_field_code4', '账户类型为R1、C1不适用32-约定还款日结算的报送时点');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('399', '102', 'table_field_accttype4_02', 'table_field_accttype4', '账户类型为R1、C1不适用32-约定还款日结算的报送时点');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('400', '102', 'accttype4_02', 'accttype4', '账户类型为R1、C1不适用32-约定还款日结算的报送时点');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('401', '102', 'ms14_02', 'ms14', '账户类型为R1、C1不适用32-约定还款日结算的报送时点');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('402', '102', 'ms15_02', 'ms15', '账户类型为R1、C1不适用32-约定还款日结算的报送时点');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('426', '106', 'accttype4_04', 'accttype4', '账户类型为R1不适用41-五级分类调整的报送时点');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('584', '128', 'table_field_D001_nomonthacctstatus_01', 'table_field_D001_nomonthacctstatus', '个人借贷原业务标识码必须是库中已有且正在使用的');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('585', '128', 'nomonthacctstatus_01', 'nomonthacctstatus', '个人借贷原业务标识码必须是库中已有且正在使用的');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('586', '129', 'table_name_B002_01', 'table_name_B002', '个人借贷新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('587', '129', 'table_name_C002_01', 'table_name_C002', '个人借贷新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('588', '129', 'table_field_B002_PK_01', 'table_field_B002_PK', '个人借贷新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('589', '129', 'table_name_D002_01', 'table_name_D002', '个人借贷新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('590', '129', 'table_field_B002_acctcode_01', 'table_field_B002_acctcode', '个人借贷新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('591', '129', 'table_field_B002_business_01', 'table_field_B002_business', '个人借贷新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('592', '129', 'business2_01', 'business2', '个人借贷新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('593', '129', 'table_field_C002_acctstatus_01', 'table_field_C002_acctstatus', '个人借贷新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('594', '129', 'acctstatus2_01', 'acctstatus2', '个人借贷新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('595', '129', 'table_field_D002_nomonthacctstatus_01', 'table_field_D002_nomonthacctstatus', '个人借贷新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('596', '129', 'nomonthacctstatus2_01', 'nomonthacctstatus2', '个人借贷新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('597', '130', 'table_name_BS_SGMT_06', 'table_name_BS_SGMT', '个人担保标识变更原业务标识码必须是库中已有且正在使用的');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('598', '130', 'table_name_LBLTY_INF_SGMT_05', 'table_name_LBLTY_INF_SGMT', '个人担保标识变更原业务标识码必须是库中已有且正在使用的');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('599', '130', 'table_pk_BS_SGMT_ID_05', 'table_pk_BS_SGMT_ID', '个人担保标识变更原业务标识码必须是库中已有且正在使用的');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('600', '130', 'table_field_ACCT_STATUS_05', 'table_field_ACCT_STATUS', '个人担保标识变更原业务标识码必须是库中已有且正在使用的');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('601', '130', 'acct_status_05', 'acct_status', '个人担保标识变更原业务标识码必须是库中已有且正在使用的');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('602', '130', 'table_field_ACCT_CODe1_05', 'table_field_ACCT_CODe1', '个人担保标识变更原业务标识码必须是库中已有且正在使用的');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('603', '131', 'table_name_BS_SGMT2_05', 'table_name_BS_SGMT2', '个人担保标识变更新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('604', '131', 'table_name_LBLTY_INF_SGMT2_05', 'table_name_LBLTY_INF_SGMT2', '个人担保标识变更新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('605', '131', 'table_pk_BS_SGMT_ID2_05', 'table_pk_BS_SGMT_ID2', '个人担保标识变更新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('606', '131', 'table_field_ACCT_STATUS2_05', 'table_field_ACCT_STATUS2', '个人担保标识变更新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('607', '131', 'acct_status2_05', 'acct_status2', '个人担保标识变更新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('608', '131', 'table_field_ACCT_CODe2_05', 'table_field_ACCT_CODe2', '个人担保标识变更新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('609', '132', 'table_name_BS_SGMT_07', 'table_name_BS_SGMT', '个人授信标识变更原业务标识码必须是库中已有且正在使用的');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('610', '132', 'table_name_LBLTY_INF_SGMT_06', 'table_name_LBLTY_INF_SGMT', '个人授信标识变更原业务标识码必须是库中已有且正在使用的');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('611', '132', 'table_pk_BS_SGMT_ID_06', 'table_pk_BS_SGMT_ID', '个人授信标识变更原业务标识码必须是库中已有且正在使用的');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('612', '132', 'table_field_ACCT_STATUS_06', 'table_field_ACCT_STATUS', '个人授信标识变更原业务标识码必须是库中已有且正在使用的');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('613', '132', 'acct_status_06', 'acct_status', '个人授信标识变更原业务标识码必须是库中已有且正在使用的');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('614', '132', 'table_field_ACCT_CODe1_06', 'table_field_ACCT_CODe1', '个人授信标识变更原业务标识码必须是库中已有且正在使用的');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('615', '133', 'table_name_BS_SGMT2_06', 'table_name_BS_SGMT2', '个人授信标识变更新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('616', '133', 'table_name_LBLTY_INF_SGMT2_06', 'table_name_LBLTY_INF_SGMT2', '个人授信标识变更新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('537', '119', 'rptdatecode_not2_01', 'rptdatecode_not2', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,42-展期发生,49-其他报送日账户类型为D1且分次放款标识为0，则不应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('339', '95', 'ms4_01', 'ms4', '报送时点说明代码为10-新开户/首次报送，账户类型为D2,C1应包含基本信息段、还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('340', '95', 'ms5_01', 'ms5', '报送时点说明代码为10-新开户/首次报送，账户类型为D2,C1应包含基本信息段、还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('341', '95', 'ms6_01', 'ms6', '报送时点说明代码为10-新开户/首次报送，账户类型为D2,C1应包含基本信息段、还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('342', '96', 'table_name_A1_not_null_02', 'table_name_A1_not_null', '报送时点说明代码为20-账户关闭，账户类型为D1,D2,R1,R4,C1应包含基本信息段、还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('343', '96', 'table_name_B1_not_null_02', 'table_name_B1_not_null', '报送时点说明代码为20-账户关闭，账户类型为D1,D2,R1,R4,C1应包含基本信息段、还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('344', '96', 'table_field_code1_02', 'table_field_code1', '报送时点说明代码为20-账户关闭，账户类型为D1,D2,R1,R4,C1应包含基本信息段、还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('345', '96', 'table_field_accttype1_02', 'table_field_accttype1', '报送时点说明代码为20-账户关闭，账户类型为D1,D2,R1,R4,C1应包含基本信息段、还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('346', '96', 'accttype1_02', 'accttype1', '报送时点说明代码为20-账户关闭，账户类型为D1,D2,R1,R4,C1应包含基本信息段、还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('347', '96', 'table_field_A1_pk_not_null_02', 'table_field_A1_pk_not_null', '报送时点说明代码为20-账户关闭，账户类型为D1,D2,R1,R4,C1应包含基本信息段、还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('348', '96', 'table_field_B1_pk_not_null_02', 'table_field_B1_pk_not_null', '报送时点说明代码为20-账户关闭，账户类型为D1,D2,R1,R4,C1应包含基本信息段、还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('349', '96', 'ms4_02', 'ms4', '报送时点说明代码为20-账户关闭，账户类型为D1,D2,R1,R4,C1应包含基本信息段、还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('350', '96', 'ms5_02', 'ms5', '报送时点说明代码为20-账户关闭，账户类型为D1,D2,R1,R4,C1应包含基本信息段、还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('351', '96', 'ms6_02', 'ms6', '报送时点说明代码为20-账户关闭，账户类型为D1,D2,R1,R4,C1应包含基本信息段、还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('352', '97', 'table_name_A2_not_null_01', 'table_name_A2_not_null', '报送时点说明代码为10-新开户/首次报送，账户类型为D1且分次放款标识为1,2，则应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('353', '97', 'table_field_A2_PK_01', 'table_field_A2_PK', '报送时点说明代码为10-新开户/首次报送，账户类型为D1且分次放款标识为1,2，则应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('354', '97', 'table_name_B2_not_null_01', 'table_name_B2_not_null', '报送时点说明代码为10-新开户/首次报送，账户类型为D1且分次放款标识为1,2，则应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('355', '97', 'table_field_A2_code2_01', 'table_field_A2_code2', '报送时点说明代码为10-新开户/首次报送，账户类型为D1且分次放款标识为1,2，则应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('356', '97', 'table_field_code2_01', 'table_field_code2', '报送时点说明代码为10-新开户/首次报送，账户类型为D1且分次放款标识为1,2，则应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('357', '97', 'table_field_accttype2_01', 'table_field_accttype2', '报送时点说明代码为10-新开户/首次报送，账户类型为D1且分次放款标识为1,2，则应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('358', '97', 'accttype2_01', 'accttype2', '报送时点说明代码为10-新开户/首次报送，账户类型为D1且分次放款标识为1,2，则应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('359', '97', 'flag2_01', 'flag2', '报送时点说明代码为10-新开户/首次报送，账户类型为D1且分次放款标识为1,2，则应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('360', '97', 'table_field_B2_pk_not_null_01', 'table_field_B2_pk_not_null', '报送时点说明代码为10-新开户/首次报送，账户类型为D1且分次放款标识为1,2，则应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('361', '97', 'ms7_01', 'ms7', '报送时点说明代码为10-新开户/首次报送，账户类型为D1且分次放款标识为1,2，则应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('362', '97', 'ms8_01', 'ms8', '报送时点说明代码为10-新开户/首次报送，账户类型为D1且分次放款标识为1,2，则应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('363', '97', 'ms9_01', 'ms9', '报送时点说明代码为10-新开户/首次报送，账户类型为D1且分次放款标识为1,2，则应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('364', '97', 'ms10_01', 'ms10', '报送时点说明代码为10-新开户/首次报送，账户类型为D1且分次放款标识为1,2，则应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('365', '98', 'table_name_A3_not_null_01', 'table_name_A3_not_null', '报送时点说明代码为10-新开户/首次报送，账户类型为R1,R4应包含基本信息段、授信额度信息段、还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('366', '98', 'table_name_B3_not_null_01', 'table_name_B3_not_null', '报送时点说明代码为10-新开户/首次报送，账户类型为R1,R4应包含基本信息段、授信额度信息段、还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('367', '98', 'table_name_C3_not_null_01', 'table_name_C3_not_null', '报送时点说明代码为10-新开户/首次报送，账户类型为R1,R4应包含基本信息段、授信额度信息段、还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('368', '98', 'table_field_code3_01', 'table_field_code3', '报送时点说明代码为10-新开户/首次报送，账户类型为R1,R4应包含基本信息段、授信额度信息段、还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('369', '98', 'table_field_accttype3_01', 'table_field_accttype3', '报送时点说明代码为10-新开户/首次报送，账户类型为R1,R4应包含基本信息段、授信额度信息段、还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('370', '98', 'accttype3_01', 'accttype3', '报送时点说明代码为10-新开户/首次报送，账户类型为R1,R4应包含基本信息段、授信额度信息段、还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('371', '98', 'table_field_A3_PK_not_null_01', 'table_field_A3_PK_not_null', '报送时点说明代码为10-新开户/首次报送，账户类型为R1,R4应包含基本信息段、授信额度信息段、还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('372', '98', 'table_field_B3_PK_not_null_01', 'table_field_B3_PK_not_null', '报送时点说明代码为10-新开户/首次报送，账户类型为R1,R4应包含基本信息段、授信额度信息段、还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('373', '98', 'table_field_C3_PK_not_null_01', 'table_field_C3_PK_not_null', '报送时点说明代码为10-新开户/首次报送，账户类型为R1,R4应包含基本信息段、授信额度信息段、还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('374', '98', 'ms11_01', 'ms11', '报送时点说明代码为10-新开户/首次报送，账户类型为R1,R4应包含基本信息段、授信额度信息段、还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('375', '98', 'ms12_01', 'ms12', '报送时点说明代码为10-新开户/首次报送，账户类型为R1,R4应包含基本信息段、授信额度信息段、还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('376', '98', 'ms13_01', 'ms13', '报送时点说明代码为10-新开户/首次报送，账户类型为R1,R4应包含基本信息段、授信额度信息段、还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('223', '74', 'm8_02', 'm8', '负债和所有者权益总计=资产总计');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('224', '75', 'm4_04', 'm4', '负债和所有者权益合计=负债合计+所有者权益合计');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('225', '75', 'm5_04', 'm5', '负债和所有者权益合计=负债合计+所有者权益合计');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('226', '75', 'm6_04', 'm6', '负债和所有者权益合计=负债合计+所有者权益合计');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('227', '75', 'table_field_CURRENT_ASSETS_04', 'table_field_CURRENT_ASSETS', '负债和所有者权益合计=负债合计+所有者权益合计');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('228', '75', 'table_field_NON_CURRENT_ASSETS_04', 'table_field_NON_CURRENT_ASSETS', '负债和所有者权益合计=负债合计+所有者权益合计');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('229', '76', 'table_field_TOTAL_LIABILITIES_AND_NET_ASSE_04', 'table_field_TOTAL_LIABILITIES_AND_NET_ASSE', '负债和所有者权益总计=资产总计');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('230', '76', 'm7_03', 'm7', '负债和所有者权益总计=资产总计');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('232', '77', 'm1_04', 'm1', '经营活动产生的现金流量净额＝经营活动现金流入小计－经营活动现金流出小计');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('233', '77', 'm2_04', 'm2', '经营活动产生的现金流量净额＝经营活动现金流入小计－经营活动现金流出小计');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('234', '77', 'm3_04', 'm3', '经营活动产生的现金流量净额＝经营活动现金流入小计－经营活动现金流出小计');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('235', '77', 'table_field_REVENUE_04', 'table_field_REVENUE', '经营活动产生的现金流量净额＝经营活动现金流入小计－经营活动现金流出小计');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('236', '77', 'table_field_EXPENDITURE_04', 'table_field_EXPENDITURE', '经营活动产生的现金流量净额＝经营活动现金流入小计－经营活动现金流出小计');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('239', '78', 'm3_05', 'm3', '投资活动产生的现金流量净额＝投资活动现金流入小计－投资活动现金流出小计');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('240', '78', 'table_field_REVENUE_05', 'table_field_REVENUE', '投资活动产生的现金流量净额＝投资活动现金流入小计－投资活动现金流出小计');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('241', '78', 'table_field_EXPENDITURE_05', 'table_field_EXPENDITURE', '投资活动产生的现金流量净额＝投资活动现金流入小计－投资活动现金流出小计');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('242', '79', 'm1_06', 'm1', '筹集活动产生的现金流量净额＝筹资活动现金流入小计－筹资活动现金流出小计');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('243', '79', 'm2_06', 'm2', '筹集活动产生的现金流量净额＝筹资活动现金流入小计－筹资活动现金流出小计');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('244', '79', 'm3_06', 'm3', '筹集活动产生的现金流量净额＝筹资活动现金流入小计－筹资活动现金流出小计');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('245', '79', 'table_field_REVENUE_06', 'table_field_REVENUE', '筹集活动产生的现金流量净额＝筹资活动现金流入小计－筹资活动现金流出小计');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('246', '79', 'table_field_EXPENDITURE_06', 'table_field_EXPENDITURE', '筹集活动产生的现金流量净额＝筹资活动现金流入小计－筹资活动现金流出小计');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('247', '80', 'm13_01', 'm13', '现金及现金等价物净增加额＝筹集活动产生的现金流量净额＋汇率变动对现金的影响＋经营活动产生的现金流量净额＋投资活动产生的现金流量净额');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('248', '80', 'm14_01', 'm14', '现金及现金等价物净增加额＝筹集活动产生的现金流量净额＋汇率变动对现金的影响＋经营活动产生的现金流量净额＋投资活动产生的现金流量净额');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('249', '80', 'm15_01', 'm15', '现金及现金等价物净增加额＝筹集活动产生的现金流量净额＋汇率变动对现金的影响＋经营活动产生的现金流量净额＋投资活动产生的现金流量净额');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('250', '80', 'm16_01', 'm16', '现金及现金等价物净增加额＝筹集活动产生的现金流量净额＋汇率变动对现金的影响＋经营活动产生的现金流量净额＋投资活动产生的现金流量净额');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('251', '80', 'm17_01', 'm17', '现金及现金等价物净增加额＝筹集活动产生的现金流量净额＋汇率变动对现金的影响＋经营活动产生的现金流量净额＋投资活动产生的现金流量净额');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('252', '80', 'table_field_CURRENT_ASSETS2_01', 'table_field_CURRENT_ASSETS2', '现金及现金等价物净增加额＝筹集活动产生的现金流量净额＋汇率变动对现金的影响＋经营活动产生的现金流量净额＋投资活动产生的现金流量净额');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('253', '80', 'table_field_NON_CURRENT_ASSETS2_01', 'table_field_NON_CURRENT_ASSETS2', '现金及现金等价物净增加额＝筹集活动产生的现金流量净额＋汇率变动对现金的影响＋经营活动产生的现金流量净额＋投资活动产生的现金流量净额');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('254', '80', 'table_field_TOTAL_EQUITY2_01', 'table_field_TOTAL_EQUITY2', '现金及现金等价物净增加额＝筹集活动产生的现金流量净额＋汇率变动对现金的影响＋经营活动产生的现金流量净额＋投资活动产生的现金流量净额');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('237', '78', 'm1_05', 'm1', '投资活动产生的现金流量净额＝投资活动现金流入小计－投资活动现金流出小计');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('238', '78', 'm2_05', 'm2', '投资活动产生的现金流量净额＝投资活动现金流入小计－投资活动现金流出小计');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('255', '80', 'table_field_FROM_INVESTING2_01', 'table_field_FROM_INVESTING2', '现金及现金等价物净增加额＝筹集活动产生的现金流量净额＋汇率变动对现金的影响＋经营活动产生的现金流量净额＋投资活动产生的现金流量净额');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('256', '81', 'm1_07', 'm1', '经营活动产生的现金流量净额=经营活动现金流入小计－经营活动现金流出小计');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('257', '81', 'm2_07', 'm2', '经营活动产生的现金流量净额=经营活动现金流入小计－经营活动现金流出小计');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('258', '81', 'm3_07', 'm3', '经营活动产生的现金流量净额=经营活动现金流入小计－经营活动现金流出小计');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('259', '81', 'table_field_REVENUE_07', 'table_field_REVENUE', '经营活动产生的现金流量净额=经营活动现金流入小计－经营活动现金流出小计');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('260', '81', 'table_field_EXPENDITURE_07', 'table_field_EXPENDITURE', '经营活动产生的现金流量净额=经营活动现金流入小计－经营活动现金流出小计');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('261', '82', 'm1_08', 'm1', '投资活动产生的现金流量净额＝投资活动现金流入小计－投资活动现金流出小计');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('262', '82', 'm2_08', 'm2', '投资活动产生的现金流量净额＝投资活动现金流入小计－投资活动现金流出小计');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('263', '82', 'm3_08', 'm3', '投资活动产生的现金流量净额＝投资活动现金流入小计－投资活动现金流出小计');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('264', '82', 'table_field_REVENUE_08', 'table_field_REVENUE', '投资活动产生的现金流量净额＝投资活动现金流入小计－投资活动现金流出小计');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('265', '82', 'table_field_EXPENDITURE_08', 'table_field_EXPENDITURE', '投资活动产生的现金流量净额＝投资活动现金流入小计－投资活动现金流出小计');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('266', '83', 'm1_09', 'm1', '筹资活动产生的现金流量净额＝筹资活动现金流入小计－筹资活动现金流出小计');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('267', '83', 'm2_09', 'm2', '筹资活动产生的现金流量净额＝筹资活动现金流入小计－筹资活动现金流出小计');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('268', '83', 'm3_09', 'm3', '筹资活动产生的现金流量净额＝筹资活动现金流入小计－筹资活动现金流出小计');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('269', '83', 'table_field_REVENUE_09', 'table_field_REVENUE', '筹资活动产生的现金流量净额＝筹资活动现金流入小计－筹资活动现金流出小计');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('270', '83', 'table_field_EXPENDITURE_09', 'table_field_EXPENDITURE', '筹资活动产生的现金流量净额＝筹资活动现金流入小计－筹资活动现金流出小计');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('271', '84', 'm13_02', 'm13', '现金及现金等价物净增加额=经营活动产生的现金流量净额+投资活动产生的现金流量净额+筹资活动产生的现金流量净额+汇率变动对现金及现金等价物的影响');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('272', '84', 'm14_02', 'm14', '现金及现金等价物净增加额=经营活动产生的现金流量净额+投资活动产生的现金流量净额+筹资活动产生的现金流量净额+汇率变动对现金及现金等价物的影响');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('273', '84', 'm15_02', 'm15', '现金及现金等价物净增加额=经营活动产生的现金流量净额+投资活动产生的现金流量净额+筹资活动产生的现金流量净额+汇率变动对现金及现金等价物的影响');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('274', '84', 'm16_02', 'm16', '现金及现金等价物净增加额=经营活动产生的现金流量净额+投资活动产生的现金流量净额+筹资活动产生的现金流量净额+汇率变动对现金及现金等价物的影响');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('275', '84', 'm17_02', 'm17', '现金及现金等价物净增加额=经营活动产生的现金流量净额+投资活动产生的现金流量净额+筹资活动产生的现金流量净额+汇率变动对现金及现金等价物的影响');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('276', '84', 'table_field_CURRENT_ASSETS2_02', 'table_field_CURRENT_ASSETS2', '现金及现金等价物净增加额=经营活动产生的现金流量净额+投资活动产生的现金流量净额+筹资活动产生的现金流量净额+汇率变动对现金及现金等价物的影响');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('403', '103', 'table_name_A_not_null_03', 'table_name_A_not_null', '报送时点说明代码为33-实际还款，账户类型为D1,D2,R4,C1应包含还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('404', '103', 'table_field_code_03', 'table_field_code', '报送时点说明代码为33-实际还款，账户类型为D1,D2,R4,C1应包含还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('405', '103', 'table_field_accttype_03', 'table_field_accttype', '报送时点说明代码为33-实际还款，账户类型为D1,D2,R4,C1应包含还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('406', '103', 'accttype_03', 'accttype', '报送时点说明代码为33-实际还款，账户类型为D1,D2,R4,C1应包含还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('407', '103', 'table_field_A_pk_03', 'table_field_A_pk', '报送时点说明代码为33-实际还款，账户类型为D1,D2,R4,C1应包含还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('408', '103', 'ms1_03', 'ms1', '报送时点说明代码为33-实际还款，账户类型为D1,D2,R4,C1应包含还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('409', '103', 'ms2_03', 'ms2', '报送时点说明代码为33-实际还款，账户类型为D1,D2,R4,C1应包含还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('410', '103', 'ms3_03', 'ms3', '报送时点说明代码为33-实际还款，账户类型为D1,D2,R4,C1应包含还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('411', '104', 'table_field_code4_03', 'table_field_code4', '账户类型为R1不适用33-实际还款的报送时点');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('412', '104', 'table_field_accttype4_03', 'table_field_accttype4', '账户类型为R1不适用33-实际还款的报送时点');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('413', '104', 'accttype4_03', 'accttype4', '账户类型为R1不适用33-实际还款的报送时点');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('414', '104', 'ms14_03', 'ms14', '账户类型为R1不适用33-实际还款的报送时点');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('415', '104', 'ms15_03', 'ms15', '账户类型为R1不适用33-实际还款的报送时点');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('416', '105', 'table_name_A_not_null_04', 'table_name_A_not_null', '报送时点说明代码为41-五级分类调整，账户类型为D1,D2,R4,C1应包含还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('417', '105', 'table_field_code_04', 'table_field_code', '报送时点说明代码为41-五级分类调整，账户类型为D1,D2,R4,C1应包含还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('418', '105', 'table_field_accttype_04', 'table_field_accttype', '报送时点说明代码为41-五级分类调整，账户类型为D1,D2,R4,C1应包含还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('419', '105', 'accttype_04', 'accttype', '报送时点说明代码为41-五级分类调整，账户类型为D1,D2,R4,C1应包含还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('420', '105', 'table_field_A_pk_04', 'table_field_A_pk', '报送时点说明代码为41-五级分类调整，账户类型为D1,D2,R4,C1应包含还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('421', '105', 'ms1_04', 'ms1', '报送时点说明代码为41-五级分类调整，账户类型为D1,D2,R4,C1应包含还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('422', '105', 'ms2_04', 'ms2', '报送时点说明代码为41-五级分类调整，账户类型为D1,D2,R4,C1应包含还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('423', '105', 'ms3_04', 'ms3', '报送时点说明代码为41-五级分类调整，账户类型为D1,D2,R4,C1应包含还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('424', '106', 'table_field_code4_04', 'table_field_code4', '账户类型为R1不适用41-五级分类调整的报送时点');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('425', '106', 'table_field_accttype4_04', 'table_field_accttype4', '账户类型为R1不适用41-五级分类调整的报送时点');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('617', '133', 'table_pk_BS_SGMT_ID2_06', 'table_pk_BS_SGMT_ID2', '个人授信标识变更新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('618', '133', 'table_field_ACCT_STATUS2_06', 'table_field_ACCT_STATUS2', '个人授信标识变更新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('619', '133', 'acct_status2_06', 'acct_status2', '个人授信标识变更新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('433', '107', 'accttype1_03', 'accttype1', '报送时点说明代码为42-展期发生，账户类型为D1,R4应包含还款表现信息段、特定交易说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('434', '107', 'table_field_A1_pk_not_null_03', 'table_field_A1_pk_not_null', '报送时点说明代码为42-展期发生，账户类型为D1,R4应包含还款表现信息段、特定交易说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('435', '107', 'table_field_B1_pk_not_null_03', 'table_field_B1_pk_not_null', '报送时点说明代码为42-展期发生，账户类型为D1,R4应包含还款表现信息段、特定交易说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('436', '107', 'ms4_03', 'ms4', '报送时点说明代码为42-展期发生，账户类型为D1,R4应包含还款表现信息段、特定交易说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('437', '107', 'ms5_03', 'ms5', '报送时点说明代码为42-展期发生，账户类型为D1,R4应包含还款表现信息段、特定交易说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('438', '107', 'ms6_03', 'ms6', '报送时点说明代码为42-展期发生，账户类型为D1,R4应包含还款表现信息段、特定交易说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('439', '108', 'table_field_code4_05', 'table_field_code4', '账户类型为D2,R1,C1不适用42-展期发生的报送时点');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('440', '108', 'table_field_accttype4_05', 'table_field_accttype4', '账户类型为D2,R1,C1不适用42-展期发生的报送时点');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('441', '108', 'accttype4_05', 'accttype4', '账户类型为D2,R1,C1不适用42-展期发生的报送时点');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('442', '108', 'ms14_05', 'ms14', '账户类型为D2,R1,C1不适用42-展期发生的报送时点');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('443', '108', 'ms15_05', 'ms15', '账户类型为D2,R1,C1不适用42-展期发生的报送时点');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('444', '109', 'table_name_A_not_null_05', 'table_name_A_not_null', '报送时点说明代码为49-其他报送日，账户类型为D1,D2,R1,R4,C1应包含还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('445', '109', 'table_field_code_05', 'table_field_code', '报送时点说明代码为49-其他报送日，账户类型为D1,D2,R1,R4,C1应包含还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('446', '109', 'table_field_accttype_05', 'table_field_accttype', '报送时点说明代码为49-其他报送日，账户类型为D1,D2,R1,R4,C1应包含还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('447', '109', 'accttype_05', 'accttype', '报送时点说明代码为49-其他报送日，账户类型为D1,D2,R1,R4,C1应包含还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('448', '109', 'table_field_A_pk_05', 'table_field_A_pk', '报送时点说明代码为49-其他报送日，账户类型为D1,D2,R1,R4,C1应包含还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('449', '109', 'ms1_05', 'ms1', '报送时点说明代码为49-其他报送日，账户类型为D1,D2,R1,R4,C1应包含还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('450', '109', 'ms2_05', 'ms2', '报送时点说明代码为49-其他报送日，账户类型为D1,D2,R1,R4,C1应包含还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('451', '109', 'ms3_05', 'ms3', '报送时点说明代码为49-其他报送日，账户类型为D1,D2,R1,R4,C1应包含还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('452', '110', 'table_name_A_null_01', 'table_name_A_null', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算，49-其他报送日且账户类型为D1,R1,R4不应包含初始债权说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('453', '110', 'table_field_A_pk__null_01', 'table_field_A_pk_null', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算，49-其他报送日且账户类型为D1,R1,R4不应包含初始债权说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('454', '110', 'table_field_A_rptdatecode_not_01', 'table_field_A_rptdatecode_not', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算，49-其他报送日且账户类型为D1,R1,R4不应包含初始债权说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('455', '110', 'rptdatecode_not_01', 'rptdatecode_not', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算，49-其他报送日且账户类型为D1,R1,R4不应包含初始债权说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('456', '110', 'table_field_A_accttype_not_01', 'table_field_A_accttype_not', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算，49-其他报送日且账户类型为D1,R1,R4不应包含初始债权说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('457', '110', 'accttype_not_01', 'accttype_not', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算，49-其他报送日且账户类型为D1,R1,R4不应包含初始债权说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('458', '110', 'ms16_01', 'ms16', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算，49-其他报送日且账户类型为D1,R1,R4不应包含初始债权说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('459', '110', 'ms17_01', 'ms17', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算，49-其他报送日且账户类型为D1,R1,R4不应包含初始债权说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('460', '110', 'ms18_01', 'ms18', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算，49-其他报送日且账户类型为D1,R1,R4不应包含初始债权说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('461', '111', 'table_name_A_null_02', 'table_name_A_null', '报送时点说明代码为33-实际还款,42-展期发生且账户类型为D1,R4不应包含初始债权说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('462', '111', 'table_field_A_pk_null_02', 'table_field_A_pk_null', '报送时点说明代码为33-实际还款,42-展期发生且账户类型为D1,R4不应包含初始债权说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('463', '111', 'table_field_A_rptdatecode_not_02', 'table_field_A_rptdatecode_not', '报送时点说明代码为33-实际还款,42-展期发生且账户类型为D1,R4不应包含初始债权说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('464', '111', 'rptdatecode_not_02', 'rptdatecode_not', '报送时点说明代码为33-实际还款,42-展期发生且账户类型为D1,R4不应包含初始债权说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('465', '111', 'table_field_A_accttype_not_02', 'table_field_A_accttype_not', '报送时点说明代码为33-实际还款,42-展期发生且账户类型为D1,R4不应包含初始债权说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('466', '111', 'accttype_not_02', 'accttype_not', '报送时点说明代码为33-实际还款,42-展期发生且账户类型为D1,R4不应包含初始债权说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('467', '111', 'ms16_02', 'ms16', '报送时点说明代码为33-实际还款,42-展期发生且账户类型为D1,R4不应包含初始债权说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('468', '111', 'ms17_02', 'ms17', '报送时点说明代码为33-实际还款,42-展期发生且账户类型为D1,R4不应包含初始债权说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('469', '111', 'ms18_02', 'ms18', '报送时点说明代码为33-实际还款,42-展期发生且账户类型为D1,R4不应包含初始债权说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('470', '112', 'table_name_A_null_03', 'table_name_A_null', '报送时点说明代码为41-五级分类调整且账户类型为R1不应包含初始债权说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('471', '112', 'table_field_A_pk_null_03', 'table_field_A_pk_null', '报送时点说明代码为41-五级分类调整且账户类型为R1不应包含初始债权说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('472', '112', 'table_field_A_rptdatecode_not_03', 'table_field_A_rptdatecode_not', '报送时点说明代码为41-五级分类调整且账户类型为R1不应包含初始债权说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('473', '112', 'rptdatecode_not_03', 'rptdatecode_not', '报送时点说明代码为41-五级分类调整且账户类型为R1不应包含初始债权说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('474', '112', 'table_field_A_accttype_not_03', 'table_field_A_accttype_not', '报送时点说明代码为41-五级分类调整且账户类型为R1不应包含初始债权说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('475', '112', 'accttype_not_03', 'accttype_not', '报送时点说明代码为41-五级分类调整且账户类型为R1不应包含初始债权说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('476', '112', 'ms16_03', 'ms16', '报送时点说明代码为41-五级分类调整且账户类型为R1不应包含初始债权说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('477', '112', 'ms17_03', 'ms17', '报送时点说明代码为41-五级分类调整且账户类型为R1不应包含初始债权说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('478', '112', 'ms18_03', 'ms18', '报送时点说明代码为41-五级分类调整且账户类型为R1不应包含初始债权说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('479', '113', 'table_name_A_null_04', 'table_name_A_null', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为D2不应包含抵质押物信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('480', '113', 'table_field_A_pk_null_04', 'table_field_A_pk_null', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为D2不应包含抵质押物信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('481', '113', 'table_field_A_rptdatecode_not_04', 'table_field_A_rptdatecode_not', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为D2不应包含抵质押物信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('482', '113', 'rptdatecode_not_04', 'rptdatecode_not', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为D2不应包含抵质押物信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('483', '113', 'table_field_A_accttype_not_04', 'table_field_A_accttype_not', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为D2不应包含抵质押物信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('484', '113', 'accttype_not_04', 'accttype_not', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为D2不应包含抵质押物信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('485', '113', 'ms16_04', 'ms16', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为D2不应包含抵质押物信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('486', '113', 'ms17_04', 'ms17', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为D2不应包含抵质押物信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('487', '113', 'ms18_04', 'ms18', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为D2不应包含抵质押物信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('488', '114', 'table_name_A_null_05', 'table_name_A_null', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为D2不应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('489', '114', 'table_field_A_pk_null_05', 'table_field_A_pk_null', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为D2不应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('490', '114', 'table_field_A_rptdatecode_not_05', 'table_field_A_rptdatecode_not', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为D2不应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('491', '114', 'rptdatecode_not_05', 'rptdatecode_not', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为D2不应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('492', '114', 'table_field_A_accttype_not_05', 'table_field_A_accttype_not', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为D2不应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('493', '114', 'accttype_not_05', 'accttype_not', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为D2不应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('494', '114', 'ms16_05', 'ms16', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为D2不应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('495', '114', 'ms17_05', 'ms17', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为D2不应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('496', '114', 'ms18_05', 'ms18', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为D2不应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('497', '115', 'table_name_A_null_06', 'table_name_A_null', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含抵质押物信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('498', '115', 'table_field_A_pk_null_06', 'table_field_A_pk_null', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含抵质押物信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('499', '115', 'table_field_A_rptdatecode_not_06', 'table_field_A_rptdatecode_not', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含抵质押物信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('500', '115', 'rptdatecode_not_06', 'rptdatecode_not', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含抵质押物信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('501', '115', 'table_field_A_accttype_not_06', 'table_field_A_accttype_not', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含抵质押物信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('502', '115', 'accttype_not_06', 'accttype_not', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含抵质押物信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('503', '115', 'ms16_06', 'ms16', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含抵质押物信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('504', '115', 'ms17_06', 'ms17', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含抵质押物信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('222', '74', 'm7_02', 'm7', '负债和所有者权益总计=资产总计');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2001', '2000', 'table_name_C_001', 'table_name_C', '报告时点说明代码为10-新开户/首次上报，至少应出现账户基本信息段、在保责任信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2002', '2000', 'A_CODE_001', 'A_CODE', '报告时点说明代码为10-新开户/首次上报，至少应出现账户基本信息段、在保责任信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2003', '2001', 'table_name_B2_001', 'table_name_B2', '报告时点说明代码为20-账户关闭,30-在保责任变化,40-五级分类调整时，至少应出现在保责任信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2004', '2001', 'A_CODE2_001', 'A_CODE2', '报告时点说明代码为20-账户关闭,30-在保责任变化,41-五级分类调整时，至少应出现在保责任信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2005', '2002', 'table_name_A_002', 'table_name_A', '报告时点说明代码为10-新开户/首次上报且反担保方式为1-保证时，应出现相关还款责任人信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2006', '2002', 'table_name_B_002', 'table_name_B', '报告时点说明代码为10-新开户/首次上报且反担保方式为2-保证时，应出现相关还款责任人信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2007', '2002', 'table_field_A_CODE_002', 'table_field_A_CODE', '报告时点说明代码为10-新开户/首次上报且反担保方式为3-保证时，应出现相关还款责任人信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2008', '2002', 'A_CODE3_002', 'A_CODE3', '报告时点说明代码为10-新开户/首次上报且反担保方式为4-保证时，应出现相关还款责任人信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2009', '2002', 'C_MODE_002', 'C_MODE', '报告时点说明代码为10-新开户/首次上报且反担保方式为5-保证时，应出现相关还款责任人信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2010', '2003', 'table_name_A_003', 'table_name_A', '报告时点说明代码为50-其他信息变化时，不包括在保责任信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2011', '2003', 'table_name_A_ID_003', 'table_name_A_ID', '报告时点说明代码为51-其他信息变化时，不包括在保责任信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2012', '2003', 'table_field_A_003', 'table_field_A', '报告时点说明代码为52-其他信息变化时，不包括在保责任信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2013', '2003', 'A_CODE4_003', 'A_CODE4', '报告时点说明代码为53-其他信息变化时，不包括在保责任信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2014', '2004', 'table_field_DUE_004', 'table_field_DUE', '开户日期应不晚于到期日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2015', '2005', 'table_field_A_005', 'table_field_A', '如果账户状态为2-关闭，则账户关闭日期不能为空值');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2016', '2005', 'A_STATUS_005', 'A_STATUS', '如果账户状态为2-关闭，则账户关闭日期不能为空值');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2017', '2006', 'table_field_TYPE_006', 'table_field_TYPE', '当还款责任人类型为2-反担保人时，联保标志、保证合同编号不应为空');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2018', '2006', 'table_field_WARTY_SIGN_006', 'table_field_WARTY_SIGN', '当还款责任人类型为2-反担保人时，联保标志、保证合同编号不应为空');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2019', '2006', 'table_field_MAX_GUAR_MCC_006', 'table_field_MAX_GUAR_MCC', '当还款责任人类型为2-反担保人时，联保标志、保证合同编号不应为空');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2020', '2007', 'table_name_A_007', 'table_name_A', '债务人两标与责任人两标不能相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2021', '2007', 'table_name_A_ID_007', 'table_name_A_ID', '债务人两标与责任人两标不能相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2022', '2007', 'table_field_ID_TYPE_007', 'table_field_ID_TYPE', '债务人两标与责任人两标不能相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2023', '2007', 'table_field_CERT_TYPE_007', 'table_field_CERT_TYPE', '债务人两标与责任人两标不能相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2024', '2007', 'table_field_ID_NUM_007', 'table_field_ID_NUM', '债务人两标与责任人两标不能相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2025', '2008', 'table_name_B_0001', 'table_name_B', '对于个人基本信息记录，若报告时点说明代码为10-新增客户/首次上报，该记录至少包含基本概况信息段、教育信息段、居住地址段、通讯地址段、婚姻信息段、职业信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2026', '2008', 'table_name_C_0001', 'table_name_C', '对于个人基本信息记录，若报告时点说明代码为11-新增客户/首次上报，该记录至少包含基本概况信息段、教育信息段、居住地址段、通讯地址段、婚姻信息段、职业信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2027', '2008', 'table_name_D_0001', 'table_name_D', '对于个人基本信息记录，若报告时点说明代码为12-新增客户/首次上报，该记录至少包含基本概况信息段、教育信息段、居住地址段、通讯地址段、婚姻信息段、职业信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('523', '117', 'ms18_08', 'ms18', '报送时点说明代码为20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含初始债权说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('524', '118', 'table_name_A_null_09', 'table_name_A_null', '报送时点说明代码为20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含相关还款责任人段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('525', '118', 'table_field_A_pk_null_09', 'table_field_A_pk_null', '报送时点说明代码为20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含相关还款责任人段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('526', '118', 'table_field_A_rptdatecode_not_09', 'table_field_A_rptdatecode_not', '报送时点说明代码为20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含相关还款责任人段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('527', '118', 'rptdatecode_not_09', 'rptdatecode_not', '报送时点说明代码为20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含相关还款责任人段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('528', '118', 'table_field_A_accttype_not_09', 'table_field_A_accttype_not', '报送时点说明代码为20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含相关还款责任人段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('529', '118', 'accttype_not_09', 'accttype_not', '报送时点说明代码为20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含相关还款责任人段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('530', '118', 'ms16_09', 'ms16', '报送时点说明代码为20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含相关还款责任人段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('531', '118', 'ms17_09', 'ms17', '报送时点说明代码为20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含相关还款责任人段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('532', '118', 'ms18_09', 'ms18', '报送时点说明代码为20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含相关还款责任人段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('533', '119', 'table_name_A2_null_01', 'table_name_A2_null', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,42-展期发生,49-其他报送日账户类型为D1且分次放款标识为0，则不应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('534', '119', 'table_name_B2_null_01', 'table_name_B2_null', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,42-展期发生,49-其他报送日账户类型为D1且分次放款标识为0，则不应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('535', '119', 'table_field_A2_pk_null_01', 'table_field_A2_pk_null', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,42-展期发生,49-其他报送日账户类型为D1且分次放款标识为0，则不应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('536', '119', 'table_field_A2_rptdatecode_not_01', 'table_field_A2_rptdatecode_not', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,42-展期发生,49-其他报送日账户类型为D1且分次放款标识为0，则不应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('377', '99', 'table_field_code4_01', 'table_field_code4', '账户类型为R1、R4、C1，不适用31-开户后放款的报送时点');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('378', '99', 'table_field_accttype4_01', 'table_field_accttype4', '账户类型为R1、R4、C1，不适用31-开户后放款的报送时点');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('379', '99', 'accttype4_01', 'accttype4', '账户类型为R1、R4、C1，不适用31-开户后放款的报送时点');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('741', '711', 'ARLPCERTTYPE_BELONGTO_INFOIDTYPE2', 'num02', '相关还款责任人身份标识类型(2-组织机构)');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('742', '712', 'NUM_2', 'num2', '还款责任人类型:2-反担保人');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('743', '712', 'MAX_GUAR_MCC_Column', 'table_field_1', '保证合同编号');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('744', '712', 'WARTY_SIGN_Column', 'table_field_2', '联保标志');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('745', '713', 'EEF_GUAR_RLT_REPYMT_INF_SGMT_Table', 'table_name_1', '企业担保账户在保责任信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('746', '713', 'EEA_GUAR_ACCT_BS_SGMT_ID_Column', 'table_field_4', 'EEA_GUAR_ACCT_BS_SGMT表主键');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('747', '713', 'REPAY_PRD_Column', 'table_field_1', '余额变化日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('748', '713', 'FIVE_CATE_ADJ_DATE_Column', 'table_field_2', '五级分类认定日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('749', '713', 'CLOSE_DATE_Column', 'table_field_3', '账户关闭日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('750', '714', 'EEA_GUAR_ACCT_BS_SGMT_Table', 'table_name_1', '企业担保账户基础段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('540', '119', 'table_field_A2_accttype_not_01', 'table_field_A2_accttype_not', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,42-展期发生,49-其他报送日账户类型为D1且分次放款标识为0，则不应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('541', '119', 'accttype_not2_01', 'accttype_not2', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,42-展期发生,49-其他报送日账户类型为D1且分次放款标识为0，则不应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('309', '91', 'm20_05', 'm20', '抵质押合同生效日期不晚于合同到期日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('542', '119', 'ms19_01', 'ms19', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,42-展期发生,49-其他报送日账户类型为D1且分次放款标识为0，则不应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('543', '119', 'ms20_01', 'ms20', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,42-展期发生,49-其他报送日账户类型为D1且分次放款标识为0，则不应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('544', '119', 'ms21_01', 'ms21', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,42-展期发生,49-其他报送日账户类型为D1且分次放款标识为0，则不应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('545', '119', 'ms22_01', 'ms22', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,42-展期发生,49-其他报送日账户类型为D1且分次放款标识为0，则不应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('546', '120', 'table_name_A2_null_02', 'table_name_A2_null', '报送时点说明代码为31-开户后放款账户类型为D1且分次放款标识为2，则不应包含初始债权说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('547', '120', 'table_name_B2_null_02', 'table_name_B2_null', '报送时点说明代码为31-开户后放款账户类型为D1且分次放款标识为2，则不应包含初始债权说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('548', '120', 'table_field_A2_pk_null_02', 'table_field_A2_pk_null', '报送时点说明代码为31-开户后放款账户类型为D1且分次放款标识为2，则不应包含初始债权说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('549', '120', 'table_field_A2_rptdatecode_not_02', 'table_field_A2_rptdatecode_not', '报送时点说明代码为31-开户后放款账户类型为D1且分次放款标识为2，则不应包含初始债权说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('550', '120', 'rptdatecode_not2_02', 'rptdatecode_not2', '报送时点说明代码为31-开户后放款账户类型为D1且分次放款标识为2，则不应包含初始债权说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('551', '120', 'table_field_B2_flag_not_02', 'table_field_B2_flag_not', '报送时点说明代码为31-开户后放款账户类型为D1且分次放款标识为2，则不应包含初始债权说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('552', '120', 'flag_not2_02', 'flag_not2', '报送时点说明代码为31-开户后放款账户类型为D1且分次放款标识为2，则不应包含初始债权说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('553', '120', 'table_field_A2_accttype_not_02', 'table_field_A2_accttype_not', '报送时点说明代码为31-开户后放款账户类型为D1且分次放款标识为2，则不应包含初始债权说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('554', '120', 'accttype_not2_02', 'accttype_not2', '报送时点说明代码为31-开户后放款账户类型为D1且分次放款标识为2，则不应包含初始债权说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('555', '120', 'ms19_02', 'ms19', '报送时点说明代码为31-开户后放款账户类型为D1且分次放款标识为2，则不应包含初始债权说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('556', '120', 'ms20_02', 'ms20', '报送时点说明代码为31-开户后放款账户类型为D1且分次放款标识为2，则不应包含初始债权说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('557', '120', 'ms21_02', 'ms21', '报送时点说明代码为31-开户后放款账户类型为D1且分次放款标识为2，则不应包含初始债权说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('558', '120', 'ms22_02', 'ms22', '报送时点说明代码为31-开户后放款账户类型为D1且分次放款标识为2，则不应包含初始债权说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('559', '121', 'table_name_A5_not_null_01', 'table_name_A5_not_null', '账户类型为D1，分次放款标识为0、1则不适用31-开户后放款');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('560', '121', 'table_field_A5_PK_01', 'table_field_A5_PK', '账户类型为D1，分次放款标识为0、1则不适用31-开户后放款');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('561', '121', 'table_field_A5_code5_01', 'table_field_A5_code5', '账户类型为D1，分次放款标识为0、1则不适用31-开户后放款');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('562', '121', 'table_field_code5_01', 'table_field_code5', '账户类型为D1，分次放款标识为0、1则不适用31-开户后放款');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('563', '121', 'table_field_accttype5_01', 'table_field_accttype5', '账户类型为D1，分次放款标识为0、1则不适用31-开户后放款');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('564', '121', 'accttype5_01', 'accttype5', '账户类型为D1，分次放款标识为0、1则不适用31-开户后放款');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('565', '121', 'flag5_01', 'flag5', '账户类型为D1，分次放款标识为0、1则不适用31-开户后放款');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('566', '122', 'table_field_ACCT_CODE_08', 'table_field_ACCT_CODE', '对于个人借贷账户整笔删除请求记录，待删除业务标识码必须在库中存在');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('567', '122', 'table_name_EDA_08', 'table_name_EDA', '对于个人借贷账户整笔删除请求记录，待删除业务标识码必须在库中存在');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('568', '123', 'table_field_ACCT_CODE_09', 'table_field_ACCT_CODE', '对于个人授信协议整笔删除请求记录，待删除业务标识码必须在库中存在');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('569', '123', 'table_name_EDA_09', 'table_name_EDA', '对于个人授信协议整笔删除请求记录，待删除业务标识码必须在库中存在');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('570', '124', 'table_field_ACCT_CODE_10', 'table_field_ACCT_CODE', '对于个人担保账户整笔删除请求记录，待删除业务标识码必须在库中存在');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('571', '124', 'table_name_EDA_10', 'table_name_EDA', '对于个人担保账户整笔删除请求记录，待删除业务标识码必须在库中存在');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('572', '125', 'table_field_OD_BNES_CODE_05', 'table_field_OD_BNES_CODE', '个人借贷标识变更原业务标识码和新业务标识码不能相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('573', '126', 'table_field_OD_BNES_CODE_06', 'table_field_OD_BNES_CODE', '个人授信标识变更原业务标识码和新业务标识码不能相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('574', '127', 'table_field_OD_BNES_CODE_07', 'table_field_OD_BNES_CODE', '个人担保标识变更原业务标识码和新业务标识码不能相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('575', '128', 'table_name_B001_01', 'table_name_B001', '个人借贷原业务标识码必须是库中已有且正在使用的');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('576', '128', 'table_name_C001_01', 'table_name_C001', '个人借贷原业务标识码必须是库中已有且正在使用的');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('577', '128', 'table_field_B001_PK_01', 'table_field_B001_PK', '个人借贷原业务标识码必须是库中已有且正在使用的');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('578', '128', 'table_name_D001_01', 'table_name_D001', '个人借贷原业务标识码必须是库中已有且正在使用的');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('579', '128', 'table_field_B001_acctcode_01', 'table_field_B001_acctcode', '个人借贷原业务标识码必须是库中已有且正在使用的');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('580', '128', 'table_field_B001_business_01', 'table_field_B001_business', '个人借贷原业务标识码必须是库中已有且正在使用的');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('581', '128', 'business_01', 'business', '个人借贷原业务标识码必须是库中已有且正在使用的');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('582', '128', 'table_field_C001_acctstatus_01', 'table_field_C001_acctstatus', '个人借贷原业务标识码必须是库中已有且正在使用的');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('583', '128', 'acctstatus_01', 'acctstatus', '个人借贷原业务标识码必须是库中已有且正在使用的');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2086', '2019', 'ms_field1_1003', 'ms_field1', '当报告时点说明代码为32-月结日账户关闭时：除基础段外，至少还应包括月度表现信息段，账户类型不能为C1。');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2087', '2019', 'ms_field2_1003', 'ms_field2', '当报告时点说明代码为32-月结日账户关闭时：除基础段外，至少还应包括月度表现信息段，账户类型不能为C1。');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2088', '2019', 'ms_field3_1003', 'ms_field3', '当报告时点说明代码为32-月结日账户关闭时：除基础段外，至少还应包括月度表现信息段，账户类型不能为C1。');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2089', '2020', 'table_name2_B_1004', 'table_name2_B', '当报告时点说明代码为40-收回逾期款项时：除基础段外，至少还应包含非月度表现信息段；账户类型不能为R3');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2090', '2020', 'a1_field1_1004', 'a1_field1', '当报告时点说明代码为40-收回逾期款项时：除基础段外，至少还应包含非月度表现信息段；账户类型不能为R3');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2091', '2020', 'a1_field_type_1004', 'a1_field_type', '当报告时点说明代码为40-收回逾期款项时：除基础段外，至少还应包含非月度表现信息段；账户类型不能为R3');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2092', '2020', 'a1_field2_1004', 'a1_field2', '当报告时点说明代码为40-收回逾期款项时：除基础段外，至少还应包含非月度表现信息段；账户类型不能为R3');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2093', '2020', 'ms_field1_1004', 'ms_field1', '当报告时点说明代码为40-收回逾期款项时：除基础段外，至少还应包含非月度表现信息段；账户类型不能为R3');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2094', '2020', 'ms_field2_1004', 'ms_field2', '当报告时点说明代码为40-收回逾期款项时：除基础段外，至少还应包含非月度表现信息段；账户类型不能为R3');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2095', '2020', 'ms_field3_1004', 'ms_field3', '当报告时点说明代码为40-收回逾期款项时：除基础段外，至少还应包含非月度表现信息段；账户类型不能为R3');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2096', '2021', 'table_name2_B_1005', 'table_name2_B', '当报告时点说明代码为20-账户关闭时，除基础段，若账户类型为D1/R1/R2/R3/R4，还应包含月度表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2097', '2021', 'a1_field1_1005', 'a1_field1', '当报告时点说明代码为20-账户关闭时，除基础段，若账户类型为D1/R1/R2/R3/R4，还应包含月度表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('620', '133', 'table_field_ACCT_CODe2_06', 'table_field_ACCT_CODe2', '个人授信标识变更新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2234', '2039', 'field2_2001', 'field2', '若“还款方式”代码以“2”开头，则“还款期数”必须为 2。');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2235', '2040', 'table_field1_2002', 'table_field1', '“开户日期”应不晚于“到期日期”');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2114', '2023', 'a1_field_type_1007', 'a1_field_type', '当报告时点说明代码为10-新开户时，至少包含基本信息段：若账户类型为R2，还应包含月度表现段。如果基本信息段中的借贷业务种类细分不是大额专项分期卡，还应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2115', '2023', 'a1_field2_1007', 'a1_field2', '当报告时点说明代码为10-新开户时，至少包含基本信息段：若账户类型为R2，还应包含月度表现段。如果基本信息段中的借贷业务种类细分不是大额专项分期卡，还应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2116', '2023', 'b1_field1_1007', 'b1_field1', '当报告时点说明代码为10-新开户时，至少包含基本信息段：若账户类型为R2，还应包含月度表现段。如果基本信息段中的借贷业务种类细分不是大额专项分期卡，还应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2117', '2023', 'lines_1007', 'lines', '当报告时点说明代码为10-新开户时，至少包含基本信息段：若账户类型为R2，还应包含月度表现段。如果基本信息段中的借贷业务种类细分不是大额专项分期卡，还应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2118', '2023', 'ms3_field1_1007', 'ms3_field1', '当报告时点说明代码为10-新开户时，至少包含基本信息段：若账户类型为R2，还应包含月度表现段。如果基本信息段中的借贷业务种类细分不是大额专项分期卡，还应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2119', '2023', 'ms3_field2_1007', 'ms3_field2', '当报告时点说明代码为10-新开户时，至少包含基本信息段：若账户类型为R2，还应包含月度表现段。如果基本信息段中的借贷业务种类细分不是大额专项分期卡，还应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2120', '2023', 'ms3_field3_1007', 'ms3_field3', '当报告时点说明代码为10-新开户时，至少包含基本信息段：若账户类型为R2，还应包含月度表现段。如果基本信息段中的借贷业务种类细分不是大额专项分期卡，还应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2248', '2046', 'table_field1_2008', 'table_field1', '若“账户状态”为“6-未激活”时，则“余额”、“当前逾期期数”、“当前逾期总额”必须为 0，“当前还款状态”必须为“*”（若此账户没有上述数据项，则不校验此数据项）。');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2249', '2046', 'field2_2008', 'field2', '若“账户状态”为“6-未激活”时，则“余额”、“当前逾期期数”、“当前逾期总额”必须为 0，“当前还款状态”必须为“*”（若此账户没有上述数据项，则不校验此数据项）。');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2250', '2046', 'table_field2_2008', 'table_field2', '若“账户状态”为“6-未激活”时，则“余额”、“当前逾期期数”、“当前逾期总额”必须为 0，“当前还款状态”必须为“*”（若此账户没有上述数据项，则不校验此数据项）。');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2251', '2046', 'table_field3_2008', 'table_field3', '若“账户状态”为“6-未激活”时，则“余额”、“当前逾期期数”、“当前逾期总额”必须为 0，“当前还款状态”必须为“*”（若此账户没有上述数据项，则不校验此数据项）。');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2252', '2046', 'table_field4_2008', 'table_field4', '若“账户状态”为“6-未激活”时，则“余额”、“当前逾期期数”、“当前逾期总额”必须为 0，“当前还款状态”必须为“*”（若此账户没有上述数据项，则不校验此数据项）。');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2253', '2046', 'field3_2008', 'field3', '若“账户状态”为“6-未激活”时，则“余额”、“当前逾期期数”、“当前逾期总额”必须为 0，“当前还款状态”必须为“*”（若此账户没有上述数据项，则不校验此数据项）。');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2254', '2047', 'field1_2009', 'field1', '若“当前还款状态”为“*”，则“本月应还款金额”、“当前逾期期数”、“当前逾期总额”、“本期账单余额”必须为 0（若此账户没有上述数据项，则不校验此数据项）');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2255', '2047', 'table_field1_2009', 'table_field1', '若“当前还款状态”为“*”，则“本月应还款金额”、“当前逾期期数”、“当前逾期总额”、“本期账单余额”必须为 0（若此账户没有上述数据项，则不校验此数据项）');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2256', '2047', 'field2_2009', 'field2', '若“当前还款状态”为“*”，则“本月应还款金额”、“当前逾期期数”、“当前逾期总额”、“本期账单余额”必须为 0（若此账户没有上述数据项，则不校验此数据项）');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2257', '2047', 'table_field2_2009', 'table_field2', '若“当前还款状态”为“*”，则“本月应还款金额”、“当前逾期期数”、“当前逾期总额”、“本期账单余额”必须为 0（若此账户没有上述数据项，则不校验此数据项）');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2258', '2047', 'table_field3_2009', 'table_field3', '若“当前还款状态”为“*”，则“本月应还款金额”、“当前逾期期数”、“当前逾期总额”、“本期账单余额”必须为 0（若此账户没有上述数据项，则不校验此数据项）');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2259', '2047', 'table_field4_2009', 'table_field4', '若“当前还款状态”为“*”，则“本月应还款金额”、“当前逾期期数”、“当前逾期总额”、“本期账单余额”必须为 0（若此账户没有上述数据项，则不校验此数据项）');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('972', '761', 'MDFC_SGMT_CODE_Column', 'table_field_1', '待更正段段标');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2260', '2047', 'field3_2009', 'field3', '若“当前还款状态”为“*”，则“本月应还款金额”、“当前逾期期数”、“当前逾期总额”、“本期账单余额”必须为 0（若此账户没有上述数据项，则不校验此数据项）');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2261', '2048', 'field1_2010', 'field1', '若“当前还款状态”为“N”或“M”，则“当前逾期期数”、“当前逾期总额”必须为0（若此账户没有上述数据项，则不校验此数据项）');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2262', '2048', 'table_field1_2010', 'table_field1', '若“当前还款状态”为“N”或“M”，则“当前逾期期数”、“当前逾期总额”必须为0（若此账户没有上述数据项，则不校验此数据项）');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2181', '2031', 'table_name2_C_1015', 'table_name2_C', '当报告时点说明代码为10-新开户时：若账户类型为D1/R1/R3/R4，不应包含初始债权说明段、非月度表现信息段、特殊交易说明段、大额专项分期信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2182', '2031', 'table_name2_D_1015', 'table_name2_D', '当报告时点说明代码为10-新开户时：若账户类型为D1/R1/R3/R4，不应包含初始债权说明段、非月度表现信息段、特殊交易说明段、大额专项分期信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2183', '2031', 'table_name2_E_1015', 'table_name2_E', '当报告时点说明代码为10-新开户时：若账户类型为D1/R1/R3/R4，不应包含初始债权说明段、非月度表现信息段、特殊交易说明段、大额专项分期信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('505', '115', 'ms18_06', 'ms18', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含抵质押物信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('506', '116', 'table_name_A_null_07', 'table_name_A_null', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2184', '2031', 'a1_field_type1_1015', 'a1_field_type1', '当报告时点说明代码为10-新开户时：若账户类型为D1/R1/R3/R4，不应包含初始债权说明段、非月度表现信息段、特殊交易说明段、大额专项分期信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2185', '2031', 'a1_field1_1015', 'a1_field1', '当报告时点说明代码为10-新开户时：若账户类型为D1/R1/R3/R4，不应包含初始债权说明段、非月度表现信息段、特殊交易说明段、大额专项分期信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2186', '2031', 'a1_field2_1015', 'a1_field2', '当报告时点说明代码为10-新开户时：若账户类型为D1/R1/R3/R4，不应包含初始债权说明段、非月度表现信息段、特殊交易说明段、大额专项分期信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2187', '2031', 'ms9_field1_1015', 'ms9_field1', '当报告时点说明代码为10-新开户时：若账户类型为D1/R1/R3/R4，不应包含初始债权说明段、非月度表现信息段、特殊交易说明段、大额专项分期信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2188', '2032', 'table_name2_B_1016', 'table_name2_B', '10-新开户,20-账户关闭时若账户类型为C1，不应包含月度表现段、大额专项分期信息段、抵质押物信息段、授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2189', '2032', 'table_name2_C_1016', 'table_name2_C', '10-新开户,20-账户关闭时若账户类型为C1，不应包含月度表现段、大额专项分期信息段、抵质押物信息段、授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2190', '2032', 'table_name2_D_1016', 'table_name2_D', '10-新开户,20-账户关闭时若账户类型为C1，不应包含月度表现段、大额专项分期信息段、抵质押物信息段、授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2191', '2032', 'table_name2_E_1016', 'table_name2_E', '10-新开户,20-账户关闭时若账户类型为C1，不应包含月度表现段、大额专项分期信息段、抵质押物信息段、授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2192', '2032', 'a1_field_type1_1016', 'a1_field_type1', '10-新开户,20-账户关闭时若账户类型为C1，不应包含月度表现段、大额专项分期信息段、抵质押物信息段、授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2193', '2032', 'a1_field1_1016', 'a1_field1', '10-新开户,20-账户关闭时若账户类型为C1，不应包含月度表现段、大额专项分期信息段、抵质押物信息段、授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2194', '2032', 'a1_field2_1016', 'a1_field2', '10-新开户,20-账户关闭时若账户类型为C1，不应包含月度表现段、大额专项分期信息段、抵质押物信息段、授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2195', '2032', 'ms9_field1_1016', 'ms9_field1', '10-新开户,20-账户关闭时若账户类型为C1，不应包含月度表现段、大额专项分期信息段、抵质押物信息段、授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2196', '2033', 'table_name2_B_1017', 'table_name2_B', '当报告时点说明代码为40-收回逾期款项时：若账户类型为D1/R1/R2/R4还不应包含初债权说明段、特殊交易说明段、基本信息段、相关还款责任人段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2197', '2033', 'table_name2_C_1017', 'table_name2_C', '当报告时点说明代码为40-收回逾期款项时：若账户类型为D1/R1/R2/R4还不应包含初债权说明段、特殊交易说明段、基本信息段、相关还款责任人段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2198', '2033', 'table_name2_D_1017', 'table_name2_D', '当报告时点说明代码为40-收回逾期款项时：若账户类型为D1/R1/R2/R4还不应包含初债权说明段、特殊交易说明段、基本信息段、相关还款责任人段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2199', '2033', 'table_name2_E_1017', 'table_name2_E', '当报告时点说明代码为40-收回逾期款项时：若账户类型为D1/R1/R2/R4还不应包含初债权说明段、特殊交易说明段、基本信息段、相关还款责任人段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2200', '2033', 'a1_field_type1_1017', 'a1_field_type1', '当报告时点说明代码为40-收回逾期款项时：若账户类型为D1/R1/R2/R4还不应包含初债权说明段、特殊交易说明段、基本信息段、相关还款责任人段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2201', '2033', 'a1_field1_1017', 'a1_field1', '当报告时点说明代码为40-收回逾期款项时：若账户类型为D1/R1/R2/R4还不应包含初债权说明段、特殊交易说明段、基本信息段、相关还款责任人段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2202', '2033', 'a1_field2_1017', 'a1_field2', '当报告时点说明代码为40-收回逾期款项时：若账户类型为D1/R1/R2/R4还不应包含初债权说明段、特殊交易说明段、基本信息段、相关还款责任人段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2203', '2033', 'ms9_field1_1017', 'ms9_field1', '当报告时点说明代码为40-收回逾期款项时：若账户类型为D1/R1/R2/R4还不应包含初债权说明段、特殊交易说明段、基本信息段、相关还款责任人段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2204', '2034', 'table_name2_B_1018', 'table_name2_B', '当报告时点说明代码为10-新开户时，若账户类型为R2，不应包含初始债权说明段、非月度表现信息段、特殊交易说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2205', '2034', 'table_name2_C_1018', 'table_name2_C', '当报告时点说明代码为10-新开户时，若账户类型为R2，不应包含初始债权说明段、非月度表现信息段、特殊交易说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2206', '2034', 'table_name2_D_1018', 'table_name2_D', '当报告时点说明代码为10-新开户时，若账户类型为R2，不应包含初始债权说明段、非月度表现信息段、特殊交易说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2207', '2034', 'a1_field_type1_1018', 'a1_field_type1', '当报告时点说明代码为10-新开户时，若账户类型为R2，不应包含初始债权说明段、非月度表现信息段、特殊交易说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2', '3', 'ent_cert_type_01', 'num10', '企业基本信息记录基础段企业身份标识类型顺序映射');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('382', '100', 'table_name_A_not_null_01', 'table_name_A_not_null', '报送时点说明代码为20-账户关闭，账户类型为D1,D2,R1,R4,C1应包含还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('383', '100', 'table_field_code_01', 'table_field_code', '报送时点说明代码为20-账户关闭，账户类型为D1,D2,R1,R4,C1应包含还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('623', '143', 'table_field_DEL_END_DATE_11', 'table_field_DEL_END_DATE', '个人授信待删除起始日期,待删除的终止日期不能同时为空值');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('624', '144', 'table_field_DEL_START_DATE_11', 'table_field_DEL_START_DATE', '个人授信待删除起始日期必须小于等于待删除的结束日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('625', '144', 'm19_11', 'm19', '个人授信待删除起始日期必须小于等于待删除的结束日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('626', '144', 'm21_11', 'm21', '个人授信待删除起始日期必须小于等于待删除的结束日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('627', '144', 'm20_11', 'm20', '个人授信待删除起始日期必须小于等于待删除的结束日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('628', '145', 'table_field_ACCT_CODE_12', 'table_field_ACCT_CODE', '个人担保协议待删除的业务标识码必须在库中存在');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('629', '145', 'table_name_EDA_12', 'table_name_EDA', '个人担保协议待删除的业务标识码必须在库中存在');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('630', '146', 'table_field_DEL_END_DATE_12', 'table_field_DEL_END_DATE', '个人担保待删除起始日期,待删除的终止日期不能同时为空值');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('631', '147', 'table_field_DEL_START_DATE_12', 'table_field_DEL_START_DATE', '个人担保待删除起始日期必须小于等于待删除的结束日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('632', '147', 'm19_12', 'm19', '个人担保待删除起始日期必须小于等于待删除的结束日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('633', '147', 'm21_12', 'm21', '个人担保待删除起始日期必须小于等于待删除的结束日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('634', '147', 'm20_12', 'm20', '个人担保待删除起始日期必须小于等于待删除的结束日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('635', '148', 'table_field_ACCT_CODE_13', 'table_field_ACCT_CODE', '个人借贷待删除的业务标识码必须在库中存在');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('636', '148', 'table_name_EDA_13', 'table_name_EDA', '个人借贷待删除的业务标识码必须在库中存在');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('701', '701', 'RPT_DATE_CODE_10_1', 'num10', '“报告时点说明代码”为“10-新开户/首次上报”时，至少应包含基本信息段、在保责任信息段。');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('702', '701', 'EEB_GUAR_ACCT_BS_INF_SGMT_Table', 'table_1', '“报告时点说明代码”为“10-新开户/首次上报”时，至少应包含基本信息段、在保责任信息段。');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('703', '701', 'EEF_GUAR_RLT_REPYMT_INF_SGMT_Table', 'table_2', '“报告时点说明代码”为“10-新开户/首次上报”时，至少应包含基本信息段、在保责任信息段。');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('704', '702', 'RPT_DATE_CODE_20_1', 'num10', '“报告时点说明代码”为“20-账户关闭”时，至少包含在保责任信息段。');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('705', '702', 'EEF_GUAR_RLT_REPYMT_INF_SGMT_Table', 'table_1', '“报告时点说明代码”为“20-账户关闭”时，至少包含在保责任信息段。');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('706', '703', 'RPT_DATE_CODE_30_1', 'num10', '“报告时点说明代码”为“30-在保责任变化”时，至少包含在保责任信息段。');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('707', '703', 'EEF_GUAR_RLT_REPYMT_INF_SGMT_Table', 'table_1', '“报告时点说明代码”为“30-在保责任变化”时，至少包含在保责任信息段。');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('708', '704', 'RPT_DATE_CODE_50_1', 'num10', '“报告时点说明代码”为“50-其他信息变化”时，不包括在保责任信息段。');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('709', '704', 'EEF_GUAR_RLT_REPYMT_INF_SGMT_Table', 'table_1', '“报告时点说明代码”为“50-其他信息变化”时，不包括在保责任信息段。');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('710', '705', 'RPT_DATE_CODE_40_1', 'num10', '“报告时点说明代码”为“40-五级分类调整”时，至少包含保责任信息段。');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('711', '705', 'EEF_GUAR_RLT_REPYMT_INF_SGMT_Table', 'table_1', '“报告时点说明代码”为“40-五级分类调整”时，至少包含保责任信息段。');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('712', '706', 'RPT_DATE_CODE_10_1', 'num10', '“报告时点说明代码”为“10-新开户/首次上报”且“反担保方式”为“1-保证”时，至少包含相关还款责任人段。');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('713', '706', 'GUAR_MODE_1_1', 'num1', '“报告时点说明代码”为“10-新开户/首次上报”且“反担保方式”为“1-保证”时，至少包含相关还款责任人段。');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('714', '706', 'EEB_GUAR_ACCT_BS_INF_SGMT_Table', 'table_1', '“报告时点说明代码”为“10-新开户/首次上报”且“反担保方式”为“1-保证”时，至少包含相关还款责任人段。');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('715', '706', 'EEC_RLT_REPYMT_INF_SGMT_Table', 'table_2', '“报告时点说明代码”为“10-新开户/首次上报”且“反担保方式”为“1-保证”时，至少包含相关还款责任人段。');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('716', '706', 'GUAR_MODE_Column', 'table_field_1', '“报告时点说明代码”为“10-新开户/首次上报”且“反担保方式”为“1-保证”时，至少包含相关还款责任人段。');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('717', '707', 'DUE_DATE_Column', 'table_field_1', '“报告时点说明代码”为“10-新开户/首次上报”且“反担保方式”为“1-保证”时，至少包含相关还款责任人段。');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('718', '708', 'BUSI_DTIL_LINES_Column', 'table_field_1', '“担保业务大类”和“担保业务种类细分”代码不匹配');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('719', '708', 'BUSI_LINES_1', 'num1', '“担保业务大类”和“担保业务种类细分”代码不匹配');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('720', '708', 'BUSI_DTIL_LINES_1', 'num01', '“担保业务大类”和“担保业务种类细分”代码不匹配');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('721', '708', 'BUSI_LINES_2', 'num2', '“担保业务大类”和“担保业务种类细分”代码不匹配');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('722', '708', 'BUSI_DTIL_LINES_2', 'num02', '“担保业务大类”和“担保业务种类细分”代码不匹配');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('723', '708', 'BUSI_LINES_3', 'num3', '“担保业务大类”和“担保业务种类细分”代码不匹配');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('724', '708', 'BUSI_DTIL_LINES_3', 'num03', '“担保业务大类”和“担保业务种类细分”代码不匹配');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('725', '708', 'BUSI_LINES_4', 'num4', '“担保业务大类”和“担保业务种类细分”代码不匹配');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('726', '708', 'BUSI_DTIL_LINES_4', 'num04', '“担保业务大类”和“担保业务种类细分”代码不匹配');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('727', '708', 'BUSI_LINES_5', 'num5', '“担保业务大类”和“担保业务种类细分”代码不匹配');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('728', '708', 'BUSI_DTIL_LINES_5', 'num05', '“担保业务大类”和“担保业务种类细分”代码不匹配');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('729', '708', 'BUSI_LINES_6', 'num6', '“担保业务大类”和“担保业务种类细分”代码不匹配');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('730', '708', 'BUSI_DTIL_LINES_6', 'num06', '“担保业务大类”和“担保业务种类细分”代码不匹配');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('731', '708', 'BUSI_LINES_7', 'num7', '“担保业务大类”和“担保业务种类细分”代码不匹配');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('732', '708', 'BUSI_DTIL_LINES_7', 'num07', '“担保业务大类”和“担保业务种类细分”代码不匹配');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('733', '709', 'ACCT_STATUS_2', 'num1', '账户状态:2-关闭');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('734', '709', 'CLOSE_DATE_Column', 'table_field_1', '账户关闭日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('735', '710', 'REPAY_PRD_Column', 'table_field_1', '余额变化日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('736', '710', 'FIVE_CATE_ADJ_DATE_Column', 'table_field_2', '五级分类认定日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('737', '711', 'ARLP_CERT_TYPE_Column', 'table_field_1', '相关还款责任人身份标识类型');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('738', '711', 'NUM_1', 'num1', '身份类别:1-自然人');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('739', '711', 'ARLPCERTTYPE_BELONGTO_INFOIDTYPE1', 'num01', '相关还款责任人身份标识类型(1-自然人)');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('740', '711', 'NUM_2', 'num2', '身份类别:2-组织机构');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2292', '2056', 'table_field1_2018', 'table_field1', '若“账户状态”为“2-结束”，则“账户关闭日期”不能为空值');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2293', '2057', 'field1_2019', 'field1', '当账户状态为“关闭”/“销户”时，“当前逾期总额”、“当前逾期期数”应为 0');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2294', '2057', 'table_field1_2019', 'table_field1', '当账户状态为“关闭”/“销户”时，“当前逾期总额”、“当前逾期期数”应为 0');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2296', '2057', 'table_field2_2019', 'table_field2', '当账户状态为“关闭”/“销户”时，“当前逾期总额”、“当前逾期期数”应为 0');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2297', '2058', 'table_field1_2020', 'table_field1', '“分期额度生效日期”应不晚于“分期额度到期日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2298', '2059', 'field1_2021', 'field1', '“当前还款状态”只能为“N-正常');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2299', '2060', 'table_field1_2022', 'table_field1', '若“账户关闭日期”数据项不为空，则“账户关闭日期”应不早于“最近一次实际还款日期”、五级分类认定日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2300', '2060', 'table_field2_2022', 'table_field2', '若“账户关闭日期”数据项不为空，则“账户关闭日期”应不早于“最近一次实际还款日期”、五级分类认定日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2301', '2061', 'field1_2023', 'field1', '若“账户状态”为“2-结束”，则“余额”应为 0');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2302', '2061', 'table_field1_2023', 'table_field1', '若“账户状态”为“2-结束”，则“余额”应为 0');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2303', '2061', 'field2_2023', 'field2', '若“账户状态”为“2-结束”，则“余额”应为 0');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2304', '2062', 'table_name_A_3000', 'table_name_A', '当账户信息记录中账户类型为R3时，透支 180 天以上未还余额应该小于等于余额');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('751', '714', 'EEA_GUAR_ACCT_BS_SGMT_ID_Column', 'table_pk_1', 'EEA_GUAR_ACCT_BS_SGMT表主键');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('752', '714', 'ARLP_TYPE_Column', 'table_field_1', '相关还款责任人身份类型');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('753', '714', 'ID_NUM_Column', 'table_field_2', '债务人身份号码');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('754', '714', 'ID_TYPE_Column', 'table_field_3', '身份类型');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('755', '715', 'EDA_ACCT_BS_SGMT_ID_Column', 'table_pk_1', 'EDA_ACCT_BS_SGMT主键');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('756', '715', 'EDA_ACCT_BS_SGMT_Table', 'table_1', '企业借贷基础段/企业借贷账户按段更正类请求记录');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('757', '715', 'EDC_RLT_REPYMT_INF_SGMT_Table', 'table_2', '企业借贷相关还款责任人段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('758', '715', 'RPT_DATE_CODE_Column', 'table_field_1', '报告时点说明代码');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('759', '715', 'NUM_10', 'num10', '报告时点说明代码：10-新开户/首次上报');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('760', '715', 'NUM_1', 'num1', '担保方式：1-保证');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('761', '716', 'EDA_ACCT_BS_SGMT_ID_Column', 'table_pk_1', 'EDA_ACCT_BS_SGMT主键');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('762', '716', 'EDA_ACCT_BS_SGMT_Table', 'table_1', '企业借贷基础段/企业借贷账户按段更正类请求记录');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('763', '716', 'EDD_MOTGA_CLTAL_CTRCT_INF_SGMT_Table', 'table_2', '企业借贷相关还款责任人段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('764', '716', 'RPT_DATE_CODE_Column', 'table_field_1', '报告时点说明代码');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('765', '716', 'NUM_10', 'num10', '报告时点说明代码：10-新开户/首次上报');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('766', '716', 'GUAR_MODE_2AND3', 'num1', '担保方式:2-质押、3-抵押');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('767', '717', 'TRAN_DATE_Column', 'table_field_1', '交易日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('768', '718', 'DUE_DATE_Column', 'table_field_1', '到期日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('769', '719', 'NUM_90', 'mun90', '还款方式：90-汇总报送，不区分还款方式');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('770', '719', 'REPAY_FREQCY_Column', 'table_field_1', '还款频率');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('771', '719', 'NUM_10', 'num10', '还款频率：10-月');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('772', '720', 'REPAY_MODE_2', 'num2', '还款方式：以“2”开头');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('773', '720', 'REPAY_FREQCY_Column', 'table_field_1', '还款频率');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('774', '720', 'NUM_99', 'num99', '还款频率：99-其他');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('775', '721', 'EDA_ACCT_BS_SGMT_ID', 'table_1', '企业借贷基础段/企业借贷账户按段更正类请求记录');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('776', '721', 'EDA_ACCT_BS_SGMT_ID_Column', 'table_pk_1', 'EDA_ACCT_BS_SGMT主键');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('777', '721', 'ACCT_TYPE_Column1', 'table_field_1', '账户类型');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('778', '721', 'ACCT_TYPE_R4_AND_D1', 'num1', '账户类型：R4,D1');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('779', '721', 'REPAY_MODE_3', 'num2', '还款方式31,32,33,39');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('780', '722', 'table_EDA_ACCT_BS_SGMT', 'table_1', '企业借贷基础段/企业借贷账户按段更正类请求记录');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('10039', '10027', 'table_field_INF_REC_TYPE1_0202', 'table_field_INF_REC_TYPE1', '担保待更正业务标识码必须在库中存在');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('10040', '10027', 'inf_rec_type2_0202', 'inf_rec_type2', '担保待更正业务标识码必须在库中存在');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('10041', '10027', 'inf_rec_type3_0202', 'inf_rec_type3', '担保待更正业务标识码必须在库中存在');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('10050', '10035', 'table_field_INF_REC_TYPE1_0303', 'table_field_INF_REC_TYPE1', '借贷待更正业务标识码必须在库中存在');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('10051', '10035', 'inf_rec_type2_0303', 'inf_rec_type2', '借贷待更正业务标识码必须在库中存在');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('10052', '10035', 'inf_rec_type3_0303', 'inf_rec_type3', '借贷待更正业务标识码必须在库中存在');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2098', '2021', 'a1_field_type_1005', 'a1_field_type', '当报告时点说明代码为20-账户关闭时，除基础段，若账户类型为D1/R1/R2/R3/R4，还应包含月度表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2099', '2021', 'a1_field2_1005', 'a1_field2', '当报告时点说明代码为20-账户关闭时，除基础段，若账户类型为D1/R1/R2/R3/R4，还应包含月度表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2100', '2021', 'ms2_field1_1005', 'ms2_field1', '当报告时点说明代码为20-账户关闭时，除基础段，若账户类型为D1/R1/R2/R3/R4，还应包含月度表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2101', '2021', 'ms2_field2_1005', 'ms2_field2', '当报告时点说明代码为20-账户关闭时，除基础段，若账户类型为D1/R1/R2/R3/R4，还应包含月度表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2102', '2021', 'ms2_field3_1005', 'ms2_field3', '当报告时点说明代码为20-账户关闭时，除基础段，若账户类型为D1/R1/R2/R3/R4，还应包含月度表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2103', '2022', 'table_name2_B_1006', 'table_name2_B', '当报告时点说明代码为20-账户关闭时，除基础段,若账户类型为C1，还应包含非月度表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2104', '2022', 'a1_field1_1006', 'a1_field1', '当报告时点说明代码为20-账户关闭时，除基础段,若账户类型为C1，还应包含非月度表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2105', '2022', 'a1_field_type_1006', 'a1_field_type', '当报告时点说明代码为20-账户关闭时，除基础段,若账户类型为C1，还应包含非月度表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2106', '2022', 'a1_field2_1006', 'a1_field2', '当报告时点说明代码为20-账户关闭时，除基础段,若账户类型为C1，还应包含非月度表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2107', '2022', 'ms2_field1_1006', 'ms2_field1', '当报告时点说明代码为20-账户关闭时，除基础段,若账户类型为C1，还应包含非月度表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2108', '2022', 'ms2_field2_1006', 'ms2_field2', '当报告时点说明代码为20-账户关闭时，除基础段,若账户类型为C1，还应包含非月度表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2109', '2022', 'ms2_field3_1006', 'ms2_field3', '当报告时点说明代码为20-账户关闭时，除基础段,若账户类型为C1，还应包含非月度表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2110', '2023', 'table_name2_B_1007', 'table_name2_B', '当报告时点说明代码为10-新开户时，至少包含基本信息段：若账户类型为R2，还应包含月度表现段。如果基本信息段中的借贷业务种类细分不是大额专项分期卡，还应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2111', '2023', 'table_name2_C_1007', 'table_name2_C', '当报告时点说明代码为10-新开户时，至少包含基本信息段：若账户类型为R2，还应包含月度表现段。如果基本信息段中的借贷业务种类细分不是大额专项分期卡，还应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2112', '2023', 'table_name2_D_1007', 'table_name2_D', '当报告时点说明代码为10-新开户时，至少包含基本信息段：若账户类型为R2，还应包含月度表现段。如果基本信息段中的借贷业务种类细分不是大额专项分期卡，还应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2113', '2023', 'a1_field1_1007', 'a1_field1', '当报告时点说明代码为10-新开户时，至少包含基本信息段：若账户类型为R2，还应包含月度表现段。如果基本信息段中的借贷业务种类细分不是大额专项分期卡，还应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('507', '116', 'table_field_A_pk_null_07', 'table_field_A_pk_null', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('508', '116', 'table_field_A_rptdatecode_not_07', 'table_field_A_rptdatecode_not', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('509', '116', 'rptdatecode_not_07', 'rptdatecode_not', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('510', '116', 'table_field_A_accttype_not_07', 'table_field_A_accttype_not', '报送时点说明代码为10-新开户/首次报送,20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('278', '84', 'table_field_TOTAL_EQUITY2_02', 'table_field_TOTAL_EQUITY2', '现金及现金等价物净增加额=经营活动产生的现金流量净额+投资活动产生的现金流量净额+筹资活动产生的现金流量净额+汇率变动对现金及现金等价物的影响');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('279', '84', 'table_field_FROM_INVESTING2_02', 'table_field_FROM_INVESTING2', '现金及现金等价物净增加额=经营活动产生的现金流量净额+投资活动产生的现金流量净额+筹资活动产生的现金流量净额+汇率变动对现金及现金等价物的影响');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('280', '85', 'm4_05', 'm4', '期末现金及现金等价物余额=现金及现金等价物净增加额+期初现金及现金等价物余额');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('281', '85', 'm5_05', 'm5', '期末现金及现金等价物余额=现金及现金等价物净增加额+期初现金及现金等价物余额');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('282', '85', 'm6_05', 'm6', '期末现金及现金等价物余额=现金及现金等价物净增加额+期初现金及现金等价物余额');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('283', '85', 'table_field_CURRENT_ASSETS_05', 'table_field_CURRENT_ASSETS', '期末现金及现金等价物余额=现金及现金等价物净增加额+期初现金及现金等价物余额');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('284', '85', 'table_field_NON_CURRENT_ASSETS_05', 'table_field_NON_CURRENT_ASSETS', '期末现金及现金等价物余额=现金及现金等价物净增加额+期初现金及现金等价物余额');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('285', '86', 'table_name_EGC_CREDIT_LIM_SGMT_01', 'table_name_EGC_CREDIT_LIM_SGMT', '企业授信协议记录报送时，基础段和额度信息段必须出现');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('286', '86', 'INF_REC_TYPE001_01', 'INF_REC_TYPE001', '企业授信协议记录报送时，基础段和额度信息段必须出现');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('287', '86', 'table_pk_EGC_CREDIT_LIM_SGMT_ID_01', 'table_pk_EGC_CREDIT_LIM_SGMT_ID', '企业授信协议记录报送时，基础段和额度信息段必须出现');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('288', '86', 'm18_01', 'm18', '企业授信协议记录报送时，基础段和额度信息段必须出现');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('289', '87', 'table_field_DEL_START_DATE_04', 'table_field_DEL_START_DATE', '额度生效日期必须不晚于额度到期日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('290', '87', 'm19_04', 'm19', '额度生效日期必须不晚于额度到期日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('291', '87', 'm20_04', 'm20', '额度生效日期必须不晚于额度到期日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('292', '87', 'm21_04', 'm21', '额度生效日期必须不晚于额度到期日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('293', '88', 'table_field_CREDIT_REST CREDIT_REST_01', 'table_field_CREDIT_REST', '授信限额编号、授信限额其中之一不为空时，另一个应不为空');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('294', '88', 'm22_01', 'm22', '授信限额编号、授信限额其中之一不为空时，另一个应不为空');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('295', '88', 'm23_01', 'm23', '授信限额编号、授信限额其中之一不为空时，另一个应不为空');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('296', '89', 'table_name_EGA_CTRCT_BS_SGMT1_01', 'table_name_EGA_CTRCT_BS_SGMT', '受信人两标与共同受信人两标不能相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('297', '89', 'table_field_SGMT_ID1_01', 'table_field_SGMT_ID', '受信人两标与共同受信人两标不能相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('298', '89', 'table_field_TYPE1_01', 'table_field_TYPE', '受信人两标与共同受信人两标不能相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('299', '89', 'table_field_IDTYPE1_01', 'table_field_IDTYPE', '受信人两标与共同受信人两标不能相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('300', '89', 'table_field_NUM1_01', 'table_field_NUM', '受信人两标与共同受信人两标不能相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('301', '89', 'm26_01', 'm26', '受信人两标与共同受信人两标不能相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('302', '89', 'm27_01', 'm27', '受信人两标与共同受信人两标不能相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('303', '90', 'table_name_EGC_CREDIT_LIM_SGMT_02', 'table_name_EGC_CREDIT_LIM_SGMT', '抵质押基本信息段必须出现');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('304', '90', 'INF_REC_TYPE001_02', 'INF_REC_TYPE001', '抵质押基本信息段必须出现');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('305', '90', 'table_pk_EGC_CREDIT_LIM_SGMT_ID_02', 'table_pk_EGC_CREDIT_LIM_SGMT_ID', '抵质押基本信息段必须出现');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('306', '90', 'm18_02', 'm18', '抵质押基本信息段必须出现');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('307', '91', 'table_field_DEL_START_DATE_05', 'table_field_DEL_START_DATE', '抵质押合同生效日期不晚于合同到期日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('308', '91', 'm19_05', 'm19', '抵质押合同生效日期不晚于合同到期日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('851', '740', 'EDA_ACCT_BS_SGMT_ID_Column', 'table_pk_1', 'EDA_ACCT_BS_SGMT主键');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('852', '740', 'ACCT_TYPE_Column1', 'table_field_1', '账户类型');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('853', '740', 'ACCT_TYPE_C1', 'num1', '账户类型:C1');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('854', '740', 'HY_BUSI_LINES_2', 'num2', '信贷业务大类:51-资产处置、41-垫款');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('384', '100', 'table_field_accttype_01', 'table_field_accttype', '报送时点说明代码为20-账户关闭，账户类型为D1,D2,R1,R4,C1应包含还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('385', '100', 'accttype_01', 'accttype', '报送时点说明代码为20-账户关闭，账户类型为D1,D2,R1,R4,C1应包含还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('386', '100', 'table_field_A_pk_01', 'table_field_A_pk', '报送时点说明代码为20-账户关闭，账户类型为D1,D2,R1,R4,C1应包含还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('387', '100', 'ms1_01', 'ms1', '报送时点说明代码为20-账户关闭，账户类型为D1,D2,R1,R4,C1应包含还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('388', '100', 'ms2_01', 'ms2', '报送时点说明代码为20-账户关闭，账户类型为D1,D2,R1,R4,C1应包含还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('781', '722', 'EDA_ACCT_BS_SGMT_ID_Column', 'table_pk_1', 'EDA_ACCT_BS_SGMT主键');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('782', '722', 'ACCT_TYPE_Column1', 'table_field_1', '账户类型');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('783', '722', 'ACCT_TYPE_R1', 'num1', '账户类型：R1');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('784', '722', 'REPAY_MODE_1_AND_3', 'num2', '还款方式：11,12,13,14,15,19,21,22,23,29');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('785', '723', 'NUM_1', 'num1', '还款责任人类型:1-共同借款人');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('786', '723', 'ARLP_TYPE_1', 'num2', '还款责任人类型:2-保证人,3-票据承兑人,4-应收账款债务人,5-供应链中核心企业,9-其他');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('787', '723', 'ARLP_AMT_Column', 'table_field_1', '还款责任金额');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('788', '724', 'NUM_2', 'num1', '还款责任人类型:2-保证人');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('789', '724', 'WARTY_SIGN_Column', 'table_field_1', '联保标志');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('790', '724', 'MAX_GUAR_MCC_Column', 'table_field_2', '保证合同编号');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('791', '725', 'NUM_1', 'num1', '身份类别:1-自然人');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('792', '725', 'NUM_2', 'num2', '身份类别:2-组织机构');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('793', '725', 'ARLP_CERT_TYPE_Column', 'table_field_1', '责任人身份标识类型');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('794', '725', 'ARLP_CERT_TYPE_1', 'num3', '‘身份类别为‘1-自然人’时对应的‘责任人身份标识类型’');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('795', '725', 'ARLP_CERT_TYPE_2', 'num4', '‘身份类别为‘2-组织机构’时对应的‘责任人身份标识类型’');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('796', '726', 'NUM_21', 'num1', '账户状态:21-关闭');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('797', '726', 'ACCT_BAL_Column', 'table_field_1', '余额');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('798', '726', 'TOT_OVERD_Column', 'table_field_2', '当前逾期总额');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('799', '726', 'OVERD_PRINC_Column', 'table_field_3', '当前逾期本金');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('800', '726', 'OVERD_DY_Column', 'table_field_4', '当前逾期天数');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('801', '726', 'NUM_0', 'num2', '数值: 0');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('802', '727', 'NUM_21', 'num1', '账户状态:21-关闭');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('803', '727', 'CLOSE_DATE_Column', 'table_field_1', '账户关闭日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('804', '728', 'ACCT_STATUS_1', 'num1', '账户状态:31-呆账（已核销）、32-呆账（进入核销认定程序，等待核销）');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('805', '728', 'TOT_OVERD_Column', 'table_field_1', '当前逾期总额');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('806', '728', 'NUM_0', 'num2', '当前逾期总额=0');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('807', '729', 'EDA_ACCT_BS_SGMT_Table', 'table_1', '企业借贷基础段/企业借贷账户按段更正类请求记录');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('808', '729', 'EDA_ACCT_BS_SGMT_ID_Column', 'table_pk_1', '企业借贷基础段/企业借贷账户按段更正类请求记录表主键');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('809', '729', 'ACCT_TYPE_Column2', 'table_field_1', '账户类型');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('810', '729', 'ACCT_TYPE_1', 'num1', 'D1/D2/R1/R4 账户');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('811', '729', 'TOT_OVERD_Column', 'table_field_2', '当前逾期总额');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('812', '730', 'LAT_RPY_AMT_Column', 'table_field_1', '最近一次实际还款金额');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('813', '731', 'NUM_0', 'num1', '数值: 0');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('814', '731', 'OVERD_DY_Column', 'table_field_1', '当前逾期天数');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('815', '732', 'OPEN_DATE_Column', 'table_field_1', '开户日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('816', '732', 'BAL_CHG_DATE_Column', 'table_field_2', '余额变化日期     ');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('817', '732', 'FIVE_CATE_ADJ_DATE_Column', 'table_field_3', '五级分类认定日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('818', '732', 'LAT_RPY_DATE_Column', 'table_field_4', '最近一次实际还款日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('819', '732', 'LAT_AGRR_RPY_DATE_Column', 'table_field_5', '最近一次约定还款日');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('820', '732', 'NXT_AGRR_RPY_DATE_Column', 'table_field_6', '下一次约定还款日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('821', '732', 'TRAN_DATE_Column', 'table_field_7', '交易日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('822', '732', 'FIVE_CATE_ADJ_DATE_Column', 'table_field_4', '五级分类认定日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('823', '733', 'NUM_21', 'num1', '账户状态：21-关闭');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('824', '733', 'NXT_AGRR_RPY_DATE_Column', 'table_field_1', '下一次约定还款日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('825', '734', 'BAL_CHG_DATE_Column', 'table_field_1', '余额变化日期     ');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('826', '734', 'LAT_RPY_DATE_Column', 'table_field_2', '最近一次实际还款日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('827', '734', 'LAT_AGRR_RPY_DATE_Column', 'table_field_3', '最近一次约定还款日');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('828', '734', 'FIVE_CATE_ADJ_DATE_Column', 'table_field_4', '五级分类认定日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('829', '735', 'EDG_ACT_LBLTY_INF_SGMT_Table', 'table_1', '企业借贷还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('830', '735', 'NXT_AGRR_RPY_DATE_Column', 'table_field_1', '下一次约定还款日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('831', '736', 'NUM_11', 'num1', '交易类型：11-展期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('832', '736', 'DUE_TRAN_MON_Column', 'table_field_1', '到期日期变更月数');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('833', '736', 'NUM_0', 'num2', '数值：0');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('834', '737', 'NUM_0', 'num1', '数值：0');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('835', '738', 'EDG_ACT_LBLTY_INF_SGMT_Table', 'table_1', '企业借贷还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('836', '738', 'EDH_ACCT_SPEC_TRST_DSPN_Table', 'table_2', '企业借贷特定交易说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('837', '738', 'EDA_ACCT_BS_SGMT_ID_Column', 'table_pk_1', 'EDA_ACCT_BS_SGMT主键');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('838', '738', 'DUE_DATE_Column', 'table_field_1', '到期日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('839', '738', 'BAL_CHG_DATE_Column', 'table_field_2', '余额变化日期     ');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('840', '738', 'FIVE_CATE_ADJ_DATE_Column', 'table_field_3', '五级分类认定日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('841', '738', 'LAT_RPY_DATE_Column', 'table_field_4', '最近一次实际还款日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2000', '2000', 'table_name_B_001', 'table_name_B', '报告时点说明代码为10-新开户/首次上报，至少应出现账户基本信息段、在保责任信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('621', '142', 'table_field_ACCT_CODE_11', 'table_field_ACCT_CODE', '个人授信按段删除待删除的业务标识码必须在库中存在');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('622', '142', 'table_name_EDA_11', 'table_name_EDA', '个人授信按段删除待删除的业务标识码必须在库中存在');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('310', '91', 'm21_05', 'm21', '抵质押合同生效日期不晚于合同到期日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('311', '92', 'table_name_EFA_SGMT1_01', 'table_name_EFA_SGMT1', '抵押物个数应大于 0');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('312', '92', 'table_field_EFA_BS_ID1_01', 'table_field_EFA_BS_ID1', '抵押物个数应大于 0');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('313', '92', 'table_name_EFD_SGMT1_01', 'table_name_EFD_SGMT1', '抵押物个数应大于 0');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('314', '92', 'table_field_EFD_SGMT_ID1_01', 'table_field_EFD_SGMT_ID1', '抵押物个数应大于 0');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('315', '92', 'GUAR_TYPE1_01', 'GUAR_TYPE1', '抵押物个数应大于 0');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('316', '92', 'm31_01', 'm31', '抵押物个数应大于 0');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('317', '92', 'm32_01', 'm32', '抵押物个数应大于 0');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('318', '93', 'table_name_EFA_SGMT1_02', 'table_name_EFA_SGMT1', '质押物个数应大于 0');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('319', '93', 'table_field_EFA_BS_ID1_02', 'table_field_EFA_BS_ID1', '质押物个数应大于 0');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('320', '93', 'table_name_EFD_SGMT1_02', 'table_name_EFD_SGMT1', '质押物个数应大于 0');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('321', '93', 'table_field_EFD_SGMT_ID1_02', 'table_field_EFD_SGMT_ID1', '质押物个数应大于 0');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('322', '93', 'GUAR_TYPE1_02', 'GUAR_TYPE1', '质押物个数应大于 0');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('323', '93', 'm31_02', 'm31', '质押物个数应大于 0');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('324', '93', 'm32_02', 'm32', '质押物个数应大于 0');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('325', '94', 'table_name_EGA_CTRCT_BS_SGMT1_02', 'table_name_EGA_CTRCT_BS_SGMT', '债务人两标与其他债务人两标不能相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('326', '94', 'table_field_SGMT_ID1_02', 'table_field_SGMT_ID', '债务人两标与其他债务人两标不能相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('327', '94', 'table_field_TYPE1_02', 'table_field_TYPE', '债务人两标与其他债务人两标不能相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('328', '94', 'table_field_IDTYPE1_02', 'table_field_IDTYPE', '债务人两标与其他债务人两标不能相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('329', '94', 'table_field_NUM1_02', 'table_field_NUM', '债务人两标与其他债务人两标不能相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('330', '94', 'm26_02', 'm26', '债务人两标与其他债务人两标不能相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('331', '94', 'm27_02', 'm27', '债务人两标与其他债务人两标不能相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('332', '95', 'table_name_A1_not_null_01', 'table_name_A1_not_null', '报送时点说明代码为10-新开户/首次报送，账户类型为D2,C1应包含基本信息段、还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('333', '95', 'table_name_B1_not_null_01', 'table_name_B1_not_null', '报送时点说明代码为10-新开户/首次报送，账户类型为D2,C1应包含基本信息段、还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('334', '95', 'table_field_code1_01', 'table_field_code1', '报送时点说明代码为10-新开户/首次报送，账户类型为D2,C1应包含基本信息段、还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('335', '95', 'table_field_accttype1_01', 'table_field_accttype1', '报送时点说明代码为10-新开户/首次报送，账户类型为D2,C1应包含基本信息段、还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('336', '95', 'accttype1_01', 'accttype1', '报送时点说明代码为10-新开户/首次报送，账户类型为D2,C1应包含基本信息段、还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('337', '95', 'table_field_A1_pk_not_null_01', 'table_field_A1_pk_not_null', '报送时点说明代码为10-新开户/首次报送，账户类型为D2,C1应包含基本信息段、还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('338', '95', 'table_field_B1_pk_not_null_01', 'table_field_B1_pk_not_null', '报送时点说明代码为10-新开户/首次报送，账户类型为D2,C1应包含基本信息段、还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('380', '99', 'ms14_01', 'ms14', '账户类型为R1、R4、C1，不适用31-开户后放款的报送时点');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('381', '99', 'ms15_01', 'ms15', '账户类型为R1、R4、C1，不适用31-开户后放款的报送时点');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2068', '2017', 'table_name2_B_1001', 'table_name2_B', '当报告时点说明代码为30-月度结算时：除基础段外，至少还应包含月度表现信息段；账户类型不能为C1。');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2069', '2017', 'a1_field1_1001', 'a1_field1', '当报告时点说明代码为30-月度结算时：除基础段外，至少还应包含月度表现信息段；账户类型不能为C1。');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2070', '2017', 'a1_field_type_1001', 'a1_field_type', '当报告时点说明代码为30-月度结算时：除基础段外，至少还应包含月度表现信息段；账户类型不能为C1。');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2071', '2017', 'a1_field2_1001', 'a1_field2', '当报告时点说明代码为30-月度结算时：除基础段外，至少还应包含月度表现信息段；账户类型不能为C1。');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2072', '2017', 'ms_field1_1001', 'ms_field1', '当报告时点说明代码为30-月度结算时：除基础段外，至少还应包含月度表现信息段；账户类型不能为C1。');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2073', '2017', 'ms_field2_1001', 'ms_field2', '当报告时点说明代码为30-月度结算时：除基础段外，至少还应包含月度表现信息段；账户类型不能为C1。');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2074', '2017', 'ms_field3_1001', 'ms_field3', '当报告时点说明代码为30-月度结算时：除基础段外，至少还应包含月度表现信息段；账户类型不能为C1。');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2075', '2018', 'table_name2_B_1002', 'table_name2_B', '当报告时点说明代码为31-月结日首次上报存量账户时，除基础段外，至少包含基本信息段，账户类型不能为C1');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2076', '2018', 'a1_field1_1002', 'a1_field1', '当报告时点说明代码为31-月结日首次上报存量账户时，除基础段外，至少包含基本信息段，账户类型不能为C1');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2077', '2018', 'a1_field_type_1002', 'a1_field_type', '当报告时点说明代码为31-月结日首次上报存量账户时，除基础段外，至少包含基本信息段，账户类型不能为C1');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2078', '2018', 'a1_field2_1002', 'a1_field2', '当报告时点说明代码为31-月结日首次上报存量账户时，除基础段外，至少包含基本信息段，账户类型不能为C1');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2079', '2018', 'ms_field1_1002', 'ms_field1', '当报告时点说明代码为31-月结日首次上报存量账户时，除基础段外，至少包含基本信息段，账户类型不能为C1');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2080', '2018', 'ms_field2_1002', 'ms_field2', '当报告时点说明代码为31-月结日首次上报存量账户时，除基础段外，至少包含基本信息段，账户类型不能为C1');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2081', '2018', 'ms_field3_1002', 'ms_field3', '当报告时点说明代码为31-月结日首次上报存量账户时，除基础段外，至少包含基本信息段，账户类型不能为C1');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2082', '2019', 'table_name2_B_1003', 'table_name2_B', '当报告时点说明代码为32-月结日账户关闭时：除基础段外，至少还应包括月度表现信息段，账户类型不能为C1。');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2083', '2019', 'a1_field1_1003', 'a1_field1', '当报告时点说明代码为32-月结日账户关闭时：除基础段外，至少还应包括月度表现信息段，账户类型不能为C1。');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2084', '2019', 'a1_field_type_1003', 'a1_field_type', '当报告时点说明代码为32-月结日账户关闭时：除基础段外，至少还应包括月度表现信息段，账户类型不能为C1。');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2085', '2019', 'a1_field2_1003', 'a1_field2', '当报告时点说明代码为32-月结日账户关闭时：除基础段外，至少还应包括月度表现信息段，账户类型不能为C1。');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2057', '2014', 'a6_field2_0007', 'a6_field2', '当单位性质为30-外资企业、40-个体、私营企业、50-其他（包括三资企业、民营企业、民间团体等）时，职业不能为2-国家机关、党群组织、企业、事业单位负责人、X-军人');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2058', '2015', 'table_name_A_0008', 'table_name_A', '证件类型、证件号码不能与基础段中的证件类型、证件号码完全相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2059', '2015', 'table_field_A_ID_0008', 'table_field_A_ID', '证件类型、证件号码不能与基础段中的证件类型、证件号码完全相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2060', '2015', 'table_field7_a1_0008', 'table_field7_a1', '证件类型、证件号码不能与基础段中的证件类型、证件号码完全相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2061', '2015', 'table_field7_a2_0008', 'table_field7_a2', '证件类型、证件号码不能与基础段中的证件类型、证件号码完全相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2062', '2015', 'table_field7_b2_0008', 'table_field7_b2', '证件类型、证件号码不能与基础段中的证件类型、证件号码完全相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2063', '2016', 'table_name_A_0009', 'table_name_A', '证件类型、证件号码不能与基础段中的证件类型、证件号码完全相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2064', '2016', 'table_field_A_ID_0009', 'table_field_A_ID', '证件类型、证件号码不能与基础段中的证件类型、证件号码完全相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2065', '2016', 'table_field7_a1_0009', 'table_field7_a1', '证件类型、证件号码不能与基础段中的证件类型、证件号码完全相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2066', '2016', 'table_field7_a2_0009', 'table_field7_a2', '证件类型、证件号码不能与基础段中的证件类型、证件号码完全相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2067', '2016', 'table_field7_b2_0009', 'table_field7_b2', '证件类型、证件号码不能与基础段中的证件类型、证件号码完全相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('10021', '10010', 'table_field_ASSO_ENT_CERT_TYPE_0001', 'table_field_ASSO_ENT_CERT_TYPE', '两组身份标识类型身份标识号码不能完全相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('10022', '10010', 'table_field_ENT_CERT_NUM_0001', 'table_field_ENT_CERT_NUM', '两组身份标识类型身份标识号码不能完全相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('10023', '10011', 'table_name_B_1001', 'table_name_B', '个人授信协议记录报送时，“基础段”和“额度信息段”必须出现');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('20018', '10018', 'table_field1_1010', 'table_field1', '借贷账户特殊事件说明记录的“信息报告日期”与“发生月份”中的年、月相等');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('10030', '715', 'n3_0101', 'n3', '1-保证');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('10031', '10024', 'table_field_DEL_END_DATE_0101', 'table_field_DEL_END_DATE', '待删除起始日期,待删除的终止日期不能同时为空值');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('10032', '10025', 'table_field_DEL_START_DATE_0101', 'table_field_DEL_START_DATE', '个人借贷待删除起始日期必须小于等于待删除结束日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('10033', '10025', 'm19_0101', 'm19', '个人借贷待删除起始日期必须小于等于待删除结束日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('10034', '10025', 'm20_0101', 'm20', '个人借贷待删除起始日期必须小于等于待删除结束日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('10035', '10025', 'm21_0101', 'm21', '个人借贷待删除起始日期必须小于等于待删除结束日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('10036', '10026', 'table_field_INF_REC_TYPE1_0101', 'table_field_INF_REC_TYPE1', '授信待更正业务标识码必须在库中存在');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('10037', '10026', 'inf_rec_type2_0101', 'inf_rec_type2', '授信待更正业务标识码必须在库中存在');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('10038', '10026', 'inf_rec_type3_0101', 'inf_rec_type3', '授信待更正业务标识码必须在库中存在');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2221', '2036', 'a1_field1_1020', 'a1_field1', '当报告时点说明代码为31-月结日首次上报存量账户,20-账户关闭,32-月结日账户关闭,若账户类型为R2，不应包含初始债权说明段、非月度表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2222', '2036', 'a1_field2_1020', 'a1_field2', '当报告时点说明代码为31-月结日首次上报存量账户,20-账户关闭,32-月结日账户关闭,若账户类型为R2，不应包含初始债权说明段、非月度表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2223', '2036', 'ms11_field1_1020', 'ms11_field1', '当报告时点说明代码为31-月结日首次上报存量账户,20-账户关闭,32-月结日账户关闭,若账户类型为R2，不应包含初始债权说明段、非月度表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2224', '2037', 'table_name2_B_1021', 'table_name2_B', '当报告时点说明代码为40-收回逾期款项时：不应包含月度表现信息段、大额专项分期信息段、抵质押物信息段、授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2225', '2037', 'table_name2_C_1021', 'table_name2_C', '当报告时点说明代码为40-收回逾期款项时：不应包含月度表现信息段、大额专项分期信息段、抵质押物信息段、授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2226', '2037', 'table_name2_D_1021', 'table_name2_D', '当报告时点说明代码为40-收回逾期款项时：不应包含月度表现信息段、大额专项分期信息段、抵质押物信息段、授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2227', '2037', 'table_name2_E_1021', 'table_name2_E', '当报告时点说明代码为40-收回逾期款项时：不应包含月度表现信息段、大额专项分期信息段、抵质押物信息段、授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2228', '2037', 'a1_field2_1021', 'a1_field2', '当报告时点说明代码为40-收回逾期款项时：不应包含月度表现信息段、大额专项分期信息段、抵质押物信息段、授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2229', '2038', 'field1_2000', 'field1', '若“还款方式”为“90-汇总报送，不区分还款方式”，则“还款频率”为“03-月”');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2230', '2038', 'table_field1_2000', 'table_field1', '若“还款方式”为“90-汇总报送，不区分还款方式”，则“还款频率”为“03-月”');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2231', '2038', 'field2_2000', 'field2', '若“还款方式”为“90-汇总报送，不区分还款方式”，则“还款频率”为“03-月”');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2232', '2039', 'field1_2001', 'field1', '若“还款方式”代码以“2”开头，则“还款期数”必须为 0。');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2233', '2039', 'table_field1_2001', 'table_field1', '若“还款方式”代码以“2”开头，则“还款期数”必须为 1。');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('881', '747', 'PBD_MCC_INF_SGMT_Table', 'table_3', '抵质押物信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('882', '747', 'PBE_ACCT_CRED_SGMT_Table', 'table_4', '授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('883', '747', 'PBF_OC_INF_SGMT_Table', 'table_5', '初始债权说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('884', '747', 'PBG_AMBLG_INF_SGMT_Table', 'table_6', '月度表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('885', '747', 'PBH_SPEC_PRD_SGMT_Table', 'table_7', '大额专项分期信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('886', '747', 'PBI_ACCT_DBT_INF_SGMT_Table', 'table_8', '非月度表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('887', '747', 'PBJ_AS_TRST_DSPN_SGMT_Table', 'table_9', '特殊交易说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('888', '747', 'MDFC_SGMT_CODE_B', 'num1', '待更正段段标：B-基础段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('889', '747', 'MDFC_SGMT_CODE_C', 'num2', '待更正段段标：C-基本信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('890', '747', 'MDFC_SGMT_CODE_D', 'num3', '待更正段段标：D-相关还款责任人段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('891', '747', 'MDFC_SGMT_CODE_E', 'num4', '待更正段段标：E-抵质押物信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('892', '747', 'MDFC_SGMT_CODE_F', 'num5', '待更正段段标：F-授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('893', '747', 'MDFC_SGMT_CODE_G', 'num6', '待更正段段标：G-初始债权说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('894', '747', 'MDFC_SGMT_CODE_H', 'num7', '待更正段段标：H-月度表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('895', '747', 'MDFC_SGMT_CODE_I', 'num8', '待更正段段标：I-大额专项分期信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('896', '747', 'MDFC_SGMT_CODE_J', 'num9', '待更正段段标：J-非月度表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('897', '747', 'MDFC_SGMT_CODE_K', 'num10', '待更正段段标：K-特殊交易说明段 ');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('898', '748', 'LAST_UPDATE_TIME_Column', 'table_field_1', '最后更新时间');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('899', '748', 'OPERATOR_USER_Column', 'table_field_2', '操作员');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('900', '748', 'ORG_NAME_Column', 'table_field_3', '数据来源机构名称');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('901', '748', 'ORG_CODE_Column', 'table_field_4', '数据来源机构编号');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('902', '748', 'BUSINESS_STATES_Column', 'table_field_5', '数据状态');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('903', '748', 'REJECT_REASON_Column', 'table_field_6', '驳回原因');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('904', '748', 'IS_FILTER_Column', 'table_field_7', '是否过滤标识(默认为N-不过滤)');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('905', '748', 'REPORT_MESSAGE_ID_Column', 'table_field_8', '报文文件ID');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('906', '748', 'EXTEND1_Column', 'table_field_9', '预留字段1');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('907', '748', 'EXTEND2_Column', 'table_field_10', '预留字段2');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('908', '748', 'EXTEND3_Column', 'table_field_11', '预留字段3');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('909', '748', 'INF_REC_TYPE_Column', 'table_field_12', '信息记录类型');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('910', '748', 'CONTRACT_CODE_Column', 'table_field_13', '授信协议标识码');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('911', '748', 'CONTRACT_CODE_Column', 'table_field_14', '授信协议标识码');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('912', '748', 'RPT_DATE_Column', 'table_field_15', '信息报告日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('913', '748', 'RPT_DATE_CODE_Column', 'table_field_16', '报告时点说明代码');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('914', '749', 'LAST_UPDATE_TIME_Column', 'table_field_1', '最后更新时间');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('915', '749', 'OPERATOR_USER_Column', 'table_field_2', '操作员');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('916', '749', 'ORG_NAME_Column', 'table_field_3', '数据来源机构名称');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('917', '749', 'ORG_CODE_Column', 'table_field_4', '数据来源机构编号');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('918', '749', 'BUSINESS_STATES_Column', 'table_field_5', '数据状态');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('919', '749', 'REJECT_REASON_Column', 'table_field_6', '驳回原因');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('920', '749', 'IS_FILTER_Column', 'table_field_7', '是否过滤标识(默认为N-不过滤)');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('921', '749', 'REPORT_MESSAGE_ID_Column', 'table_field_8', '报文文件ID');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('922', '749', 'EXTEND1_Column', 'table_field_9', '预留字段1');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('923', '749', 'EXTEND2_Column', 'table_field_10', '预留字段2');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('924', '749', 'EXTEND3_Column', 'table_field_11', '预留字段3');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('925', '749', 'INF_REC_TYPE_Column', 'table_field_12', '信息记录类型');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('926', '749', 'ACCT_TYPE_Column1', 'table_field_13', '账户类型');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('927', '749', 'ACCT_CODE_Column', 'table_field_14', '账户标识码');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('928', '749', 'RPT_DATE_Column', 'table_field_15', '信息报告日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('929', '749', 'RPT_DATE_CODE_Column', 'table_field_16', '报告时点说明代码');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('930', '750', 'LAST_UPDATE_TIME_Column', 'table_field_1', '最后更新时间');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('931', '750', 'OPERATOR_USER_Column', 'table_field_2', '操作员');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('932', '750', 'ORG_NAME_Column', 'table_field_3', '数据来源机构名称');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('933', '750', 'ORG_CODE_Column', 'table_field_4', '数据来源机构编号');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('934', '750', 'BUSINESS_STATES_Column', 'table_field_5', '数据状态');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('935', '750', 'REJECT_REASON_Column', 'table_field_6', '驳回原因');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('936', '750', 'IS_FILTER_Column', 'table_field_7', '是否过滤标识(默认为N-不过滤)');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('937', '750', 'REPORT_MESSAGE_ID_Column', 'table_field_8', '报文文件ID');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('938', '750', 'EXTEND1_Column', 'table_field_9', '预留字段1');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('939', '750', 'EXTEND2_Column', 'table_field_10', '预留字段2');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('940', '750', 'EXTEND3_Column', 'table_field_11', '预留字段3');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('941', '750', 'INF_REC_TYPE_Column', 'table_field_12', '信息记录类型');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('942', '750', 'ACCT_TYPE_Column1', 'table_field_13', '账户类型');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('943', '750', 'ACCT_CODE_Column', 'table_field_14', '账户标识码');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('944', '750', 'RPT_DATE_Column', 'table_field_15', '信息报告日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('945', '750', 'RPT_DATE_CODE_Column', 'table_field_16', '报告时点说明代码');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('946', '751', 'MDFC_SGMT_CODE_Column', 'table_field_1', '待更正段段标');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('947', '751', 'MDFC_SGMT_CODE_C', 'num1', '待更正段段标：C-共同受信人信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('948', '752', 'MDFC_SGMT_CODE_Column', 'table_field_1', '待更正段段标');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('949', '752', 'MDFC_SGMT_CODE_B', 'num1', '待更正段段标：B-基础段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('950', '753', 'MDFC_SGMT_CODE_Column', 'table_field_1', '待更正段段标');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('951', '753', 'MDFC_SGMT_CODE_B', 'num1', '待更正段段标：B-基础段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('952', '754', 'MDFC_SGMT_CODE_Column', 'table_field_1', '待更正段段标');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('953', '754', 'MDFC_SGMT_CODE_B', 'num1', '待更正段段标：B-基础段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('959', '756', 'MDFC_SGMT_CODE_Column', 'table_field_1', '待更正段段标');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('960', '756', 'MDFC_SGMT_CODE_B', 'num1', '待更正段段标：B-基础段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('961', '757', 'MDFC_SGMT_CODE_Column', 'table_field_1', '待更正段段标');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('962', '757', 'MDFC_SGMT_CODE_D', 'num1', '待更正段段标：D-在保责任信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('963', '758', 'MDFC_SGMT_CODE_Column', 'table_field_1', '待更正段段标');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('964', '758', 'MDFC_SGMT_CODE_E', 'num1', '待更正段段标：E-相关还款责任人段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('965', '759', 'MDFC_SGMT_CODE_Column', 'table_field_1', '待更正段段标');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('966', '759', 'MDFC_SGMT_CODE_F', 'num1', '待更正段段标：F-抵质押物信息段 ');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('967', '760', 'PBA_ACCT_BS_SGMT_Table', 'table_1', '基础段/个人借贷按段更正请求记录信息');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('968', '760', 'PBA_ACCT_BS_SGMT_ID_Column', 'table_pk_1', 'PBA_ACCT_BS_SGMT表主键');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('969', '760', 'MDFC_SGMT_CODE_Column', 'table_field_1', '待更正段段标');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('970', '760', 'MDFC_SGMT_CODE_H', 'num1', '待更正段段标：H-月度表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('971', '760', 'RPT_DATE_Column', 'table_field_2', '信息报告日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('973', '761', 'MDFC_SGMT_CODE_H', 'num1', '待更正段段标：H-月度表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('974', '762', 'PBH_SPEC_PRD_SGMT_Table', 'table_1', '大额专项分期信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('975', '762', 'MDFC_SGMT_CODE_Column', 'table_field_1', '待更正段段标');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('976', '762', 'MDFC_SGMT_CODE_I', 'num1', '待更正段段标：I-大额专项分期信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('977', '762', 'SPEC_EFCT_DATE_Column', 'table_field_2', '分期额度生效日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('978', '763', 'PBA_ACCT_BS_SGMT_Table', 'table_1', '基础段/个人借贷按段更正请求记录信息');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('979', '763', 'PBA_ACCT_BS_SGMT_ID_Column', 'table_pk_1', 'PBA_ACCT_BS_SGMT表主键');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('980', '763', 'PBK_IN_SPC_EVT_DSC_INF_Table', 'table_2', '个人借贷账户特殊事件说明记录');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('981', '763', 'MDFC_SGMT_CODE_Column', 'table_field_1', '待更正段段标');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('982', '763', 'MDFC_SGMT_CODE_H', 'num1', '待更正段段标：H-月度表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('983', '763', 'ACCT_TYPE_Column1', 'table_field_2', '账户类型');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('984', '763', 'ACCT_TYPE_R2', 'num2', '账户类型：R2-贷记卡账户');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('985', '763', 'OPETN_TYPE_Column', 'table_field_3', '事件类型');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('986', '763', 'NUM_12', 'num3', '事件类型：12-已注销信用卡账户重启');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('987', '763', 'NUM_4', 'num4', '账户状态:4-销户');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('988', '764', 'MDFC_SGMT_CODE_Column', 'table_field_1', '待更正段段标');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('989', '764', 'MDFC_SGMT_CODE_C', 'num1', '待更正段段标：C-基本信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2145', '2026', 'ms5_field2_1010', 'ms5_field2', '报告时点说明代码为10-新开户时，除基础段外，个人借贷账户信息记录至少包含基本信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2146', '2027', 'table_name2_B_1011', 'table_name2_B', '报告时点说明代码为10-新开户时，至少包含基本信息段：账户类型为D1，还应包含月度表现信息段。基本信息段中分次放款标志大于 0，应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2147', '2027', 'table_name2_C_1011', 'table_name2_C', '报告时点说明代码为10-新开户时，至少包含基本信息段：账户类型为D1，还应包含月度表现信息段。基本信息段中分次放款标志大于 0，应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2148', '2027', 'a1_field1_1011', 'a1_field1', '报告时点说明代码为10-新开户时，至少包含基本信息段：账户类型为D1，还应包含月度表现信息段。基本信息段中分次放款标志大于 0，应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2149', '2027', 'a1_field_type_1011', 'a1_field_type', '报告时点说明代码为10-新开户时，至少包含基本信息段：账户类型为D1，还应包含月度表现信息段。基本信息段中分次放款标志大于 0，应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2150', '2027', 'a1_field2_1011', 'a1_field2', '报告时点说明代码为10-新开户时，至少包含基本信息段：账户类型为D1，还应包含月度表现信息段。基本信息段中分次放款标志大于 0，应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2151', '2027', 'a1_field_FLAG1_1011', 'a1_field_FLAG1', '报告时点说明代码为10-新开户时，至少包含基本信息段：账户类型为D1，还应包含月度表现信息段。基本信息段中分次放款标志大于 0，应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2152', '2027', 'flag1_1011', 'flag1', '报告时点说明代码为10-新开户时，至少包含基本信息段：账户类型为D1，还应包含月度表现信息段。基本信息段中分次放款标志大于 0，应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2153', '2027', 'ms6_field1_1011', 'ms6_field1', '报告时点说明代码为10-新开户时，至少包含基本信息段：账户类型为D1，还应包含月度表现信息段。基本信息段中分次放款标志大于 0，应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2154', '2028', 'table_name2_A_1012', 'table_name2_A', '报告时点说明代码为10-新开户时，至少包含基本信息段：账户类型为D1，还应包含月度表现信息段。基本信息段中分次放款标志大于 1，应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2155', '2028', 'table_name2_A_PK_1012', 'table_name2_A_PK', '报告时点说明代码为10-新开户时，至少包含基本信息段：账户类型为D1，还应包含月度表现信息段。基本信息段中分次放款标志大于 1，应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2156', '2028', 'table_name2_C_1012', 'table_name2_C', '报告时点说明代码为10-新开户时，至少包含基本信息段：账户类型为D1，还应包含月度表现信息段。基本信息段中分次放款标志大于 1，应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2157', '2028', 'a1_field_type1_1012', 'a1_field_type1', '报告时点说明代码为10-新开户时，至少包含基本信息段：账户类型为D1，还应包含月度表现信息段。基本信息段中分次放款标志大于 1，应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2158', '2028', 'a1_field1_1012', 'a1_field1', '报告时点说明代码为10-新开户时，至少包含基本信息段：账户类型为D1，还应包含月度表现信息段。基本信息段中分次放款标志大于 1，应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2159', '2028', 'a1_field_code1_1012', 'a1_field_code1', '报告时点说明代码为10-新开户时，至少包含基本信息段：账户类型为D1，还应包含月度表现信息段。基本信息段中分次放款标志大于 1，应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2160', '2028', 'a1_field2_1012', 'a1_field2', '报告时点说明代码为10-新开户时，至少包含基本信息段：账户类型为D1，还应包含月度表现信息段。基本信息段中分次放款标志大于 1，应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2161', '2028', 'a1_field3_1012', 'a1_field3', '报告时点说明代码为10-新开户时，至少包含基本信息段：账户类型为D1，还应包含月度表现信息段。基本信息段中分次放款标志大于 1，应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2162', '2029', 'table_name2_A_1013', 'table_name2_A', '当报告时点说明代码为10-新开户,31-月结日首次上报存量账户,如果基本信息段中分次放款标志为0，还不应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2163', '2029', 'table_name2_C_1013', 'table_name2_C', '当报告时点说明代码为10-新开户,31-月结日首次上报存量账户,如果基本信息段中分次放款标志为0，还不应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2164', '2029', 'table_field_A_pk_1013', 'table_field_A_pk', '当报告时点说明代码为10-新开户,31-月结日首次上报存量账户,如果基本信息段中分次放款标志为0，还不应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2165', '2029', 'a1_field_type1_1013', 'a1_field_type1', '当报告时点说明代码为10-新开户,31-月结日首次上报存量账户,如果基本信息段中分次放款标志为0，还不应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2166', '2029', 'a1_field1_1013', 'a1_field1', '当报告时点说明代码为10-新开户,31-月结日首次上报存量账户,如果基本信息段中分次放款标志为0，还不应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2208', '2034', 'a1_field1_1018', 'a1_field1', '当报告时点说明代码为10-新开户时，若账户类型为R2，不应包含初始债权说明段、非月度表现信息段、特殊交易说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2209', '2034', 'a1_field2_1018', 'a1_field2', '当报告时点说明代码为10-新开户时，若账户类型为R2，不应包含初始债权说明段、非月度表现信息段、特殊交易说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2210', '2034', 'ms10_field1_1018', 'ms10_field1', '当报告时点说明代码为10-新开户时，若账户类型为R2，不应包含初始债权说明段、非月度表现信息段、特殊交易说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2211', '2035', 'table_name2_B_1019', 'table_name2_B', '当报告时点说明代码为30-月度结算,31-月结日首次上报存量账户,32-月结日账户关闭时：若账户类型为D1/R1/R3/R4，不应包含初始债权说明段、非月度表现信息段、大额专项分期信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2212', '2035', 'table_name2_C_1019', 'table_name2_C', '当报告时点说明代码为30-月度结算,31-月结日首次上报存量账户,32-月结日账户关闭时：若账户类型为D1/R1/R3/R4，不应包含初始债权说明段、非月度表现信息段、大额专项分期信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2213', '2035', 'table_name2_D_1019', 'table_name2_D', '当报告时点说明代码为30-月度结算,31-月结日首次上报存量账户,32-月结日账户关闭时：若账户类型为D1/R1/R3/R4，不应包含初始债权说明段、非月度表现信息段、大额专项分期信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2214', '2035', 'a1_field_type1_1019', 'a1_field_type1', '当报告时点说明代码为30-月度结算,31-月结日首次上报存量账户,32-月结日账户关闭时：若账户类型为D1/R1/R3/R4，不应包含初始债权说明段、非月度表现信息段、大额专项分期信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2215', '2035', 'a1_field1_1019', 'a1_field1', '当报告时点说明代码为30-月度结算,31-月结日首次上报存量账户,32-月结日账户关闭时：若账户类型为D1/R1/R3/R4，不应包含初始债权说明段、非月度表现信息段、大额专项分期信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2216', '2035', 'a1_field2_1019', 'a1_field2', '当报告时点说明代码为30-月度结算,31-月结日首次上报存量账户,32-月结日账户关闭时：若账户类型为D1/R1/R3/R4，不应包含初始债权说明段、非月度表现信息段、大额专项分期信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2217', '2035', 'ms10_field1_1019', 'ms10_field1', '当报告时点说明代码为30-月度结算,31-月结日首次上报存量账户,32-月结日账户关闭时：若账户类型为D1/R1/R3/R4，不应包含初始债权说明段、非月度表现信息段、大额专项分期信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2218', '2036', 'table_name2_B_1020', 'table_name2_B', '当报告时点说明代码为31-月结日首次上报存量账户,20-账户关闭,32-月结日账户关闭,若账户类型为R2，不应包含初始债权说明段、非月度表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2219', '2036', 'table_name2_C_1020', 'table_name2_C', '当报告时点说明代码为31-月结日首次上报存量账户,20-账户关闭,32-月结日账户关闭,若账户类型为R2，不应包含初始债权说明段、非月度表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2220', '2036', 'a1_field_type1_1020', 'a1_field_type1', '当报告时点说明代码为31-月结日首次上报存量账户,20-账户关闭,32-月结日账户关闭,若账户类型为R2，不应包含初始债权说明段、非月度表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2263', '2048', 'field2_2010', 'field2', '若“当前还款状态”为“N”或“M”，则“当前逾期期数”、“当前逾期总额”必须为0（若此账户没有上述数据项，则不校验此数据项）');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2264', '2048', 'table_field2_2010', 'table_field2', '若“当前还款状态”为“N”或“M”，则“当前逾期期数”、“当前逾期总额”必须为0（若此账户没有上述数据项，则不校验此数据项）');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2265', '2048', 'field3_2010', 'field3', '若“当前还款状态”为“N”或“M”，则“当前逾期期数”、“当前逾期总额”必须为0（若此账户没有上述数据项，则不校验此数据项）');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2266', '2049', 'field1_2011', 'field1', '若“当前还款状态”为“N”或“M”，则“当前逾期期数”、“当前逾期总额”必须为0');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2267', '2049', 'table_field1_2011', 'table_field1', '若“当前还款状态”为“N”或“M”，则“当前逾期期数”、“当前逾期总额”必须为0');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2268', '2049', 'field2_2011', 'field2', '若“当前还款状态”为“N”或“M”，则“当前逾期期数”、“当前逾期总额”必须为0');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2269', '2049', 'table_field2_2011', 'table_field2', '若“当前还款状态”为“N”或“M”，则“当前逾期期数”、“当前逾期总额”必须为0');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2270', '2049', 'field3_2011', 'field3', '若“当前还款状态”为“N”或“M”，则“当前逾期期数”、“当前逾期总额”必须为0');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2271', '2050', 'field1_2012', 'field1', '若“当前还款状态”为数字“1-7”，则“当前逾期期数”、“当前逾期总额”必须大于0');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2272', '2050', 'table_field1_2012', 'table_field1', '若“当前还款状态”为数字“1-7”，则“当前逾期期数”、“当前逾期总额”必须大于0');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2273', '2050', 'field2_2012', 'field2', '若“当前还款状态”为数字“1-7”，则“当前逾期期数”、“当前逾期总额”必须大于0');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2274', '2050', 'table_field2_2012', 'table_field2', '若“当前还款状态”为数字“1-7”，则“当前逾期期数”、“当前逾期总额”必须大于0');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2275', '2051', 'table_name_B_2013', 'table_name_B', '对于 D1/R1/R4 账户，信息记录中“当前逾期本金”必须小于等于“当前逾期总额');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2276', '2051', 'table_field_B_PK_2013', 'table_field_B_PK', '对于 D1/R1/R4 账户，信息记录中“当前逾期本金”必须小于等于“当前逾期总额');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2277', '2051', 'table_field1_2013', 'table_field1', '对于 D1/R1/R4 账户，信息记录中“当前逾期本金”必须小于等于“当前逾期总额');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2278', '2051', 'field1_2013', 'field1', '对于 D1/R1/R4 账户，信息记录中“当前逾期本金”必须小于等于“当前逾期总额');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2279', '2051', 'table_field2_2013', 'table_field2', '对于 D1/R1/R4 账户，信息记录中“当前逾期本金”必须小于等于“当前逾期总额');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2280', '2052', 'field1_2014', 'field1', '若“账户状态”为“3-关闭”/“4-销户”，“余额”应为 0');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2281', '2052', 'table_field1_2014', 'table_field1', '若“账户状态”为“3-关闭”/“4-销户”，“余额”应为 0');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2282', '2052', 'field2_2014', 'field2', '若“账户状态”为“3-关闭”/“4-销户”，“余额”应为 0');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2283', '2053', 'field1_2015', 'field1', '“账户状态”和“当前还款状态”需要保持一致：“账户状态”为“3-关闭”/“4-销户”时，“当前还款状态”应为“C-结清”/“C-销户”、“G-结束');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2284', '2053', 'table_field2_2015', 'table_field2', '“账户状态”和“当前还款状态”需要保持一致：“账户状态”为“3-关闭”/“4-销户”时，“当前还款状态”应为“C-结清”/“C-销户”、“G-结束');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2285', '2053', 'field2_2015', 'field2', '“账户状态”和“当前还款状态”需要保持一致：“账户状态”为“3-关闭”/“4-销户”时，“当前还款状态”应为“C-结清”/“C-销户”、“G-结束');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2286', '2054', 'table_field1_2016', 'table_field1', '若“账户关闭日期”数据项不为空，则“账户关闭日期”应不早于“结算/应还款日”、最近一次实际还款日期”、五级分类认定日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2287', '2054', 'table_field2_2016', 'table_field2', '若“账户关闭日期”数据项不为空，则“账户关闭日期”应不早于“结算/应还款日”、最近一次实际还款日期”、五级分类认定日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2288', '2054', 'table_field3_2016', 'table_field3', '若“账户关闭日期”数据项不为空，则“账户关闭日期”应不早于“结算/应还款日”、最近一次实际还款日期”、五级分类认定日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2289', '2055', 'field1_2017', 'field1', '若“账户状态”为“3-关闭”/“4-销户”，“账户关闭日期”不能为空值');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2290', '2055', 'table_field1_2017', 'table_field1', '若“账户状态”为“3-关闭”/“4-销户”，“账户关闭日期”不能为空值');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2291', '2056', 'field1_2018', 'field1', '若“账户状态”为“2-结束”，则“账户关闭日期”不能为空值');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2121', '2023', 'ms3_field4_1007', 'ms3_field4', '当报告时点说明代码为10-新开户时，至少包含基本信息段：若账户类型为R2，还应包含月度表现段。如果基本信息段中的借贷业务种类细分不是大额专项分期卡，还应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2122', '2023', 'ms3_field5_1007', 'ms3_field5', '当报告时点说明代码为10-新开户时，至少包含基本信息段：若账户类型为R2，还应包含月度表现段。如果基本信息段中的借贷业务种类细分不是大额专项分期卡，还应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2295', '2057', 'field2_2019', 'field2', '当账户状态为“关闭”/“销户”时，“当前逾期总额”、“当前逾期期数”应为 0');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2236', '2041', 'field1_2003', 'field1', '若“还款责任人类型”为“2-保证人”，则“还款责任金额”不能为空值');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2237', '2041', 'table_field1_2003', 'table_field1', '若“还款责任人类型”为“2-保证人”，则“还款责任金额”不能为空值');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2238', '2042', 'field1_2004', 'field1', '当“还款责任人类型”为“2-保证人”时，“联保标志”、“保证合同编号”不应为空');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2239', '2042', 'table_field1_2004', 'table_field1', '当“还款责任人类型”为“3-保证人”时，“联保标志”、“保证合同编号”不应为空');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2240', '2042', 'table_field2_2004', 'table_field2', '当“还款责任人类型”为“4-保证人”时，“联保标志”、“保证合同编号”不应为空');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2241', '2043', 'field1_2005', 'field1', '对于 R2 账户，“当前还款状态”为“*-当月未使用额度且不需要还款”时，“实际还款比例”应为空值');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2242', '2043', 'table_field1_2005', 'table_field1', '对于 R2 账户，“当前还款状态”为“*-当月未使用额度且不需要还款”时，“实际还款比例”应为空值');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2243', '2044', 'table_field1_2006', 'table_field1', '“结算/应还款日”与“月份”中的年、月必须保持一致');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2244', '2045', 'field1_2007', 'field1', '若账户信息记录中的“账户状态”为“41-呆账（进入核销认定程序，等待核销）”/“51-呆账（进入核销认定程序，等待核销）”、“42-呆账（已核销）”/“52-呆账（已核销）”时，“当前逾期总额”不能为 0');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2245', '2045', 'table_field1_2007', 'table_field1', '若账户信息记录中的“账户状态”为“41-呆账（进入核销认定程序，等待核销）”/“51-呆账（进入核销认定程序，等待核销）”、“42-呆账（已核销）”/“52-呆账（已核销）”时，“当前逾期总额”不能为 1');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2246', '2045', 'field2_2007', 'field2', '若账户信息记录中的“账户状态”为“41-呆账（进入核销认定程序，等待核销）”/“51-呆账（进入核销认定程序，等待核销）”、“42-呆账（已核销）”/“52-呆账（已核销）”时，“当前逾期总额”不能为 2');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2247', '2046', 'field1_2008', 'field1', '若“账户状态”为“6-未激活”时，则“余额”、“当前逾期期数”、“当前逾期总额”必须为 0，“当前还款状态”必须为“*”（若此账户没有上述数据项，则不校验此数据项）。');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2305', '2062', 'table_field_A_pk_3000', 'table_field_A_pk', '当账户信息记录中账户类型为R3时，透支 181 天以上未还余额应该小于等于余额');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2306', '2062', 'a1_field2_3000', 'a1_field2', '当账户信息记录中账户类型为R3时，透支 182 天以上未还余额应该小于等于余额');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2307', '2062', 'a1_field_type1_3000', 'a1_field_type1', '当账户信息记录中账户类型为R3时，透支 183 天以上未还余额应该小于等于余额');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2308', '2062', 'b1_field1_3000', 'b1_field1', '当账户信息记录中账户类型为R3时，透支 184 天以上未还余额应该小于等于余额');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2309', '2063', 'table_name_A_3001', 'table_name_A', '当账户信息记录中账户类型为R3时，当前还款状态为*时，余额必须为 0');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2310', '2063', 'table_field_A_pk_3001', 'table_field_A_pk', '当账户信息记录中账户类型为R3时，当前还款状态为*时，余额必须为 1');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2311', '2063', 'a1_field2_3001', 'a1_field2', '当账户信息记录中账户类型为R3时，当前还款状态为*时，余额必须为 2');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2312', '2063', 'a1_field_type1_3001', 'a1_field_type1', '当账户信息记录中账户类型为R3时，当前还款状态为*时，余额必须为 3');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2313', '2063', 'b1_field1_3001', 'b1_field1', '当账户信息记录中账户类型为R3时，当前还款状态为*时，余额必须为 4');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2314', '2063', 'b1_field_type1_3001', 'b1_field_type1', '当账户信息记录中账户类型为R3时，当前还款状态为*时，余额必须为 5');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2315', '2063', 'b2_field_type2_3001', 'b2_field_type2', '当账户信息记录中账户类型为R3时，当前还款状态为*时，余额必须为 6');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2316', '2064', 'table_name_A_3002', 'table_name_A', '当账户信息记录中账户类型为R3时，当前还款状态为数字1-7时，余额必须大于 0');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2317', '2064', 'table_field_A_pk_3002', 'table_field_A_pk', '当账户信息记录中账户类型为R3时，当前还款状态为数字1-7时，余额必须大于 1');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2318', '2064', 'a1_field1_3002', 'a1_field1', '当账户信息记录中账户类型为R3时，当前还款状态为数字1-7时，余额必须大于 2');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2319', '2064', 'a1_field_type1_3002', 'a1_field_type1', '当账户信息记录中账户类型为R3时，当前还款状态为数字1-7时，余额必须大于 3');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2320', '2064', 'b1_field1_3002', 'b1_field1', '当账户信息记录中账户类型为R3时，当前还款状态为数字1-7时，余额必须大于 4');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2321', '2064', 'b1_field_type1_3002', 'b1_field_type1', '当账户信息记录中账户类型为R3时，当前还款状态为数字1-7时，余额必须大于 5');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2322', '2064', 'b1_field_type2_3002', 'b1_field_type2', '当账户信息记录中账户类型为R3时，当前还款状态为数字1-7时，余额必须大于 6');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2323', '2065', 'table_name_A_3003', 'table_name_A', '当账户类型为C1时，借贷业务大类只能为5-资产处置、6-垫款 当账户类型为R2/R3时，借贷业务大类只能为2-信用卡');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2324', '2065', 'table_field_A_pk_3003', 'table_field_A_pk', '当账户类型为C1时，借贷业务大类只能为5-资产处置、6-垫款 当账户类型为R2/R3时，借贷业务大类只能为3-信用卡');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2325', '2065', 'a1_field1_3003', 'a1_field1', '当账户类型为C1时，借贷业务大类只能为5-资产处置、6-垫款 当账户类型为R2/R3时，借贷业务大类只能为4-信用卡');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2326', '2065', 'a1_field_type1_3003', 'a1_field_type1', '当账户类型为C1时，借贷业务大类只能为5-资产处置、6-垫款 当账户类型为R2/R3时，借贷业务大类只能为5-信用卡');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2327', '2065', 'b1_field1_3003', 'b1_field1', '当账户类型为C1时，借贷业务大类只能为5-资产处置、6-垫款 当账户类型为R2/R3时，借贷业务大类只能为6-信用卡');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2328', '2065', 'a1_field_type2_3003', 'a1_field_type2', '当账户类型为C1时，借贷业务大类只能为5-资产处置、6-垫款 当账户类型为R2/R3时，借贷业务大类只能为7-信用卡');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2329', '2065', 'b1_field2_3003', 'b1_field2', '当账户类型为C1时，借贷业务大类只能为5-资产处置、6-垫款 当账户类型为R2/R3时，借贷业务大类只能为8-信用卡');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2330', '2066', 'table_name_A_3004', 'table_name_A', '若报告时点说明代码为32-月结日账户关闭和20-账户关闭时，账户状态为3-关闭,4-销户');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2331', '2066', 'table_field_A_pk_3004', 'table_field_A_pk', '若报告时点说明代码为32-月结日账户关闭和20-账户关闭时，账户状态为3-关闭,5-销户');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2332', '2066', 'table_name_C_3004', 'table_name_C', '若报告时点说明代码为32-月结日账户关闭和20-账户关闭时，账户状态为3-关闭,6-销户');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2333', '2066', 'a1_field1_3004', 'a1_field1', '若报告时点说明代码为32-月结日账户关闭和20-账户关闭时，账户状态为3-关闭,7-销户');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2334', '2066', 'a1_field_code1_3004', 'a1_field_code1', '若报告时点说明代码为32-月结日账户关闭和20-账户关闭时，账户状态为3-关闭,8-销户');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2335', '2066', 'b1_field1_3004', 'b1_field1', '若报告时点说明代码为32-月结日账户关闭和20-账户关闭时，账户状态为3-关闭,9-销户');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2336', '2067', 'table_name_A_3005', 'table_name_A', '借款人证件类型、证件号码和责任人身份标识类型、责任人身份标识号码不能完全相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2337', '2067', 'table_field_A_pk_3005', 'table_field_A_pk', '借款人证件类型、证件号码和责任人身份标识类型、责任人身份标识号码不能完全相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2338', '2067', 'a1_field1_3005', 'a1_field1', '借款人证件类型、证件号码和责任人身份标识类型、责任人身份标识号码不能完全相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2339', '2067', 'b1_field2_3005', 'b1_field2', '借款人证件类型、证件号码和责任人身份标识类型、责任人身份标识号码不能完全相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2340', '2067', 'a1_field2_3005', 'a1_field2', '借款人证件类型、证件号码和责任人身份标识类型、责任人身份标识号码不能完全相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2341', '2068', 'table_name_A_3006', 'table_name_A', '对于 C1 外的其他账户，非月度表现中的账户状态不应为关闭或销户');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2342', '2068', 'table_field_A_pk_3006', 'table_field_A_pk', '对于 C2 外的其他账户，非月度表现中的账户状态不应为关闭或销户');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2343', '2068', 'a1_field1_3006', 'a1_field1', '对于 C3 外的其他账户，非月度表现中的账户状态不应为关闭或销户');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2344', '2068', 'a1_field_code1_3006', 'a1_field_code1', '对于 C4 外的其他账户，非月度表现中的账户状态不应为关闭或销户');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2345', '2068', 'b1_field1_3006', 'b1_field1', '对于 C5 外的其他账户，非月度表现中的账户状态不应为关闭或销户');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME)
 Values
   ('10000', '721', 'n2_num', 'n2');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('10001', '722', 'n2_num2', 'n2', '还款方式：11,12,13,14,15,19,21,22,23,29');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('10002', '716', 'n3_num2', 'n3', '担保方式:2-质押、3-抵押');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME)
 Values
   ('10003', '721', 'n1_num2', 'n1');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME)
 Values
   ('10004', '722', 'n1_num1', 'n1');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME)
 Values
   ('10006', '732', 'table_pk_id', 'table_pk_1');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME)
 Values
   ('10007', '732', 'EDB_ACCT_BS_INF_SGMT_table_1', 'table_1');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME)
 Values
   ('10008', '732', 'EDH_ACCT_SPEC_TRST_DSPN_SGMT_table_3', 'table_3');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME)
 Values
   ('10009', '33', 'table_field_ACCT_CODe2_01', 'table_field_ACCT_CODe2');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME)
 Values
   ('10010', '41', 'table_field_ACCT_CODe2_02', 'table_field_ACCT_CODe2');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME)
 Values
   ('10011', '42', 'table_field_ACCT_CODe2_003', 'table_field_ACCT_CODe2');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME)
 Values
   ('10012', '43', 'table_field_ACCT_CODe2_04', 'table_field_ACCT_CODe2');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME)
 Values
   ('100013', '748', 'num1_01', 'num1');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME)
 Values
   ('10014', '778', 'num5_0001', 'num5');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('10020', '10010', 'table_field_ENT_CERT_TYPE_0001', 'table_field_ENT_CERT_TYPE', '两组身份标识类型身份标识号码不能完全相同');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2123', '2023', 'ms3_field6_1007', 'ms3_field6', '当报告时点说明代码为10-新开户时，至少包含基本信息段：若账户类型为R2，还应包含月度表现段。如果基本信息段中的借贷业务种类细分不是大额专项分期卡，还应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2124', '2024', 'table_name2_B_1008', 'table_name2_B', '当报告时点说明代码为10-新开户时，除基础段外，至少包含基本信息段：若账户类型为R1/R3/R4，还应包含月度表现信息段、授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2125', '2024', 'table_name2_C_1008', 'table_name2_C', '当报告时点说明代码为10-新开户时，除基础段外，至少包含基本信息段：若账户类型为R1/R3/R4，还应包含月度表现信息段、授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2126', '2024', 'table_field_type_1008', 'table_field_type', '当报告时点说明代码为10-新开户时，除基础段外，至少包含基本信息段：若账户类型为R1/R3/R4，还应包含月度表现信息段、授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2127', '2024', 'a1_field2_1008', 'a1_field2', '当报告时点说明代码为10-新开户时，除基础段外，至少包含基本信息段：若账户类型为R1/R3/R4，还应包含月度表现信息段、授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2128', '2024', 'a1_field1_1008', 'a1_field1', '当报告时点说明代码为10-新开户时，除基础段外，至少包含基本信息段：若账户类型为R1/R3/R4，还应包含月度表现信息段、授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2129', '2024', 'ms4_field1_1008', 'ms4_field1', '当报告时点说明代码为10-新开户时，除基础段外，至少包含基本信息段：若账户类型为R1/R3/R4，还应包含月度表现信息段、授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2130', '2024', 'ms4_field2_1008', 'ms4_field2', '当报告时点说明代码为10-新开户时，除基础段外，至少包含基本信息段：若账户类型为R1/R3/R4，还应包含月度表现信息段、授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2131', '2024', 'ms4_field3_1008', 'ms4_field3', '当报告时点说明代码为10-新开户时，除基础段外，至少包含基本信息段：若账户类型为R1/R3/R4，还应包含月度表现信息段、授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2132', '2024', 'ms4_field4_1008', 'ms4_field4', '当报告时点说明代码为10-新开户时，除基础段外，至少包含基本信息段：若账户类型为R1/R3/R4，还应包含月度表现信息段、授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2133', '2025', 'table_name2_B_1009', 'table_name2_B', '当报告时点说明代码为10-新开户时，除基础段外，至少包含基本信息段，若账户类型为C1，还应包含初始债权说明段、非月度表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2134', '2025', 'table_name2_C_1009', 'table_name2_C', '当报告时点说明代码为10-新开户时，除基础段外，至少包含基本信息段，若账户类型为C1，还应包含初始债权说明段、非月度表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2135', '2025', 'table_field_type_1009', 'table_field_type', '当报告时点说明代码为10-新开户时，除基础段外，至少包含基本信息段，若账户类型为C1，还应包含初始债权说明段、非月度表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2136', '2025', 'a1_field2_1009', 'a1_field2', '当报告时点说明代码为10-新开户时，除基础段外，至少包含基本信息段，若账户类型为C1，还应包含初始债权说明段、非月度表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2137', '2025', 'a1_field1_1009', 'a1_field1', '当报告时点说明代码为10-新开户时，除基础段外，至少包含基本信息段，若账户类型为C1，还应包含初始债权说明段、非月度表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2138', '2025', 'ms4_field1_1009', 'ms4_field1', '当报告时点说明代码为10-新开户时，除基础段外，至少包含基本信息段，若账户类型为C1，还应包含初始债权说明段、非月度表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2139', '2025', 'ms4_field2_1009', 'ms4_field2', '当报告时点说明代码为10-新开户时，除基础段外，至少包含基本信息段，若账户类型为C1，还应包含初始债权说明段、非月度表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2140', '2025', 'ms4_field3_1009', 'ms4_field3', '当报告时点说明代码为10-新开户时，除基础段外，至少包含基本信息段，若账户类型为C1，还应包含初始债权说明段、非月度表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2141', '2025', 'ms4_field4_1009', 'ms4_field4', '当报告时点说明代码为10-新开户时，除基础段外，至少包含基本信息段，若账户类型为C1，还应包含初始债权说明段、非月度表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2142', '2026', 'table_name2_B_1010', 'table_name2_B', '报告时点说明代码为10-新开户时，除基础段外，个人借贷账户信息记录至少包含基本信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2143', '2026', 'a1_field1_1010', 'a1_field1', '报告时点说明代码为10-新开户时，除基础段外，个人借贷账户信息记录至少包含基本信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2144', '2026', 'ms5_field1_1010', 'ms5_field1', '报告时点说明代码为10-新开户时，除基础段外，个人借贷账户信息记录至少包含基本信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2041', '2009', 'table_field_a9_0002', 'table_field_a9', '若就业状况为11-国家公务员、13-专业技术人员、17-职员、21-企业管理人员、24-工人或100-在职时，单位名称、单位性质、单位所属行业、单位详细地址、单位所在地邮编、单位所在地行政区划、单位电话、职业、职务、职称和本单位工作起始年份必须出现；若“就业状况为上述以外的代码，上述数据项不能出现。');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2042', '2009', 'table_field_a10_0002', 'table_field_a10', '若就业状况为11-国家公务员、13-专业技术人员、17-职员、21-企业管理人员、24-工人或101-在职时，单位名称、单位性质、单位所属行业、单位详细地址、单位所在地邮编、单位所在地行政区划、单位电话、职业、职务、职称和本单位工作起始年份必须出现；若“就业状况为上述以外的代码，上述数据项不能出现。');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2043', '2009', 'table_field_a11_0002', 'table_field_a11', '若就业状况为11-国家公务员、13-专业技术人员、17-职员、21-企业管理人员、24-工人或102-在职时，单位名称、单位性质、单位所属行业、单位详细地址、单位所在地邮编、单位所在地行政区划、单位电话、职业、职务、职称和本单位工作起始年份必须出现；若“就业状况为上述以外的代码，上述数据项不能出现。');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2044', '2010', 'a2_field_0003', 'a2_field', '若婚姻状况为20-已婚、21-初婚、22-再婚、23-复婚时，配偶姓名、配偶证件类型、配偶证件号码、配偶联系电话、配偶工作单位必须出现；若婚姻状况为上述以外的代码，上述数据项不能出现。');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2045', '2010', 'table_field2_a1_0003', 'table_field2_a1', '若婚姻状况为20-已婚、21-初婚、22-再婚、24-复婚时，配偶姓名、配偶证件类型、配偶证件号码、配偶联系电话、配偶工作单位必须出现；若婚姻状况为上述以外的代码，上述数据项不能出现。');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2046', '2010', 'table_field2_a2_0003', 'table_field2_a2', '若婚姻状况为20-已婚、21-初婚、22-再婚、25-复婚时，配偶姓名、配偶证件类型、配偶证件号码、配偶联系电话、配偶工作单位必须出现；若婚姻状况为上述以外的代码，上述数据项不能出现。');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2047', '2010', 'table_field2_a3_0003', 'table_field2_a3', '若婚姻状况为20-已婚、21-初婚、22-再婚、26-复婚时，配偶姓名、配偶证件类型、配偶证件号码、配偶联系电话、配偶工作单位必须出现；若婚姻状况为上述以外的代码，上述数据项不能出现。');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2048', '2010', 'table_field2_a4_0003', 'table_field2_a4', '若婚姻状况为20-已婚、21-初婚、22-再婚、27-复婚时，配偶姓名、配偶证件类型、配偶证件号码、配偶联系电话、配偶工作单位必须出现；若婚姻状况为上述以外的代码，上述数据项不能出现。');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2049', '2010', 'table_field2_a5_0003', 'table_field2_a5', '若婚姻状况为20-已婚、21-初婚、22-再婚、28-复婚时，配偶姓名、配偶证件类型、配偶证件号码、配偶联系电话、配偶工作单位必须出现；若婚姻状况为上述以外的代码，上述数据项不能出现。');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2050', '2011', 'table_field3_a1_0004', 'table_field3_a1', '出生日期应不晚于信息更新日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2051', '2012', 'table_field4_a1_0005', 'table_field4_a1', '配偶证件类型、配偶证件号码其中之一不为空时，另一个应不为空');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2052', '2013', 'table_field5_a1_0006', 'table_field5_a1', '当学历为30-大专、40-中专、职高、技校、70-初中、80-小学时，学位只能为5-无或9-未知');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2053', '2013', 'a5_field1_0006', 'a5_field1', '当学历为30-大专、40-中专、职高、技校、70-初中、80-小学时，学位只能为5-无或10-未知');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2054', '2013', 'a5_field2_0006', 'a5_field2', '当学历为30-大专、40-中专、职高、技校、70-初中、80-小学时，学位只能为5-无或11-未知');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2055', '2014', 'table_field6_a1_0007', 'table_field6_a1', '当单位性质为30-外资企业、40-个体、私营企业、50-其他（包括三资企业、民营企业、民间团体等）时，职业不能为0-国家机关、党群组织、企业、事业单位负责人、X-军人');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2056', '2014', 'a6_field1_0007', 'a6_field1', '当单位性质为30-外资企业、40-个体、私营企业、50-其他（包括三资企业、民营企业、民间团体等）时，职业不能为1-国家机关、党群组织、企业、事业单位负责人、X-军人');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('842', '738', 'LAT_AGRR_RPY_DATE_Column', 'table_field_5', '最近一次约定还款日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('843', '738', 'NXT_AGRR_RPY_DATE_Column', 'table_field_6', '下一次约定还款日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('844', '738', 'CLOSE_DATE_Column', 'table_field_7', '账户关闭日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('845', '738', 'TRAN_DATE_Column', 'table_field_8', '交易日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('846', '739', 'EDG_ACT_LBLTY_INF_SGMT_Table', 'table_1', '企业借贷还款表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('847', '739', 'NUM_20', 'num1', '报告时点说明代码:20-账户关闭');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('848', '739', 'ACCT_STATUS_Column', 'table_field_1', '账户状态');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('849', '739', 'NUM_21', 'num2', '账户状态:21-关闭');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('850', '740', 'EDA_ACCT_BS_SGMT_Table', 'table_1', '企业借贷基础段/企业借贷账户按段更正类请求记录');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2167', '2029', 'table_field_code1_1013', 'table_field_code1', '当报告时点说明代码为10-新开户,31-月结日首次上报存量账户,如果基本信息段中分次放款标志为0，还不应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2168', '2029', 'a1_field2_1013', 'a1_field2', '当报告时点说明代码为10-新开户,31-月结日首次上报存量账户,如果基本信息段中分次放款标志为0，还不应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2169', '2029', 'b1_field3_1013', 'b1_field3', '当报告时点说明代码为10-新开户,31-月结日首次上报存量账户,如果基本信息段中分次放款标志为0，还不应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('855', '741', 'EDB_ACCT_BS_INF_SGMT_Table', 'table_1', '企业借贷基本信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('856', '741', 'EDA_ACCT_BS_SGMT_ID_Column', 'table_pk_1', 'EDA_ACCT_BS_SGMT主键');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('857', '741', 'LOAN_AMT_Column', 'table_field_1', '借款金额');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('858', '742', 'EDA_ACCT_BS_SGMT_Table', 'table_1', '企业借贷基础段/企业借贷账户按段更正类请求记录');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('859', '742', 'EDA_ACCT_BS_SGMT_ID_Column', 'table_pk_1', 'EDA_ACCT_BS_SGMT主键');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('860', '742', 'ACCT_TYPE_Column2', 'table_field_1', '账户类型');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('861', '742', 'ACCT_TYPE_D1', 'num1', '账户类型:D1');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('862', '742', 'REPAY_MODE_D1', 'num2', '还款方式：账户类型为D1时对应的还款方式');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('863', '742', 'ACCT_TYPE_R1', 'num3', '账户类型:R1');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('864', '742', 'REPAY_MODE_R1', 'num4', '还款方式：账户类型为R1时对应的还款方式');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('865', '742', 'ACCT_TYPE_R4', 'num5', '账户类型:R4');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('866', '742', 'REPAY_MODE_R4', 'num6', '还款方式：账户类型为R4时对应的还款方式');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('869', '743', 'EDA_ACCT_BS_SGMT_Table', 'table_1', '企业借贷基础段/企业借贷账户按段更正类请求记录');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('870', '743', 'EDA_ACCT_BS_SGMT_ID_Column', 'table_pk_1', 'EDA_ACCT_BS_SGMT主键');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('871', '743', 'ID_NUM_Column', 'table_field_1', '借款人身份标识号码');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('872', '743', 'ARLP_TYPE_Column', 'table_field_2', '责任人名称');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('873', '743', 'ID_TYPE_Column', 'table_field_3', '借款人名称');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('874', '746', 'PCB_CTRCT_CERT_REL_SGMT_Table', 'table_1', '共同受信人信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('875', '746', 'PCC_CREDIT_LIM_SGMT_Table', 'table_2', '额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('876', '746', 'MDFC_SGMT_CODE_B', 'num1', '待更正段段标：B-基础段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('877', '746', 'MDFC_SGMT_CODE_C', 'num2', '待更正段段标：C-共同受信人信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('878', '746', 'MDFC_SGMT_CODE_D', 'num3', '待更正段段标：D-额度信息段 ');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('879', '747', 'PBB_ACCT_BS_INF_SGMT_Table', 'table_1', '基本信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('880', '747', 'PBC_RLT_REPYMT_INF_SGMT_Table', 'table_2', '相关还款责任人段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('990', '765', 'MDFC_SGMT_CODE_Column', 'table_field_1', '待更正段段标');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('991', '765', 'MDFC_SGMT_CODE_I', 'num1', '待更正段段标：I-大额专项分期信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('992', '766', 'MDFC_SGMT_CODE_Column', 'table_field_1', '待更正段段标');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('993', '766', 'MDFC_SGMT_CODE_J', 'num1', '待更正段段标：J-非月度表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('994', '767', 'MDFC_SGMT_CODE_Column', 'table_field_1', '待更正段段标');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('995', '767', 'MDFC_SGMT_CODE_K', 'num1', '待更正段段标：K-特殊交易说明段 ');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('996', '768', 'MDFC_SGMT_CODE_Column', 'table_field_1', '待更正段段标');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('997', '768', 'MDFC_SGMT_CODE_D', 'num1', '待更正段段标：D-相关还款责任人段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('998', '769', 'MDFC_SGMT_CODE_Column', 'table_field_1', '待更正段段标');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('999', '769', 'MDFC_SGMT_CODE_E', 'num1', '待更正段段标：E-抵质押物信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('1000', '770', 'MDFC_SGMT_CODE_Column', 'table_field_1', '待更正段段标');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('1001', '770', 'MDFC_SGMT_CODE_F', 'num1', '待更正段段标：F-授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('1002', '771', 'MDFC_SGMT_CODE_Column', 'table_field_1', '待更正段段标');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('1003', '771', 'MDFC_SGMT_CODE_G', 'num1', '待更正段段标：G-初始债权说明段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('1006', '773', 'PBA_ACCT_BS_SGMT_Table', 'table_1', '基础段/个人借贷按段更正请求记录信息');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('1007', '773', 'PBA_ACCT_BS_SGMT_ID_Column', 'table_pk_1', 'PBA_ACCT_BS_SGMT表主键');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('1008', '773', 'ACCT_TYPE_Column1', 'table_field_1', '账户类型');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('1009', '773', 'ACCT_TYPE_C1', 'num1', '账户类型:C1');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('1010', '773', 'RPT_DATE_Column', 'table_field_2', '信息报告日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('1011', '773', 'MDFC_SGMT_CODE_Column', 'table_field_3', '待更正段段标');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('1012', '773', 'MDFC_SGMT_CODE_J', 'num2', '待更正段段标：J-非月度表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('1013', '773', 'NUM_2', 'num3', '账户状态：2-结束');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('1014', '774', 'MDFC_SGMT_CODE_Column', 'table_field_1', '待更正段段标');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('1015', '774', 'MDFC_SGMT_CODE_D', 'num1', '待更正段段标：D-额度信息段 ');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('1016', '775', 'PBA_ACCT_BS_SGMT_Table', 'table_1', '基础段/个人借贷按段更正请求记录信息');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('1017', '775', 'PBA_ACCT_BS_SGMT_ID_Column', 'table_pk_1', 'PBA_ACCT_BS_SGMT表主键');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('1018', '775', 'RPT_DATE_Column', 'table_field_1', '信息报告日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('1019', '775', 'MDFC_SGMT_CODE_Column', 'table_field_2', '待更正段段标');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('1020', '775', 'MDFC_SGMT_CODE_H', 'num1', '待更正段段标：H-月度表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('1021', '775', 'ACCT_STATUS_3_4', 'num3', '账户状态：3-关闭、4-销户');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('1022', '776', 'PCA_CTRCT_BS_SGMT_Table', 'table_1', '基础段/个人授信协议按段更正类请求记录');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('1023', '776', 'PCA_CTRCT_BS_SGMT_ID_Column', 'table_pk_1', 'PCA_CTRCT_BS_SGMT表主键');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('1024', '776', 'RPT_DATE_Column', 'table_field_1', '信息报告日期');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('1025', '776', 'MDFC_SGMT_CODE_Column', 'table_field_2', '待更正段段标');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('1026', '776', 'MDFC_SGMT_CODE_D', 'num1', '待更正段段标：D-额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('1027', '776', 'NUM_2', 'num3', '账户状态：2-到期/失效');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('1034', '778', 'PDB_GUAR_ACCT_BS_INF_SGMT_Table', 'table_1', '基本信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('1035', '778', 'PDC_RLT_REPYMT_INF_SGMT_Table', 'table_2', '相关还款责任人段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('1036', '778', 'PDD_GUAR_MCC_INF_SGMT_Table', 'table_3', '抵质押物信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('1037', '778', 'PDE_GR_REPYMT_INF_SGMT_Table', 'table_4', '在保责任信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('1038', '778', 'MDFC_SGMT_CODE_B', 'num1', '待更正段段标：B-基础段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('1039', '778', 'MDFC_SGMT_CODE_C', 'num2', '待更正段段标：C-基本信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('1040', '778', 'MDFC_SGMT_CODE_E', 'num3', '待更正段段标：E-相关还款责任人段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('1041', '778', 'MDFC_SGMT_CODE_F', 'num4', '待更正段段标：F-抵质押物信息段 ');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('1042', '779', 'MDFC_SGMT_CODE_D', 'num5', '待更正段段标：D-在保责任信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('1043', '779', 'ACCT_TYPE_PDA', 'num1', '个人担保账户类型');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('1044', '780', 'ACCT_TYPE_PBA', 'num1', '个人借贷账户类型');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('1045', '781', 'MDFC_SGMT_CODE_Column', 'table_field_1', '待更正段段标');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('1046', '781', 'MDFC_SGMT_CODE_J', 'num1', '待更正段段标:J-非月度表现信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('1047', '781', 'MDFC_SGMT_CODE_K', 'num2', '待更正段段标：K-特殊交易说明段 ');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2170', '2029', 'ms8_field1_1013', 'ms8_field1', '当报告时点说明代码为10-新开户,31-月结日首次上报存量账户,如果基本信息段中分次放款标志为0，还不应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2171', '2030', 'table_name2_A_1014', 'table_name2_A', '当报告时点说明代码为10-新开户,31-月结日首次上报存量账户,30-月度结算时，若账户类型为R2基本信息段中的借贷业务种类细分是82-大额专项分期卡，则还不应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2172', '2030', 'table_name2_C_1014', 'table_name2_C', '当报告时点说明代码为10-新开户,31-月结日首次上报存量账户,30-月度结算时，若账户类型为R2基本信息段中的借贷业务种类细分是82-大额专项分期卡，则还不应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2173', '2030', 'table_field_A_pk_1014', 'table_field_A_pk', '当报告时点说明代码为10-新开户,31-月结日首次上报存量账户,30-月度结算时，若账户类型为R2基本信息段中的借贷业务种类细分是82-大额专项分期卡，则还不应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2174', '2030', 'a1_field_type1_1014', 'a1_field_type1', '当报告时点说明代码为10-新开户,31-月结日首次上报存量账户,30-月度结算时，若账户类型为R2基本信息段中的借贷业务种类细分是82-大额专项分期卡，则还不应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2175', '2030', 'a1_field1_1014', 'a1_field1', '当报告时点说明代码为10-新开户,31-月结日首次上报存量账户,30-月度结算时，若账户类型为R2基本信息段中的借贷业务种类细分是82-大额专项分期卡，则还不应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2176', '2030', 'table_field_code1_1014', 'table_field_code1', '当报告时点说明代码为10-新开户,31-月结日首次上报存量账户,30-月度结算时，若账户类型为R2基本信息段中的借贷业务种类细分是82-大额专项分期卡，则还不应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2177', '2030', 'a1_field2_1014', 'a1_field2', '当报告时点说明代码为10-新开户,31-月结日首次上报存量账户,30-月度结算时，若账户类型为R2基本信息段中的借贷业务种类细分是82-大额专项分期卡，则还不应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2178', '2030', 'b1_field3_1014', 'b1_field3', '当报告时点说明代码为10-新开户,31-月结日首次上报存量账户,30-月度结算时，若账户类型为R2基本信息段中的借贷业务种类细分是82-大额专项分期卡，则还不应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2179', '2030', 'ms8_field1_1014', 'ms8_field1', '当报告时点说明代码为10-新开户,31-月结日首次上报存量账户,30-月度结算时，若账户类型为R2基本信息段中的借贷业务种类细分是82-大额专项分期卡，则还不应包含授信额度信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2180', '2031', 'table_name2_B_1015', 'table_name2_B', '当报告时点说明代码为10-新开户时：若账户类型为D1/R1/R3/R4，不应包含初始债权说明段、非月度表现信息段、特殊交易说明段、大额专项分期信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2028', '2008', 'table_name_E_0001', 'table_name_E', '对于个人基本信息记录，若报告时点说明代码为13-新增客户/首次上报，该记录至少包含基本概况信息段、教育信息段、居住地址段、通讯地址段、婚姻信息段、职业信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2029', '2008', 'table_name_F_0001', 'table_name_F', '对于个人基本信息记录，若报告时点说明代码为14-新增客户/首次上报，该记录至少包含基本概况信息段、教育信息段、居住地址段、通讯地址段、婚姻信息段、职业信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2030', '2008', 'table_name_G_0001', 'table_name_G', '对于个人基本信息记录，若报告时点说明代码为15-新增客户/首次上报，该记录至少包含基本概况信息段、教育信息段、居住地址段、通讯地址段、婚姻信息段、职业信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2031', '2008', 'a_field_0001', 'a_field', '对于个人基本信息记录，若报告时点说明代码为16-新增客户/首次上报，该记录至少包含基本概况信息段、教育信息段、居住地址段、通讯地址段、婚姻信息段、职业信息段');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2032', '2009', 'a_field2_0002', 'a_field2', '若就业状况为11-国家公务员、13-专业技术人员、17-职员、21-企业管理人员、24-工人或91-在职时，单位名称、单位性质、单位所属行业、单位详细地址、单位所在地邮编、单位所在地行政区划、单位电话、职业、职务、职称和本单位工作起始年份必须出现；若“就业状况为上述以外的代码，上述数据项不能出现。');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2033', '2009', 'table_field_a1_0002', 'table_field_a1', '若就业状况为11-国家公务员、13-专业技术人员、17-职员、21-企业管理人员、24-工人或92-在职时，单位名称、单位性质、单位所属行业、单位详细地址、单位所在地邮编、单位所在地行政区划、单位电话、职业、职务、职称和本单位工作起始年份必须出现；若“就业状况为上述以外的代码，上述数据项不能出现。');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2034', '2009', 'table_field_a2_0002', 'table_field_a2', '若就业状况为11-国家公务员、13-专业技术人员、17-职员、21-企业管理人员、24-工人或93-在职时，单位名称、单位性质、单位所属行业、单位详细地址、单位所在地邮编、单位所在地行政区划、单位电话、职业、职务、职称和本单位工作起始年份必须出现；若“就业状况为上述以外的代码，上述数据项不能出现。');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2035', '2009', 'table_field_a3_0002', 'table_field_a3', '若就业状况为11-国家公务员、13-专业技术人员、17-职员、21-企业管理人员、24-工人或94-在职时，单位名称、单位性质、单位所属行业、单位详细地址、单位所在地邮编、单位所在地行政区划、单位电话、职业、职务、职称和本单位工作起始年份必须出现；若“就业状况为上述以外的代码，上述数据项不能出现。');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2036', '2009', 'table_field_a4_0002', 'table_field_a4', '若就业状况为11-国家公务员、13-专业技术人员、17-职员、21-企业管理人员、24-工人或95-在职时，单位名称、单位性质、单位所属行业、单位详细地址、单位所在地邮编、单位所在地行政区划、单位电话、职业、职务、职称和本单位工作起始年份必须出现；若“就业状况为上述以外的代码，上述数据项不能出现。');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2037', '2009', 'table_field_a5_0002', 'table_field_a5', '若就业状况为11-国家公务员、13-专业技术人员、17-职员、21-企业管理人员、24-工人或96-在职时，单位名称、单位性质、单位所属行业、单位详细地址、单位所在地邮编、单位所在地行政区划、单位电话、职业、职务、职称和本单位工作起始年份必须出现；若“就业状况为上述以外的代码，上述数据项不能出现。');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2038', '2009', 'table_field_a6_0002', 'table_field_a6', '若就业状况为11-国家公务员、13-专业技术人员、17-职员、21-企业管理人员、24-工人或97-在职时，单位名称、单位性质、单位所属行业、单位详细地址、单位所在地邮编、单位所在地行政区划、单位电话、职业、职务、职称和本单位工作起始年份必须出现；若“就业状况为上述以外的代码，上述数据项不能出现。');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2039', '2009', 'table_field_a7_0002', 'table_field_a7', '若就业状况为11-国家公务员、13-专业技术人员、17-职员、21-企业管理人员、24-工人或98-在职时，单位名称、单位性质、单位所属行业、单位详细地址、单位所在地邮编、单位所在地行政区划、单位电话、职业、职务、职称和本单位工作起始年份必须出现；若“就业状况为上述以外的代码，上述数据项不能出现。');
Insert into VALIDATE_MAPPING
   (ID, VALIDATE_RULES_ID, VALIDATE_PARAMETER_NAME, TEMPLATE_MAPPING_NAME, VALIDATE_MAPPING_COMMENT)
 Values
   ('2040', '2009', 'table_field_a8_0002', 'table_field_a8', '若就业状况为11-国家公务员、13-专业技术人员、17-职员、21-企业管理人员、24-工人或99-在职时，单位名称、单位性质、单位所属行业、单位详细地址、单位所在地邮编、单位所在地行政区划、单位电话、职业、职务、职称和本单位工作起始年份必须出现；若“就业状况为上述以外的代码，上述数据项不能出现。');
COMMIT;
