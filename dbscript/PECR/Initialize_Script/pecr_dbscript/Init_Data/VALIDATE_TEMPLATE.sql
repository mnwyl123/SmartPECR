DELETE FROM VALIDATE_TEMPLATE;
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_EDB_REPAYMODE_AND_ACCTTYPE', '���ʽ�Ĵ���������˻�������ƥ��', '���ʽ�Ĵ���������˻�������ƥ��', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_1# B ON A.#table_pk_1# = B.#table_pk_1# WHERE ((B.#table_field_1# = ''#num1#'' AND A.#table_field# IN (#num2#)) OR (B.#table_field_1# = #num3# AND A.#table_field# IN (#num4#)) OR (B.#table_field_1# = ''#num5#'' AND A.#table_field# IN (#num6#))) [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_EDC_TWOMARK_LOAN_AND_DUTY', '��������꣨��ݱ�ʶ����,��ݱ�ʶ���룩�����������겻����ͬ', '��������꣨��ݱ�ʶ����,��ݱ�ʶ���룩�����������겻����ͬ', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_1# B ON A.#table_pk_1# = B.#table_pk_1# WHERE ARLP_ID_TYPE=''2'' AND (A.#table_field# = B.#table_field_1# AND A.#table_field_2# = B.#table_field_3#) [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_EDC_ARLPCERTTYPE_AND_ARLPIDTYPE', '������ػ��������˶��е����������������ݱ�ʶ���͵Ĵ������ƥ�䣺��������Ϊ2-��֯����ʱ����������ݱ�ʶ����ֻ��ѡ��10-�����루ԭ������룩,20-ͳһ������ô���,30-��֯��������', '���������������ݱ�ʶ���͵Ĵ������ƥ��', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE ((A.#table_field# = (''#num1#'') AND A.#table_field_1# NOT IN (#num3#)) OR (A.#table_field# = (''#num2#'') AND A.#table_field_1# NOT IN (#num4#)) ) [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_EDG_ACCTSTATUS21_AND_ACCTBAL0', '���˻�״̬Ϊ21-�ر�ʱ�����,��ǰ�����ܶ�,��ǰ���ڱ���͵�ǰ������������Ϊ 0��', '���˻�״̬Ϊ21-�ر�ʱ�����,��ǰ�����ܶ�,��ǰ���ڱ���͵�ǰ������������Ϊ 0��', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE (A.#table_field# = (''#num1#'') AND (A.#table_field_1# NOT IN (#num2#) OR A.#table_field_2# NOT IN (#num2#) OR A.#table_field_3# NOT IN (#num2#) OR A.#table_field_4# NOT IN (#num2#))) [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''} ', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_EDG_ACCTSTATUS21_AND_CLOSEDATENOTNULL', '���ҽ����˻�״̬Ϊ21-�ر�ʱ���˻��ر����ڲ���Ϊ��ֵ', '���ҽ����˻�״̬Ϊ21-�ر�ʱ���˻��ر����ڲ���Ϊ��ֵ', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE (A.#table_field# = (''#num1#'') AND A.#table_field_1# IS NULL)[AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''} ', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_EDG_ACCTSTATUS21_AND_TOTOVERD', '���˻�״̬Ϊ31-���ˣ��Ѻ�����,32-���ˣ���������϶����򣬵ȴ�������ʱ����ǰ�����ܶ��Ϊ 0��', '���˻�״̬Ϊ31-���ˣ��Ѻ�����,32-���ˣ���������϶����򣬵ȴ�������ʱ����ǰ�����ܶ��Ϊ 0��', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE (A.#table_field# IN (#num1#) AND A.#table_field_1# = ''#num2#'') [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_EDG_OVERDPRINC_AND_OVERDPRINC', '���� D1/D2/R1/R4 �˻�����Ϣ��¼�е�ǰ���ڱ������С�ڵ��ڵ�ǰ�����ܶ�', '���� D1/D2/R1/R4 �˻�����Ϣ��¼�е�ǰ���ڱ������С�ڵ��ڵ�ǰ�����ܶ�', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_1# B ON A.#table_pk_1# = B.#table_pk_1# WHERE (B.#table_field_1# IN (#num1#) AND A.#table_field# > A.#table_field_2#) [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('SHEET_TYPE_is_ten', '�������ͱ�����д10', '�������ͱ�����д10', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_field# != #sheet_type# [and #validate_date# =''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_EDA_ACCTTYPE_AND_EDB_REPAYMODE', '�˻������뻹�ʽУ��', '���˻�����Ϊ #n1# ʱ���˻�������Ϣ���еĻ��ʽ���벻Ϊ #n2#', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_1# B ON A.#table_pk_1# = B.#table_pk_1# WHERE (B.#table_field_1# IN (#num1#) AND A.#table_field# IN (#num2#)) [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_EDG_LATRPYPRINCAMT_AND_LATRPYAMT', '���һ��ʵ�ʹ黹�������С�ڵ������һ��ʵ�ʻ�����', '���һ��ʵ�ʹ黹�������С�ڵ������һ��ʵ�ʻ�����', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE (A.#table_field# > A.#table_field_1#) [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''} ', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_EDG_TOTOVERD_AND_OVERDDY', '���ҽ�����ǰ�����ܶ���� 0����ǰ����������Ϊ 0', '���ҽ�����ǰ�����ܶ���� 0����ǰ����������Ϊ 0', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE (A.#table_field# > ''#num1#'' AND A.#table_field_1# = ''#num1#'') [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''} ', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_EDG_CLOSEDATE_AND_OTHERDATE', '�˻��ر����ڲ�Ϊ��', '�˻��ر����ڲ�����ͬһ����¼����������ҵ�����ڳ����������⡣����ҵ�����ڳ�������������������������仯����,�弶�����϶�����,���һ��ʵ�ʻ�������,���һ��Լ����������,��һ��Լ���������ںͽ�������', 'SELECT DISTINCT A.#table_pk#,'''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_1# B ON A.#table_pk_1# = B.#table_pk_1# LEFT JOIN #table_3# C ON A.#table_pk_1# = C.#table_pk_1# WHERE(A.#table_field# < B.#table_field_1# OR A.#table_field# < A.#table_field_2# OR A.#table_field# < A.#table_field_3# OR A.#table_field# < A.#table_field_4# OR A.#table_field# < A.#table_field_5# OR A.#table_field# < A.#table_field_6# OR A.#table_field# < C.#table_field_7# ) AND(A.#table_field# > A.#table_field_5# OR A.#table_field# > A.#table_field_6# OR A.#table_field# > C.#table_field_7# )[AND #validate_date# = ''#currentDate#'' ] {AND A.#table_pk#= ''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_EDG_ACCTSTATUS2_AND_NXTAGRRRPYDATE', '���˻�״̬Ϊ2-�ر�ʱ������һ��Լ���������ڱ���Ϊ��', '���˻�״̬Ϊ2-�ر�ʱ������һ��Լ���������ڱ���Ϊ��', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE (A.#table_field# = ''#num1#'' AND A.#table_field_1# IS NOT NULL) [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_EDG_NXTAGRRRPYDATE_AND_OTHERDATE', '����һ��Լ���������ڲ�Ϊ��ʱ�����벻�������仯����,���һ��ʵ�ʻ�������,���һ��Լ����������,�弶�����϶�����', '����һ��Լ���������ڲ�Ϊ��ʱ�����벻�������仯����,���һ��ʵ�ʻ�������,���һ��Լ����������,�弶�����϶�����', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE (A.#table_field# IS NOT NULL AND(A.#table_field# < A.#table_field_1# OR A.#table_field# < A.#table_field_2# OR A.#table_field# < A.#table_field_3# OR A.#table_field# < A.#table_field_4#)) [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''} ', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_EDA_RPTDATE_AND_NXTAGRRRPYDATE', '��Ϣ��������Ӧ������ͬһ����¼����һ��Լ����������', '��Ϣ��������Ӧ������ͬһ����¼����һ��Լ����������', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_1# B ON A.#table_pk# = B.#table_pk# WHERE (A.#table_field# < (date_format(B.#table_field_1#,''%Y-%m-%d %H:%i:%s''))) [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_EDH_CHANTRANTYPE_AND_DUETRANMON', '���˻���Ϣ��¼�еĽ�������Ϊ11-չ�ڣ��������ڱ������>0', '���˻���Ϣ��¼�еĽ�������Ϊ11-չ�ڣ��������ڱ������>0', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE (A.#table_field# = ''#num1#'' AND A.#table_field_1# <= ''#num2#'') [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_EDH_CAGOFTRDNM', '���׸���Ӧ����Ӧ0', '���׸���Ӧ����Ӧ0', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE (A.#table_field# <= ''#num1#'') [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_EDB_OPENDATE_AND_OTHERDATE', '�������ڲ�����ͬһ����¼�е���������ҵ�����ڡ�����ҵ�����ڰ����������ڣ���������,���仯����,�弶�����϶�����,���һ��ʵ�ʻ�������,���һ��Լ����������,��һ��Լ����������,�˻��ر����ںͽ�������', '�������ڲ�����ͬһ����¼�е���������ҵ�����ڡ�����ҵ�����ڰ����������ڣ���������,���仯����,�弶�����϶�����,���һ��ʵ�ʻ�������,���һ��Լ����������,��һ��Լ����������,�˻��ر����ںͽ�������', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_1# B ON A.#table_pk_1# = B.#table_pk_1# LEFT JOIN #table_2# C ON A.#table_pk_1# = C.#table_pk_1# WHERE (A.#table_field# > A.#table_field_1# OR A.#table_field# > B.#table_field_2# OR A.#table_field# > B.#table_field_3# OR A.#table_field# > B.#table_field_4# OR A.#table_field# > B.#table_field_5# OR A.#table_field# > B.#table_field_6# OR A.#table_field# > B.#table_field_7# OR A.#table_field# > C.#table_field_8#) [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''} ', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_PBG_ACCTSTATUS_RPTDATE', '�����¶ȱ�����Ϣ��ʱ�������д�����Ϣ�������ڸ�����¶ȱ��֣�����������¼���˻�״̬����Ϊ���رա�/��������', '�����¶ȱ�����Ϣ��ʱ�������д�����Ϣ�������ڸ�����¶ȱ��֣�����������¼���˻�״̬����Ϊ���رա�/��������', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_1# B ON A.#table_pk_1# = B.#table_pk_1# WHERE (B.#table_field_1# < (SELECT MAX(#table_field_1#) FROM #table_1# WHERE #table_field_2# = ''#num1#'' AND #table_pk_1# NOT IN (B.#table_pk_1#)) AND A.#table_field# IN (#num3#)) [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_jd_is_two1', '���˻���Ϣ��¼���˻�����ΪR3ʱ��͸֧ 180 ������δ�����Ӧ��С�ڵ������', '���˻���Ϣ��¼���˻�����ΪR3ʱ��͸֧ 180 ������δ�����Ӧ��С�ڵ������', 'SELECT #table_pk#,''''business_pk, B.#master_table_id# as master_table_id FROM #table_name_A# A LEFT JOIN #table_name# B ON A.#table_field_A_pk#=B.#table_field_A_pk# WHERE A.#a1_field2#=#a1_field_type1# AND B.#table_field#>B.#b1_field1# [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_jd_is_two2', '���˻���Ϣ��¼���˻�����ΪR3ʱ����ǰ����״̬Ϊ*ʱ��������Ϊ 0', '���˻���Ϣ��¼���˻�����ΪR3ʱ����ǰ����״̬Ϊ*ʱ��������Ϊ 0', 'SELECT #table_pk#,''''business_pk, B.#master_table_id# as master_table_id FROM #table_name_A# A LEFT JOIN #table_name# B ON A.#table_field_A_pk#=B.#table_field_A_pk# WHERE A.#a1_field2#=#a1_field_type1# AND B.#b1_field1# IN(#b1_field_type1#) AND B.#table_field# != #b2_field_type2# [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_jd_is_two3', '���˻���Ϣ��¼���˻�����ΪR3ʱ����ǰ����״̬Ϊ����1-7ʱ����������� 0', '���˻���Ϣ��¼���˻�����ΪR3ʱ����ǰ����״̬Ϊ����1-7ʱ����������� 0', 'SELECT #table_pk#,''''business_pk, B.#master_table_id# as master_table_id FROM #table_name_A# A LEFT JOIN #table_name# B ON A.#table_field_A_pk#=B.#table_field_A_pk# WHERE A.#a1_field1#=#a1_field_type1# AND #b1_field1# IN(#b1_field_type1#) AND #table_field# <= #b1_field_type2# [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_ACCTTYPE', '�������Ķβ���Ϊ�������С��˻����͡��������õ���Ϣ��', '�������Ķβ���Ϊ�������С��˻����͡��������õ���Ϣ��', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE (A.#table_field# NOT IN (#num1#)) [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_PCC_ACCTSTATUS_RPTDATE', '���������Ϣ��ʱ�������д�����Ϣ�������ڸ���Ķ����Ϣ�Σ�����������¼�ж��״̬����Ϊ������/ʧЧ��', '���������Ϣ��ʱ�������д�����Ϣ�������ڸ���Ķ����Ϣ�Σ�����������¼�ж��״̬����Ϊ������/ʧЧ��', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_1# B ON A.#table_pk_1# = B.#table_pk_1# WHERE (B.#table_field_1# < (SELECT MAX(#table_field_1#) FROM #table_1# WHERE #table_field_2# = ''#num1#'' AND #table_pk_1# NOT IN (B.#table_pk_1#)) AND A.#table_field# IN (''#num3#'')) [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_PBA_MDFCSGMTCODE', '�������Ķκʹ������Ķα�Ӧ����һ��', '�������Ķκʹ������Ķα�Ӧ����һ��', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_1# B ON A.#table_pk# = B.#table_pk# LEFT JOIN #table_2# C ON A.#table_pk# = C.#table_pk# LEFT JOIN #table_3# D ON A.#table_pk# = D.#table_pk# LEFT JOIN #table_4# E ON A.#table_pk# = E.#table_pk# WHERE ((A.#table_field# = (''#num1#'') AND A.#table_pk# IS NULL) OR (A.#table_field# = (''#num2#'') AND B.#table_pk# IS NULL) OR (A.#table_field# = (''#num3#'') AND C.#table_pk# IS NULL) OR (A.#table_field# = (''#num4#'') AND D.#table_pk# IS NULL) OR (A.#table_field# = (''#num5#'') AND E.#table_pk# IS NULL)) [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHAR_MDFCSGMTCODEJ_RPTDATE', '�������¶ȱ�����Ϣ��ʱ����������Ϣ����������ͬ�������¼���Ϣ��¼����ü�¼��Ӧ������', '�������¶ȱ�����Ϣ��ʱ����������Ϣ����������ͬ�������¼���Ϣ��¼����ü�¼��Ӧ������', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE (A.#table_field_1# = ''#num1#'' AND (SELECT COUNT(#table_pk#) FROM #table_name# WHERE #table_field_1# = ''#num2#'' AND #table_field# = A.#table_field#) > 0) [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('PDE_GR_REPYMT_INF_SGMT_TEN_IS_NOT_NULL', '����ʱ��˵������Ϊ20-�˻��ر�,30-�ڱ����α仯,40-�弶�������ʱ������Ӧ�����ڱ�������Ϣ��', '����ʱ��˵������Ϊ20-�˻��ر�,30-�ڱ����α仯,40-�弶�������ʱ������Ӧ�����ڱ�������Ϣ��', 'SELECT DISTINCT A.#table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_name_B2# B ON A.#table_pk#=B.#table_pk# WHERE A.#table_field# IN(#A_CODE2#) AND B.#table_pk# IS NULL [and #validate_date# = ''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('PDC_RLT_REPYMT_INF_SGMT_IS_NOT_NULL', '����ʱ��˵������Ϊ10-�¿���/�״��ϱ��ҷ�������ʽΪ1-��֤ʱ��Ӧ������ػ�����������Ϣ��', '����ʱ��˵������Ϊ10-�¿���/�״��ϱ��ҷ�������ʽΪ1-��֤ʱ��Ӧ������ػ�����������Ϣ��', 'SELECT DISTINCT C.#table_pk#,''''business_pk, C.#master_table_id# as master_table_id FROM #table_name_A# A LEFT JOIN #table_name_B# B ON A.#master_table_id#=B.#master_table_id# LEFT JOIN  #table_name# C ON A.#master_table_id#=C.#master_table_id# WHERE A.#table_field_A_CODE#=#A_CODE3# AND C.#table_field#=#C_MODE# AND B.#master_table_id# IS NULL [and #validate_date# = ''#currentDate#''] {and C.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('PDE_GR_REPYMT_INF_SGMT_FIFTY_IS_NULL', '����ʱ��˵������Ϊ50-������Ϣ�仯ʱ���������ڱ�������Ϣ��', '����ʱ��˵������Ϊ50-������Ϣ�仯ʱ���������ڱ�������Ϣ��', 'SELECT B.#table_pk#,''''business_pk ,#table_field#, B.#master_table_id# as master_table_id FROM #table_name_A# A LEFT JOIN #table_name# B ON A.#table_name_A_ID#=B.#table_name_A_ID# WHERE A.#table_field_A# IN (#A_CODE4#) AND B.#master_table_id# IS NOT NULL [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('OPEN_DAT_DUE_DATE', '��������Ӧ�����ڵ�������', '��������Ӧ�����ڵ�������', 'SELECT A.#table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE #table_field#>#table_field_DUE# [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('DATA_IS_NOT_NULL', '����˻�״̬Ϊ2-�رգ����˻��ر����ڲ���Ϊ��ֵ', '����˻�״̬Ϊ2-�رգ����˻��ر����ڲ���Ϊ��ֵ', 'SELECT #table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE #table_field_A#=#A_STATUS# AND #table_field# IS NULL [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('ARLP_TYPE_is_not_null', '����������������Ϊ2-��������ʱ��������־����֤��ͬ��Ų�ӦΪ��', '����������������Ϊ2-��������ʱ��������־����֤��ͬ��Ų�ӦΪ��', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_field#=#table_field_TYPE# AND (#table_field_WARTY_SIGN# IS NULL OR #table_field_MAX_GUAR_MCC# IS NULL) [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_EDC_ARLPTYPE_AND_ARLPAMT', '��������������Ϊ1-��ͬ�����ʱ���������ν��Ϊ�գ�������Ϊ��ֵ', '��������������Ϊ1-��ͬ�����ʱ���������ν��Ϊ�գ�������Ϊ��ֵ', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE ((A.#table_field# = (#num1#) AND  A.#table_field_1# is not null) OR (A.#table_field# IN (#num2#) AND  A.#table_field_1# is null)) [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_EDC_ARLPTYPE_AND_WARTYSIGN_MAXGUARMCC', '��������������Ϊ2-��֤��ʱ��������־,��֤��ͬ��ű��벻��Ϊ��ֵ', '��������������Ϊ2-��֤��ʱ��������־,��֤��ͬ��ű��벻��Ϊ��ֵ', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE(A.#table_field# = (''#num1#'') AND (A.#table_field_1# IS NULL OR A.#table_field_2# IS NULL)) [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_EDA_RPTDATECODE20_AND_ACCTSTATUS', '���ҽ�������ʱ��˵������Ϊ20-�˻��ر� ʱ���˻�״̬Ϊ21-�ر�', '���ҽ�������ʱ��˵������Ϊ20-�˻��ر� ʱ���˻�״̬Ϊ21-�ر�', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_1# B ON A.#table_pk# = B.#table_pk# WHERE (A.#table_field# = ''#num1#'' AND B.#table_field_1# NOT IN (#num2#)) [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''} ', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_EDB_ACCTTYPEC1_AND_BUSILINES', '���˻�����ΪC1ʱ���Ŵ�ҵ�����ֻ��Ϊ51-�ʲ�����,41-���', '���˻�����ΪC1ʱ���Ŵ�ҵ�����ֻ��Ϊ51-�ʲ�����,41-���', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_1# B ON A.#table_pk_1# = B.#table_pk_1# WHERE (B.#table_field_1# = ''#num1#'' AND A.#table_field# NOT IN (#num2#)) [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_EDH_TRANAMT_AND_LOANAMT', '���׽��С�ڵ��ڽ����', '���׽��С�ڵ��ڽ����', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_1# B ON A.#table_pk_1# = B.#table_pk_1# WHERE (A.#table_field# > B.#table_field_1#) [AND #validate_date# = ''#currentDate#''] {AND A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('RPT_DATE_CODE_TEN_IS_NOT_NULL', '����ʱ��˵������Ϊ10-�¿���/�״��ϱ�������Ӧ�����˻�������Ϣ�Ρ��ڱ�������Ϣ��', '����ʱ��˵������Ϊ10-�¿���/�״��ϱ�������Ӧ�����˻�������Ϣ�Ρ��ڱ�������Ϣ��', 'SELECT DISTINCT A.#table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN  #table_name_B# B ON A.#table_pk#=B.#table_pk# LEFT JOIN #table_name_C# C ON A.#table_pk#=C.#table_pk#
WHERE A.#table_field#=#A_CODE# AND (B.#table_pk# IS NULL OR C.#table_pk# IS NULL) [and #validate_date# = ''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('table_is_not_null', '����ʱ��˵������Ϊ10-�����ͻ�/�״��ϱ������ٰ��������ſ���Ϣ�Ρ�������Ϣ�Ρ���ס��ַ�Ρ�ͨѶ��ַ�Ρ�������Ϣ�Ρ�ְҵ��Ϣ��', '����ʱ��˵������Ϊ10-�����ͻ�/�״��ϱ������ٰ��������ſ���Ϣ�Ρ�������Ϣ�Ρ���ס��ַ�Ρ�ͨѶ��ַ�Ρ�������Ϣ�Ρ�ְҵ��Ϣ��', 'SELECT DISTINCT A.#table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_name_B# B ON A.#table_pk#=B.#table_pk# LEFT JOIN #table_name_C# C ON A.#table_pk#=C.#table_pk# LEFT JOIN #table_name_D# D ON A.#table_pk#=D.#table_pk# LEFT JOIN #table_name_E# E ON A.#table_pk#=E.#table_pk#
LEFT JOIN #table_name_F# F ON A.#table_pk#=F.#table_pk# LEFT JOIN #table_name_G# G ON A.#table_pk#=G.#table_pk# WHERE A.#table_field#=#a_field# AND (B.#table_pk# IS NULL OR C.#table_pk# IS NULL OR D.#table_pk# IS NULL OR E.#table_pk# IS NULL OR F.#table_pk# IS NULL OR G.#table_pk# IS NULL) [and #validate_date# = ''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('FIDLD_IS_NULL_OR_NOT_NULL', '��ҵ״��Ϊ11��13��17��21��24��91ʱ����λ���ơ����ʡ�������ҵ����ϸ��ַ�����ڵ��ʱࡢ���ڵ������������绰��ְҵ��ְ��ְ�ƺͱ���λ������ʼ��ݱ������', '��ҵ״��Ϊ11��13��17��21��24��91ʱ����λ���ơ����ʡ�������ҵ����ϸ��ַ���ʱࡢ���ڵ������������绰��ְҵ��ְ��ְ�ƺ͹�����ʼ��ݱ�����֣���ҵ״��Ϊ��������Ĵ��룬����������ܳ��֡�', 'SELECT A.#table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE (#table_field# IN (#a_field2#) AND (#table_field_a1# IS NULL OR #table_field_a2# IS NULL OR #table_field_a3# IS NULL OR #table_field_a4# IS NULL OR #table_field_a5# IS NULL OR #table_field_a6# IS NULL OR #table_field_a7# IS NULL OR #table_field_a8# IS NULL OR #table_field_a9# IS NULL OR #table_field_a10# IS NULL OR #table_field_a11# IS NULL)) OR (#table_field# NOT IN (#a_field2#) AND (#table_field_a1# IS NOT NULL OR #table_field_a2# IS NOT NULL OR #table_field_a3# IS NOT NULL OR #table_field_a4# IS NOT NULL OR #table_field_a5# IS NOT NULL OR #table_field_a6# IS NOT NULL OR #table_field_a7# IS NOT NULL OR #table_field_a8# IS NOT NULL OR #table_field_a9# IS NOT NULL OR #table_field_a10# IS NOT NULL OR #table_field_a11# IS NOT NULL)) [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('FIDLD2_IS_NULL_OR_NOT_NULL', '����״��Ϊ�ѻ顢���顢�ٻ顢����ʱ����ż��������ż֤�����͡���ż֤�����롢��ż��ϵ�绰����ż������λ�������', '����״��Ϊ�ѻ顢���顢�ٻ顢����ʱ����ż��������ż֤�����͡���ż֤�����롢��ż��ϵ�绰����ż������λ������֣�', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE (#table_field# IN(#a2_field#) AND (#table_field2_a1# IS NULL OR #table_field2_a2# IS NULL OR #table_field2_a3# IS NULL OR  #table_field2_a4# IS NULL OR #table_field2_a5# IS NULL)) OR (#table_field# NOT IN(#a2_field#) AND (#table_field2_a1# IS NOT NULL OR #table_field2_a2# IS NOT NULL OR #table_field2_a3# IS NOT NULL OR #table_field2_a4# IS NOT NULL OR #table_field2_a5# IS NOT NULL)) [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('one_not_null', '��ż֤�����͡���ż֤����������֮һ��Ϊ��ʱ����һ��Ӧ��Ϊ��', '��ż֤�����͡���ż֤����������֮һ��Ϊ��ʱ����һ��Ӧ��Ϊ��', 'SELECT #table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE (#table_field# IS NOT NULL AND #table_field4_a1# IS NULL) OR (#table_field4_a1# IS NOT NULL AND #table_field# IS NULL) [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('EDU_LEVEL_ACA_DEGREE_one', '��ѧ��Ϊ30-��ר��40-��ר��ְ�ߡ���У��70-���С�80-Сѧʱ��ѧλֻ��Ϊ5-�޻�9-δ֪', '��ѧ��Ϊ30-��ר��40-��ר��ְ�ߡ���У��70-���С�80-Сѧʱ��ѧλֻ��Ϊ5-�޻�9-δ֪', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_field# IN(#a5_field1#) AND #table_field5_a1# NOT IN(#a5_field2#) [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_jd_is_one12', '���� D1/R1/R4 �˻�����Ϣ��¼�С���ǰ���ڱ��𡱱���С�ڵ��ڡ���ǰ�����ܶ�', '���� D1/R1/R4 �˻�����Ϣ��¼�С���ǰ���ڱ��𡱱���С�ڵ��ڡ���ǰ�����ܶ�', 'SELECT A.#table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A, #table_name_B# B WHERE A.#table_field_B_PK#=B.#table_field_B_PK# AND B.#table_field1# IN(#field1#) AND #table_field#>#table_field2# [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_jd_is_one13', '�����˻�״̬��Ϊ��3-�رա�/��4-������������ӦΪ 0', '�����˻�״̬��Ϊ��3-�رա�/��4-������������ӦΪ 0', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_field# IN(#field1#) AND #table_field1# !=#field2# [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_jd_is_one14', '���˻�״̬���͡���ǰ����״̬����Ҫ����һ�£����˻�״̬��Ϊ��3-�رա�/��4-������ʱ������ǰ����״̬��ӦΪ��C-���塱/��C-����������G-����', '���˻�״̬���͡���ǰ����״̬����Ҫ����һ�£����˻�״̬��Ϊ��3-�رա�/��4-������ʱ������ǰ����״̬��ӦΪ��C-���塱/��C-����������G-����', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_field# IN(#field1#) AND #table_field2# NOT IN(#field2#) [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_jd_is_one15', '�����˻��ر����ڡ������Ϊ�գ����˻��ر����ڡ�Ӧ�����ڡ�����/Ӧ�����ա������һ��ʵ�ʻ������ڡ����弶�����϶�����', '�����˻��ر����ڡ������Ϊ�գ����˻��ر����ڡ�Ӧ�����ڡ�����/Ӧ�����ա������һ��ʵ�ʻ������ڡ����弶�����϶�����', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_field# IS NOT NULL AND (#table_field#<#table_field1# OR #table_field#<#table_field2# OR #table_field#<#table_field3#) [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_jd_is_one16', '�����˻�״̬��Ϊ��3-�رա�/��4-�����������˻��ر����ڡ�����Ϊ��ֵ', '�����˻�״̬��Ϊ��3-�رա�/��4-������/��2-�����������˻��ر����ڡ�����Ϊ��ֵ', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_field# IN(#field1#) AND #table_field1# IS NULL [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_jd_is_one17', '���˻�״̬Ϊ���رա�/��������ʱ������ǰ�����ܶ������ǰ����������ӦΪ 0', '���˻�״̬Ϊ���رա�/��������ʱ������ǰ�����ܶ������ǰ����������ӦΪ 0', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_field# IN(#field1#) AND (#table_field1# !=#field2# OR #table_field2#!=#field2#) [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_jd_is_one18', '�����ڶ����Ч���ڡ�Ӧ�����ڡ����ڶ�ȵ�������', '�����ڶ����Ч���ڡ�Ӧ�����ڡ����ڶ�ȵ�������', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_field#>#table_field1# [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_jd_is_one19', '����ǰ����״̬��ֻ��Ϊ��N-����', '����ǰ����״̬��ֻ��Ϊ��N-����', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_field# != #field1# [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_jd_is_one20', '�����˻��ر����ڡ������Ϊ�գ����˻��ر����ڡ�Ӧ�����ڡ����һ��ʵ�ʻ������ڡ������弶�����϶�����', '�����˻��ر����ڡ������Ϊ�գ����˻��ر����ڡ�Ӧ�����ڡ����һ��ʵ�ʻ������ڡ������弶�����϶�����', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_field# IS NOT NULL AND (#table_field#<#table_field1# OR #table_field#<#table_field2#) [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_jd_is_one21', '�����˻�״̬��Ϊ��2-������������ӦΪ 0', '�����˻�״̬��Ϊ��2-������������ӦΪ 0', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_field#=#field1# AND #table_field1# !=#field2# [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_jd_is_one6', '���� R2 �˻�������ǰ����״̬��Ϊ��*-����δʹ�ö���Ҳ���Ҫ���ʱ����ʵ�ʻ��������ӦΪ��ֵ', '���� R2 �˻�������ǰ����״̬��Ϊ��*-����δʹ�ö���Ҳ���Ҫ���ʱ����ʵ�ʻ��������ӦΪ��ֵ', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_field#=#field1# AND #table_field1# IS NOT NULL [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_jd_is_one7', '����/Ӧ�����ա��롰�·ݡ��е��ꡢ�±��뱣��һ��', '����/Ӧ���������·��е��ꡢ�±��뱣��һ��', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE substr(date_format(#table_field#,''%Y-%m-%d %H:%i:%s''),0,7) != #table_field1# [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_jd_is_one8', '�˻�״̬Ϊ41-���ˣ���������϶����򣬵ȴ�������/51-���ˣ���������϶����򣬵ȴ���������42-���ˣ��Ѻ�����/52-���ˣ��Ѻ�����ʱ����ǰ�����ܶ��Ϊ 0', '�˻�״̬Ϊ41-���ˣ���������϶����򣬵ȴ�������/51-���ˣ���������϶����򣬵ȴ���������42-���ˣ��Ѻ�����/52-���ˣ��Ѻ�����ʱ����ǰ�����ܶ��Ϊ 0', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_field# IN(#field1#) AND #table_field1# = #field2# [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_A_THREEMARK_AND_MNGMTORGCOD_OTHERNULL', '������������ʱ���������н�������Ϣ���������ʶ����ҵ�����������롱��������������֡�', '������������ʱ���������н�������Ϣ���������ʶ����ҵ�����������롱��������������֡�', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE (A.#table_field# = ''#num1#'' AND (A.#table_field_1# IS NOT NULL OR A.#table_field_2# IS NOT NULL OR A.#table_field_3# IS NOT NULL OR A.#table_field_4# IS NOT NULL OR A.#table_field_5# IS NOT NULL OR A.#table_field_6# IS NOT NULL OR A.#table_field_7# IS NOT NULL OR A.#table_field_8# IS NOT NULL OR A.#table_field_9# IS NOT NULL OR A.#table_field_10# IS NOT NULL OR A.#table_field_11# IS NOT NULL OR A.#table_field_12# IS NOT NULL OR A.#table_field_13# IS NOT NULL OR A.#table_field_14# IS NOT NULL OR A.#table_field_15# IS NOT NULL OR A.#table_field_16# IS NOT NULL )) [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_MDFCSGMTCODEC_RPTDATE', '��Ϣ��������Ӧ�����ڿ����������Ϣ��������', '��Ϣ��������Ӧ�����ڿ����������Ϣ��������', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE (A.#table_field_1# = ''#num1#'' AND A.#table_field# < (SELECT MAX(#table_field#) FROM #table_name# WHERE #table_field_1# = ''#num1#'' AND #table_pk# NOT IN (A.#table_pk#))) [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('value_is_false', 'ֵ����ȷ', '#m1#=#m2#-#m3#', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_field# !=(#table_field_REVENUE#-#table_field_EXPENDITURE#) [and #validate_date# =''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('value_is_false_2', 'ֵ����ȷ', '#m4#=#m5#+#m6#', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_field# != (#table_field_CURRENT_ASSETS#+#table_field_NON_CURRENT_ASSETS#) [and #validate_date# =''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('value_is_false_3', '�ʲ��ܼ�=��ծ�;��ʲ��ܼ�', '#m7#=#m8#', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_field# != #table_field_TOTAL_LIABILITIES_AND_NET_ASSE# [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('value_is_false_4', '��ծ��������Ȩ���ܼ�=��ծ�ϼ�+�����ɶ�Ȩ��+������Ȩ��ϼ�', '#m9#=#m10#+#m11#+#m12#', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_field# != (#table_field_CURRENT_ASSETS1#+#table_field_NON_CURRENT_ASSETS1# + #table_field_TOTAL_EQUITY1#) [and #validate_date# =''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('value_is_false_5', '�ֽ��ֽ�ȼ��ﾻ���Ӷ�Ｏ��������ֽ�����������ʱ䶯���ֽ��Ӱ�죫��Ӫ��������ֽ��������Ͷ�ʻ�������ֽ���������', '#m13#=#m14#+#m15#+#m16#+#m17#', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_field# != (#table_field_CURRENT_ASSETS2#+#table_field_NON_CURRENT_ASSETS2# + #table_field_TOTAL_EQUITY2#+#table_field_FROM_INVESTING2#) [and #validate_date# =''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('Information_section_is_null_not', '�ؼ���Ϣ�α�����֣���ҵ����Э���¼����ʱ�������κͶ����Ϣ�α�����֣�', '#m18#������֣�������#m18#�����±��������', 'SELECT A.#table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_name_EGC_CREDIT_LIM_SGMT# B ON A.#table_pk#=B.#table_pk# WHERE A.#table_field#=''#INF_REC_TYPE001#'' AND #table_pk_EGC_CREDIT_LIM_SGMT_ID# IS NULL [and #validate_date# = ''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('a_not_null_another_not_null', '�����޶��š������޶�����֮һ��Ϊ��ʱ����һ��Ӧ��Ϊ��', '��#m22#��#m23#����֮һ��Ϊ��ʱ����һ��Ӧ��Ϊ��', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE (#table_field_CREDIT_REST# is NULL AND #table_field# is not NULL) OR (#table_field# IS NULL AND #table_field_CREDIT_REST# IS NOT NULL) [and #validate_date# =''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('ID_NUM_and_ID_TYPE_not_repeat_02', '�����������빲ͬ���������겻����ͬ', '#m26#��#m27#������ͬ', 'SELECT B.#table_pk#,''''business_pk, B.#master_table_id# as master_table_id FROM #table_name_EGA_CTRCT_BS_SGMT# A ,#table_name# B WHERE A.#table_field_SGMT_ID#=B.#table_field_SGMT_ID# AND #table_field_TYPE#=#table_field_IDTYPE# AND #table_field_NUM# = #table_field# AND BRER_TYPE=''2'' [and #validate_date# =''#currentDate#''] {and B.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('COUNT_More_than_zero', '����Ӧ���� 0', '#m31#����Ӧ����#m32#', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_pk# IN(SELECT #table_pk# FROM #table_name_EFA_SGMT1# A LEFT JOIN #table_name# B ON A.#table_field_EFA_BS_ID1#=B.#table_field_EFA_BS_ID1# LEFT JOIN #table_name_EFD_SGMT1# C ON A.#table_field_EFA_BS_ID1#=C.#table_field_EFA_BS_ID1#  GROUP BY #table_pk# HAVING  COUNT(#table_field_EFD_SGMT_ID1#)<=0) AND #table_field#=''#GUAR_TYPE1#'' [and #validate_date# =''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('mingxiduan_is_not_null_01', '��ģ������У����ҵ����˻��ж���˻����ͻ򵥸��˻�������ĳһ������ʱ��ʱӦ�ð����ĵ�����ϸ��', '����ʱ��˵������Ϊ#ms1#���˻�����Ϊ#ms2#Ӧ����#ms3#', 'SELECT A.#table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_name_A_not_null# B ON A.#table_pk#=B.#table_pk# WHERE A.#table_field# IN (#table_field_code#) AND A.#table_field_accttype# IN (#accttype#) AND B.#table_field_A_pk# IS NULL [and #validate_date# =''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('mingxiduan_is_not_null_02', '��ģ������У����ҵ����˻��ж���˻����ͻ򵥸��˻�������ĳһ������ʱ��ʱӦ�ð�����������ϸ��', '����ʱ��˵������Ϊ#ms4#���˻�����Ϊ#ms5#Ӧ����#ms6#', 'SELECT A.#table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_name_A1_not_null# B ON A.#table_pk#=B.#table_pk# LEFT JOIN #table_name_B1_not_null# C ON A.#table_pk#=C.#table_pk# WHERE (A.#table_field# IN (#table_field_code1#) AND A.#table_field_accttype1# IN (#accttype1#)) AND (B.#table_field_A1_pk_not_null# IS NULL OR C.#table_field_B1_pk_not_null# IS NULL) [and #validate_date# =''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('mingxiduan_is_not_null_03', '��ģ������У����ҵ����˻��ж���˻����ͻ򵥸��˻�������ĳһ������ʱ��ʱ�ҷִηſ��ʶΪ�������߶��ʱӦ�ð����ĵ�����ϸ��', '����ʱ��˵������Ϊ#ms7#���˻�����Ϊ#ms8#�ҷִηſ��ʶΪ#ms9#����Ӧ����#ms10#��', 'SELECT #table_pk#,''''business_pk, B.#master_table_id# as master_table_id FROM #table_name_A2_not_null# A LEFT JOIN #table_name# B ON A.#table_field_A2_PK#=B.#table_field_A2_PK# LEFT JOIN #table_name_B2_not_null# C ON A.#table_field_A2_PK#=C.#table_field_A2_PK# WHERE (A.#table_field_A2_code2# IN(#table_field_code2#) AND A.#table_field_accttype2# IN (#accttype2#) AND B.FLAG IN(#flag2#)) AND C.#table_field_B2_pk_not_null# IS NULL [and #validate_date# =''#currentDate#''] {and B.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('grsx_I2200A01', '��������֤�����͡�����������֤�����롱�롰��ͬ��������ݱ�ʶ���͡�������ͬ��������ݱ�ʶ���롱������ͬ', '��������֤�����͡�����������֤�����롱�롰��ͬ��������ݱ�ʶ���͡�������ͬ��������ݱ�ʶ���롱������ͬ', 'SELECT #table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM I_CTRCT_BS A LEFT JOIN #table_name# B ON A.PCA_CTRCT_BS_SGMT_ID=B.PCA_CTRCT_BS_SGMT_ID WHERE A.ID_TYPE=B.CERT_REL_ID_TYPE AND A.ID_NUM=B.#table_field# AND BRER_TYPE=''1'' [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('mingxiduan_is_not_null_05', '��ģ������ĳ������ʱ�㲻���õ����˻����ͻ����˻�����', '�˻�����Ϊ#ms14#��������#ms15#�ı���ʱ��', 'SELECT A.#table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE A.#table_field# IN (#table_field_code4#) AND A.#table_field_accttype4# IN (#accttype4#) [and #validate_date# =''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('ID_TYPE_ID_NUM_is_not_the_same', 'ծ�������������������겻����ͬ', 'ծ�������������������겻����ͬ', 'SELECT B.#table_pk#,''''business_pk, B.#master_table_id# as master_table_id FROM #table_name_A# A LEFT JOIN #table_name# B ON A.#table_name_A_ID#=B.#table_name_A_ID# WHERE A.#table_field_ID_TYPE#=B.#table_field_CERT_TYPE# AND A.#table_field_ID_NUM#=B.#table_field# AND INFO_ID_TYPE=''1'' [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('mingxiduan_is_not_null_04', '��ģ������У����ҵ����˻��ж���˻����ͻ򵥸��˻�������ĳһ������ʱ��ʱӦ�ð�����������ϸ��', '����ʱ��˵������Ϊ#ms11#���˻�����Ϊ#ms12#Ӧ����#ms13#', 'SELECT A.#table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_name_A3_not_null# B ON A.#table_pk#=B.#table_pk# LEFT JOIN #table_name_B3_not_null# C ON A.#table_pk#=C.#table_pk# LEFT JOIN #table_name_C3_not_null# D ON A.#table_pk#=D.#table_pk# WHERE (A.#table_field# IN(#table_field_code3#) AND A.#table_field_accttype3# IN (#accttype3#)) AND (B.#table_field_A3_PK_not_null# IS NULL OR C.#table_field_B3_PK_not_null# IS NULL OR D.#table_field_C3_PK_not_null# IS NULL) [and #validate_date# =''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_PCA_MDFC_SGMT_CODE', '�������Ķε����ݺʹ������Ķα�Ӧ����һ��', '�������Ķε����ݺʹ������Ķα�Ӧ����һ��', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_1# B ON A.#table_pk# = B.#table_pk# LEFT JOIN #table_2# C ON A.#table_pk# = C.#table_pk# WHERE ((A.#table_field# = (''#num1#'') AND A.#table_pk# IS NULL) OR (A.#table_field# = (''#num2#'') AND B.#table_pk# IS NULL) OR (A.#table_field# = (''#num3#'') AND C.#table_pk# IS NULL)) [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('DEL_REC_CODE_is_null', '��ɾ����ҵ���ʶ������ڿ��д���', '��ɾ����ҵ���ʶ������ڿ��д���', 'SELECT EEAIED.#table_pk#,''''business_pk, EEAIED.#master_table_id# as master_table_id FROM #table_name# EEAIED WHERE #table_field# NOT IN (SELECT #table_field_ACCT_CODE# FROM #table_name_EDA# WHERE BUSINESS_STATES =''11'') [and #validate_date# =''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('ACCT_CODE_is_not_null', '������ҵ���ʶ������ڿ��д���', '������ҵ���ʶ������ڿ��д���', 'SELECT #table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE #table_field_INF_REC_TYPE1#=''#inf_rec_type2#'' AND #table_field# NOT IN (SELECT #table_field# FROM #table_name# WHERE BUSINESS_STATES =''11'' AND #table_field_INF_REC_TYPE1#=''#inf_rec_type3#'') [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('ACCT_TYPE_is_the_same', '��������¼�����εġ��˻����͡�Ӧ����С��˻����͡�һ��', '��������¼�����εġ��˻����͡�Ӧ����С��˻����͡�һ��', 'SELECT #table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A,(SELECT ACCT_CODE,ACCT_TYPE FROM #table_name# WHERE INF_REC_TYPE=''#inf_rec_type5#'' AND BUSINESS_STATES = ''11'') B WHERE A.ACCT_CODE=B.ACCT_CODE AND INF_REC_TYPE=''#inf_rec_type6#'' AND A.ACCT_TYPE != B.ACCT_TYPE [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('NW_BNES_CODE_not_repeat', 'ԭҵ���ʶ�����ҵ���ʶ�벻����ͬ', 'ԭҵ���ʶ�����ҵ���ʶ�벻����ͬ', 'SELECT B.#table_pk#,''''business_pk,B.#table_field#, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_name# B ON (A.#table_field_OD_BNES_CODE#=B.#table_field# AND A.#table_pk#=B.#table_pk#) WHERE A.#table_field_OD_BNES_CODE#=B.#table_field# [and #validate_date# = ''#currentDate#''] {and B.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('ID_NUM_and_ID_TYPE_not_repeat', '������ػ��������˶�ʱ���������������������겻����ͬ', '#m24#��#m25#������ͬ', 'SELECT DISTINCT B.#table_pk#,''''business_pk, B.#master_table_id# as master_table_id FROM (SELECT ID_TYPE, ID_NUM, #table_field_ACCT_CODE1#,#table_pk_SGMT_ID3# FROM #table_name_BS_SGMT3# WHERE INF_REC_TYPE=''#inf_rec_type7#'' AND BUSINESS_STATES=''11'') A, (SELECT B.#table_field_CERT_TYPE# ,B.#table_field#,A.ID_NUM,A.ID_TYPE,B.#table_pk_SGMT_ID3#,A.#table_pk_SGMT_ID3# AS EDA_ACCT_BS_SGMT_ID1,A.#table_field_ACCT_CODE1#,A.MDFC_SGMT_CODE,B.#table_pk# FROM #table_name_BS_SGMT3# A,#table_name# B WHERE A.#table_pk_SGMT_ID3#=B.#table_pk_SGMT_ID3# AND A.MDFC_SGMT_CODE=''#mdfc_sgmt_code#'') B WHERE (A.#table_field_ACCT_CODE1#=B.#table_field_ACCT_CODE1# AND A.ID_NUM=#table_field# AND A.ID_TYPE=B.#table_field_CERT_TYPE# ) OR (B.#table_pk_SGMT_ID3#=B.EDA_ACCT_BS_SGMT_ID1 AND B.#table_field_CERT_TYPE#=B.ID_TYPE AND B.#table_field#=B.ID_NUM AND B.MDFC_SGMT_CODE=''#mdfc_sgmt_code#'') [and #validate_date# =''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('RPT_DATE_is_repeat', '����������ʱ�������ĸ��������¼����Ϣ��������Ӧ���ڿ�����Ӧ��Ϣ�����µ���Ϣ��������', '����������ʱ�������ĸ��������¼����Ϣ��������Ӧ���ڿ�����Ӧ��Ϣ�����µ���Ϣ��������', 'SELECT A.#table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A, (SELECT ACCT_CODE, #table_pk#, MAX(#table_field#) AS RPT_DATE_max FROM #table_name# WHERE INF_REC_TYPE=''#inf_rec_type8#'' AND BUSINESS_STATES=''11'' GROUP BY #table_pk#,ACCT_CODE) B WHERE A.ACCT_CODE=B.ACCT_CODE AND A.MDFC_SGMT_CODE=''#mdfc_sgmt_code2#'' AND A.#table_field#!=B.RPT_DATE_max [and #validate_date# = ''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('ST_AND_ET_IS_NOT_NULL', '��ɾ����ʼ����,��ɾ������ֹ���ڲ���ͬʱΪ��ֵ', '��ɾ����ʼ����,��ɾ������ֹ���ڲ���ͬʱΪ��ֵ', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id from #table_name# WHERE #table_field# IS NULL AND #table_field_DEL_END_DATE# IS NULL [and #validate_date# =''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('ED_No_greater_than_SD', '��ɾ����ʼ���ڱ���С�ڵ��ڴ�ɾ���Ľ�������', '#m19#����#m21##m20#', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_field_DEL_START_DATE# IS NOT NULL AND #table_field#<#table_field_DEL_START_DATE# [and #validate_date# =''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('Two_standard_not_repeat', '������ݱ�ʶ������ݱ�ʶ���벻����ȫ��ͬ', '������ݱ�ʶ������ݱ�ʶ���벻����ȫ��ͬ', 'SELECT ECA1.#table_pk#,''''business_pk, ECA1.#master_table_id# as master_table_id FROM #table_name# ECA1,#table_name# ECA2 WHERE ECA1.#table_pk#=ECA2.#table_pk# AND ECA1.#table_field_ENT_CERT_TYPE#=ECA2.#table_field_ASSO_ENT_CERT_TYPE# AND ECA1.#table_field_ENT_CERT_NUM#=ECA2.#table_field# [and #validate_date# =''#currentDate#''] {and ECA1.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('mingxiduan_is_null_01', '��ģ������У����ҵ����˻��ж���˻����ͻ򵥸��˻�������ĳһ������ʱ��ʱ��Ӧ�ð�����1����ϸ��', '����ʱ��˵������Ϊ#ms16#�˻�����Ϊ#ms17#����Ӧ����#ms18#', 'SELECT #table_pk#,''''business_pk ,#table_field#, B.#master_table_id# as master_table_id FROM #table_name_A_null# A LEFT JOIN #table_name# B ON A.#table_field_A_pk_null#=B.#table_field_A_pk_null# WHERE A.#table_field_A_rptdatecode_not# IN(#rptdatecode_not#) AND A.#table_field_A_accttype_not# IN(#accttype_not#) AND (#table_pk# IS NOT NULL) [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('mingxiduan_is_null_02', '��ģ������У����ҵ����˻��ж���˻����ͻ򵥸��˻�������ĳһ������ʱ��ʱ�ҷִηſ��ʶΪ�������߶��ʱ��Ӧ�ð����ĵ�����ϸ��', '����ʱ��˵������Ϊ#ms19#�˻�����Ϊ#ms20#��#ms21#����Ӧ����#ms22#', 'SELECT #table_pk#,''''business_pk, #table_field#, C.#master_table_id# as master_table_id FROM #table_name_A2_null# A LEFT JOIN #table_name_B2_null# B ON A.#table_field_A2_pk_null#=B.#table_field_A2_pk_null# LEFT JOIN #table_name# C ON A.#table_field_A2_pk_null#=C.#table_field_A2_pk_null# WHERE A.#table_field_A2_rptdatecode_not# IN(#rptdatecode_not2#) AND B.#table_field_B2_flag_not# IN(#flag_not2#) AND A.#table_field_A2_accttype_not# IN(#accttype_not2#) AND (C.#table_pk# IS NOT NULL) [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CPN_TYPE_OCCUPATION_one', '����λ����Ϊ30-������ҵ��40-���塢˽Ӫ��ҵ��50-����������������ҵ����Ӫ��ҵ���������ȣ�ʱ��ְҵ����Ϊ0-���һ��ء���Ⱥ��֯����ҵ����ҵ��λ�����ˡ�X-���ˡ�', '����λ����Ϊ30-������ҵ��40-���塢˽Ӫ��ҵ��50-����������������ҵ����Ӫ��ҵ���������ȣ�ʱ��ְҵ����Ϊ0-���һ��ء���Ⱥ��֯����ҵ����ҵ��λ�����ˡ�X-���ˡ�', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_field# IN(#a6_field1#) AND #table_field6_a1# IN(#a6_field2#) [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('NUM_and_TYPE_THE_SAME3', '֤�����͡�֤�����벻����������е�֤�����͡�֤��������ȫ��ͬ', '֤�����͡�֤�����벻����������е�֤�����͡�֤��������ȫ��ͬ', 'SELECT B.#table_pk#,''''business_pk, B.#master_table_id# as master_table_id FROM #table_name_A# A LEFT JOIN #table_name# B ON A.#table_field_A_ID#=B.#table_field_A_ID# WHERE A.#table_field7_a1#=B.#table_field# AND A.#table_field7_a2#=B.#table_field7_b2# [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_pb_table_one1', '������ʱ��˵������Ϊ30-�¶Ƚ���ʱ�����������⣬���ٻ�Ӧ�����¶ȱ�����Ϣ�Σ��˻����Ͳ���ΪC1��', '������ʱ��˵������Ϊ#ms_field1#ʱ�����������⣬���ٻ�Ӧ����#ms_field2#���˻����Ͳ���Ϊ#ms_field3#', 'SELECT A.#table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_name2_B# B ON A.#table_pk#=B.#table_pk# WHERE ((#table_field# IN(#a1_field1#) AND B.#table_pk# IS NULL) OR (A.#a1_field_type# IN(#a1_field2#) AND #table_field# IN(#a1_field1#))) [and #validate_date# = ''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_PBA_MDFC_SGMT_CODE', '�������Ķε����ݺʹ������Ķα�Ӧ����һ��', '�������Ķε����ݺʹ������Ķα�Ӧ����һ��', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_1# B ON A.#table_pk# = B.#table_pk# LEFT JOIN #table_2# C ON A.#table_pk# = C.#table_pk# LEFT JOIN #table_3# D ON A.#table_pk# = D.#table_pk# LEFT JOIN #table_4# E ON A.#table_pk# = E.#table_pk# LEFT JOIN #table_5# F ON A.#table_pk# = F.#table_pk# LEFT JOIN #table_6# G ON A.#table_pk# = G.#table_pk# LEFT JOIN #table_7# H ON A.#table_pk# = H.#table_pk# LEFT JOIN #table_8# I ON A.#table_pk# = I.#table_pk# LEFT JOIN #table_9# J ON A.#table_pk# = J.#table_pk# WHERE ((A.#table_field# = (''#num1#'') AND A.#table_pk# IS NULL) OR (A.#table_field# = (''#num2#'') AND B.#table_pk# IS NULL) OR (A.#table_field# = (''#num3#'') AND C.#table_pk# IS NULL) OR (A.#table_field# = (''#num4#'') AND D.#table_pk# IS NULL) OR (A.#table_field# = (''#num5#'') AND E.#table_pk# IS NULL) OR (A.#table_field# = (''#num6#'') AND F.#table_pk# IS NULL) OR (A.#table_field# = (''#num7#'') AND G.#table_pk# IS NULL) OR (A.#table_field# = (''#num8#'') AND H.#table_pk# IS NULL) OR (A.#table_field# = (''#num9#'') AND I.#table_pk# IS NULL) OR (A.#table_field# = (''#num10#'') AND J.#table_pk# IS NULL)) [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('grsx_R2201201', '����������һ����������Э����Ϣ��¼�еġ����״̬��Ϊ��2-����/ʧЧ��ʱ��������Ϣ��¼�������', '����������һ����������Э����Ϣ��¼�еġ����״̬��Ϊ��2-����/ʧЧ��ʱ�������ż�¼�������', 'SELECT #table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE #table_field#>(SELECT MAX(A.RPT_DATE) FROM #table_name# A LEFT JOIN I_CREDIT_LIM B ON A.#table_pk#=B.#table_pk# WHERE A.BUSINESS_STATES=''11'' AND CON_STATUS=''2'' AND INF_REC_TYPE=''220'') and CONTRACT_CODE IN (SELECT CONTRACT_CODE FROM I_CTRCT_BS A LEFT JOIN I_CREDIT_LIM B ON A.PCA_CTRCT_BS_SGMT_ID=B.PCA_CTRCT_BS_SGMT_ID WHERE A.BUSINESS_STATES=''11'' AND CON_STATUS=''2'' AND INF_REC_TYPE=''220'') [and #validate_date# = ''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('grsx_I2200D01', '�����Ч����Ӧ�����ڶ�ȵ�������', '�����Ч����Ӧ�����ڶ�ȵ�������', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_field#>CON_EXP_DATE [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('grsx_I2200D02', '�������޶���������޶��š�����ͬʱ���֡�', '�������޶���������޶��š�����ͬʱ���֡�', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE (#table_field# IS NULL AND CREDIT_REST_CODE IS NOT NULL) OR (CREDIT_REST_CODE IS NULL AND #table_field# IS NOT NULL) [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('QY_JD_010', '���˻��ر��ղ�Ϊ��ʱ������벻�������仯���ڡ����һ��ʵ�ʻ������ڡ����һ��Լ���������ڡ��弶�����϶�����', '���˻��ر��ղ�Ϊ��ʱ������벻�������仯���ڡ����һ��ʵ�ʻ������ڡ����һ��Լ���������ڡ��弶�����϶�����', 'SELECT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE A.#table_field#<BAL_CHG_DATE OR A.#table_field#<LAT_RPY_DATE OR A.#table_field#<LAT_AGRR_RPY_DATE OR A.#table_field#<FIVE_CATE_ADJ_DATE [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('QY_JD_020', '���ҽ�������ʱ��˵������Ϊ20-�˻��ر�ʱ���˻�״̬Ϊ21-�ر�', '���ҽ�������ʱ��˵������Ϊ20-�˻��ر�ʱ���˻�״̬Ϊ21-�ر�', 'SELECT DISTINCT B.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM E_ACCT_BS A LEFT JOIN #table_name# B ON A.EDA_ACCT_BS_SGMT_ID=B.EDA_ACCT_BS_SGMT_ID WHERE ((A.RPT_DATE_CODE !=''20'' AND B.#table_field#=''21'') OR (A.RPT_DATE_CODE=''20'' AND B.#table_field# !=''21'')) [AND #validate_date# = ''#currentDate#''] {AND B.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('Identity_Matching', '������������Ҫ���������ݱ�ʶ����ƥ��', '������������Ҫ���������ݱ�ʶ���Ͳ�ƥ��', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE A.#table_field# IN (#num10#) AND A.#table_field_1# IN (''#num20#'')[and #validate_date# =''#currentDate#''] {and A.#table_pk#=''#tablePk#''}
', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_jd_is_one9', '�����˻�״̬��Ϊ��6-δ���ʱ������������ǰ����������������ǰ�����ܶ����Ϊ 0������ǰ����״̬������Ϊ��*���������˻�û�������������У��������', '�����˻�״̬��Ϊ��6-δ���ʱ������������ǰ����������������ǰ�����ܶ����Ϊ 0������ǰ����״̬������Ϊ��*���������˻�û�������������У��������', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_field# = #field1# AND (#table_field1# !=#field2# OR #table_field2# !=#field2# OR #table_field3# !=#field2# OR #table_field4# !=#field3# OR RPY_STATUS != ''*'') [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_A_MDFCSGMTCODE_RPTDATE', '��Ϣ��������Ӧ������Ӧ��Ϣ���������Ϣ��������', '��Ϣ��������Ӧ������Ӧ��Ϣ���������Ϣ��������', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE (A.#table_field_1# = ''#num1#'' AND A.#table_field# = (SELECT MAX(#table_field#) FROM #table_name# WHERE #table_field_1# = ''#num1#'' AND #table_pk# NOT IN (A.#table_pk#))) [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('NW_BNES_CODE_is_null_02', '���˽�����˻���ʶ�������ݿ��б��벻���ڣ������ڿ��д��ڵ������Ǹ��˻�֮ǰʹ�ù��ı�ʶ', '���˽�����˻���ʶ�������ݿ��б��벻���ڣ������ڿ��д��ڵ������Ǹ��˻�֮ǰʹ�ù��ı�ʶ', 'SELECT DISTINCT #table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A, #table_name_B002# B LEFT JOIN #table_name_C002# C ON B.#table_field_B002_PK#=C.#table_field_B002_PK# LEFT JOIN #table_name_D002# D ON B.#table_field_B002_PK#=D.#table_field_B002_PK# WHERE (A.#table_field#=B.#table_field_B002_acctcode# AND (C.#table_field_C002_acctstatus# =''#acctstatus2#'' OR D.#table_field_D002_nomonthacctstatus# =''#nomonthacctstatus2#'') AND B.#table_field_B002_business# =''#business2#'') [and #validate_date# =''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('SAN_BIAO_is_null_02', '���˻�����Ϣ����ɾ������+��Ϣ��Դ��������ڿ��д���', '����+��Ϣ��Դ��������ڿ��д���', 'SELECT EEBID.#table_pk#,''''business_pk,EEBID.ID_NUM,EEBID.INF_SURC_CODE,EEBID.NAME,EEBID.ID_TYPE,EBS.ID_NUM AS ID_NUM2,EBS.INF_SURC_CODE AS INF_SURC_CODE2,EBS.NAME AS NAME2,EBS.ID_TYPE AS ID_TYPE2, EEBID.#master_table_id# as master_table_id FROM I_IN_BS_INF_DLT EEBID LEFT JOIN I_BS EBS ON (EEBID.ID_NUM = EBS.ID_NUM AND EEBID.INF_SURC_CODE = EBS.INF_SURC_CODE AND EEBID.NAME = EBS.NAME AND EEBID.ID_TYPE = EBS.ID_TYPE) WHERE (EBS.BUSINESS_STATES != ''11'' OR EBS.NAME IS NULL ) [ AND #validate_date# =''#currentDate#'' ] {AND #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('SAN_BIAO_is_null_03', '����֤����Ч������ɾ������+��Ϣ��Դ��������ڿ��д���', '����+��Ϣ��Դ��������ڿ��д���', 'SELECT EEBID.#table_pk#,''''business_pk,EEBID.ID_NUM,EEBID.INF_SURC_CODE,EEBID.NAME,EEBID.ID_TYPE,EBS.ID_NUM AS ID_NUM2,EBS.INF_SURC_CODE AS INF_SURC_CODE2,EBS.NAME AS NAME2,EBS.ID_TYPE AS ID_TYPE2, EEBID.#master_table_id# as master_table_id FROM I_IN_ID_EFCT_INF_DLT EEBID LEFT JOIN I_IN_ID_EFCT_INF EBS ON (EEBID.ID_NUM = EBS.ID_NUM AND EEBID.INF_SURC_CODE = EBS.INF_SURC_CODE AND EEBID.NAME = EBS.NAME AND EEBID.ID_TYPE = EBS.ID_TYPE) WHERE (EBS.BUSINESS_STATES != ''11'' OR EBS.NAME IS NULL ) [ AND #validate_date# =''#currentDate#'' ] {AND #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_pb_table_one2', '������ʱ��˵������Ϊ20-�˻��ر�ʱ���������Σ����˻�����ΪD1/R1/R2/R3/R4����Ӧ�����¶ȱ�����Ϣ��', '������ʱ��˵������Ϊ#ms2_field1#���������Σ����˻�����Ϊ#ms2_field2#����Ӧ����#ms2_field3#', 'SELECT A.#table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_name2_B# B ON A.#table_pk#=B.#table_pk# WHERE (#table_field# IN(#a1_field1#) AND A.#a1_field_type# IN(#a1_field2#) AND B.#table_pk# IS NULL) [and #validate_date# = ''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_pb_table_one3', '����ʱ��˵������Ϊ31,����������Ϣ�Σ����˻�����ΪR2����Ӧ�����¶ȱ��ֶΡ����ҵ������ϸ�ֲ�Ϊ82����Ӧ�������Ŷ����Ϣ�Σ�', '����ʱ��Ϊ#ms3_field1#��Ӧ����#ms3_field2#������Ϊ#ms3_field3#��Ӧ����#ms3_field4#������ϸ�ֲ�Ϊ#ms3_field5#��Ӧ����#ms3_field6#', 'SELECT A.#table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_name2_B# B ON A.#table_pk#=B.#table_pk# LEFT JOIN #table_name2_C# C ON A.#table_pk#=C.#table_pk# LEFT JOIN #table_name2_D# D ON A.#table_pk#=D.#table_pk# WHERE (#table_field# IN(#a1_field1#) AND A.#a1_field_type# IN(#a1_field2#)) AND ((C.#table_pk# IS NULL) OR (#b1_field1# !=#lines# AND D.#table_pk# IS NULL)) [and #validate_date# = ''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('OD_BNES_CODE_is_not_null', 'ԭ��ҵ���ʶ������ǿ�������������ʹ�õ�', 'ԭ��ҵ���ʶ������ǿ�������������ʹ�õ�', 'SELECT A.#table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE A.#table_field# NOT IN (SELECT B.#table_field_ACCT_CODe1# FROM #table_name_BS_SGMT# B LEFT JOIN #table_name_LBLTY_INF_SGMT# C ON B.#table_pk_BS_SGMT_ID# = C.#table_pk_BS_SGMT_ID# WHERE B.BUSINESS_STATES=''11'' AND C.#table_field_ACCT_STATUS# != ''#acct_status#'') [and #validate_date# = ''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('NW_BNES_CODE_is_null', '���˻���ʶ�������ݿ��б��벻���ڣ������ڿ��д��ڵ������Ǹ��˻�֮ǰʹ�ù��ı�ʶ', '���˻���ʶ�������ݿ��б��벻���ڣ������ڿ��д��ڵ������Ǹ��˻�֮ǰʹ�ù��ı�ʶ', 'SELECT #table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE A.#table_field# IN (SELECT B.#table_field_ACCT_CODe2# FROM #table_name_BS_SGMT2# B LEFT JOIN #table_name_LBLTY_INF_SGMT2# C ON C.#table_pk_BS_SGMT_ID2# = B.#table_pk_BS_SGMT_ID2# WHERE B.BUSINESS_STATES = ''11'' AND C.#table_field_ACCT_STATUS2# != ''#acct_status2#'') [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('ent_zichengfuzhai_del_not_null', '��ҵ��ݱ�ʶ����+��ҵ��ݱ�ʶ����+�������+��������+��������ϸ��+�����ṩ��������������ڿ��д���', '��ҵ��ݱ�ʶ����+��ҵ��ݱ�ʶ����+�������+��������+��������ϸ��+�����ṩ��������������ڿ��д���', 'SELECT #table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_name_SHEET_BS_SGMT# B ON (A.ENT_NAME = B.ENT_NAME AND A.ENT_CERT_TYPE = B.ENT_CERT_TYPE AND A.#table_field# = B.ENT_CERT_NUM AND A.SHEET_YEAR=B.SHEET_YEAR AND A.SHEET_TYPE=B.SHEET_TYPE AND A.SHEET_TYPE_DIVIDE=B.SHEET_TYPE_DIVIDE) WHERE (A.INF_REC_TYPE = ''#inf_rec_type#'' AND (B.BUSINESS_STATES != ''11'' AND B.CIMOC IS NULL OR B.BUSINESS_STATES IS NULL)) [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('New_customer_verification_three_tables', '�����ͻ�����ʱ����֮�����У��', '�����ͻ�����/�״��ϱ�ʱ,��ҵ������Ϣ�������뱨�ͻ����Ρ������ſ��Ρ���Ҫ�����Ա�Ρ���ϵ��ʽ��', 'SELECT DISTINCT a.#table_pk#,'''' business_pk, a.#master_table_id# as master_table_id FROM #table_name# a LEFT JOIN #table_1# b ON a.#table_pk# = b.#table_pk# LEFT JOIN #table_2# c ON a.#table_pk# = c.#table_pk# LEFT JOIN #table_3# d ON a.#table_pk# = d.#table_pk# WHERE(a.#table_field# = ''#num30#'' AND (b.#table_pk# IS NULL OR c.#table_pk# IS NULL OR d.#table_pk# IS NULL))[and #validate_date# = ''#currentDate#''] {and a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('New_customer_verification_two_tables', '�����ͻ�����ʱ����֮�����У��', '�����ͻ�����/�״��ϱ�ʱ,��ҵ����ҵ��λ���������(������֯�ķ�֧��������),��Ҫ����ע���ʱ�����Ҫ�����˶�', 'SELECT DISTINCT a.#table_pk#,'''' business_pk, a.#master_table_id# as master_table_id FROM #table_name# a LEFT JOIN #table_1# b ON a.#table_pk# = b.#table_pk# WHERE(a.#table_field# IN (''#num10#'') AND  a.#table_field_1# = ''#num20#'' AND  b.#table_pk# IS NULL)[and #validate_date# = ''#currentDate#''] {and a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_pb_table_one9', '������ʱ��˵������Ϊ10-�¿���ʱ�����˻�����ΪD1/R1/R3/R4����Ӧ������ʼծȨ˵���Ρ����¶ȱ�����Ϣ�Ρ����⽻��˵���Ρ����ר�������Ϣ��', '#ms9_field1#', 'SELECT A.#table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_name2_B# B ON A.#table_pk#=B.#table_pk# LEFT JOIN #table_name2_C# C ON A.#table_pk#=C.#table_pk# LEFT JOIN #table_name2_D# D ON A.#table_pk#=D.#table_pk# LEFT JOIN #table_name2_E# E ON A.#table_pk#=E.#table_pk# WHERE #a1_field_type1# IN(#a1_field1#) AND #table_field# IN(#a1_field2#) AND (B.#table_pk# IS NOT NULL OR C.#table_pk# IS NOT NULL OR D.#table_pk# IS NOT NULL OR E.#table_pk# IS NOT NULL) [and #validate_date# = ''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_pb_table_one10', '������ʱ��˵������Ϊ10-�¿���ʱ�����˻�����ΪR2����Ӧ������ʼծȨ˵���Ρ����¶ȱ�����Ϣ�Ρ����⽻��˵���Ρ�', '#ms10_field1#', 'SELECT A.#table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_name2_B# B ON A.#table_pk#=B.#table_pk# LEFT JOIN #table_name2_C# C ON A.#table_pk#=C.#table_pk# LEFT JOIN #table_name2_D# D ON A.#table_pk#=D.#table_pk# WHERE #a1_field_type1# IN(#a1_field1#) AND #table_field# IN(#a1_field2#) AND (B.#table_pk# IS NOT NULL OR C.#table_pk# IS NOT NULL OR D.#table_pk# IS NOT NULL) [and #validate_date# = ''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_pb_table_one11', '������ʱ��˵������Ϊ31-�½����״��ϱ������˻�,20-�˻��ر�,32-�½����˻��ر�,���˻�����ΪR2����Ӧ������ʼծȨ˵���Ρ����¶ȱ�����Ϣ�Ρ�', '#ms11_field1#', 'SELECT A.#table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_name2_B# B ON A.#table_pk#=B.#table_pk# LEFT JOIN #table_name2_C# C ON A.#table_pk#=C.#table_pk# WHERE #a1_field_type1# IN(#a1_field1#) AND #table_field# IN(#a1_field2#) AND (B.#table_pk# IS NOT NULL OR C.#table_pk# IS NOT NULL) [and #validate_date# = ''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_pb_table_one12', '������ʱ��˵������Ϊ40-�ջ����ڿ���ʱ����Ӧ�����¶ȱ�����Ϣ�Ρ����ר�������Ϣ�Ρ�����Ѻ����Ϣ�Ρ����Ŷ����Ϣ��', '������ʱ��˵������Ϊ40-�ջ����ڿ���ʱ����Ӧ�����¶ȱ�����Ϣ�Ρ����ר�������Ϣ�Ρ�����Ѻ����Ϣ�Ρ����Ŷ����Ϣ��', 'SELECT A.#table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_name2_B# B ON A.#table_pk#=B.#table_pk# LEFT JOIN #table_name2_C# C ON A.#table_pk#=C.#table_pk# LEFT JOIN #table_name2_D# D ON A.#table_pk#=D.#table_pk# LEFT JOIN #table_name2_E# E ON A.#table_pk#=E.#table_pk# WHERE  #table_field# IN(#a1_field2#) AND (B.#table_pk# IS NOT NULL OR C.#table_pk# IS NOT NULL OR D.#table_pk# IS NOT NULL OR E.#table_pk# IS NOT NULL) [and #validate_date# = ''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_jd_is_one1', '�������ʽ��Ϊ��90-���ܱ��ͣ������ֻ��ʽ�����򡰻���Ƶ�ʡ�Ϊ��03-�¡�', '�������ʽ��Ϊ��90-���ܱ��ͣ������ֻ��ʽ�����򡰻���Ƶ�ʡ�Ϊ��03-�¡�', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_field#=#field1# AND #table_field1# NOT IN(#field2#) [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_jd_is_one2', '�������ʽ�������ԡ�2����ͷ���򡰻�������������Ϊ 0��', '�������ʽ�������ԡ�2����ͷ���򡰻�������������Ϊ 0��', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_field# like #field1# AND #table_field1# !=#field2# [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_jd_is_one3', '���������ڡ�Ӧ�����ڡ��������ڡ�', '���������ڡ�Ӧ�����ڡ��������ڡ�', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_field#>#table_field1# [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_jd_is_one4', '�����������������͡�Ϊ��2-��֤�ˡ����򡰻������ν�����Ϊ��ֵ', '�����������������͡�Ϊ��2-��֤�ˡ����򡰻������ν�����Ϊ��ֵ', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_field#=#field1# AND #table_field1# IS NULL [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_jd_is_one5', '�����������������͡�Ϊ��2-��֤�ˡ�ʱ����������־��������֤��ͬ��š���ӦΪ��', '�����������������͡�Ϊ��2-��֤�ˡ�ʱ����������־��������֤��ͬ��š���ӦΪ��', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_field#=#field1# AND (#table_field1# IS NULL OR #table_field2# IS NULL) [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('OPENDATE_LATERTHAN_REPAYPRD_FIVECATEADJ_CLOSE', '�˻���Ϣ��¼�еġ��������ڡ�Ӧ�����ڡ����仯���ڡ������弶�����϶����ڡ������˻��ر����ڡ�������Ϊ�գ�', '�˻���Ϣ��¼�еġ��������ڡ�Ӧ�����ڡ����仯���ڡ������弶�����϶����ڡ������˻��ر����ڡ�������Ϊ�գ�', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_name_1# B ON A.#table_field_4# = B.#table_field_4# WHERE (A.#table_field# IS NOT NULL AND (A.#table_field# > B.#table_field_1# OR A.#table_field# > B.#table_field_2# OR A.#table_field# > B.#table_field_3#))[AND #validate_date# = ''#currentDate#''] {AND A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('EEA_OBLIGOR_AND_PERSONLIABLE_TWOMARK_NOTSAME', 'ծ������������ػ������������겻����ͬ', 'ծ������������ػ������������겻����ͬ', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_name_1# B ON A.#table_pk_1# = B.#table_pk_1# WHERE INFO_ID_TYPE=''2'' AND (A.#table_field# = B.#table_field_2# AND A.#table_field_1# = B.#table_field_3#)[AND #validate_date# = ''#currentDate#''] {AND A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_GUARMODE_RPTDATECODE10', '��������ʱ��˵�����롱Ϊ��10-�¿���/�״��ϱ���������������Ϣ�Ρ��ġ�������ʽ��Ϊ��#num1#��ʱ�����뱨����ػ��������˶�', '������ʱ��˵������Ϊ10-�¿���/�״��ϱ�����������Ϣ�εĵ�����ʽΪ#n3#ʱ�����뱨����ػ��������˶�', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_1# B ON A.#table_pk_1# = B.#table_pk_1# LEFT JOIN #table_2# C ON A.#table_pk_1# = C.#table_pk_1# WHERE (A.#table_field# IN (#num1#) AND B.#table_field_1# = ''#num10#'' AND C.#table_pk_1# IS NULL) [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('EDH_TRANDATE_AND_CHANTRANTYPE_NOTEXIST', '�ض�����˵�����еġ��������ڡ�+���������͡��ڿ��в��ܴ���', '�ض�����˵�����еġ��������ڡ�+���������͡��ڿ��в��ܴ���', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE ((A.#table_field#,A.#table_field_1#) IN (SELECT #table_field#,#table_field_1# FROM #table_name#)) [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('EDB_OPENDATE_GREATERTHAN_DUEDATE', '���������ڡ�Ӧ�����ڡ��������ڡ�', '���������ڡ�Ӧ�����ڡ��������ڡ�', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE (A.#table_field# > A.#table_field_1#)[AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('EDB_REPAYMODE90_REPAYFREQCY10', '�����ʽ��Ϊ��90-���ܱ��ͣ������ֻ��ʽ�����򡰻���Ƶ�ʡ�ӦΪ��10-�¡�', '�����ʽ��Ϊ��90-���ܱ��ͣ������ֻ��ʽ�����򡰻���Ƶ�ʡ�ӦΪ��10-�¡�', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE (A.#table_field# = ''#mun90#'' AND A.#table_field_1# NOT IN (#num10#)) [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('EDB_REPAYMODE2%_REPAYFREQCY99', '�����ʽ���ԡ�2����ͷ���򡰻���Ƶ�ʡ�ӦΪ��99-������', '�����ʽ���ԡ�2����ͷ���򡰻���Ƶ�ʡ�ӦΪ��99-������', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE (A.#table_field# like ''#num2#'' AND A.#table_field_1# NOT IN (#num99#)) [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('Enterprise_identity_type', '��ҵ��ݱ�ʶ����У��', '��ҵ��ݱ�ʶ����Ӧ�����ȡ������롱���Ρ�ͳһ������ô��롱,�١���֯�������롱˳�����������,������ʶ����
��������ʶ��', 'SELECT DISTINCT A .#table_pk#,'''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A INNER JOIN #table_1# b ON A .#table_pk# = b.#table_pk# WHERE(A .#table_field# = ''#num10#''AND ( b.#table_field_1# IN (''#num20#''))) [AND #validate_date# = ''#currentDate#'' ] {AND A .#table_pk# = ''#tablePk#'' }
', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('mingxiduan_is_not_null_06', '�˻�����ΪD1���ִηſ��ʶΪ0��1������31-������ſ�', '�˻�����ΪD1���ִηſ��ʶΪ0��1������31-������ſ�', 'SELECT #table_pk#,''''business_pk, B.#master_table_id# as master_table_id FROM #table_name_A5_not_null# A LEFT JOIN #table_name# B ON A.#table_field_A5_PK#=B.#table_field_A5_PK# WHERE A.#table_field_A5_code5# IN(#table_field_code5#) AND A.#table_field_accttype5# IN(#accttype5#) AND #table_field# IN(#flag5#) [and #validate_date# =''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('OD_BNES_CODE_is_not_null_02', '���˽��ԭҵ���ʶ������ǿ�������������ʹ�õ�', '���˽��ԭҵ���ʶ������ǿ�������������ʹ�õ�', 'SELECT DISTINCT #table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A, #table_name_B001# B LEFT JOIN #table_name_C001# C ON B.#table_field_B001_PK#=C.#table_field_B001_PK# LEFT JOIN #table_name_D001# D ON B.#table_field_B001_PK#=D.#table_field_B001_PK# WHERE A.#table_field# NOT IN (SELECT B.#table_field_B001_acctcode# FROM #table_name_B001# B LEFT JOIN #table_name_C001# C ON B.#table_field_B001_PK#=C.#table_field_B001_PK# LEFT JOIN #table_name_D001# D ON B.#table_field_B001_PK#=D.#table_field_B001_PK# WHERE B.#table_field_B001_business# =''#business#'' AND (C.#table_field_C001_acctstatus# !=''#acctstatus#'' AND D.#table_field_D001_nomonthacctstatus# !=''#nomonthacctstatus#''))  [and #validate_date# =''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_pb_table_one4', '������ʱ��˵������Ϊ10-�¿���ʱ�����������⣬���ٰ���������Ϣ�Σ����˻�����ΪR1/R3/R4����Ӧ�����¶ȱ�����Ϣ�Ρ����Ŷ����Ϣ��', '������ʱ��˵������Ϊ#ms4_field1#ʱ�����������⣬���ٰ���#ms4_field2#�����˻�����Ϊ#ms4_field3#����Ӧ����#ms4_field4#', 'SELECT A.#table_pk#,''''business_pk , A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_name2_B# B ON A.#table_pk#=B.#table_pk# LEFT JOIN #table_name2_C# C ON A.#table_pk#=C.#table_pk# WHERE A.#table_field# IN(#a1_field1#) AND #table_field_type# IN(#a1_field2#) AND (B.#table_pk# IS NULL OR C.#table_pk# IS NULL) [and #validate_date# = ''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_pb_table_one5', '����ʱ��˵������Ϊ10-�¿���ʱ�����������⣬���˽���˻���Ϣ��¼���ٰ���������Ϣ��', '����ʱ��˵������Ϊ#ms5_field1#ʱ�����������⣬���ٰ���#ms5_field2#', 'SELECT A.#table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_name2_B# B ON A.#table_pk#=B.#table_pk# WHERE A.#table_field# IN(#a1_field1#) AND B.#table_pk# IS NULL [and #validate_date# = ''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_pb_table_one6', '������ʱ��˵������Ϊ10-�¿���ʱ�����ٰ���������Ϣ�Σ����˻�����ΪD1����Ӧ�����¶ȱ�����Ϣ�Ρ����������Ϣ���зִηſ��־���� 0����Ӧ�������Ŷ����Ϣ��', '#ms6_field1#', 'SELECT A.#table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_name2_B# B ON A.#table_pk#=B.#table_pk# LEFT JOIN #table_name2_C# C ON A.#table_pk#=C.#table_pk# LEFT JOIN I_AMBLG_INF D ON A.#table_pk#=D.#table_pk# WHERE A.#table_field# IN(#a1_field1#) AND A.#a1_field_type# IN(#a1_field2#) AND (D.#table_pk# IS NULL OR (B.#a1_field_FLAG1#>#flag1# AND C.#table_pk# IS NULL)) [and #validate_date# = ''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_pb_table_one7', '������ʱ��˵������Ϊ10-�¿�����31-�½����״��ϱ������˻�ʱ����D1/R1/R2/R3/R4 ���˻��Ļ�����Ϣ���е�����ʽΪ3-��֤��5-��ϣ�����֤������Ӧ������ػ��������˶�', '������ʱ��˵������Ϊ10-�¿�����31-�½����״��ϱ������˻�ʱ����D1/R1/R2/R3/R4 ���˻��Ļ�����Ϣ���е�����ʽΪ3-��֤��5-��ϣ�����֤������Ӧ������ػ��������˶�', 'SELECT #table_pk#,''''business_pk, B.#master_table_id# as master_table_id FROM #table_name2_A# A LEFT JOIN #table_name# B ON A.#table_name2_A_PK#=B.#table_name2_A_PK# LEFT JOIN #table_name2_C# C  ON A.#table_name2_A_PK#=C.#table_name2_A_PK# WHERE #a1_field_type1# IN(#a1_field1#) AND #a1_field_code1# IN(#a1_field2#) AND B.#table_field# IN(#a1_field3#) AND C.#table_name2_A_PK# IS NULL [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_pb_table_one8', '������ʱ��˵������Ϊ10-�¿���,31-�½����״��ϱ������˻�,���������Ϣ���зִηſ��־Ϊ0������Ӧ�������Ŷ����Ϣ��', '#ms8_field1#', 'SELECT #table_pk#,''''business_pk, B.#master_table_id# as master_table_id FROM #table_name2_A# A LEFT JOIN  #table_name# B ON A.#table_field_A_pk#=B.#table_field_A_pk# LEFT JOIN #table_name2_C# C ON A.#table_field_A_pk#=C.#table_field_A_pk# WHERE A.#a1_field_type1# IN(#a1_field1#) AND A.#table_field_code1# IN(#a1_field2#) AND B.#table_field# IN(#b1_field3#) AND C.#table_field_A_pk# IS NOT NULL [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('EEA_RPTDATECODEIS10_EEBANDEEF_NOTNULL', '������ʱ��˵�����롱Ϊ��10-�¿���/�״��ϱ���ʱ������Ӧ����������Ϣ�Ρ��ڱ�������Ϣ��', '������ʱ��˵�����롱Ϊ��10-�¿���/�״��ϱ���ʱ������Ӧ����������Ϣ�Ρ��ڱ�������Ϣ��', 'SELECT DISTINCT A.#table_pk#,  '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_1# B ON A.#table_pk# = B.#table_pk# LEFT JOIN #table_2# C ON A.#table_pk# = C.#table_pk# WHERE (A.#table_field# = ''#num10#'' AND ( B.#table_pk# IS NULL OR C.#table_pk# IS NULL ) ) [and #validate_date# = ''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('EEA_RPTDATECODEIS_EEF_NOTNULL', '������ʱ��˵�����롱У�飬���ٰ����ڱ�������Ϣ�Ρ�', '������ʱ��˵�����롱Ϊ��#num10#��ʱ�����ٰ����ڱ�������Ϣ�Ρ�', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_1# B ON A.#table_pk# = B.#table_pk# WHERE (A.#table_field# = ''#num10#'' AND B.#table_pk# IS NULL) [and #validate_date# = ''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('Length_range', '�ֶγ��ȷ�ΧУ��', '�ֶβ��������#len#λ', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id from #table_name# A  where length(#table_field#)>#len# [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('OnlyNumber_Length', '�ֶγ��Ⱥʹ�����У��', '�ֶβ�Ϊ���������ֶγ��ȴ���#len#λ', 'SELECT DISTINCT A .#table_pk#,'''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE (REGEXP_REPLACE(A .#table_field#,''^[-\+]?\d+(\.\d+)?$'','') IS NOT NULL) AND (LENGTH (A.#table_field) > #len#) [AND #validate_date# =''#currentDate#'' ] {AND A .#table_pk# =''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('SAN_BIAO_is_null', '��������ڿ��д���', '����+��Ϣ��Դ��������ڿ��д���', 'SELECT EEBID.#table_pk#,''''business_pk, EEBID.ENT_CERT_NUM,EEBID.INF_SURC_CODE,EEBID.ENT_NAME,EEBID.ENT_CERT_TYPE, EBS.ENT_CERT_NUM AS ENT_CERT_NUM2,EBS.INF_SURC_CODE AS INF_SURC_CODE2 ,EBS.ENT_NAME AS ENT_NAME2,EBS.ENT_CERT_TYPE AS ENT_CERT_TYPE2 , EEBID.#master_table_id# as master_table_id FROM E_BS_INF_DLT EEBID LEFT JOIN E_BS  EBS ON  (EEBID.ENT_CERT_NUM = EBS.ENT_CERT_NUM AND EEBID.INF_SURC_CODE = EBS.INF_SURC_CODE AND EEBID.ENT_NAME = EBS.ENT_NAME AND EEBID.ENT_CERT_TYPE = EBS.ENT_CERT_TYPE) WHERE (EBS.BUSINESS_STATES !=''11'' OR EBS.ENT_NAME IS NULL)[and #validate_date# =''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_PDC_PDA_TWOMARK', '������������ծ�������겻����ͬ', '������������ծ�������겻����ͬ', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_1# B ON A.#table_pk_1# = B.#table_pk_1# WHERE (A.#table_field# = B.#table_field_1# AND A.#table_field_2# = B.#table_field_3#) [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_PBG_MONTH_AND_PBA_RPT_DATE', '���·ݡ���������Ϣ�������ڵ��ꡢ�±���һ��', '���·ݡ���������Ϣ�������ڵ��ꡢ�±���һ��', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_1# B ON A.#table_pk_1# = B.#table_pk_1# WHERE (B.#table_field_1# = ''#num1#'' AND A.#table_field# NOT IN  (substr(B.#table_field_2#, 0,7))) [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_RPTDATE_SPECEFCTDATE', '���д��ڡ����ڶ����Ч���ڡ��������ʱ����Ϣ�������ڸ���Ĵ��ר�������Ϣ�������', '���д��ڡ����ڶ����Ч���ڡ��������ʱ����Ϣ�������ڸ���Ĵ��ר�������Ϣ�������', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_1# B ON A.#table_pk# = B.#table_pk# WHERE (A.#table_field_1# = ''#num1#'' AND B.#table_field_2# IN  (SELECT #table_field_2# FROM #table_1#)  AND A.#table_field# > (SELECT MAX(#table_field#) FROM #table_name# WHERE #table_field_1# = ''#num1#'' AND #table_pk# NOT IN (A.#table_pk#))) [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_ACCTSTATUS_ACCTTYPE_OPETNTYPE', '�������������� R2 �˻������ܽ���ʷ�ϵġ�4-����������Ϊ��������״̬', '�������������� R2 �˻������ܽ���ʷ�ϵġ�4-����������Ϊ��������״̬', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_1# B ON A.#table_pk_1# = B.#table_pk_1# LEFT JOIN #table_2# C ON A.#table_pk_1# = B.#table_pk_1# WHERE (B.#table_field_1# = ''#num1#'' AND B.#table_field_2# = ''#num2#'' AND C.#table_field_3# = ''#num3#'' AND A.#table_field# NOT IN (''#num4#'')) [AND #validate_date# = ''#currentDate#''] {AND A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_PBI_NOMONTHACCTSTATUS', '���� C1 �˻����������¶ȱ�����Ϣ��ʱ�������д�����Ϣ�������ڸ���ķ��¶ȱ�����Ϣ�Σ�����������¼���˻�״̬����Ϊ��������', '���� C1 �˻����������¶ȱ�����Ϣ��ʱ�������д�����Ϣ�������ڸ���ķ��¶ȱ�����Ϣ�Σ�����������¼���˻�״̬����Ϊ��������', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_1# B ON A.#table_pk_1# = B.#table_pk_1# WHERE (B.#table_field_1# = ''#num1#'' AND B.#table_field_2# < (SELECT MAX(#table_field_2#) FROM #table_1# WHERE #table_field_3# = ''#num2#'' AND #table_pk_1# NOT IN (B.#table_pk_1#)) AND A.#table_field# = ''#num3#'') [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('ID_NUM_and_ID_TYPE_not_repeat_02_02', '�����������빲ͬ���������겻����ͬ', '#m26#��#m27#������ͬ', 'SELECT B.#table_pk#,''''business_pk, B.#master_table_id# as master_table_id FROM #table_name_EGA_CTRCT_BS_SGMT# A ,#table_name# B WHERE A.#table_field_SGMT_ID#=B.#table_field_SGMT_ID# AND #table_field_TYPE#=#table_field_IDTYPE# AND #table_field_NUM# = #table_field# AND A.INFO_ID_TYPE=B.INFO_ID_TYPE [and #validate_date# =''#currentDate#''] {and B.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('OrgType_for_value', '��֯��������Ϊ��������ʱע���ʱ��β��������', '��֯��������Ϊ��������ʱ��ע���ʱ�����Ҫ�����˶β��ܳ���', 'SELECT DISTINCT a.#table_pk#,'''' business_pk, a.#master_table_id# as master_table_id FROM #table_name# a LEFT JOIN #table_1# b ON a.#table_pk# = b.#table_pk# WHERE a.#table_field# IN (''#num10#'')and b.#table_pk# IS NOT NULL [and #validate_date# = ''#currentDate#''] {and a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('Reg_Add_is_Null', '�Ǽǵ�ַ����Ϊ��', '���������ΪCHNʱ���Ǽǵ�ַ����Ϊ��', 'SELECT DISTINCT a.#table_pk#,'''' business_pk, a.#master_table_id# as master_table_id FROM #table_name# a WHERE ( a.#table_field# IN (#num10#) AND #table_field_1# is NULL) [and #validate_date# =''#currentDate#''] {and a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('Reg_Add_not_Null', '�Ǽǵ�ַͳһΪ��', '��������벻ΪCHNʱ���Ǽǵ�ַͳһΪ��', 'SELECT DISTINCT a.#table_pk#,'''' business_pk, a.#master_table_id# as master_table_id FROM #table_name# a WHERE ( a.#table_field# NOT IN (#num10#) AND #table_field_1# is NOT NULL)[and #validate_date# = ''#currentDate#''] {and a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('Only_Oneperson', '���������ˡ����³������³�����ֻ�ܱ���һ��', '���������ˡ����³������³�����ֻ�ܱ���һ��', 'SELECT DISTINCT a.#table_pk#,'''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE EAA_BS_SGMT_ID IN (SELECT EAA_BS_SGMT_ID FROM #table_name# WHERE #table_field# IN (''1'',''4'',''5'') GROUP BY EAA_BS_SGMT_ID,#table_field# HAVING COUNT(EAA_BS_SGMT_ID)>1) [and #validate_date# = ''#currentDate#''] {and a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('NotOnly_Oneperson', '���³������³�������ͬһ����', '���³������³�������ͬһ����', 'SELECT DISTINCT A.#table_pk#,''''business_pk, A.#master_table_id# as master_table_id from #table_name# A WHERE EAA_BS_SGMT_ID IN(SELECT EAA_BS_SGMT_ID from #table_name# B where #table_field# IN (''4'',''5'')GROUP BY B.EAA_BS_SGMT_ID,B.MMB_ALIAS,B.MMB_ID_TYPE,B.MMB_ID_NUM HAVING COUNT(MMB_ALIAS||MMB_ID_TYPE||MMB_ID_NUM)> 1)[and #validate_date# =''#currentDate#''] {and a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('Between_Two_Numbers', 'ע���ʱ�����Ҫ�����˶��еĳ��ʱ������� 0�� С�ڻ���� 100', '���ʱ���Ӧ��0��100֮��', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE(A.#table_field# <=''#num10#'' OR A.#table_field# >''#num20#'')[and #validate_date# =''#currentDate#''] {and A.#table_pk#=''#tablePk#''}
', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_R2321209_01', '�����ڱ�������Ϣ��ʱ���������ĸ��������¼�е���Ϣ�����������ڿ������µ��ڱ�������Ϣ�ε���Ϣ�������ڣ��ҿ����ڱ�������Ϣ���е��˻�״̬Ϊ���رա�,��ø��������¼�������', '�����ڱ�������Ϣ��ʱ���������ĸ��������¼�е���Ϣ�����������ڿ������µ��ڱ�������Ϣ�ε���Ϣ�������ڣ��ҿ����ڱ�������Ϣ���е��˻�״̬Ϊ���رա�,��ø��������¼�������', 'SELECT #table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name#  A WHERE #table_field#>(SELECT MAX(A.RPT_DATE) FROM #table_name# A LEFT JOIN I_GR_REPYMT_INF B ON A.#table_pk#=B.#table_pk# WHERE A.BUSINESS_STATES=''11'' AND ACCT_STATUS=''2'' AND INF_REC_TYPE=''230'') and ACCT_CODE IN (SELECT ACCT_CODE FROM I_GUAR_ACCT_BS A LEFT JOIN I_GR_REPYMT_INF B ON A.PDA_GUAR_ACCT_BS_SGMT_ID=B.PDA_GUAR_ACCT_BS_SGMT_ID WHERE A.BUSINESS_STATES=''11'' AND ACCT_STATUS=''2'' AND INF_REC_TYPE=''230'') [and #validate_date# = ''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('grjd_d_001', '���˻���Ϣ��¼�С��˻����͡�Ϊ��R3��ʱ����͸֧ 180 ������δ����Ӧ��С�ڵ��ڡ���', '���˻���Ϣ��¼�С��˻����͡�Ϊ��R3��ʱ����͸֧ 180 ������δ����Ӧ��С�ڵ��ڡ���', 'SELECT #table_pk#,''''business_pk,B.#master_table_id# as master_table_id FROM I_ACCT_BS A LEFT JOIN #table_name# B ON A.#master_table_id#=B.#master_table_id# WHERE ACCT_TYPE=''R3'' AND  #table_field# > ACCT_BAL [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('grjd_d_002', '���˻���Ϣ��¼�С��˻����͡�Ϊ��R3��ʱ������ǰ����״̬��Ϊ��*��ʱ����������Ϊ 0', '���˻���Ϣ��¼�С��˻����͡�Ϊ��R3��ʱ������ǰ����״̬��Ϊ��*��ʱ����������Ϊ 0', 'SELECT #table_pk#,''''business_pk,B.#master_table_id# as master_table_id FROM I_ACCT_BS A LEFT JOIN #table_name# B ON A.#master_table_id#=B.#master_table_id# WHERE RPY_STATUS=''*'' AND #table_field# !=''0'' AND ACCT_TYPE=''R3'' [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('grjd_d_003', '���˻���Ϣ��¼�С��˻����͡�Ϊ��R3��ʱ������ǰ����״̬��Ϊ���֡�1-7��ʱ������������� 0', '���˻���Ϣ��¼�С��˻����͡�Ϊ��R3��ʱ������ǰ����״̬��Ϊ���֡�1-7��ʱ������������� 0', 'SELECT #table_pk#,''''business_pk,B.#master_table_id# as master_table_id FROM I_ACCT_BS A LEFT JOIN #table_name# B ON A.#master_table_id#=B.#master_table_id# WHERE RPY_STATUS BETWEEN ''1'' AND ''7'' AND #table_field#<''0'' AND ACCT_TYPE=''R3'' [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('grjd_d_004', '��������ʱ��˵�����롱Ϊ��32-�½����˻��رա��͡�20-�˻��رա�ʱ�����˻�״̬��Ϊ��3-�ر�/��4-������', '��������ʱ��˵�����롱Ϊ��32-�½����˻��رա��͡�20-�˻��رա�ʱ�����˻�״̬��Ϊ��3-�ر�/��4-������', 'SELECT #table_pk#,''''business_pk,B.#master_table_id# as master_table_id FROM I_ACCT_BS A LEFT JOIN #table_name# B ON A.#master_table_id#=B.#master_table_id# WHERE RPT_DATE_CODE IN(''32'',''20'') AND #table_field# NOT IN(''3'',''4'') [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('grjd_d_005', '����C1��������˻������¶ȱ����е��˻�״̬��ӦΪ���رա���������', '����C1��������˻������¶ȱ����е��˻�״̬��ӦΪ���رա���������', 'SELECT #table_pk#,''''business_pk,B.#master_table_id# as master_table_id FROM I_ACCT_BS A LEFT JOIN #table_name# B ON A.#master_table_id#=B.#master_table_id# WHERE ACCT_TYPE !=''C1'' AND #table_field# IN(''3'',''4'')', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_db_o01', '�˻���Ϣ��¼�еġ��������ڡ�Ӧ�����ڡ����仯���ڡ������弶�����϶����ڡ������˻��ر����ڣ�����Ϊ�գ���', '�˻���Ϣ��¼�еġ��������ڡ�Ӧ�����ڡ����仯���ڡ������弶�����϶����ڡ������˻��ر����ڣ�����Ϊ�գ���', 'SELECT A.#table_pk#,''''business_pk,A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN I_GR_REPYMT_INF C ON A.PDA_GUAR_ACCT_BS_SGMT_ID= C.PDA_GUAR_ACCT_BS_SGMT_ID WHERE C. PDA_GUAR_ACCT_BS_SGMT_ID IS NOT NULL AND (A.#table_field#<REPAY_PRD OR A.OPEN_DATE<FIVE_CATE_ADJ_DATE OR (CLOSE_DATE IS NOT NULL AND A.OPEN_DATE<CLOSE_DATE)) [and #validate_date# = ''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_jd_is_one10', '������ǰ����״̬��Ϊ��N����M�����򡰵�ǰ����������������ǰ�����ܶ����Ϊ0�������˻�û�������������У��������', '������ǰ����״̬��Ϊ��N����M�����򡰵�ǰ����������������ǰ�����ܶ����Ϊ0�������˻�û�������������У��������', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_field# IN(#field1#) AND (#table_field1# !=#field2# OR #table_field2# !=#field3#) [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_jd_is_one11', '������ǰ����״̬��Ϊ���֡�1-7�����򡰵�ǰ����������������ǰ�����ܶ�������0', '������ǰ����״̬��Ϊ���֡�1-7�����򡰵�ǰ����������������ǰ�����ܶ�������0', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_field# IN(#field1#) AND (#table_field1# <= #field2# OR #table_field2# <= #field2#) [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_jd_is_one22', '������ǰ����״̬��Ϊ��*�����򡰱���Ӧ�����������ǰ����������������ǰ�����ܶ���������˵�������Ϊ 0�������˻�û�������������У��������', '������ǰ����״̬��Ϊ��*�����򡰱���Ӧ�����������ǰ����������������ǰ�����ܶ���������˵�������Ϊ 0�������˻�û�������������У��������', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_field# = #field1# AND (#table_field1# !=#field2# OR #table_field2# !=#field2# OR #table_field3# !=#field2# OR #table_field4# !=#field3#) [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('grjd_tssj_01', '���˻���ʶ�롱��Ӧ�ĸ��˽���˻������Ѿ��ڿ��д��ڣ�����ü�¼������⡣', '���˻���ʶ�롱��Ӧ�ĸ��˽���˻������Ѿ��ڿ��д��ڣ�����ü�¼������⡣', 'SELECT A.#table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE A.#table_field# NOT IN(SELECT #table_field# FROM I_ACCT_BS WHERE BUSINESS_STATES=''11'') [and #validate_date# = ''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('qiye_shouxin_01', '����������һ������Э����Ϣ��¼�еġ����״̬��Ϊ��2-����/ʧЧ��ʱ��������Ϣ��¼������⡣', '����������һ������Э����Ϣ��¼�еġ����״̬��Ϊ��2-����/ʧЧ��ʱ��������Ϣ��¼������⡣', 'SELECT #table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE #table_field#>(SELECT MAX(A.RPT_DATE) FROM #table_name# A LEFT JOIN E_CREDIT_LIM B ON A.#table_pk#=B.#table_pk# WHERE A.BUSINESS_STATES=''11'' AND CON_STATUS=''2'' AND INF_REC_TYPE=''420'') and CONTRACT_CODE IN (SELECT CONTRACT_CODE FROM #table_name# A LEFT JOIN E_CREDIT_LIM B ON A.#table_pk#=B.#table_pk# WHERE A.BUSINESS_STATES=''11'' AND CON_STATUS=''2'' AND INF_REC_TYPE=''420'') [and #validate_date# = ''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('PCC_IS_NOT_NULL', '��������Э���¼����ʱ���������Ρ��͡������Ϣ�Ρ��������', '��������Э���¼����ʱ���������Ρ��͡������Ϣ�Ρ��������', 'SELECT A.#table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_name_B# B ON A.#table_pk#=B.#table_pk# WHERE B.#table_pk# IS NULL AND #table_field#=''220'' [and #validate_date# = ''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('qiye_danbao_01', '����˻���Ϣ��¼����һ���ġ��˻�״̬��Ϊ��2-�رա����������Ϣ��¼������⡣', '����˻���Ϣ��¼����һ���ġ��˻�״̬��Ϊ��2-�رա����������Ϣ��¼������⡣', 'SELECT #table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE #table_field#>(SELECT MAX(A.RPT_DATE) FROM #table_name# A LEFT JOIN E_GUAR_INSURANCE_INF B ON A.#table_pk#=B.#table_pk# WHERE A.BUSINESS_STATES=''11'' AND ACCT_STATUS=''2'' AND INF_REC_TYPE=''440'') and ACCT_CODE IN (SELECT ACCT_CODE FROM E_GUAR_ACCT_BS A LEFT JOIN E_GUAR_INSURANCE_INF B ON A.#table_pk#=B.#table_pk# WHERE A.BUSINESS_STATES=''11'' AND ACCT_STATUS=''2'' AND INF_REC_TYPE=''440'') [and #validate_date# = ''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_jd_is_two4', '���˻�����ΪC1ʱ�����ҵ�����ֻ��Ϊ5-�ʲ����á�6-��� ���˻�����ΪR2/R3ʱ�����ҵ�����ֻ��Ϊ2-���ÿ�', '���˻�����ΪC1ʱ�����ҵ�����ֻ��Ϊ5-�ʲ����á�6-��� ���˻�����ΪR2/R3ʱ�����ҵ�����ֻ��Ϊ2-���ÿ�', 'SELECT #table_pk#,''''business_pk, B.#master_table_id# as master_table_id FROM #table_name_A# A LEFT JOIN #table_name# B ON A.#table_field_A_pk#=B.#table_field_A_pk# WHERE (A.#a1_field1#=#a1_field_type1# AND #table_field# NOT IN(#b1_field1#)) OR (A.#a1_field1# IN(#a1_field_type2#) AND #table_field# NOT IN(#b1_field2#)) [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_jd_is_two5', '������ʱ��˵������Ϊ32-�½����˻��رպ�20-�˻��ر�ʱ���˻�״̬Ϊ3-�ر�,4-����', '������ʱ��˵������Ϊ32-�½����˻��رպ�20-�˻��ر�ʱ���˻�״̬Ϊ3-�ر�,4-����', 'SELECT #table_pk#,''''business_pk, B.#master_table_id# as master_table_id FROM #table_name_A# A LEFT JOIN #table_name# B ON A.#table_field_A_pk#=B.#table_field_A_pk# LEFT JOIN #table_name_C# C ON A.#table_field_A_pk#=C.#table_field_A_pk# WHERE A.#a1_field1# IN(#a1_field_code1#) AND B.#table_field# NOT IN(#b1_field1#) [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_jd_is_two6', '�����֤�����͡�֤���������������ݱ�ʶ���͡���������ݱ�ʶ���벻����ȫ��ͬ', '�����֤�����͡�֤���������������ݱ�ʶ���͡���������ݱ�ʶ���벻����ȫ��ͬ', 'SELECT #table_pk#,''''business_pk, B.#master_table_id# as master_table_id FROM #table_name_A# A LEFT JOIN #table_name# B ON A.#table_field_A_pk#=B.#table_field_A_pk# WHERE A.#a1_field1#=B.#b1_field2# AND A.#a1_field2#=B.#table_field# AND INFO_ID_TYPE=''1'' [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_jd_is_two7', '���� C1 ��������˻������¶ȱ����е��˻�״̬��ӦΪ�رջ�����', '���� C1 ��������˻������¶ȱ����е��˻�״̬��ӦΪ�رջ�����', 'SELECT #table_pk#,''''business_pk, B.#master_table_id# as master_table_id FROM #table_name_A# A LEFT JOIN #table_name# B ON A.#table_field_A_pk#=B.#table_field_A_pk# WHERE A.#a1_field1# NOT IN(#a1_field_code1#) AND B.#table_field# IN(#b1_field1#) [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('grjd_tssj_02', '����˻������¼�˵����¼�ġ���Ϣ�������ڡ��롰�����·ݡ��е��ꡢ�����', '����˻������¼�˵����¼�ġ���Ϣ�������ڡ��롰�����·ݡ��е��ꡢ�����', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE substr(#table_field1#,0,7) != #table_field# [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('grjd_tssj_03', '�����������¼�˵����¼���������Ѵ��ڡ��˻���ʶ�롱��ͬ����Ϣ����������ͬ���˽���˻���¼����ü�¼������⡣', '�����������¼�˵����¼���������Ѵ��ڡ��˻���ʶ�롱��ͬ����Ϣ����������ͬ���˽���˻���¼����ü�¼������⡣', 'SELECT A.#table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN I_ACCT_BS B ON A.ACCT_CODE=B.ACCT_CODE WHERE A.ACCT_CODE=B.ACCT_CODE AND A.#table_field#=B.#table_field# AND B.BUSINESS_STATES=''11'' [and #validate_date# = ''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('EEA_RPTDATECODEIS_EEF_ISNULL', '������ʱ��˵�����롱У�飬�������ڱ�������Ϣ�Ρ�', '������ʱ��˵�����롱Ϊ��#num10#��ʱ���������ڱ�������Ϣ�Ρ�', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_1# B ON A.#table_pk# = B.#table_pk# WHERE (A.#table_field# = ''#num10#'' AND B.#table_pk# IS NOT NULL) [and #validate_date# = ''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('EEA_RPTDATECODE10_GUAR_MODE1_EEC_NOTNULL', '������ʱ��˵�����롱Ϊ��10-�¿���/�״��ϱ����ҡ���������ʽ��Ϊ��1-��֤��ʱ�����ٰ�����ػ��������˶Ρ�', '������ʱ��˵�����롱Ϊ��10-�¿���/�״��ϱ����ҡ���������ʽ��Ϊ��1-��֤��ʱ�����ٰ�����ػ��������˶Ρ�', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_1# B ON A.#table_pk# = B.#table_pk# LEFT JOIN #table_2# C ON A.#table_pk# = C.#table_pk# WHERE (A.#table_field# = ''#num10#'' AND B.#table_field_1# = ''#num1#'' AND C.#table_pk# IS NULL)[and #validate_date# = ''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('EEB_OPENDATE_GREANTERTHAN_DUEDATE', '���������ڡ�Ӧ�����ڡ��������ڡ�', '���������ڡ�Ӧ�����ڡ��������ڡ�', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE (A.#table_field# > A.#table_field_1#) [and #validate_date# = ''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('EEB_BUSIDTILLINES_BELONGTO_BUSILINES', '������ҵ����ࡱ�͡�����ҵ������ϸ�֡����벻ƥ��', '������ҵ����ࡱ�͡�����ҵ������ϸ�֡����벻ƥ��', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE ((A.#table_field# = #num1# AND A.#table_field_1# NOT IN (#num01#)) OR (A.#table_field# = ''#num2#'' AND A.#table_field_1# NOT IN (#num02#)) OR (A.#table_field# = ''#num3#'' AND A.#table_field_1# NOT IN (#num03#)) OR (A.#table_field# = ''#num4#'' AND A.#table_field_1# NOT IN (#num04#)) OR (A.#table_field# = ''#num5#'' AND A.#table_field_1# NOT IN (#num05#)) OR (A.#table_field# = ''#num6#'' AND A.#table_field_1# NOT IN (#num06#)) OR (A.#table_field# = ''#num7#'' AND A.#table_field_1# NOT IN (#num07#))) [AND #validate_date# = ''#currentDate#''] {AND A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('EEF_ACCTSTATUS2_CLOSEDATE_ISNOTNULL', '���ҽ������˻�״̬��Ϊ��2-�رա������˻��ر����ڡ�����Ϊ��ֵ', '���ҽ������˻�״̬��Ϊ��2-�رա������˻��ر����ڡ�����Ϊ��ֵ', 'SELECT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE (A.#table_field# = ''#num1#'' AND A.#table_field_1# IS NULL) [AND #validate_date# = ''#currentDate#''] {AND A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('EEF_CLOSEDATE_NOTNULLANDEARLIERTHAN_OTHERDATE', '�˻���Ϣ��¼��������˻��ر����ڡ������Ϊ�գ��˻��ر�����Ӧ�����ڡ����仯���ڡ������弶�����϶����ڡ�', '�˻���Ϣ��¼��������˻��ر����ڡ������Ϊ�գ��˻��ر�����Ӧ�����ڡ����仯���ڡ������弶�����϶����ڡ�', 'SELECT DISTINCT A.#table_pk#,'''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE(A.#table_field# IS NOT NULL AND (A.#table_field# < A.#table_field_1# OR A.#table_field# < A.#table_field_2#))[AND #validate_date# = ''#currentDate#''] {AND A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('EEC_ARLPCERTTYPE_BELONGTO_INFOIDTYPE', '��ػ��������˶��С������𡱺͡���������ݱ�ʶ���͡����������ƥ��', '��ػ��������˶��С������𡱺͡���������ݱ�ʶ���͡����������ƥ��', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE ((A.#table_field# = ''#num1#'' AND A.#table_field_1# NOT IN (#num01#)) OR (A.#table_field# = ''#num2#'' AND A.#table_field_1# NOT IN (#num02#))) [AND #validate_date# = ''#currentDate#''] {AND A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('EEC_ARLPTYPE2_WARTYSIGN_AND_MAXGUARMCC_ISNOTNULL', '�����������������͡�Ϊ��2-�������ˡ�ʱ����������־��������֤��ͬ��š���ӦΪ��', '�����������������͡�Ϊ��2-�������ˡ�ʱ����������־��������֤��ͬ��š���ӦΪ��', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE (A.#table_field# = ''#num2#'' AND (A.#table_field_1# IS NULL OR A.#table_field_2# IS NULL)) [AND #validate_date# = ''#currentDate#''] {AND A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('D_O_B_FCS_INFO_UP_DATE_one', '��������Ӧ��������Ϣ��������', '��������Ӧ��������Ϣ��������', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_field#>TO_DATE(#table_field3_a1#,''yyyy-mm-dd hh24:mi:ss'') [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('Date_Check', '��������Ҫ��������Ϣ��������', '�����ſ���Ϣ���г�������Ҫ��������Ϣ��������', 'SELECT DISTINCT a.#table_pk#,'''' business_pk, a.#master_table_id# as master_table_id FROM #table_name# a WHERE a.#table_field_1# > a.#table_field# [and #validate_date# = ''#currentDate#''] {and a.#table_pk#=''#tablePk#''}
', 'analyticValidateServiceImpl_sql');
COMMIT;
