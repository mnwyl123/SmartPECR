DELETE FROM VALIDATE_RULES;
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('65', 'sql', 'E_INSTITU_BALANCE_BS', 'SHEET_TYPE', 'SHEET_TYPE_is_ten', 
    '�������ͱ�����д10', 'cirs', 'Y', 'N', 'EKA_INSTITUTION_BALANCE_SHT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('66', 'sql', 'E_INCOME_EXPENSE', 'CURRENT_FINANCIAL_SUBSIDY_CARR', 'value_is_false', 
    '���ڲ���������ת����ֵ����ȷ', 'cirs', 'Y', 'N', 'ELB_INCOME_AND_EXPENSE_STAT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('67', 'sql', 'E_INCOME_EXPENSE', 'CURRENT_UNDERTAKINGS_CARRIED_O', 'value_is_false', 
    '������ҵ��ת����ֵ����ȷ', 'cirs', 'Y', 'N', 'ELB_INCOME_AND_EXPENSE_STAT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('68', 'sql', 'E_INCOME_EXPENSE', 'CURRENT_OPERATING_BALANCE', 'value_is_false', 
    '���ھ�Ӫ����ֵ����ȷ', 'cirs', 'Y', 'N', 'ELB_INCOME_AND_EXPENSE_STAT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('69', 'sql', 'E_INSTITU_BALANCE', 'TOTAL_ASSETS', 'value_is_false_2', 
    '�ʲ��ܼ�ֵ����ȷ', 'cirs', 'Y', 'N', 'EKB_INSTITUTION_BALANCE_SHT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('70', 'sql', 'E_INSTITU_BALANCE', 'TOTAL_LIABILITIES', 'value_is_false_2', 
    '��ծ�ϼ�ֵ����ȷ', 'cirs', 'Y', 'N', 'EKB_INSTITUTION_BALANCE_SHT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('71', 'sql', 'E_INSTITU_BALANCE', 'TOTAL_LIABILITIES_AND_NET_ASSE', 'value_is_false_2', 
    '��ծ�;��ʲ��ܼ�ֵ����ȷ', 'cirs', 'Y', 'N', 'EKB_INSTITUTION_BALANCE_SHT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('45', 'sql', 'E_ACCT_BS', 'ACCT_TYPE', 'ACCT_TYPE_is_the_same', 
    '�����������¼�����εġ��˻����͡�Ӧ����С��˻����͡�һ��', 'cirs', 'Y', 'N', 'EDA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('46', 'sql', 'E_RLT_REPYMT_INF', 'ARLP_CERT_NUM', 'ID_NUM_and_ID_TYPE_not_repeat', 
    '���������ػ��������˶�ʱ���������������������겻����ͬ', 'cirs', 'Y', 'N', 'EDC_RLT_REPYMT_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('72', 'sql', 'E_INSTITU_BALANCE', 'TOTAL_ASSETS', 'value_is_false_3', 
    '�ʲ��ܼ�=��ծ�;��ʲ��ܼ�', 'cirs', 'Y', 'N', 'EKB_INSTITUTION_BALANCE_SHT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('73', 'sql', 'E_BALANCE_SHEET02', 'TOTAL_EQUITY_AND_LIABILITIES', 'value_is_false_4', 
    '��ծ��������Ȩ���ܼ�=��ծ�ϼ�+�����ɶ�Ȩ��+������Ȩ��ϼ�', 'cirs', 'Y', 'N', 'EHB_BALANCE_SHEET2002_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('74', 'sql', 'E_BALANCE_SHEET02', 'TOTAL_ASSETS', 'value_is_false_3', 
    '��ծ��������Ȩ���ܼ�=�ʲ��ܼ�', 'cirs', 'Y', 'N', 'EHB_BALANCE_SHEET2002_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('75', 'sql', 'E_BALANCE_SHEET07', 'TOTAL_EQUITY_AND_LIABILITIES', 'value_is_false_2', 
    '��ծ��������Ȩ��ϼ�=��ծ�ϼ�+������Ȩ��ϼ�', 'cirs', 'Y', 'N', 'EHC_BALANCE_SHEET2007_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('76', 'sql', 'E_BALANCE_SHEET07', 'TOTAL_ASSETS', 'value_is_false_3', 
    '��ծ��������Ȩ���ܼ�=�ʲ��ܼ�', 'cirs', 'Y', 'N', 'EHC_BALANCE_SHEET2007_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('77', 'sql', 'E_CASH_FLOWS2002', 'NET_CASH_FLOWS_FROM_OPERATING', 'value_is_false', 
    '��Ӫ��������ֽ����������Ӫ��ֽ�����С�ƣ���Ӫ��ֽ�����С��', 'cirs', 'Y', 'N', 'EJB_CASH_FLOWS2002_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('78', 'sql', 'E_CASH_FLOWS2002', 'NET_CASH_FLOWS_FROM_INVESTING_', 'value_is_false', 
    'Ͷ�ʻ�������ֽ��������Ͷ�ʻ�ֽ�����С�ƣ�Ͷ�ʻ�ֽ�����С��', 'cirs', 'Y', 'N', 'EJB_CASH_FLOWS2002_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('79', 'sql', 'E_CASH_FLOWS2002', 'NET_CASH_FLOWS_FROM_FINANCING_', 'value_is_false', 
    '�Ｏ��������ֽ�����������ʻ�ֽ�����С�ƣ����ʻ�ֽ�����С��', 'cirs', 'Y', 'N', 'EJB_CASH_FLOWS2002_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('80', 'sql', 'E_CASH_FLOWS2002', 'NET_INCREASE_IN_CASH_AND_CASH_', 'value_is_false_5', 
    '�ֽ��ֽ�ȼ��ﾻ���Ӷ�Ｏ��������ֽ�����������ʱ䶯���ֽ��Ӱ�죫��Ӫ��������ֽ��������Ͷ�ʻ�������ֽ���������', 'cirs', 'Y', 'N', 'EJB_CASH_FLOWS2002_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('81', 'sql', 'E_CASH_FLOWS2007', 'NET_CASH_FLOWS_FROM_OPERATING', 'value_is_false', 
    '��Ӫ��������ֽ���������=��Ӫ��ֽ�����С�ƣ���Ӫ��ֽ�����С��', 'cirs', 'Y', 'N', 'EJC_CASH_FLOWS2007_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('82', 'sql', 'E_CASH_FLOWS2007', 'NET_CASH_FLOWS_FROM_INVESTING_', 'value_is_false', 
    'Ͷ�ʻ�������ֽ��������Ͷ�ʻ�ֽ�����С�ƣ�Ͷ�ʻ�ֽ�����С��', 'cirs', 'Y', 'N', 'EJC_CASH_FLOWS2007_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('83', 'sql', 'E_CASH_FLOWS2007', 'NET_CASH_FLOWS_FROM_FINANCING_', 'value_is_false', 
    '���ʻ�������ֽ�����������ʻ�ֽ�����С�ƣ����ʻ�ֽ�����С��', 'cirs', 'Y', 'N', 'EJC_CASH_FLOWS2007_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('85', 'sql', 'E_CASH_FLOWS2007', 'THE_FINAL_CASH_AND_CASH_EQUIVA', 'value_is_false_2', 
    '��ĩ�ֽ��ֽ�ȼ������=�ֽ��ֽ�ȼ��ﾻ���Ӷ�+�ڳ��ֽ��ֽ�ȼ������', 'cirs', 'Y', 'N', 'EJC_CASH_FLOWS2007_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('86', 'sql', 'E_CTRCT_BS', 'INF_REC_TYPE', 'Information_section_is_null_not', 
    '��ҵ����Э���¼����ʱ�������κͶ����Ϣ�α������', 'cirs', 'Y', 'N', 'EGA_CTRCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('87', 'sql', 'E_CREDIT_LIM', 'CON_EXP_DATE', 'ED_No_greater_than_SD', 
    '�����Ч���ڱ��벻���ڶ�ȵ�������', 'cirs', 'Y', 'N', 'EGC_CREDIT_LIM_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('88', 'sql', 'E_CREDIT_LIM', 'CREDIT_REST_CODE', 'a_not_null_another_not_null', 
    '�����޶��š������޶�����֮һ��Ϊ��ʱ����һ��Ӧ��Ϊ��', 'cirs', 'Y', 'N', 'EGC_CREDIT_LIM_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('89', 'sql', 'E_CTRCT_CERT_REL', 'CERT_REL_ID_NUM', 'ID_NUM_and_ID_TYPE_not_repeat_02', 
    '�����������빲ͬ���������겻����ͬ', 'cirs', 'Y', 'N', 'EGB_CTRCT_CERT_REL_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('90', 'sql', 'MOTGA_CLTAL_CTRCT_BS', 'INF_REC_TYPE', 'Information_section_is_null_not', 
    '����Ѻ������Ϣ�α������', 'cirs', 'Y', 'N', 'EFA_MOTGA_CLTAL_CTRCT_BS_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('91', 'sql', 'MOTGA_CLTAL_BS_INF', 'CC_EXP_DATE', 'ED_No_greater_than_SD', 
    '����Ѻ��ͬ��Ч���ڲ����ں�ͬ��������', 'cirs', 'Y', 'N', 'EFB_MOTGA_CLTAL_BS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('92', 'sql', 'MOTGA_CLTAL_BS_INF', 'GUAR_TYPE', 'COUNT_More_than_zero', 
    '��Ѻ�����Ӧ���� 0', 'cirs', 'Y', 'N', 'EFB_MOTGA_CLTAL_BS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('84', 'sql', 'E_CASH_FLOWS2007', 'NETINCREASEIN_CASH_AND_CASH_EQ', 'value_is_false_5', 
    '�ֽ��ֽ�ȼ��ﾻ���Ӷ�=��Ӫ��������ֽ���������+Ͷ�ʻ�������ֽ���������+���ʻ�������ֽ���������+���ʱ䶯���ֽ��ֽ�ȼ����Ӱ��', 'cirs', 'Y', 'N', 'EJC_CASH_FLOWS2007_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('93', 'sql', 'MOTGA_CLTAL_BS_INF', 'GUAR_TYPE', 'COUNT_More_than_zero', 
    '��Ѻ�����Ӧ���� 0', 'cirs', 'Y', 'N', 'EFB_MOTGA_CLTAL_BS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('94', 'sql', 'MOTGA_COM_REC_INF', 'GUAR_CERT_NUM', 'ID_NUM_and_ID_TYPE_not_repeat_02_02', 
    '����Ѻծ��������������ծ�������겻����ͬ', 'cirs', 'Y', 'N', 'EFC_COM_REC_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('95', 'sql', 'E_ACCT_BS', 'RPT_DATE_CODE', 'mingxiduan_is_not_null_02', 
    '����ʱ��˵������Ϊ10-�¿���/�״α��ͣ��˻�����ΪD2,C1Ӧ����������Ϣ�Ρ����������Ϣ��', 'cirs', 'Y', 'N', 'EDA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('96', 'sql', 'E_ACCT_BS', 'RPT_DATE_CODE', 'mingxiduan_is_not_null_02', 
    '����ʱ��˵������Ϊ20-�˻��رգ��˻�����ΪD1,D2,R1,R4,C1Ӧ����������Ϣ�Ρ����������Ϣ��', 'cirs', 'Y', 'N', 'EDA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('97', 'sql', 'E_ACCT_BS_INF', 'FLAG', 'mingxiduan_is_not_null_03', 
    '����ʱ��˵������Ϊ10-�¿���/�״α��ͣ��˻�����ΪD1�ҷִηſ��ʶΪ1,2����Ӧ�������Ŷ����Ϣ��', 'cirs', 'Y', 'N', 'EDB_ACCT_BS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('98', 'sql', 'E_ACCT_BS', 'RPT_DATE_CODE', 'mingxiduan_is_not_null_04', 
    '����ʱ��˵������Ϊ10-�¿���/�״α��ͣ��˻�����ΪR1,R4Ӧ����������Ϣ�Ρ����Ŷ����Ϣ�Ρ����������Ϣ��', 'cirs', 'Y', 'N', 'EDA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('99', 'sql', 'E_ACCT_BS', 'RPT_DATE_CODE', 'mingxiduan_is_not_null_05', 
    '�˻�����ΪR1��R4��C1��������31-������ſ�ı���ʱ��', 'cirs', 'Y', 'N', 'EDA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('100', 'sql', 'E_ACCT_BS', 'RPT_DATE_CODE', 'mingxiduan_is_not_null_01', 
    '����ʱ��˵������Ϊ20-�˻��رգ��˻�����ΪD1,D2,R1,R4,C1Ӧ�������������Ϣ��', 'cirs', 'Y', 'N', 'EDA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('101', 'sql', 'E_ACCT_BS', 'RPT_DATE_CODE', 'mingxiduan_is_not_null_01', 
    '����ʱ��˵������Ϊ32-Լ�������ս��㣬�˻�����ΪD1,D2,R4Ӧ�������������Ϣ��', 'cirs', 'Y', 'N', 'EDA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('102', 'sql', 'E_ACCT_BS', 'RPT_DATE_CODE', 'mingxiduan_is_not_null_05', 
    '�˻�����ΪR1��C1������32-Լ�������ս���ı���ʱ��', 'cirs', 'Y', 'N', 'EDA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('103', 'sql', 'E_ACCT_BS', 'RPT_DATE_CODE', 'mingxiduan_is_not_null_01', 
    '����ʱ��˵������Ϊ33-ʵ�ʻ���˻�����ΪD1,D2,R4,C1Ӧ�������������Ϣ��', 'cirs', 'Y', 'N', 'EDA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('104', 'sql', 'E_ACCT_BS', 'RPT_DATE_CODE', 'mingxiduan_is_not_null_05', 
    '�˻�����ΪR1������33-ʵ�ʻ���ı���ʱ��', 'cirs', 'Y', 'N', 'EDA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('105', 'sql', 'E_ACCT_BS', 'RPT_DATE_CODE', 'mingxiduan_is_not_null_01', 
    '����ʱ��˵������Ϊ41-�弶����������˻�����ΪD1,D2,R4,C1Ӧ�������������Ϣ��', 'cirs', 'Y', 'N', 'EDA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('106', 'sql', 'E_ACCT_BS', 'RPT_DATE_CODE', 'mingxiduan_is_not_null_05', 
    '�˻�����ΪR1������41-�弶��������ı���ʱ��', 'cirs', 'Y', 'N', 'EDA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('107', 'sql', 'E_ACCT_BS', 'RPT_DATE_CODE', 'mingxiduan_is_not_null_02', 
    '����ʱ��˵������Ϊ42-չ�ڷ������˻�����ΪD1,R4Ӧ�������������Ϣ�Ρ��ض�����˵����', 'cirs', 'Y', 'N', 'EDA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('108', 'sql', 'E_ACCT_BS', 'RPT_DATE_CODE', 'mingxiduan_is_not_null_05', 
    '�˻�����ΪD2,R1,C1������42-չ�ڷ����ı���ʱ��', 'cirs', 'Y', 'N', 'EDA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('109', 'sql', 'E_ACCT_BS', 'RPT_DATE_CODE', 'mingxiduan_is_not_null_01', 
    '����ʱ��˵������Ϊ49-���������գ��˻�����ΪD1,D2,R1,R4,C1Ӧ�������������Ϣ��', 'cirs', 'Y', 'N', 'EDA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('110', 'sql', 'E_ORIG_CREDITOR_INF  ', 'INIT_CRED_NAME', 'mingxiduan_is_null_01', 
    '����ʱ��˵������Ϊ10-�¿���/�״α���,20-�˻��ر�,32-Լ�������ս��㣬49-�������������˻�����ΪD1,R1,R4��Ӧ������ʼծȨ˵����', 'cirs', 'Y', 'N', 'EDF_ORIG_CREDITOR_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('111', 'sql', 'E_ORIG_CREDITOR_INF  ', 'INIT_CRED_NAME', 'mingxiduan_is_null_01', 
    '����ʱ��˵������Ϊ33-ʵ�ʻ���,42-չ�ڷ������˻�����ΪD1,R4��Ӧ������ʼծȨ˵����', 'cirs', 'Y', 'N', 'EDF_ORIG_CREDITOR_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('112', 'sql', 'E_ORIG_CREDITOR_INF  ', 'INIT_CRED_NAME', 'mingxiduan_is_null_01', 
    '����ʱ��˵������Ϊ41-�弶����������˻�����ΪR1��Ӧ������ʼծȨ˵����', 'cirs', 'Y', 'N', 'EDF_ORIG_CREDITOR_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('48', 'sql', 'E_GUAR_ACCT_BS', 'ACCT_CODE', 'ACCT_CODE_is_not_null', 
    '����������ҵ���ʶ������ڿ��д���', 'cirs', 'Y', 'N', 'EEA_GUAR_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('49', 'sql', 'E_GUAR_ACCT_BS', 'ACCT_TYPE', 'ACCT_TYPE_is_the_same', 
    '������������¼�����εġ��˻����͡�Ӧ����С��˻����͡�һ��', 'cirs', 'Y', 'N', 'EEA_GUAR_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('50', 'sql', 'E_SEC_RLT_REPYMT_INF', 'ARLP_CERT_NUM', 'ID_NUM_and_ID_TYPE_not_repeat', 
    '����������ػ��������˶�ʱ���������������������겻����ͬ', 'cirs', 'Y', 'N', 'EEC_RLT_REPYMT_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('51', 'sql', 'E_GUAR_ACCT_BS', 'RPT_DATE', 'RPT_DATE_is_repeat', 
    '��������������ʱ�������ĸ��������¼����Ϣ��������Ӧ���ڿ�����Ӧ��Ϣ�����µ���Ϣ��������', 'cirs', 'Y', 'N', 'EEA_GUAR_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('52', 'sql', 'E_CTRCT_BS', 'CONTRACT_CODE', 'ACCT_CODE_is_not_null', 
    '���Ŵ�����ҵ���ʶ������ڿ��д���', 'cirs', 'Y', 'N', 'EGA_CTRCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('53', 'sql', 'E_CTRCT_CERT_REL', 'CERT_REL_ID_NUM', 'ID_NUM_and_ID_TYPE_not_repeat', 
    '���Ÿ�����ͬ��������Ϣ��ʱ����ͬ���������������������겻����ͬ', 'cirs', 'Y', 'N', 'EGB_CTRCT_CERT_REL_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('728', 'sql', 'E_ACT_LBLTY_INF', 'ACCT_STATUS', 'CHECK_EDG_ACCTSTATUS21_AND_TOTOVERD', 
    '���˻�״̬Ϊ31-���ˣ��Ѻ�����,32-���ˣ���������϶����򣬵ȴ�������ʱ����ǰ�����ܶ��Ϊ 0��', 'cirs', 'Y', 'N', 'EDG_ACT_LBLTY_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('729', 'sql', 'E_ACT_LBLTY_INF', 'OVERD_PRINC', 'CHECK_EDG_OVERDPRINC_AND_OVERDPRINC', 
    '���� D1/D2/R1/R4 �˻�����Ϣ��¼�е�ǰ���ڱ������С�ڵ��ڵ�ǰ�����ܶ�', 'cirs', 'Y', 'N', 'EDG_ACT_LBLTY_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('730', 'sql', 'E_ACT_LBLTY_INF', 'LAT_RPY_PRINC_AMT', 'CHECK_EDG_LATRPYPRINCAMT_AND_LATRPYAMT', 
    '���һ��ʵ�ʹ黹�������С�ڵ������һ��ʵ�ʻ�����', 'cirs', 'Y', 'N', 'EDG_ACT_LBLTY_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('731', 'sql', 'E_ACT_LBLTY_INF', 'TOT_OVERD', 'CHECK_EDG_TOTOVERD_AND_OVERDDY', 
    '���ҽ�����ǰ�����ܶ���� 0����ǰ����������Ϊ 0', 'cirs', 'Y', 'N', 'EDG_ACT_LBLTY_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('732', 'sql', 'E_ACT_LBLTY_INF', 'CLOSE_DATE', 'CHECK_EDG_CLOSEDATE_AND_OTHERDATE', 
    '���˻��ر����ڲ�Ϊ��ʱ�����˻��ر����ڱ��벻����ͬһ����¼����������ҵ������', 'cirs', 'Y', 'N', 'EDG_ACT_LBLTY_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('733', 'sql', 'E_ACT_LBLTY_INF', 'ACCT_STATUS', 'CHECK_EDG_ACCTSTATUS2_AND_NXTAGRRRPYDATE', 
    '���˻�״̬Ϊ2-�ر�ʱ������һ��Լ���������ڱ���Ϊ��', 'cirs', 'Y', 'N', 'EDG_ACT_LBLTY_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('734', 'sql', 'E_ACT_LBLTY_INF', 'NXT_AGRR_RPY_DATE', 'CHECK_EDG_NXTAGRRRPYDATE_AND_OTHERDATE', 
    '����һ��Լ���������ڲ�Ϊ��ʱ�����벻�������仯����,���һ��ʵ�ʻ�������,���һ��Լ����������,�弶�����϶�����', 'cirs', 'Y', 'N', 'EDG_ACT_LBLTY_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('735', 'sql', 'E_ACCT_BS', 'RPT_DATE', 'CHECK_EDA_RPTDATE_AND_NXTAGRRRPYDATE', 
    '��Ϣ��������Ӧ������ͬһ����¼����һ��Լ����������', 'cirs', 'Y', 'N', 'EDA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('736', 'sql', 'E_ACCT_SPEC_TRST', 'CHAN_TRAN_TYPE', 'CHECK_EDH_CHANTRANTYPE_AND_DUETRANMON', 
    '���˻���Ϣ��¼�еĽ�������Ϊ11-չ�ڣ��������ڱ������>0', 'cirs', 'Y', 'N', 'EDH_ACCT_SPEC_TRST_DSPN_SG_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('737', 'sql', 'E_ACCT_SPEC_TRST', 'CHAN_TRAN_TYPE', 'CHECK_EDH_CAGOFTRDNM', 
    '���׸���Ӧ����Ӧ0', 'cirs', 'Y', 'N', 'EDH_ACCT_SPEC_TRST_DSPN_SG_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2027', 'sql', 'I_ACCT_BS', 'RPT_DATE_CODE', 'gr_pb_table_one6', 
    '������ʱ��˵������Ϊ10-�¿���ʱ�����������⣬���ٰ���������Ϣ�Σ����˻�����ΪD1����Ӧ�����¶ȱ�����Ϣ�Ρ����������Ϣ���зִηſ��־���� 0����Ӧ�������Ŷ����Ϣ��', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2028', 'sql', 'I_ACCT_BS_INF', 'GUAR_MODE', 'gr_pb_table_one7', 
    '������ʱ��˵������Ϊ10-�¿�����31-�½����״��ϱ������˻�ʱ����D1/R1/R2/R3/R4 ���˻��Ļ�����Ϣ���е�����ʽΪ3-��֤��5-��ϣ�����֤������Ӧ������ػ��������˶�', 'cirs', 'Y', 'N', 'PBB_ACCT_BS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2029', 'sql', 'I_ACCT_BS_INF', 'FLAG', 'gr_pb_table_one8', 
    '������ʱ��˵������Ϊ10-�¿���,31-�½����״��ϱ������˻�,���������Ϣ���зִηſ��־Ϊ0������Ӧ�������Ŷ����Ϣ��', 'cirs', 'Y', 'N', 'PBB_ACCT_BS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2030', 'sql', 'I_ACCT_BS_INF', 'BUSI_DTL_LINES', 'gr_pb_table_one8', 
    '������ʱ��˵������Ϊ10-�¿���,31-�½����״��ϱ������˻�,30-�¶Ƚ���ʱ�����˻�����ΪR2������Ϣ���еĽ��ҵ������ϸ����82-���ר����ڿ����򻹲�Ӧ�������Ŷ����Ϣ��', 'cirs', 'Y', 'N', 'PBB_ACCT_BS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2031', 'sql', 'I_ACCT_BS', 'RPT_DATE_CODE', 'gr_pb_table_one9', 
    '������ʱ��˵������Ϊ10-�¿���ʱ�����˻�����ΪD1/R1/R3/R4����Ӧ������ʼծȨ˵���Ρ����¶ȱ�����Ϣ�Ρ����⽻��˵���Ρ����ר�������Ϣ��', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2032', 'sql', 'I_ACCT_BS', 'RPT_DATE_CODE', 'gr_pb_table_one9', 
    '10-�¿���,20-�˻��ر�ʱ���˻�����ΪC1����Ӧ�����¶ȱ��ֶΡ����ר�������Ϣ�Ρ�����Ѻ����Ϣ�Ρ����Ŷ����Ϣ��', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2033', 'sql', 'I_ACCT_BS', 'RPT_DATE_CODE', 'gr_pb_table_one9', 
    '������ʱ��˵������Ϊ40-�ջ����ڿ���ʱ�����˻�����ΪD1/R1/R2/R4����Ӧ������ծȨ˵���Ρ����⽻��˵���Ρ�������Ϣ�Ρ���ػ��������˶�', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2034', 'sql', 'I_ACCT_BS', 'RPT_DATE_CODE', 'gr_pb_table_one10', 
    '������ʱ��˵������Ϊ10-�¿���ʱ�����˻�����ΪR2����Ӧ������ʼծȨ˵���Ρ����¶ȱ�����Ϣ�Ρ����⽻��˵����', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2035', 'sql', 'I_ACCT_BS', 'RPT_DATE_CODE', 'gr_pb_table_one10', 
    '������ʱ��˵������Ϊ30-�¶Ƚ���,31-�½����״��ϱ������˻�,32-�½����˻��ر�ʱ�����˻�����ΪD1/R1/R3/R4����Ӧ������ʼծȨ˵���Ρ����¶ȱ�����Ϣ�Ρ����ר�������Ϣ��', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2036', 'sql', 'I_ACCT_BS', 'RPT_DATE_CODE', 'gr_pb_table_one11', 
    '������ʱ��˵������Ϊ31-�½����״��ϱ������˻�,20-�˻��ر�,32-�½����˻��ر�,���˻�����ΪR2����Ӧ������ʼծȨ˵���Ρ����¶ȱ�����Ϣ��', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2037', 'sql', 'I_ACCT_BS', 'RPT_DATE_CODE', 'gr_pb_table_one12', 
    '������ʱ��˵������Ϊ40-�ջ����ڿ���ʱ����Ӧ�����¶ȱ�����Ϣ�Ρ����ר�������Ϣ�Ρ�����Ѻ����Ϣ�Ρ����Ŷ����Ϣ��', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2038', 'sql', 'I_ACCT_BS_INF', 'REPAY_MODE', 'gr_jd_is_one1', 
    '�������ʽ��Ϊ��90-���ܱ��ͣ������ֻ��ʽ�����򡰻���Ƶ�ʡ�Ϊ��03-�¡�', 'cirs', 'Y', 'N', 'PBB_ACCT_BS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2039', 'sql', 'I_ACCT_BS_INF', 'REPAY_MODE', 'gr_jd_is_one2', 
    '�������ʽ�������ԡ�2����ͷ���򡰻�������������Ϊ 0��', 'cirs', 'Y', 'N', 'PBB_ACCT_BS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2040', 'sql', 'I_ACCT_BS_INF', 'OPEN_DATE', 'gr_jd_is_one3', 
    '���������ڡ�Ӧ�����ڡ��������ڡ�', 'cirs', 'Y', 'N', 'PBB_ACCT_BS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2041', 'sql', 'I_LOAN_RLT_REPYMT_INF', 'ARLP_TYPE', 'gr_jd_is_one4', 
    '�����������������͡�Ϊ��2-��֤�ˡ����򡰻������ν�����Ϊ��ֵ', 'cirs', 'Y', 'N', 'PBC_RLT_REPYMT_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('3', 'sql', 'E_BS', 'ENT_CERT_TYPE', 'Enterprise_identity_type', 
    '��ҵ������Ϣ��¼��������ҵ��ݱ�ʶ����˳��У��', 'cirs', 'Y', 'N', 'EAA_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('4', 'sql', 'E_BS', 'RPT_DATE_CODE', 'New_customer_verification_three_tables', 
    '��ֵΪ��10-�����ͻ�����/�״��ϱ���ʱ����ҵ������Ϣ�������뱨�ͻ����Ρ������ſ��Ρ���Ҫ�����Ա�Ρ���ϵ��ʽ��', 'cirs', 'Y', 'N', 'EAA_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('1', 'sql', 'E_BS', 'ENT_NAME', 'Length_range', 
    '��ҵ���Ƴ���У��', 'cirs', 'Y', 'N', 'EAA_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('5', 'sql', 'E_BS', 'ORG_TYPE', 'New_customer_verification_two_tables', 
    '��ֵΪ��10-�����ͻ�����/�״��ϱ���ʱ,������ҵ����ҵ��λ��������壨������֯�ķ�֧�������⣩����Ҫ����ע���ʱ�����Ҫ�����˶�', 'cirs', 'Y', 'N', 'EAA_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('6', 'sql', 'E_BS', 'ORG_TYPE', 'OrgType_for_value', 
    '��֯��������Ϊ��������ʱ��ע���ʱ�����Ҫ�����˶β��ܳ���', 'cirs', 'Y', 'N', 'EAA_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('7', 'sql', 'E_FCS_INF', 'NATIONALITY', 'Reg_Add_is_Null', 
    '���������ΪCHNʱ���Ǽǵ�ַ����Ϊ��', 'cirs', 'Y', 'N', 'EAC_FCS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('8', 'sql', 'E_FCS_INF', 'NATIONALITY', 'Reg_Add_not_Null', 
    '��������벻ΪCHNʱ���Ǽǵ�ַͳһΪ��', 'cirs', 'Y', 'N', 'EAC_FCS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('9', 'sql', 'E_FCS_INF', 'FCS_INFO_UP_DATE', 'Date_Check', 
    '�����ſ���Ϣ���г�������Ҫ��������Ϣ��������', 'cirs', 'Y', 'N', 'EAC_FCS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('10', 'sql', 'E_MN_SHA_HOD_INF', 'INV_RATIO', 'Between_Two_Numbers', 
    'ע���ʱ�����Ҫ�����˶��еĳ��ʱ������� 0�� С�ڻ���� 100', 'cirs', 'Y', 'N', 'EAE_MN_SHA_HOD_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('11', 'sql', 'E_MN_SHA_HOD_INF', 'SHAR_HOD_CERT_TYPE', 'Identity_Matching', 
    '������������Ҫ���������ݱ�ʶ����ƥ��', 'cirs', 'Y', 'N', 'EAE_MN_SHA_HOD_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('12', 'sql', 'E_BS', 'ENT_CERT_NUM', 'Length_range', 
    '��ҵ��ݱ�ʶ���볤��У��', 'cirs', 'Y', 'N', 'EAA_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('13', 'sql', 'E_BS', 'INF_SURC_CODE', 'Length_range', 
    '��Ϣ��Դ���볤��У��', 'cirs', 'Y', 'N', 'EAA_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('14', 'sql', 'E_BS', 'CIMOC', 'Length_range', 
    '�ͻ�����ά���������볤��У��', 'cirs', 'Y', 'N', 'EAA_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('15', 'sql', 'E_ID', 'OTH_ENT_CERT_NUM', 'Length_range', 
    '������ʶ��Ϣ����ҵ��ݱ�ʶ���볤��У��', 'cirs', 'Y', 'N', 'EAB_ID_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('16', 'sql', 'E_FCS_INF', 'REG_ADD', 'Length_range', 
    '�����ſ���Ϣ�Ǽǵ�ַ����У��', 'cirs', 'Y', 'N', 'EAC_FCS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('17', 'sql', 'E_FCS_INF', 'BIZ_RANGE', 'Length_range', 
    '�����ſ���Ϣҵ��Χ����У��', 'cirs', 'Y', 'N', 'EAC_FCS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('18', 'sql', 'E_MN_MMB_INF', 'MMB_ALIAS', 'Length_range', 
    '��Ҫ�����Ա��������У��', 'cirs', 'Y', 'N', 'EAD_MN_MMB_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('19', 'sql', 'E_MN_MMB_INF', 'MMB_ID_NUM', 'Length_range', 
    '��Ҫ�����Ա֤�����볤��У��', 'cirs', 'Y', 'N', 'EAD_MN_MMB_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('20', 'sql', 'E_MN_SHA_HOD_INF', 'REG_CAP', 'Length_range', 
    'ע���ʱ�', 'cirs', 'Y', 'N', 'EAE_MN_SHA_HOD_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('21', 'sql', 'E_MN_SHA_HOD_INF', 'SHAR_HOD_NAME', 'Length_range', 
    '����������', 'cirs', 'Y', 'N', 'EAE_MN_SHA_HOD_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('22', 'sql', 'E_MN_SHA_HOD_INF', 'SHAR_HOD_ID_NUM', 'Length_range', 
    '��������ݱ�ʶ����', 'cirs', 'Y', 'N', 'EAE_MN_SHA_HOD_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('23', 'sql', 'E_BS_INF_DLT', 'INF_SURC_CODE', 'SAN_BIAO_is_null', 
    '����+��Ϣ��Դ��������ڿ��д���', 'cirs', 'Y', 'N', 'EAZ_EN_BS_INF_DLT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('24', 'sql', 'E_BS_INF_DLT', 'ENT_NAME', 'SAN_BIAO_is_null', 
    '����+��Ϣ��Դ��������ڿ��д��ڡ�', 'cirs', 'Y', 'N', 'EAZ_EN_BS_INF_DLT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('25', 'sql', 'E_BS_INF_DLT', 'ENT_CERT_TYPE', 'SAN_BIAO_is_null', 
    '����+��Ϣ��Դ��������ڿ��д��ڡ�', 'cirs', 'Y', 'N', 'EAZ_EN_BS_INF_DLT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('26', 'sql', 'E_BS_INF_DLT', 'ENT_CERT_NUM', 'SAN_BIAO_is_null', 
    '����+��Ϣ��Դ��������ڿ��д��ڡ�', 'cirs', 'Y', 'N', 'EAZ_EN_BS_INF_DLT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('27', 'sql', 'E_ACCT_INF_ENT_DEL', 'DEL_REC_CODE', 'DEL_REC_CODE_is_null', 
    '����˻���ɾ����ҵ���ʶ������ڿ��д���', 'cirs', 'Y', 'N', 'EDZ_EN_ACCT_INF_ENT_DEL_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('28', 'sql', 'E_ACCT_INF_ID_CAGS_INF', 'NW_BNES_CODE', 'NW_BNES_CODE_not_repeat', 
    '���ԭҵ���ʶ�����ҵ���ʶ�벻����ͬ', 'cirs', 'Y', 'N', 'EDW_EN_ACCT_INF_ID_CAGS_INF_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('29', 'sql', 'E_SEC_ACCT_ENT_DEL', 'DEL_REC_CODE', 'DEL_REC_CODE_is_null', 
    '�����˻���ɾ����ҵ���ʶ������ڿ��д���', 'cirs', 'Y', 'N', 'EEZ_EN_SEC_ACCT_ENT_DEL_SG_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('30', 'sql', 'E_CTRCT_INF_ENT_DEL', 'DEL_REC_CODE', 'DEL_REC_CODE_is_null', 
    '����Э���ɾ����ҵ���ʶ������ڿ��д���', 'cirs', 'Y', 'N', 'EGZ_EN_CTRCT_INF_ENT_DEL_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('31', 'sql', 'MOC_ENT_DEL', 'DEL_REC_CODE', 'DEL_REC_CODE_is_null', 
    '����Ѻ��ɾ����ҵ���ʶ������ڿ��д���', 'cirs', 'Y', 'N', 'EFZ_MOC_ENT_DEL_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('32', 'sql', 'E_ACCT_INF_ID_CAGS_INF', 'OD_BNES_CODE', 'OD_BNES_CODE_is_not_null', 
    '���ԭ��ҵ���ʶ������ǿ�������������ʹ�õ�', 'cirs', 'Y', 'N', 'EDW_EN_ACCT_INF_ID_CAGS_INF_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('33', 'sql', 'E_ACCT_INF_ID_CAGS_INF', 'NW_BNES_CODE', 'NW_BNES_CODE_is_null', 
    '������˻���ʶ�������ݿ��б��벻���ڣ������ڿ��д��ڵ������Ǹ��˻�֮ǰʹ�ù��ı�ʶ', 'cirs', 'Y', 'N', 'EDW_EN_ACCT_INF_ID_CAGS_INF_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('34', 'sql', 'E_BALANCE_SHEET_DLT', 'ENT_CERT_NUM', 'ent_zichengfuzhai_del_not_null', 
    '��ҵ��ݱ�ʶ����+��ҵ��ݱ�ʶ����+�������+��������+��������ϸ��+�����ṩ��������������ڿ��д���', 'cirs', 'Y', 'N', 'EMZ_BALANCE_SHEET_DLT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('35', 'sql', 'E_SEC_ACCT_ID_CAGS_INF', 'NW_BNES_CODE', 'NW_BNES_CODE_not_repeat', 
    '����ԭҵ���ʶ�����ҵ���ʶ�벻����ͬ', 'cirs', 'Y', 'N', 'EEW_EN_SEC_ACCT_ID_CAGS_INF_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('36', 'sql', 'E_CR_ACCT_ID_CAGS_INF', 'NW_BNES_CODE', 'NW_BNES_CODE_not_repeat', 
    '����ԭҵ���ʶ�����ҵ���ʶ�벻����ͬ', 'cirs', 'Y', 'N', 'EGW_EN_ACCT_INF_ID_CAGS_INF_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('37', 'sql', 'MOC_ID_CAGS_INF', 'NW_BNES_CODE', 'NW_BNES_CODE_not_repeat', 
    '����Ѻԭҵ���ʶ�����ҵ���ʶ�벻����ͬ', 'cirs', 'Y', 'N', 'EFW_MOC_ID_CAGS_INF_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('38', 'sql', 'E_SEC_ACCT_ID_CAGS_INF', 'OD_BNES_CODE', 'OD_BNES_CODE_is_not_null', 
    '����ԭ��ҵ���ʶ������ǿ�������������ʹ�õ�', 'cirs', 'Y', 'N', 'EEW_EN_SEC_ACCT_ID_CAGS_INF_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('39', 'sql', 'E_CR_ACCT_ID_CAGS_INF', 'OD_BNES_CODE', 'OD_BNES_CODE_is_not_null', 
    '����ԭ��ҵ���ʶ������ǿ�������������ʹ�õ�', 'cirs', 'Y', 'N', 'EGW_EN_ACCT_INF_ID_CAGS_INF_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('40', 'sql', 'MOC_ID_CAGS_INF', 'OD_BNES_CODE', 'OD_BNES_CODE_is_not_null', 
    '����Ѻԭ��ҵ���ʶ������ǿ�������������ʹ�õ�', 'cirs', 'Y', 'N', 'EFW_MOC_ID_CAGS_INF_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('41', 'sql', 'E_SEC_ACCT_ID_CAGS_INF', 'NW_BNES_CODE', 'NW_BNES_CODE_is_null', 
    '�������˻���ʶ�������ݿ��б��벻���ڣ������ڿ��д��ڵ������Ǹ��˻�֮ǰʹ�ù��ı�ʶ', 'cirs', 'Y', 'N', 'EEW_EN_SEC_ACCT_ID_CAGS_INF_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('42', 'sql', 'E_CR_ACCT_ID_CAGS_INF', 'NW_BNES_CODE', 'NW_BNES_CODE_is_null', 
    '�������˻���ʶ�������ݿ��б��벻���ڣ������ڿ��д��ڵ������Ǹ��˻�֮ǰʹ�ù��ı�ʶ', 'cirs', 'Y', 'N', 'EGW_EN_ACCT_INF_ID_CAGS_INF_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('43', 'sql', 'MOC_ID_CAGS_INF', 'NW_BNES_CODE', 'NW_BNES_CODE_is_null', 
    '����Ѻ���˻���ʶ�������ݿ��б��벻���ڣ������ڿ��д��ڵ������Ǹ��˻�֮ǰʹ�ù��ı�ʶ', 'cirs', 'Y', 'N', 'EFW_MOC_ID_CAGS_INF_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('44', 'sql', 'E_ACCT_BS', 'ACCT_CODE', 'ACCT_CODE_is_not_null', 
    '���������ҵ���ʶ������ڿ��д���', 'cirs', 'Y', 'N', 'EDA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('47', 'sql', 'E_ACCT_BS', 'RPT_DATE', 'RPT_DATE_is_repeat', 
    '�������������ʱ�������ĸ��������¼����Ϣ��������Ӧ���ڿ�����Ӧ��Ϣ�����µ���Ϣ��������', 'cirs', 'Y', 'N', 'EDA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2042', 'sql', 'I_LOAN_RLT_REPYMT_INF', 'ARLP_TYPE', 'gr_jd_is_one5', 
    '�����������������͡�Ϊ��2-��֤�ˡ�ʱ����������־��������֤��ͬ��š���ӦΪ��', 'cirs', 'Y', 'N', 'PBC_RLT_REPYMT_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2043', 'sql', 'I_AMBLG_INF', 'RPY_STATUS', 'gr_jd_is_one6', 
    '���� R2 �˻�������ǰ����״̬��Ϊ��*-����δʹ�ö���Ҳ���Ҫ���ʱ����ʵ�ʻ��������ӦΪ��ֵ', 'cirs', 'Y', 'N', 'PBG_AMBLG_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2044', 'sql', 'I_AMBLG_INF', 'SETT_DATE', 'gr_jd_is_one7', 
    '������/Ӧ�����ա��롰�·ݡ��е��ꡢ�±��뱣��һ��', 'cirs', 'Y', 'N', 'PBG_AMBLG_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2045', 'sql', 'I_AMBLG_INF', 'ACCT_STATUS', 'gr_jd_is_one8', 
    '���˻���Ϣ��¼�еġ��˻�״̬��Ϊ��41-���ˣ���������϶����򣬵ȴ���������/��51-���ˣ���������϶����򣬵ȴ�������������42-���ˣ��Ѻ�������/��52-���ˣ��Ѻ�������ʱ������ǰ�����ܶ����Ϊ 0', 'cirs', 'Y', 'N', 'PBG_AMBLG_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2046', 'sql', 'I_AMBLG_INF', 'ACCT_STATUS', 'gr_jd_is_one9', 
    '�����˻�״̬��Ϊ��6-δ���ʱ������������ǰ����������������ǰ�����ܶ����Ϊ 0������ǰ����״̬������Ϊ��*���������˻�û�������������У����������', 'cirs', 'Y', 'N', 'PBG_AMBLG_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2047', 'sql', 'I_AMBLG_INF', 'RPY_STATUS', 'gr_jd_is_one22', 
    '������ǰ����״̬��Ϊ��*�����򡰱���Ӧ�����������ǰ����������������ǰ�����ܶ���������˵�������Ϊ 0�������˻�û�������������У��������', 'cirs', 'Y', 'N', 'PBG_AMBLG_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2048', 'sql', 'I_AMBLG_INF', 'RPY_STATUS', 'gr_jd_is_one10', 
    '������ǰ����״̬��Ϊ��N����M�����򡰵�ǰ����������������ǰ�����ܶ����Ϊ0�������˻�û�������������У��������', 'cirs', 'Y', 'N', 'PBG_AMBLG_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2049', 'sql', 'I_ACCT_DBT_INF', 'NOMONTH_RPY_STATUS', 'gr_jd_is_one10', 
    '������ǰ����״̬��Ϊ��N����M�����򡰵�ǰ����������������ǰ�����ܶ����Ϊ0', 'cirs', 'Y', 'N', 'PBI_ACCT_DBT_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2050', 'sql', 'I_AMBLG_INF', 'RPY_STATUS', 'gr_jd_is_one11', 
    '������ǰ����״̬��Ϊ���֡�1-7�����򡰵�ǰ����������������ǰ�����ܶ�������0', 'cirs', 'Y', 'N', 'PBG_AMBLG_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2051', 'sql', 'I_AMBLG_INF', 'OVERD_PRINC', 'gr_jd_is_one12', 
    '���� D1/R1/R4 �˻�����Ϣ��¼�С���ǰ���ڱ��𡱱���С�ڵ��ڡ���ǰ�����ܶ�', 'cirs', 'Y', 'N', 'PBG_AMBLG_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('54', 'sql', 'E_CTRCT_INF_DEL', 'DEL_REC_CODE', 'DEL_REC_CODE_is_null', 
    '����Э���ɾ����ҵ���ʶ������ڿ��д���', 'cirs', 'Y', 'N', 'EGY_EN_CTRCT_INF_DEL_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('55', 'sql', 'E_CTRCT_INF_DEL', 'DEL_START_DATE', 'ST_AND_ET_IS_NOT_NULL', 
    '����Э���ɾ����ʼ����,��ɾ������ֹ���ڲ���ͬʱΪ��ֵ', 'cirs', 'Y', 'N', 'EGY_EN_CTRCT_INF_DEL_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('56', 'sql', 'E_CTRCT_INF_DEL', 'DEL_END_DATE', 'ED_No_greater_than_SD', 
    '���Ŵ�ɾ����ʼ���ڱ���С�ڵ��ڴ�ɾ���Ľ�������', 'cirs', 'Y', 'N', 'EGY_EN_CTRCT_INF_DEL_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('57', 'sql', 'E_SEC_ACCT_DEL', 'DEL_REC_CODE', 'DEL_REC_CODE_is_null', 
    '����������ҵ���ʶ������ڿ��д���', 'cirs', 'Y', 'N', 'EEY_EN_SEC_ACCT_DEL_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('58', 'sql', 'E_SEC_ACCT_DEL', 'DEL_START_DATE', 'ST_AND_ET_IS_NOT_NULL', 
    '������ɾ����ʼ����,��ɾ������ֹ���ڲ���ͬʱΪ��ֵ', 'cirs', 'Y', 'N', 'EEY_EN_SEC_ACCT_DEL_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('59', 'sql', 'E_SEC_ACCT_DEL', 'DEL_END_DATE', 'ED_No_greater_than_SD', 
    '������ɾ����ʼ���ڱ���С�ڵ��ڴ�ɾ���Ľ�������', 'cirs', 'Y', 'N', 'EEY_EN_SEC_ACCT_DEL_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('60', 'sql', 'E_ACCT_INF_DEL', 'DEL_REC_CODE', 'DEL_REC_CODE_is_null', 
    '���������ҵ���ʶ������ڿ��д���', 'cirs', 'Y', 'N', 'EDY_EN_ACCT_INF_DEL_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('61', 'sql', 'E_ACCT_INF_DEL', 'DEL_START_DATE', 'ST_AND_ET_IS_NOT_NULL', 
    '�����ɾ����ʼ����,��ɾ������ֹ���ڲ���ͬʱΪ��ֵ', 'cirs', 'Y', 'N', 'EDY_EN_ACCT_INF_DEL_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('62', 'sql', 'E_ACCT_INF_DEL', 'DEL_END_DATE', 'ED_No_greater_than_SD', 
    '�����ɾ����ʼ���ڱ���С�ڵ��ڴ�ɾ���Ľ�������', 'cirs', 'Y', 'N', 'EDY_EN_ACCT_INF_DEL_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('63', 'sql', 'E_ICDN_RLTP_INF', 'ASSO_ENT_CERT_NUM', 'Two_standard_not_repeat', 
    '������ҵ��ݱ�ʶ������ҵ��ݱ�ʶ���벻����ȫ��ͬ', 'cirs', 'Y', 'N', 'ECA_EN_ICDN_RLTP_INF_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('64', 'sql', 'E_INCOME_EXPENSE_BS', 'SHEET_TYPE', 'SHEET_TYPE_is_ten', 
    '�������ͱ�����д10', 'cirs', 'Y', 'N', 'ELA_INCOME_AND_EXPENSE_STAT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('770', 'sql', 'I_ACCT_BS', 'RPT_DATE', 'CHECK_MDFCSGMTCODEC_RPTDATE', 
    '��Ϣ��������Ӧ�����ڿ����������Ϣ��������', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('771', 'sql', 'I_ACCT_BS', 'RPT_DATE', 'CHECK_MDFCSGMTCODEC_RPTDATE', 
    '��Ϣ��������Ӧ�����ڿ����������Ϣ��������', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('773', 'sql', 'I_ACCT_DBT_INF', 'NOMONTH_ACCT_STATUS', 'CHECK_PBI_NOMONTHACCTSTATUS', 
    '���� C1 �˻����������¶ȱ�����Ϣ��ʱ�������д�����Ϣ�������ڸ���ķ��¶ȱ�����Ϣ�Σ�����������¼���˻�״̬����Ϊ��������', 'cirs', 'Y', 'N', 'PBI_ACCT_DBT_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('774', 'sql', 'I_CTRCT_BS', 'RPT_DATE', 'CHECK_MDFCSGMTCODEC_RPTDATE', 
    '��Ϣ��������Ӧ�����ڿ����������Ϣ��������', 'cirs', 'Y', 'N', 'PCA_CTRCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('775', 'sql', 'I_AMBLG_INF', 'ACCT_STATUS', 'CHECK_PBG_ACCTSTATUS_RPTDATE', 
    '�����¶ȱ�����Ϣ��ʱ�������д�����Ϣ�������ڸ�����¶ȱ��֣�����������¼���˻�״̬����Ϊ���رա�/��������', 'cirs', 'Y', 'N', 'PBG_AMBLG_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('776', 'sql', 'I_CREDIT_LIM', 'CON_STATUS', 'CHECK_PCC_ACCTSTATUS_RPTDATE', 
    '���������Ϣ��ʱ�������д�����Ϣ�������ڸ���Ķ����Ϣ�Σ�����������¼�ж��״̬����Ϊ������/ʧЧ��', 'cirs', 'Y', 'N', 'PCC_CREDIT_LIM_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('778', 'sql', 'I_GUAR_ACCT_BS', 'MDFC_SGMT_CODE', 'CHECK_PBA_MDFCSGMTCODE', 
    '�������Ķκʹ������Ķα�Ӧ����һ��', 'cirs', 'Y', 'N', 'PDA_GUAR_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('113', 'sql', 'E_MOTGA_CLTAL_CTRCT_INF', 'CCC', 'mingxiduan_is_null_01', 
    '����ʱ��˵������Ϊ10-�¿���/�״α���,20-�˻��ر�,32-Լ�������ս���,33-ʵ�ʻ���,41-�弶�������,49-�������������˻�����ΪD2,C1��Ӧ��������Ѻ����Ϣ��', 'cirs', 'Y', 'N', 'EDD_MOTGA_CLTAL_CTRCT_INF_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('114', 'sql', 'E_ACCT_CRED', 'MCC', 'mingxiduan_is_null_01', 
    '����ʱ��˵������Ϊ10-�¿���/�״α���,20-�˻��ر�,32-Լ�������ս���,33-ʵ�ʻ���,41-�弶�������,49-�������������˻�����ΪD2��Ӧ�������Ŷ����Ϣ��', 'cirs', 'Y', 'N', 'EDE_ACCT_CRED_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('115', 'sql', 'E_MOTGA_CLTAL_CTRCT_INF', 'CCC', 'mingxiduan_is_null_01', 
    '����ʱ��˵������Ϊ10-�¿���/�״α���,20-�˻��ر�,33-ʵ�ʻ���,41-�弶�������,49-�������������˻�����ΪC1��Ӧ��������Ѻ����Ϣ��', 'cirs', 'Y', 'N', 'EDD_MOTGA_CLTAL_CTRCT_INF_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('116', 'sql', 'E_ACCT_CRED', 'MCC', 'mingxiduan_is_null_01', 
    '����ʱ��˵������Ϊ10-�¿���/�״α���,20-�˻��ر�,33-ʵ�ʻ���,41-�弶�������,49-�������������˻�����ΪC1��Ӧ�������Ŷ����Ϣ��', 'cirs', 'Y', 'N', 'EDE_ACCT_CRED_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('117', 'sql', 'E_ORIG_CREDITOR_INF  ', 'INIT_CRED_NAME', 'mingxiduan_is_null_01', 
    '����ʱ��˵������Ϊ20-�˻��ر�,33-ʵ�ʻ���,41-�弶�������,49-�������������˻�����ΪC1��Ӧ������ʼծȨ˵����', 'cirs', 'Y', 'N', 'EDF_ORIG_CREDITOR_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('119', 'sql', 'E_ACCT_CRED', 'MCC', 'mingxiduan_is_null_02', 
    '����ʱ��˵������Ϊ10-�¿���/�״α���,20-�˻��ر�,32-Լ�������ս���,33-ʵ�ʻ���,41-�弶�������,42-չ�ڷ���,49-�����������˻�����ΪD1�ҷִηſ��ʶΪ0����Ӧ�������Ŷ����Ϣ��', 'cirs', 'Y', 'N', 'EDE_ACCT_CRED_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('120', 'sql', 'E_ORIG_CREDITOR_INF  ', 'INIT_CRED_NAME', 'mingxiduan_is_null_02', 
    '����ʱ��˵������Ϊ31-������ſ��˻�����ΪD1�ҷִηſ��ʶΪ2����Ӧ������ʼծȨ˵����', 'cirs', 'Y', 'N', 'EDF_ORIG_CREDITOR_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('121', 'sql', 'E_ACCT_BS_INF', 'FLAG', 'mingxiduan_is_not_null_06', 
    '�˻�����ΪD1���ִηſ��ʶΪ0��1������31-������ſ�', 'cirs', 'Y', 'N', 'EDB_ACCT_BS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('122', 'sql', 'I_IN_ACCT_ENT_DEL', 'DEL_REC_CODE', 'DEL_REC_CODE_is_null', 
    '���ڸ��˽���˻�����ɾ�������¼����ɾ��ҵ���ʶ������ڿ��д���', 'cirs', 'Y', 'N', 'PBZ_IN_ACCT_ENT_DEL_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('118', 'sql', 'E_RLT_REPYMT_INF', 'ARLP_NAME', 'mingxiduan_is_null_01', 
    '����ʱ��˵������Ϊ20-�˻��ر�,33-ʵ�ʻ���,41-�弶�������,49-�������������˻�����ΪC1��Ӧ������ػ��������˶�', 'cirs', 'Y', 'N', 'EDC_RLT_REPYMT_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('123', 'sql', 'I_IN_CTRCT_ENT_DEL', 'DEL_REC_CODE', 'DEL_REC_CODE_is_null', 
    '���ڸ�������Э������ɾ�������¼����ɾ��ҵ���ʶ������ڿ��д���', 'cirs', 'Y', 'N', 'PCZ_IN_CTRCT_ENT_DEL_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('124', 'sql', 'I_IN_SEC_ACCT_ENT_DEL', 'DEL_REC_CODE', 'DEL_REC_CODE_is_null', 
    '���ڸ��˵����˻�����ɾ�������¼����ɾ��ҵ���ʶ������ڿ��д���', 'cirs', 'Y', 'N', 'PDZ_IN_SEC_ACCT_ENT_DEL_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('125', 'sql', 'I_IN_ACCT_ID_CAGS_INF', 'NW_BNES_CODE', 'NW_BNES_CODE_not_repeat', 
    '���˽����ʶ���ԭҵ���ʶ�����ҵ���ʶ�벻����ͬ', 'cirs', 'Y', 'N', 'PBW_IN_ACCT_ID_CAGS_INF_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('126', 'sql', 'I_IN_CTRCTID_CAGS_INF', 'NW_BNES_CODE', 'NW_BNES_CODE_not_repeat', 
    '�������ű�ʶ���ԭҵ���ʶ�����ҵ���ʶ�벻����ͬ', 'cirs', 'Y', 'N', 'PCW_IN_CTRCTID_CAGS_INF_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('127', 'sql', 'I_INSECACCTID_CAGSINF', 'NW_BNES_CODE', 'NW_BNES_CODE_not_repeat', 
    '���˵�����ʶ���ԭҵ���ʶ�����ҵ���ʶ�벻����ͬ', 'cirs', 'Y', 'N', 'PDW_INSECACCTID_CAGSINF_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('128', 'sql', 'I_IN_ACCT_ID_CAGS_INF', 'OD_BNES_CODE', 'OD_BNES_CODE_is_not_null_02', 
    '���˽����ʶ���ԭҵ���ʶ������ǿ�������������ʹ�õ�', 'cirs', 'Y', 'N', 'PBW_IN_ACCT_ID_CAGS_INF_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('129', 'sql', 'I_IN_ACCT_ID_CAGS_INF', 'NW_BNES_CODE', 'NW_BNES_CODE_is_null_02', 
    '���˽����ʶ������˻���ʶ�������ݿ��б��벻���ڣ������ڿ��д��ڵ������Ǹ��˻�֮ǰʹ�ù��ı�ʶ', 'cirs', 'Y', 'N', 'PBW_IN_ACCT_ID_CAGS_INF_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('130', 'sql', 'I_INSECACCTID_CAGSINF', 'OD_BNES_CODE', 'OD_BNES_CODE_is_not_null', 
    '���˵�����ʶ���ԭҵ���ʶ������ǿ�������������ʹ�õ�', 'cirs', 'Y', 'N', 'PDW_INSECACCTID_CAGSINF_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('131', 'sql', 'I_INSECACCTID_CAGSINF', 'NW_BNES_CODE', 'NW_BNES_CODE_is_null', 
    '���˵�����ʶ������˻���ʶ�������ݿ��б��벻���ڣ������ڿ��д��ڵ������Ǹ��˻�֮ǰʹ�ù��ı�ʶ', 'cirs', 'Y', 'N', 'PDW_INSECACCTID_CAGSINF_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('132', 'sql', 'I_IN_CTRCTID_CAGS_INF', 'OD_BNES_CODE', 'OD_BNES_CODE_is_not_null', 
    '�������ű�ʶ���ԭҵ���ʶ������ǿ�������������ʹ�õ�', 'cirs', 'Y', 'N', 'PCW_IN_CTRCTID_CAGS_INF_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('133', 'sql', 'I_IN_CTRCTID_CAGS_INF', 'NW_BNES_CODE', 'NW_BNES_CODE_is_null', 
    '�������ű�ʶ������˻���ʶ�������ݿ��б��벻���ڣ������ڿ��д��ڵ������Ǹ��˻�֮ǰʹ�ù��ı�ʶ', 'cirs', 'Y', 'N', 'PCW_IN_CTRCTID_CAGS_INF_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('134', 'sql', 'I_IN_BS_INF_DLT', 'NAME', 'SAN_BIAO_is_null_02', 
    '���˻�����Ϣ����ɾ������+��Ϣ��Դ��������ڿ��д���', 'cirs', 'Y', 'N', 'PAY_IN_BS_INF_DLT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('135', 'sql', 'I_IN_BS_INF_DLT', 'ID_TYPE', 'SAN_BIAO_is_null_02', 
    '���˻�����Ϣ����ɾ������+��Ϣ��Դ��������ڿ��д���', 'cirs', 'Y', 'N', 'PAY_IN_BS_INF_DLT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('136', 'sql', 'I_IN_BS_INF_DLT', 'ID_NUM', 'SAN_BIAO_is_null_02', 
    '���˻�����Ϣ����ɾ������+��Ϣ��Դ��������ڿ��д���', 'cirs', 'Y', 'N', 'PAY_IN_BS_INF_DLT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('137', 'sql', 'I_IN_BS_INF_DLT', 'INF_SURC_CODE', 'SAN_BIAO_is_null_02', 
    '���˻�����Ϣ����ɾ������+��Ϣ��Դ��������ڿ��д���', 'cirs', 'Y', 'N', 'PAY_IN_BS_INF_DLT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('138', 'sql', 'I_IN_ID_EFCT_INF_DLT', 'NAME', 'SAN_BIAO_is_null_03', 
    '���˻�����Ϣ����ɾ������+��Ϣ��Դ��������ڿ��д���', 'cirs', 'Y', 'N', 'PAZ_IN_ID_EFCT_INF_DLT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('139', 'sql', 'I_IN_ID_EFCT_INF_DLT', 'ID_TYPE', 'SAN_BIAO_is_null_03', 
    '���˻�����Ϣ����ɾ������+��Ϣ��Դ��������ڿ��д���', 'cirs', 'Y', 'N', 'PAZ_IN_ID_EFCT_INF_DLT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('140', 'sql', 'I_IN_ID_EFCT_INF_DLT', 'ID_NUM', 'SAN_BIAO_is_null_03', 
    '���˻�����Ϣ����ɾ������+��Ϣ��Դ��������ڿ��д���', 'cirs', 'Y', 'N', 'PAZ_IN_ID_EFCT_INF_DLT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('141', 'sql', 'I_IN_ID_EFCT_INF_DLT', 'INF_SURC_CODE', 'SAN_BIAO_is_null_03', 
    '���˻�����Ϣ����ɾ������+��Ϣ��Դ��������ڿ��д���', 'cirs', 'Y', 'N', 'PAZ_IN_ID_EFCT_INF_DLT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('142', 'sql', 'I_IN_CTRCT_DEL', 'DEL_REC_CODE', 'DEL_REC_CODE_is_null', 
    '��������Э���ɾ����ҵ���ʶ������ڿ��д���', 'cirs', 'Y', 'N', 'PCY_IN_CTRCT_DEL_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('143', 'sql', 'I_IN_CTRCT_DEL', 'DEL_START_DATE', 'ST_AND_ET_IS_NOT_NULL', 
    '�������Ŵ�ɾ����ʼ����,��ɾ������ֹ���ڲ���ͬʱΪ��ֵ', 'cirs', 'Y', 'N', 'PCY_IN_CTRCT_DEL_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('144', 'sql', 'I_IN_CTRCT_DEL', 'DEL_END_DATE', 'ED_No_greater_than_SD', 
    '�������Ŵ�ɾ����ʼ���ڱ���С�ڵ��ڴ�ɾ���Ľ�������', 'cirs', 'Y', 'N', 'PCY_IN_CTRCT_DEL_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('145', 'sql', 'I_IN_SEC_ACCT_DEL', 'DEL_REC_CODE', 'DEL_REC_CODE_is_null', 
    '���˵�����ɾ����ҵ���ʶ������ڿ��д���', 'cirs', 'Y', 'N', 'PDY_IN_SEC_ACCT_DEL_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('146', 'sql', 'I_IN_SEC_ACCT_DEL', 'DEL_START_DATE', 'ST_AND_ET_IS_NOT_NULL', 
    '���˵�����ɾ����ʼ����,��ɾ������ֹ���ڲ���ͬʱΪ��ֵ', 'cirs', 'Y', 'N', 'PDY_IN_SEC_ACCT_DEL_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('147', 'sql', 'I_IN_SEC_ACCT_DEL', 'DEL_END_DATE', 'ED_No_greater_than_SD', 
    '���˵�����ɾ����ʼ���ڱ���С�ڵ��ڴ�ɾ���Ľ�������', 'cirs', 'Y', 'N', 'PDY_IN_SEC_ACCT_DEL_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('148', 'sql', 'I_IN_ACCT_DEL', 'DEL_REC_CODE', 'DEL_REC_CODE_is_null', 
    '���˽����ɾ����ҵ���ʶ������ڿ��д���', 'cirs', 'Y', 'N', 'PBY_IN_ACCT_DEL_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('701', 'sql', 'E_GUAR_ACCT_BS', 'RPT_DATE_CODE', 'EEA_RPTDATECODEIS10_EEBANDEEF_NOTNULL', 
    '������ʱ��˵�����롱Ϊ��10-�¿���/�״��ϱ���ʱ������Ӧ����������Ϣ�Ρ��ڱ�������Ϣ��', 'cirs', 'Y', 'N', 'EEA_GUAR_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('702', 'sql', 'E_GUAR_ACCT_BS', 'RPT_DATE_CODE', 'EEA_RPTDATECODEIS_EEF_NOTNULL', 
    '������ʱ��˵�����롱Ϊ��20-�˻��رա�ʱ�����ٰ����ڱ�������Ϣ�Ρ�', 'cirs', 'Y', 'N', 'EEA_GUAR_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('703', 'sql', 'E_GUAR_ACCT_BS', 'RPT_DATE_CODE', 'EEA_RPTDATECODEIS_EEF_NOTNULL', 
    '������ʱ��˵�����롱Ϊ��30-�ڱ����α仯��ʱ�����ٰ����ڱ�������Ϣ�Ρ�', 'cirs', 'Y', 'N', 'EEA_GUAR_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('704', 'sql', 'E_GUAR_ACCT_BS', 'RPT_DATE_CODE', 'EEA_RPTDATECODEIS_EEF_ISNULL', 
    '������ʱ��˵�����롱Ϊ��50-������Ϣ�仯��ʱ���������ڱ�������Ϣ�Ρ�', 'cirs', 'Y', 'N', 'EEA_GUAR_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('705', 'sql', 'E_GUAR_ACCT_BS', 'RPT_DATE_CODE', 'EEA_RPTDATECODEIS_EEF_NOTNULL', 
    '������ʱ��˵�����롱Ϊ��40-�弶���������ʱ�����ٰ�����������Ϣ�Ρ�', 'cirs', 'Y', 'N', 'EEA_GUAR_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('708', 'sql', 'E_GUAR_ACCT_BS_INF', 'BUSI_LINES', 'EEB_BUSIDTILLINES_BELONGTO_BUSILINES', 
    '������ҵ����ࡱ�͡�����ҵ������ϸ�֡����벻ƥ��', 'cirs', 'Y', 'N', 'EEB_GUAR_ACCT_BS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('709', 'sql', 'E_GUAR_INSURANCE_INF', 'ACCT_STATUS', 'EEF_ACCTSTATUS2_CLOSEDATE_ISNOTNULL', 
    '���ҽ������˻�״̬��Ϊ��2-�رա������˻��ر����ڡ�����Ϊ��ֵ', 'cirs', 'Y', 'N', 'EEF_GUAR_RLT_REPYMT_INF_SG_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('710', 'sql', 'E_GUAR_INSURANCE_INF', 'CLOSE_DATE', 'EEF_CLOSEDATE_NOTNULLANDEARLIERTHAN_OTHERDATE', 
    '�˻���Ϣ��¼��������˻��ر����ڡ������Ϊ�գ��˻��ر�����Ӧ�����ڡ����仯���ڡ������弶�����϶����ڡ�', 'cirs', 'Y', 'N', 'EEF_GUAR_RLT_REPYMT_INF_SG_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('711', 'sql', 'E_SEC_RLT_REPYMT_INF', 'INFO_ID_TYPE', 'EEC_ARLPCERTTYPE_BELONGTO_INFOIDTYPE', 
    '��ػ��������˶��С������𡱺͡���������ݱ�ʶ���͡����������ƥ��', 'cirs', 'Y', 'N', 'EEC_RLT_REPYMT_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('712', 'sql', 'E_SEC_RLT_REPYMT_INF', 'ARLP_TYPE', 'EEC_ARLPTYPE2_WARTYSIGN_AND_MAXGUARMCC_ISNOTNULL', 
    '�����������������͡�Ϊ��2-�������ˡ�ʱ����������־��������֤��ͬ��š���ӦΪ��', 'cirs', 'Y', 'N', 'EEC_RLT_REPYMT_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('713', 'sql', 'E_GUAR_ACCT_BS_INF', 'OPEN_DATE', 'OPENDATE_LATERTHAN_REPAYPRD_FIVECATEADJ_CLOSE', 
    '�˻���Ϣ��¼�еġ��������ڡ�Ӧ�����ڡ����仯���ڡ������弶�����϶����ڡ������˻��ر����ڡ�������Ϊ�գ�', 'cirs', 'Y', 'N', 'EEB_GUAR_ACCT_BS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('714', 'sql', 'E_SEC_RLT_REPYMT_INF', 'ARLP_CERT_NUM', 'EEA_OBLIGOR_AND_PERSONLIABLE_TWOMARK_NOTSAME', 
    'ծ������������ػ������������겻����ͬ', 'cirs', 'Y', 'N', 'EEC_RLT_REPYMT_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('715', 'sql', 'E_ACCT_BS_INF', 'GUAR_MODE', 'CHECK_GUARMODE_RPTDATECODE10', 
    '��������ʱ��˵�����롱Ϊ��10-�¿���/�״��ϱ���������������Ϣ�Ρ��ġ�������ʽ��Ϊ��1-��֤��ʱ�����뱨����ػ��������˶�', 'cirs', 'Y', 'N', 'EDB_ACCT_BS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('716', 'sql', 'E_ACCT_BS_INF', 'GUAR_MODE', 'CHECK_GUARMODE_RPTDATECODE10', 
    '��������ʱ��˵�����롱Ϊ��10-�¿���/�״��ϱ���������������Ϣ�Ρ��ġ�������ʽ��Ϊ��2-��Ѻ������3-��Ѻ��ʱ�����뱨�͵���Ѻ����Ϣ�Ρ�', 'cirs', 'Y', 'N', 'EDB_ACCT_BS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('717', 'sql', 'E_ACCT_SPEC_TRST', 'CHAN_TRAN_TYPE', 'EDH_TRANDATE_AND_CHANTRANTYPE_NOTEXIST', 
    '�ض�����˵�����еġ��������ڡ�+���������͡��ڿ��в��ܴ���', 'cirs', 'Y', 'N', 'EDH_ACCT_SPEC_TRST_DSPN_SG_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('706', 'sql', 'E_GUAR_ACCT_BS', 'RPT_DATE_CODE', 'EEA_RPTDATECODE10_GUAR_MODE1_EEC_NOTNULL', 
    '������ʱ��˵�����롱Ϊ��10-�¿���/�״��ϱ����ҡ���������ʽ��Ϊ��1-��֤��ʱ�����ٰ�����ػ��������˶�', 'cirs', 'Y', 'N', 'EEA_GUAR_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('707', 'sql', 'E_GUAR_ACCT_BS_INF', 'OPEN_DATE', 'EEB_OPENDATE_GREANTERTHAN_DUEDATE', 
    '���������ڡ�Ӧ�����ڡ��������ڡ�', 'cirs', 'Y', 'N', 'EEB_GUAR_ACCT_BS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('718', 'sql', 'E_ACCT_BS_INF', 'OPEN_DATE', 'EDB_OPENDATE_GREATERTHAN_DUEDATE', 
    '���������ڡ�Ӧ�����ڡ��������ڡ�', 'cirs', 'Y', 'N', 'EDB_ACCT_BS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('719', 'sql', 'E_ACCT_BS_INF', 'REPAY_MODE', 'EDB_REPAYMODE90_REPAYFREQCY10', 
    '�����ʽ��Ϊ��90-���ܱ��ͣ������ֻ��ʽ�����򡰻���Ƶ�ʡ�ӦΪ��10-�¡�', 'cirs', 'Y', 'N', 'EDB_ACCT_BS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('720', 'sql', 'E_ACCT_BS_INF', 'REPAY_MODE', 'EDB_REPAYMODE2%_REPAYFREQCY99', 
    '�����ʽ���ԡ�2����ͷ���򡰻���Ƶ�ʡ�ӦΪ��99-������', 'cirs', 'Y', 'N', 'EDB_ACCT_BS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('721', 'sql', 'E_ACCT_BS_INF', 'REPAY_MODE', 'CHECK_EDA_ACCTTYPE_AND_EDB_REPAYMODE', 
    '���˻�����Ϊ R4,D1 ʱ���˻�������Ϣ���еĻ��ʽ���벻Ϊ31,32,33,39', 'cirs', 'Y', 'N', 'EDB_ACCT_BS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('722', 'sql', 'E_ACCT_BS_INF', 'REPAY_MODE', 'CHECK_EDA_ACCTTYPE_AND_EDB_REPAYMODE', 
    '���˻�����Ϊ R1 ʱ���˻�������Ϣ���еĻ��ʽ���벻Ϊ11,12,13,14,15,19,21,22,23,29', 'cirs', 'Y', 'N', 'EDB_ACCT_BS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('723', 'sql', 'E_RLT_REPYMT_INF', 'ARLP_TYPE', 'CHECK_EDC_ARLPTYPE_AND_ARLPAMT', 
    '��������������Ϊ1-��ͬ�����ʱ���������ν��Ϊ�գ�������Ϊ��ֵ', 'cirs', 'Y', 'N', 'EDC_RLT_REPYMT_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('724', 'sql', 'E_RLT_REPYMT_INF', 'ARLP_TYPE', 'CHECK_EDC_ARLPTYPE_AND_WARTYSIGN_MAXGUARMCC', 
    '��������������Ϊ2-��֤��ʱ��������־,��֤��ͬ��ű��벻��Ϊ��ֵ', 'cirs', 'Y', 'N', 'EDC_RLT_REPYMT_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('725', 'sql', 'E_RLT_REPYMT_INF', 'ARLP_ID_TYPE', 'CHECK_EDC_ARLPCERTTYPE_AND_ARLPIDTYPE', 
    '���������������ݱ�ʶ���͵Ĵ������ƥ��', 'cirs', 'Y', 'N', 'EDC_RLT_REPYMT_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('726', 'sql', 'E_ACT_LBLTY_INF', 'ACCT_STATUS', 'CHECK_EDG_ACCTSTATUS21_AND_ACCTBAL0', 
    '���˻�״̬Ϊ21-�ر�ʱ�����,��ǰ�����ܶ�,��ǰ���ڱ���͵�ǰ������������Ϊ 0��', 'cirs', 'Y', 'N', 'EDG_ACT_LBLTY_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('727', 'sql', 'E_ACT_LBLTY_INF', 'ACCT_STATUS', 'CHECK_EDG_ACCTSTATUS21_AND_CLOSEDATENOTNULL', 
    '���ҽ����˻�״̬Ϊ21-�ر�ʱ���˻��ر����ڲ���Ϊ��ֵ', 'cirs', 'Y', 'N', 'EDG_ACT_LBLTY_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2052', 'sql', 'I_AMBLG_INF', 'ACCT_STATUS', 'gr_jd_is_one13', 
    '�����˻�״̬��Ϊ��3-�رա�/��4-������������ӦΪ 0', 'cirs', 'Y', 'N', 'PBG_AMBLG_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2053', 'sql', 'I_AMBLG_INF', 'ACCT_STATUS', 'gr_jd_is_one14', 
    '���˻�״̬���͡���ǰ����״̬����Ҫ����һ�£����˻�״̬��Ϊ��3-�رա�/��4-������ʱ������ǰ����״̬��ӦΪ��C-���塱/��C-����������G-����', 'cirs', 'Y', 'N', 'PBG_AMBLG_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2054', 'sql', 'I_AMBLG_INF', 'CLOSE_DATE', 'gr_jd_is_one15', 
    '�����˻��ر����ڡ������Ϊ�գ����˻��ر����ڡ�Ӧ�����ڡ�����/Ӧ�����ա������һ��ʵ�ʻ������ڡ����弶�����϶�����', 'cirs', 'Y', 'N', 'PBG_AMBLG_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2055', 'sql', 'I_AMBLG_INF', 'ACCT_STATUS', 'gr_jd_is_one16', 
    '�����˻�״̬��Ϊ��3-�رա�/��4-�����������˻��ر����ڡ�����Ϊ��ֵ', 'cirs', 'Y', 'N', 'PBG_AMBLG_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2056', 'sql', 'I_ACCT_DBT_INF', 'NOMONTH_ACCT_STATUS', 'gr_jd_is_one16', 
    '�����˻�״̬��Ϊ��2-�����������˻��ر����ڡ�����Ϊ��ֵ', 'cirs', 'Y', 'N', 'PBI_ACCT_DBT_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2057', 'sql', 'I_AMBLG_INF', 'ACCT_STATUS', 'gr_jd_is_one17', 
    '���˻�״̬Ϊ���رա�/��������ʱ������ǰ�����ܶ������ǰ����������ӦΪ 0', 'cirs', 'Y', 'N', 'PBG_AMBLG_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2058', 'sql', 'I_SPEC_PRD', 'SPEC_EFCT_DATE', 'gr_jd_is_one18', 
    '�����ڶ����Ч���ڡ�Ӧ�����ڡ����ڶ�ȵ�������', 'cirs', 'Y', 'N', 'PBH_SPEC_PRD_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2059', 'sql', 'I_ACCT_DBT_INF', 'NOMONTH_RPY_STATUS', 'gr_jd_is_one19', 
    '����ǰ����״̬��ֻ��Ϊ��N-����', 'cirs', 'Y', 'N', 'PBI_ACCT_DBT_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2060', 'sql', 'I_ACCT_DBT_INF', 'NOMONTH_CLOSE_DATE', 'gr_jd_is_one20', 
    '�����˻��ر����ڡ������Ϊ�գ����˻��ر����ڡ�Ӧ�����ڡ����һ��ʵ�ʻ������ڡ������弶�����϶�����', 'cirs', 'Y', 'N', 'PBI_ACCT_DBT_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2061', 'sql', 'I_ACCT_DBT_INF', 'NOMONTH_ACCT_STATUS', 'gr_jd_is_one21', 
    '�����˻�״̬��Ϊ��2-������������ӦΪ 0', 'cirs', 'Y', 'N', 'PBI_ACCT_DBT_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2062', 'sql', 'I_AMBLG_INF', 'OVEDRAW_BA_OVE180', 'gr_jd_is_two1', 
    '���˻���Ϣ��¼���˻�����ΪR3ʱ��͸֧ 180 ������δ�����Ӧ��С�ڵ������', 'cirs', 'Y', 'N', 'PBG_AMBLG_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2063', 'sql', 'I_AMBLG_INF', 'ACCT_BAL', 'gr_jd_is_two2', 
    '���˻���Ϣ��¼���˻�����ΪR3ʱ����ǰ����״̬Ϊ*ʱ��������Ϊ 0', 'cirs', 'Y', 'N', 'PBG_AMBLG_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2064', 'sql', 'I_AMBLG_INF', 'ACCT_BAL', 'gr_jd_is_two3', 
    '���˻���Ϣ��¼���˻�����ΪR3ʱ����ǰ����״̬Ϊ����1-7ʱ����������� 0', 'cirs', 'Y', 'N', 'PBG_AMBLG_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2065', 'sql', 'I_ACCT_BS_INF', 'BUSI_LINES', 'gr_jd_is_two4', 
    '���˻�����ΪC1ʱ�����ҵ�����ֻ��Ϊ5-�ʲ����á�6-��� ���˻�����ΪR2/R3ʱ�����ҵ�����ֻ��Ϊ2-���ÿ�', 'cirs', 'Y', 'N', 'PBB_ACCT_BS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2066', 'sql', 'I_AMBLG_INF', 'ACCT_STATUS', 'gr_jd_is_two5', 
    '������ʱ��˵������Ϊ32-�½����˻��رպ�20-�˻��ر�ʱ���˻�״̬Ϊ3-�ر�,4-����', 'cirs', 'Y', 'N', 'PBG_AMBLG_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2067', 'sql', 'I_LOAN_RLT_REPYMT_INF', 'ARLP_CERT_NUM', 'gr_jd_is_two6', 
    '�����֤�����͡�֤���������������ݱ�ʶ���͡���������ݱ�ʶ���벻����ȫ��ͬ', 'cirs', 'Y', 'N', 'PBC_RLT_REPYMT_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2068', 'sql', 'I_ACCT_DBT_INF', 'NOMONTH_ACCT_STATUS', 'gr_jd_is_two7', 
    '���� C1 ��������˻������¶ȱ����е��˻�״̬��ӦΪ�رջ�����', 'cirs', 'Y', 'N', 'PBI_ACCT_DBT_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('10000', 'sql', 'E_MN_MMB_INF', 'MMB_PSTN', 'Only_Oneperson', 
    '���������ˡ����³������³�����ֻ�ܱ���һ��', 'cirs', 'Y', 'N', 'EAD_MN_MMB_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('10014', 'sql', 'I_CREDIT_LIM', 'CON_EFF_DATE', 'grsx_I2200D01', 
    '�����Ч����Ӧ�����ڶ�ȵ�������', 'cirs', 'Y', 'N', 'PCC_CREDIT_LIM_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('10016', 'sql', 'I_CTRCT_CERT_REL', 'CERT_REL_ID_NUM', 'grsx_I2200A01', 
    '��������֤�����͡�����������֤�����롱�롰��ͬ��������ݱ�ʶ���͡�������ͬ��������ݱ�ʶ���롱������ͬ', 'cirs', 'Y', 'N', 'PCB_CTRCT_CERT_REL_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('10020', 'sql', 'E_GUAR_ACCT_BS', 'RPT_DATE', 'qiye_danbao_01', 
    '����˻���Ϣ��¼����һ���ġ��˻�״̬��Ϊ��2-�رա����������Ϣ��¼������⡣', 'cirs', 'Y', 'N', 'EEA_GUAR_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('10021', 'sql', 'E_CTRCT_BS', 'RPT_DATE', 'qiye_shouxin_01', 
    '����������һ������Э����Ϣ��¼�еġ����״̬��Ϊ��2-����/ʧЧ��ʱ��������Ϣ��¼�������', 'cirs', 'Y', 'N', 'EGA_CTRCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('10035', 'sql', 'I_ACCT_BS', 'ACCT_CODE', 'ACCT_CODE_is_not_null', 
    '���������ҵ���ʶ������ڿ��д���', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('10036', 'sql', 'I_GUAR_ACCT_INF', 'OPEN_DATE', 'gr_db_o01', 
    '�˻���Ϣ��¼�еġ��������ڡ�Ӧ�����ڡ����仯���ڡ������弶�����϶����ڡ������˻��ر����ڣ�����Ϊ�գ���', 'cirs', 'Y', 'N', 'PDB_GUAR_ACCT_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('10002', 'sql', 'E_MN_MMB_INF', 'MMB_PSTN', 'NotOnly_Oneperson', 
    '���³������³�������ͬһ����', 'cirs', 'Y', 'N', 'EAD_MN_MMB_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('10026', 'sql', 'I_CTRCT_BS', 'CONTRACT_CODE', 'ACCT_CODE_is_not_null', 
    '���Ŵ�����ҵ���ʶ������ڿ��д���', 'cirs', 'Y', 'N', 'PCA_CTRCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('10027', 'sql', 'I_GUAR_ACCT_BS', 'ACCT_CODE', 'ACCT_CODE_is_not_null', 
    '����������ҵ���ʶ������ڿ��д���', 'cirs', 'Y', 'N', 'PDA_GUAR_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('10010', 'sql', 'I_IN_FAL_MMBS_INF', 'FAM_MEM_CERT_NUM', 'Two_standard_not_repeat', 
    '������ݱ�ʶ������ݱ�ʶ���벻����ȫ��ͬ', 'cirs', 'Y', 'N', 'PAJ_IN_FAL_MMBS_INF_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('10012', 'sql', 'I_CTRCT_BS', 'RPT_DATE', 'grsx_R2201201', 
    '����������һ����������Э����Ϣ��¼�еġ����״̬��Ϊ��2-����/ʧЧ��ʱ��������Ϣ��¼�������', 'cirs', 'Y', 'N', 'PCA_CTRCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('10018', 'sql', 'I_IN_SPC_EVT_DSC_INF', 'MONTH', 'grjd_tssj_02', 
    '����˻������¼�˵����¼�ġ���Ϣ�������ڡ��롰�����·ݡ��е��ꡢ�����', 'cirs', 'Y', 'N', 'PBK_IN_SPC_EVT_DSC_INF_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('10019', 'sql', 'I_IN_SPC_EVT_DSC_INF', 'RPT_DATE', 'grjd_tssj_03', 
    '�����������¼�˵����¼���������Ѵ��ڡ��˻���ʶ�롱��ͬ����Ϣ����������ͬ���˽���˻���¼����ü�¼������⡣', 'cirs', 'Y', 'N', 'PBK_IN_SPC_EVT_DSC_INF_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('10028', 'sql', 'I_GUAR_ACCT_BS', 'RPT_DATE', 'gr_R2321209_01', 
    '�����ڱ�������Ϣ��ʱ���������ĸ��������¼�е���Ϣ�����������ڿ������µ��ڱ�������Ϣ�ε���Ϣ�������ڣ��ҿ����ڱ�������Ϣ���е��˻�״̬Ϊ���رա�,��ø��������¼�������', 'cirs', 'Y', 'N', 'PDA_GUAR_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('10011', 'sql', 'I_CTRCT_BS', 'INF_REC_TYPE', 'PCC_IS_NOT_NULL', 
    '��������Э���¼����ʱ���������Ρ��͡������Ϣ�Ρ��������', 'cirs', 'Y', 'N', 'PCA_CTRCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('10015', 'sql', 'I_CREDIT_LIM', 'CREDIT_REST', 'grsx_I2200D02', 
    '�������޶���������޶��š�����ͬʱ���֡�', 'cirs', 'Y', 'N', 'PCC_CREDIT_LIM_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('10017', 'sql', 'I_IN_SPC_EVT_DSC_INF', 'ACCT_CODE', 'grjd_tssj_01', 
    '���˻���ʶ�롱��Ӧ�ĸ��˽���˻������Ѿ��ڿ��д��ڣ�����ü�¼������⡣', 'cris', 'Y', 'N', 'PBK_IN_SPC_EVT_DSC_INF_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('10022', 'sql', 'E_ACT_LBLTY_INF', 'CLOSE_DATE', 'QY_JD_010', 
    '���˻��ر��ղ�Ϊ��ʱ������벻�������仯���ڡ����һ��ʵ�ʻ������ڡ����һ��Լ���������ڡ��弶�����϶�����', 'cirs', 'Y', 'N', 'EDG_ACT_LBLTY_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('10023', 'sql', 'E_ACT_LBLTY_INF', 'ACCT_STATUS', 'QY_JD_020', 
    '���ҽ�������ʱ��˵������Ϊ20-�˻��ر�ʱ���˻�״̬Ϊ21-�ر�', 'cirs', 'Y', 'N', 'EDG_ACT_LBLTY_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('10024', 'sql', 'I_IN_ACCT_DEL', 'DEL_START_DATE', 'ST_AND_ET_IS_NOT_NULL', 
    '��ɾ����ʼ����,��ɾ������ֹ���ڲ���ͬʱΪ��ֵ', 'cirs', 'Y', 'N', 'PBY_IN_ACCT_DEL_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('10025', 'sql', 'I_IN_ACCT_DEL', 'DEL_END_DATE', 'ED_No_greater_than_SD', 
    '���˽����ɾ����ʼ���ڱ���С�ڵ��ڴ�ɾ���Ľ�������', 'cirs', 'Y', 'N', 'PBY_IN_ACCT_DEL_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('10029', 'sql', 'I_AMBLG_INF', 'OVEDRAW_BA_OVE180', 'grjd_d_001', 
    '���˻���Ϣ��¼�С��˻����͡�Ϊ��R3��ʱ����͸֧ 180 ������δ����Ӧ��С�ڵ��ڡ���', 'cirs', 'Y', 'N', 'PBG_AMBLG_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('10030', 'sql', 'I_AMBLG_INF', 'ACCT_BAL', 'grjd_d_002', 
    '���˻���Ϣ��¼�С��˻����͡�Ϊ��R3��ʱ������ǰ����״̬��Ϊ��*��ʱ����������Ϊ 0', 'cirs', 'Y', 'N', 'PBG_AMBLG_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('10031', 'sql', 'I_AMBLG_INF', 'ACCT_BAL', 'grjd_d_003', 
    '���˻���Ϣ��¼�С��˻����͡�Ϊ��R3��ʱ������ǰ����״̬��Ϊ���֡�1-7��ʱ������������� 0', 'cirs', 'Y', 'N', 'PBG_AMBLG_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('10032', 'sql', 'I_AMBLG_INF', 'ACCT_STATUS', 'grjd_d_004', 
    '��������ʱ��˵�����롱Ϊ��32-�½����˻��رա��͡�20-�˻��رա�ʱ�����˻�״̬��Ϊ��3-�ر�/��4-������', 'cirs', 'Y', 'N', 'PBG_AMBLG_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('10034', 'sql', 'I_ACCT_DBT_INF', 'NOMONTH_ACCT_STATUS', 'grjd_d_005', 
    '����C1��������˻������¶ȱ����е��˻�״̬��ӦΪ���رա���������', 'cirs', 'Y', 'N', 'PBI_ACCT_DBT_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('779', 'sql', 'I_GUAR_ACCT_BS', 'ACCT_TYPE', 'CHECK_ACCTTYPE', 
    '�������Ķβ���Ϊ�������С��˻����͡��������õ���Ϣ��', 'cirs', 'Y', 'N', 'PDA_GUAR_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('780', 'sql', 'I_ACCT_BS', 'ACCT_TYPE', 'CHECK_ACCTTYPE', 
    '�������Ķβ���Ϊ�������С��˻����͡��������õ���Ϣ��', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('781', 'sql', 'I_ACCT_BS', 'RPT_DATE', 'CHAR_MDFCSGMTCODEJ_RPTDATE', 
    '�������¶ȱ�����Ϣ��ʱ����������Ϣ����������ͬ�������¼���Ϣ��¼����ü�¼��Ӧ������', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2000', 'sql', 'I_GUAR_ACCT_BS', 'RPT_DATE_CODE', 'RPT_DATE_CODE_TEN_IS_NOT_NULL', 
    '����ʱ��˵������Ϊ10-�¿���/�״��ϱ�������Ӧ�����˻�������Ϣ�Ρ��ڱ�������Ϣ��', 'cirs', 'Y', 'N', 'PDA_GUAR_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2001', 'sql', 'I_GUAR_ACCT_BS', 'RPT_DATE_CODE', 'PDE_GR_REPYMT_INF_SGMT_TEN_IS_NOT_NULL', 
    '����ʱ��˵������Ϊ20-�˻��ر�,30-�ڱ����α仯,40-�弶�������ʱ������Ӧ�����ڱ�������Ϣ��', 'cirs', 'Y', 'N', 'PDA_GUAR_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2002', 'sql', 'I_GUAR_ACCT_INF', 'GUAR_MODE', 'PDC_RLT_REPYMT_INF_SGMT_IS_NOT_NULL', 
    '����ʱ��˵������Ϊ10-�¿���/�״��ϱ��ҷ�������ʽΪ1-��֤ʱ��Ӧ������ػ�����������Ϣ��', 'cirs', 'Y', 'N', 'PDB_GUAR_ACCT_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2003', 'sql', 'I_GR_REPYMT_INF', 'ACCT_STATUS', 'PDE_GR_REPYMT_INF_SGMT_FIFTY_IS_NULL', 
    '����ʱ��˵������Ϊ50-������Ϣ�仯ʱ���������ڱ�������Ϣ��', 'cirs', 'Y', 'N', 'PDE_GR_REPYMT_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2004', 'sql', 'I_GUAR_ACCT_INF', 'OPEN_DATE', 'OPEN_DAT_DUE_DATE', 
    '��������Ӧ�����ڵ�������', 'cirs', 'Y', 'N', 'PDB_GUAR_ACCT_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2005', 'sql', 'I_GR_REPYMT_INF', 'CLOSE_DATE', 'DATA_IS_NOT_NULL', 
    '����˻�״̬Ϊ2-�رգ����˻��ر����ڲ���Ϊ��ֵ', 'cirs', 'Y', 'N', 'PDE_GR_REPYMT_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2006', 'sql', 'I_GUAR_RLT_REPYMT_INF', 'ARLP_TYPE', 'ARLP_TYPE_is_not_null', 
    '����������������Ϊ2-��������ʱ��������־����֤��ͬ��Ų�ӦΪ��', 'cirs', 'Y', 'N', 'PDC_RLT_REPYMT_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2007', 'sql', 'I_GUAR_RLT_REPYMT_INF', 'ARLP_CERT_NUM', 'ID_TYPE_ID_NUM_is_not_the_same', 
    'ծ�������������������겻����ͬ', 'cirs', 'Y', 'N', 'PDC_RLT_REPYMT_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2008', 'sql', 'I_BS', 'RPT_DATE_CODE', 'table_is_not_null', 
    '���ڸ��˻�����Ϣ��¼��������ʱ��˵������Ϊ10-�����ͻ�/�״��ϱ����ü�¼���ٰ��������ſ���Ϣ�Ρ�������Ϣ�Ρ���ס��ַ�Ρ�ͨѶ��ַ�Ρ�������Ϣ�Ρ�ְҵ��Ϣ��', 'cirs', 'Y', 'N', 'PAA_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2009', 'sql', 'I_OCTPN_INF', 'EMP_STATUS', 'FIDLD_IS_NULL_OR_NOT_NULL', 
    '����ҵ״��Ϊ11-���ҹ���Ա��13-רҵ������Ա��17-ְԱ��21-��ҵ������Ա��24-���˻�91-��ְʱ����λ���ơ���λ���ʡ���λ������ҵ����λ��ϸ��ַ����λ���ڵ��ʱࡢ��λ���ڵ�������������λ�绰��ְҵ��ְ��ְ�ƺͱ���λ������ʼ��ݱ�����֣�������ҵ״��Ϊ��������Ĵ��룬����������ܳ��֡�', 'cirs', 'Y', 'N', 'PAE_OCTPN_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2010', 'sql', 'I_SPS_INF', 'MARI_STATUS', 'FIDLD2_IS_NULL_OR_NOT_NULL', 
    '������״��Ϊ20-�ѻ顢21-���顢22-�ٻ顢23-����ʱ����ż��������ż֤�����͡���ż֤�����롢��ż��ϵ�绰����ż������λ������֣�������״��Ϊ��������Ĵ��룬����������ܳ��֡�', 'cirs', 'Y', 'N', 'PAH_SPS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2011', 'sql', 'I_FCS_INF', 'D_O_B', 'D_O_B_FCS_INFO_UP_DATE_one', 
    '��������Ӧ��������Ϣ��������', 'cirs', 'Y', 'N', 'PAC_FCS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2012', 'sql', 'I_SPS_INF', 'SPO_ID_TYPE', 'one_not_null', 
    '��ż֤�����͡���ż֤����������֮һ��Ϊ��ʱ����һ��Ӧ��Ϊ��', 'cirs', 'Y', 'N', 'PAH_SPS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2013', 'sql', 'I_EDU_INF', 'EDU_LEVEL', 'EDU_LEVEL_ACA_DEGREE_one', 
    '��ѧ��Ϊ30-��ר��40-��ר��ְ�ߡ���У��70-���С�80-Сѧʱ��ѧλֻ��Ϊ5-�޻�9-δ֪', 'cirs', 'Y', 'N', 'PAD_EDU_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2014', 'sql', 'I_OCTPN_INF', 'CPN_TYPE', 'CPN_TYPE_OCCUPATION_one', 
    '����λ����Ϊ30-������ҵ��40-���塢˽Ӫ��ҵ��50-����������������ҵ����Ӫ��ҵ���������ȣ�ʱ��ְҵ����Ϊ0-���һ��ء���Ⱥ��֯����ҵ����ҵ��λ�����ˡ�X-����', 'cirs', 'Y', 'N', 'PAE_OCTPN_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2015', 'sql', 'I_ID', 'OTH_ID_TYPE', 'NUM_and_TYPE_THE_SAME3', 
    '֤�����͡�֤�����벻����������е�֤�����͡�֤��������ȫ��ͬ', 'cirs', 'Y', 'N', 'PAB_ID_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2016', 'sql', 'I_SPS_INF', 'SPO_ID_TYPE', 'NUM_and_TYPE_THE_SAME3', 
    '֤�����͡�֤�����벻����������е�֤�����͡�֤��������ȫ��ͬ', 'cirs', 'Y', 'N', 'PAH_SPS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2017', 'sql', 'I_ACCT_BS', 'RPT_DATE_CODE', 'gr_pb_table_one1', 
    '������ʱ��˵������Ϊ30-�¶Ƚ���ʱ�����������⣬���ٻ�Ӧ�����¶ȱ�����Ϣ�Σ��˻����Ͳ���ΪC1��', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2018', 'sql', 'I_ACCT_BS', 'RPT_DATE_CODE', 'gr_pb_table_one1', 
    '������ʱ��˵������Ϊ31-�½����״��ϱ������˻�ʱ�����������⣬���ٰ���������Ϣ�Σ��˻����Ͳ���ΪC1', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2019', 'sql', 'I_ACCT_BS', 'RPT_DATE_CODE', 'gr_pb_table_one1', 
    '������ʱ��˵������Ϊ32-�½����˻��ر�ʱ�����������⣬���ٻ�Ӧ�����¶ȱ�����Ϣ�Σ��˻����Ͳ���ΪC1��', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2020', 'sql', 'I_ACCT_BS', 'RPT_DATE_CODE', 'gr_pb_table_one1', 
    '������ʱ��˵������Ϊ40-�ջ����ڿ���ʱ�����������⣬���ٻ�Ӧ�������¶ȱ�����Ϣ�Σ��˻����Ͳ���ΪR3', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2021', 'sql', 'I_ACCT_BS', 'RPT_DATE_CODE', 'gr_pb_table_one2', 
    '������ʱ��˵������Ϊ20-�˻��ر�ʱ���������Σ����˻�����ΪD1/R1/R2/R3/R4����Ӧ�����¶ȱ�����Ϣ��', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2022', 'sql', 'I_ACCT_BS', 'RPT_DATE_CODE', 'gr_pb_table_one2', 
    '������ʱ��˵������Ϊ20-�˻��ر�ʱ����������,���˻�����ΪC1����Ӧ�������¶ȱ�����Ϣ��', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2023', 'sql', 'I_ACCT_BS', 'RPT_DATE_CODE', 'gr_pb_table_one3', 
    '������ʱ��˵������Ϊ10-�¿���ʱ�����ٰ���������Ϣ�Σ����˻�����ΪR2����Ӧ�����¶ȱ��ֶΡ����������Ϣ���еĽ��ҵ������ϸ�ֲ��Ǵ��ר����ڿ�����Ӧ�������Ŷ����Ϣ��', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2024', 'sql', 'I_ACCT_BS', 'RPT_DATE_CODE', 'gr_pb_table_one4', 
    '������ʱ��˵������Ϊ10-�¿���ʱ�����������⣬���ٰ���������Ϣ�Σ����˻�����ΪR1/R3/R4����Ӧ�����¶ȱ�����Ϣ�Ρ����Ŷ����Ϣ��', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2025', 'sql', 'I_ACCT_BS', 'RPT_DATE_CODE', 'gr_pb_table_one4', 
    '������ʱ��˵������Ϊ10-�¿���ʱ�����������⣬���ٰ���������Ϣ�Σ����˻�����ΪC1����Ӧ������ʼծȨ˵���Ρ����¶ȱ�����Ϣ��', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('2026', 'sql', 'I_ACCT_BS', 'RPT_DATE_CODE', 'gr_pb_table_one5', 
    '����ʱ��˵������Ϊ10-�¿���ʱ�����������⣬���˽���˻���Ϣ��¼���ٰ���������Ϣ��', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('738', 'sql', 'E_ACCT_BS_INF', 'OPEN_DATE', 'CHECK_EDB_OPENDATE_AND_OTHERDATE', 
    '�������ڲ�����ͬһ����¼�е���������ҵ�����ڡ�����ҵ�����ڰ����������ڣ���������,���仯����,�弶�����϶�����,���һ��ʵ�ʻ�������,���һ��Լ����������,��һ��Լ����������,�˻��ر����ںͽ�������', 'cirs', 'Y', 'N', 'EDB_ACCT_BS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('739', 'sql', 'E_ACCT_BS', 'RPT_DATE_CODE', 'CHECK_EDA_RPTDATECODE20_AND_ACCTSTATUS', 
    '���ҽ�������ʱ��˵������Ϊ20-�˻��ر�ʱ���˻�״̬Ϊ21-�ر�', 'cirs', 'Y', 'N', 'EDA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('740', 'sql', 'E_ACCT_BS_INF', 'BUSI_LINES', 'CHECK_EDB_ACCTTYPEC1_AND_BUSILINES', 
    '���˻�����ΪC1ʱ���Ŵ�ҵ�����ֻ��Ϊ51-�ʲ�����,41-���', 'cirs', 'Y', 'N', 'EDB_ACCT_BS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('741', 'sql', 'E_ACCT_SPEC_TRST', 'TRAN_AMT', 'CHECK_EDH_TRANAMT_AND_LOANAMT', 
    '���׽��С�ڵ��ڽ����', 'cirs', 'Y', 'N', 'EDH_ACCT_SPEC_TRST_DSPN_SG_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('742', 'sql', 'E_ACCT_BS_INF', 'REPAY_MODE', 'CHECK_EDB_REPAYMODE_AND_ACCTTYPE', 
    '���ʽ�Ĵ���������˻�������ƥ��', 'cirs', 'Y', 'N', 'EDB_ACCT_BS_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('743', 'sql', 'E_RLT_REPYMT_INF', 'ARLP_CERT_NUM', 'CHECK_EDC_TWOMARK_LOAN_AND_DUTY', 
    '��������꣨��ݱ�ʶ����,��ݱ�ʶ���룩�����������겻����ͬ', 'cirs', 'Y', 'N', 'EDC_RLT_REPYMT_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('746', 'sql', 'I_CTRCT_BS', 'MDFC_SGMT_CODE', 'CHECK_PCA_MDFC_SGMT_CODE', 
    '�������Ķε����ݺʹ������Ķα�Ӧ����һ��', 'cirs', 'Y', 'N', 'PCA_CTRCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('747', 'sql', 'I_ACCT_BS', 'MDFC_SGMT_CODE', 'CHECK_PBA_MDFC_SGMT_CODE', 
    '�������Ķε����ݺʹ������Ķα�Ӧ����һ��', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('748', 'sql', 'I_CTRCT_BS', 'MDFC_SGMT_CODE', 'CHECK_A_THREEMARK_AND_MNGMTORGCOD_OTHERNULL', 
    '������������ʱ���������н�������Ϣ���������ʶ����ҵ�����������롱��������������֡�', 'cirs', 'Y', 'N', 'PCA_CTRCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('749', 'sql', 'I_GUAR_ACCT_BS', 'MDFC_SGMT_CODE', 'CHECK_A_THREEMARK_AND_MNGMTORGCOD_OTHERNULL', 
    '������������ʱ���������н�������Ϣ���������ʶ����ҵ�����������롱��������������֡�', 'cirs', 'Y', 'N', 'PDA_GUAR_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('750', 'sql', 'I_ACCT_BS', 'MDFC_SGMT_CODE', 'CHECK_A_THREEMARK_AND_MNGMTORGCOD_OTHERNULL', 
    '������������ʱ���������н�������Ϣ���������ʶ����ҵ�����������롱��������������֡�', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('751', 'sql', 'I_CTRCT_BS', 'RPT_DATE', 'CHECK_MDFCSGMTCODEC_RPTDATE', 
    '��Ϣ��������Ӧ�����ڿ����������Ϣ��������', 'cirs', 'Y', 'N', 'PCA_CTRCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('752', 'sql', 'I_CTRCT_BS', 'RPT_DATE', 'CHECK_A_MDFCSGMTCODE_RPTDATE', 
    '��Ϣ��������Ӧ������Ӧ��Ϣ���������Ϣ��������', 'cirs', 'Y', 'N', 'PCA_CTRCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('753', 'sql', 'I_GUAR_ACCT_BS', 'RPT_DATE', 'CHECK_A_MDFCSGMTCODE_RPTDATE', 
    '��Ϣ��������Ӧ������Ӧ��Ϣ���������Ϣ��������', 'cirs', 'Y', 'N', 'PDA_GUAR_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('754', 'sql', 'I_ACCT_BS', 'RPT_DATE', 'CHECK_A_MDFCSGMTCODE_RPTDATE', 
    '��Ϣ��������Ӧ������Ӧ��Ϣ���������Ϣ��������', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('756', 'sql', 'I_GUAR_ACCT_BS', 'RPT_DATE', 'CHECK_MDFCSGMTCODEC_RPTDATE', 
    '��Ϣ��������Ӧ�����ڿ����������Ϣ��������', 'cirs', 'Y', 'N', 'PDA_GUAR_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('757', 'sql', 'I_GUAR_ACCT_BS', 'RPT_DATE', 'CHECK_MDFCSGMTCODEC_RPTDATE', 
    '��Ϣ��������Ӧ�����ڿ����������Ϣ��������', 'cirs', 'Y', 'N', 'PDA_GUAR_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('758', 'sql', 'I_GUAR_ACCT_BS', 'RPT_DATE', 'CHECK_MDFCSGMTCODEC_RPTDATE', 
    '��Ϣ��������Ӧ�����ڿ����������Ϣ��������', 'cirs', 'Y', 'N', 'PDA_GUAR_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('759', 'sql', 'I_GUAR_ACCT_BS', 'RPT_DATE', 'CHECK_MDFCSGMTCODEC_RPTDATE', 
    '��Ϣ��������Ӧ�����ڿ����������Ϣ��������', 'cirs', 'Y', 'N', 'PDA_GUAR_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('760', 'sql', 'I_AMBLG_INF', 'MONTH', 'CHECK_PBG_MONTH_AND_PBA_RPT_DATE', 
    '���·ݡ���������Ϣ�������ڵ��ꡢ�±���һ��', 'cirs', 'Y', 'N', 'PBG_AMBLG_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('761', 'sql', 'I_ACCT_BS', 'RPT_DATE', 'CHECK_A_MDFCSGMTCODE_RPTDATE', 
    '��Ϣ��������Ӧ������Ӧ��Ϣ���������Ϣ��������', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('762', 'sql', 'I_ACCT_BS', 'RPT_DATE', 'CHECK_RPTDATE_SPECEFCTDATE', 
    '���д��ڡ����ڶ����Ч���ڡ��������ʱ����Ϣ�������ڸ���Ĵ��ר�������Ϣ�������', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('763', 'sql', 'I_AMBLG_INF', 'ACCT_STATUS', 'CHECK_ACCTSTATUS_ACCTTYPE_OPETNTYPE', 
    '�������������� R2 �˻������ܽ���ʷ�ϵġ�4-����������Ϊ��������״̬', 'cirs', 'Y', 'N', 'PBG_AMBLG_INF_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('764', 'sql', 'I_ACCT_BS', 'RPT_DATE', 'CHECK_MDFCSGMTCODEC_RPTDATE', 
    '��Ϣ��������Ӧ�����ڿ����������Ϣ��������', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('765', 'sql', 'I_ACCT_BS', 'RPT_DATE', 'CHECK_MDFCSGMTCODEC_RPTDATE', 
    '��Ϣ��������Ӧ�����ڿ����������Ϣ��������', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('766', 'sql', 'I_ACCT_BS', 'RPT_DATE', 'CHECK_MDFCSGMTCODEC_RPTDATE', 
    '��Ϣ��������Ӧ�����ڿ����������Ϣ��������', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('767', 'sql', 'I_ACCT_BS', 'RPT_DATE', 'CHECK_MDFCSGMTCODEC_RPTDATE', 
    '��Ϣ��������Ӧ�����ڿ����������Ϣ��������', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('768', 'sql', 'I_ACCT_BS', 'RPT_DATE', 'CHECK_MDFCSGMTCODEC_RPTDATE', 
    '��Ϣ��������Ӧ�����ڿ����������Ϣ��������', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
Insert into VALIDATE_RULES
   (ID, RULE_TYPE, TABLE_NAME, TABLE_FIELD, TEMPLATE_NAME, 
    RULE_COMMENT, SUBJECT, IS_FORCE, IS_MULTI_TABLE, TABLE_PK)
 Values
   ('769', 'sql', 'I_ACCT_BS', 'RPT_DATE', 'CHECK_MDFCSGMTCODEC_RPTDATE', 
    '��Ϣ��������Ӧ�����ڿ����������Ϣ��������', 'cirs', 'Y', 'N', 'PBA_ACCT_BS_SGMT_ID');
COMMIT;
