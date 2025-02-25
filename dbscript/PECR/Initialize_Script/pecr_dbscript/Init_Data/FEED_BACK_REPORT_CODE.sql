DELETE FROM  feed_back_report_code;

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('75', 'BBD001', 'SpoIDNum', 'S1100102', '当“婚姻状况”为“20-已婚”、“21-初婚”、“22- 再婚”、“23-复婚”时，“配偶证件号码”必须出 现。“婚姻状况”若为上述以外的代码，上述数 据项不能出现。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('76', 'BBD001', 'SpoTel', 'S1100102', '当“婚姻状况”为“20-已婚”、“21-初婚”、“22- 再婚”、“23-复婚”时，“配偶联系电话”必须出 现。“婚姻状况”若为上述以外的代码，上述数 据项不能出现。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('77', 'BBD001', 'SpsCmpyNm', 'S1100102', '当“婚姻状况”为“20-已婚”、“21-初婚”、“22- 再婚”、“23-复婚”时，“配偶工作单位”必须出 现。“婚姻状况”若为上述以外的代码，上述数 据项不能出现。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('78', 'BBE006', 'IDNm', 'I1100C01', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('79', 'BBE001', '0000', 'I1100D01', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('80', 'BBE002', 'SpoIDType', 'I1100E01', '“配偶证件号码”不为空时，“配偶证件类型” 应不为空。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('81', 'BBE002', 'SpoIDNum', 'I1100E01', '“配偶证件类型”不为空时，“配偶证件号码” 不为空。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('82', 'BBE004', 'AcaDegree', 'I1100F03', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('83', 'BBE005', 'Occupation', 'I1100G04', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('84', 'BBD002', '0000', 'I1100A01', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('85', 'BBD003', '0000', 'I1100A02', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('86', 'BFR000', 'RptDate', 'R1201201', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('87', 'BFE000', '0000', 'I1200B01', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('88', 'BOR000', 'RptDate', 'R1301201', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('89', 'BPR000', 'RptDate', 'R1401202', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('90', 'BPE000', '0000', 'I1400B01', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('91', 'BDE000', 'InfSurcCode', 'R1141201', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('92', 'BDE001', 'InfSurcCode', 'R1341101', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('93', 'ABF000', '0000', null, '报文文件解密出错。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('94', 'ABF001', '0000', null, '报文文件解压出错。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('95', 'ABF002', '0000', null, '未知错误，导致文件无法解析。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('96', 'ABN003', '0000', 'F0000201', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('97', 'ABN004', '0000', 'F0001202', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('98', 'ABH005', '0000', 'F0000301', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('99', 'ABH006', '0000', 'F0001302', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('100', 'ABF007', '0000', 'F0000401', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('101', 'ABF009', '0000', 'F0000601', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('102', 'ABF010', '0000', 'F0000502', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('103', 'ABF011', '0000', null, '在信息交换时采用“Unicode”字符集以及 UTF-8 编码。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('104', 'ABF008', '0000', 'F0000501', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('105', 'ABR000', '0000', 'R0000101', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('106', 'ABR001', 'RptDate', 'R0000102', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('107', 'ABR002', 'AcctCode', 'R0000201', '对于正常情况下的数据报送，报送文件中的不 应存在标识项相同的个人借贷账户信息记录。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('108', 'ABR002', 'ContractCode', 'R0000201', '对于正常情况下的数据报送，报送文件中的不 应存在标识项相同的个人授信协议信息记录。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('109', 'ABR004', 'AcctCode', 'R0001203', '信息记录入库时，库中不能存在与其标识项完 全相同的人借贷账户信息记录。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('110', 'ABR004', 'ContractCode', 'R0001203', '信息记录入库时，库中不能存在与其标识项完 全相同的个人授信协议信息记录。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('111', 'ABR006', '0000', null, '未知错误，导致记录无法解析。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('116', 'ABE002', 'AcctCode', 'I0001301', '个人借贷账户记录和个人借贷账户特殊事件说 明记录中的“账户标识码”与文件头中“数据 提供机构区段码”应对应同一数据提供机构。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('117', 'ABE002', 'Mcc', 'I0001301', '个人借贷账户记录中的“授信协议标识码”与 文件头中“数据提供机构区段码”应对应同一 数据提供机构。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('118', 'ABE002', 'ContractCode', 'I0001301', '个人授信协议记录中的“授信协议标识码”与 文件头中“数据提供机构区段码”应对应同一 数据提供机构。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('119', 'ABE002', 'Ccc', 'I0001301', '个人借贷账户记录的“抵（质）押合同标识码” 与文件头中“数据提供机构区段码”应对应同 一数据提供机构。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('120', 'ABE002', 'MaxGuarMcc', 'I0001301', '个人借贷账户记录的“保证合同编号”与文件 头中“数据提供机构区段码”应对应同一数据 提供机构。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('121', 'ABE002', 'CreditRestCode', 'I0001301', '个人授信协议记录中的“授信限额编号”与文件头中“数据提供机构区段码”应对应同一数据提供机构。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('122', 'ABE002', 'OdBnesCode', 'I0001301', '标识变更请求记录中的“原业务标识码”与文 件头中“数据提供机构区段码”应对应同一数 据提供机构。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('123', 'ABE002', 'NwBnesCode', 'I0001301', '标识变更请求记录中的“新业务标识码”与文 件头中“数据提供机构区段码”应对应同一数 据提供机构。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('124', 'ABE002', 'ModRecCode', 'I0001301', '按段更正记录中的“待更正业务标识码”与文 件头中“数据提供机构区段码”应对应同一数 据提供机构。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('125', 'ABE002', 'DelRecCode', 'I0001301', '按段删除或整笔删除记录中的“待删除业务标 识码”与文件头中“数据提供机构区段码”应 对应同一数据提供机构。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('126', 'ABE003', 'MngmtOrgCode', 'I0001302', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('128', 'ABE005', 'ArlpCertNum', 'I0001402', '责任人身份标识号码为中征码时应在库中存在。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('129', 'ABE005', 'CertRelIDNum', 'I0001402', '共同受信人身份标识号码中征码时应在库中存在。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('130', 'ABE007', 'OpenDate', 'I0000501', '个人借贷账户信息记录的信息报告日期应不早 于开户日期', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('131', 'ABE007', 'SettDate', 'I0000501', '个人借贷账户信息记录的信息报告日期应不早 于结算/应还款日期', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('132', 'ABE007', 'FiveCateAdjDate', 'I0000501', '个人借贷账户信息记录的信息报告日期应不早 于五级分类认定日期', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('133', 'ABE007', 'LatRpyDate', 'I0000501', '个人借贷账户信息记录的信息报告日期应不早 于最近一次实际还款日期', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('134', 'ABE007', 'CloseDate', 'I0000501', '个人借贷账户信息记录的信息报告日期应不早 于账户关闭日期', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('135', 'ABE007', 'SpecEfctDate', 'I0000501', '个人借贷账户信息记录的信息报告日期应不早 于分期额度生效日期', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('136', 'ABE007', 'TranDate', 'I0000501', '个人借贷账户信息记录的信息报告日期应不早 于交易日期', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('137', 'ABE007', 'ConEffDate', 'I0000501', '个人授信协议信息记录的信息报告日期应不早 于额度生效日期。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('138', 'ABE008', '超出范围的时间类数据项标签', 'I0000601', '所有时间必须是有效时间：1901-01-01T00:00:00—2099-12-31T23:59:59。所有日期必须是有效日期：1901-01-01—2099-12-31。所有月份必须是有效月份：1901-01—2099-12。所有年份必须为有效年份：1901—2099。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('139', 'ABE010', 'RltRepymtNm', 'I0000701', '对于一组可出现多次的数据项：责任人信息， 其出现次数必须与其个数相匹配。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('140', 'ABE010', 'CcNm', 'I0000701', '对于一组可出现多次的数据项：抵质押合同信 息，其出现次数必须与其个数相匹配。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('141', 'ABE010', 'CagOfTrdNm', 'I0000701', '对于一组可出现多次的数据项：交易信息，其 出现次数必须与其个数相匹配。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('142', 'ABE010', 'BrerNm', 'I0000701', '对于一组可出现多次的数据项：共同授信人信 息，其出现次数必须与其个数相匹配。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('143', 'ABE011', 'RltRepymtNm', 'I0000702', '对于相关还款责任人段中一组可出现多次的数 据项，当出现多次时，内容不能重复。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('144', 'ABE011', 'CcNm', 'I0000702', '对于抵质押物信息段中一组可出现多次的数据 项，当出现多次时，内容不能重复。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('145', 'ABE011', 'CagOfTrdNm', 'I0000702', '对于特定交易说明段中一组可出现多次的数据 项，当出现多次时，内容不能重复。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('146', 'ABE011', 'BrerNm', 'I0000702', '对于共同受信人信息段中一组可出现多次的数 据项，当出现多次时，内容不能重复。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('147', 'ABE012', '0000', 'I0001801', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('148', 'BLR000', 'AcctBsInfSgmt', 'R2100101', '当“报告时点说明代码”为“10-新开户”时，个 人借贷账户信息记录至少包含基本信息段。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('149', 'BLR000', 'AcctMthlyBlgInfSgmt', 'R2100101', '当“报告时点说明代码”为“10-新开户”时，个 人借贷账户信息记录至少包含基本信息段。对于不 同的账户类型至少还应包含的信息段如下： 若“账户类型”为“D1”，则还应包含月度表现信 息段， 若“账户类型”为“R1/R3/R4”还应包含月度表现 信息段 若“账户类型”为“R2”，则还应包含月度表现段', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('150', 'BLR000', 'AcctCredSgmt', 'R2100101', '当“报告时点说明代码”为“10-新开户”时，个人借贷账户信息记录至少包含基本信息段。对于不同的账户类型至少还应包含的信息段如下：若“账户类型”为“D1”，则如果基本信息段中“分次放款标志”为“是”，则还应包含授信额度信息段；若“账户类型”为“R1/R3/R4”还应包含授信额度信息段；若“账户类型”为“R2”，则如果基本信息段中的“借贷业务种类细分”不是“大额专项分期卡”，则还应包含授信额度信息段；', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('151', 'BLR000', 'AcctDbtInfSgmt', 'R2100101', '当“报告时点说明代码”为“10-新开户”时，个 人借贷账户信息记录至少包含基本信息段。对于不 同的账户类型至少还应包含的信息段如下： 若“账户类型”为“C1”，还应包括非月度表现信 息段', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('152', 'BLR000', 'OrigCreditorInfSgmt', 'R2100101', '当“报告时点说明代码”为“10-新开户”时，个 人借贷账户信息记录至少包含基本信息段。对于不 同的账户类型至少还应包含的信息段如下： 若“账户类型”为“C1”，还应包括初始债权说明 段。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('153', 'BLR002', 'AcctBsInfSgmt', 'R2100103', '当“报告时点说明代码”为“31-月结日首次上报 存量账户”时，个人借贷账户信息记录至少包含基 本信息段', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('154', 'BLR002', 'AcctMthlyBlgInfSgmt', 'R2100103', '当“报告时点说明代码”为“31-月结日首次上报 存量账户”时。对于不同的账户类型至少还应包含 的信息段如下： 若“账户类型”为“D1”，则还应包含月度表现信 息段 若“账户类型”为“R1/R3/R4”还应包含月度表现 信息段 若“账户类型”为“R2”，则还应包含月度表现段', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('155', 'BLR002', 'AcctCredSgmt', 'R2100103', '当“报告时点说明代码”为“31-月结日首次上报存量账户”时。对于不同的账户类型至少还应包含的信息段如下：若“账户类型”为“D1”，如果基本信息段中“分次放款标志”为“是”，则还应包含授信额度信息段若“账户类型”为“R1/R3/R4”还应包含授信额度信息段；若“账户类型”为“R2”，如果基本信息段中的“借贷业务种类细分”不是“大额专项分期卡”，则还应包含授信额度信息段；', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('156', 'BLR002', 'AcctType', 'R2100103', '当“报告时点说明代码”为“31-月结日首次上报 存量账户”时， “账户类型”不能为“C1”。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('157', 'BLR003', 'OrigCreditorInfSgmt', 'R2100104', '当“报告时点说明代码”为“31-月结日首次上报 存量账户”时，对于不同的账户类型不应包含的信 息段如下： 若“账户类型”为“D1”，不应包含初始债权说明 段 若“账户类型”为“R1/R3/R4”，不应包含初始债 权说明段 若“账户类型”为“R2”，不应包含初始债权说明 段', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('384', 'BAR004', 'FiveCateAdjDate', 'R2301201', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('385', 'BAR005', 'AcctStatus', 'R2301202', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('386', 'BAR006', 'AcctStatus', 'R2301203', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('387', 'BAE001', 'OpenDate', 'I2300C01', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('388', 'BAE006', '0000', 'I2300C02', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('389', 'BAE002', 'CloseDate', 'I2300D01', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('390', 'BAE005', 'CloseDate', 'I2300D02', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('391', 'BAE003', '0000', 'I2300E01', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('158', 'BLR003', 'AcctDbtInfSgmt', 'R2100104', '当“报告时点说明代码”为“31-月结日首次上报 存量账户”时，对于不同的账户类型不应包含的信 息段如下： 若“账户类型”为“D1”，不应包含非月度表现信 息段 若“账户类型”为“R1/R3/R4”，不应包含非月度 表现信息段 若“账户类型”为“R2”，不应包含非月度表现信 息段', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('159', 'BLR003', 'SpecPrdSgmt', 'R2100104', '当“报告时点说明代码”为“31-月结日首次上报 存量账户”时，对于不同的账户类型不应包含的信 息段如下： 若“账户类型”为“D1”，不应包含大额专项分期 信息段 若“账户类型”为“R1/R3/R4”，不应包含大额专 项分期信息段；', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('161', 'BLR003', 'AcctCredSgmt', 'R2100104', '当“报告时点说明代码”为“31-月结日首次上报 存量账户”时，对于不同的账户类型不应包含的信 息段如下： 若“账户类型”为“D1”，如果基本信息段中“分 次放款标志”为“否”，则还不应包含授信额度信 息段； 若“账户类型”为“R2”，如果基本信息段中的“借 贷业务种类细分”是“大额专项分期卡”，则还不 应包含授信额度信息段。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('162', 'BLR006', 'AcctMthlyBlgInfSgmt', 'R2100107', '当“报告时点说明代码”为“30-月度结算”时， 至少应包含月度表现信息段。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('163', 'BLR006', 'AcctType', 'R2100107', '当“报告时点说明代码”为“30-月度结算”时，“账 户类型”不能为“C1”。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('164', 'BLR007', 'OrigCreditorInfSgmt', 'R2100108', '当“报告时点说明代码”为“30-月度结算”时： 对于 D1 账户不应包含初始债权说明段 对于 R1/R3/R4 账户都不应包含初始债权说明段 对于 R2 账户不应包含初始债权说明段', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('165', 'BLR007', 'AcctDbtInfSgmt', 'R2100108', '当“报告时点说明代码”为“30-月度结算”时： 对于 D1 账户不应包含非月度表现信息段 对于 R1/R3/R4 账户都不应包含非月度表现信息段 对于 R2 账户不应包含非月度表现信息段', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('166', 'BLR007', 'SpecPrdSgmt', 'R2100108', '当“报告时点说明代码”为“30-月度结算”时： 对于 D1 账户不应包含大额专项分期信息段 对于 R1/R3/R4 账户都不应包含大额专项分期信息 段', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('167', 'BLR007', 'AcctCredSgmt', 'R2100108', '当“报告时点说明代码”为“30-月度结算”时： 对于 D1 账户，如果基本信息段中“分次放款标志” 为“否”，则还不应包含授信额度信息段； 对于 R2 账户，如果基本信息段中的“借贷业务种 类细分”是“大额专项分期卡”，则还不应包含授 信额度信息段。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('168', 'BLR008', 'AcctDbtInfSgmt', 'R2100109', '当“报告时点说明代码”为“40-收回逾期款项” 时，至少应包含非月度表现信息段。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('169', 'BLR008', 'AcctType', 'R2100109', '当“报告时点说明代码”为“40-收回逾期款项” 时，账户类型不能为“R3”。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('170', 'BLR009', 'AcctMthlyBlgInfSgm', 'R2100110', '当“报告时点说明代码”为“40-收回逾期款项”时，不应包含月度表现信息段', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('171', 'BLR009', 'SpecPrdSgmt', 'R2100110', '当“报告时点说明代码”为“40-收回逾期款项”时，不应包大额专项分期信息段', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('172', 'BLR009', 'MotgaCltalCtrctInfSgmt', 'R2100110', '当“报告时点说明代码”为“40-收回逾期款项”时，不应包含抵质押物信息段', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('173', 'BLR009', 'AcctCredSgmt', 'R2100110', '当“报告时点说明代码”为“40-收回逾期款项”时，不应包含授信额度信息段', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('174', 'BLR009', 'OrigCreditorInfSgmt', 'R2100110', '当“报告时点说明代码”为“40-收回逾期款项”时，对于不同的账户类型不应包含的信息段如下： 若“账户类型”为“D1/R1/R2/R4”，不应包括初债 权说明段', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('175', 'BLR009', 'AcctSpecTrstDspnSgmt', 'R2100110', '当“报告时点说明代码”为“40-收回逾期款项”时，对于不同的账户类型不应包含的信息段如下： 若“账户类型”为“D1/R1/R2/R4”，不应包括特殊 交易说明段', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('176', 'BLR009', 'AcctBsInfSgmt', 'R2100110', '当“报告时点说明代码”为“40-收回逾期款项”时，对于不同的账户类型不应包含的信息段如下： 若“账户类型”为“D1/R1/R2/R4”，不应包括基本 信息段', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('177', 'BLR009', 'RltRepymtInfSgmt', 'R2100110', '当“报告时点说明代码”为“40-收回逾期款项”时，对于不同的账户类型不应包含的信息段如下： 若“账户类型”为“D1/R1/R2/R4”，不应包括相关 还款责任人段。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('178', 'BLR010', 'AcctMthlyBlgInfSgmt', 'R2100111', '当“报告时点说明代码”为“20-账户关闭”时： 若“账户类型”为“D1/R1/R2/R3/R4”还应包含月度表现信息段；', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('179', 'BLR010', 'AcctDbtInfSgmt', 'R2100111', '当“报告时点说明代码”为“20-账户关闭”时： 若“账户类型”为“C1”还应包含非月度表现信息段。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('180', 'BLR011', 'OrigCreditorInfSgmt', 'R2100112', '当“报告时点说明代码”为“20-账户关闭”时： 若“账户类型”为“D1”，不应包含初始债权说明 段 若“账户类型”为“R1/R3/R4”，不应包含初始债 权说明段 若“账户类型”为“R2”，不应包含初始债权说明 段', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('181', 'BLR011', 'AcctDbtInfSgmt', 'R2100112', '当“报告时点说明代码”为“20-账户关闭”时： 若“账户类型”为“D1”，不应包含非月度表现信 息段 若“账户类型”为“R1/R3/R4”，不应包含非月度 表现信息段 若“账户类型”为“R2”，不应包含非月度表现信 息段。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('182', 'BLR011', 'SpecPrdSgmt', 'R2100112', '当“报告时点说明代码”为“20-账户关闭”时： 若“账户类型”为“D1”，不应包含大额专项分期 信息段 若“账户类型”为“R1/R3/R4”，不应包含大额专 项分期信息段 若“账户类型”为“C1”，不应包括大额专项分期 信息段、', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('15', 'ABR002', 'InfSurcCode', 'R0000201', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('16', 'ABR004', 'InfSurcCode', 'R0001203', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('22', 'ABE002', 'InfSurcCode', 'I0001301', '个人基本信息中各类记录的“信息来源编码” 与文件头中“数据提供机构区段码”应对应同 一数据提供机构。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('23', 'ABE003', 'Cimoc', 'I0001302', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('25', 'ABE005', '0000', 'I0001402', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('26', 'ABE007', 'IDInfoUpDate', 'I0000501', '个人基本信息记录的“信息报告日期”应不早 于其他标识信息段信息更新日期。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('27', 'ABE007', 'FcsInfoUpDate', 'I0000501', '个人基本信息记录的“信息报告日期”应不早 于基本概况信息段信息更新日期。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('28', 'ABE007', 'SpsInfoUpDate', 'I0000501', '个人基本信息记录的“信息报告日期”应不早 于婚姻信息段信息更新日期。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('29', 'ABE007', 'EduInfoUpDate', 'I0000501', '个人基本信息记录的“信息报告日期”应不早 于教育信息段信息更新日期。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('30', 'ABE007', 'OctpnInfoUpDate', 'I0000501', '个人基本信息记录的“信息报告日期”应不早 于职业信息段信息更新日期。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('31', 'ABE007', 'ResiInfoUpDate', 'I0000501', '个人基本信息记录的“信息报告日期”应不早 于居住地址段信息更新日期。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('32', 'ABE007', 'MlgInfoUpDate', 'I0000501', '个人基本信息记录的“信息报告日期”应不早 于通讯信息段信息更新日期。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('33', 'ABE007', 'IncInfoUpDate', 'I0000501', '个人基本信息记录的“信息报告日期”应不早 于收入信息段信息更新日期。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('34', 'ABE007', 'DOB', 'I0000501', '个人基本信息记录的“信息报告日期”应不早 于出生日期。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('35', 'ABE007', 'IDEfctDate', 'I0000501', '个人证件有效期信息记录的“信息报告日期”应不早于证件有效期起始日期。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('37', 'ABE010', 'IDNm', 'I0000701', '对于一组可出现多次的数据项：其他标识信息， 其出现次数必须与其个数相匹配。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('38', 'ABE011', 'IDNm', 'I0000702', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('40', 'BBR000', 'BsSgmt', 'R1100102', '个人基本信息记录应包含基础段。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('41', 'BBR000', 'FcsInfSgmt', 'R1100101', '当报告时点说明代码为“10-新增客户/首次上 报”时，记录必须至少包含基本概况信息段。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('42', 'BBR000', 'SpsInfSgmt', 'R1100101', '当报告时点说明代码为“10-新增客户/首次上 报”时，记录必须至少包含婚姻信息段。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('43', 'BBR000', 'EduInfSgmt', 'R1100101', '当报告时点说明代码为“10-新增客户/首次上 报”时，记录必须至少包含教育信息段。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('44', 'BBR000', 'OctpnInfSgmt', 'R1100101', '当报告时点说明代码为“10-新增客户/首次上 报”时，记录必须至少包含职业信息段。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('45', 'BBR000', 'RedncInfSgmt', 'R1100101', '当报告时点说明代码为“10-新增客户/首次上 报”时，记录必须至少包含居住地址段。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('46', 'BBR000', 'MlgInfSgmt', 'R1100101', '当报告时点说明代码为“10-新增客户/首次上 报”时，记录必须至少包含通讯地址段。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('47', 'BBR001', 'FcsInfSgmt', 'R1101201', '对于待入库的个人基本信息记录，若“两标/三 标”+“信息来源编码”在库中不存在，该记录 至少包含基本概况段。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('48', 'BBR001', 'SpsInfSgmt', 'R1101201', '对于待入库的个人基本信息记录，若“两标/三 标”+“信息来源编码”在库中不存在，该记录 至少包含婚姻信息段。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('49', 'BBR001', 'EduInfSgmt', 'R1101201', '对于待入库的个人基本信息记录，若“两标/三 标”+“信息来源编码”在库中不存在，该记录 至少包含教育信息段。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('50', 'BBR001', 'OctpnInfSgmt', 'R1101201', '对于待入库的个人基本信息记录，若“两标/三 标”+“信息来源编码”在库中不存在，该记录 至少包含职业信息段。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('51', 'BBR001', 'RedncInfSgmt', 'R1101201', '对于待入库的个人基本信息记录，若“两标/三标”+“信息来源编码”在库中不存在，该记录至少包含居住地址段。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('52', 'BBR001', 'MlgInfSgmt', 'R1101201', '对于待入库的个人基本信息记录，若“两标/三 标”+“信息来源编码”在库中不存在，该记录 至少包含通讯地址段。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('53', 'BBR002', 'RptDate', 'R1101202', '对于待入库的个人基本信息记录，若“两标/三 标”+“信息来源编码”在库中已存在，若其信 息报告日期早于库中信息记录最新的信息报告 日期，则此记录不能入库。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('54', 'BBR002', 'IDInfoUpDate', 'R1101202', '对于待入库的个人基本信息记录，若“两标/三 标”+“信息来源编码”在库中已存在，若其他 标识信息段信息更新日期早于库中其他标识信 息段信息更新日期，则此记录不能入库。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('55', 'BBR002', 'FcsInfoUpDate', 'R1101202', '对于待入库的个人基本信息记录，若“两标/三 标”+“信息来源编码”在库中已存在，若基本 概况段信息更新日期早于库中基本概况信息段 信息更新日期，则此记录不能入库。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('56', 'BBR002', 'SpsInfoUpDate', 'R1101202', '对于待入库的个人基本信息记录，若“两标/三 标”+“信息来源编码”在库中已存在，若婚姻 信息段信息更新日期早于库中婚姻信息段信息 更新日期，则此记录不能入库。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('57', 'BBR002', 'EduInfoUpDate', 'R1101202', '对于待入库的个人基本信息记录，若“两标/三 标”+“信息来源编码”在库中已存在，若教育 信息段信息更新日期早于库中教育信息段信息 更新日期，则此记录不能入库。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('58', 'BBR002', 'OctpnInfoUpDate', 'R1101202', '对于待入库的个人基本信息记录，若“两标/三 标”+“信息来源编码”在库中已存在，若职业 信息段信息更新日期早于库中职业信息段信息 更新日期，则此记录不能入库。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('59', 'BBR002', 'ResiInfoUpDate', 'R1101202', '对于待入库的个人基本信息记录，若“两标/三 标”+“信息来源编码”在库中已存在，若居住 地址段信息更新日期早于库中居住地址段信息 更新日期，则此记录不能入库。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('60', 'BBR002', 'MlgInfoUpDate', 'R1101202', '对于待入库的个人基本信息记录，若“两标/三 标”+“信息来源编码”在库中已存在，若通讯 信息段信息更新日期早于库中通讯信息段信息 更新日期，则此记录不能入库。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('61', 'BBR002', 'IncInfoUpDate', 'R1101202', '对于待入库的个人基本信息记录，若“两标/三 标”+“信息来源编码”在库中已存在，若收入 信息段信息更新日期早于库中收入信息段信息 更新日期，则此记录不能入库。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('62', 'BBD000', 'CpnName', 'S1100101', '当“就业状况”为“11-国家公务员”、“13-专业技术人员”、“17-职员”、“21-企业管理人员”、“24-工人”或“91-在职”时，“单位名称”必须出现。“就业状况”若为上述以外的代码，上述数据项不能出现。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('63', 'BBD000', 'CpnType', 'S1100101', '当“就业状况”为“11-国家公务员”、“13-专业 技术人员”、“17-职员”、“21-企业管理人员”、 “24-工人”或“91-在职”时，“单位性质”必 须出现。“就业状况”若为上述以外的代码，上 述数据项不能出现。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('64', 'BBD000', 'Industry', 'S1100101', '当“就业状况”为“11-国家公务员”、“13-专业 技术人员”、“17-职员”、“21-企业管理人员”、 “24-工人”或“91-在职”时，“单位所属行业” 必须出现。“就业状况”若为上述以外的代码， 上述数据项不能出现。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('65', 'BBD000', 'CpnAddr', 'S1100101', '当“就业状况”为“11-国家公务员”、“13-专业 技术人员”、“17-职员”、“21-企业管理人员”、 “24-工人”或“91-在职”时，“单位详细地址” 必须出现。“就业状况”若为上述以外的代码， 上述数据项不能出现。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('66', 'BBD000', 'CpnPc', 'S1100101', '当“就业状况”为“11-国家公务员”、“13-专业 技术人员”、“17-职员”、“21-企业管理人员”、 “24-工人”或“91-在职”时，“单位所在地邮 编”必须出现。“就业状况”若为上述以外的代 码，上述数据项不能出现。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('67', 'BBD000', 'CpnDist', 'S1100101', '当“就业状况”为“11-国家公务员”、“13-专业 技术人员”、“17-职员”、“21-企业管理人员”、 “24-工人”或“91-在职”时，“单位所在地行 政区划”必须出现。“就业状况”若为上述以外 的代码，上述数据项不能出现。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('68', 'BBD000', 'CpnTEL', 'S1100101', '当“就业状况”为“11-国家公务员”、“13-专业 技术人员”、“17-职员”、“21-企业管理人员”、 “24-工人”或“91-在职”时，“单位电话”必 须出现。“就业状况”若为上述以外的代码，上 述数据项不能出现。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('69', 'BBD000', 'Occupation', 'S1100101', '当“就业状况”为“11-国家公务员”、“13-专业 技术人员”、“17-职员”、“21-企业管理人员”、 “24-工人”或“91-在职”时，“职业”必须出 现。“就业状况”若为上述以外的代码，上述数 据项不能出现。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('70', 'BBD000', 'Title', 'S1100101', '当“就业状况”为“11-国家公务员”、“13-专业技术人员”、“17-职员”、“21-企业管理人员”、“24-工人”或“91-在职”时，“职务”必须出现。“就业状况”若为上述以外的代码，上述数据项不能出现。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('71', 'BBD000', 'TechTitle', 'S1100101', '当“就业状况”为“11-国家公务员”、“13-专业 技术人员”、“17-职员”、“21-企业管理人员”、 “24-工人”或“91-在职”时，“职称”必须出 现。“就业状况”若为上述以外的代码，上述数 据项不能出现。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('72', 'BBD000', 'WorkStartDate', 'S1100101', '当“就业状况”为“11-国家公务员”、“13-专业 技术人员”、“17-职员”、“21-企业管理人员”、 “24-工人”或“91-在职”时，“本单位工作起 始年份”必须出现。“就业状况”若为上述以外 的代码，上述数据项不能出现。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('73', 'BBD001', 'SpoName', 'S1100102', '当“婚姻状况”为“20-已婚”、“21-初婚”、“22- 再婚”、“23-复婚”时，“配偶姓名”必须出现。 “婚姻状况”若为上述以外的代码，上述数据 项不能出现。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('74', 'BBD001', 'SpoIDType', 'S1100102', '当“婚姻状况”为“20-已婚”、“21-初婚”、“22- 再婚”、“23-复婚”时，“配偶证件类型”必须出 现。“婚姻状况”若为上述以外的代码，上述数 据项不能出现。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('508', 'ABE000', '空的 M 型数据项标签', 'I0000101', 'M 型数据项不能为空值且不能为空格（含全角 和半角空格）。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('509', 'ABE001', '不符合类型规定的数据项标签', 'I0000201', '记录中各个数据项的值，应符合类型规定。对 于枚举型数据项，取值需要在代码表中；对于 非枚举型数据项需要长度合规，类型相符。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('520', 'ABE005', 'IDNum', 'I0001402', '借款人身份标识号码为中征码时应在库中存在', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('523', 'ABE007', 'BalChgDate', 'I0000501', '信息记录中的“信息报告日期”应不早于同一 条记录中余额变化日期', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('528', 'ABE007', 'LatAgrrRpyDate', 'I0000501', '信息记录中的信息报告日期应不早于同一条记 录中最近一次约定还款日', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('537', 'ABE011', 'CosignersNm', 'I0000702', '对于联保人信息段中一组可出现多次的数据 项，当出现多次时，内容不能重复。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('539', 'CLR000', 'AcctBsSgmt', 'R4100101', '当“报送时点说明代码”为“10-新开户/首次报送” 时，对于不同的账户类型至少还应包含的信息段 如下。 若“账户类型”为“D1”，必须包含基础段 若“账户类型”为“D2”，必须包含基础段 若“账户类型”为“R1/R4”，必须包含基础段 若“账户类型”为“C1”，必须包含基础段', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('540', 'CLR000', 'AcctBsInfSgmt', 'R4100101', '当“报送时点说明代码”为“10-新开户/首次报送” 时，对于不同的账户类型至少还应包含的信息段 如下。 若“账户类型”为“D1”，必须包含基本信息段 若“账户类型”为“D2”，必须包含基本信息段 若“账户类型”为“R1/R4”，必须包含基本信息 段 若“账户类型”为“C1”，必须包含基本信息段', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('183', 'BLR011', 'AcctCredSgmt', 'R2100112', '当“报告时点说明代码”为“20-账户关闭”时： 若“账户类型”为“D1”，如果基本信息段中“分 次放款标志”为“否”，则还不应包含授信额度信 息段； 若“账户类型”为“R2”，如果基本信息段中的“借 贷业务种类细分”是“大额专项分期卡”，则还不 应包含授信额度信息段； 若“账户类型”为“C1”，不应包括授信额度信息 段。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('283', 'BIE102', 'NwBnesCode', 'I2211B03', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('284', 'BQR001', 'AcctCode', 'R2151201', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('285', 'BQR002', 'AcctType', 'R2151202', '若“事件类型”为“11-信用卡因调整账单日本月不出单” 且“生效标志”为“1-有效”。账户类型必须为“R2”，否则此记录不能入库。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('286', 'BQR002', 'Month', 'R2151202', '若“事件类型”为“11-信用卡因调整账单日本月不 出单” 且“生效标志”为“1-有效”。“发生月份” 不能存在“月度表现信息段”，否则此记录不能入 库；若“发生月份”处于销户月与下一个重启月之 间，则此记录不能入库。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('287', 'BQR002', 'AcctStatus', 'R2151202', '若“事件类型”为“11-信用卡因调整账单日本月不 出单” 且“生效标志”为“1-有效”。该记录的信 息报告日期晚于该账户的最新的信息报告日期，则 最新账户状态必须不为“4-销户”，否则此记录不 能入库。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('288', 'BQR002', '0000', 'R2151202', '若“事件类型”为“11-信用卡因调整账单日本月不 出单” 且“生效标志”为“1-有效”。 库中不能存在“账户标识码+事件类型+发生月份+ 生效标识”相同的特殊事件说明记录，否则此记录 不能入库。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('289', 'BQR003', 'AcctType', 'R2151203', '若“事件类型”为“12-已注销信用卡账户重启” 且 “生效标志”为“1-有效”。 账户类型必须为“R2” ，否则此记录不能入库。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('290', 'BQR003', 'AcctStatus', 'R2151203', '若“事件类型”为“12-已注销信用卡账户重启” 且 “生效标志”为“1-有效”。 该账户的最新的“账户状态”必须是“4-销户”， 否则此记录不能入库。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('291', 'BQR003', 'Month', 'R2151203', '若“事件类型”为“12-已注销信用卡账户重启” 且 “生效标志”为“1-有效”。 “发生月份”必须大于账户最新的“月度表现信息 段”的月份，否则此记录不能入库。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('292', 'BQR003', '0000', 'R2151203', '若“事件类型”为“12-已注销信用卡账户重启” 且 “生效标志”为“1-有效”。 库中不能存在“账户标识码+事件类型+发生月份+ 生效标识”相同的特殊事件说明记录，否则此记录 不能入库。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('293', 'BQR004', 'AcctType', 'R2151204', '若“事件类型”为“21-转出”且“生效标志”为 “1-有效”。 该账户的账户类型必须为“D1” ，否则此记录不 能入库。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('294', 'BQR004', 'RptDate', 'R2151204', '若“事件类型”为“21-转出”且“生效标志”为 “1-有效”。 该记录的信息报告日期必须晚于库中最新的信息 记录，否则不能入库。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('295', 'BQR004', 'AcctStatus', 'R2151204', '若“事件类型”为“21-转出”且“生效标志”为“1-有效”。该账户的最新账户状态必须不为“3-关闭”，否则此记录不能入库。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('296', 'BQR004', 'Month', 'R2151204', '若“事件类型”为“21-转出”且“生效标志”为 “1-有效”。 “发生月份”必须等于最新的“月度表现信息段” 的“月份”的次月，否则此记录不能入库。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('297', 'BQR004', '0000', 'R2151204', '若“事件类型”为“21-转出”且“生效标志”为 “1-有效”。 库中不能存在“账户标识码+事件类型+发生月份+ 生效标识”相同的特殊事件说明记录，否则此记录 不能入库。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('298', 'BQR005', '0000', 'R2151205', '若“生效标志”为“0-无效”：“账户标识码+事件 类型+发生月份”对应的“生效标志”为“1-有效” 的特殊事件说明记录必须库中存在，否则该记录不 能入库。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('299', 'BQR005', 'OpetnType', 'R2151205', '若“生效标志”为“0-无效”：“事件类型”为“12- 已注销信用卡账户重启”，若存在更新的月度表现 信息（即“月份”大于该记录的“发生月份”），则 该记录不能入库。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('300', 'BQR006', '0000', 'R2151206', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('301', 'BQR000', '0000', 'I2150B01', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('302', null, null, 'R2120101', '待更正段内数据项取值必须符合正常数据报送时 该信息段内数据项之间的校验规则。 反馈信息代码和反馈标签参见正常报送时相应反 馈。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('303', 'BMR001', '0000', 'R2120102', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('306', 'BMR003', '0000', 'R2120106', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('307', 'BMR005', '0000', 'R2120107', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('309', 'BMR007', '0000', 'R2121206', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('310', 'BMR008', 'RptDate', 'R2121207', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('311', 'BMR012', 'AcctType', 'R2121211', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('312', 'BMR014', 'RptDate', 'R2121213', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('313', 'BMR006', '0000', 'R2121214', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('314', 'BMR021', '0000', 'R2121215', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('315', 'BMR009', '0000', 'R2121216', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('316', 'BMR010', '0000', 'R2121217', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('317', 'BMR011', '0000', 'R2121218', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('318', 'BMR013', '0000', 'R2121219', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('319', 'BMR015', '0000', 'R2121220', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('320', 'BMR016', '0000', 'R2121221', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('321', 'BMR017', '0000', 'R2121222', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('322', 'BMR018', '0000', 'R2121223', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('323', 'BMR019', '0000', 'R2121224', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('324', 'BMR020', '0000', 'R2121225', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('326', 'BMR101', '0000', 'R2220102', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('327', 'BMR105', '0000', 'R2220103', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('329', 'BMR104', '0000', 'R2221203', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('330', 'BMR103', '0000', 'R2221207', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('331', 'BMR110', '0000', 'R2221208', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('332', 'BMR106', '0000', 'R2221209', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('333', 'BMR107', '0000', 'R2221210', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('334', 'BMR108', '0000', 'R2221211', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('335', 'BMR109', '0000', 'R2221212', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('336', 'BTE000', 'DelRecCode', 'R2141101', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('337', 'BTE100', 'DelRecCode', 'R2241101', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('338', 'BSR000', '0000', 'R2131203', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('339', 'BSR001', '0000', 'R2131201', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('340', 'BSR002', '0000', 'R2131202', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('341', 'BSE000', '0000', 'I2130B01', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('342', 'BSE001', 'DelStartDate', 'I2130B02', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('343', 'BSR100', '0000', 'R2231101', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('344', 'BSE100', '0000', 'I2230B01', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('345', 'BSE101', 'DelStartDate', 'I2230B02', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('352', 'ABD000', '未出现的A型数据项标签', 'S0000101', 'A 型数据项必须出现在相应的信息段中。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('353', 'ABD001', '空信息段的信息段标签', 'S0000102', '信息段不能为空段（信息段为空指两个信息段 的 XML 标签中没有任何数据项）。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('364', 'ABE004', '不符合编码规则的各类身份标识号码的标签', 'I0000401', '各类身份标识号码应符合相应的编码规则。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('367', 'ABE007', 'RepayPrd', 'I0000501', '个人担保账户信息记录的信息报告日期应不早 于余额变化日期。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('376', 'BAR000', 'GuarAcctBsInfSgmt', 'R2300101', '“报告时点说明代码”为“10-新开户/首次上 报”，至少应出现“基本信息段”。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('377', 'BAR000', 'GuarRltRepymtInfSgmt', 'R2300101', '“报告时点说明代码”为“10-新开户/首次上 报”，至少应出现“在保责任信息段”。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('378', 'BAR001', 'GuarRltRepymtInfSgmt', 'R2300102', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('379', 'BAR002', 'GuarRltRepymtInfSgmt', 'R2300103', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('380', 'BAR007', 'RltRepymtInfSgmt', 'R2300105', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('381', 'BAR008', 'GuarAcctBsSgmt', 'R2300106', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('382', 'BAR003', 'GuarRltRepymtInfSgmt', 'R2300107', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('383', 'BAR009', 'GuarRltRepymtInfSgmt', 'R2300108', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('854', 'CMR110', '0000', 'R4221209', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('855', 'CMR111', '0000', 'R4221210', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('856', 'CMR112', '0000', 'R4221211', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('857', 'CTR100', 'DelRecCode', 'R4241201', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('858', 'CSR100', '0000', 'R4231201', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('859', 'CSE100', '0000', 'I4230B01', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('184', 'BLR011', 'AcctMthlyBlgInfSgmt', 'R2100112', '当“报告时点说明代码”为“20-账户关闭”时： 若“账户类型”为“C1”，不应包括月度表现段', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('185', 'BLR011', 'MotgaCltalCtrctInfSgmt', 'R2100112', '当“报告时点说明代码”为“20-账户关闭”时： 若“账户类型”为“C1”，不应包括抵质押物信息段', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('186', 'BLR012', 'AcctMthlyBlgInfSgmt', 'R2100113', '当“报告时点说明代码”为“32-月结日账户关闭” 时，至少应包括月度表现信息段。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('187', 'BLR012', 'AcctType', 'R2100113', '当“报告时点说明代码”为“32-月结日账户关闭” 时，“账户类型”不能为“C1”。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('188', 'BLR013', 'OrigCreditorInfSgmt', 'R2100114', '当“报告时点说明代码”为“32-月结日账户关闭” 时，借款账户信息记录对于不同的账户类型不应包 含的信息段如下： 若“账户类型”为“D1”，不应包含初始债权说明 段 若“账户类型”为“R1/R3/R4”，不应包含初始债 权说明段 若“账户类型”为“R2”，不应包含初始债权说明 段', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('189', 'BLR013', 'AcctDbtInfSgmt', 'R2100114', '当“报告时点说明代码”为“32-月结日账户关闭” 时，借款账户信息记录对于不同的账户类型不应包 含的信息段如下： 若“账户类型”为“D1”，不应包含非月度表现信 息段 若“账户类型”为“R1/R3/R4”，不应包含非月度 表现信息段 若“账户类型”为“R2”，不应包含非月度表现信 息段', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('190', 'BLR013', 'SpecPrdSgmt', 'R2100114', '当“报告时点说明代码”为“32-月结日账户关闭” 时，借款账户信息记录对于不同的账户类型不应包 含的信息段如下： 若“账户类型”为“D1”，不应包含大额专项分期 信息段 若“账户类型”为“R1/R3/R4”，不应包含大额专 项分期信息段', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('191', 'BLR013', 'AcctCredSgmt', 'R2100114', '当“报告时点说明代码”为“32-月结日账户关闭” 时，借款账户信息记录对于不同的账户类型不应包 含的信息段如下： 若“账户类型”为“D1”，如果基本信息段中“分 次放款标志”为“否”，则还不应包含授信额度信 息段。 若“账户类型”为“R2”，如果基本信息段中的“借 贷业务种类细分”是“大额专项分期卡”，则还不 应包含授信额度信息段。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('192', 'BLR014', 'RltRepymtInfSgmt', 'R2100115', '当“报告时点说明代码”为“10-新开户”或“31-月结日首次上报存量账户”时，若D1/R1/R2/R3/R4类账户的“基本信息段”中“担保方式”为“3-保证”、“5-组合（含保证）”时，则应包含相关还款责任人段。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('193', 'BLR029', 'AcctBsSgmt', 'R2100117', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('194', 'BLR019', 'AcctType', 'R2101204', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('195', 'BLR020', 'AcctStatus', 'R2101205', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('196', 'BLR021', 'RptDate', 'R2101206', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('197', 'BLR022', 'FiveCateAdjDate', 'R2101207', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('198', 'BLR023', '0000', 'R2101208', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('199', 'BLR024', '0000', 'R2101209', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('200', 'BLR025', 'AcctStatus', 'R2101210', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('201', 'BLR026', 'RptDate', 'R2101211', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('202', 'BLR027', 'RptDate', 'R2101212', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('203', 'BLR028', 'RptDate', 'R2101213', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('204', 'BLR004', 'AcctBsInfSgmt', 'R2101215', '当首次上报时（库中不存在该账户），个人借贷账 户信息记录至少包含基本信息段', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('205', 'BLR004', 'AcctMthlyBlgInfSgmt', 'R2101215', '当首次上报时（库中不存在该账户），对于不同的 账户类型至少还应包含的信息段如下： 若“账户类型”为“D1”，则还应包含月度表现信 息段， 若“账户类型”为“R1/R3/R4”还应包含月度表现 信息段 若“账户类型”为“R2”，则还应包含月度表现段', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('206', 'BLR004', 'AcctCredSgmt', 'R2101215', '当首次上报时（库中不存在该账户），对于不同的 账户类型至少还应包含的信息段如下： 若“账户类型”为“D1”，如果基本信息段中“分 次放款标志”为“是”，则还应包含授信额度信息 段； 若“账户类型”为“R1/R3/R4”还应包含授信额度 信息段； 若“账户类型”为“R2”，如果基本信息段中的“借 贷业务种类细分”不是“大额专项分期卡”，则还 应包含授信额度信息段；', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('207', 'BLR004', 'AcctDbtInfSgmt', 'R2101215', '当首次上报时（库中不存在该账户），对于不同的 账户类型至少还应包含的信息段如下： 若“账户类型”为“C1”，还应包括非月度表现信息段', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('208', 'BLR004', 'OrigCreditorInfSgmt', 'R2101215', '当首次上报时（库中不存在该账户），对于不同的 账户类型至少还应包含的信息段如下： 若“账户类型”为“C1”，还应包括初始债权说明段', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('209', 'BLR005', 'OrigCreditorInfSgmt', 'R2101214', '当首次上报时，对于不同的账户类型不应包含的信息段如下：若“账户类型”为“D1”，不应包含初始债权说明 段 若“账户类型”为“R1/R3/R4”，不应包含初始债 权说明段 若“账户类型”为“R2”，不应包含初始债权说明 段', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('210', 'BLR005', 'AcctDbtInfSgmt', 'R2101214', '当首次上报时，对于不同的账户类型不应包含的信息段如下：若“账户类型”为“D1”，不应包含非月度表现信 息段 若“账户类型”为“R1/R3/R4”，不应包含非月度 表现信息段 若“账户类型”为“R2”，不应包含非月度表现信 息段', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('211', 'BLR005', 'SpecPrdSgmt', 'R2101214', '当首次上报时，对于不同的账户类型不应包含的信息段如下：若“账户类型”为“D1”，不应包含大额专项分期 信息段 若“账户类型”为“R1/R3/R4”，不应包含大额专 项分期信息段 若“账户类型”为“C1”，不应包括大额专项分期 信息段', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('212', 'BLR005', 'AcctCredSgmt', 'R2101214', '当首次上报时，对于不同的账户类型不应包含的信息段如下：若“账户类型”为“D1”，如果基本信息段中“分 次放款标志”为“否”，则还不应包含授信额度信 息段； 若“账户类型”为“R2”，如果基本信息段中的“借 贷业务种类细分”是“大额专项分期卡”，则还不 应包含授信额度信息段； 若“账户类型”为“C1”，不应包括授信额度信息 段。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('213', 'BLR005', 'AcctMthlyBlgInfSgmt', 'R2101214', '当首次上报时，对于不同的账户类型不应包含的信息段如下：若“账户类型”为“C1”，不应包括月度表现段', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('214', 'BLR005', 'MotgaCltalCtrctInfSgmt', 'R2101214', '当首次上报时，对于不同的账户类型不应包含的信息段如下：若“账户类型”为“C1”，不应包括抵质押物信息 段', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('215', 'BLD000', '不符合 S 型出现约束的数据项标签', 'S2100101', '除 A 型数据项外，对于不同的账户类型 S 型数据项 出现约束见附录《个人借贷账户出现约束表》。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('216', 'BLE028', 'RepayFreqcy', 'I2100C02', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('217', 'BLE031', 'CreditID', 'I2100C03', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('218', 'BLE036', '0000', 'I2100C04', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('219', 'BLE038', 'RepayPrd', 'I2100C05', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('220', 'BLE009', '0000', 'I2100C06', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('221', 'BLE050', '0000', 'I2100C07', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('222', 'BLE003', 'ArlpAmt', 'I2100D01', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('223', 'BLE032', '0000', 'I2100D02', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('224', 'BLE048', 'WartySign', 'I2100D04', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('225', 'BLE048', 'MaxGuarMcc', 'I2100D04', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('226', 'BLE002', 'RpyPrct', 'I2100H01', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('227', 'BLE012', 'SettDate', 'I2100H02', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('228', 'BLE013', 'TotOverd', 'I2100H03', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('229', 'BLE014', 'AcctBal', 'I2100H04', '若“账户状态”为“6-未激活”时，则“余额”必 须为 0。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('230', 'BLE014', 'RpyStatus', 'I2100H04', '若“账户状态”为“6-未激活”时，则“当前还款 状态”必须为“*”。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('231', 'BLE014', 'OverdPrd', 'I2100H04', '若“账户状态”为“6-未激活”时，则“当前逾期 期数”若存在则必须为 0。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('232', 'BLE014', 'TotOverd', 'I2100H04', '若“账户状态”为“6-未激活”时，则“当前逾期 总额”若存在则必须为 0。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('233', 'BLE015', 'CurRpyAmt', 'I2100H05', '当账户信息记录中“当前还款状态”为“*”时， “本月应还款金额”必须为 0（若此账户没有上述 数据项，则不校验此数据项）。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('234', 'BLE015', 'OverdPrd', 'I2100H05', '当账户信息记录中“当前还款状态”为“*”时， “当前逾期期数”必须为 0（若此账户没有上述数 据项，则不校验此数据项）。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('235', 'BLE015', 'TotOverd', 'I2100H05', '当账户信息记录中“当前还款状态”为“*”时， “当前逾期总额”必须为 0（若此账户没有上述数 据项，则不校验此数据项）。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('236', 'BLE015', 'PridAcctBal', 'I2100H05', '当账户信息记录中“当前还款状态”为“*”时， “本期账单余额”必须为 0（若此账户没有上述数 据项，则不校验此数据项）。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('237', 'BLE017', 'OverdPrd', 'I2100H07', '针对月度表现段，当账户信息记录中“当前还款状 态”为“N”或“M”时，“当前逾期期数”必须为 0（若此账户没有上述数据项，则不校验此数据项）。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('238', 'BLE017', 'TotOverd', 'I2100H07', '针对月度表现段，当账户信息记录中“当前还款状态”为“N”或“M”时， “当前逾期总额”必须为 0（若此账户没有上述数据项，则不校验此数据项）。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('239', 'BLE019', 'OverdPrd', 'I2100H09', '当账户信息记录中“当前还款状态”为“1-7”数 字时，“当前逾期期数”必须大于 0（若此账户没 有上述数据项，则不校验此数据项）。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('240', 'BLE019', 'TotOverd', 'I2100H09', '当账户信息记录中“当前还款状态”为“1-7”数 字时， “当前逾期总额”必须大于 0（若此账户没 有上述数据项，则不校验此数据项）。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('241', 'BLE020', '0000', 'I2100H10', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('242', 'BLE026', 'AcctBal', 'I2100H11', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('243', 'BLE030', 'RpyStatus', 'I2100H12', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('244', 'BLE011', 'CloseDate', 'I2100H13', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('245', 'BLE001', 'CloseDate', 'I2100H14', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('246', 'BLE004', 'OverdPrd', 'I2100H15', '当账户状态为“关闭”/“销户”时， “当前逾期 期数”应为 0。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('247', 'BLE004', 'TotOverd', 'I2100H15', '当账户状态为“关闭”/“销户”时，“当前逾期总 额”应为 0。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('248', 'BLE007', 'SpecEfctDate', 'I2100I01', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('249', 'BLE034', 'RpyStatus', 'I2100J02', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('250', 'BLE042', 'CloseDate', 'I2100J03', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('251', 'BLE043', 'CloseDate', 'I2100J04', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('252', 'BLE027', 'AcctBal', 'I2100J05', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('253', 'BLE018', 'OverdPrd', 'I2100J06', '针对非月度表现段，若“当前还款状态”为“N” 或“M”，则“当前逾期期数”必须为 0（若此账户 没有上述数据项，则不校验此数据项）。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('254', 'BLE018', 'TotOverd', 'I2100J06', '针对非月度表现段，若“当前还款状态”为“N” 或“M”，则 “当前逾期总额”必须为 0（若此账户 没有上述数据项，则不校验此数据项）。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('255', 'BLE046', 'CagOfTrdNm', 'I2100K01', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('256', 'BLE022', 'OvedrawBaOve180', 'I2100A01', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('257', 'BLE023', 'AcctBal', 'I2100A02', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('258', 'BLE025', 'AcctBal', 'I2100A04', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('259', 'BLE029', 'RepayMode', 'I2100A05', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('260', 'BLE035', 'BusiLines', 'I2100A07', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('261', 'BLE037', 'AcctStatus', 'I2100A08', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('262', 'BLE005', 'OpenDate', 'I2100A09', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('263', 'BLE006', 'CloseDate', 'I2100A10', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('264', 'BLE008', 'RptDate', 'I2100A11', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('265', 'BLE010', 'RptDate', 'I2100A12', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('266', 'BLE039', 'RptDate', 'I2100A13', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('267', 'BLE040', 'LatRpyDate', 'I2100A14', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('268', 'BLE041', '0000', 'I2100A15', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('269', 'BLE016', '0000', 'I2100A16', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('270', 'BCR000', 'CtrctBsSgmt', 'R2200101', '个人授信协议记录报送时，“基础段”必须出现。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('271', 'BCR000', 'CreditLimSgmt', 'R2200101', '个人授信协议记录报送时，“额度信息段”必须出 现。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('272', 'BCR001', 'ConStatus', 'R2201201', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('273', 'BCR002', 'ConStatus', 'R2201202', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('274', 'BCE002', '0000', 'I2200C01', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('275', 'BCE000', 'ConEffDate', 'I2200D01', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('276', 'BCE004', '0000', 'I2200D02', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('277', 'BCE003', '0000', 'I2200A01', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('278', 'BIE000', '0000', 'I2110B01', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('279', 'BIE001', 'OdBnesCode', 'I2111B02', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('280', 'BIE002', 'NwBnesCode', 'I2111B03', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('281', 'BIE100', '0000', 'I2210B01', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('282', 'BIE101', 'OdBnesCode', 'I2211B02', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('392', 'BAE007', 'WartySign', 'I2300E03', '相关还款责任人段中“还款责任人类型”为“2- 反担保人”时，“联保标志”必须不能为空值。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('393', 'BAE007', 'MaxGuarMcc', 'I2300E03', '相关还款责任人段中“还款责任人类型”为“2- 反担保人”时，“保证合同编号”必须不能为 空值。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('394', 'BAE000', 'RepayPrd', 'I2300A01', '账户信息记录中的开户日期小于等于余额变化 日期。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('395', 'BAE000', 'FiveCateAdjDate', 'I2300A01', '账户信息记录中的开户日期小于等于五级分类 认定日期。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('396', 'BAE000', 'CloseDate', 'I2300A01', '账户信息记录中的开户日期小于等于账户关闭 日期（若不为空）。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('397', 'BAE004', '0000', 'I2300A02', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('398', 'BIE200', '0000', 'I2310B01', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('399', 'BIE201', 'OdBnesCode', 'I2311B02', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('400', 'BIE202', 'NwBnesCode', 'I2311B03', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('402', 'BMR201', '0000', 'R2320102', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('405', 'BMR212', '0000', 'R2320105', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('406', 'BMR204', '0000', 'R2320106', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('408', 'BMR203', '0000', 'R2321203', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('409', 'BMR205', 'AcctType', 'R2321207', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('410', 'BMR206', '0000', 'R2321208', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('411', 'BMR207', '0000', 'R2321209', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('412', 'BMR208', '0000', 'R2321210', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('413', 'BMR209', '0000', 'R2321211', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('414', 'BMR210', '0000', 'R2321212', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('415', 'BMR211', '0000', 'R2321213', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('416', 'BSR200', '0000', 'R2331101', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('417', 'BSE200', '0000', 'I2330B01', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('418', 'BSE201', 'DelStartDate', 'I2330B02', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('419', 'BTE200', 'DelRecCode', 'R2341101', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('433', 'ABE005', 'EntCertNum', 'I0001402', '基础段企业身份标识号码为中征码时应在库中存在', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('434', 'ABE005', 'OthEntCertNum', 'I0001402', '其他标识段企业身份标识号码为中征码时应在库中存在', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('435', 'ABE005', 'SharHodIDNum', 'I0001402', '出资人身份标识号码为中征码时应在库中存在', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('436', 'ABE005', 'ActuCotrlIDNum', 'I0001402', '实际控制人身份标识号码为中征码时应在库中存在', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('437', 'ABE005', 'SupOrgCertNum', 'I0001402', '上级机构身份标识号码为中征码时应在库中存 在', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('441', 'ABE005', 'AssoEntCertNum', 'I0001402', 'B 企业其他身份标识号码为中征码时应在库中 存在', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('445', 'ABE007', 'MnMmbInfoUpDate', 'I0000501', '企业基本信息记录的“信息报告日期”应不早 于主要组成人员段信息更新日期', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('446', 'ABE007', 'MnShaHodInfoUpDate', 'I0000501', '企业基本信息记录的“信息报告日期”应不早 于注册资本及主要出资人段信息更新日期', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('447', 'ABE007', 'ActuCotrlInfoUpDate', 'I0000501', '企业基本信息记录的“信息报告日期”应不早 于实际控制人段信息更新日期', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('448', 'ABE007', 'SupOrgInfoUpDate', 'I0000501', '企业基本信息记录的“信息报告日期”应不早 于上级机构段信息更新日期', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('541', 'CLR000', 'ActLbltyInfSgmt', 'R4100101', '当“报送时点说明代码”为“10-新开户/首次报送”时，对于不同的账户类型至少还应包含的信息段如下。若“账户类型”为“D1”，必须包含还款表现信息段若“账户类型”为“D2”，必须包含还款表现信息段若“账户类型”为“R1/R4”，必须包含还款表现信息段。若“账户类型”为“C1”，必须包含还款表现信息段', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('542', 'CLR000', 'AcctCredSgmt', 'R4100101', '当“报送时点说明代码”为“10-新开户/首次报送” 时，对于不同的账户类型至少还应包含的信息段 如下。 若“账户类型”为“D1”，如果基本信息段中“分 次放款标识”代码表位为“1”或“2”，则还应包 含授信额度信息段。 若“账户类型”为“R1/R4”，必须包含授信额度 信息段', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('543', 'CLR001', 'OrigCreditorInfSgmt', 'R4100102', '当“报送时点说明代码”为“10-新开户/首次报送” 时，对于不同的账户类型不应包含的信息段如下。 若“账户类型”为“D1”，不应包含初始债权说明 段 若“账户类型”为“R1/R4”，不应包含初始债权说明 段', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('544', 'CLR001', 'AcctCredSgmt', 'R4100102', '当“报送时点说明代码”为“10-新开户/首次报送” 时，对于不同的账户类型不应包含的信息段如下。 若“账户类型”为“D1”，如果“分次放款标识” 为“0”，则不应包含授信额度信息段。 若“账户类型”为“D2”，不应包含授信额度信 息段 若“账户类型”为“C1”，不应包含授信额度信 息段', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('545', 'CLR001', 'MotgaCltalCtrctInfSgmt', 'R4100102', '当“报送时点说明代码”为“10-新开户/首次报送” 时，对于不同的账户类型不应包含的信息段如下。 若“账户类型”为“D2”，不应包含抵质押物信 息段 若“账户类型”为“C1”，不应包含抵质押物信 息段', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('546', 'CLR002', 'AcctBsSgmt', 'R4100103', '当“报送时点说明代码”为“20-账户关闭”时，对于不同的账户类型至少还应包含的信息段如下。若“账户类型”为“D1”，必须包含基础段若“账户类型”为“D2”，必须包含基础段若“账户类型”为“R1/R4”，必须包含基础段若“账户类型”为“C1”，必须包含基础段', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('547', 'CLR002', 'ActLbltyInfSgmt', 'R4100103', '当“报送时点说明代码”为“20-账户关闭”时， 对于不同的账户类型至少还应包含的信息段如 下。 若“账户类型”为“D1”，必须包含还款表现信 息段。 若“账户类型”为“D2”，必须包含还款表现信 息段。 若“账户类型”为“R1/R4”，必须包含还款表现 信息段。 若“账户类型”为“C1”，必须包含还款表现信 息段。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('548', 'CLR003', 'MotgaCltalCtrctInfSgmt', 'R4100104', '当“报送时点说明代码”为“20-账户关闭”时， 对于不同的账户类型不应包含的信息段如下。 若“账户类型”为“D2”，不应包含抵质押物信 息段 若“账户类型”为“C1”，不应包含抵质押物信 息段', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('549', 'CLR003', 'AcctCredSgmt', 'R4100104', '当“报送时点说明代码”为“20-账户关闭”时， 对于不同的账户类型不应包含的信息段如下。 若“账户类型”为“D1”，如果“分次放款标识” 为“0”，则不应包含授信额度信息段。 若“账户类型”为“D2”，不应包含授信额度信 息段 若“账户类型”为“C1”，不应包含授信额度信 息段。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('550', 'CLR003', 'OrigCreditorInfSgmt', 'R4100104', '当“报送时点说明代码”为“20-账户关闭”时， 对于不同的账户类型不应包含的信息段如下。 若“账户类型”为“D1”，不应包含初始债权说 明段 若“账户类型”为“R1/R4”，不应包含初始债权 说明段。 若“账户类型”为“C1”，不应包含初始债权说 明段。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('551', 'CLR003', 'RltRepymtInfSgmt', 'R4100104', '当“报送时点说明代码”为“20-账户关闭”时， “账户类型”为“C1”，不应包含相关还款责任 信息段。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('552', 'CLR004', 'AcctBsInfSgmt', 'R4100105', '当“报送时点说明代码”为“31-开户后放款”时，对于不同的账户类型至少还应包含的信息段如下。若“账户类型”为“D1”，且“分次放款标识”为“2”，还应包含基本信息段。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('553', 'CLR004', 'AcctType', 'R4100105', '当“报送时点说明代码”为“31-开户后放款”时， 对于不同的账户类型至少还应包含的信息段如 下。 若“账户类型”为“D1”，且“分次放款标识” 为“0”、“1”，则不适用放款日报送时点。 若“账户类型”为“D2”，不适用放款日报送时点。 若“账户类型”为“R1/R4”，不适用放款日报送时点。 若“账户类型”为“C1”，不适用放款日报送时点。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('554', 'CLR005', 'OrigCreditorInfSgmt', 'R4100106', '当“报送时点说明代码”为“31-开户后放款”时， 对于不同的账户类型不应包含的信息段如下。 若“账户类型”为“D1”，且“分次放款标识” 为“2”，不应包含初始债权说明段。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('555', 'CLR005', 'AcctType', 'R4100106', '当“报送时点说明代码”为“31-开户后放款”时， 对于不同的账户类型不应包含的信息段如下。 若“账户类型”为“D1”，“分次放款标识”为 “0”、“1”，不适用放款日报送时点。 若“账户类型”为“D2”，不适用放款日报送时 点。 若“账户类型”为“R1/R4”，不适用放款日报送 时点。 若“账户类型”为“C1”，不适用放款日报送时 点。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('556', 'CLR006', 'AcctBsSgmt', 'R4100107', '当“报送时点说明代码”为“32-约定还款日结算” 时，对于不同的账户类型至少还应包含的信息段 如下。 若“账户类型”为“D1”，应包含基础段 若“账户类型”为“D2”，应包含基础段 若“账户类型”为“R4”，应包含基础段', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('557', 'CLR006', 'ActLbltyInfSgmt', 'R4100107', '当“报送时点说明代码”为“32-约定还款日结算” 时，对于不同的账户类型至少还应包含的信息段 如下。 若“账户类型”为“D1”，应包含还款表现信息 段。 若“账户类型”为“D2”，应包含还款表现信息 段。 若“账户类型”为“R4”，应包含还款表现信息 段。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('449', 'ABE007', 'CotaInfoUpDate', 'I0000501', '企业基本信息记录的“信息报告日期”应不早 于联系方式段信息更新日期', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('450', 'ABE007', 'EstablishDate', 'I0000501', '企业基本信息记录的“信息报告日期”应不早 于成立日期', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('453', 'ABE010', 'MmbNm', 'I0000701', '对于一组可出现多次的数据项：主要组成人员 信息，其出现次数必须与其个数相匹配。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('454', 'ABE010', 'MnSharHodNm', 'I0000701', '对于一组可出现多次的数据项：主要出资人信 息，其出现次数必须与其个数相匹配。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('455', 'ABE010', 'ActuCotrlNm', 'I0000701', '对于一组可出现多次的数据项：实际控制人信 息，其出现次数必须与其个数相匹配。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('457', 'ABE011', 'MmbNm', 'I0000702', '对于主要组成人员段中一组可出现多次的数据 项,当出现多次时，内容不能重复。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('458', 'ABE011', 'MnSharHodNm', 'I0000702', '对于注册资本及主要出资人段中一组可出现多 次的数据项,当出现多次时，内容不能重复。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('459', 'ABE011', 'ActuCotrlNm', 'I0000702', '对于实际控制人段中一组可出现多次的数据项, 当出现多次时，内容不能重复。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('461', 'CBR000', 'FcsInfSgmt', 'R3100101', '当报告时点说明代码为“报告时新增客户/首次 上报”时，记录必须至少包含“基本概况段”。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('462', 'CBR000', 'MnMmbInfSgmt', 'R3100101', '当报告时点说明代码为“报告时新增客户/首次 上报”时，记录必须至少包含“主要组成人员 段”。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('463', 'CBR000', 'CotaInfSgmt', 'R3100101', '当报告时点说明代码为“报告时新增客户/首次 上报”时，记录必须至少包含“联系方式段”。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('464', 'CBR001', 'MnShaHodInfSgmt', 'R3100102', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('465', 'CBR005', 'BsSgmt', 'R3100103', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('466', 'CBR002', 'FcsInfSgmt', 'R3101201', '首次加载入库时，除基础段外，待入库记录必 须至少包含基本概况段。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('467', 'CBR002', 'MnMmbInfSgmt', 'R3101201', '新增信息记录首次入库时，除基础段外，待入 库记录必须至少包含主要组成人员段。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('468', 'CBR002', 'CotaInfSgmt', 'R3101201', '新增信息记录首次入库时，除基础段外，待入 库记录必须至少包含联系方式段。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('469', 'CBR003', 'RptDate', 'R3101202', '待入库的企业基本信息记录（“两标/三标”+“信 息来源编码”在库中存在），其“信息报告日期” 早于库中信息记录最新的信息报告日期，该记 录不能入库。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('470', 'CBR003', 'IDInfoUpDate', 'R3101202', '待入库的企业基本信息记录（“两标/三标”+“信 息来源编码”在库中存在），其他标识信息段信 息更新日期早于最新的其他标识信息段信息更 新日期，该记录不能入库。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('471', 'CBR003', 'FcsInfoUpDate', 'R3101202', '待入库的企业基本信息记录（“两标/三标”+“信 息来源编码”在库中存在），基本概况信息段信 息更新日期早于最新的基本概况信息段信息更 新日期，该记录不能入库。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('472', 'CBR003', 'MnMmbInfoUpDate', 'R3101202', '待入库的企业基本信息记录（“两标/三标”+“信 息来源编码”在库中存在），主要组成人员段信 息更新日期早于最新的主要组成人员段信息更 新日期，该记录不能入库。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('473', 'CBR003', 'MnShaHodInfoUpDate', 'R3101202', '待入库的企业基本信息记录（“两标/三标”+“信 息来源编码”在库中存在），注册资本及主要出 资人段信息更新日期早于最新的注册资本及主 要出资人段信息更新日期，该记录不能入库。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('474', 'CBR003', 'ActuCotrlInfoUpDate', 'R3101202', '待入库的企业基本信息记录（“两标/三标”+“信息来源编码”在库中存在），实际控制人段信息更新日期早于最新的实际控制人段信息更新日期，该记录不能入库。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('475', 'CBR003', 'SupOrgInfoUpDate', 'R3101202', '待入库的企业基本信息记录（“两标/三标”+“信 息来源编码”在库中存在），上级机构段信息更 新日期早于最新的上级机构段信息更新日期， 该记录不能入库。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('476', 'CBR003', 'CotaInfoUpDate', 'R3101202', '待入库的企业基本信息记录（“两标/三标”+“信 息来源编码”在库中存在），联系方式段信息更 新日期早于最新的联系方式段信息更新日期， 该记录不能入库。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('477', 'CBR004', 'OrgType', 'R3101203', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('478', 'CBE012', '0000', 'I3100C01', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('479', 'CBE013', '0000', 'I3100D01', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('480', 'CBE011', 'EstablishDate', 'I3100D02', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('481', 'CBE000', '0000', 'I3100E01', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('482', 'CBE001', '0000', 'I3100E02', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('483', 'CBE002', '0000', 'I3100E03', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('484', 'CBE014', '0000', 'I3100E04', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('485', 'CBE003', 'ShholderIDType', 'I3100F01', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('486', 'CBE004', 'InvRatio', 'I3100F02', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('487', 'CBE005', 'ActuCotrlCertType', 'I3100G01', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('488', 'CBE015', '0000', 'I3100H01', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('489', 'CBE006', 'OthEntCertType', 'I3100A01', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('490', 'CBE007', 'OthEntCertType', 'I3100A02', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('491', 'CBE008', 'OthEntCertType', 'I3100A03', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('492', 'CBE009', 'OthEntCertType', 'I3100A04', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('493', 'CBE010', 'OthEntCertType', 'I3100A05', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('494', 'CBE011', '0000', 'I3100A07', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('495', 'CGR000', 'RptDate', 'R3401201', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('496', 'CGE000', '0000', 'I3400B01', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('497', 'CFR000', 'RptDate', 'R3501201', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('498', 'CFE000', '0000', 'I3500B01', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('499', 'CDR000', '0000', 'R3141201', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('733', 'CAE002', 'RepayPrd', 'I4400D02', '账户信息记录中如果“账户关闭日期”数据项不 为空，账户关闭日期应不早于余额变化日期、。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('734', 'CAE002', 'FiveCateAdjDate', 'I4400D02', '账户信息记录中如果“账户关闭日期”数据项不 为空，账户关闭日期应不早于五级分类认定日期。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('735', 'CAE003', '0000', 'I4400E01', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('736', 'CAE009', 'WartySign', 'I4400E03', '当“还款责任人类型”为“2-反担保人”时，“联 保标志”不应为空。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('737', 'CAE009', 'MaxGuarMcc', 'I4400E03', '当“还款责任人类型”为“2-反担保人”时，“保 证合同编号”不应为空。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('738', 'CAE006', 'RepayPrd', 'I4400A01', '账户信息记录中的“开户日期”应不晚于“余额 变化日期”。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('739', 'CAE006', 'FiveCateAdjDate', 'I4400A01', '账户信息记录中的“开户日期”应不晚于“五级 分类认定日期”。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('740', 'CAE006', 'CloseDate', 'I4400A01', '账户信息记录中的“开户日期”应不晚于“账户 关闭日期”。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('741', 'CAE007', '0000', 'I4400A02', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('742', 'CIR200', '0000', 'I4410B01', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('743', 'CIR201', 'OdBnesCode', 'I4411B02', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('744', 'CIR202', 'NwBnesCode', 'I4411B03', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('746', 'CMR301', 'MdfcSgmtCode', 'R4420102', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('749', 'CMR302', '0000', 'R4420105', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('750', 'CMR303', '0000', 'R4420106', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('752', 'CMR306', '0000', 'R4421203', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('753', 'CMR309', 'AcctType', 'R4421206', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('754', 'CMR313', '0000', 'R4421207', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('755', 'CMR314', '0000', 'R4421208', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('756', 'CMR315', '0000', 'R4421209', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('757', 'CMR311', '0000', 'R4421210', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('758', 'CMR312', '0000', 'R4421211', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('759', 'CMR316', '0000', 'R4421212', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('760', 'CMR317', '0000', 'R4421213', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('761', 'CSR300', '0000', 'R4431201', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('762', 'CSE300', '0000', 'I4430B01', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('763', 'CSE301', 'DelStartDate', 'I4430B02', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('764', 'CTR300', 'DelRecCode', 'R4441201', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('768', 'ABR002', '0000', 'R0000201', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('769', 'ABR004', '0000', 'R0001203', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('775', 'ABE002', '0000', 'I0000301', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('779', 'ABE007', 'AuditTime', 'I0000501', '信息记录中的“信息报告日期”应不早于同一 条记录中审计时间。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('781', 'ABE011', '0000', 'I0000702', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('783', 'CRE000', 'TotalEquityAndLiabilities', 'I6100C01', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('784', 'CRE001', 'TotalAssets', 'I6100C02', '在借款人 2002 版资产负债表信息中数据项“负债 和所有者权益总计＝资产总计”。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('785', 'CRE002', 'TotalEquityAndLiabilities', 'I6100D01', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('786', 'CRE003', 'TotalAssets', 'I6100C02', '在 2007 版资产负债表信息中数据项“资产总计=负 债和所有者权益合计”。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('787', 'CRE100', 'NetCashFlowsFromOperatingActivities', 'I6300C01', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('788', 'CRE101', 'NetCashFlowsFromInvestingActivities', 'I6300C02', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('789', 'CRE102', 'NetCashFlowsFromFinancingActivities', 'I6300C03', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('790', 'CRE103', 'NetIncreaseInCashAndCashEquivalents', 'I6300C04', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('791', 'CRE104', 'NetCashFlowsFromOperatingActivities', 'I6300D01', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('792', 'CRE105', 'NetCashFlowsFromInvestingActivities', 'I6300D02', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('793', 'CRE106', 'NetCashFlowsFromFinancingActivities', 'I6300D03', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('794', 'CRE107', 'NetIncreaseInCashAndCashEquivalents', 'I6300D04', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('795', 'CRE108', 'TheFinalCashAndCashEquivalentsBalance', 'I6300D05', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('796', 'CRE200', 'SheetType', 'I6400B01', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('797', 'CRE201', 'TotalAssets', 'I6400C01', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('798', 'CRE202', 'TotalLiabilities', 'I6400C02', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('799', 'CRE203', 'TotalLiabilitiesAndNetAssets', 'I6400C03', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('800', 'CRE204', 'TotalAssets', 'I6400C04', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('801', 'CRE300', 'SheetType', 'I6500B01', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('802', 'CRE301', 'CurrentFinancialSubsidyCarriedOverBalance', 'I6500C01', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('803', 'CRE302', 'CurrentUndertakingsCarriedOverBalance /CurrentUndertakingsCarriedOverBalance', 'I6500C02', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('804', 'CRE303', 'CurrentOperatingBalance', 'I6500C03', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('805', 'CRE400', '0000', 'R6141201', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('806', 'CRE500', '0000', 'R6241201', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('807', 'CRE600', '0000', 'R6341201', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('808', 'CRE700', '0000', 'R6441201', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('809', 'CRE800', '0000', 'R6541201', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('835', 'CCR000', 'CtrctBsSgmt', 'R4200101', '企业授信协议记录报送时，“基础段”必须出现。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('836', 'CCR000', 'CreditLimSgmt', 'R4200101', '企业授信协议记录报送时，“额度信息段”必须 出现。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('837', 'CCR001', 'ConStatus', 'R4201201', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('838', 'CCR002', 'ConStatus', 'R4201202', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('839', 'CCE000', '0000', 'I4200C01', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('840', 'CCE002', 'ConEffDate', 'I4200D01', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('841', 'CCE004', '0000', 'I4200D02', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('842', 'CCE003', '0000', 'I4200A01', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('843', 'CIR100', '0000', 'I4210B01', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('844', 'CIR101', 'OdBnesCode', 'I4211B02', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('845', 'CIR102', 'NwBnesCode', 'I4211B03', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('847', 'CMR101', 'MdfcSgmtCode', 'R4220102', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('848', 'CMR106', '0000', 'R4220103', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('850', 'CMR104', '0000', 'R4221203', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('851', 'CMR107', '0000', 'R4221206', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('852', 'CMR108', '0000', 'R4221207', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('853', 'CMR109', '0000', 'R4221208', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('860', 'CSE101', 'DelStartDate', 'I4230B02', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('864', 'ABR002', 'CcCode', 'R0000201', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('865', 'ABR004', 'CcCode', 'R0001203', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('871', 'ABE002', 'CcCode', 'I0001301', '抵（质）押合同信息记录中的“抵（质）押合 同标识码”与文件头中“数据提供机构区段码” 应对应同一数据提供机构。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('877', 'ABE005', 'CertNum', 'I0001402', '债务人身份标识号码为中征码时应在库中存在。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('878', 'ABE005', 'GuarCertNum', 'I0001402', '其他债务人身份标识号码为中征码时应在库中存在。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('879', 'ABE005', 'PleorCertNum', 'I0001402', '抵押人身份标识号码为中征码时应在库中存在。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('880', 'ABE005', 'PawnCertNum', 'I0001402', '出质人身份标识号码为中征码时应在库中存 在。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('881', 'ABE007', 'CcValDate', 'I0000501', '抵质押合同记录中的信息报告日期应不早于抵 （质）押合同生效日期。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('882', 'ABE007', 'ValDate', 'I0000501', '抵质押合同记录中的信息报告日期应不早于抵 押物评估日期。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('884', 'ABE010', 'GrtdNm', 'I0000701', '对于一组可出现多次的数据项：其他债务人信 息，其出现次数必须与其个数相匹配。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('885', 'ABE010', 'PleNm', 'I0000701', '对于一组可出现多次的数据项：抵押物信息， 其出现次数必须与其个数相匹配。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('886', 'ABE010', 'ImpNm', 'I0000701', '对于一组可出现多次的数据项：质押物种信息， 其出现次数必须与其个数相匹配。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('887', 'ABE011', 'GrtdNm', 'I0000702', '对于其他债务人信息段中一组可出现多次的数 据项，当出现多次时，内容不能重复。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('888', 'ABE011', 'PleNm', 'I0000702', '对于抵押物信息段中一组可出现多次的数据 项，当出现多次时，内容不能重复。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('889', 'ABE011', 'ImpNm', 'I0000702', '对于质物信息段中一组可出现多次的数据项， 当出现多次时，内容不能重复。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('891', 'BPR000', 'MotgaCltalCtrctBsSgmt', 'R5100101', '当抵（质）押合同信息记录上报时，基础段必 须出现。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('892', 'BPR000', 'MotgaCltalBsInfSgmt', 'R5100101', '当抵（质）押合同信息记录上报时，合同基本 信息段必须出现。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('893', 'BPR001', 'MotgaProptInfSgmt', 'R5100102', '当抵（质）押合同信息记录中“合同类型”为“1-抵押合同”、时，记录中必须有抵押物信息段且不能包含质押物信息段。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('894', 'BPR001', 'CltalInfSgmt', 'R5100102', '当抵（质）押合同信息记录中 “合同类型” 为“2-质押合同”时，记录中必须有质押信息 段且不能包含抵押信息段。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('895', 'BPR002', 'RptDate', 'R5101201', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('896', 'BPR003', 'CcStatus', 'R5101202', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('898', 'BPE001', '0000', 'I5100C01', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('899', 'BPE002', '0000', 'I5100D01', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('900', 'BPE003', 'GrtdNm', 'I5100D02', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('901', 'BPE005', 'PleNm', 'I5100E02', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('902', 'BPE007', 'ImpNm', 'I5100F02', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('903', 'BPE008', '0000', 'I5100A01', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('904', 'BIE300', '0000', 'I5110B01', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('905', 'BIE301', 'OdBnesCode', 'I5111B02', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('906', 'BIE302', 'NwBnesCode', 'I5111B03', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('907', 'BTE300', 'DelRecCode', 'R5141101', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('558', 'CLR006', 'AcctType', 'R4100107', '当“报送时点说明代码”为“32-约定还款日结算” 时，对于不同的账户类型至少还应包含的信息段 如下。 若“账户类型”为“R1”，不适用约定还款日报 送时点。 若“账户类型”为“C1”，不适用约定还款日报 送时点。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('559', 'CLR007', 'OrigCreditorInfSgmt', 'R4100108', '当“报送时点说明代码”为“32-约定还款日结算” 时，对于不同的账户类型不应包含的信息段如下。 若“账户类型”为“D1”，不应包含初始债权说 明段。 若“账户类型”为“R1”，不应包含初始债权说 明段 若“账户类型”为“R4”，不应包含初始债权说 明段。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('560', 'CLR007', 'AcctCredSgmt', 'R4100108', '当“报送时点说明代码”为“32-约定还款日结算” 时，对于不同的账户类型不应包含的信息段如下。 若“账户类型”为“D1”，如果“分次放款标识” 为“0”，则不应包含授信额度信息段。 若“账户类型”为“D2”，不应包含授信额度信 息段', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('561', 'CLR007', 'MotgaCltalCtrctInfSgmt', 'R4100108', '当“报送时点说明代码”为“32-约定还款日结算” 时，对于不同的账户类型不应包含的信息段如下。 若“账户类型”为“D2”，不应包含抵质押物信 息段', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('562', 'CLR007', 'AcctType', 'R4100108', '当“报送时点说明代码”为“32-约定还款日结算” 时，对于不同的账户类型不应包含的信息段如下。 若“账户类型”为“C1”，不适用约定还款日报 送时点。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('563', 'CLR008', 'AcctBsSgmt', 'R4100109', '当“报送时点说明代码”为“33-实际还款”时， 对于不同的账户类型至少还应包含的信息段如 下。 若“账户类型”为“D1”，应包含基础段 若“账户类型”为“D2”，应包含基础段 若“账户类型”为“R4”，应包含基础段 若“账户类型”为“C1”，应包含基础段', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('564', 'CLR008', 'ActLbltyInfSgmt', 'R4100109', '当“报送时点说明代码”为“33-实际还款”时，对于不同的账户类型至少还应包含的信息段如下。若“账户类型”为“D1”，应包含还款表现信息段。若“账户类型”为“D2”，应包含还款表现信息段。若“账户类型”为“R4”，应包含还款表现信息段。若“账户类型”为“C1”，应包含还款表现信息段。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('565', 'CLR008', 'AcctType', 'R4100109', '当“报送时点说明代码”为“33-实际还款”时， 对于不同的账户类型至少还应包含的信息段如 下。 对于“账户类型”为“R1”，不适用实际还款日 报送时点。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('566', 'CLR009', 'OrigCreditorInfSgmt', 'R4100110', '当“报送时点说明代码”为“33-实际还款”时， 对于不同的账户类型不应包含的信息段如下。 若“账户类型”为“D1”，不应包含初始债权说 明段。 若“账户类型”为“R4”，不应包含初始债权说 明段 若“账户类型”为“C1”，不应包含初始债权说 明段。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('567', 'CLR009', 'AcctCredSgmt', 'R4100110', '当“报送时点说明代码”为“33-实际还款”时， 对于不同的账户类型不应包含的信息段如下。 若“账户类型”为“D1”，如果“分次放款标识” 为“0”，则不应包含授信额度信息段。 若“账户类型”为“D2”，不应包含授信额度信 息段 若“账户类型”为“C1”，不应包含授信额度信 息段。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('568', 'CLR009', 'MotgaCltalCtrctInfSgmt', 'R4100110', '当“报送时点说明代码”为“33-实际还款”时， 对于不同的账户类型不应包含的信息段如下。 若“账户类型”为“D2”，不应包含抵质押物信 息段 若“账户类型”为“C1”，不应包含抵质押物信 息段', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('569', 'CLR009', 'RltRepymtInfSgmt', 'R4100110', '当“报送时点说明代码”为“33-实际还款”时，对于 不同的账户类型不应包含的信息段如下： 若“账户类型”为“C1”，不应包含相关还款责任人 段', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('570', 'CLR009', 'AcctType', 'R4100110', '当“报送时点说明代码”为“33-实际还款”时， 对于不同的账户类型不应包含的信息段如下。 若“账户类型”为“R1”，不适用实际还款报送 时点。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('571', 'CLR010', 'AcctBsSgmt', 'R4100111', '当“报送时点说明代码”为“41-五级分类调整” 时，对于不同的账户类型至少还应包含的信息段 如下。 若“账户类型”为“D1”，应包含基础段 对于“账户类型”为“D2”，应包含基础段 若“账户类型”为“R4”，应包含基础段 若“账户类型”为“C1”，应包含基础段', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('572', 'CLR010', 'ActLbltyInfSgmt', 'R4100111', '当“报送时点说明代码”为“41-五级分类调整” 时，对于不同的账户类型至少还应包含的信息段 如下。 若“账户类型”为“D1”，应包含还款表现信息 段。 对于“账户类型”为“D2”，应包含还款表现信 息段。 若“账户类型”为“R4”，应包含还款表现信息 段。 若“账户类型”为“C1”，应包含还款表现信息 段。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('573', 'CLR010', 'AcctType', 'R4100111', '当“报送时点说明代码”为“41-五级分类调整” 时， 对于“账户类型”为“R1”，不适用该时点。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('574', 'CLR011', 'OrigCreditorInfSgmt', 'R4100112', '当“报送时点说明代码”为“41-五级分类调整” 时，对于不同的账户类型不应包含的信息段如下。 若“账户类型”为“D1”，不应包含初始债权说 明段； 若“账户类型”为“R4”，不应包含初始债权说 明段； 若“账户类型”为“R1”，不适用该时点； 若“账户类型”为“C1”，不应包含初始债权说 明段。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('575', 'CLR011', 'AcctCredSgmt', 'R4100112', '当“报送时点说明代码”为“41-五级分类调整” 时，对于不同的账户类型不应包含的信息段如下。 若“账户类型”为“D1”，如果“分次放款标识” 为“0”，则不应包含授信额度信息段。 若“账户类型”为“D2”，不应包含授信额度信 息段 若“账户类型”为“C1”，授信额度信息段', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('576', 'CLR011', 'MotgaCltalCtrctInfSgmt', 'R4100112', '当“报送时点说明代码”为“41-五级分类调整”时，对于不同的账户类型不应包含的信息段如下。若“账户类型”为“D2”，不应包含抵质押物信息段若“账户类型”为“C1”，不应包含抵质押物信息段', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('577', 'CLR011', 'RltRepymtInfSgmt', 'R4100112', '当“报送时点说明代码”为“41-五级分类调整” 时，对于不同的账户类型不应包含的信息段如下。 若“账户类型”为“C1”，不应包含相关还款责 任人段', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('578', 'CLR012', 'AcctBsSgmt', 'R4100113', '当“报送时点说明代码”为“42-展期发生”时， 对于不同的账户类型至少应包含的信息段如下。 若“账户类型”为“D1”，应包含基础段。 若“账户类型”为“R4”，应包含基础段。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('579', 'CLR012', 'ActLbltyInfSgmt', 'R4100113', '当“报送时点说明代码”为“42-展期发生”时， 对于不同的账户类型至少应包含的信息段如下。 若“账户类型”为“D1”，应包含还款表现信息 段； 若“账户类型”为“R4”，应包含还款表现信息 段。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('580', 'CLR012', 'AcctSpecTrstDspnSgmt', 'R4100113', '当“报送时点说明代码”为“42-展期发生”时， 对于不同的账户类型至少应包含的信息段如下。 若“账户类型”为“D1”，特定交易说明段 若“账户类型”为“R4”，应包含特定交易说明 段。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('581', 'CLR012', 'AcctType', 'R4100113', '当“报送时点说明代码”为“42-展期发生”时， 对于不同的账户类型至少应包含的信息段如下。 对于“账户类型”为“D2”，不适用展期发生报 送时点。 若“账户类型”为“R1”，不适用展期发生报送 时点。 若“账户类型”为“C1”，不适用展期发生报送 时点。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('582', 'CLR013', 'OrigCreditorInfSgmt', 'R4100114', '当“报送时点说明代码”为“42-展期发生”时， 对于不同的账户类型不应包含的信息段如下。 若“账户类型”为“D1”，不应包含初始债权说 明段 若“账户类型”为“R4”，不应包含初始债权说 明段。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('583', 'CLR013', 'AcctCredSgmt', 'R4100114', '当“报送时点说明代码”为“42-展期发生”时， 对于不同的账户类型不应包含的信息段如下。 若“账户类型”为“D1”，如果“分次放款标识” 为“0”，则不应包含授信额度信息段。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('584', 'CLR013', 'AcctType', 'R4100114', '当“报送时点说明代码”为“42-展期发生”时，对于不同的账户类型不应包含的信息段如下。若“账户类型”为“D2”，不适用展期发生报送时点。若“账户类型”为“R1”，不适用展期发生报送时点。若“账户类型”为“C1”，不适用展期发生报送时点。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('585', 'CLR014', 'AcctBsSgmt', 'R4100115', '当“报送时点说明代码”为“49-其他报送日”时， 对于不同的账户类型至少应包含的信息段如下。 若“账户类型”为“D1”，应包含基础段 若“账户类型”为“D2”，应包含基础段 若“账户类型”为“R1”，应包含基础段 若“账户类型”为“R4”，应包含基础段 若“账户类型”为“C1”，应包含基础段', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('586', 'CLR014', 'ActLbltyInfSgmt', 'R4100115', '当“报送时点说明代码”为“49-其他报送日”时， 对于不同的账户类型至少应包含的信息段如下。 若“账户类型”为“D1”，应包含还款表现信息 段。 若“账户类型”为“D2”，应包含段、还款表现 信息段。 若“账户类型”为“R1”，应包含还款表现信息 段。 若“账户类型”为“R4”，应包含还款表现信息 段。 若“账户类型”为“C1”，应包含还款表现信息 段。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('587', 'CLR015', 'OrigCreditorInfSgmt', 'R4100116', '当“报送时点说明代码”为“49-其他报送日”时， 对于不同的账户类型不应包含的信息段如下。 若“账户类型”为“D1”，不应包含初始债权说 明段。 若“账户类型”为“R1/ R4”，不应包含初始债权 说明段。 若“账户类型”为“C1”，不应包含初始债权说 明段。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('588', 'CLR015', 'AcctCredSgmt', 'R4100116', '当“报送时点说明代码”为“49-其他报送日”时， 对于不同的账户类型不应包含的信息段如下。 若“账户类型”为“D1”，如果“分次放款标识” 为“0”，则不应包含授信额度信息段。 若“账户类型”为“D2”，不应包含授信额度信 息段。 若“账户类型”为“C1”，不应包含授信额度信 息段.', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('589', 'CLR015', 'RltRepymtInfSgmt', 'R4100116', '当“报送时点说明代码”为“49-其他报送日”时，对于不同的账户类型不应包含的信息段如下：若“账户类型”为“C1”，不应包含相关还款责任人段.', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('590', 'CLR015', 'MotgaCltalCtrctInfSgmt', 'R4100116', '当“报送时点说明代码”为“49-其他报送日”时， 对于不同的账户类型不应包含的信息段如下。 若“账户类型”为“D2”，不应包含抵质押物信 息段 若“账户类型”为“C1”，不应包含抵质押物信 息段', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('591', 'CLR016', 'RltRepymtInfSgmt', 'R4100117', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('592', 'CLR017', 'MotgaCltalCtrctInfSgmt', 'R4100118', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('593', 'CLR018', 'AcctBsSgmt', 'R4100119', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('594', 'CLR019', 'AcctType', 'R4101201', '待入库的企业借贷账户信息记录中的“账户类 型”必须与已入库的“账户类型”一致', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('595', 'CLR020', 'RptDate', 'R4101202', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('596', 'CLR021', 'RptDate', 'R4101203', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('597', 'CLR023', 'BalChgDate', 'R4101205', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('598', 'CLR024', 'FiveCateAdjDate', 'R4101206', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('599', 'CLR025', 'LatRpyDate', 'R4101207', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('600', 'CLR026', 'LatAgrrRpyDate', 'R4101208', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('601', 'CLR027', 'NxtAgrrRpyDate', 'R4101209', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('602', 'CLR028', '0000', 'R4101210', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('603', 'CLR029', 'AcctBal', 'R4101211', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('604', 'CLR030', 'AcctBsInfSgmt', 'R4101212', '首次上报时（即库中不存在该账户）：企业借贷账 户信息记录至少包含基本信息段；', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('605', 'CLR030', 'ActLbltyInfSgmt', 'R4101212', '首次上报时（即库中不存在该账户）： 若账户类型为“D1/ D2/ R1/R4/ C1”，则企业借贷 账户信息记录还应包含还款表现信息段，', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('606', 'CLR030', 'AcctCredSgmt', 'R4101212', '首次上报时（即库中不存在该账户）：若账户类型 为“D1”，基本信息段中“分次放款标志”为“1”或 “2”或者若账户类型为“R1/R4”，则企业借贷账户 信息记录还应包含授信额度信息段；', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('607', 'CLR031', 'OrigCreditorInfSgmt', 'R4101213', '首次上报时（即库中不存在该账户）：若账户类型为“D1/ D2/ R1/R4”,则企业借贷账户信息记录不应包含初始债权说明段。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('608', 'CLR031', 'AcctCredSgmt', 'R4101213', '首次上报时（即库中不存在该账户）：若账户类型 为“D1”，基本信息段中“分次放款标志”为“0”或者 账户类型为“C1/ D2”，则企业借贷账户信息记录 不应包含授信额度信息段。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('609', 'CLR031', 'MotgaCltalCtrctInfSgmt', 'R4101213', '首次上报时（即库中不存在该账户）：若账户类型 为“C1/ D2”，则企业借贷账户信息记录不应包含 抵质押物信息段。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('610', 'CLD000', '不符合 S 型出现约束的数据项标签', 'S4100101', '除 A 型数据项外，对于不同的账户类型 S 型数据 项出现约束见“企业借贷账户约束条件表”。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('611', 'CLE001', 'OpenDate', 'I4100C02', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('612', 'CLE002', 'RepayFreqcy', 'I4100C03', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('613', 'CLE003', 'RepayFreqcy', 'I4100C04', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('614', 'CLE004', 'RepayMode', 'I4100C05', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('615', 'CLE005', 'RepayMode', 'I4100C06', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('616', 'CLE006', 'ArlpAmt', 'I4100D01', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('617', 'CLE007', 'WartySign', 'I4100D02', '相关还款责任人段中“还款责任人类型”为“2- 保证人”时，“联保标志”必须不能为空值。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('618', 'CLE007', 'MaxGuarMcc', 'I4100D02', '相关还款责任人段中“还款责任人类型”为“2- 保证人”时，“保证合同编号”必须不能为空值。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('619', 'CLE008', '0000', 'I4100D03', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('620', 'CLE012', 'AcctBal', 'I4100H02', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('621', 'CLE013', 'CloseDate', 'I4100H03', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('622', 'CLE014', 'TotOverd', 'I4100H04', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('623', 'CLE015', 'TotOverd', 'I4100H05', '若“账户状态”为“21-关闭”时，“当前逾期总 额”必须为 0。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('624', 'CLE015', 'OverdPrinc', 'I4100H05', '若“账户状态”为“21-关闭”时，“当前逾期本 金”必须为 0。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('625', 'CLE015', 'OverdDy', 'I4100H05', '若“账户状态”为“21-关闭”时，“当前逾期天 数”必须为 0。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('626', 'CLE016', 'OverdPrinc', 'I4100H06', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('627', 'CLE017', 'LatRpyAmt', 'I4100H07', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('628', 'CLE018', 'OverdDy', 'I4100H08', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('629', 'CLE019', 'BalChgDate', 'I4100H09', '当“账户关闭日”不为空时，则必须不早于“余 额变化日期”。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('630', 'CLE019', 'LatRpyDate', 'I4100H09', '当“账户关闭日”不为空时，则必须不早于“最 近一次实际还款款日期”。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('631', 'CLE019', 'LatAgrrRpyDate', 'I4100H09', '当“账户关闭日”不为空时，则必须不早于“最 近一次约定还款日期”。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('632', 'CLE019', 'FiveCateAdjDate', 'I4100H09', '当“账户关闭日”不为空时，则必须不早于“五 级分类认定日期”。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('633', 'CLE020', 'NxtAgrrRpyDate', 'I4100H10', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('634', 'CLE021', 'BalChgDate', 'I4100H11', '当“下一次约定还款日期”不为空时，必须不早 于“余额变化日期”。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('635', 'CLE021', 'LatRpyDate', 'I4100H11', '当“下一次约定还款日期”不为空时，必须不早 于“最近一次实际还款款日期”。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('636', 'CLE021', 'LatAgrrRpyDate', 'I4100H11', '当“下一次约定还款日期”不为空时，必须不早 于“最近一次约定还款日期”。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('637', 'CLE021', 'FiveCateAdjDate', 'I4100H11', '当“下一次约定还款日期”不为空时，必须不早 于“五级分类认定日期”。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('638', 'CLE031', '0000', 'I4100H12', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('639', 'CLE022', 'DueTranMon', 'I4100I01', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('640', 'CLE023', 'CagOfTrdNm', 'I4100I02', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('641', 'CLE024', 'CloseDate', 'I4100A01', '企业借贷账户信息记录中的开户日期不晚于同一 条记录中的账户关闭日期', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('642', 'CLE024', 'BalChgDate', 'I4100A01', '企业借贷账户信息记录中的开户日期不晚于同一 条记录中的余额变化日期', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('643', 'CLE024', 'FiveCateAdjDate', 'I4100A01', '企业借贷账户信息记录中的开户日期不晚于同一 条记录中的五级分类认定日期', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('644', 'CLE024', 'LatRpyDate', 'I4100A01', '企业借贷账户信息记录中的开户日期不晚于同一 条记录中的最近一次实际还款日期', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('645', 'CLE024', 'LatAgrrRpyDate', 'I4100A01', '企业借贷账户信息记录中的开户日期不晚于同一 条记录中的最近一次约定还款日期', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('646', 'CLE024', 'NxtAgrrRpyDate', 'I4100A01', '企业借贷账户信息记录中的开户日期不晚于同一 条记录中的下一次约定还款日期', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('647', 'CLE024', 'TranDate', 'I4100A01', '企业借贷账户信息记录中的开户日期不晚于同一 条记录中的交易日期。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('648', 'CLE024', 'DueDate', 'I4100A01', '企业借贷账户信息记录中的开户日期不晚于同一 条记录中的到期日期。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('649', 'CLE025', 'BalChgDate', 'I4100A02', '账户信息记录中如果有“账户关闭日期”数据项， 则“账户关闭日期”必须不早于同一条记录中余 额变化日期', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('650', 'CLE025', 'FiveCateAdjDate', 'I4100A02', '账户信息记录中如果有“账户关闭日期”数据项， 则“账户关闭日期”必须不早于同一条记录中五 级分类认定日期', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('651', 'CLE025', 'LatRpyDate', 'I4100A02', '账户信息记录中如果有“账户关闭日期”数据项， 则“账户关闭日期”必须不早于同一条记录中最 近一次实际还款日期', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('652', 'CLE025', 'LatAgrrRpyDate', 'I4100A02', '账户信息记录中如果有“账户关闭日期”数据项， 则“账户关闭日期”必须不早于同一条记录中最 近一次约定还款日期', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('653', 'CLE025', 'NxtAgrrRpyDate', 'I4100A02', '账户信息记录中如果有“账户关闭日期”数据项， 则“账户关闭日期”必须不早于同一条记录中下 一次约定还款日期', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('654', 'CLE025', 'TranDate', 'I4100A02', '账户信息记录中如果有“账户关闭日期”数据项， 则“账户关闭日期”必须不早于同一条记录中交 易日期', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('655', 'CLE026', 'RptDate', 'I4100A03', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('656', 'CLE027', 'AcctBal', 'I4100A04', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('657', 'CLE028', 'TranAmt', 'I4100A05', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('658', 'CLE029', 'RepayMode', 'I4100A06', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('659', 'CLE030', '0000', 'I4100A07', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('660', 'CLE033', '0000', 'I4100A10', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('661', 'CIR000', '0000', 'I4110B01', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('662', 'CIR001', 'OdBnesCode', 'I4111B02', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('663', 'CIR002', 'NwBnesCode', 'I4111B03', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('666', 'CMR002', '0000', 'R4120103', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('667', 'CMR003', '待更正的段中不符合对应账户下 S 型规则的数据项的标 签', 'R4120104', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('668', 'CMR004', '0000', 'R4120105', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('669', 'CMR005', '0000', 'R4120106', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('671', 'CMR007', '0000', 'R4121204', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('672', 'CMR013', 'AcctType', 'R4121207', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('673', 'CMR014', '0000', 'R4121208', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('674', 'CMR015', '0000', 'R4121209', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('675', 'CMR016', '0000', 'R4121210', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('676', 'CMR006', '0000', 'R4121211', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('677', 'CMR019', '0000', 'R4121212', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('678', 'CMR008', '0000', 'R4121213', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('679', 'CMR009', '0000', 'R4121214', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('680', 'CMR010', '0000', 'R4121215', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('681', 'CMR017', '0000', 'R4121217', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('682', 'CMR018', '0000', 'R4121218', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('683', 'CTR000', 'DelRecCode', 'R4141201', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('684', 'CSR000', '0000', 'R4131201', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('685', 'CSE000', '0000', 'I4130B01', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('686', 'CSE001', 'DelStartDate', 'I4130B02', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('718', 'CAR000', 'GuarAcctBsInfSgmt', 'R4400101', '“报告时点说明代码”为“10-开户/首次上报” 时，至少应出现“基本信息段”。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('719', 'CAR000', 'GuarRltRepymtInfSgmt', 'R4400101', '“报告时点说明代码”为“10-开户/首次上报” 时，至少应出现“在保责任信息段”。', null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('720', 'CAR001', 'GuarRltRepymtInfSgmt', 'R4400102', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('721', 'CAR002', 'GuarRltRepymtInfSgmt', 'R4400103', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('722', 'CAR003', 'RltRepymtInfSgmt', 'R4400104', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('723', 'CAR004', 'GuarAcctBsSgmt', 'R4400105', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('724', 'CAR008', 'GuarRltRepymtInfSgmt', 'R4400106', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('725', 'CAR010', 'GuarRltRepymtI nfSgmt', 'R4400107', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('726', 'CAR005', 'FiveCateAdjDate', 'R4401201', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('727', 'CAR006', 'AcctStatus', 'R4401202', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('728', 'CAR007', 'AcctStatus', 'R4401203', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('729', 'CAR009', 'AcctType', 'R4401204', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('730', 'CAE000', 'OpenDate', 'I4400C01', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('731', 'CAE008', '0000', 'I4400C02', null, null);

insert into feed_back_report_code (FEED_BACK_REPORT_CODE_ID, FB_CODE, FB_TAG, MAP_RULE_CODE, MESSAGE, COMPANY)
values ('732', 'CAE001', 'CloseDate', 'I4400D01', null, null);


COMMIT;