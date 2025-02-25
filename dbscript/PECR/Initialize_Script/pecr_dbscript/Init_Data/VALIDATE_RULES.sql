DELETE FROM VALIDATE_RULES;
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('65', 'sql', 'E_INSTITU_BALANCE_BS', 'SHEET_TYPE', 'SHEET_TYPE_is_ten', 
    '报表类型必须填写10', 'cirs', 'Y', 'N', 'EKA_INSTITUTION_BALANCE_SHT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('66', 'sql', 'E_INCOME_EXPENSE', 'CURRENT_FINANCIAL_SUBSIDY_CARR', 'value_is_false', 
    '本期财政补助结转结余值不正确', 'cirs', 'Y', 'N', 'ELB_INCOME_AND_EXPENSE_STAT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('67', 'sql', 'E_INCOME_EXPENSE', 'CURRENT_UNDERTAKINGS_CARRIED_O', 'value_is_false', 
    '本期事业结转结余值不正确', 'cirs', 'Y', 'N', 'ELB_INCOME_AND_EXPENSE_STAT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('68', 'sql', 'E_INCOME_EXPENSE', 'CURRENT_OPERATING_BALANCE', 'value_is_false', 
    '本期经营结余值不正确', 'cirs', 'Y', 'N', 'ELB_INCOME_AND_EXPENSE_STAT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('69', 'sql', 'E_INSTITU_BALANCE', 'TOTAL_ASSETS', 'value_is_false_2', 
    '资产总计值不正确', 'cirs', 'Y', 'N', 'EKB_INSTITUTION_BALANCE_SHT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('70', 'sql', 'E_INSTITU_BALANCE', 'TOTAL_LIABILITIES', 'value_is_false_2', 
    '负债合计值不正确', 'cirs', 'Y', 'N', 'EKB_INSTITUTION_BALANCE_SHT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('71', 'sql', 'E_INSTITU_BALANCE', 'TOTAL_LIABILITIES_AND_NET_ASSE', 'value_is_false_2', 
    '负债和净资产总计值不正确', 'cirs', 'Y', 'N', 'EKB_INSTITUTION_BALANCE_SHT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('45', 'sql', 'E_ACCT_BS', 'ACCT_TYPE', 'ACCT_TYPE_is_the_same', 
    '借贷待更正记录基础段的“账户类型”应与库中“账户类型”一致', 'cirs', 'Y', 'N', 'EDA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('46', 'sql', 'E_RLT_REPYMT_INF', 'ARLP_CERT_NUM', 'ID_NUM_and_ID_TYPE_not_repeat', 
    '借贷更正相关还款责任人段时，责任人两标与借款人两标不能相同', 'cirs', 'Y', 'N', 'EDC_RLT_REPYMT_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('72', 'sql', 'E_INSTITU_BALANCE', 'TOTAL_ASSETS', 'value_is_false_3', 
    '资产总计=负债和净资产总计', 'cirs', 'Y', 'N', 'EKB_INSTITUTION_BALANCE_SHT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('73', 'sql', 'E_BALANCE_SHEET02', 'TOTAL_EQUITY_AND_LIABILITIES', 'value_is_false_4', 
    '负债和所有者权益总计=负债合计+少数股东权益+所有者权益合计', 'cirs', 'Y', 'N', 'EHB_BALANCE_SHEET2002_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('74', 'sql', 'E_BALANCE_SHEET02', 'TOTAL_ASSETS', 'value_is_false_3', 
    '负债和所有者权益总计=资产总计', 'cirs', 'Y', 'N', 'EHB_BALANCE_SHEET2002_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('75', 'sql', 'E_BALANCE_SHEET07', 'TOTAL_EQUITY_AND_LIABILITIES', 'value_is_false_2', 
    '负债和所有者权益合计=负债合计+所有者权益合计', 'cirs', 'Y', 'N', 'EHC_BALANCE_SHEET2007_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('76', 'sql', 'E_BALANCE_SHEET07', 'TOTAL_ASSETS', 'value_is_false_3', 
    '负债和所有者权益总计=资产总计', 'cirs', 'Y', 'N', 'EHC_BALANCE_SHEET2007_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('77', 'sql', 'E_CASH_FLOWS2002', 'NET_CASH_FLOWS_FROM_OPERATING', 'value_is_false', 
    '经营活动产生的现金流量净额＝经营活动现金流入小计－经营活动现金流出小计', 'cirs', 'Y', 'N', 'EJB_CASH_FLOWS2002_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('78', 'sql', 'E_CASH_FLOWS2002', 'NET_CASH_FLOWS_FROM_INVESTING_', 'value_is_false', 
    '投资活动产生的现金流量净额＝投资活动现金流入小计－投资活动现金流出小计', 'cirs', 'Y', 'N', 'EJB_CASH_FLOWS2002_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('79', 'sql', 'E_CASH_FLOWS2002', 'NET_CASH_FLOWS_FROM_FINANCING_', 'value_is_false', 
    '筹集活动产生的现金流量净额＝筹资活动现金流入小计－筹资活动现金流出小计', 'cirs', 'Y', 'N', 'EJB_CASH_FLOWS2002_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('80', 'sql', 'E_CASH_FLOWS2002', 'NET_INCREASE_IN_CASH_AND_CASH_', 'value_is_false_5', 
    '现金及现金等价物净增加额＝筹集活动产生的现金流量净额＋汇率变动对现金的影响＋经营活动产生的现金流量净额＋投资活动产生的现金流量净额', 'cirs', 'Y', 'N', 'EJB_CASH_FLOWS2002_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('81', 'sql', 'E_CASH_FLOWS2007', 'NET_CASH_FLOWS_FROM_OPERATING', 'value_is_false', 
    '经营活动产生的现金流量净额=经营活动现金流入小计－经营活动现金流出小计', 'cirs', 'Y', 'N', 'EJC_CASH_FLOWS2007_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('82', 'sql', 'E_CASH_FLOWS2007', 'NET_CASH_FLOWS_FROM_INVESTING_', 'value_is_false', 
    '投资活动产生的现金流量净额＝投资活动现金流入小计－投资活动现金流出小计', 'cirs', 'Y', 'N', 'EJC_CASH_FLOWS2007_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('83', 'sql', 'E_CASH_FLOWS2007', 'NET_CASH_FLOWS_FROM_FINANCING_', 'value_is_false', 
    '筹资活动产生的现金流量净额＝筹资活动现金流入小计－筹资活动现金流出小计', 'cirs', 'Y', 'N', 'EJC_CASH_FLOWS2007_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('85', 'sql', 'E_CASH_FLOWS2007', 'THE_FINAL_CASH_AND_CASH_EQUIVA', 'value_is_false_2', 
    '期末现金及现金等价物余额=现金及现金等价物净增加额+期初现金及现金等价物余额', 'cirs', 'Y', 'N', 'EJC_CASH_FLOWS2007_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('86', 'sql', 'E_CTRCT_BS', 'INF_REC_TYPE', 'Information_section_is_null_not', 
    '企业授信协议记录报送时，基础段和额度信息段必须出现', 'cirs', 'Y', 'N', 'EGA_CTRCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('87', 'sql', 'E_CREDIT_LIM', 'CON_EXP_DATE', 'ED_No_greater_than_SD', 
    '额度生效日期必须不晚于额度到期日期', 'cirs', 'Y', 'N', 'EGC_CREDIT_LIM_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('88', 'sql', 'E_CREDIT_LIM', 'CREDIT_REST_CODE', 'a_not_null_another_not_null', 
    '授信限额编号、授信限额其中之一不为空时，另一个应不为空', 'cirs', 'Y', 'N', 'EGC_CREDIT_LIM_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('89', 'sql', 'E_CTRCT_CERT_REL', 'CERT_REL_ID_NUM', 'ID_NUM_and_ID_TYPE_not_repeat_02', 
    '受信人两标与共同受信人两标不能相同', 'cirs', 'Y', 'N', 'EGB_CTRCT_CERT_REL_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('90', 'sql', 'MOTGA_CLTAL_CTRCT_BS', 'INF_REC_TYPE', 'Information_section_is_null_not', 
    '抵质押基本信息段必须出现', 'cirs', 'Y', 'N', 'EFA_MOTGA_CLTAL_CTRCT_BS_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('91', 'sql', 'MOTGA_CLTAL_BS_INF', 'CC_EXP_DATE', 'ED_No_greater_than_SD', 
    '抵质押合同生效日期不晚于合同到期日期', 'cirs', 'Y', 'N', 'EFB_MOTGA_CLTAL_BS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('92', 'sql', 'MOTGA_CLTAL_BS_INF', 'GUAR_TYPE', 'COUNT_More_than_zero', 
    '抵押物个数应大于 0', 'cirs', 'Y', 'N', 'EFB_MOTGA_CLTAL_BS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('84', 'sql', 'E_CASH_FLOWS2007', 'NETINCREASEIN_CASH_AND_CASH_EQ', 'value_is_false_5', 
    '现金及现金等价物净增加额=经营活动产生的现金流量净额+投资活动产生的现金流量净额+筹资活动产生的现金流量净额+汇率变动对现金及现金等价物的影响', 'cirs', 'Y', 'N', 'EJC_CASH_FLOWS2007_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('93', 'sql', 'MOTGA_CLTAL_BS_INF', 'GUAR_TYPE', 'COUNT_More_than_zero', 
    '质押物个数应大于 0', 'cirs', 'Y', 'N', 'EFB_MOTGA_CLTAL_BS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('94', 'sql', 'MOTGA_COM_REC_INF', 'GUAR_CERT_NUM', 'ID_NUM_and_ID_TYPE_not_repeat_02_02', 
    '抵质押债务人两标与其他债务人两标不能相同', 'cirs', 'Y', 'N', 'EFC_COM_REC_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('95', 'sql', 'E_ACCT_BS', 'RPT_DATE_CODE', 'mingxiduan_is_not_null_02', 
    '报送时点说明代码为10-新开户/首次报送，账户类型为D2,C1应包含基本信息段、还款表现信息段', 'cirs', 'Y', 'N', 'EDA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('96', 'sql', 'E_ACCT_BS', 'RPT_DATE_CODE', 'mingxiduan_is_not_null_02', 
    '报送时点说明代码为20-账户关闭，账户类型为D1,D2,R1,R4,C1应包含基本信息段、还款表现信息段', 'cirs', 'Y', 'N', 'EDA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('97', 'sql', 'E_ACCT_BS_INF', 'FLAG', 'mingxiduan_is_not_null_03', 
    '报送时点说明代码为10-新开户/首次报送，账户类型为D1且分次放款标识为1,2，则应包含授信额度信息段', 'cirs', 'Y', 'N', 'EDB_ACCT_BS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('98', 'sql', 'E_ACCT_BS', 'RPT_DATE_CODE', 'mingxiduan_is_not_null_04', 
    '报送时点说明代码为10-新开户/首次报送，账户类型为R1,R4应包含基本信息段、授信额度信息段、还款表现信息段', 'cirs', 'Y', 'N', 'EDA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('99', 'sql', 'E_ACCT_BS', 'RPT_DATE_CODE', 'mingxiduan_is_not_null_05', 
    '账户类型为R1、R4、C1，不适用31-开户后放款的报送时点', 'cirs', 'Y', 'N', 'EDA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('100', 'sql', 'E_ACCT_BS', 'RPT_DATE_CODE', 'mingxiduan_is_not_null_01', 
    '报送时点说明代码为20-账户关闭，账户类型为D1,D2,R1,R4,C1应包含还款表现信息段', 'cirs', 'Y', 'N', 'EDA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('101', 'sql', 'E_ACCT_BS', 'RPT_DATE_CODE', 'mingxiduan_is_not_null_01', 
    '报送时点说明代码为32-约定还款日结算，账户类型为D1,D2,R4应包含还款表现信息段', 'cirs', 'Y', 'N', 'EDA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('102', 'sql', 'E_ACCT_BS', 'RPT_DATE_CODE', 'mingxiduan_is_not_null_05', 
    '账户类型为R1、C1不适用32-约定还款日结算的报送时点', 'cirs', 'Y', 'N', 'EDA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('103', 'sql', 'E_ACCT_BS', 'RPT_DATE_CODE', 'mingxiduan_is_not_null_01', 
    '报送时点说明代码为33-实际还款，账户类型为D1,D2,R4,C1应包含还款表现信息段', 'cirs', 'Y', 'N', 'EDA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('104', 'sql', 'E_ACCT_BS', 'RPT_DATE_CODE', 'mingxiduan_is_not_null_05', 
    '账户类型为R1不适用33-实际还款的报送时点', 'cirs', 'Y', 'N', 'EDA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('105', 'sql', 'E_ACCT_BS', 'RPT_DATE_CODE', 'mingxiduan_is_not_null_01', 
    '报送时点说明代码为41-五级分类调整，账户类型为D1,D2,R4,C1应包含还款表现信息段', 'cirs', 'Y', 'N', 'EDA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('106', 'sql', 'E_ACCT_BS', 'RPT_DATE_CODE', 'mingxiduan_is_not_null_05', 
    '账户类型为R1不适用41-五级分类调整的报送时点', 'cirs', 'Y', 'N', 'EDA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('107', 'sql', 'E_ACCT_BS', 'RPT_DATE_CODE', 'mingxiduan_is_not_null_02', 
    '报送时点说明代码为42-展期发生，账户类型为D1,R4应包含还款表现信息段、特定交易说明段', 'cirs', 'Y', 'N', 'EDA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('108', 'sql', 'E_ACCT_BS', 'RPT_DATE_CODE', 'mingxiduan_is_not_null_05', 
    '账户类型为D2,R1,C1不适用42-展期发生的报送时点', 'cirs', 'Y', 'N', 'EDA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('109', 'sql', 'E_ACCT_BS', 'RPT_DATE_CODE', 'mingxiduan_is_not_null_01', 
    '报送时点说明代码为49-其他报送日，账户类型为D1,D2,R1,R4,C1应包含还款表现信息段', 'cirs', 'Y', 'N', 'EDA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('110', 'sql', 'E_ORIG_CREDITOR_INF  ', 'INIT_CRED_NAME', 'mingxiduan_is_null_01', 
    '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算，49-其他报送日且账户类型为D1,R1,R4不应包含初始债权说明段', 'cirs', 'Y', 'N', 'EDF_ORIG_CREDITOR_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('111', 'sql', 'E_ORIG_CREDITOR_INF  ', 'INIT_CRED_NAME', 'mingxiduan_is_null_01', 
    '报送时点说明代码为33-实际还款,42-展期发生且账户类型为D1,R4不应包含初始债权说明段', 'cirs', 'Y', 'N', 'EDF_ORIG_CREDITOR_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('112', 'sql', 'E_ORIG_CREDITOR_INF  ', 'INIT_CRED_NAME', 'mingxiduan_is_null_01', 
    '报送时点说明代码为41-五级分类调整且账户类型为R1不应包含初始债权说明段', 'cirs', 'Y', 'N', 'EDF_ORIG_CREDITOR_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('48', 'sql', 'E_GUAR_ACCT_BS', 'ACCT_CODE', 'ACCT_CODE_is_not_null', 
    '担保待更正业务标识码必须在库中存在', 'cirs', 'Y', 'N', 'EEA_GUAR_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('49', 'sql', 'E_GUAR_ACCT_BS', 'ACCT_TYPE', 'ACCT_TYPE_is_the_same', 
    '担保待更正记录基础段的“账户类型”应与库中“账户类型”一致', 'cirs', 'Y', 'N', 'EEA_GUAR_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('50', 'sql', 'E_SEC_RLT_REPYMT_INF', 'ARLP_CERT_NUM', 'ID_NUM_and_ID_TYPE_not_repeat', 
    '担保更正相关还款责任人段时，责任人两标与借款人两标不能相同', 'cirs', 'Y', 'N', 'EEC_RLT_REPYMT_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('51', 'sql', 'E_GUAR_ACCT_BS', 'RPT_DATE', 'RPT_DATE_is_repeat', 
    '担保更正基础段时，待入库的更正请求记录的信息报告日期应等于库中相应信息段最新的信息报告日期', 'cirs', 'Y', 'N', 'EEA_GUAR_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('52', 'sql', 'E_CTRCT_BS', 'CONTRACT_CODE', 'ACCT_CODE_is_not_null', 
    '授信待更正业务标识码必须在库中存在', 'cirs', 'Y', 'N', 'EGA_CTRCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('53', 'sql', 'E_CTRCT_CERT_REL', 'CERT_REL_ID_NUM', 'ID_NUM_and_ID_TYPE_not_repeat', 
    '授信更正共同受信人信息段时，共同受信人两标与受信人两标不能相同', 'cirs', 'Y', 'N', 'EGB_CTRCT_CERT_REL_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('728', 'sql', 'E_ACT_LBLTY_INF', 'ACCT_STATUS', 'CHECK_EDG_ACCTSTATUS21_AND_TOTOVERD', 
    '若账户状态为31-呆账（已核销）,32-呆账（进入核销认定程序，等待核销）时，当前逾期总额不能为 0。', 'cirs', 'Y', 'N', 'EDG_ACT_LBLTY_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('729', 'sql', 'E_ACT_LBLTY_INF', 'OVERD_PRINC', 'CHECK_EDG_OVERDPRINC_AND_OVERDPRINC', 
    '对于 D1/D2/R1/R4 账户，信息记录中当前逾期本金必须小于等于当前逾期总额', 'cirs', 'Y', 'N', 'EDG_ACT_LBLTY_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('730', 'sql', 'E_ACT_LBLTY_INF', 'LAT_RPY_PRINC_AMT', 'CHECK_EDG_LATRPYPRINCAMT_AND_LATRPYAMT', 
    '最近一次实际归还本金必须小于等于最近一次实际还款金额', 'cirs', 'Y', 'N', 'EDG_ACT_LBLTY_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('731', 'sql', 'E_ACT_LBLTY_INF', 'TOT_OVERD', 'CHECK_EDG_TOTOVERD_AND_OVERDDY', 
    '当且仅当当前逾期总额大于 0，则当前逾期天数不为 0', 'cirs', 'Y', 'N', 'EDG_ACT_LBLTY_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('732', 'sql', 'E_ACT_LBLTY_INF', 'CLOSE_DATE', 'CHECK_EDG_CLOSEDATE_AND_OTHERDATE', 
    '当账户关闭日期不为空时，则账户关闭日期必须不早于同一条记录中所有其他业务日期', 'cirs', 'Y', 'N', 'EDG_ACT_LBLTY_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('733', 'sql', 'E_ACT_LBLTY_INF', 'ACCT_STATUS', 'CHECK_EDG_ACCTSTATUS2_AND_NXTAGRRRPYDATE', 
    '当账户状态为2-关闭时，则下一次约定还款日期必须为空', 'cirs', 'Y', 'N', 'EDG_ACT_LBLTY_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('734', 'sql', 'E_ACT_LBLTY_INF', 'NXT_AGRR_RPY_DATE', 'CHECK_EDG_NXTAGRRRPYDATE_AND_OTHERDATE', 
    '当下一次约定还款日期不为空时，必须不早于余额变化日期,最近一次实际还款日期,最近一次约定还款日期,五级分类认定日期', 'cirs', 'Y', 'N', 'EDG_ACT_LBLTY_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('735', 'sql', 'E_ACCT_BS', 'RPT_DATE', 'CHECK_EDA_RPTDATE_AND_NXTAGRRRPYDATE', 
    '信息报告日期应不晚于同一条记录中下一次约定还款日期', 'cirs', 'Y', 'N', 'EDA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('736', 'sql', 'E_ACCT_SPEC_TRST', 'CHAN_TRAN_TYPE', 'CHECK_EDH_CHANTRANTYPE_AND_DUETRANMON', 
    '当账户信息记录中的交易类型为11-展期，到期日期变更月数>0', 'cirs', 'Y', 'N', 'EDH_ACCT_SPEC_TRST_DSPN_SG_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('737', 'sql', 'E_ACCT_SPEC_TRST', 'CHAN_TRAN_TYPE', 'CHECK_EDH_CAGOFTRDNM', 
    '交易个数应大于应0', 'cirs', 'Y', 'N', 'EDH_ACCT_SPEC_TRST_DSPN_SG_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2027', 'sql', 'I_ACCT_BS', 'RPT_DATE_CODE', 'gr_pb_table_one6', 
    '当报告时点说明代码为10-新开户时，除基础段外，至少包含基本信息段：若账户类型为D1，还应包含月度表现信息段。如果基本信息段中分次放款标志大于 0，则还应包含授信额度信息段', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2028', 'sql', 'I_ACCT_BS_INF', 'GUAR_MODE', 'gr_pb_table_one7', 
    '当报告时点说明代码为10-新开户或31-月结日首次上报存量账户时，若D1/R1/R2/R3/R4 类账户的基本信息段中担保方式为3-保证、5-组合（含保证），则应包含相关还款责任人段', 'cirs', 'Y', 'N', 'PBB_ACCT_BS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2029', 'sql', 'I_ACCT_BS_INF', 'FLAG', 'gr_pb_table_one8', 
    '当报告时点说明代码为10-新开户,31-月结日首次上报存量账户,如果基本信息段中分次放款标志为0，还不应包含授信额度信息段', 'cirs', 'Y', 'N', 'PBB_ACCT_BS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2030', 'sql', 'I_ACCT_BS_INF', 'BUSI_DTL_LINES', 'gr_pb_table_one8', 
    '当报告时点说明代码为10-新开户,31-月结日首次上报存量账户,30-月度结算时，若账户类型为R2基本信息段中的借贷业务种类细分是82-大额专项分期卡，则还不应包含授信额度信息段', 'cirs', 'Y', 'N', 'PBB_ACCT_BS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2031', 'sql', 'I_ACCT_BS', 'RPT_DATE_CODE', 'gr_pb_table_one9', 
    '当报告时点说明代码为10-新开户时：若账户类型为D1/R1/R3/R4，不应包含初始债权说明段、非月度表现信息段、特殊交易说明段、大额专项分期信息段', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2032', 'sql', 'I_ACCT_BS', 'RPT_DATE_CODE', 'gr_pb_table_one9', 
    '10-新开户,20-账户关闭时若账户类型为C1，不应包含月度表现段、大额专项分期信息段、抵质押物信息段、授信额度信息段', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2033', 'sql', 'I_ACCT_BS', 'RPT_DATE_CODE', 'gr_pb_table_one9', 
    '当报告时点说明代码为40-收回逾期款项时：若账户类型为D1/R1/R2/R4还不应包含初债权说明段、特殊交易说明段、基本信息段、相关还款责任人段', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2034', 'sql', 'I_ACCT_BS', 'RPT_DATE_CODE', 'gr_pb_table_one10', 
    '当报告时点说明代码为10-新开户时，若账户类型为R2，不应包含初始债权说明段、非月度表现信息段、特殊交易说明段', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2035', 'sql', 'I_ACCT_BS', 'RPT_DATE_CODE', 'gr_pb_table_one10', 
    '当报告时点说明代码为30-月度结算,31-月结日首次上报存量账户,32-月结日账户关闭时：若账户类型为D1/R1/R3/R4，不应包含初始债权说明段、非月度表现信息段、大额专项分期信息段', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2036', 'sql', 'I_ACCT_BS', 'RPT_DATE_CODE', 'gr_pb_table_one11', 
    '当报告时点说明代码为31-月结日首次上报存量账户,20-账户关闭,32-月结日账户关闭,若账户类型为R2，不应包含初始债权说明段、非月度表现信息段', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2037', 'sql', 'I_ACCT_BS', 'RPT_DATE_CODE', 'gr_pb_table_one12', 
    '当报告时点说明代码为40-收回逾期款项时：不应包含月度表现信息段、大额专项分期信息段、抵质押物信息段、授信额度信息段', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2038', 'sql', 'I_ACCT_BS_INF', 'REPAY_MODE', 'gr_jd_is_one1', 
    '若“还款方式”为“90-汇总报送，不区分还款方式”，则“还款频率”为“03-月”', 'cirs', 'Y', 'N', 'PBB_ACCT_BS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2039', 'sql', 'I_ACCT_BS_INF', 'REPAY_MODE', 'gr_jd_is_one2', 
    '若“还款方式”代码以“2”开头，则“还款期数”必须为 0。', 'cirs', 'Y', 'N', 'PBB_ACCT_BS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2040', 'sql', 'I_ACCT_BS_INF', 'OPEN_DATE', 'gr_jd_is_one3', 
    '“开户日期”应不晚于“到期日期”', 'cirs', 'Y', 'N', 'PBB_ACCT_BS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2041', 'sql', 'I_LOAN_RLT_REPYMT_INF', 'ARLP_TYPE', 'gr_jd_is_one4', 
    '若“还款责任人类型”为“2-保证人”，则“还款责任金额”不能为空值', 'cirs', 'Y', 'N', 'PBC_RLT_REPYMT_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('3', 'sql', 'E_BS', 'ENT_CERT_TYPE', 'Enterprise_identity_type', 
    '企业基本信息记录基础段企业身份标识类型顺序校验', 'cirs', 'Y', 'N', 'EAA_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('4', 'sql', 'E_BS', 'RPT_DATE_CODE', 'New_customer_verification_three_tables', 
    '当值为“10-新增客户资料/首次上报”时，企业基本信息基本必须报送基础段、基本概况段、主要组成人员段、联系方式段', 'cirs', 'Y', 'N', 'EAA_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('1', 'sql', 'E_BS', 'ENT_NAME', 'Length_range', 
    '企业名称长度校验', 'cirs', 'Y', 'N', 'EAA_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('5', 'sql', 'E_BS', 'ORG_TYPE', 'New_customer_verification_two_tables', 
    '当值为“10-新增客户资料/首次上报”时,对于企业、事业单位、社会团体（三类组织的分支机构除外），需要报送注册资本及主要出资人段', 'cirs', 'Y', 'N', 'EAA_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('6', 'sql', 'E_BS', 'ORG_TYPE', 'OrgType_for_value', 
    '组织机构类型为机关类型时，注册资本及主要出资人段不能出现', 'cirs', 'Y', 'N', 'EAA_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('7', 'sql', 'E_FCS_INF', 'NATIONALITY', 'Reg_Add_is_Null', 
    '当国别代码为CHN时，登记地址不能为空', 'cirs', 'Y', 'N', 'EAC_FCS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('8', 'sql', 'E_FCS_INF', 'NATIONALITY', 'Reg_Add_not_Null', 
    '当国别代码不为CHN时，登记地址统一为空', 'cirs', 'Y', 'N', 'EAC_FCS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('9', 'sql', 'E_FCS_INF', 'FCS_INFO_UP_DATE', 'Date_Check', 
    '基本概况信息段中成立日期要不晚于信息更新日期', 'cirs', 'Y', 'N', 'EAC_FCS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('10', 'sql', 'E_MN_SHA_HOD_INF', 'INV_RATIO', 'Between_Two_Numbers', 
    '注册资本及主要出资人段中的出资比例大于 0， 小于或等于 100', 'cirs', 'Y', 'N', 'EAE_MN_SHA_HOD_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('11', 'sql', 'E_MN_SHA_HOD_INF', 'SHAR_HOD_CERT_TYPE', 'Identity_Matching', 
    '出资人身份类别要与出资人身份标识类型匹配', 'cirs', 'Y', 'N', 'EAE_MN_SHA_HOD_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('12', 'sql', 'E_BS', 'ENT_CERT_NUM', 'Length_range', 
    '企业身份标识号码长度校验', 'cirs', 'Y', 'N', 'EAA_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('13', 'sql', 'E_BS', 'INF_SURC_CODE', 'Length_range', 
    '信息来源编码长度校验', 'cirs', 'Y', 'N', 'EAA_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('14', 'sql', 'E_BS', 'CIMOC', 'Length_range', 
    '客户资料维护机构代码长度校验', 'cirs', 'Y', 'N', 'EAA_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('15', 'sql', 'E_ID', 'OTH_ENT_CERT_NUM', 'Length_range', 
    '其他标识信息段企业身份标识号码长度校验', 'cirs', 'Y', 'N', 'EAB_ID_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('16', 'sql', 'E_FCS_INF', 'REG_ADD', 'Length_range', 
    '基本概况信息登记地址长度校验', 'cirs', 'Y', 'N', 'EAC_FCS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('17', 'sql', 'E_FCS_INF', 'BIZ_RANGE', 'Length_range', 
    '基本概况信息业务范围长度校验', 'cirs', 'Y', 'N', 'EAC_FCS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('18', 'sql', 'E_MN_MMB_INF', 'MMB_ALIAS', 'Length_range', 
    '主要组成人员姓名长度校验', 'cirs', 'Y', 'N', 'EAD_MN_MMB_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('19', 'sql', 'E_MN_MMB_INF', 'MMB_ID_NUM', 'Length_range', 
    '主要组成人员证件号码长度校验', 'cirs', 'Y', 'N', 'EAD_MN_MMB_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('20', 'sql', 'E_MN_SHA_HOD_INF', 'REG_CAP', 'Length_range', 
    '注册资本', 'cirs', 'Y', 'N', 'EAE_MN_SHA_HOD_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('21', 'sql', 'E_MN_SHA_HOD_INF', 'SHAR_HOD_NAME', 'Length_range', 
    '出资人名称', 'cirs', 'Y', 'N', 'EAE_MN_SHA_HOD_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('22', 'sql', 'E_MN_SHA_HOD_INF', 'SHAR_HOD_ID_NUM', 'Length_range', 
    '出资人身份标识号码', 'cirs', 'Y', 'N', 'EAE_MN_SHA_HOD_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('23', 'sql', 'E_BS_INF_DLT', 'INF_SURC_CODE', 'SAN_BIAO_is_null', 
    '三标+信息来源编码必须在库中存在', 'cirs', 'Y', 'N', 'EAZ_EN_BS_INF_DLT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('24', 'sql', 'E_BS_INF_DLT', 'ENT_NAME', 'SAN_BIAO_is_null', 
    '三标+信息来源编码必须在库中存在。', 'cirs', 'Y', 'N', 'EAZ_EN_BS_INF_DLT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('25', 'sql', 'E_BS_INF_DLT', 'ENT_CERT_TYPE', 'SAN_BIAO_is_null', 
    '三标+信息来源编码必须在库中存在。', 'cirs', 'Y', 'N', 'EAZ_EN_BS_INF_DLT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('26', 'sql', 'E_BS_INF_DLT', 'ENT_CERT_NUM', 'SAN_BIAO_is_null', 
    '三标+信息来源编码必须在库中存在。', 'cirs', 'Y', 'N', 'EAZ_EN_BS_INF_DLT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('27', 'sql', 'E_ACCT_INF_ENT_DEL', 'DEL_REC_CODE', 'DEL_REC_CODE_is_null', 
    '借贷账户待删除的业务标识码必须在库中存在', 'cirs', 'Y', 'N', 'EDZ_EN_ACCT_INF_ENT_DEL_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('28', 'sql', 'E_ACCT_INF_ID_CAGS_INF', 'NW_BNES_CODE', 'NW_BNES_CODE_not_repeat', 
    '借贷原业务标识码和新业务标识码不能相同', 'cirs', 'Y', 'N', 'EDW_EN_ACCT_INF_ID_CAGS_INF_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('29', 'sql', 'E_SEC_ACCT_ENT_DEL', 'DEL_REC_CODE', 'DEL_REC_CODE_is_null', 
    '担保账户待删除的业务标识码必须在库中存在', 'cirs', 'Y', 'N', 'EEZ_EN_SEC_ACCT_ENT_DEL_SG_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('30', 'sql', 'E_CTRCT_INF_ENT_DEL', 'DEL_REC_CODE', 'DEL_REC_CODE_is_null', 
    '授信协议待删除的业务标识码必须在库中存在', 'cirs', 'Y', 'N', 'EGZ_EN_CTRCT_INF_ENT_DEL_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('31', 'sql', 'MOC_ENT_DEL', 'DEL_REC_CODE', 'DEL_REC_CODE_is_null', 
    '抵质押待删除的业务标识码必须在库中存在', 'cirs', 'Y', 'N', 'EFZ_MOC_ENT_DEL_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('32', 'sql', 'E_ACCT_INF_ID_CAGS_INF', 'OD_BNES_CODE', 'OD_BNES_CODE_is_not_null', 
    '借贷原本业务标识码必须是库中已有且正在使用的', 'cirs', 'Y', 'N', 'EDW_EN_ACCT_INF_ID_CAGS_INF_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('33', 'sql', 'E_ACCT_INF_ID_CAGS_INF', 'NW_BNES_CODE', 'NW_BNES_CODE_is_null', 
    '借贷新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识', 'cirs', 'Y', 'N', 'EDW_EN_ACCT_INF_ID_CAGS_INF_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('34', 'sql', 'E_BALANCE_SHEET_DLT', 'ENT_CERT_NUM', 'ent_zichengfuzhai_del_not_null', 
    '企业身份标识类型+企业身份标识代码+报表年份+报表类型+报表类型细分+数据提供机构区段码必须在库中存在', 'cirs', 'Y', 'N', 'EMZ_BALANCE_SHEET_DLT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('35', 'sql', 'E_SEC_ACCT_ID_CAGS_INF', 'NW_BNES_CODE', 'NW_BNES_CODE_not_repeat', 
    '担保原业务标识码和新业务标识码不能相同', 'cirs', 'Y', 'N', 'EEW_EN_SEC_ACCT_ID_CAGS_INF_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('36', 'sql', 'E_CR_ACCT_ID_CAGS_INF', 'NW_BNES_CODE', 'NW_BNES_CODE_not_repeat', 
    '授信原业务标识码和新业务标识码不能相同', 'cirs', 'Y', 'N', 'EGW_EN_ACCT_INF_ID_CAGS_INF_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('37', 'sql', 'MOC_ID_CAGS_INF', 'NW_BNES_CODE', 'NW_BNES_CODE_not_repeat', 
    '抵质押原业务标识码和新业务标识码不能相同', 'cirs', 'Y', 'N', 'EFW_MOC_ID_CAGS_INF_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('38', 'sql', 'E_SEC_ACCT_ID_CAGS_INF', 'OD_BNES_CODE', 'OD_BNES_CODE_is_not_null', 
    '担保原本业务标识码必须是库中已有且正在使用的', 'cirs', 'Y', 'N', 'EEW_EN_SEC_ACCT_ID_CAGS_INF_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('39', 'sql', 'E_CR_ACCT_ID_CAGS_INF', 'OD_BNES_CODE', 'OD_BNES_CODE_is_not_null', 
    '授信原本业务标识码必须是库中已有且正在使用的', 'cirs', 'Y', 'N', 'EGW_EN_ACCT_INF_ID_CAGS_INF_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('40', 'sql', 'MOC_ID_CAGS_INF', 'OD_BNES_CODE', 'OD_BNES_CODE_is_not_null', 
    '抵质押原本业务标识码必须是库中已有且正在使用的', 'cirs', 'Y', 'N', 'EFW_MOC_ID_CAGS_INF_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('41', 'sql', 'E_SEC_ACCT_ID_CAGS_INF', 'NW_BNES_CODE', 'NW_BNES_CODE_is_null', 
    '担保新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识', 'cirs', 'Y', 'N', 'EEW_EN_SEC_ACCT_ID_CAGS_INF_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('42', 'sql', 'E_CR_ACCT_ID_CAGS_INF', 'NW_BNES_CODE', 'NW_BNES_CODE_is_null', 
    '授信新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识', 'cirs', 'Y', 'N', 'EGW_EN_ACCT_INF_ID_CAGS_INF_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('43', 'sql', 'MOC_ID_CAGS_INF', 'NW_BNES_CODE', 'NW_BNES_CODE_is_null', 
    '抵质押新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识', 'cirs', 'Y', 'N', 'EFW_MOC_ID_CAGS_INF_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('44', 'sql', 'E_ACCT_BS', 'ACCT_CODE', 'ACCT_CODE_is_not_null', 
    '借贷待更正业务标识码必须在库中存在', 'cirs', 'Y', 'N', 'EDA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('47', 'sql', 'E_ACCT_BS', 'RPT_DATE', 'RPT_DATE_is_repeat', 
    '借贷更正基础段时，待入库的更正请求记录的信息报告日期应等于库中相应信息段最新的信息报告日期', 'cirs', 'Y', 'N', 'EDA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2042', 'sql', 'I_LOAN_RLT_REPYMT_INF', 'ARLP_TYPE', 'gr_jd_is_one5', 
    '当“还款责任人类型”为“2-保证人”时，“联保标志”、“保证合同编号”不应为空', 'cirs', 'Y', 'N', 'PBC_RLT_REPYMT_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2043', 'sql', 'I_AMBLG_INF', 'RPY_STATUS', 'gr_jd_is_one6', 
    '对于 R2 账户，“当前还款状态”为“*-当月未使用额度且不需要还款”时，“实际还款比例”应为空值', 'cirs', 'Y', 'N', 'PBG_AMBLG_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2044', 'sql', 'I_AMBLG_INF', 'SETT_DATE', 'gr_jd_is_one7', 
    '“结算/应还款日”与“月份”中的年、月必须保持一致', 'cirs', 'Y', 'N', 'PBG_AMBLG_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2045', 'sql', 'I_AMBLG_INF', 'ACCT_STATUS', 'gr_jd_is_one8', 
    '若账户信息记录中的“账户状态”为“41-呆账（进入核销认定程序，等待核销）”/“51-呆账（进入核销认定程序，等待核销）”、“42-呆账（已核销）”/“52-呆账（已核销）”时，“当前逾期总额”不能为 0', 'cirs', 'Y', 'N', 'PBG_AMBLG_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2046', 'sql', 'I_AMBLG_INF', 'ACCT_STATUS', 'gr_jd_is_one9', 
    '若“账户状态”为“6-未激活”时，则“余额”、“当前逾期期数”、“当前逾期总额”必须为 0，“当前还款状态”必须为“*”（若此账户没有上述数据项，则不校验此数据项）。', 'cirs', 'Y', 'N', 'PBG_AMBLG_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2047', 'sql', 'I_AMBLG_INF', 'RPY_STATUS', 'gr_jd_is_one22', 
    '若“当前还款状态”为“*”，则“本月应还款金额”、“当前逾期期数”、“当前逾期总额”、“本期账单余额”必须为 0（若此账户没有上述数据项，则不校验此数据项）', 'cirs', 'Y', 'N', 'PBG_AMBLG_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2048', 'sql', 'I_AMBLG_INF', 'RPY_STATUS', 'gr_jd_is_one10', 
    '若“当前还款状态”为“N”或“M”，则“当前逾期期数”、“当前逾期总额”必须为0（若此账户没有上述数据项，则不校验此数据项）', 'cirs', 'Y', 'N', 'PBG_AMBLG_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2049', 'sql', 'I_ACCT_DBT_INF', 'NOMONTH_RPY_STATUS', 'gr_jd_is_one10', 
    '若“当前还款状态”为“N”或“M”，则“当前逾期期数”、“当前逾期总额”必须为0', 'cirs', 'Y', 'N', 'PBI_ACCT_DBT_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2050', 'sql', 'I_AMBLG_INF', 'RPY_STATUS', 'gr_jd_is_one11', 
    '若“当前还款状态”为数字“1-7”，则“当前逾期期数”、“当前逾期总额”必须大于0', 'cirs', 'Y', 'N', 'PBG_AMBLG_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2051', 'sql', 'I_AMBLG_INF', 'OVERD_PRINC', 'gr_jd_is_one12', 
    '对于 D1/R1/R4 账户，信息记录中“当前逾期本金”必须小于等于“当前逾期总额', 'cirs', 'Y', 'N', 'PBG_AMBLG_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('54', 'sql', 'E_CTRCT_INF_DEL', 'DEL_REC_CODE', 'DEL_REC_CODE_is_null', 
    '授信协议待删除的业务标识码必须在库中存在', 'cirs', 'Y', 'N', 'EGY_EN_CTRCT_INF_DEL_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('55', 'sql', 'E_CTRCT_INF_DEL', 'DEL_START_DATE', 'ST_AND_ET_IS_NOT_NULL', 
    '授信协议待删除起始日期,待删除的终止日期不能同时为空值', 'cirs', 'Y', 'N', 'EGY_EN_CTRCT_INF_DEL_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('56', 'sql', 'E_CTRCT_INF_DEL', 'DEL_END_DATE', 'ED_No_greater_than_SD', 
    '授信待删除起始日期必须小于等于待删除的结束日期', 'cirs', 'Y', 'N', 'EGY_EN_CTRCT_INF_DEL_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('57', 'sql', 'E_SEC_ACCT_DEL', 'DEL_REC_CODE', 'DEL_REC_CODE_is_null', 
    '担保待更正业务标识码必须在库中存在', 'cirs', 'Y', 'N', 'EEY_EN_SEC_ACCT_DEL_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('58', 'sql', 'E_SEC_ACCT_DEL', 'DEL_START_DATE', 'ST_AND_ET_IS_NOT_NULL', 
    '担保待删除起始日期,待删除的终止日期不能同时为空值', 'cirs', 'Y', 'N', 'EEY_EN_SEC_ACCT_DEL_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('59', 'sql', 'E_SEC_ACCT_DEL', 'DEL_END_DATE', 'ED_No_greater_than_SD', 
    '担保待删除起始日期必须小于等于待删除的结束日期', 'cirs', 'Y', 'N', 'EEY_EN_SEC_ACCT_DEL_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('60', 'sql', 'E_ACCT_INF_DEL', 'DEL_REC_CODE', 'DEL_REC_CODE_is_null', 
    '借贷待更正业务标识码必须在库中存在', 'cirs', 'Y', 'N', 'EDY_EN_ACCT_INF_DEL_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('61', 'sql', 'E_ACCT_INF_DEL', 'DEL_START_DATE', 'ST_AND_ET_IS_NOT_NULL', 
    '借贷待删除起始日期,待删除的终止日期不能同时为空值', 'cirs', 'Y', 'N', 'EDY_EN_ACCT_INF_DEL_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('62', 'sql', 'E_ACCT_INF_DEL', 'DEL_END_DATE', 'ED_No_greater_than_SD', 
    '借贷待删除起始日期必须小于等于待删除的结束日期', 'cirs', 'Y', 'N', 'EDY_EN_ACCT_INF_DEL_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('63', 'sql', 'E_ICDN_RLTP_INF', 'ASSO_ENT_CERT_NUM', 'Two_standard_not_repeat', 
    '两组企业身份标识类型企业身份标识号码不能完全相同', 'cirs', 'Y', 'N', 'ECA_EN_ICDN_RLTP_INF_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('64', 'sql', 'E_INCOME_EXPENSE_BS', 'SHEET_TYPE', 'SHEET_TYPE_is_ten', 
    '报表类型必须填写10', 'cirs', 'Y', 'N', 'ELA_INCOME_AND_EXPENSE_STAT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('770', 'sql', 'I_ACCT_BS', 'RPT_DATE', 'CHECK_MDFCSGMTCODEC_RPTDATE', 
    '信息报告日期应不早于库中最晚的信息报告日期', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('771', 'sql', 'I_ACCT_BS', 'RPT_DATE', 'CHECK_MDFCSGMTCODEC_RPTDATE', 
    '信息报告日期应不早于库中最晚的信息报告日期', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('773', 'sql', 'I_ACCT_DBT_INF', 'NOMONTH_ACCT_STATUS', 'CHECK_PBI_NOMONTHACCTSTATUS', 
    '对于 C1 账户，更正非月度表现信息段时，若库中存在信息报告日期更晚的非月度表现信息段，则更正请求记录中账户状态不能为“结束”', 'cirs', 'Y', 'N', 'PBI_ACCT_DBT_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('774', 'sql', 'I_CTRCT_BS', 'RPT_DATE', 'CHECK_MDFCSGMTCODEC_RPTDATE', 
    '信息报告日期应不早于库中最晚的信息报告日期', 'cirs', 'Y', 'N', 'PCA_CTRCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('775', 'sql', 'I_AMBLG_INF', 'ACCT_STATUS', 'CHECK_PBG_ACCTSTATUS_RPTDATE', 
    '更正月度表现信息段时，若库中存在信息报告日期更晚的月度表现，则更正请求记录中账户状态不能为“关闭”/“销户”', 'cirs', 'Y', 'N', 'PBG_AMBLG_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('776', 'sql', 'I_CREDIT_LIM', 'CON_STATUS', 'CHECK_PCC_ACCTSTATUS_RPTDATE', 
    '更正额度信息段时，若库中存在信息报告日期更晚的额度信息段，则更正请求记录中额度状态不能为“到期/失效”', 'cirs', 'Y', 'N', 'PCC_CREDIT_LIM_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('778', 'sql', 'I_GUAR_ACCT_BS', 'MDFC_SGMT_CODE', 'CHECK_PBA_MDFCSGMTCODE', 
    '待更正的段和待更正的段标应保持一致', 'cirs', 'Y', 'N', 'PDA_GUAR_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('113', 'sql', 'E_MOTGA_CLTAL_CTRCT_INF', 'CCC', 'mingxiduan_is_null_01', 
    '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为D2,C1不应包含抵质押物信息段', 'cirs', 'Y', 'N', 'EDD_MOTGA_CLTAL_CTRCT_INF_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('114', 'sql', 'E_ACCT_CRED', 'MCC', 'mingxiduan_is_null_01', 
    '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为D2不应包含授信额度信息段', 'cirs', 'Y', 'N', 'EDE_ACCT_CRED_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('115', 'sql', 'E_MOTGA_CLTAL_CTRCT_INF', 'CCC', 'mingxiduan_is_null_01', 
    '报送时点说明代码为10-新开户/首次报送,20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含抵质押物信息段', 'cirs', 'Y', 'N', 'EDD_MOTGA_CLTAL_CTRCT_INF_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('116', 'sql', 'E_ACCT_CRED', 'MCC', 'mingxiduan_is_null_01', 
    '报送时点说明代码为10-新开户/首次报送,20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含授信额度信息段', 'cirs', 'Y', 'N', 'EDE_ACCT_CRED_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('117', 'sql', 'E_ORIG_CREDITOR_INF  ', 'INIT_CRED_NAME', 'mingxiduan_is_null_01', 
    '报送时点说明代码为20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含初始债权说明段', 'cirs', 'Y', 'N', 'EDF_ORIG_CREDITOR_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('119', 'sql', 'E_ACCT_CRED', 'MCC', 'mingxiduan_is_null_02', 
    '报送时点说明代码为10-新开户/首次报送,20-账户关闭,32-约定还款日结算,33-实际还款,41-五级分类调整,42-展期发生,49-其他报送日账户类型为D1且分次放款标识为0，则不应包含授信额度信息段', 'cirs', 'Y', 'N', 'EDE_ACCT_CRED_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('120', 'sql', 'E_ORIG_CREDITOR_INF  ', 'INIT_CRED_NAME', 'mingxiduan_is_null_02', 
    '报送时点说明代码为31-开户后放款账户类型为D1且分次放款标识为2，则不应包含初始债权说明段', 'cirs', 'Y', 'N', 'EDF_ORIG_CREDITOR_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('121', 'sql', 'E_ACCT_BS_INF', 'FLAG', 'mingxiduan_is_not_null_06', 
    '账户类型为D1，分次放款标识为0、1则不适用31-开户后放款', 'cirs', 'Y', 'N', 'EDB_ACCT_BS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('122', 'sql', 'I_IN_ACCT_ENT_DEL', 'DEL_REC_CODE', 'DEL_REC_CODE_is_null', 
    '对于个人借贷账户整笔删除请求记录，待删除业务标识码必须在库中存在', 'cirs', 'Y', 'N', 'PBZ_IN_ACCT_ENT_DEL_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('118', 'sql', 'E_RLT_REPYMT_INF', 'ARLP_NAME', 'mingxiduan_is_null_01', 
    '报送时点说明代码为20-账户关闭,33-实际还款,41-五级分类调整,49-其他报送日且账户类型为C1不应包含相关还款责任人段', 'cirs', 'Y', 'N', 'EDC_RLT_REPYMT_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('123', 'sql', 'I_IN_CTRCT_ENT_DEL', 'DEL_REC_CODE', 'DEL_REC_CODE_is_null', 
    '对于个人授信协议整笔删除请求记录，待删除业务标识码必须在库中存在', 'cirs', 'Y', 'N', 'PCZ_IN_CTRCT_ENT_DEL_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('124', 'sql', 'I_IN_SEC_ACCT_ENT_DEL', 'DEL_REC_CODE', 'DEL_REC_CODE_is_null', 
    '对于个人担保账户整笔删除请求记录，待删除业务标识码必须在库中存在', 'cirs', 'Y', 'N', 'PDZ_IN_SEC_ACCT_ENT_DEL_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('125', 'sql', 'I_IN_ACCT_ID_CAGS_INF', 'NW_BNES_CODE', 'NW_BNES_CODE_not_repeat', 
    '个人借贷标识变更原业务标识码和新业务标识码不能相同', 'cirs', 'Y', 'N', 'PBW_IN_ACCT_ID_CAGS_INF_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('126', 'sql', 'I_IN_CTRCTID_CAGS_INF', 'NW_BNES_CODE', 'NW_BNES_CODE_not_repeat', 
    '个人授信标识变更原业务标识码和新业务标识码不能相同', 'cirs', 'Y', 'N', 'PCW_IN_CTRCTID_CAGS_INF_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('127', 'sql', 'I_INSECACCTID_CAGSINF', 'NW_BNES_CODE', 'NW_BNES_CODE_not_repeat', 
    '个人担保标识变更原业务标识码和新业务标识码不能相同', 'cirs', 'Y', 'N', 'PDW_INSECACCTID_CAGSINF_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('128', 'sql', 'I_IN_ACCT_ID_CAGS_INF', 'OD_BNES_CODE', 'OD_BNES_CODE_is_not_null_02', 
    '个人借贷标识变更原业务标识码必须是库中已有且正在使用的', 'cirs', 'Y', 'N', 'PBW_IN_ACCT_ID_CAGS_INF_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('129', 'sql', 'I_IN_ACCT_ID_CAGS_INF', 'NW_BNES_CODE', 'NW_BNES_CODE_is_null_02', 
    '个人借贷标识变更新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识', 'cirs', 'Y', 'N', 'PBW_IN_ACCT_ID_CAGS_INF_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('130', 'sql', 'I_INSECACCTID_CAGSINF', 'OD_BNES_CODE', 'OD_BNES_CODE_is_not_null', 
    '个人担保标识变更原业务标识码必须是库中已有且正在使用的', 'cirs', 'Y', 'N', 'PDW_INSECACCTID_CAGSINF_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('131', 'sql', 'I_INSECACCTID_CAGSINF', 'NW_BNES_CODE', 'NW_BNES_CODE_is_null', 
    '个人担保标识变更新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识', 'cirs', 'Y', 'N', 'PDW_INSECACCTID_CAGSINF_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('132', 'sql', 'I_IN_CTRCTID_CAGS_INF', 'OD_BNES_CODE', 'OD_BNES_CODE_is_not_null', 
    '个人授信标识变更原业务标识码必须是库中已有且正在使用的', 'cirs', 'Y', 'N', 'PCW_IN_CTRCTID_CAGS_INF_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('133', 'sql', 'I_IN_CTRCTID_CAGS_INF', 'NW_BNES_CODE', 'NW_BNES_CODE_is_null', 
    '个人授信标识变更新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识', 'cirs', 'Y', 'N', 'PCW_IN_CTRCTID_CAGS_INF_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('134', 'sql', 'I_IN_BS_INF_DLT', 'NAME', 'SAN_BIAO_is_null_02', 
    '个人基本信息整笔删除三标+信息来源编码必须在库中存在', 'cirs', 'Y', 'N', 'PAY_IN_BS_INF_DLT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('135', 'sql', 'I_IN_BS_INF_DLT', 'ID_TYPE', 'SAN_BIAO_is_null_02', 
    '个人基本信息整笔删除三标+信息来源编码必须在库中存在', 'cirs', 'Y', 'N', 'PAY_IN_BS_INF_DLT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('136', 'sql', 'I_IN_BS_INF_DLT', 'ID_NUM', 'SAN_BIAO_is_null_02', 
    '个人基本信息整笔删除三标+信息来源编码必须在库中存在', 'cirs', 'Y', 'N', 'PAY_IN_BS_INF_DLT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('137', 'sql', 'I_IN_BS_INF_DLT', 'INF_SURC_CODE', 'SAN_BIAO_is_null_02', 
    '个人基本信息整笔删除三标+信息来源编码必须在库中存在', 'cirs', 'Y', 'N', 'PAY_IN_BS_INF_DLT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('138', 'sql', 'I_IN_ID_EFCT_INF_DLT', 'NAME', 'SAN_BIAO_is_null_03', 
    '个人基本信息整笔删除三标+信息来源编码必须在库中存在', 'cirs', 'Y', 'N', 'PAZ_IN_ID_EFCT_INF_DLT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('139', 'sql', 'I_IN_ID_EFCT_INF_DLT', 'ID_TYPE', 'SAN_BIAO_is_null_03', 
    '个人基本信息整笔删除三标+信息来源编码必须在库中存在', 'cirs', 'Y', 'N', 'PAZ_IN_ID_EFCT_INF_DLT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('140', 'sql', 'I_IN_ID_EFCT_INF_DLT', 'ID_NUM', 'SAN_BIAO_is_null_03', 
    '个人基本信息整笔删除三标+信息来源编码必须在库中存在', 'cirs', 'Y', 'N', 'PAZ_IN_ID_EFCT_INF_DLT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('141', 'sql', 'I_IN_ID_EFCT_INF_DLT', 'INF_SURC_CODE', 'SAN_BIAO_is_null_03', 
    '个人基本信息整笔删除三标+信息来源编码必须在库中存在', 'cirs', 'Y', 'N', 'PAZ_IN_ID_EFCT_INF_DLT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('142', 'sql', 'I_IN_CTRCT_DEL', 'DEL_REC_CODE', 'DEL_REC_CODE_is_null', 
    '个人授信协议待删除的业务标识码必须在库中存在', 'cirs', 'Y', 'N', 'PCY_IN_CTRCT_DEL_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('143', 'sql', 'I_IN_CTRCT_DEL', 'DEL_START_DATE', 'ST_AND_ET_IS_NOT_NULL', 
    '个人授信待删除起始日期,待删除的终止日期不能同时为空值', 'cirs', 'Y', 'N', 'PCY_IN_CTRCT_DEL_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('144', 'sql', 'I_IN_CTRCT_DEL', 'DEL_END_DATE', 'ED_No_greater_than_SD', 
    '个人授信待删除起始日期必须小于等于待删除的结束日期', 'cirs', 'Y', 'N', 'PCY_IN_CTRCT_DEL_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('145', 'sql', 'I_IN_SEC_ACCT_DEL', 'DEL_REC_CODE', 'DEL_REC_CODE_is_null', 
    '个人担保待删除的业务标识码必须在库中存在', 'cirs', 'Y', 'N', 'PDY_IN_SEC_ACCT_DEL_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('146', 'sql', 'I_IN_SEC_ACCT_DEL', 'DEL_START_DATE', 'ST_AND_ET_IS_NOT_NULL', 
    '个人担保待删除起始日期,待删除的终止日期不能同时为空值', 'cirs', 'Y', 'N', 'PDY_IN_SEC_ACCT_DEL_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('147', 'sql', 'I_IN_SEC_ACCT_DEL', 'DEL_END_DATE', 'ED_No_greater_than_SD', 
    '个人担保待删除起始日期必须小于等于待删除的结束日期', 'cirs', 'Y', 'N', 'PDY_IN_SEC_ACCT_DEL_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('148', 'sql', 'I_IN_ACCT_DEL', 'DEL_REC_CODE', 'DEL_REC_CODE_is_null', 
    '个人借贷待删除的业务标识码必须在库中存在', 'cirs', 'Y', 'N', 'PBY_IN_ACCT_DEL_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('701', 'sql', 'E_GUAR_ACCT_BS', 'RPT_DATE_CODE', 'EEA_RPTDATECODEIS10_EEBANDEEF_NOTNULL', 
    '“报告时点说明代码”为“10-新开户/首次上报”时，至少应包含基本信息段、在保责任信息段', 'cirs', 'Y', 'N', 'EEA_GUAR_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('702', 'sql', 'E_GUAR_ACCT_BS', 'RPT_DATE_CODE', 'EEA_RPTDATECODEIS_EEF_NOTNULL', 
    '“报告时点说明代码”为“20-账户关闭”时，至少包含在保责任信息段。', 'cirs', 'Y', 'N', 'EEA_GUAR_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('703', 'sql', 'E_GUAR_ACCT_BS', 'RPT_DATE_CODE', 'EEA_RPTDATECODEIS_EEF_NOTNULL', 
    '“报告时点说明代码”为“30-在保责任变化”时，至少包含在保责任信息段。', 'cirs', 'Y', 'N', 'EEA_GUAR_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('704', 'sql', 'E_GUAR_ACCT_BS', 'RPT_DATE_CODE', 'EEA_RPTDATECODEIS_EEF_ISNULL', 
    '“报告时点说明代码”为“50-其他信息变化”时，不包括在保责任信息段。', 'cirs', 'Y', 'N', 'EEA_GUAR_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('705', 'sql', 'E_GUAR_ACCT_BS', 'RPT_DATE_CODE', 'EEA_RPTDATECODEIS_EEF_NOTNULL', 
    '“报告时点说明代码”为“40-五级分类调整”时，至少包含保责任信息段。', 'cirs', 'Y', 'N', 'EEA_GUAR_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('708', 'sql', 'E_GUAR_ACCT_BS_INF', 'BUSI_LINES', 'EEB_BUSIDTILLINES_BELONGTO_BUSILINES', 
    '“担保业务大类”和“担保业务种类细分”代码不匹配', 'cirs', 'Y', 'N', 'EEB_GUAR_ACCT_BS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('709', 'sql', 'E_GUAR_INSURANCE_INF', 'ACCT_STATUS', 'EEF_ACCTSTATUS2_CLOSEDATE_ISNOTNULL', 
    '当且仅当“账户状态”为“2-关闭”，“账户关闭日期”不能为空值', 'cirs', 'Y', 'N', 'EEF_GUAR_RLT_REPYMT_INF_SG_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('710', 'sql', 'E_GUAR_INSURANCE_INF', 'CLOSE_DATE', 'EEF_CLOSEDATE_NOTNULLANDEARLIERTHAN_OTHERDATE', 
    '账户信息记录中如果“账户关闭日期”数据项不为空，账户关闭日期应不早于“余额变化日期”、“五级分类认定日期”', 'cirs', 'Y', 'N', 'EEF_GUAR_RLT_REPYMT_INF_SG_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('711', 'sql', 'E_SEC_RLT_REPYMT_INF', 'INFO_ID_TYPE', 'EEC_ARLPCERTTYPE_BELONGTO_INFOIDTYPE', 
    '相关还款责任人段中“身份类别”和“责任人身份标识类型”代码必须相匹配', 'cirs', 'Y', 'N', 'EEC_RLT_REPYMT_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('712', 'sql', 'E_SEC_RLT_REPYMT_INF', 'ARLP_TYPE', 'EEC_ARLPTYPE2_WARTYSIGN_AND_MAXGUARMCC_ISNOTNULL', 
    '当“还款责任人类型”为“2-反担保人”时，“联保标志”、“保证合同编号”不应为空', 'cirs', 'Y', 'N', 'EEC_RLT_REPYMT_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('713', 'sql', 'E_GUAR_ACCT_BS_INF', 'OPEN_DATE', 'OPENDATE_LATERTHAN_REPAYPRD_FIVECATEADJ_CLOSE', 
    '账户信息记录中的“开户日期”应不晚于“余额变化日期”、“五级分类认定日期”、“账户关闭日期”（若不为空）', 'cirs', 'Y', 'N', 'EEB_GUAR_ACCT_BS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('714', 'sql', 'E_SEC_RLT_REPYMT_INF', 'ARLP_CERT_NUM', 'EEA_OBLIGOR_AND_PERSONLIABLE_TWOMARK_NOTSAME', 
    '债务人两标与相关还款责任人两标不能相同', 'cirs', 'Y', 'N', 'EEC_RLT_REPYMT_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('715', 'sql', 'E_ACCT_BS_INF', 'GUAR_MODE', 'CHECK_GUARMODE_RPTDATECODE10', 
    '当“报告时点说明代码”为“10-新开户/首次上报”，若“基本信息段”的“担保方式”为“1-保证”时，必须报送相关还款责任人段', 'cirs', 'Y', 'N', 'EDB_ACCT_BS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('716', 'sql', 'E_ACCT_BS_INF', 'GUAR_MODE', 'CHECK_GUARMODE_RPTDATECODE10', 
    '当“报告时点说明代码”为“10-新开户/首次上报”，若“基本信息段”的“担保方式”为“2-质押”、“3-抵押”时，必须报送抵质押物信息段。', 'cirs', 'Y', 'N', 'EDB_ACCT_BS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('717', 'sql', 'E_ACCT_SPEC_TRST', 'CHAN_TRAN_TYPE', 'EDH_TRANDATE_AND_CHANTRANTYPE_NOTEXIST', 
    '特定交易说明段中的“交易日期”+“交易类型”在库中不能存在', 'cirs', 'Y', 'N', 'EDH_ACCT_SPEC_TRST_DSPN_SG_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('706', 'sql', 'E_GUAR_ACCT_BS', 'RPT_DATE_CODE', 'EEA_RPTDATECODE10_GUAR_MODE1_EEC_NOTNULL', 
    '“报告时点说明代码”为“10-新开户/首次上报”且“反担保方式”为“1-保证”时，至少包含相关还款责任人段', 'cirs', 'Y', 'N', 'EEA_GUAR_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('707', 'sql', 'E_GUAR_ACCT_BS_INF', 'OPEN_DATE', 'EEB_OPENDATE_GREANTERTHAN_DUEDATE', 
    '“开户日期”应不晚于“到期日期”', 'cirs', 'Y', 'N', 'EEB_GUAR_ACCT_BS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('718', 'sql', 'E_ACCT_BS_INF', 'OPEN_DATE', 'EDB_OPENDATE_GREATERTHAN_DUEDATE', 
    '“开户日期”应不晚于“到期日期”', 'cirs', 'Y', 'N', 'EDB_ACCT_BS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('719', 'sql', 'E_ACCT_BS_INF', 'REPAY_MODE', 'EDB_REPAYMODE90_REPAYFREQCY10', 
    '“还款方式”为“90-汇总报送，不区分还款方式”，则“还款频率”应为“10-月”', 'cirs', 'Y', 'N', 'EDB_ACCT_BS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('720', 'sql', 'E_ACCT_BS_INF', 'REPAY_MODE', 'EDB_REPAYMODE2%_REPAYFREQCY99', 
    '“还款方式”以“2”开头，则“还款频率”应为“99-其他”', 'cirs', 'Y', 'N', 'EDB_ACCT_BS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('721', 'sql', 'E_ACCT_BS_INF', 'REPAY_MODE', 'CHECK_EDA_ACCTTYPE_AND_EDB_REPAYMODE', 
    '若账户类型为 R4,D1 时，账户基本信息段中的还款方式必须不为31,32,33,39', 'cirs', 'Y', 'N', 'EDB_ACCT_BS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('722', 'sql', 'E_ACCT_BS_INF', 'REPAY_MODE', 'CHECK_EDA_ACCTTYPE_AND_EDB_REPAYMODE', 
    '若账户类型为 R1 时，账户基本信息段中的还款方式必须不为11,12,13,14,15,19,21,22,23,29', 'cirs', 'Y', 'N', 'EDB_ACCT_BS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('723', 'sql', 'E_RLT_REPYMT_INF', 'ARLP_TYPE', 'CHECK_EDC_ARLPTYPE_AND_ARLPAMT', 
    '还款责任人类型为1-共同借款人时，还款责任金额为空，否则不能为空值', 'cirs', 'Y', 'N', 'EDC_RLT_REPYMT_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('724', 'sql', 'E_RLT_REPYMT_INF', 'ARLP_TYPE', 'CHECK_EDC_ARLPTYPE_AND_WARTYSIGN_MAXGUARMCC', 
    '还款责任人类型为2-保证人时，联保标志,保证合同编号必须不能为空值', 'cirs', 'Y', 'N', 'EDC_RLT_REPYMT_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('725', 'sql', 'E_RLT_REPYMT_INF', 'ARLP_ID_TYPE', 'CHECK_EDC_ARLPCERTTYPE_AND_ARLPIDTYPE', 
    '身份类别和责任人身份标识类型的代码必须匹配', 'cirs', 'Y', 'N', 'EDC_RLT_REPYMT_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('726', 'sql', 'E_ACT_LBLTY_INF', 'ACCT_STATUS', 'CHECK_EDG_ACCTSTATUS21_AND_ACCTBAL0', 
    '若账户状态为21-关闭时，余额,当前逾期总额,当前逾期本金和当前逾期天数必须为 0。', 'cirs', 'Y', 'N', 'EDG_ACT_LBLTY_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('727', 'sql', 'E_ACT_LBLTY_INF', 'ACCT_STATUS', 'CHECK_EDG_ACCTSTATUS21_AND_CLOSEDATENOTNULL', 
    '当且仅当账户状态为21-关闭时，账户关闭日期不能为空值', 'cirs', 'Y', 'N', 'EDG_ACT_LBLTY_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2052', 'sql', 'I_AMBLG_INF', 'ACCT_STATUS', 'gr_jd_is_one13', 
    '若“账户状态”为“3-关闭”/“4-销户”，“余额”应为 0', 'cirs', 'Y', 'N', 'PBG_AMBLG_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2053', 'sql', 'I_AMBLG_INF', 'ACCT_STATUS', 'gr_jd_is_one14', 
    '“账户状态”和“当前还款状态”需要保持一致：“账户状态”为“3-关闭”/“4-销户”时，“当前还款状态”应为“C-结清”/“C-销户”、“G-结束', 'cirs', 'Y', 'N', 'PBG_AMBLG_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2054', 'sql', 'I_AMBLG_INF', 'CLOSE_DATE', 'gr_jd_is_one15', 
    '若“账户关闭日期”数据项不为空，则“账户关闭日期”应不早于“结算/应还款日”、最近一次实际还款日期”、五级分类认定日期', 'cirs', 'Y', 'N', 'PBG_AMBLG_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2055', 'sql', 'I_AMBLG_INF', 'ACCT_STATUS', 'gr_jd_is_one16', 
    '若“账户状态”为“3-关闭”/“4-销户”，“账户关闭日期”不能为空值', 'cirs', 'Y', 'N', 'PBG_AMBLG_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2056', 'sql', 'I_ACCT_DBT_INF', 'NOMONTH_ACCT_STATUS', 'gr_jd_is_one16', 
    '若“账户状态”为“2-结束”，则“账户关闭日期”不能为空值', 'cirs', 'Y', 'N', 'PBI_ACCT_DBT_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2057', 'sql', 'I_AMBLG_INF', 'ACCT_STATUS', 'gr_jd_is_one17', 
    '当账户状态为“关闭”/“销户”时，“当前逾期总额”、“当前逾期期数”应为 0', 'cirs', 'Y', 'N', 'PBG_AMBLG_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2058', 'sql', 'I_SPEC_PRD', 'SPEC_EFCT_DATE', 'gr_jd_is_one18', 
    '“分期额度生效日期”应不晚于“分期额度到期日期', 'cirs', 'Y', 'N', 'PBH_SPEC_PRD_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2059', 'sql', 'I_ACCT_DBT_INF', 'NOMONTH_RPY_STATUS', 'gr_jd_is_one19', 
    '“当前还款状态”只能为“N-正常', 'cirs', 'Y', 'N', 'PBI_ACCT_DBT_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2060', 'sql', 'I_ACCT_DBT_INF', 'NOMONTH_CLOSE_DATE', 'gr_jd_is_one20', 
    '若“账户关闭日期”数据项不为空，则“账户关闭日期”应不早于“最近一次实际还款日期”、“五级分类认定日期', 'cirs', 'Y', 'N', 'PBI_ACCT_DBT_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2061', 'sql', 'I_ACCT_DBT_INF', 'NOMONTH_ACCT_STATUS', 'gr_jd_is_one21', 
    '若“账户状态”为“2-结束”，则“余额”应为 0', 'cirs', 'Y', 'N', 'PBI_ACCT_DBT_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2062', 'sql', 'I_AMBLG_INF', 'OVEDRAW_BA_OVE180', 'gr_jd_is_two1', 
    '当账户信息记录中账户类型为R3时，透支 180 天以上未还余额应该小于等于余额', 'cirs', 'Y', 'N', 'PBG_AMBLG_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2063', 'sql', 'I_AMBLG_INF', 'ACCT_BAL', 'gr_jd_is_two2', 
    '当账户信息记录中账户类型为R3时，当前还款状态为*时，余额必须为 0', 'cirs', 'Y', 'N', 'PBG_AMBLG_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2064', 'sql', 'I_AMBLG_INF', 'ACCT_BAL', 'gr_jd_is_two3', 
    '当账户信息记录中账户类型为R3时，当前还款状态为数字1-7时，余额必须大于 0', 'cirs', 'Y', 'N', 'PBG_AMBLG_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2065', 'sql', 'I_ACCT_BS_INF', 'BUSI_LINES', 'gr_jd_is_two4', 
    '当账户类型为C1时，借贷业务大类只能为5-资产处置、6-垫款 当账户类型为R2/R3时，借贷业务大类只能为2-信用卡', 'cirs', 'Y', 'N', 'PBB_ACCT_BS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2066', 'sql', 'I_AMBLG_INF', 'ACCT_STATUS', 'gr_jd_is_two5', 
    '若报告时点说明代码为32-月结日账户关闭和20-账户关闭时，账户状态为3-关闭,4-销户', 'cirs', 'Y', 'N', 'PBG_AMBLG_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2067', 'sql', 'I_LOAN_RLT_REPYMT_INF', 'ARLP_CERT_NUM', 'gr_jd_is_two6', 
    '借款人证件类型、证件号码和责任人身份标识类型、责任人身份标识号码不能完全相同', 'cirs', 'Y', 'N', 'PBC_RLT_REPYMT_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2068', 'sql', 'I_ACCT_DBT_INF', 'NOMONTH_ACCT_STATUS', 'gr_jd_is_two7', 
    '对于 C1 外的其他账户，非月度表现中的账户状态不应为关闭或销户', 'cirs', 'Y', 'N', 'PBI_ACCT_DBT_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('10000', 'sql', 'E_MN_MMB_INF', 'MMB_PSTN', 'Only_Oneperson', 
    '法定代表人、董事长、监事长各自只能报送一人', 'cirs', 'Y', 'N', 'EAD_MN_MMB_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('10014', 'sql', 'I_CREDIT_LIM', 'CON_EFF_DATE', 'grsx_I2200D01', 
    '额度生效日期应不晚于额度到期日期', 'cirs', 'Y', 'N', 'PCC_CREDIT_LIM_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('10016', 'sql', 'I_CTRCT_CERT_REL', 'CERT_REL_ID_NUM', 'grsx_I2200A01', 
    '“受信人证件类型”、“受信人证件号码”与“共同受信人身份标识类型”、“共同受信人身份标识号码”不能相同', 'cirs', 'Y', 'N', 'PCB_CTRCT_CERT_REL_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('10020', 'sql', 'E_GUAR_ACCT_BS', 'RPT_DATE', 'qiye_danbao_01', 
    '如果账户信息记录最新一条的“账户状态”为“2-关闭”，则后续信息记录不能入库。', 'cirs', 'Y', 'N', 'EEA_GUAR_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('10021', 'sql', 'E_CTRCT_BS', 'RPT_DATE', 'qiye_shouxin_01', 
    '当库中最新一条授信协议信息记录中的“额度状态”为“2-到期/失效”时，后续信息记录不能入库', 'cirs', 'Y', 'N', 'EGA_CTRCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('10035', 'sql', 'I_ACCT_BS', 'ACCT_CODE', 'ACCT_CODE_is_not_null', 
    '借贷待更正业务标识码必须在库中存在', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('10036', 'sql', 'I_GUAR_ACCT_INF', 'OPEN_DATE', 'gr_db_o01', 
    '账户信息记录中的“开户日期”应不晚于“余额变化日期”、“五级分类认定日期”、“账户关闭日期（若不为空）”', 'cirs', 'Y', 'N', 'PDB_GUAR_ACCT_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('10002', 'sql', 'E_MN_MMB_INF', 'MMB_PSTN', 'NotOnly_Oneperson', 
    '董事长、监事长不能是同一个人', 'cirs', 'Y', 'N', 'EAD_MN_MMB_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('10026', 'sql', 'I_CTRCT_BS', 'CONTRACT_CODE', 'ACCT_CODE_is_not_null', 
    '授信待更正业务标识码必须在库中存在', 'cirs', 'Y', 'N', 'PCA_CTRCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('10027', 'sql', 'I_GUAR_ACCT_BS', 'ACCT_CODE', 'ACCT_CODE_is_not_null', 
    '担保待更正业务标识码必须在库中存在', 'cirs', 'Y', 'N', 'PDA_GUAR_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('10010', 'sql', 'I_IN_FAL_MMBS_INF', 'FAM_MEM_CERT_NUM', 'Two_standard_not_repeat', 
    '两组身份标识类型身份标识号码不能完全相同', 'cirs', 'Y', 'N', 'PAJ_IN_FAL_MMBS_INF_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('10012', 'sql', 'I_CTRCT_BS', 'RPT_DATE', 'grsx_R2201201', 
    '当库中最新一条个人授信协议信息记录中的“额度状态”为“2-到期/失效”时，后续信息记录不能入库', 'cirs', 'Y', 'N', 'PCA_CTRCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('10018', 'sql', 'I_IN_SPC_EVT_DSC_INF', 'MONTH', 'grjd_tssj_02', 
    '借贷账户特殊事件说明记录的“信息报告日期”与“发生月份”中的年、月相等', 'cirs', 'Y', 'N', 'PBK_IN_SPC_EVT_DSC_INF_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('10019', 'sql', 'I_IN_SPC_EVT_DSC_INF', 'RPT_DATE', 'grjd_tssj_03', 
    '待入库的特殊事件说明记录，若库中已存在“账户标识码”相同且信息报告日期相同个人借贷账户记录，则该记录不能入库。', 'cirs', 'Y', 'N', 'PBK_IN_SPC_EVT_DSC_INF_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('10028', 'sql', 'I_GUAR_ACCT_BS', 'RPT_DATE', 'gr_R2321209_01', 
    '更正在保责任信息段时，若待入库的更正请求记录中的信息报告日期晚于库中最新的在保责任信息段的信息报告日期，且库中在保责任信息段中的账户状态为“关闭”,则该更正请求记录不能入库', 'cirs', 'Y', 'N', 'PDA_GUAR_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('10011', 'sql', 'I_CTRCT_BS', 'INF_REC_TYPE', 'PCC_IS_NOT_NULL', 
    '个人授信协议记录报送时，“基础段”和“额度信息段”必须出现', 'cirs', 'Y', 'N', 'PCA_CTRCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('10015', 'sql', 'I_CREDIT_LIM', 'CREDIT_REST', 'grsx_I2200D02', 
    '“授信限额”、“授信限额编号”必须同时出现。', 'cirs', 'Y', 'N', 'PCC_CREDIT_LIM_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('10017', 'sql', 'I_IN_SPC_EVT_DSC_INF', 'ACCT_CODE', 'grjd_tssj_01', 
    '“账户标识码”对应的个人借贷账户必须已经在库中存在，否则该记录不能入库。', 'cris', 'Y', 'N', 'PBK_IN_SPC_EVT_DSC_INF_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('10022', 'sql', 'E_ACT_LBLTY_INF', 'CLOSE_DATE', 'QY_JD_010', 
    '当账户关闭日不为空时，则必须不早于余额变化日期、最近一次实际还款日期、最近一次约定还款日期、五级分类认定日期', 'cirs', 'Y', 'N', 'EDG_ACT_LBLTY_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('10023', 'sql', 'E_ACT_LBLTY_INF', 'ACCT_STATUS', 'QY_JD_020', 
    '当且仅当报告时点说明代码为20-账户关闭时，账户状态为21-关闭', 'cirs', 'Y', 'N', 'EDG_ACT_LBLTY_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('10024', 'sql', 'I_IN_ACCT_DEL', 'DEL_START_DATE', 'ST_AND_ET_IS_NOT_NULL', 
    '待删除起始日期,待删除的终止日期不能同时为空值', 'cirs', 'Y', 'N', 'PBY_IN_ACCT_DEL_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('10025', 'sql', 'I_IN_ACCT_DEL', 'DEL_END_DATE', 'ED_No_greater_than_SD', 
    '个人借贷待删除起始日期必须小于等于待删除的结束日期', 'cirs', 'Y', 'N', 'PBY_IN_ACCT_DEL_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('10029', 'sql', 'I_AMBLG_INF', 'OVEDRAW_BA_OVE180', 'grjd_d_001', 
    '当账户信息记录中“账户类型”为“R3”时，“透支 180 天以上未还余额”应该小于等于“余额”', 'cirs', 'Y', 'N', 'PBG_AMBLG_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('10030', 'sql', 'I_AMBLG_INF', 'ACCT_BAL', 'grjd_d_002', 
    '当账户信息记录中“账户类型”为“R3”时，“当前还款状态”为“*”时，“余额”必须为 0', 'cirs', 'Y', 'N', 'PBG_AMBLG_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('10031', 'sql', 'I_AMBLG_INF', 'ACCT_BAL', 'grjd_d_003', 
    '当账户信息记录中“账户类型”为“R3”时，“当前还款状态”为数字“1-7”时，“余额”必须大于 0', 'cirs', 'Y', 'N', 'PBG_AMBLG_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('10032', 'sql', 'I_AMBLG_INF', 'ACCT_STATUS', 'grjd_d_004', 
    '若“报告时点说明代码”为“32-月结日账户关闭”和“20-账户关闭”时，“账户状态”为“3-关闭/“4-销户”', 'cirs', 'Y', 'N', 'PBG_AMBLG_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('10034', 'sql', 'I_ACCT_DBT_INF', 'NOMONTH_ACCT_STATUS', 'grjd_d_005', 
    '对于C1外的其他账户，非月度表现中的账户状态不应为“关闭”或“销户”', 'cirs', 'Y', 'N', 'PBI_ACCT_DBT_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('779', 'sql', 'I_GUAR_ACCT_BS', 'ACCT_TYPE', 'CHECK_ACCTTYPE', 
    '待更正的段不能为基础段中“账户类型”所不适用的信息段', 'cirs', 'Y', 'N', 'PDA_GUAR_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('780', 'sql', 'I_ACCT_BS', 'ACCT_TYPE', 'CHECK_ACCTTYPE', 
    '待更正的段不能为基础段中“账户类型”所不适用的信息段', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('781', 'sql', 'I_ACCT_BS', 'RPT_DATE', 'CHAR_MDFCSGMTCODEJ_RPTDATE', 
    '更正非月度表现信息段时，若存在信息报告日期相同的特殊事件信息记录，则该记录不应被加载', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2000', 'sql', 'I_GUAR_ACCT_BS', 'RPT_DATE_CODE', 'RPT_DATE_CODE_TEN_IS_NOT_NULL', 
    '报告时点说明代码为10-新开户/首次上报，至少应出现账户基本信息段、在保责任信息段', 'cirs', 'Y', 'N', 'PDA_GUAR_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2001', 'sql', 'I_GUAR_ACCT_BS', 'RPT_DATE_CODE', 'PDE_GR_REPYMT_INF_SGMT_TEN_IS_NOT_NULL', 
    '报告时点说明代码为20-账户关闭,30-在保责任变化,40-五级分类调整时，至少应出现在保责任信息段', 'cirs', 'Y', 'N', 'PDA_GUAR_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2002', 'sql', 'I_GUAR_ACCT_INF', 'GUAR_MODE', 'PDC_RLT_REPYMT_INF_SGMT_IS_NOT_NULL', 
    '报告时点说明代码为10-新开户/首次上报且反担保方式为1-保证时，应出现相关还款责任人信息段', 'cirs', 'Y', 'N', 'PDB_GUAR_ACCT_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2003', 'sql', 'I_GR_REPYMT_INF', 'ACCT_STATUS', 'PDE_GR_REPYMT_INF_SGMT_FIFTY_IS_NULL', 
    '报告时点说明代码为50-其他信息变化时，不包括在保责任信息段', 'cirs', 'Y', 'N', 'PDE_GR_REPYMT_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2004', 'sql', 'I_GUAR_ACCT_INF', 'OPEN_DATE', 'OPEN_DAT_DUE_DATE', 
    '开户日期应不晚于到期日期', 'cirs', 'Y', 'N', 'PDB_GUAR_ACCT_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2005', 'sql', 'I_GR_REPYMT_INF', 'CLOSE_DATE', 'DATA_IS_NOT_NULL', 
    '如果账户状态为2-关闭，则账户关闭日期不能为空值', 'cirs', 'Y', 'N', 'PDE_GR_REPYMT_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2006', 'sql', 'I_GUAR_RLT_REPYMT_INF', 'ARLP_TYPE', 'ARLP_TYPE_is_not_null', 
    '当还款责任人类型为2-反担保人时，联保标志、保证合同编号不应为空', 'cirs', 'Y', 'N', 'PDC_RLT_REPYMT_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2007', 'sql', 'I_GUAR_RLT_REPYMT_INF', 'ARLP_CERT_NUM', 'ID_TYPE_ID_NUM_is_not_the_same', 
    '债务人两标与责任人两标不能相同', 'cirs', 'Y', 'N', 'PDC_RLT_REPYMT_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2008', 'sql', 'I_BS', 'RPT_DATE_CODE', 'table_is_not_null', 
    '对于个人基本信息记录，若报告时点说明代码为10-新增客户/首次上报，该记录至少包含基本概况信息段、教育信息段、居住地址段、通讯地址段、婚姻信息段、职业信息段', 'cirs', 'Y', 'N', 'PAA_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2009', 'sql', 'I_OCTPN_INF', 'EMP_STATUS', 'FIDLD_IS_NULL_OR_NOT_NULL', 
    '若就业状况为11-国家公务员、13-专业技术人员、17-职员、21-企业管理人员、24-工人或91-在职时，单位名称、单位性质、单位所属行业、单位详细地址、单位所在地邮编、单位所在地行政区划、单位电话、职业、职务、职称和本单位工作起始年份必须出现；若“就业状况为上述以外的代码，上述数据项不能出现。', 'cirs', 'Y', 'N', 'PAE_OCTPN_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2010', 'sql', 'I_SPS_INF', 'MARI_STATUS', 'FIDLD2_IS_NULL_OR_NOT_NULL', 
    '若婚姻状况为20-已婚、21-初婚、22-再婚、23-复婚时，配偶姓名、配偶证件类型、配偶证件号码、配偶联系电话、配偶工作单位必须出现；若婚姻状况为上述以外的代码，上述数据项不能出现。', 'cirs', 'Y', 'N', 'PAH_SPS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2011', 'sql', 'I_FCS_INF', 'D_O_B', 'D_O_B_FCS_INFO_UP_DATE_one', 
    '出生日期应不晚于信息更新日期', 'cirs', 'Y', 'N', 'PAC_FCS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2012', 'sql', 'I_SPS_INF', 'SPO_ID_TYPE', 'one_not_null', 
    '配偶证件类型、配偶证件号码其中之一不为空时，另一个应不为空', 'cirs', 'Y', 'N', 'PAH_SPS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2013', 'sql', 'I_EDU_INF', 'EDU_LEVEL', 'EDU_LEVEL_ACA_DEGREE_one', 
    '当学历为30-大专、40-中专、职高、技校、70-初中、80-小学时，学位只能为5-无或9-未知', 'cirs', 'Y', 'N', 'PAD_EDU_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2014', 'sql', 'I_OCTPN_INF', 'CPN_TYPE', 'CPN_TYPE_OCCUPATION_one', 
    '当单位性质为30-外资企业、40-个体、私营企业、50-其他（包括三资企业、民营企业、民间团体等）时，职业不能为0-国家机关、党群组织、企业、事业单位负责人、X-军人', 'cirs', 'Y', 'N', 'PAE_OCTPN_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2015', 'sql', 'I_ID', 'OTH_ID_TYPE', 'NUM_and_TYPE_THE_SAME3', 
    '证件类型、证件号码不能与基础段中的证件类型、证件号码完全相同', 'cirs', 'Y', 'N', 'PAB_ID_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2016', 'sql', 'I_SPS_INF', 'SPO_ID_TYPE', 'NUM_and_TYPE_THE_SAME3', 
    '证件类型、证件号码不能与基础段中的证件类型、证件号码完全相同', 'cirs', 'Y', 'N', 'PAH_SPS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2017', 'sql', 'I_ACCT_BS', 'RPT_DATE_CODE', 'gr_pb_table_one1', 
    '当报告时点说明代码为30-月度结算时：除基础段外，至少还应包含月度表现信息段；账户类型不能为C1。', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2018', 'sql', 'I_ACCT_BS', 'RPT_DATE_CODE', 'gr_pb_table_one1', 
    '当报告时点说明代码为31-月结日首次上报存量账户时，除基础段外，至少包含基本信息段，账户类型不能为C1', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2019', 'sql', 'I_ACCT_BS', 'RPT_DATE_CODE', 'gr_pb_table_one1', 
    '当报告时点说明代码为32-月结日账户关闭时：除基础段外，至少还应包括月度表现信息段，账户类型不能为C1。', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2020', 'sql', 'I_ACCT_BS', 'RPT_DATE_CODE', 'gr_pb_table_one1', 
    '当报告时点说明代码为40-收回逾期款项时：除基础段外，至少还应包含非月度表现信息段；账户类型不能为R3', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2021', 'sql', 'I_ACCT_BS', 'RPT_DATE_CODE', 'gr_pb_table_one2', 
    '当报告时点说明代码为20-账户关闭时，除基础段，若账户类型为D1/R1/R2/R3/R4，还应包含月度表现信息段', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2022', 'sql', 'I_ACCT_BS', 'RPT_DATE_CODE', 'gr_pb_table_one2', 
    '当报告时点说明代码为20-账户关闭时，除基础段,若账户类型为C1，还应包含非月度表现信息段', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2023', 'sql', 'I_ACCT_BS', 'RPT_DATE_CODE', 'gr_pb_table_one3', 
    '当报告时点说明代码为10-新开户时，至少包含基本信息段：若账户类型为R2，还应包含月度表现段。如果基本信息段中的借贷业务种类细分不是大额专项分期卡，还应包含授信额度信息段', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2024', 'sql', 'I_ACCT_BS', 'RPT_DATE_CODE', 'gr_pb_table_one4', 
    '当报告时点说明代码为10-新开户时，除基础段外，至少包含基本信息段：若账户类型为R1/R3/R4，还应包含月度表现信息段、授信额度信息段', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2025', 'sql', 'I_ACCT_BS', 'RPT_DATE_CODE', 'gr_pb_table_one4', 
    '当报告时点说明代码为10-新开户时，除基础段外，至少包含基本信息段，若账户类型为C1，还应包含初始债权说明段、非月度表现信息段', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2026', 'sql', 'I_ACCT_BS', 'RPT_DATE_CODE', 'gr_pb_table_one5', 
    '报告时点说明代码为10-新开户时，除基础段外，个人借贷账户信息记录至少包含基本信息段', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('738', 'sql', 'E_ACCT_BS_INF', 'OPEN_DATE', 'CHECK_EDB_OPENDATE_AND_OTHERDATE', 
    '开户日期不晚于同一条记录中的所有其他业务日期。其他业务日期包括但不限于：到期日期,余额变化日期,五级分类认定日期,最近一次实际还款日期,最近一次约定还款日期,下一次约定还款日期,账户关闭日期和交易日期', 'cirs', 'Y', 'N', 'EDB_ACCT_BS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('739', 'sql', 'E_ACCT_BS', 'RPT_DATE_CODE', 'CHECK_EDA_RPTDATECODE20_AND_ACCTSTATUS', 
    '当且仅当报告时点说明代码为20-账户关闭时，账户状态为21-关闭', 'cirs', 'Y', 'N', 'EDA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('740', 'sql', 'E_ACCT_BS_INF', 'BUSI_LINES', 'CHECK_EDB_ACCTTYPEC1_AND_BUSILINES', 
    '当账户类型为C1时，信贷业务大类只能为51-资产处置,41-垫款', 'cirs', 'Y', 'N', 'EDB_ACCT_BS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('741', 'sql', 'E_ACCT_SPEC_TRST', 'TRAN_AMT', 'CHECK_EDH_TRANAMT_AND_LOANAMT', 
    '交易金额小于等于借款金额', 'cirs', 'Y', 'N', 'EDH_ACCT_SPEC_TRST_DSPN_SG_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('742', 'sql', 'E_ACCT_BS_INF', 'REPAY_MODE', 'CHECK_EDB_REPAYMODE_AND_ACCTTYPE', 
    '还款方式的代码表必须和账户类型相匹配', 'cirs', 'Y', 'N', 'EDB_ACCT_BS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('743', 'sql', 'E_RLT_REPYMT_INF', 'ARLP_CERT_NUM', 'CHECK_EDC_TWOMARK_LOAN_AND_DUTY', 
    '借款人两标（身份标识类型,身份标识号码）和责任人两标不能相同', 'cirs', 'Y', 'N', 'EDC_RLT_REPYMT_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('746', 'sql', 'I_CTRCT_BS', 'MDFC_SGMT_CODE', 'CHECK_PCA_MDFC_SGMT_CODE', 
    '待更正的段的内容和待更正的段标应保持一致', 'cirs', 'Y', 'N', 'PCA_CTRCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('747', 'sql', 'I_ACCT_BS', 'MDFC_SGMT_CODE', 'CHECK_PBA_MDFC_SGMT_CODE', 
    '待更正的段的内容和待更正的段标应保持一致', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('748', 'sql', 'I_CTRCT_BS', 'MDFC_SGMT_CODE', 'CHECK_A_THREEMARK_AND_MNGMTORGCOD_OTHERNULL', 
    '当更正基础段时，基础段中仅出现信息主体三项标识、“业务管理机构代码”，其他数据项不出现。', 'cirs', 'Y', 'N', 'PCA_CTRCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('749', 'sql', 'I_GUAR_ACCT_BS', 'MDFC_SGMT_CODE', 'CHECK_A_THREEMARK_AND_MNGMTORGCOD_OTHERNULL', 
    '当更正基础段时，基础段中仅出现信息主体三项标识、“业务管理机构代码”，其他数据项不出现。', 'cirs', 'Y', 'N', 'PDA_GUAR_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('750', 'sql', 'I_ACCT_BS', 'MDFC_SGMT_CODE', 'CHECK_A_THREEMARK_AND_MNGMTORGCOD_OTHERNULL', 
    '当更正基础段时，基础段中仅出现信息主体三项标识、“业务管理机构代码”，其他数据项不出现。', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('751', 'sql', 'I_CTRCT_BS', 'RPT_DATE', 'CHECK_MDFCSGMTCODEC_RPTDATE', 
    '信息报告日期应不早于库中最晚的信息报告日期', 'cirs', 'Y', 'N', 'PCA_CTRCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('752', 'sql', 'I_CTRCT_BS', 'RPT_DATE', 'CHECK_A_MDFCSGMTCODE_RPTDATE', 
    '信息报告日期应等于相应信息段最晚的信息报告日期', 'cirs', 'Y', 'N', 'PCA_CTRCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('753', 'sql', 'I_GUAR_ACCT_BS', 'RPT_DATE', 'CHECK_A_MDFCSGMTCODE_RPTDATE', 
    '信息报告日期应等于相应信息段最晚的信息报告日期', 'cirs', 'Y', 'N', 'PDA_GUAR_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('754', 'sql', 'I_ACCT_BS', 'RPT_DATE', 'CHECK_A_MDFCSGMTCODE_RPTDATE', 
    '信息报告日期应等于相应信息段最晚的信息报告日期', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('756', 'sql', 'I_GUAR_ACCT_BS', 'RPT_DATE', 'CHECK_MDFCSGMTCODEC_RPTDATE', 
    '信息报告日期应不早于库中最晚的信息报告日期', 'cirs', 'Y', 'N', 'PDA_GUAR_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('757', 'sql', 'I_GUAR_ACCT_BS', 'RPT_DATE', 'CHECK_MDFCSGMTCODEC_RPTDATE', 
    '信息报告日期应不早于库中最晚的信息报告日期', 'cirs', 'Y', 'N', 'PDA_GUAR_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('758', 'sql', 'I_GUAR_ACCT_BS', 'RPT_DATE', 'CHECK_MDFCSGMTCODEC_RPTDATE', 
    '信息报告日期应不早于库中最晚的信息报告日期', 'cirs', 'Y', 'N', 'PDA_GUAR_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('759', 'sql', 'I_GUAR_ACCT_BS', 'RPT_DATE', 'CHECK_MDFCSGMTCODEC_RPTDATE', 
    '信息报告日期应不早于库中最晚的信息报告日期', 'cirs', 'Y', 'N', 'PDA_GUAR_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('760', 'sql', 'I_AMBLG_INF', 'MONTH', 'CHECK_PBG_MONTH_AND_PBA_RPT_DATE', 
    '“月份”必须与信息报告日期的年、月保持一致', 'cirs', 'Y', 'N', 'PBG_AMBLG_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('761', 'sql', 'I_ACCT_BS', 'RPT_DATE', 'CHECK_A_MDFCSGMTCODE_RPTDATE', 
    '信息报告日期应等于相应信息段最晚的信息报告日期', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('762', 'sql', 'I_ACCT_BS', 'RPT_DATE', 'CHECK_RPTDATE_SPECEFCTDATE', 
    '库中存在“分期额度生效日期”相等数据时，信息报告日期更晚的大额专项分期信息不能入库', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('763', 'sql', 'I_AMBLG_INF', 'ACCT_STATUS', 'CHECK_ACCTSTATUS_ACCTTYPE_OPETNTYPE', 
    '对于销户重启的 R2 账户，不能将历史上的“4-销户”更正为非销户的状态', 'cirs', 'Y', 'N', 'PBG_AMBLG_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('764', 'sql', 'I_ACCT_BS', 'RPT_DATE', 'CHECK_MDFCSGMTCODEC_RPTDATE', 
    '信息报告日期应不早于库中最晚的信息报告日期', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('765', 'sql', 'I_ACCT_BS', 'RPT_DATE', 'CHECK_MDFCSGMTCODEC_RPTDATE', 
    '信息报告日期应不早于库中最晚的信息报告日期', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('766', 'sql', 'I_ACCT_BS', 'RPT_DATE', 'CHECK_MDFCSGMTCODEC_RPTDATE', 
    '信息报告日期应不早于库中最晚的信息报告日期', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('767', 'sql', 'I_ACCT_BS', 'RPT_DATE', 'CHECK_MDFCSGMTCODEC_RPTDATE', 
    '信息报告日期应不早于库中最晚的信息报告日期', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('768', 'sql', 'I_ACCT_BS', 'RPT_DATE', 'CHECK_MDFCSGMTCODEC_RPTDATE', 
    '信息报告日期应不早于库中最晚的信息报告日期', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('769', 'sql', 'I_ACCT_BS', 'RPT_DATE', 'CHECK_MDFCSGMTCODEC_RPTDATE', 
    '信息报告日期应不早于库中最晚的信息报告日期', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
COMMIT;
