DELETE FROM VALIDATE_TEMPLATE;
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_EDB_REPAYMODE_AND_ACCTTYPE', '还款方式的代码表必须和账户类型相匹配', '还款方式的代码表必须和账户类型相匹配', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_1# B ON A.#table_pk_1# = B.#table_pk_1# WHERE ((B.#table_field_1# = ''#num1#'' AND A.#table_field# IN (#num2#)) OR (B.#table_field_1# = #num3# AND A.#table_field# IN (#num4#)) OR (B.#table_field_1# = ''#num5#'' AND A.#table_field# IN (#num6#))) [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_EDC_TWOMARK_LOAN_AND_DUTY', '借款人两标（身份标识类型,身份标识号码）和责任人两标不能相同', '借款人两标（身份标识类型,身份标识号码）和责任人两标不能相同', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_1# B ON A.#table_pk_1# = B.#table_pk_1# WHERE ARLP_ID_TYPE=''2'' AND (A.#table_field# = B.#table_field_1# AND A.#table_field_2# = B.#table_field_3#) [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_EDC_ARLPCERTTYPE_AND_ARLPIDTYPE', '对于相关还款责任人段中的身份类别和责任人身份标识类型的代码必须匹配：当身份类别为2-组织机构时，责任人身份标识类型只能选择10-中征码（原贷款卡编码）,20-统一社会信用代码,30-组织机构代码', '身份类别和责任人身份标识类型的代码必须匹配', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE ((A.#table_field# = (''#num1#'') AND A.#table_field_1# NOT IN (#num3#)) OR (A.#table_field# = (''#num2#'') AND A.#table_field_1# NOT IN (#num4#)) ) [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_EDG_ACCTSTATUS21_AND_ACCTBAL0', '若账户状态为21-关闭时，余额,当前逾期总额,当前逾期本金和当前逾期天数必须为 0。', '若账户状态为21-关闭时，余额,当前逾期总额,当前逾期本金和当前逾期天数必须为 0。', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE (A.#table_field# = (''#num1#'') AND (A.#table_field_1# NOT IN (#num2#) OR A.#table_field_2# NOT IN (#num2#) OR A.#table_field_3# NOT IN (#num2#) OR A.#table_field_4# NOT IN (#num2#))) [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''} ', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_EDG_ACCTSTATUS21_AND_CLOSEDATENOTNULL', '当且仅当账户状态为21-关闭时，账户关闭日期不能为空值', '当且仅当账户状态为21-关闭时，账户关闭日期不能为空值', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE (A.#table_field# = (''#num1#'') AND A.#table_field_1# IS NULL)[AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''} ', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_EDG_ACCTSTATUS21_AND_TOTOVERD', '若账户状态为31-呆账（已核销）,32-呆账（进入核销认定程序，等待核销）时，当前逾期总额不能为 0。', '若账户状态为31-呆账（已核销）,32-呆账（进入核销认定程序，等待核销）时，当前逾期总额不能为 0。', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE (A.#table_field# IN (#num1#) AND A.#table_field_1# = ''#num2#'') [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_EDG_OVERDPRINC_AND_OVERDPRINC', '对于 D1/D2/R1/R4 账户，信息记录中当前逾期本金必须小于等于当前逾期总额', '对于 D1/D2/R1/R4 账户，信息记录中当前逾期本金必须小于等于当前逾期总额', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_1# B ON A.#table_pk_1# = B.#table_pk_1# WHERE (B.#table_field_1# IN (#num1#) AND A.#table_field# > A.#table_field_2#) [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('SHEET_TYPE_is_ten', '报表类型必须填写10', '报表类型必须填写10', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_field# != #sheet_type# [and #validate_date# =''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_EDA_ACCTTYPE_AND_EDB_REPAYMODE', '账户类型与还款方式校验', '若账户类型为 #n1# 时，账户基本信息段中的还款方式必须不为 #n2#', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_1# B ON A.#table_pk_1# = B.#table_pk_1# WHERE (B.#table_field_1# IN (#num1#) AND A.#table_field# IN (#num2#)) [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_EDG_LATRPYPRINCAMT_AND_LATRPYAMT', '最近一次实际归还本金必须小于等于最近一次实际还款金额', '最近一次实际归还本金必须小于等于最近一次实际还款金额', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE (A.#table_field# > A.#table_field_1#) [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''} ', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_EDG_TOTOVERD_AND_OVERDDY', '当且仅当当前逾期总额大于 0，则当前逾期天数不为 0', '当且仅当当前逾期总额大于 0，则当前逾期天数不为 0', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE (A.#table_field# > ''#num1#'' AND A.#table_field_1# = ''#num1#'') [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''} ', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_EDG_CLOSEDATE_AND_OTHERDATE', '账户关闭日期不为空', '账户关闭日期不早于同一条记录中所有其他业务日期除到期日期外。其他业务日期除到期日期外包括但不限于余额变化日期,五级分类认定日期,最近一次实际还款日期,最近一次约定还款日期,下一次约定还款日期和交易日期', 'SELECT DISTINCT A.#table_pk#,'''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_1# B ON A.#table_pk_1# = B.#table_pk_1# LEFT JOIN #table_3# C ON A.#table_pk_1# = C.#table_pk_1# WHERE(A.#table_field# < B.#table_field_1# OR A.#table_field# < A.#table_field_2# OR A.#table_field# < A.#table_field_3# OR A.#table_field# < A.#table_field_4# OR A.#table_field# < A.#table_field_5# OR A.#table_field# < A.#table_field_6# OR A.#table_field# < C.#table_field_7# ) AND(A.#table_field# > A.#table_field_5# OR A.#table_field# > A.#table_field_6# OR A.#table_field# > C.#table_field_7# )[AND #validate_date# = ''#currentDate#'' ] {AND A.#table_pk#= ''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_EDG_ACCTSTATUS2_AND_NXTAGRRRPYDATE', '当账户状态为2-关闭时，则下一次约定还款日期必须为空', '当账户状态为2-关闭时，则下一次约定还款日期必须为空', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE (A.#table_field# = ''#num1#'' AND A.#table_field_1# IS NOT NULL) [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_EDG_NXTAGRRRPYDATE_AND_OTHERDATE', '当下一次约定还款日期不为空时，必须不早于余额变化日期,最近一次实际还款日期,最近一次约定还款日期,五级分类认定日期', '当下一次约定还款日期不为空时，必须不早于余额变化日期,最近一次实际还款日期,最近一次约定还款日期,五级分类认定日期', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE (A.#table_field# IS NOT NULL AND(A.#table_field# < A.#table_field_1# OR A.#table_field# < A.#table_field_2# OR A.#table_field# < A.#table_field_3# OR A.#table_field# < A.#table_field_4#)) [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''} ', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_EDA_RPTDATE_AND_NXTAGRRRPYDATE', '信息报告日期应不晚于同一条记录中下一次约定还款日期', '信息报告日期应不晚于同一条记录中下一次约定还款日期', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_1# B ON A.#table_pk# = B.#table_pk# WHERE (A.#table_field# < (date_format(B.#table_field_1#,''%Y-%m-%d %H:%i:%s''))) [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_EDH_CHANTRANTYPE_AND_DUETRANMON', '当账户信息记录中的交易类型为11-展期，到期日期变更月数>0', '当账户信息记录中的交易类型为11-展期，到期日期变更月数>0', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE (A.#table_field# = ''#num1#'' AND A.#table_field_1# <= ''#num2#'') [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_EDH_CAGOFTRDNM', '交易个数应大于应0', '交易个数应大于应0', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE (A.#table_field# <= ''#num1#'') [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_EDB_OPENDATE_AND_OTHERDATE', '开户日期不晚于同一条记录中的所有其他业务日期。其他业务日期包括但不限于：到期日期,余额变化日期,五级分类认定日期,最近一次实际还款日期,最近一次约定还款日期,下一次约定还款日期,账户关闭日期和交易日期', '开户日期不晚于同一条记录中的所有其他业务日期。其他业务日期包括但不限于：到期日期,余额变化日期,五级分类认定日期,最近一次实际还款日期,最近一次约定还款日期,下一次约定还款日期,账户关闭日期和交易日期', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_1# B ON A.#table_pk_1# = B.#table_pk_1# LEFT JOIN #table_2# C ON A.#table_pk_1# = C.#table_pk_1# WHERE (A.#table_field# > A.#table_field_1# OR A.#table_field# > B.#table_field_2# OR A.#table_field# > B.#table_field_3# OR A.#table_field# > B.#table_field_4# OR A.#table_field# > B.#table_field_5# OR A.#table_field# > B.#table_field_6# OR A.#table_field# > B.#table_field_7# OR A.#table_field# > C.#table_field_8#) [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''} ', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_PBG_ACCTSTATUS_RPTDATE', '更正月度表现信息段时，若库中存在信息报告日期更晚的月度表现，则更正请求记录中账户状态不能为“关闭”/“销户”', '更正月度表现信息段时，若库中存在信息报告日期更晚的月度表现，则更正请求记录中账户状态不能为“关闭”/“销户”', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_1# B ON A.#table_pk_1# = B.#table_pk_1# WHERE (B.#table_field_1# < (SELECT MAX(#table_field_1#) FROM #table_1# WHERE #table_field_2# = ''#num1#'' AND #table_pk_1# NOT IN (B.#table_pk_1#)) AND A.#table_field# IN (#num3#)) [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_jd_is_two1', '当账户信息记录中账户类型为R3时，透支 180 天以上未还余额应该小于等于余额', '当账户信息记录中账户类型为R3时，透支 180 天以上未还余额应该小于等于余额', 'SELECT #table_pk#,''''business_pk, B.#master_table_id# as master_table_id FROM #table_name_A# A LEFT JOIN #table_name# B ON A.#table_field_A_pk#=B.#table_field_A_pk# WHERE A.#a1_field2#=#a1_field_type1# AND B.#table_field#>B.#b1_field1# [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_jd_is_two2', '当账户信息记录中账户类型为R3时，当前还款状态为*时，余额必须为 0', '当账户信息记录中账户类型为R3时，当前还款状态为*时，余额必须为 0', 'SELECT #table_pk#,''''business_pk, B.#master_table_id# as master_table_id FROM #table_name_A# A LEFT JOIN #table_name# B ON A.#table_field_A_pk#=B.#table_field_A_pk# WHERE A.#a1_field2#=#a1_field_type1# AND B.#b1_field1# IN(#b1_field_type1#) AND B.#table_field# != #b2_field_type2# [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_jd_is_two3', '当账户信息记录中账户类型为R3时，当前还款状态为数字1-7时，余额必须大于 0', '当账户信息记录中账户类型为R3时，当前还款状态为数字1-7时，余额必须大于 0', 'SELECT #table_pk#,''''business_pk, B.#master_table_id# as master_table_id FROM #table_name_A# A LEFT JOIN #table_name# B ON A.#table_field_A_pk#=B.#table_field_A_pk# WHERE A.#a1_field1#=#a1_field_type1# AND #b1_field1# IN(#b1_field_type1#) AND #table_field# <= #b1_field_type2# [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_ACCTTYPE', '待更正的段不能为基础段中“账户类型”所不适用的信息段', '待更正的段不能为基础段中“账户类型”所不适用的信息段', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE (A.#table_field# NOT IN (#num1#)) [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_PCC_ACCTSTATUS_RPTDATE', '更正额度信息段时，若库中存在信息报告日期更晚的额度信息段，则更正请求记录中额度状态不能为“到期/失效”', '更正额度信息段时，若库中存在信息报告日期更晚的额度信息段，则更正请求记录中额度状态不能为“到期/失效”', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_1# B ON A.#table_pk_1# = B.#table_pk_1# WHERE (B.#table_field_1# < (SELECT MAX(#table_field_1#) FROM #table_1# WHERE #table_field_2# = ''#num1#'' AND #table_pk_1# NOT IN (B.#table_pk_1#)) AND A.#table_field# IN (''#num3#'')) [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_PBA_MDFCSGMTCODE', '待更正的段和待更正的段标应保持一致', '待更正的段和待更正的段标应保持一致', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_1# B ON A.#table_pk# = B.#table_pk# LEFT JOIN #table_2# C ON A.#table_pk# = C.#table_pk# LEFT JOIN #table_3# D ON A.#table_pk# = D.#table_pk# LEFT JOIN #table_4# E ON A.#table_pk# = E.#table_pk# WHERE ((A.#table_field# = (''#num1#'') AND A.#table_pk# IS NULL) OR (A.#table_field# = (''#num2#'') AND B.#table_pk# IS NULL) OR (A.#table_field# = (''#num3#'') AND C.#table_pk# IS NULL) OR (A.#table_field# = (''#num4#'') AND D.#table_pk# IS NULL) OR (A.#table_field# = (''#num5#'') AND E.#table_pk# IS NULL)) [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHAR_MDFCSGMTCODEJ_RPTDATE', '更正非月度表现信息段时，若存在信息报告日期相同的特殊事件信息记录，则该记录不应被加载', '更正非月度表现信息段时，若存在信息报告日期相同的特殊事件信息记录，则该记录不应被加载', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE (A.#table_field_1# = ''#num1#'' AND (SELECT COUNT(#table_pk#) FROM #table_name# WHERE #table_field_1# = ''#num2#'' AND #table_field# = A.#table_field#) > 0) [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('PDE_GR_REPYMT_INF_SGMT_TEN_IS_NOT_NULL', '报告时点说明代码为20-账户关闭,30-在保责任变化,40-五级分类调整时，至少应出现在保责任信息段', '报告时点说明代码为20-账户关闭,30-在保责任变化,40-五级分类调整时，至少应出现在保责任信息段', 'SELECT DISTINCT A.#table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_name_B2# B ON A.#table_pk#=B.#table_pk# WHERE A.#table_field# IN(#A_CODE2#) AND B.#table_pk# IS NULL [and #validate_date# = ''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('PDC_RLT_REPYMT_INF_SGMT_IS_NOT_NULL', '报告时点说明代码为10-新开户/首次上报且反担保方式为1-保证时，应出现相关还款责任人信息段', '报告时点说明代码为10-新开户/首次上报且反担保方式为1-保证时，应出现相关还款责任人信息段', 'SELECT DISTINCT C.#table_pk#,''''business_pk, C.#master_table_id# as master_table_id FROM #table_name_A# A LEFT JOIN #table_name_B# B ON A.#master_table_id#=B.#master_table_id# LEFT JOIN  #table_name# C ON A.#master_table_id#=C.#master_table_id# WHERE A.#table_field_A_CODE#=#A_CODE3# AND C.#table_field#=#C_MODE# AND B.#master_table_id# IS NULL [and #validate_date# = ''#currentDate#''] {and C.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('PDE_GR_REPYMT_INF_SGMT_FIFTY_IS_NULL', '报告时点说明代码为50-其他信息变化时，不包括在保责任信息段', '报告时点说明代码为50-其他信息变化时，不包括在保责任信息段', 'SELECT B.#table_pk#,''''business_pk ,#table_field#, B.#master_table_id# as master_table_id FROM #table_name_A# A LEFT JOIN #table_name# B ON A.#table_name_A_ID#=B.#table_name_A_ID# WHERE A.#table_field_A# IN (#A_CODE4#) AND B.#master_table_id# IS NOT NULL [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('OPEN_DAT_DUE_DATE', '开户日期应不晚于到期日期', '开户日期应不晚于到期日期', 'SELECT A.#table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE #table_field#>#table_field_DUE# [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('DATA_IS_NOT_NULL', '如果账户状态为2-关闭，则账户关闭日期不能为空值', '如果账户状态为2-关闭，则账户关闭日期不能为空值', 'SELECT #table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE #table_field_A#=#A_STATUS# AND #table_field# IS NULL [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('ARLP_TYPE_is_not_null', '当还款责任人类型为2-反担保人时，联保标志、保证合同编号不应为空', '当还款责任人类型为2-反担保人时，联保标志、保证合同编号不应为空', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_field#=#table_field_TYPE# AND (#table_field_WARTY_SIGN# IS NULL OR #table_field_MAX_GUAR_MCC# IS NULL) [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_EDC_ARLPTYPE_AND_ARLPAMT', '还款责任人类型为1-共同借款人时，还款责任金额为空，否则不能为空值', '还款责任人类型为1-共同借款人时，还款责任金额为空，否则不能为空值', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE ((A.#table_field# = (#num1#) AND  A.#table_field_1# is not null) OR (A.#table_field# IN (#num2#) AND  A.#table_field_1# is null)) [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_EDC_ARLPTYPE_AND_WARTYSIGN_MAXGUARMCC', '还款责任人类型为2-保证人时，联保标志,保证合同编号必须不能为空值', '还款责任人类型为2-保证人时，联保标志,保证合同编号必须不能为空值', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE(A.#table_field# = (''#num1#'') AND (A.#table_field_1# IS NULL OR A.#table_field_2# IS NULL)) [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_EDA_RPTDATECODE20_AND_ACCTSTATUS', '当且仅当报告时点说明代码为20-账户关闭 时，账户状态为21-关闭', '当且仅当报告时点说明代码为20-账户关闭 时，账户状态为21-关闭', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_1# B ON A.#table_pk# = B.#table_pk# WHERE (A.#table_field# = ''#num1#'' AND B.#table_field_1# NOT IN (#num2#)) [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''} ', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_EDB_ACCTTYPEC1_AND_BUSILINES', '当账户类型为C1时，信贷业务大类只能为51-资产处置,41-垫款', '当账户类型为C1时，信贷业务大类只能为51-资产处置,41-垫款', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_1# B ON A.#table_pk_1# = B.#table_pk_1# WHERE (B.#table_field_1# = ''#num1#'' AND A.#table_field# NOT IN (#num2#)) [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_EDH_TRANAMT_AND_LOANAMT', '交易金额小于等于借款金额', '交易金额小于等于借款金额', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_1# B ON A.#table_pk_1# = B.#table_pk_1# WHERE (A.#table_field# > B.#table_field_1#) [AND #validate_date# = ''#currentDate#''] {AND A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('RPT_DATE_CODE_TEN_IS_NOT_NULL', '报告时点说明代码为10-新开户/首次上报，至少应出现账户基本信息段、在保责任信息段', '报告时点说明代码为10-新开户/首次上报，至少应出现账户基本信息段、在保责任信息段', 'SELECT DISTINCT A.#table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN  #table_name_B# B ON A.#table_pk#=B.#table_pk# LEFT JOIN #table_name_C# C ON A.#table_pk#=C.#table_pk#
WHERE A.#table_field#=#A_CODE# AND (B.#table_pk# IS NULL OR C.#table_pk# IS NULL) [and #validate_date# = ''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('table_is_not_null', '报告时点说明代码为10-新增客户/首次上报，至少包含基本概况信息段、教育信息段、居住地址段、通讯地址段、婚姻信息段、职业信息段', '报告时点说明代码为10-新增客户/首次上报，至少包含基本概况信息段、教育信息段、居住地址段、通讯地址段、婚姻信息段、职业信息段', 'SELECT DISTINCT A.#table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_name_B# B ON A.#table_pk#=B.#table_pk# LEFT JOIN #table_name_C# C ON A.#table_pk#=C.#table_pk# LEFT JOIN #table_name_D# D ON A.#table_pk#=D.#table_pk# LEFT JOIN #table_name_E# E ON A.#table_pk#=E.#table_pk#
LEFT JOIN #table_name_F# F ON A.#table_pk#=F.#table_pk# LEFT JOIN #table_name_G# G ON A.#table_pk#=G.#table_pk# WHERE A.#table_field#=#a_field# AND (B.#table_pk# IS NULL OR C.#table_pk# IS NULL OR D.#table_pk# IS NULL OR E.#table_pk# IS NULL OR F.#table_pk# IS NULL OR G.#table_pk# IS NULL) [and #validate_date# = ''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('FIDLD_IS_NULL_OR_NOT_NULL', '就业状况为11、13、17、21、24、91时，单位名称、性质、所属行业、详细地址、所在地邮编、所在地行政区划、电话、职业、职务、职称和本单位工作起始年份必须出现', '就业状况为11、13、17、21、24、91时，单位名称、性质、所属行业、详细地址、邮编、所在地行政区划、电话、职业、职务、职称和工作起始年份必须出现；就业状况为上述以外的代码，上述数据项不能出现。', 'SELECT A.#table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE (#table_field# IN (#a_field2#) AND (#table_field_a1# IS NULL OR #table_field_a2# IS NULL OR #table_field_a3# IS NULL OR #table_field_a4# IS NULL OR #table_field_a5# IS NULL OR #table_field_a6# IS NULL OR #table_field_a7# IS NULL OR #table_field_a8# IS NULL OR #table_field_a9# IS NULL OR #table_field_a10# IS NULL OR #table_field_a11# IS NULL)) OR (#table_field# NOT IN (#a_field2#) AND (#table_field_a1# IS NOT NULL OR #table_field_a2# IS NOT NULL OR #table_field_a3# IS NOT NULL OR #table_field_a4# IS NOT NULL OR #table_field_a5# IS NOT NULL OR #table_field_a6# IS NOT NULL OR #table_field_a7# IS NOT NULL OR #table_field_a8# IS NOT NULL OR #table_field_a9# IS NOT NULL OR #table_field_a10# IS NOT NULL OR #table_field_a11# IS NOT NULL)) [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('FIDLD2_IS_NULL_OR_NOT_NULL', '婚姻状况为已婚、初婚、再婚、复婚时，配偶姓名、配偶证件类型、配偶证件号码、配偶联系电话、配偶工作单位必须出现', '婚姻状况为已婚、初婚、再婚、复婚时，配偶姓名、配偶证件类型、配偶证件号码、配偶联系电话、配偶工作单位必须出现；', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE (#table_field# IN(#a2_field#) AND (#table_field2_a1# IS NULL OR #table_field2_a2# IS NULL OR #table_field2_a3# IS NULL OR  #table_field2_a4# IS NULL OR #table_field2_a5# IS NULL)) OR (#table_field# NOT IN(#a2_field#) AND (#table_field2_a1# IS NOT NULL OR #table_field2_a2# IS NOT NULL OR #table_field2_a3# IS NOT NULL OR #table_field2_a4# IS NOT NULL OR #table_field2_a5# IS NOT NULL)) [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('one_not_null', '配偶证件类型、配偶证件号码其中之一不为空时，另一个应不为空', '配偶证件类型、配偶证件号码其中之一不为空时，另一个应不为空', 'SELECT #table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE (#table_field# IS NOT NULL AND #table_field4_a1# IS NULL) OR (#table_field4_a1# IS NOT NULL AND #table_field# IS NULL) [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('EDU_LEVEL_ACA_DEGREE_one', '当学历为30-大专、40-中专、职高、技校、70-初中、80-小学时，学位只能为5-无或9-未知', '当学历为30-大专、40-中专、职高、技校、70-初中、80-小学时，学位只能为5-无或9-未知', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_field# IN(#a5_field1#) AND #table_field5_a1# NOT IN(#a5_field2#) [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_jd_is_one12', '对于 D1/R1/R4 账户，信息记录中“当前逾期本金”必须小于等于“当前逾期总额', '对于 D1/R1/R4 账户，信息记录中“当前逾期本金”必须小于等于“当前逾期总额', 'SELECT A.#table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A, #table_name_B# B WHERE A.#table_field_B_PK#=B.#table_field_B_PK# AND B.#table_field1# IN(#field1#) AND #table_field#>#table_field2# [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_jd_is_one13', '若“账户状态”为“3-关闭”/“4-销户”，“余额”应为 0', '若“账户状态”为“3-关闭”/“4-销户”，“余额”应为 0', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_field# IN(#field1#) AND #table_field1# !=#field2# [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_jd_is_one14', '“账户状态”和“当前还款状态”需要保持一致：“账户状态”为“3-关闭”/“4-销户”时，“当前还款状态”应为“C-结清”/“C-销户”、“G-结束', '“账户状态”和“当前还款状态”需要保持一致：“账户状态”为“3-关闭”/“4-销户”时，“当前还款状态”应为“C-结清”/“C-销户”、“G-结束', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_field# IN(#field1#) AND #table_field2# NOT IN(#field2#) [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_jd_is_one15', '若“账户关闭日期”数据项不为空，则“账户关闭日期”应不早于“结算/应还款日”、最近一次实际还款日期”、五级分类认定日期', '若“账户关闭日期”数据项不为空，则“账户关闭日期”应不早于“结算/应还款日”、最近一次实际还款日期”、五级分类认定日期', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_field# IS NOT NULL AND (#table_field#<#table_field1# OR #table_field#<#table_field2# OR #table_field#<#table_field3#) [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_jd_is_one16', '若“账户状态”为“3-关闭”/“4-销户”，“账户关闭日期”不能为空值', '若“账户状态”为“3-关闭”/“4-销户”/“2-结束”，“账户关闭日期”不能为空值', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_field# IN(#field1#) AND #table_field1# IS NULL [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_jd_is_one17', '当账户状态为“关闭”/“销户”时，“当前逾期总额”、“当前逾期期数”应为 0', '当账户状态为“关闭”/“销户”时，“当前逾期总额”、“当前逾期期数”应为 0', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_field# IN(#field1#) AND (#table_field1# !=#field2# OR #table_field2#!=#field2#) [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_jd_is_one18', '“分期额度生效日期”应不晚于“分期额度到期日期', '“分期额度生效日期”应不晚于“分期额度到期日期', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_field#>#table_field1# [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_jd_is_one19', '“当前还款状态”只能为“N-正常', '“当前还款状态”只能为“N-正常', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_field# != #field1# [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_jd_is_one20', '若“账户关闭日期”数据项不为空，则“账户关闭日期”应不早于“最近一次实际还款日期”、“五级分类认定日期', '若“账户关闭日期”数据项不为空，则“账户关闭日期”应不早于“最近一次实际还款日期”、“五级分类认定日期', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_field# IS NOT NULL AND (#table_field#<#table_field1# OR #table_field#<#table_field2#) [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_jd_is_one21', '若“账户状态”为“2-结束”，则“余额”应为 0', '若“账户状态”为“2-结束”，则“余额”应为 0', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_field#=#field1# AND #table_field1# !=#field2# [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_jd_is_one6', '对于 R2 账户，“当前还款状态”为“*-当月未使用额度且不需要还款”时，“实际还款比例”应为空值', '对于 R2 账户，“当前还款状态”为“*-当月未使用额度且不需要还款”时，“实际还款比例”应为空值', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_field#=#field1# AND #table_field1# IS NOT NULL [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_jd_is_one7', '结算/应还款日”与“月份”中的年、月必须保持一致', '结算/应还款日与月份中的年、月必须保持一致', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE substr(date_format(#table_field#,''%Y-%m-%d %H:%i:%s''),0,7) != #table_field1# [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_jd_is_one8', '账户状态为41-呆账（进入核销认定程序，等待核销）/51-呆账（进入核销认定程序，等待核销）、42-呆账（已核销）/52-呆账（已核销）时，当前逾期总额不能为 0', '账户状态为41-呆账（进入核销认定程序，等待核销）/51-呆账（进入核销认定程序，等待核销）、42-呆账（已核销）/52-呆账（已核销）时，当前逾期总额不能为 0', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_field# IN(#field1#) AND #table_field1# = #field2# [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_A_THREEMARK_AND_MNGMTORGCOD_OTHERNULL', '当更正基础段时，基础段中仅出现信息主体三项标识、“业务管理机构代码”，其他数据项不出现。', '当更正基础段时，基础段中仅出现信息主体三项标识、“业务管理机构代码”，其他数据项不出现。', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE (A.#table_field# = ''#num1#'' AND (A.#table_field_1# IS NOT NULL OR A.#table_field_2# IS NOT NULL OR A.#table_field_3# IS NOT NULL OR A.#table_field_4# IS NOT NULL OR A.#table_field_5# IS NOT NULL OR A.#table_field_6# IS NOT NULL OR A.#table_field_7# IS NOT NULL OR A.#table_field_8# IS NOT NULL OR A.#table_field_9# IS NOT NULL OR A.#table_field_10# IS NOT NULL OR A.#table_field_11# IS NOT NULL OR A.#table_field_12# IS NOT NULL OR A.#table_field_13# IS NOT NULL OR A.#table_field_14# IS NOT NULL OR A.#table_field_15# IS NOT NULL OR A.#table_field_16# IS NOT NULL )) [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_MDFCSGMTCODEC_RPTDATE', '信息报告日期应不早于库中最晚的信息报告日期', '信息报告日期应不早于库中最晚的信息报告日期', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE (A.#table_field_1# = ''#num1#'' AND A.#table_field# < (SELECT MAX(#table_field#) FROM #table_name# WHERE #table_field_1# = ''#num1#'' AND #table_pk# NOT IN (A.#table_pk#))) [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('value_is_false', '值不正确', '#m1#=#m2#-#m3#', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_field# !=(#table_field_REVENUE#-#table_field_EXPENDITURE#) [and #validate_date# =''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('value_is_false_2', '值不正确', '#m4#=#m5#+#m6#', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_field# != (#table_field_CURRENT_ASSETS#+#table_field_NON_CURRENT_ASSETS#) [and #validate_date# =''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('value_is_false_3', '资产总计=负债和净资产总计', '#m7#=#m8#', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_field# != #table_field_TOTAL_LIABILITIES_AND_NET_ASSE# [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('value_is_false_4', '负债和所有者权益总计=负债合计+少数股东权益+所有者权益合计', '#m9#=#m10#+#m11#+#m12#', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_field# != (#table_field_CURRENT_ASSETS1#+#table_field_NON_CURRENT_ASSETS1# + #table_field_TOTAL_EQUITY1#) [and #validate_date# =''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('value_is_false_5', '现金及现金等价物净增加额＝筹集活动产生的现金流量净额＋汇率变动对现金的影响＋经营活动产生的现金流量净额＋投资活动产生的现金流量净额', '#m13#=#m14#+#m15#+#m16#+#m17#', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_field# != (#table_field_CURRENT_ASSETS2#+#table_field_NON_CURRENT_ASSETS2# + #table_field_TOTAL_EQUITY2#+#table_field_FROM_INVESTING2#) [and #validate_date# =''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('Information_section_is_null_not', '关键信息段必须出现（企业授信协议记录报送时，基础段和额度信息段必须出现）', '#m18#必须出现，新增完#m18#请重新保存基础段', 'SELECT A.#table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_name_EGC_CREDIT_LIM_SGMT# B ON A.#table_pk#=B.#table_pk# WHERE A.#table_field#=''#INF_REC_TYPE001#'' AND #table_pk_EGC_CREDIT_LIM_SGMT_ID# IS NULL [and #validate_date# = ''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('a_not_null_another_not_null', '授信限额编号、授信限额其中之一不为空时，另一个应不为空', '当#m22#，#m23#其中之一不为空时，另一个应不为空', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE (#table_field_CREDIT_REST# is NULL AND #table_field# is not NULL) OR (#table_field# IS NULL AND #table_field_CREDIT_REST# IS NOT NULL) [and #validate_date# =''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('ID_NUM_and_ID_TYPE_not_repeat_02', '受信人两标与共同受信人两标不能相同', '#m26#与#m27#不能相同', 'SELECT B.#table_pk#,''''business_pk, B.#master_table_id# as master_table_id FROM #table_name_EGA_CTRCT_BS_SGMT# A ,#table_name# B WHERE A.#table_field_SGMT_ID#=B.#table_field_SGMT_ID# AND #table_field_TYPE#=#table_field_IDTYPE# AND #table_field_NUM# = #table_field# AND BRER_TYPE=''2'' [and #validate_date# =''#currentDate#''] {and B.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('COUNT_More_than_zero', '个数应大于 0', '#m31#个数应大于#m32#', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_pk# IN(SELECT #table_pk# FROM #table_name_EFA_SGMT1# A LEFT JOIN #table_name# B ON A.#table_field_EFA_BS_ID1#=B.#table_field_EFA_BS_ID1# LEFT JOIN #table_name_EFD_SGMT1# C ON A.#table_field_EFA_BS_ID1#=C.#table_field_EFA_BS_ID1#  GROUP BY #table_pk# HAVING  COUNT(#table_field_EFD_SGMT_ID1#)<=0) AND #table_field#=''#GUAR_TYPE1#'' [and #validate_date# =''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('mingxiduan_is_not_null_01', '该模板用于校验企业借贷账户中多个账户类型或单个账户类型在某一个报送时点时应该包括的单个明细段', '报送时点说明代码为#ms1#，账户类型为#ms2#应包含#ms3#', 'SELECT A.#table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_name_A_not_null# B ON A.#table_pk#=B.#table_pk# WHERE A.#table_field# IN (#table_field_code#) AND A.#table_field_accttype# IN (#accttype#) AND B.#table_field_A_pk# IS NULL [and #validate_date# =''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('mingxiduan_is_not_null_02', '该模板用于校验企业借贷账户中多个账户类型或单个账户类型在某一个报送时点时应该包括的两个明细段', '报送时点说明代码为#ms4#，账户类型为#ms5#应包含#ms6#', 'SELECT A.#table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_name_A1_not_null# B ON A.#table_pk#=B.#table_pk# LEFT JOIN #table_name_B1_not_null# C ON A.#table_pk#=C.#table_pk# WHERE (A.#table_field# IN (#table_field_code1#) AND A.#table_field_accttype1# IN (#accttype1#)) AND (B.#table_field_A1_pk_not_null# IS NULL OR C.#table_field_B1_pk_not_null# IS NULL) [and #validate_date# =''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('mingxiduan_is_not_null_03', '该模板用于校验企业借贷账户中多个账户类型或单个账户类型在某一个报送时点时且分次放款标识为单个或者多个时应该包括的单个明细段', '报送时点说明代码为#ms7#，账户类型为#ms8#且分次放款标识为#ms9#，则应包含#ms10#。', 'SELECT #table_pk#,''''business_pk, B.#master_table_id# as master_table_id FROM #table_name_A2_not_null# A LEFT JOIN #table_name# B ON A.#table_field_A2_PK#=B.#table_field_A2_PK# LEFT JOIN #table_name_B2_not_null# C ON A.#table_field_A2_PK#=C.#table_field_A2_PK# WHERE (A.#table_field_A2_code2# IN(#table_field_code2#) AND A.#table_field_accttype2# IN (#accttype2#) AND B.FLAG IN(#flag2#)) AND C.#table_field_B2_pk_not_null# IS NULL [and #validate_date# =''#currentDate#''] {and B.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('grsx_I2200A01', '“受信人证件类型”、“受信人证件号码”与“共同受信人身份标识类型”、“共同受信人身份标识号码”不能相同', '“受信人证件类型”、“受信人证件号码”与“共同受信人身份标识类型”、“共同受信人身份标识号码”不能相同', 'SELECT #table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM I_CTRCT_BS A LEFT JOIN #table_name# B ON A.PCA_CTRCT_BS_SGMT_ID=B.PCA_CTRCT_BS_SGMT_ID WHERE A.ID_TYPE=B.CERT_REL_ID_TYPE AND A.ID_NUM=B.#table_field# AND BRER_TYPE=''1'' [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('mingxiduan_is_not_null_05', '该模板用于某个报送时点不适用单个账户类型或多个账户类型', '账户类型为#ms14#，不适用#ms15#的报送时点', 'SELECT A.#table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE A.#table_field# IN (#table_field_code4#) AND A.#table_field_accttype4# IN (#accttype4#) [and #validate_date# =''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('ID_TYPE_ID_NUM_is_not_the_same', '债务人两标与责任人两标不能相同', '债务人两标与责任人两标不能相同', 'SELECT B.#table_pk#,''''business_pk, B.#master_table_id# as master_table_id FROM #table_name_A# A LEFT JOIN #table_name# B ON A.#table_name_A_ID#=B.#table_name_A_ID# WHERE A.#table_field_ID_TYPE#=B.#table_field_CERT_TYPE# AND A.#table_field_ID_NUM#=B.#table_field# AND INFO_ID_TYPE=''1'' [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('mingxiduan_is_not_null_04', '该模板用于校验企业借贷账户中多个账户类型或单个账户类型在某一个报送时点时应该包括的三个明细段', '报送时点说明代码为#ms11#，账户类型为#ms12#应包含#ms13#', 'SELECT A.#table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_name_A3_not_null# B ON A.#table_pk#=B.#table_pk# LEFT JOIN #table_name_B3_not_null# C ON A.#table_pk#=C.#table_pk# LEFT JOIN #table_name_C3_not_null# D ON A.#table_pk#=D.#table_pk# WHERE (A.#table_field# IN(#table_field_code3#) AND A.#table_field_accttype3# IN (#accttype3#)) AND (B.#table_field_A3_PK_not_null# IS NULL OR C.#table_field_B3_PK_not_null# IS NULL OR D.#table_field_C3_PK_not_null# IS NULL) [and #validate_date# =''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_PCA_MDFC_SGMT_CODE', '待更正的段的内容和待更正的段标应保持一致', '待更正的段的内容和待更正的段标应保持一致', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_1# B ON A.#table_pk# = B.#table_pk# LEFT JOIN #table_2# C ON A.#table_pk# = C.#table_pk# WHERE ((A.#table_field# = (''#num1#'') AND A.#table_pk# IS NULL) OR (A.#table_field# = (''#num2#'') AND B.#table_pk# IS NULL) OR (A.#table_field# = (''#num3#'') AND C.#table_pk# IS NULL)) [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('DEL_REC_CODE_is_null', '待删除的业务标识码必须在库中存在', '待删除的业务标识码必须在库中存在', 'SELECT EEAIED.#table_pk#,''''business_pk, EEAIED.#master_table_id# as master_table_id FROM #table_name# EEAIED WHERE #table_field# NOT IN (SELECT #table_field_ACCT_CODE# FROM #table_name_EDA# WHERE BUSINESS_STATES =''11'') [and #validate_date# =''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('ACCT_CODE_is_not_null', '待更正业务标识码必须在库中存在', '待更正业务标识码必须在库中存在', 'SELECT #table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE #table_field_INF_REC_TYPE1#=''#inf_rec_type2#'' AND #table_field# NOT IN (SELECT #table_field# FROM #table_name# WHERE BUSINESS_STATES =''11'' AND #table_field_INF_REC_TYPE1#=''#inf_rec_type3#'') [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('ACCT_TYPE_is_the_same', '待更正记录基础段的“账户类型”应与库中“账户类型”一致', '待更正记录基础段的“账户类型”应与库中“账户类型”一致', 'SELECT #table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A,(SELECT ACCT_CODE,ACCT_TYPE FROM #table_name# WHERE INF_REC_TYPE=''#inf_rec_type5#'' AND BUSINESS_STATES = ''11'') B WHERE A.ACCT_CODE=B.ACCT_CODE AND INF_REC_TYPE=''#inf_rec_type6#'' AND A.ACCT_TYPE != B.ACCT_TYPE [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('NW_BNES_CODE_not_repeat', '原业务标识码和新业务标识码不能相同', '原业务标识码和新业务标识码不能相同', 'SELECT B.#table_pk#,''''business_pk,B.#table_field#, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_name# B ON (A.#table_field_OD_BNES_CODE#=B.#table_field# AND A.#table_pk#=B.#table_pk#) WHERE A.#table_field_OD_BNES_CODE#=B.#table_field# [and #validate_date# = ''#currentDate#''] {and B.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('ID_NUM_and_ID_TYPE_not_repeat', '更正相关还款责任人段时，责任人两标与借款人两标不能相同', '#m24#与#m25#不能相同', 'SELECT DISTINCT B.#table_pk#,''''business_pk, B.#master_table_id# as master_table_id FROM (SELECT ID_TYPE, ID_NUM, #table_field_ACCT_CODE1#,#table_pk_SGMT_ID3# FROM #table_name_BS_SGMT3# WHERE INF_REC_TYPE=''#inf_rec_type7#'' AND BUSINESS_STATES=''11'') A, (SELECT B.#table_field_CERT_TYPE# ,B.#table_field#,A.ID_NUM,A.ID_TYPE,B.#table_pk_SGMT_ID3#,A.#table_pk_SGMT_ID3# AS EDA_ACCT_BS_SGMT_ID1,A.#table_field_ACCT_CODE1#,A.MDFC_SGMT_CODE,B.#table_pk# FROM #table_name_BS_SGMT3# A,#table_name# B WHERE A.#table_pk_SGMT_ID3#=B.#table_pk_SGMT_ID3# AND A.MDFC_SGMT_CODE=''#mdfc_sgmt_code#'') B WHERE (A.#table_field_ACCT_CODE1#=B.#table_field_ACCT_CODE1# AND A.ID_NUM=#table_field# AND A.ID_TYPE=B.#table_field_CERT_TYPE# ) OR (B.#table_pk_SGMT_ID3#=B.EDA_ACCT_BS_SGMT_ID1 AND B.#table_field_CERT_TYPE#=B.ID_TYPE AND B.#table_field#=B.ID_NUM AND B.MDFC_SGMT_CODE=''#mdfc_sgmt_code#'') [and #validate_date# =''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('RPT_DATE_is_repeat', '更正基础段时，待入库的更正请求记录的信息报告日期应等于库中相应信息段最新的信息报告日期', '更正基础段时，待入库的更正请求记录的信息报告日期应等于库中相应信息段最新的信息报告日期', 'SELECT A.#table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A, (SELECT ACCT_CODE, #table_pk#, MAX(#table_field#) AS RPT_DATE_max FROM #table_name# WHERE INF_REC_TYPE=''#inf_rec_type8#'' AND BUSINESS_STATES=''11'' GROUP BY #table_pk#,ACCT_CODE) B WHERE A.ACCT_CODE=B.ACCT_CODE AND A.MDFC_SGMT_CODE=''#mdfc_sgmt_code2#'' AND A.#table_field#!=B.RPT_DATE_max [and #validate_date# = ''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('ST_AND_ET_IS_NOT_NULL', '待删除起始日期,待删除的终止日期不能同时为空值', '待删除起始日期,待删除的终止日期不能同时为空值', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id from #table_name# WHERE #table_field# IS NULL AND #table_field_DEL_END_DATE# IS NULL [and #validate_date# =''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('ED_No_greater_than_SD', '待删除起始日期必须小于等于待删除的结束日期', '#m19#必须#m21##m20#', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_field_DEL_START_DATE# IS NOT NULL AND #table_field#<#table_field_DEL_START_DATE# [and #validate_date# =''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('Two_standard_not_repeat', '两组身份标识类型身份标识号码不能完全相同', '两组身份标识类型身份标识号码不能完全相同', 'SELECT ECA1.#table_pk#,''''business_pk, ECA1.#master_table_id# as master_table_id FROM #table_name# ECA1,#table_name# ECA2 WHERE ECA1.#table_pk#=ECA2.#table_pk# AND ECA1.#table_field_ENT_CERT_TYPE#=ECA2.#table_field_ASSO_ENT_CERT_TYPE# AND ECA1.#table_field_ENT_CERT_NUM#=ECA2.#table_field# [and #validate_date# =''#currentDate#''] {and ECA1.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('mingxiduan_is_null_01', '该模板用于校验企业借贷账户中多个账户类型或单个账户类型在某一个报送时点时不应该包括的1个明细段', '报送时点说明代码为#ms16#账户类型为#ms17#，不应包含#ms18#', 'SELECT #table_pk#,''''business_pk ,#table_field#, B.#master_table_id# as master_table_id FROM #table_name_A_null# A LEFT JOIN #table_name# B ON A.#table_field_A_pk_null#=B.#table_field_A_pk_null# WHERE A.#table_field_A_rptdatecode_not# IN(#rptdatecode_not#) AND A.#table_field_A_accttype_not# IN(#accttype_not#) AND (#table_pk# IS NOT NULL) [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('mingxiduan_is_null_02', '该模板用于校验企业借贷账户中多个账户类型或单个账户类型在某一个报送时点时且分次放款标识为单个或者多个时不应该包括的单个明细段', '报送时点说明代码为#ms19#账户类型为#ms20#且#ms21#，则不应包含#ms22#', 'SELECT #table_pk#,''''business_pk, #table_field#, C.#master_table_id# as master_table_id FROM #table_name_A2_null# A LEFT JOIN #table_name_B2_null# B ON A.#table_field_A2_pk_null#=B.#table_field_A2_pk_null# LEFT JOIN #table_name# C ON A.#table_field_A2_pk_null#=C.#table_field_A2_pk_null# WHERE A.#table_field_A2_rptdatecode_not# IN(#rptdatecode_not2#) AND B.#table_field_B2_flag_not# IN(#flag_not2#) AND A.#table_field_A2_accttype_not# IN(#accttype_not2#) AND (C.#table_pk# IS NOT NULL) [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CPN_TYPE_OCCUPATION_one', '当单位性质为30-外资企业、40-个体、私营企业、50-其他（包括三资企业、民营企业、民间团体等）时，职业不能为0-国家机关、党群组织、企业、事业单位负责人、X-军人。', '当单位性质为30-外资企业、40-个体、私营企业、50-其他（包括三资企业、民营企业、民间团体等）时，职业不能为0-国家机关、党群组织、企业、事业单位负责人、X-军人。', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_field# IN(#a6_field1#) AND #table_field6_a1# IN(#a6_field2#) [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('NUM_and_TYPE_THE_SAME3', '证件类型、证件号码不能与基础段中的证件类型、证件号码完全相同', '证件类型、证件号码不能与基础段中的证件类型、证件号码完全相同', 'SELECT B.#table_pk#,''''business_pk, B.#master_table_id# as master_table_id FROM #table_name_A# A LEFT JOIN #table_name# B ON A.#table_field_A_ID#=B.#table_field_A_ID# WHERE A.#table_field7_a1#=B.#table_field# AND A.#table_field7_a2#=B.#table_field7_b2# [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_pb_table_one1', '当报告时点说明代码为30-月度结算时：除基础段外，至少还应包含月度表现信息段；账户类型不能为C1。', '当报告时点说明代码为#ms_field1#时：除基础段外，至少还应包含#ms_field2#；账户类型不能为#ms_field3#', 'SELECT A.#table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_name2_B# B ON A.#table_pk#=B.#table_pk# WHERE ((#table_field# IN(#a1_field1#) AND B.#table_pk# IS NULL) OR (A.#a1_field_type# IN(#a1_field2#) AND #table_field# IN(#a1_field1#))) [and #validate_date# = ''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_PBA_MDFC_SGMT_CODE', '待更正的段的内容和待更正的段标应保持一致', '待更正的段的内容和待更正的段标应保持一致', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_1# B ON A.#table_pk# = B.#table_pk# LEFT JOIN #table_2# C ON A.#table_pk# = C.#table_pk# LEFT JOIN #table_3# D ON A.#table_pk# = D.#table_pk# LEFT JOIN #table_4# E ON A.#table_pk# = E.#table_pk# LEFT JOIN #table_5# F ON A.#table_pk# = F.#table_pk# LEFT JOIN #table_6# G ON A.#table_pk# = G.#table_pk# LEFT JOIN #table_7# H ON A.#table_pk# = H.#table_pk# LEFT JOIN #table_8# I ON A.#table_pk# = I.#table_pk# LEFT JOIN #table_9# J ON A.#table_pk# = J.#table_pk# WHERE ((A.#table_field# = (''#num1#'') AND A.#table_pk# IS NULL) OR (A.#table_field# = (''#num2#'') AND B.#table_pk# IS NULL) OR (A.#table_field# = (''#num3#'') AND C.#table_pk# IS NULL) OR (A.#table_field# = (''#num4#'') AND D.#table_pk# IS NULL) OR (A.#table_field# = (''#num5#'') AND E.#table_pk# IS NULL) OR (A.#table_field# = (''#num6#'') AND F.#table_pk# IS NULL) OR (A.#table_field# = (''#num7#'') AND G.#table_pk# IS NULL) OR (A.#table_field# = (''#num8#'') AND H.#table_pk# IS NULL) OR (A.#table_field# = (''#num9#'') AND I.#table_pk# IS NULL) OR (A.#table_field# = (''#num10#'') AND J.#table_pk# IS NULL)) [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('grsx_R2201201', '当库中最新一条个人授信协议信息记录中的“额度状态”为“2-到期/失效”时，后续信息记录不能入库', '当库中最新一条个人授信协议信息记录中的“额度状态”为“2-到期/失效”时，后续信记录不能入库', 'SELECT #table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE #table_field#>(SELECT MAX(A.RPT_DATE) FROM #table_name# A LEFT JOIN I_CREDIT_LIM B ON A.#table_pk#=B.#table_pk# WHERE A.BUSINESS_STATES=''11'' AND CON_STATUS=''2'' AND INF_REC_TYPE=''220'') and CONTRACT_CODE IN (SELECT CONTRACT_CODE FROM I_CTRCT_BS A LEFT JOIN I_CREDIT_LIM B ON A.PCA_CTRCT_BS_SGMT_ID=B.PCA_CTRCT_BS_SGMT_ID WHERE A.BUSINESS_STATES=''11'' AND CON_STATUS=''2'' AND INF_REC_TYPE=''220'') [and #validate_date# = ''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('grsx_I2200D01', '额度生效日期应不晚于额度到期日期', '额度生效日期应不晚于额度到期日期', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_field#>CON_EXP_DATE [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('grsx_I2200D02', '“授信限额”、“授信限额编号”必须同时出现。', '“授信限额”、“授信限额编号”必须同时出现。', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE (#table_field# IS NULL AND CREDIT_REST_CODE IS NOT NULL) OR (CREDIT_REST_CODE IS NULL AND #table_field# IS NOT NULL) [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('QY_JD_010', '当账户关闭日不为空时，则必须不早于余额变化日期、最近一次实际还款日期、最近一次约定还款日期、五级分类认定日期', '当账户关闭日不为空时，则必须不早于余额变化日期、最近一次实际还款日期、最近一次约定还款日期、五级分类认定日期', 'SELECT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE A.#table_field#<BAL_CHG_DATE OR A.#table_field#<LAT_RPY_DATE OR A.#table_field#<LAT_AGRR_RPY_DATE OR A.#table_field#<FIVE_CATE_ADJ_DATE [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('QY_JD_020', '当且仅当报告时点说明代码为20-账户关闭时，账户状态为21-关闭', '当且仅当报告时点说明代码为20-账户关闭时，账户状态为21-关闭', 'SELECT DISTINCT B.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM E_ACCT_BS A LEFT JOIN #table_name# B ON A.EDA_ACCT_BS_SGMT_ID=B.EDA_ACCT_BS_SGMT_ID WHERE ((A.RPT_DATE_CODE !=''20'' AND B.#table_field#=''21'') OR (A.RPT_DATE_CODE=''20'' AND B.#table_field# !=''21'')) [AND #validate_date# = ''#currentDate#''] {AND B.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('Identity_Matching', '出资人身份类别要与出资人身份标识类型匹配', '出资人身份类别要与出资人身份标识类型不匹配', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE A.#table_field# IN (#num10#) AND A.#table_field_1# IN (''#num20#'')[and #validate_date# =''#currentDate#''] {and A.#table_pk#=''#tablePk#''}
', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_jd_is_one9', '若“账户状态”为“6-未激活”时，则“余额”、“当前逾期期数”、“当前逾期总额”必须为 0，“当前还款状态”必须为“*”（若此账户没有上述数据项，则不校验此数据项）', '若“账户状态”为“6-未激活”时，则“余额”、“当前逾期期数”、“当前逾期总额”必须为 0，“当前还款状态”必须为“*”（若此账户没有上述数据项，则不校验此数据项）', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_field# = #field1# AND (#table_field1# !=#field2# OR #table_field2# !=#field2# OR #table_field3# !=#field2# OR #table_field4# !=#field3# OR RPY_STATUS != ''*'') [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_A_MDFCSGMTCODE_RPTDATE', '信息报告日期应等于相应信息段最晚的信息报告日期', '信息报告日期应等于相应信息段最晚的信息报告日期', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE (A.#table_field_1# = ''#num1#'' AND A.#table_field# = (SELECT MAX(#table_field#) FROM #table_name# WHERE #table_field_1# = ''#num1#'' AND #table_pk# NOT IN (A.#table_pk#))) [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('NW_BNES_CODE_is_null_02', '个人借贷新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识', '个人借贷新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识', 'SELECT DISTINCT #table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A, #table_name_B002# B LEFT JOIN #table_name_C002# C ON B.#table_field_B002_PK#=C.#table_field_B002_PK# LEFT JOIN #table_name_D002# D ON B.#table_field_B002_PK#=D.#table_field_B002_PK# WHERE (A.#table_field#=B.#table_field_B002_acctcode# AND (C.#table_field_C002_acctstatus# =''#acctstatus2#'' OR D.#table_field_D002_nomonthacctstatus# =''#nomonthacctstatus2#'') AND B.#table_field_B002_business# =''#business2#'') [and #validate_date# =''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('SAN_BIAO_is_null_02', '个人基本信息整笔删除三标+信息来源编码必须在库中存在', '三标+信息来源编码必须在库中存在', 'SELECT EEBID.#table_pk#,''''business_pk,EEBID.ID_NUM,EEBID.INF_SURC_CODE,EEBID.NAME,EEBID.ID_TYPE,EBS.ID_NUM AS ID_NUM2,EBS.INF_SURC_CODE AS INF_SURC_CODE2,EBS.NAME AS NAME2,EBS.ID_TYPE AS ID_TYPE2, EEBID.#master_table_id# as master_table_id FROM I_IN_BS_INF_DLT EEBID LEFT JOIN I_BS EBS ON (EEBID.ID_NUM = EBS.ID_NUM AND EEBID.INF_SURC_CODE = EBS.INF_SURC_CODE AND EEBID.NAME = EBS.NAME AND EEBID.ID_TYPE = EBS.ID_TYPE) WHERE (EBS.BUSINESS_STATES != ''11'' OR EBS.NAME IS NULL ) [ AND #validate_date# =''#currentDate#'' ] {AND #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('SAN_BIAO_is_null_03', '个人证件有效期整笔删除三标+信息来源编码必须在库中存在', '三标+信息来源编码必须在库中存在', 'SELECT EEBID.#table_pk#,''''business_pk,EEBID.ID_NUM,EEBID.INF_SURC_CODE,EEBID.NAME,EEBID.ID_TYPE,EBS.ID_NUM AS ID_NUM2,EBS.INF_SURC_CODE AS INF_SURC_CODE2,EBS.NAME AS NAME2,EBS.ID_TYPE AS ID_TYPE2, EEBID.#master_table_id# as master_table_id FROM I_IN_ID_EFCT_INF_DLT EEBID LEFT JOIN I_IN_ID_EFCT_INF EBS ON (EEBID.ID_NUM = EBS.ID_NUM AND EEBID.INF_SURC_CODE = EBS.INF_SURC_CODE AND EEBID.NAME = EBS.NAME AND EEBID.ID_TYPE = EBS.ID_TYPE) WHERE (EBS.BUSINESS_STATES != ''11'' OR EBS.NAME IS NULL ) [ AND #validate_date# =''#currentDate#'' ] {AND #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_pb_table_one2', '当报告时点说明代码为20-账户关闭时，除基础段，若账户类型为D1/R1/R2/R3/R4，还应包含月度表现信息段', '当报告时点说明代码为#ms2_field1#，除基础段，若账户类型为#ms2_field2#，还应包含#ms2_field3#', 'SELECT A.#table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_name2_B# B ON A.#table_pk#=B.#table_pk# WHERE (#table_field# IN(#a1_field1#) AND A.#a1_field_type# IN(#a1_field2#) AND B.#table_pk# IS NULL) [and #validate_date# = ''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_pb_table_one3', '报告时点说明代码为31,包含基本信息段：若账户类型为R2，还应包含月度表现段。借贷业务种类细分不为82，还应包含授信额度信息段；', '报告时点为#ms3_field1#，应包含#ms3_field2#，类型为#ms3_field3#，应包含#ms3_field4#。种类细分不为#ms3_field5#，应包含#ms3_field6#', 'SELECT A.#table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_name2_B# B ON A.#table_pk#=B.#table_pk# LEFT JOIN #table_name2_C# C ON A.#table_pk#=C.#table_pk# LEFT JOIN #table_name2_D# D ON A.#table_pk#=D.#table_pk# WHERE (#table_field# IN(#a1_field1#) AND A.#a1_field_type# IN(#a1_field2#)) AND ((C.#table_pk# IS NULL) OR (#b1_field1# !=#lines# AND D.#table_pk# IS NULL)) [and #validate_date# = ''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('OD_BNES_CODE_is_not_null', '原本业务标识码必须是库中已有且正在使用的', '原本业务标识码必须是库中已有且正在使用的', 'SELECT A.#table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE A.#table_field# NOT IN (SELECT B.#table_field_ACCT_CODe1# FROM #table_name_BS_SGMT# B LEFT JOIN #table_name_LBLTY_INF_SGMT# C ON B.#table_pk_BS_SGMT_ID# = C.#table_pk_BS_SGMT_ID# WHERE B.BUSINESS_STATES=''11'' AND C.#table_field_ACCT_STATUS# != ''#acct_status#'') [and #validate_date# = ''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('NW_BNES_CODE_is_null', '新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识', '新账户标识码在数据库中必须不存在，或者在库中存在但必须是该账户之前使用过的标识', 'SELECT #table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE A.#table_field# IN (SELECT B.#table_field_ACCT_CODe2# FROM #table_name_BS_SGMT2# B LEFT JOIN #table_name_LBLTY_INF_SGMT2# C ON C.#table_pk_BS_SGMT_ID2# = B.#table_pk_BS_SGMT_ID2# WHERE B.BUSINESS_STATES = ''11'' AND C.#table_field_ACCT_STATUS2# != ''#acct_status2#'') [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('ent_zichengfuzhai_del_not_null', '企业身份标识类型+企业身份标识代码+报表年份+报表类型+报表类型细分+数据提供机构区段码必须在库中存在', '企业身份标识类型+企业身份标识代码+报表年份+报表类型+报表类型细分+数据提供机构区段码必须在库中存在', 'SELECT #table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_name_SHEET_BS_SGMT# B ON (A.ENT_NAME = B.ENT_NAME AND A.ENT_CERT_TYPE = B.ENT_CERT_TYPE AND A.#table_field# = B.ENT_CERT_NUM AND A.SHEET_YEAR=B.SHEET_YEAR AND A.SHEET_TYPE=B.SHEET_TYPE AND A.SHEET_TYPE_DIVIDE=B.SHEET_TYPE_DIVIDE) WHERE (A.INF_REC_TYPE = ''#inf_rec_type#'' AND (B.BUSINESS_STATES != ''11'' AND B.CIMOC IS NULL OR B.BUSINESS_STATES IS NULL)) [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('New_customer_verification_three_tables', '新增客户数据时三表之间关联校验', '新增客户资料/首次上报时,企业基本信息基本必须报送基础段、基本概况段、主要组成人员段、联系方式段', 'SELECT DISTINCT a.#table_pk#,'''' business_pk, a.#master_table_id# as master_table_id FROM #table_name# a LEFT JOIN #table_1# b ON a.#table_pk# = b.#table_pk# LEFT JOIN #table_2# c ON a.#table_pk# = c.#table_pk# LEFT JOIN #table_3# d ON a.#table_pk# = d.#table_pk# WHERE(a.#table_field# = ''#num30#'' AND (b.#table_pk# IS NULL OR c.#table_pk# IS NULL OR d.#table_pk# IS NULL))[and #validate_date# = ''#currentDate#''] {and a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('New_customer_verification_two_tables', '新增客户数据时两表之间关联校验', '新增客户资料/首次上报时,企业、事业单位、社会团体(三类组织的分支机构除外),需要报送注册资本及主要出资人段', 'SELECT DISTINCT a.#table_pk#,'''' business_pk, a.#master_table_id# as master_table_id FROM #table_name# a LEFT JOIN #table_1# b ON a.#table_pk# = b.#table_pk# WHERE(a.#table_field# IN (''#num10#'') AND  a.#table_field_1# = ''#num20#'' AND  b.#table_pk# IS NULL)[and #validate_date# = ''#currentDate#''] {and a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_pb_table_one9', '当报告时点说明代码为10-新开户时：若账户类型为D1/R1/R3/R4，不应包含初始债权说明段、非月度表现信息段、特殊交易说明段、大额专项分期信息段', '#ms9_field1#', 'SELECT A.#table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_name2_B# B ON A.#table_pk#=B.#table_pk# LEFT JOIN #table_name2_C# C ON A.#table_pk#=C.#table_pk# LEFT JOIN #table_name2_D# D ON A.#table_pk#=D.#table_pk# LEFT JOIN #table_name2_E# E ON A.#table_pk#=E.#table_pk# WHERE #a1_field_type1# IN(#a1_field1#) AND #table_field# IN(#a1_field2#) AND (B.#table_pk# IS NOT NULL OR C.#table_pk# IS NOT NULL OR D.#table_pk# IS NOT NULL OR E.#table_pk# IS NOT NULL) [and #validate_date# = ''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_pb_table_one10', '当报告时点说明代码为10-新开户时，若账户类型为R2，不应包含初始债权说明段、非月度表现信息段、特殊交易说明段。', '#ms10_field1#', 'SELECT A.#table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_name2_B# B ON A.#table_pk#=B.#table_pk# LEFT JOIN #table_name2_C# C ON A.#table_pk#=C.#table_pk# LEFT JOIN #table_name2_D# D ON A.#table_pk#=D.#table_pk# WHERE #a1_field_type1# IN(#a1_field1#) AND #table_field# IN(#a1_field2#) AND (B.#table_pk# IS NOT NULL OR C.#table_pk# IS NOT NULL OR D.#table_pk# IS NOT NULL) [and #validate_date# = ''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_pb_table_one11', '当报告时点说明代码为31-月结日首次上报存量账户,20-账户关闭,32-月结日账户关闭,若账户类型为R2，不应包含初始债权说明段、非月度表现信息段。', '#ms11_field1#', 'SELECT A.#table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_name2_B# B ON A.#table_pk#=B.#table_pk# LEFT JOIN #table_name2_C# C ON A.#table_pk#=C.#table_pk# WHERE #a1_field_type1# IN(#a1_field1#) AND #table_field# IN(#a1_field2#) AND (B.#table_pk# IS NOT NULL OR C.#table_pk# IS NOT NULL) [and #validate_date# = ''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_pb_table_one12', '当报告时点说明代码为40-收回逾期款项时：不应包含月度表现信息段、大额专项分期信息段、抵质押物信息段、授信额度信息段', '当报告时点说明代码为40-收回逾期款项时：不应包含月度表现信息段、大额专项分期信息段、抵质押物信息段、授信额度信息段', 'SELECT A.#table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_name2_B# B ON A.#table_pk#=B.#table_pk# LEFT JOIN #table_name2_C# C ON A.#table_pk#=C.#table_pk# LEFT JOIN #table_name2_D# D ON A.#table_pk#=D.#table_pk# LEFT JOIN #table_name2_E# E ON A.#table_pk#=E.#table_pk# WHERE  #table_field# IN(#a1_field2#) AND (B.#table_pk# IS NOT NULL OR C.#table_pk# IS NOT NULL OR D.#table_pk# IS NOT NULL OR E.#table_pk# IS NOT NULL) [and #validate_date# = ''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_jd_is_one1', '若“还款方式”为“90-汇总报送，不区分还款方式”，则“还款频率”为“03-月”', '若“还款方式”为“90-汇总报送，不区分还款方式”，则“还款频率”为“03-月”', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_field#=#field1# AND #table_field1# NOT IN(#field2#) [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_jd_is_one2', '若“还款方式”代码以“2”开头，则“还款期数”必须为 0。', '若“还款方式”代码以“2”开头，则“还款期数”必须为 0。', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_field# like #field1# AND #table_field1# !=#field2# [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_jd_is_one3', '“开户日期”应不晚于“到期日期”', '“开户日期”应不晚于“到期日期”', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_field#>#table_field1# [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_jd_is_one4', '若“还款责任人类型”为“2-保证人”，则“还款责任金额”不能为空值', '若“还款责任人类型”为“2-保证人”，则“还款责任金额”不能为空值', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_field#=#field1# AND #table_field1# IS NULL [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_jd_is_one5', '当“还款责任人类型”为“2-保证人”时，“联保标志”、“保证合同编号”不应为空', '当“还款责任人类型”为“2-保证人”时，“联保标志”、“保证合同编号”不应为空', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_field#=#field1# AND (#table_field1# IS NULL OR #table_field2# IS NULL) [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('OPENDATE_LATERTHAN_REPAYPRD_FIVECATEADJ_CLOSE', '账户信息记录中的“开户日期”应不晚于“余额变化日期”、“五级分类认定日期”、“账户关闭日期”（若不为空）', '账户信息记录中的“开户日期”应不晚于“余额变化日期”、“五级分类认定日期”、“账户关闭日期”（若不为空）', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_name_1# B ON A.#table_field_4# = B.#table_field_4# WHERE (A.#table_field# IS NOT NULL AND (A.#table_field# > B.#table_field_1# OR A.#table_field# > B.#table_field_2# OR A.#table_field# > B.#table_field_3#))[AND #validate_date# = ''#currentDate#''] {AND A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('EEA_OBLIGOR_AND_PERSONLIABLE_TWOMARK_NOTSAME', '债务人两标与相关还款责任人两标不能相同', '债务人两标与相关还款责任人两标不能相同', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_name_1# B ON A.#table_pk_1# = B.#table_pk_1# WHERE INFO_ID_TYPE=''2'' AND (A.#table_field# = B.#table_field_2# AND A.#table_field_1# = B.#table_field_3#)[AND #validate_date# = ''#currentDate#''] {AND A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_GUARMODE_RPTDATECODE10', '当“报告时点说明代码”为“10-新开户/首次上报”，若“基本信息段”的“担保方式”为“#num1#”时，必须报送相关还款责任人段', '当报告时点说明代码为10-新开户/首次上报，若基本信息段的担保方式为#n3#时，必须报送相关还款责任人段', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_1# B ON A.#table_pk_1# = B.#table_pk_1# LEFT JOIN #table_2# C ON A.#table_pk_1# = C.#table_pk_1# WHERE (A.#table_field# IN (#num1#) AND B.#table_field_1# = ''#num10#'' AND C.#table_pk_1# IS NULL) [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('EDH_TRANDATE_AND_CHANTRANTYPE_NOTEXIST', '特定交易说明段中的“交易日期”+“交易类型”在库中不能存在', '特定交易说明段中的“交易日期”+“交易类型”在库中不能存在', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE ((A.#table_field#,A.#table_field_1#) IN (SELECT #table_field#,#table_field_1# FROM #table_name#)) [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('EDB_OPENDATE_GREATERTHAN_DUEDATE', '“开户日期”应不晚于“到期日期”', '“开户日期”应不晚于“到期日期”', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE (A.#table_field# > A.#table_field_1#)[AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('EDB_REPAYMODE90_REPAYFREQCY10', '“还款方式”为“90-汇总报送，不区分还款方式”，则“还款频率”应为“10-月”', '“还款方式”为“90-汇总报送，不区分还款方式”，则“还款频率”应为“10-月”', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE (A.#table_field# = ''#mun90#'' AND A.#table_field_1# NOT IN (#num10#)) [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('EDB_REPAYMODE2%_REPAYFREQCY99', '“还款方式”以“2”开头，则“还款频率”应为“99-其他”', '“还款方式”以“2”开头，则“还款频率”应为“99-其他”', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE (A.#table_field# like ''#num2#'' AND A.#table_field_1# NOT IN (#num99#)) [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('Enterprise_identity_type', '企业身份标识类型校验', '企业身份标识号码应按照先“中征码”、次“统一社会信用代码”,再“组织机构代码”顺序填入基础段,其他标识均填
入其他标识段', 'SELECT DISTINCT A .#table_pk#,'''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A INNER JOIN #table_1# b ON A .#table_pk# = b.#table_pk# WHERE(A .#table_field# = ''#num10#''AND ( b.#table_field_1# IN (''#num20#''))) [AND #validate_date# = ''#currentDate#'' ] {AND A .#table_pk# = ''#tablePk#'' }
', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('mingxiduan_is_not_null_06', '账户类型为D1，分次放款标识为0、1则不适用31-开户后放款', '账户类型为D1，分次放款标识为0、1则不适用31-开户后放款', 'SELECT #table_pk#,''''business_pk, B.#master_table_id# as master_table_id FROM #table_name_A5_not_null# A LEFT JOIN #table_name# B ON A.#table_field_A5_PK#=B.#table_field_A5_PK# WHERE A.#table_field_A5_code5# IN(#table_field_code5#) AND A.#table_field_accttype5# IN(#accttype5#) AND #table_field# IN(#flag5#) [and #validate_date# =''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('OD_BNES_CODE_is_not_null_02', '个人借贷原业务标识码必须是库中已有且正在使用的', '个人借贷原业务标识码必须是库中已有且正在使用的', 'SELECT DISTINCT #table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A, #table_name_B001# B LEFT JOIN #table_name_C001# C ON B.#table_field_B001_PK#=C.#table_field_B001_PK# LEFT JOIN #table_name_D001# D ON B.#table_field_B001_PK#=D.#table_field_B001_PK# WHERE A.#table_field# NOT IN (SELECT B.#table_field_B001_acctcode# FROM #table_name_B001# B LEFT JOIN #table_name_C001# C ON B.#table_field_B001_PK#=C.#table_field_B001_PK# LEFT JOIN #table_name_D001# D ON B.#table_field_B001_PK#=D.#table_field_B001_PK# WHERE B.#table_field_B001_business# =''#business#'' AND (C.#table_field_C001_acctstatus# !=''#acctstatus#'' AND D.#table_field_D001_nomonthacctstatus# !=''#nomonthacctstatus#''))  [and #validate_date# =''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_pb_table_one4', '当报告时点说明代码为10-新开户时，除基础段外，至少包含基本信息段：若账户类型为R1/R3/R4，还应包含月度表现信息段、授信额度信息段', '当报告时点说明代码为#ms4_field1#时，除基础段外，至少包含#ms4_field2#：若账户类型为#ms4_field3#，还应包含#ms4_field4#', 'SELECT A.#table_pk#,''''business_pk , A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_name2_B# B ON A.#table_pk#=B.#table_pk# LEFT JOIN #table_name2_C# C ON A.#table_pk#=C.#table_pk# WHERE A.#table_field# IN(#a1_field1#) AND #table_field_type# IN(#a1_field2#) AND (B.#table_pk# IS NULL OR C.#table_pk# IS NULL) [and #validate_date# = ''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_pb_table_one5', '报告时点说明代码为10-新开户时，除基础段外，个人借贷账户信息记录至少包含基本信息段', '报告时点说明代码为#ms5_field1#时，除基础段外，至少包含#ms5_field2#', 'SELECT A.#table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_name2_B# B ON A.#table_pk#=B.#table_pk# WHERE A.#table_field# IN(#a1_field1#) AND B.#table_pk# IS NULL [and #validate_date# = ''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_pb_table_one6', '当报告时点说明代码为10-新开户时，至少包含基本信息段：若账户类型为D1，还应包含月度表现信息段。如果基本信息段中分次放款标志大于 0，则还应包含授信额度信息段', '#ms6_field1#', 'SELECT A.#table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_name2_B# B ON A.#table_pk#=B.#table_pk# LEFT JOIN #table_name2_C# C ON A.#table_pk#=C.#table_pk# LEFT JOIN I_AMBLG_INF D ON A.#table_pk#=D.#table_pk# WHERE A.#table_field# IN(#a1_field1#) AND A.#a1_field_type# IN(#a1_field2#) AND (D.#table_pk# IS NULL OR (B.#a1_field_FLAG1#>#flag1# AND C.#table_pk# IS NULL)) [and #validate_date# = ''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_pb_table_one7', '当报告时点说明代码为10-新开户或31-月结日首次上报存量账户时，若D1/R1/R2/R3/R4 类账户的基本信息段中担保方式为3-保证、5-组合（含保证），则应包含相关还款责任人段', '当报告时点说明代码为10-新开户或31-月结日首次上报存量账户时，若D1/R1/R2/R3/R4 类账户的基本信息段中担保方式为3-保证、5-组合（含保证），则应包含相关还款责任人段', 'SELECT #table_pk#,''''business_pk, B.#master_table_id# as master_table_id FROM #table_name2_A# A LEFT JOIN #table_name# B ON A.#table_name2_A_PK#=B.#table_name2_A_PK# LEFT JOIN #table_name2_C# C  ON A.#table_name2_A_PK#=C.#table_name2_A_PK# WHERE #a1_field_type1# IN(#a1_field1#) AND #a1_field_code1# IN(#a1_field2#) AND B.#table_field# IN(#a1_field3#) AND C.#table_name2_A_PK# IS NULL [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_pb_table_one8', '当报告时点说明代码为10-新开户,31-月结日首次上报存量账户,如果基本信息段中分次放款标志为0，还不应包含授信额度信息段', '#ms8_field1#', 'SELECT #table_pk#,''''business_pk, B.#master_table_id# as master_table_id FROM #table_name2_A# A LEFT JOIN  #table_name# B ON A.#table_field_A_pk#=B.#table_field_A_pk# LEFT JOIN #table_name2_C# C ON A.#table_field_A_pk#=C.#table_field_A_pk# WHERE A.#a1_field_type1# IN(#a1_field1#) AND A.#table_field_code1# IN(#a1_field2#) AND B.#table_field# IN(#b1_field3#) AND C.#table_field_A_pk# IS NOT NULL [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('EEA_RPTDATECODEIS10_EEBANDEEF_NOTNULL', '“报告时点说明代码”为“10-新开户/首次上报”时，至少应包含基本信息段、在保责任信息段', '“报告时点说明代码”为“10-新开户/首次上报”时，至少应包含基本信息段、在保责任信息段', 'SELECT DISTINCT A.#table_pk#,  '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_1# B ON A.#table_pk# = B.#table_pk# LEFT JOIN #table_2# C ON A.#table_pk# = C.#table_pk# WHERE (A.#table_field# = ''#num10#'' AND ( B.#table_pk# IS NULL OR C.#table_pk# IS NULL ) ) [and #validate_date# = ''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('EEA_RPTDATECODEIS_EEF_NOTNULL', '“报告时点说明代码”校验，至少包含在保责任信息段。', '“报告时点说明代码”为“#num10#”时，至少包含在保责任信息段。', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_1# B ON A.#table_pk# = B.#table_pk# WHERE (A.#table_field# = ''#num10#'' AND B.#table_pk# IS NULL) [and #validate_date# = ''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('Length_range', '字段长度范围校验', '字段不允许大于#len#位', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id from #table_name# A  where length(#table_field#)>#len# [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('OnlyNumber_Length', '字段长度和纯数字校验', '字段不为纯数字且字段长度大于#len#位', 'SELECT DISTINCT A .#table_pk#,'''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE (REGEXP_REPLACE(A .#table_field#,''^[-\+]?\d+(\.\d+)?$'','') IS NOT NULL) AND (LENGTH (A.#table_field) > #len#) [AND #validate_date# =''#currentDate#'' ] {AND A .#table_pk# =''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('SAN_BIAO_is_null', '三标必须在库中存在', '三标+信息来源编码必须在库中存在', 'SELECT EEBID.#table_pk#,''''business_pk, EEBID.ENT_CERT_NUM,EEBID.INF_SURC_CODE,EEBID.ENT_NAME,EEBID.ENT_CERT_TYPE, EBS.ENT_CERT_NUM AS ENT_CERT_NUM2,EBS.INF_SURC_CODE AS INF_SURC_CODE2 ,EBS.ENT_NAME AS ENT_NAME2,EBS.ENT_CERT_TYPE AS ENT_CERT_TYPE2 , EEBID.#master_table_id# as master_table_id FROM E_BS_INF_DLT EEBID LEFT JOIN E_BS  EBS ON  (EEBID.ENT_CERT_NUM = EBS.ENT_CERT_NUM AND EEBID.INF_SURC_CODE = EBS.INF_SURC_CODE AND EEBID.ENT_NAME = EBS.ENT_NAME AND EEBID.ENT_CERT_TYPE = EBS.ENT_CERT_TYPE) WHERE (EBS.BUSINESS_STATES !=''11'' OR EBS.ENT_NAME IS NULL)[and #validate_date# =''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_PDC_PDA_TWOMARK', '责任人两标与债务人两标不能相同', '责任人两标与债务人两标不能相同', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_1# B ON A.#table_pk_1# = B.#table_pk_1# WHERE (A.#table_field# = B.#table_field_1# AND A.#table_field_2# = B.#table_field_3#) [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_PBG_MONTH_AND_PBA_RPT_DATE', '“月份”必须与信息报告日期的年、月保持一致', '“月份”必须与信息报告日期的年、月保持一致', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_1# B ON A.#table_pk_1# = B.#table_pk_1# WHERE (B.#table_field_1# = ''#num1#'' AND A.#table_field# NOT IN  (substr(B.#table_field_2#, 0,7))) [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_RPTDATE_SPECEFCTDATE', '库中存在“分期额度生效日期”相等数据时，信息报告日期更晚的大额专项分期信息不能入库', '库中存在“分期额度生效日期”相等数据时，信息报告日期更晚的大额专项分期信息不能入库', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_1# B ON A.#table_pk# = B.#table_pk# WHERE (A.#table_field_1# = ''#num1#'' AND B.#table_field_2# IN  (SELECT #table_field_2# FROM #table_1#)  AND A.#table_field# > (SELECT MAX(#table_field#) FROM #table_name# WHERE #table_field_1# = ''#num1#'' AND #table_pk# NOT IN (A.#table_pk#))) [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_ACCTSTATUS_ACCTTYPE_OPETNTYPE', '对于销户重启的 R2 账户，不能将历史上的“4-销户”更正为非销户的状态', '对于销户重启的 R2 账户，不能将历史上的“4-销户”更正为非销户的状态', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_1# B ON A.#table_pk_1# = B.#table_pk_1# LEFT JOIN #table_2# C ON A.#table_pk_1# = B.#table_pk_1# WHERE (B.#table_field_1# = ''#num1#'' AND B.#table_field_2# = ''#num2#'' AND C.#table_field_3# = ''#num3#'' AND A.#table_field# NOT IN (''#num4#'')) [AND #validate_date# = ''#currentDate#''] {AND A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('CHECK_PBI_NOMONTHACCTSTATUS', '对于 C1 账户，更正非月度表现信息段时，若库中存在信息报告日期更晚的非月度表现信息段，则更正请求记录中账户状态不能为“结束”', '对于 C1 账户，更正非月度表现信息段时，若库中存在信息报告日期更晚的非月度表现信息段，则更正请求记录中账户状态不能为“结束”', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_1# B ON A.#table_pk_1# = B.#table_pk_1# WHERE (B.#table_field_1# = ''#num1#'' AND B.#table_field_2# < (SELECT MAX(#table_field_2#) FROM #table_1# WHERE #table_field_3# = ''#num2#'' AND #table_pk_1# NOT IN (B.#table_pk_1#)) AND A.#table_field# = ''#num3#'') [AND #validate_date# = ''#currentDate#''] {AND a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('ID_NUM_and_ID_TYPE_not_repeat_02_02', '受信人两标与共同受信人两标不能相同', '#m26#与#m27#不能相同', 'SELECT B.#table_pk#,''''business_pk, B.#master_table_id# as master_table_id FROM #table_name_EGA_CTRCT_BS_SGMT# A ,#table_name# B WHERE A.#table_field_SGMT_ID#=B.#table_field_SGMT_ID# AND #table_field_TYPE#=#table_field_IDTYPE# AND #table_field_NUM# = #table_field# AND A.INFO_ID_TYPE=B.INFO_ID_TYPE [and #validate_date# =''#currentDate#''] {and B.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('OrgType_for_value', '组织机构类型为机关类型时注册资本段不允许出现', '组织机构类型为机关类型时，注册资本及主要出资人段不能出现', 'SELECT DISTINCT a.#table_pk#,'''' business_pk, a.#master_table_id# as master_table_id FROM #table_name# a LEFT JOIN #table_1# b ON a.#table_pk# = b.#table_pk# WHERE a.#table_field# IN (''#num10#'')and b.#table_pk# IS NOT NULL [and #validate_date# = ''#currentDate#''] {and a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('Reg_Add_is_Null', '登记地址不能为空', '当国别代码为CHN时，登记地址不能为空', 'SELECT DISTINCT a.#table_pk#,'''' business_pk, a.#master_table_id# as master_table_id FROM #table_name# a WHERE ( a.#table_field# IN (#num10#) AND #table_field_1# is NULL) [and #validate_date# =''#currentDate#''] {and a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('Reg_Add_not_Null', '登记地址统一为空', '当国别代码不为CHN时，登记地址统一为空', 'SELECT DISTINCT a.#table_pk#,'''' business_pk, a.#master_table_id# as master_table_id FROM #table_name# a WHERE ( a.#table_field# NOT IN (#num10#) AND #table_field_1# is NOT NULL)[and #validate_date# = ''#currentDate#''] {and a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('Only_Oneperson', '法定代表人、董事长、监事长各自只能报送一人', '法定代表人、董事长、监事长各自只能报送一人', 'SELECT DISTINCT a.#table_pk#,'''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE EAA_BS_SGMT_ID IN (SELECT EAA_BS_SGMT_ID FROM #table_name# WHERE #table_field# IN (''1'',''4'',''5'') GROUP BY EAA_BS_SGMT_ID,#table_field# HAVING COUNT(EAA_BS_SGMT_ID)>1) [and #validate_date# = ''#currentDate#''] {and a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('NotOnly_Oneperson', '董事长、监事长不能是同一个人', '董事长、监事长不能是同一个人', 'SELECT DISTINCT A.#table_pk#,''''business_pk, A.#master_table_id# as master_table_id from #table_name# A WHERE EAA_BS_SGMT_ID IN(SELECT EAA_BS_SGMT_ID from #table_name# B where #table_field# IN (''4'',''5'')GROUP BY B.EAA_BS_SGMT_ID,B.MMB_ALIAS,B.MMB_ID_TYPE,B.MMB_ID_NUM HAVING COUNT(MMB_ALIAS||MMB_ID_TYPE||MMB_ID_NUM)> 1)[and #validate_date# =''#currentDate#''] {and a.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('Between_Two_Numbers', '注册资本及主要出资人段中的出资比例大于 0， 小于或等于 100', '出资比例应在0到100之间', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE(A.#table_field# <=''#num10#'' OR A.#table_field# >''#num20#'')[and #validate_date# =''#currentDate#''] {and A.#table_pk#=''#tablePk#''}
', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_R2321209_01', '更正在保责任信息段时，若待入库的更正请求记录中的信息报告日期晚于库中最新的在保责任信息段的信息报告日期，且库中在保责任信息段中的账户状态为“关闭”,则该更正请求记录不能入库', '更正在保责任信息段时，若待入库的更正请求记录中的信息报告日期晚于库中最新的在保责任信息段的信息报告日期，且库中在保责任信息段中的账户状态为“关闭”,则该更正请求记录不能入库', 'SELECT #table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name#  A WHERE #table_field#>(SELECT MAX(A.RPT_DATE) FROM #table_name# A LEFT JOIN I_GR_REPYMT_INF B ON A.#table_pk#=B.#table_pk# WHERE A.BUSINESS_STATES=''11'' AND ACCT_STATUS=''2'' AND INF_REC_TYPE=''230'') and ACCT_CODE IN (SELECT ACCT_CODE FROM I_GUAR_ACCT_BS A LEFT JOIN I_GR_REPYMT_INF B ON A.PDA_GUAR_ACCT_BS_SGMT_ID=B.PDA_GUAR_ACCT_BS_SGMT_ID WHERE A.BUSINESS_STATES=''11'' AND ACCT_STATUS=''2'' AND INF_REC_TYPE=''230'') [and #validate_date# = ''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('grjd_d_001', '当账户信息记录中“账户类型”为“R3”时，“透支 180 天以上未还余额”应该小于等于“余额”', '当账户信息记录中“账户类型”为“R3”时，“透支 180 天以上未还余额”应该小于等于“余额”', 'SELECT #table_pk#,''''business_pk,B.#master_table_id# as master_table_id FROM I_ACCT_BS A LEFT JOIN #table_name# B ON A.#master_table_id#=B.#master_table_id# WHERE ACCT_TYPE=''R3'' AND  #table_field# > ACCT_BAL [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('grjd_d_002', '当账户信息记录中“账户类型”为“R3”时，“当前还款状态”为“*”时，“余额”必须为 0', '当账户信息记录中“账户类型”为“R3”时，“当前还款状态”为“*”时，“余额”必须为 0', 'SELECT #table_pk#,''''business_pk,B.#master_table_id# as master_table_id FROM I_ACCT_BS A LEFT JOIN #table_name# B ON A.#master_table_id#=B.#master_table_id# WHERE RPY_STATUS=''*'' AND #table_field# !=''0'' AND ACCT_TYPE=''R3'' [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('grjd_d_003', '当账户信息记录中“账户类型”为“R3”时，“当前还款状态”为数字“1-7”时，“余额”必须大于 0', '当账户信息记录中“账户类型”为“R3”时，“当前还款状态”为数字“1-7”时，“余额”必须大于 0', 'SELECT #table_pk#,''''business_pk,B.#master_table_id# as master_table_id FROM I_ACCT_BS A LEFT JOIN #table_name# B ON A.#master_table_id#=B.#master_table_id# WHERE RPY_STATUS BETWEEN ''1'' AND ''7'' AND #table_field#<''0'' AND ACCT_TYPE=''R3'' [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('grjd_d_004', '若“报告时点说明代码”为“32-月结日账户关闭”和“20-账户关闭”时，“账户状态”为“3-关闭/“4-销户”', '若“报告时点说明代码”为“32-月结日账户关闭”和“20-账户关闭”时，“账户状态”为“3-关闭/“4-销户”', 'SELECT #table_pk#,''''business_pk,B.#master_table_id# as master_table_id FROM I_ACCT_BS A LEFT JOIN #table_name# B ON A.#master_table_id#=B.#master_table_id# WHERE RPT_DATE_CODE IN(''32'',''20'') AND #table_field# NOT IN(''3'',''4'') [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('grjd_d_005', '对于C1外的其他账户，非月度表现中的账户状态不应为“关闭”或“销户”', '对于C1外的其他账户，非月度表现中的账户状态不应为“关闭”或“销户”', 'SELECT #table_pk#,''''business_pk,B.#master_table_id# as master_table_id FROM I_ACCT_BS A LEFT JOIN #table_name# B ON A.#master_table_id#=B.#master_table_id# WHERE ACCT_TYPE !=''C1'' AND #table_field# IN(''3'',''4'')', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_db_o01', '账户信息记录中的“开户日期”应不晚于“余额变化日期”、“五级分类认定日期”、“账户关闭日期（若不为空）”', '账户信息记录中的“开户日期”应不晚于“余额变化日期”、“五级分类认定日期”、“账户关闭日期（若不为空）”', 'SELECT A.#table_pk#,''''business_pk,A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN I_GR_REPYMT_INF C ON A.PDA_GUAR_ACCT_BS_SGMT_ID= C.PDA_GUAR_ACCT_BS_SGMT_ID WHERE C. PDA_GUAR_ACCT_BS_SGMT_ID IS NOT NULL AND (A.#table_field#<REPAY_PRD OR A.OPEN_DATE<FIVE_CATE_ADJ_DATE OR (CLOSE_DATE IS NOT NULL AND A.OPEN_DATE<CLOSE_DATE)) [and #validate_date# = ''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_jd_is_one10', '若“当前还款状态”为“N”或“M”，则“当前逾期期数”、“当前逾期总额”必须为0（若此账户没有上述数据项，则不校验此数据项）', '若“当前还款状态”为“N”或“M”，则“当前逾期期数”、“当前逾期总额”必须为0（若此账户没有上述数据项，则不校验此数据项）', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_field# IN(#field1#) AND (#table_field1# !=#field2# OR #table_field2# !=#field3#) [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_jd_is_one11', '若“当前还款状态”为数字“1-7”，则“当前逾期期数”、“当前逾期总额”必须大于0', '若“当前还款状态”为数字“1-7”，则“当前逾期期数”、“当前逾期总额”必须大于0', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_field# IN(#field1#) AND (#table_field1# <= #field2# OR #table_field2# <= #field2#) [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_jd_is_one22', '若“当前还款状态”为“*”，则“本月应还款金额”、“当前逾期期数”、“当前逾期总额”、“本期账单余额”必须为 0（若此账户没有上述数据项，则不校验此数据项）', '若“当前还款状态”为“*”，则“本月应还款金额”、“当前逾期期数”、“当前逾期总额”、“本期账单余额”必须为 0（若此账户没有上述数据项，则不校验此数据项）', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_field# = #field1# AND (#table_field1# !=#field2# OR #table_field2# !=#field2# OR #table_field3# !=#field2# OR #table_field4# !=#field3#) [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('grjd_tssj_01', '“账户标识码”对应的个人借贷账户必须已经在库中存在，否则该记录不能入库。', '“账户标识码”对应的个人借贷账户必须已经在库中存在，否则该记录不能入库。', 'SELECT A.#table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE A.#table_field# NOT IN(SELECT #table_field# FROM I_ACCT_BS WHERE BUSINESS_STATES=''11'') [and #validate_date# = ''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('qiye_shouxin_01', '当库中最新一条授信协议信息记录中的“额度状态”为“2-到期/失效”时，后续信息记录不能入库。', '当库中最新一条授信协议信息记录中的“额度状态”为“2-到期/失效”时，后续信息记录不能入库。', 'SELECT #table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE #table_field#>(SELECT MAX(A.RPT_DATE) FROM #table_name# A LEFT JOIN E_CREDIT_LIM B ON A.#table_pk#=B.#table_pk# WHERE A.BUSINESS_STATES=''11'' AND CON_STATUS=''2'' AND INF_REC_TYPE=''420'') and CONTRACT_CODE IN (SELECT CONTRACT_CODE FROM #table_name# A LEFT JOIN E_CREDIT_LIM B ON A.#table_pk#=B.#table_pk# WHERE A.BUSINESS_STATES=''11'' AND CON_STATUS=''2'' AND INF_REC_TYPE=''420'') [and #validate_date# = ''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('PCC_IS_NOT_NULL', '个人授信协议记录报送时，“基础段”和“额度信息段”必须出现', '个人授信协议记录报送时，“基础段”和“额度信息段”必须出现', 'SELECT A.#table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_name_B# B ON A.#table_pk#=B.#table_pk# WHERE B.#table_pk# IS NULL AND #table_field#=''220'' [and #validate_date# = ''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('qiye_danbao_01', '如果账户信息记录最新一条的“账户状态”为“2-关闭”，则后续信息记录不能入库。', '如果账户信息记录最新一条的“账户状态”为“2-关闭”，则后续信息记录不能入库。', 'SELECT #table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE #table_field#>(SELECT MAX(A.RPT_DATE) FROM #table_name# A LEFT JOIN E_GUAR_INSURANCE_INF B ON A.#table_pk#=B.#table_pk# WHERE A.BUSINESS_STATES=''11'' AND ACCT_STATUS=''2'' AND INF_REC_TYPE=''440'') and ACCT_CODE IN (SELECT ACCT_CODE FROM E_GUAR_ACCT_BS A LEFT JOIN E_GUAR_INSURANCE_INF B ON A.#table_pk#=B.#table_pk# WHERE A.BUSINESS_STATES=''11'' AND ACCT_STATUS=''2'' AND INF_REC_TYPE=''440'') [and #validate_date# = ''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_jd_is_two4', '当账户类型为C1时，借贷业务大类只能为5-资产处置、6-垫款 当账户类型为R2/R3时，借贷业务大类只能为2-信用卡', '当账户类型为C1时，借贷业务大类只能为5-资产处置、6-垫款 当账户类型为R2/R3时，借贷业务大类只能为2-信用卡', 'SELECT #table_pk#,''''business_pk, B.#master_table_id# as master_table_id FROM #table_name_A# A LEFT JOIN #table_name# B ON A.#table_field_A_pk#=B.#table_field_A_pk# WHERE (A.#a1_field1#=#a1_field_type1# AND #table_field# NOT IN(#b1_field1#)) OR (A.#a1_field1# IN(#a1_field_type2#) AND #table_field# NOT IN(#b1_field2#)) [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_jd_is_two5', '若报告时点说明代码为32-月结日账户关闭和20-账户关闭时，账户状态为3-关闭,4-销户', '若报告时点说明代码为32-月结日账户关闭和20-账户关闭时，账户状态为3-关闭,4-销户', 'SELECT #table_pk#,''''business_pk, B.#master_table_id# as master_table_id FROM #table_name_A# A LEFT JOIN #table_name# B ON A.#table_field_A_pk#=B.#table_field_A_pk# LEFT JOIN #table_name_C# C ON A.#table_field_A_pk#=C.#table_field_A_pk# WHERE A.#a1_field1# IN(#a1_field_code1#) AND B.#table_field# NOT IN(#b1_field1#) [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_jd_is_two6', '借款人证件类型、证件号码和责任人身份标识类型、责任人身份标识号码不能完全相同', '借款人证件类型、证件号码和责任人身份标识类型、责任人身份标识号码不能完全相同', 'SELECT #table_pk#,''''business_pk, B.#master_table_id# as master_table_id FROM #table_name_A# A LEFT JOIN #table_name# B ON A.#table_field_A_pk#=B.#table_field_A_pk# WHERE A.#a1_field1#=B.#b1_field2# AND A.#a1_field2#=B.#table_field# AND INFO_ID_TYPE=''1'' [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('gr_jd_is_two7', '对于 C1 外的其他账户，非月度表现中的账户状态不应为关闭或销户', '对于 C1 外的其他账户，非月度表现中的账户状态不应为关闭或销户', 'SELECT #table_pk#,''''business_pk, B.#master_table_id# as master_table_id FROM #table_name_A# A LEFT JOIN #table_name# B ON A.#table_field_A_pk#=B.#table_field_A_pk# WHERE A.#a1_field1# NOT IN(#a1_field_code1#) AND B.#table_field# IN(#b1_field1#) [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('grjd_tssj_02', '借贷账户特殊事件说明记录的“信息报告日期”与“发生月份”中的年、月相等', '借贷账户特殊事件说明记录的“信息报告日期”与“发生月份”中的年、月相等', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE substr(#table_field1#,0,7) != #table_field# [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('grjd_tssj_03', '待入库的特殊事件说明记录，若库中已存在“账户标识码”相同且信息报告日期相同个人借贷账户记录，则该记录不能入库。', '待入库的特殊事件说明记录，若库中已存在“账户标识码”相同且信息报告日期相同个人借贷账户记录，则该记录不能入库。', 'SELECT A.#table_pk#,''''business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN I_ACCT_BS B ON A.ACCT_CODE=B.ACCT_CODE WHERE A.ACCT_CODE=B.ACCT_CODE AND A.#table_field#=B.#table_field# AND B.BUSINESS_STATES=''11'' [and #validate_date# = ''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('EEA_RPTDATECODEIS_EEF_ISNULL', '“报告时点说明代码”校验，不包含在保责任信息段。', '“报告时点说明代码”为“#num10#”时，不包含在保责任信息段。', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_1# B ON A.#table_pk# = B.#table_pk# WHERE (A.#table_field# = ''#num10#'' AND B.#table_pk# IS NOT NULL) [and #validate_date# = ''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('EEA_RPTDATECODE10_GUAR_MODE1_EEC_NOTNULL', '“报告时点说明代码”为“10-新开户/首次上报”且“反担保方式”为“1-保证”时，至少包含相关还款责任人段。', '“报告时点说明代码”为“10-新开户/首次上报”且“反担保方式”为“1-保证”时，至少包含相关还款责任人段。', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A LEFT JOIN #table_1# B ON A.#table_pk# = B.#table_pk# LEFT JOIN #table_2# C ON A.#table_pk# = C.#table_pk# WHERE (A.#table_field# = ''#num10#'' AND B.#table_field_1# = ''#num1#'' AND C.#table_pk# IS NULL)[and #validate_date# = ''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('EEB_OPENDATE_GREANTERTHAN_DUEDATE', '“开户日期”应不晚于“到期日期”', '“开户日期”应不晚于“到期日期”', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE (A.#table_field# > A.#table_field_1#) [and #validate_date# = ''#currentDate#''] {and A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('EEB_BUSIDTILLINES_BELONGTO_BUSILINES', '“担保业务大类”和“担保业务种类细分”代码不匹配', '“担保业务大类”和“担保业务种类细分”代码不匹配', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE ((A.#table_field# = #num1# AND A.#table_field_1# NOT IN (#num01#)) OR (A.#table_field# = ''#num2#'' AND A.#table_field_1# NOT IN (#num02#)) OR (A.#table_field# = ''#num3#'' AND A.#table_field_1# NOT IN (#num03#)) OR (A.#table_field# = ''#num4#'' AND A.#table_field_1# NOT IN (#num04#)) OR (A.#table_field# = ''#num5#'' AND A.#table_field_1# NOT IN (#num05#)) OR (A.#table_field# = ''#num6#'' AND A.#table_field_1# NOT IN (#num06#)) OR (A.#table_field# = ''#num7#'' AND A.#table_field_1# NOT IN (#num07#))) [AND #validate_date# = ''#currentDate#''] {AND A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('EEF_ACCTSTATUS2_CLOSEDATE_ISNOTNULL', '当且仅当“账户状态”为“2-关闭”，“账户关闭日期”不能为空值', '当且仅当“账户状态”为“2-关闭”，“账户关闭日期”不能为空值', 'SELECT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE (A.#table_field# = ''#num1#'' AND A.#table_field_1# IS NULL) [AND #validate_date# = ''#currentDate#''] {AND A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('EEF_CLOSEDATE_NOTNULLANDEARLIERTHAN_OTHERDATE', '账户信息记录中如果“账户关闭日期”数据项不为空，账户关闭日期应不早于“余额变化日期”、“五级分类认定日期”', '账户信息记录中如果“账户关闭日期”数据项不为空，账户关闭日期应不早于“余额变化日期”、“五级分类认定日期”', 'SELECT DISTINCT A.#table_pk#,'''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE(A.#table_field# IS NOT NULL AND (A.#table_field# < A.#table_field_1# OR A.#table_field# < A.#table_field_2#))[AND #validate_date# = ''#currentDate#''] {AND A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('EEC_ARLPCERTTYPE_BELONGTO_INFOIDTYPE', '相关还款责任人段中“身份类别”和“责任人身份标识类型”代码必须相匹配', '相关还款责任人段中“身份类别”和“责任人身份标识类型”代码必须相匹配', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE ((A.#table_field# = ''#num1#'' AND A.#table_field_1# NOT IN (#num01#)) OR (A.#table_field# = ''#num2#'' AND A.#table_field_1# NOT IN (#num02#))) [AND #validate_date# = ''#currentDate#''] {AND A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('EEC_ARLPTYPE2_WARTYSIGN_AND_MAXGUARMCC_ISNOTNULL', '当“还款责任人类型”为“2-反担保人”时，“联保标志”、“保证合同编号”不应为空', '当“还款责任人类型”为“2-反担保人”时，“联保标志”、“保证合同编号”不应为空', 'SELECT DISTINCT A.#table_pk#, '''' business_pk, A.#master_table_id# as master_table_id FROM #table_name# A WHERE (A.#table_field# = ''#num2#'' AND (A.#table_field_1# IS NULL OR A.#table_field_2# IS NULL)) [AND #validate_date# = ''#currentDate#''] {AND A.#table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('D_O_B_FCS_INFO_UP_DATE_one', '出生日期应不晚于信息更新日期', '出生日期应不晚于信息更新日期', 'SELECT #table_pk#,''''business_pk, #master_table_id# as master_table_id FROM #table_name# WHERE #table_field#>TO_DATE(#table_field3_a1#,''yyyy-mm-dd hh24:mi:ss'') [and #validate_date# = ''#currentDate#''] {and #table_pk#=''#tablePk#''}', 'analyticValidateServiceImpl_sql');
Insert into VALIDATE_TEMPLATE
   (TEMPLATE_NAME, TEMPLATE_COMMENT, ERROR_MSG, TEMPLATE_TPL, SERVICE_NAME)
 Values
   ('Date_Check', '成立日期要不晚于信息更新日期', '基本概况信息段中成立日期要不晚于信息更新日期', 'SELECT DISTINCT a.#table_pk#,'''' business_pk, a.#master_table_id# as master_table_id FROM #table_name# a WHERE a.#table_field_1# > a.#table_field# [and #validate_date# = ''#currentDate#''] {and a.#table_pk#=''#tablePk#''}
', 'analyticValidateServiceImpl_sql');
COMMIT;
