/*
Navicat MySQL Data Transfer

Source Server         : 10.14.0.12
Source Server Version : 50733
Source Host           : 10.14.0.12:3306
Source Database       : pecr_hfdb

Target Server Type    : MYSQL
Target Server Version : 50733
File Encoding         : 65001

Date: 2024-02-18 20:12:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for data_check_result
-- ----------------------------
DROP TABLE IF EXISTS data_check_result;
CREATE TABLE data_check_result (
  CHECK_TASK_NAME varchar(100) NOT NULL COMMENT '校验任务名称',
  BELONG_SUBJECT varchar(20) NOT NULL COMMENT '所属主题',
  EXECUTE_RESULT varchar(10) NOT NULL COMMENT '执行结果',
  START_TIME varchar(30) NOT NULL COMMENT '开始时间',
  SPEND_TIME varchar(10) NOT NULL COMMENT '耗时',
  RESULT_STATISTIC text NOT NULL COMMENT '执行结果统计',
  COMPANY varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据校验结果表';

-- ----------------------------
-- Table structure for data_permissions_scope
-- ----------------------------
DROP TABLE IF EXISTS data_permissions_scope;
CREATE TABLE data_permissions_scope (
  DATA_PERMISSIONS_SCOPE_ID varchar(36) NOT NULL COMMENT '主键ID',
  DATA_PERMISSIONS_TYPE_ID varchar(36) NOT NULL,
  DATA_VALUE varchar(100) NOT NULL COMMENT '值',
  COMPANY varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据类型范围值（每一个类型的值得范围）';

-- ----------------------------
-- Table structure for data_permissions_type
-- ----------------------------
DROP TABLE IF EXISTS data_permissions_type;
CREATE TABLE data_permissions_type (
  DATA_PERMISSIONS_TYPE_ID varchar(36) NOT NULL COMMENT '主键ID',
  TYPE_NAME varchar(100) NOT NULL COMMENT '类型名称',
  TABLE_NAME varchar(100) DEFAULT NULL COMMENT '表名',
  TABLE_FIELD varchar(100) DEFAULT NULL COMMENT '字段名',
  DESCRIPTION varchar(255) DEFAULT NULL COMMENT '描述信息',
  IS_ENABLE char(1) NOT NULL COMMENT '启用Y禁用N',
  COMPANY varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据权限类型表';

-- ----------------------------
-- Table structure for etl_error_log
-- ----------------------------
DROP TABLE IF EXISTS etl_error_log;
CREATE TABLE etl_error_log (
  DATA_DATE varchar(20) DEFAULT NULL COMMENT '数据运行结束时间',
  STEP varchar(4) DEFAULT NULL COMMENT '错误步骤',
  ERROR_MSG varchar(2000) DEFAULT NULL COMMENT '错误日志信息',
  PROC_NAME varchar(50) DEFAULT NULL COMMENT '存储过程名称',
  P_O_RESULT varchar(20) DEFAULT NULL COMMENT '运行结果'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='存储过程错误日志信息';

-- ----------------------------
-- Table structure for etl_success_log
-- ----------------------------
DROP TABLE IF EXISTS etl_success_log;
CREATE TABLE etl_success_log (
  PROC_NAME varchar(50) DEFAULT NULL COMMENT '存储过程名字',
  START_TIME varchar(100) DEFAULT NULL COMMENT '运行开始时间',
  END_TIME varchar(100) DEFAULT NULL COMMENT '运行结束时间',
  P_O_RESULT varchar(20) DEFAULT NULL COMMENT '运行结果',
  V_RUN_DATE varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='存储过程运行成功日志';

-- ----------------------------
-- Table structure for feed_back_report_code
-- ----------------------------
DROP TABLE IF EXISTS feed_back_report_code;
CREATE TABLE feed_back_report_code (
  FEED_BACK_REPORT_CODE_ID char(32) NOT NULL,
  FB_CODE varchar(100) DEFAULT NULL COMMENT '反馈代码',
  FB_TAG varchar(100) DEFAULT NULL COMMENT '反馈标签',
  MAP_RULE_CODE varchar(100) DEFAULT NULL COMMENT '映射规则代码',
  MESSAGE text COMMENT '描述信息',
  COMPANY varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='反馈报文状态信息表';

-- ----------------------------
-- Table structure for feed_back_report_err_message
-- ----------------------------
DROP TABLE IF EXISTS feed_back_report_err_message;
CREATE TABLE feed_back_report_err_message (
  FEED_BACK_REPORT_ERROR_MESS_ID char(32) NOT NULL,
  FEED_BACK_REPORT_CODE_ID varchar(50) DEFAULT NULL COMMENT '反馈报文错误码主键',
  ERROR_MESSAGE text COMMENT '错误信息',
  RECORD_ID char(32) DEFAULT NULL COMMENT '记录ID',
  REPORT_MESSAGE_ID varchar(60) DEFAULT NULL COMMENT '报文文件ID',
  REPORT_MESSAGE_TYPE varchar(10) DEFAULT NULL COMMENT '记录类型',
  CREATE_TIME varchar(10) DEFAULT NULL COMMENT '创建时间',
  REPORT_MESSAGE_NAME varchar(100) DEFAULT NULL COMMENT '报文名称',
  FEED_BACK_REPORT_NAME varchar(255) DEFAULT NULL COMMENT '反馈报文名称',
  FB_CODE varchar(255) DEFAULT NULL COMMENT '反馈代码',
  FB_TAG varchar(255) DEFAULT NULL COMMENT '反馈标签',
  COMPANY varchar(20) DEFAULT NULL COMMENT '法人',
  RECORDBSID varchar(7) DEFAULT NULL COMMENT '记录错误数据在报文文件中的行数，与对应基础表中的数据记录对应。',
  IS_CHECK varchar(1) DEFAULT NULL COMMENT '1：人行反馈错误报文；0：本地校验程序的.bad文件。',
  IS_EDIT varchar(1) DEFAULT NULL COMMENT '1：已补录且检验成功；0：待补录。'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='反馈报文错误信息表';

-- ----------------------------
-- Table structure for i_acct_bs
-- ----------------------------
DROP TABLE IF EXISTS i_acct_bs;
CREATE TABLE i_acct_bs (
  PBA_ACCT_BS_SGMT_ID char(32) NOT NULL COMMENT '主键',
  INF_REC_TYPE varchar(3) DEFAULT NULL COMMENT '信息记录类型',
  ACCT_TYPE varchar(2) DEFAULT NULL COMMENT '账户类型',
  ACCT_CODE varchar(60) DEFAULT NULL COMMENT '账户标识码',
  RPT_DATE varchar(10) DEFAULT NULL COMMENT '信息报告日期',
  RPT_DATE_CODE varchar(2) DEFAULT NULL COMMENT '报告时点说明代码',
  NAME varchar(30) DEFAULT NULL COMMENT '借款人姓名',
  ID_TYPE varchar(2) DEFAULT NULL COMMENT '借款人证件类型',
  ID_NUM varchar(20) DEFAULT NULL COMMENT '借款人证件号码',
  MNGMT_ORG_CODE varchar(14) DEFAULT NULL COMMENT '业务管理机构代码',
  LAST_UPDATE_TIME varchar(10) DEFAULT NULL COMMENT '最后更新时间',
  OPERATOR_USER varchar(50) DEFAULT NULL COMMENT '操作员',
  ORG_NAME varchar(100) DEFAULT NULL COMMENT '数据来源机构名称',
  ORG_CODE varchar(100) DEFAULT NULL COMMENT '数据来源机构编号',
  BUSINESS_STATES varchar(50) DEFAULT NULL COMMENT '数据状态',
  REJECT_REASON varchar(255) DEFAULT NULL COMMENT '驳回原因',
  IS_FILTER char(1) DEFAULT NULL COMMENT '是否过滤标识(默认为N-不过滤)',
  REPORT_MESSAGE_ID varchar(60) DEFAULT NULL COMMENT '报文文件ID',
  MDFC_SGMT_CODE char(1) DEFAULT NULL COMMENT '待更正段段标',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  REPORT_FILE_COLNUM varchar(7) DEFAULT NULL COMMENT '在报文文件中的行数',
  RPT_FLAG varchar(1) DEFAULT NULL COMMENT '1:t+1;2:t+2',
  CUST_NUM varchar(60) DEFAULT NULL COMMENT '客户号',
  ACCT_NUM varchar(60) DEFAULT NULL COMMENT '账户号',
  DATA_DATE varchar(20) DEFAULT NULL COMMENT '数据日期',
  DATA_SOURCE varchar(100) DEFAULT NULL COMMENT '数据来源',
  KEY INDEX_I_ACCT_BUSINESS (ACCT_CODE,ACCT_TYPE) USING BTREE,
  KEY INDEX_I_ACCT_NORMAL (REPORT_MESSAGE_ID,BUSINESS_STATES) USING BTREE,
  KEY INDEX_PBA_ACCT_BS (PBA_ACCT_BS_SGMT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='210-个人借贷账户信息记录基础段';

-- ----------------------------
-- Table structure for i_acct_bs_hist
-- ----------------------------
DROP TABLE IF EXISTS i_acct_bs_hist;
CREATE TABLE i_acct_bs_hist (
  PBA_ACCT_BS_SGMT_ID char(32) NOT NULL COMMENT '主键',
  INF_REC_TYPE varchar(3) DEFAULT NULL COMMENT '信息记录类型',
  ACCT_TYPE varchar(2) DEFAULT NULL COMMENT '账户类型',
  ACCT_CODE varchar(60) DEFAULT NULL COMMENT '账户标识码',
  RPT_DATE varchar(10) DEFAULT NULL COMMENT '信息报告日期',
  RPT_DATE_CODE varchar(2) DEFAULT NULL COMMENT '报告时点说明代码',
  NAME varchar(30) DEFAULT NULL COMMENT '借款人姓名',
  ID_TYPE varchar(2) DEFAULT NULL COMMENT '借款人证件类型',
  ID_NUM varchar(20) DEFAULT NULL COMMENT '借款人证件号码',
  MNGMT_ORG_CODE varchar(14) DEFAULT NULL COMMENT '业务管理机构代码',
  LAST_UPDATE_TIME varchar(10) DEFAULT NULL COMMENT '最后更新时间',
  OPERATOR_USER varchar(50) DEFAULT NULL COMMENT '操作员',
  ORG_NAME varchar(100) DEFAULT NULL COMMENT '数据来源机构名称',
  ORG_CODE varchar(100) DEFAULT NULL COMMENT '数据来源机构编号',
  BUSINESS_STATES varchar(50) DEFAULT NULL COMMENT '数据状态',
  REJECT_REASON varchar(255) DEFAULT NULL COMMENT '驳回原因',
  IS_FILTER char(1) DEFAULT NULL COMMENT '是否过滤标识(默认为N-不过滤)',
  REPORT_MESSAGE_ID varchar(60) DEFAULT NULL COMMENT '报文文件ID',
  MDFC_SGMT_CODE char(1) DEFAULT NULL COMMENT '待更正段段标',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  REPORT_FILE_COLNUM varchar(7) DEFAULT NULL COMMENT '在报文文件中的行数',
  RPT_FLAG varchar(1) DEFAULT NULL COMMENT '1:t+1;2:t+2',
  CUST_NUM varchar(60) DEFAULT NULL COMMENT '客户号',
  ACCT_NUM varchar(60) DEFAULT NULL COMMENT '账户号',
  DATA_DATE varchar(20) DEFAULT NULL COMMENT '数据日期',
  DATA_SOURCE varchar(100) DEFAULT NULL COMMENT '数据来源',
  KEY INDEX_I_ACCT_BUSINESS_HIST (ACCT_CODE,ACCT_TYPE) USING BTREE,
  KEY INDEX_I_ACCT_NORMAL_HIST (REPORT_MESSAGE_ID,BUSINESS_STATES) USING BTREE,
  KEY INDEX_PBA_ACCT_BS_HIST (PBA_ACCT_BS_SGMT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='210-个人借贷账户信息记录基础段';

-- ----------------------------
-- Table structure for i_acct_bs_inf
-- ----------------------------
DROP TABLE IF EXISTS i_acct_bs_inf;
CREATE TABLE i_acct_bs_inf (
  PBB_ACCT_BS_INF_SGMT_ID char(32) NOT NULL COMMENT '主键',
  BUSI_LINES varchar(1) DEFAULT NULL COMMENT '借贷业务大类',
  BUSI_DTL_LINES varchar(2) DEFAULT NULL COMMENT '借贷业务种类细分',
  OPEN_DATE varchar(10) DEFAULT NULL COMMENT '开户日期',
  CY varchar(3) DEFAULT NULL COMMENT '币种',
  ACCT_CRED_LINE varchar(15) DEFAULT NULL COMMENT '信用额度',
  LOAN_AMT varchar(15) DEFAULT NULL COMMENT '借款金额',
  FLAG varchar(1) DEFAULT NULL COMMENT '分次放款标志',
  DUE_DATE varchar(10) DEFAULT NULL COMMENT '到期日期',
  REPAY_MODE varchar(2) DEFAULT NULL COMMENT '还款方式',
  REPAY_FREQCY varchar(2) DEFAULT NULL COMMENT '还款频率',
  REPAY_PRD varchar(15) DEFAULT NULL COMMENT '还款期数',
  APPLY_BUSI_DIST varchar(6) DEFAULT NULL COMMENT '业务申请地行政区划代码',
  GUAR_MODE varchar(1) DEFAULT NULL COMMENT '担保方式',
  OTH_REPY_GUAR_WAY varchar(1) DEFAULT NULL COMMENT '其他还款保证方式',
  ASSET_TRAND_FLAG varchar(1) DEFAULT NULL COMMENT '资产转让标志',
  FUND_SOU varchar(2) DEFAULT NULL COMMENT '业务经营类型',
  LOAN_FORM varchar(1) DEFAULT NULL COMMENT '贷款发放形式',
  CREDIT_ID varchar(4) DEFAULT NULL COMMENT '卡片标识号',
  PBA_ACCT_BS_SGMT_ID char(32) DEFAULT NULL COMMENT '数据外键',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  LOAN_CON_CODE text COMMENT '贷款合同编号',
  FIRST_HOU_LOAN_FLAG varchar(2) DEFAULT NULL COMMENT '受否为首套住房贷款',
  RPT_FLAG varchar(1) DEFAULT NULL COMMENT '1:t+1;2:t+2',
  CUST_NUM varchar(60) DEFAULT NULL COMMENT '客户号',
  ACCT_NUM varchar(60) DEFAULT NULL COMMENT '账户号',
  DATA_DATE varchar(20) DEFAULT NULL COMMENT '数据日期',
  KEY INDEX_PBA_ACCT_INF (PBA_ACCT_BS_SGMT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='210-个人借贷账户信息记录基本信息段';

-- ----------------------------
-- Table structure for i_acct_bs_inf_hist
-- ----------------------------
DROP TABLE IF EXISTS i_acct_bs_inf_hist;
CREATE TABLE i_acct_bs_inf_hist (
  PBB_ACCT_BS_INF_SGMT_ID char(32) NOT NULL COMMENT '主键',
  BUSI_LINES varchar(1) DEFAULT NULL COMMENT '借贷业务大类',
  BUSI_DTL_LINES varchar(2) DEFAULT NULL COMMENT '借贷业务种类细分',
  OPEN_DATE varchar(10) DEFAULT NULL COMMENT '开户日期',
  CY varchar(3) DEFAULT NULL COMMENT '币种',
  ACCT_CRED_LINE varchar(15) DEFAULT NULL COMMENT '信用额度',
  LOAN_AMT varchar(15) DEFAULT NULL COMMENT '借款金额',
  FLAG varchar(1) DEFAULT NULL COMMENT '分次放款标志',
  DUE_DATE varchar(10) DEFAULT NULL COMMENT '到期日期',
  REPAY_MODE varchar(2) DEFAULT NULL COMMENT '还款方式',
  REPAY_FREQCY varchar(2) DEFAULT NULL COMMENT '还款频率',
  REPAY_PRD varchar(15) DEFAULT NULL COMMENT '还款期数',
  APPLY_BUSI_DIST varchar(6) DEFAULT NULL COMMENT '业务申请地行政区划代码',
  GUAR_MODE varchar(1) DEFAULT NULL COMMENT '担保方式',
  OTH_REPY_GUAR_WAY varchar(1) DEFAULT NULL COMMENT '其他还款保证方式',
  ASSET_TRAND_FLAG varchar(1) DEFAULT NULL COMMENT '资产转让标志',
  FUND_SOU varchar(2) DEFAULT NULL COMMENT '业务经营类型',
  LOAN_FORM varchar(1) DEFAULT NULL COMMENT '贷款发放形式',
  CREDIT_ID varchar(4) DEFAULT NULL COMMENT '卡片标识号',
  PBA_ACCT_BS_SGMT_ID char(32) NOT NULL COMMENT '数据外键',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  LOAN_CON_CODE text COMMENT '贷款合同编号',
  FIRST_HOU_LOAN_FLAG varchar(2) DEFAULT NULL COMMENT '受否为首套住房贷款',
  RPT_FLAG varchar(1) DEFAULT NULL COMMENT '1:t+1;2:t+2',
  CUST_NUM varchar(60) DEFAULT NULL COMMENT '客户号',
  ACCT_NUM varchar(60) DEFAULT NULL COMMENT '账户号',
  DATA_DATE varchar(20) DEFAULT NULL COMMENT '数据日期',
  KEY INDEX_PBA_ACCT_INF_HIST (PBA_ACCT_BS_SGMT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='210-个人借贷账户信息记录基本信息段';

-- ----------------------------
-- Table structure for i_acct_bs_middle
-- ----------------------------
DROP TABLE IF EXISTS i_acct_bs_middle;
CREATE TABLE i_acct_bs_middle (
  ACCT_TYPE varchar(36) NOT NULL COMMENT '账户类型',
  ACCT_CODE varchar(60) NOT NULL COMMENT '账户标识码',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='210-个人借贷账户信息记录基础段中间表';

-- ----------------------------
-- Table structure for i_acct_cred
-- ----------------------------
DROP TABLE IF EXISTS i_acct_cred;
CREATE TABLE i_acct_cred (
  PBE_ACCT_CRED_SGMT_ID char(32) DEFAULT NULL COMMENT '主键',
  MCC varchar(60) DEFAULT NULL COMMENT '授信协议标识码',
  PBA_ACCT_BS_SGMT_ID char(32) DEFAULT NULL COMMENT '数据外键',
  RPT_DATE varchar(10) DEFAULT NULL COMMENT '报送日期',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  RPT_FLAG varchar(1) DEFAULT NULL COMMENT '1:t+1;2:t+2',
  CUST_NUM varchar(60) DEFAULT NULL COMMENT '客户号',
  ACCT_NUM varchar(60) DEFAULT NULL COMMENT '账户号',
  DATA_DATE varchar(20) DEFAULT NULL COMMENT '数据日期',
  KEY INDEX_PBA_ACCT_CRED (PBA_ACCT_BS_SGMT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='210-个人借贷账户信息记录授信额度信息段';

-- ----------------------------
-- Table structure for i_acct_cred_hist
-- ----------------------------
DROP TABLE IF EXISTS i_acct_cred_hist;
CREATE TABLE i_acct_cred_hist (
  PBE_ACCT_CRED_SGMT_ID char(32) NOT NULL COMMENT '主键',
  MCC varchar(60) DEFAULT NULL COMMENT '授信协议标识码',
  PBA_ACCT_BS_SGMT_ID char(32) NOT NULL COMMENT '数据外键',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  RPT_FLAG varchar(1) DEFAULT NULL COMMENT '1:t+1;2:t+2',
  CUST_NUM varchar(60) DEFAULT NULL COMMENT '客户号',
  ACCT_NUM varchar(60) DEFAULT NULL COMMENT '账户号',
  DATA_DATE varchar(20) DEFAULT NULL COMMENT '数据日期',
  KEY INDEX_PBA_ACCT_CRED_HIST (PBA_ACCT_BS_SGMT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='210-个人借贷账户信息记录授信额度信息段';

-- ----------------------------
-- Table structure for i_acct_dbt_inf
-- ----------------------------
DROP TABLE IF EXISTS i_acct_dbt_inf;
CREATE TABLE i_acct_dbt_inf (
  PBI_ACCT_DBT_INF_SGMT_ID char(32) NOT NULL COMMENT '主键',
  NOMONTH_ACCT_STATUS varchar(2) DEFAULT NULL COMMENT '账户状态',
  NOMONTH_ACCT_BAL varchar(15) DEFAULT NULL COMMENT '余额',
  NOMONTH_FIVE_CATE varchar(1) DEFAULT NULL COMMENT '五级分类',
  NOMONTH_FIVE_CATE_ADJ_DATE varchar(10) DEFAULT NULL COMMENT '五级分类认定日期',
  NOMONTH_REM_REP_PRD varchar(15) DEFAULT NULL COMMENT '剩余还款期数',
  NOMONTH_RPY_STATUS varchar(1) DEFAULT NULL COMMENT '当前还款状态',
  NOMONTH_OVERD_PRD varchar(15) DEFAULT NULL COMMENT '当前逾期期数',
  NOMONTH_TOT_OVERD varchar(15) DEFAULT NULL COMMENT '当前逾期总额',
  NOMONTH_LAT_RPY_AMT varchar(15) DEFAULT NULL COMMENT '最近一次实际还款金额',
  NOMONTH_LAT_RPY_DATE varchar(10) DEFAULT NULL COMMENT '最近一次实际还款日期',
  NOMONTH_CLOSE_DATE varchar(10) DEFAULT NULL COMMENT '账户关闭日期',
  PBA_ACCT_BS_SGMT_ID char(32) DEFAULT NULL COMMENT '数据外键',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  RPT_FLAG varchar(1) DEFAULT NULL COMMENT '1:t+1;2:t+2',
  CUST_NUM varchar(60) DEFAULT NULL COMMENT '客户号',
  ACCT_NUM varchar(60) DEFAULT NULL COMMENT '账户号',
  DATA_DATE varchar(20) DEFAULT NULL COMMENT '数据日期',
  KEY INDEX_PBA_ACCT_DBT (PBA_ACCT_BS_SGMT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='210-个人借贷账户信息记录非月度表现信息段';

-- ----------------------------
-- Table structure for i_acct_dbt_inf_hist
-- ----------------------------
DROP TABLE IF EXISTS i_acct_dbt_inf_hist;
CREATE TABLE i_acct_dbt_inf_hist (
  PBI_ACCT_DBT_INF_SGMT_ID char(32) NOT NULL COMMENT '主键',
  NOMONTH_ACCT_STATUS varchar(2) DEFAULT NULL COMMENT '账户状态',
  NOMONTH_ACCT_BAL varchar(15) DEFAULT NULL COMMENT '余额',
  NOMONTH_FIVE_CATE varchar(1) DEFAULT NULL COMMENT '五级分类',
  NOMONTH_FIVE_CATE_ADJ_DATE varchar(10) DEFAULT NULL COMMENT '五级分类认定日期',
  NOMONTH_REM_REP_PRD varchar(15) DEFAULT NULL COMMENT '剩余还款期数',
  NOMONTH_RPY_STATUS varchar(1) DEFAULT NULL COMMENT '当前还款状态',
  NOMONTH_OVERD_PRD varchar(15) DEFAULT NULL COMMENT '当前逾期期数',
  NOMONTH_TOT_OVERD varchar(15) DEFAULT NULL COMMENT '当前逾期总额',
  NOMONTH_LAT_RPY_AMT varchar(15) DEFAULT NULL COMMENT '最近一次实际还款金额',
  NOMONTH_LAT_RPY_DATE varchar(10) DEFAULT NULL COMMENT '最近一次实际还款日期',
  NOMONTH_CLOSE_DATE varchar(10) DEFAULT NULL COMMENT '账户关闭日期',
  PBA_ACCT_BS_SGMT_ID char(32) NOT NULL COMMENT '数据外键',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  RPT_FLAG varchar(1) DEFAULT NULL COMMENT '1:t+1;2:t+2',
  CUST_NUM varchar(60) DEFAULT NULL COMMENT '客户号',
  ACCT_NUM varchar(60) DEFAULT NULL COMMENT '账户号',
  DATA_DATE varchar(20) DEFAULT NULL COMMENT '数据日期',
  KEY INDEX_PBA_ACCT_DBT_HIST (PBA_ACCT_BS_SGMT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='210-个人借贷账户信息记录非月度表现信息段';

-- ----------------------------
-- Table structure for i_amblg_inf
-- ----------------------------
DROP TABLE IF EXISTS i_amblg_inf;
CREATE TABLE i_amblg_inf (
  PBG_AMBLG_INF_SGMT_ID char(32) NOT NULL COMMENT '主键',
  MONTH varchar(7) DEFAULT NULL COMMENT '月份',
  SETT_DATE varchar(10) DEFAULT NULL COMMENT '结算/应还款日',
  ACCT_STATUS varchar(2) DEFAULT NULL COMMENT '账户状态',
  ACCT_BAL varchar(15) DEFAULT NULL COMMENT '余额',
  PRID_ACCT_BAL varchar(15) DEFAULT NULL COMMENT '本期账单余额',
  USED_AMT varchar(15) DEFAULT NULL COMMENT '已使用额度',
  NOT_ISU_BAL varchar(15) DEFAULT NULL COMMENT '未出单的大额专项分期余额',
  REM_REP_PRD varchar(15) DEFAULT NULL COMMENT '剩余还款期数',
  FIVE_CATE varchar(1) DEFAULT NULL COMMENT '五级分类',
  FIVE_CATE_ADJ_DATE varchar(10) DEFAULT NULL COMMENT '五级分类认定日期',
  RPY_STATUS varchar(1) DEFAULT NULL COMMENT '当前还款状态',
  RPY_PRCT varchar(15) DEFAULT NULL COMMENT '实际还款百分比',
  OVERD_PRD varchar(15) DEFAULT NULL COMMENT '当前逾期期数',
  TOT_OVERD varchar(15) DEFAULT NULL COMMENT '当前逾期总额',
  OVERD_PRINC varchar(15) DEFAULT NULL COMMENT '当前逾期本金',
  OVED31_60_PRINC varchar(15) DEFAULT NULL COMMENT '逾期31-60天未归还本金',
  OVED61_90_PRINC varchar(15) DEFAULT NULL COMMENT '逾期61-90天未归还本金',
  OVED91_180_PRINC varchar(15) DEFAULT NULL COMMENT '逾期91-180天未归还本金',
  OVED_PRINC180 varchar(15) DEFAULT NULL COMMENT '逾期180天以上未归还本金',
  OVEDRAW_BA_OVE180 varchar(15) DEFAULT NULL COMMENT '透支180天以上未还余额',
  CUR_RPY_AMT varchar(15) DEFAULT NULL COMMENT '本月应还款金额',
  ACT_RPY_AMT varchar(15) DEFAULT NULL COMMENT '本月实际还款金额',
  LAT_RPY_DATE varchar(10) DEFAULT NULL COMMENT '最近一次实际还款日期',
  CLOSE_DATE varchar(10) DEFAULT NULL COMMENT '账户关闭日期',
  PBA_ACCT_BS_SGMT_ID char(32) NOT NULL COMMENT '数据外键',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  RPT_FLAG varchar(1) DEFAULT NULL COMMENT '1:t+1;2:t+2',
  CUST_NUM varchar(60) DEFAULT NULL COMMENT '客户号',
  ACCT_NUM varchar(60) DEFAULT NULL COMMENT '账户号',
  DATA_DATE varchar(20) DEFAULT NULL COMMENT '数据日期',
  KEY INDEX_PBA_ACCT_AMBLG (PBA_ACCT_BS_SGMT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='210-个人借贷账户信息记录月度表现信息段';

-- ----------------------------
-- Table structure for i_amblg_inf_hist
-- ----------------------------
DROP TABLE IF EXISTS i_amblg_inf_hist;
CREATE TABLE i_amblg_inf_hist (
  PBG_AMBLG_INF_SGMT_ID char(32) NOT NULL COMMENT '主键',
  MONTH varchar(7) DEFAULT NULL COMMENT '月份',
  SETT_DATE varchar(10) DEFAULT NULL COMMENT '结算/应还款日',
  ACCT_STATUS varchar(2) DEFAULT NULL COMMENT '账户状态',
  ACCT_BAL varchar(15) DEFAULT NULL COMMENT '余额',
  PRID_ACCT_BAL varchar(15) DEFAULT NULL COMMENT '本期账单余额',
  USED_AMT varchar(15) DEFAULT NULL COMMENT '已使用额度',
  NOT_ISU_BAL varchar(15) DEFAULT NULL COMMENT '未出单的大额专项分期余额',
  REM_REP_PRD varchar(15) DEFAULT NULL COMMENT '剩余还款期数',
  FIVE_CATE varchar(1) DEFAULT NULL COMMENT '五级分类',
  FIVE_CATE_ADJ_DATE varchar(10) DEFAULT NULL COMMENT '五级分类认定日期',
  RPY_STATUS varchar(1) DEFAULT NULL COMMENT '当前还款状态',
  RPY_PRCT varchar(15) DEFAULT NULL COMMENT '实际还款百分比',
  OVERD_PRD varchar(15) DEFAULT NULL COMMENT '当前逾期期数',
  TOT_OVERD varchar(15) DEFAULT NULL COMMENT '当前逾期总额',
  OVERD_PRINC varchar(15) DEFAULT NULL COMMENT '当前逾期本金',
  OVED31_60_PRINC varchar(15) DEFAULT NULL COMMENT '逾期31-60天未归还本金',
  OVED61_90_PRINC varchar(15) DEFAULT NULL COMMENT '逾期61-90天未归还本金',
  OVED91_180_PRINC varchar(15) DEFAULT NULL COMMENT '逾期91-180天未归还本金',
  OVED_PRINC180 varchar(15) DEFAULT NULL COMMENT '逾期180天以上未归还本金',
  OVEDRAW_BA_OVE180 varchar(15) DEFAULT NULL COMMENT '透支180天以上未还余额',
  CUR_RPY_AMT varchar(15) DEFAULT NULL COMMENT '本月应还款金额',
  ACT_RPY_AMT varchar(15) DEFAULT NULL COMMENT '本月实际还款金额',
  LAT_RPY_DATE varchar(10) DEFAULT NULL COMMENT '最近一次实际还款日期',
  CLOSE_DATE varchar(10) DEFAULT NULL COMMENT '账户关闭日期',
  PBA_ACCT_BS_SGMT_ID char(32) NOT NULL COMMENT '数据外键',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  RPT_FLAG varchar(1) DEFAULT NULL COMMENT '1:t+1;2:t+2',
  CUST_NUM varchar(60) DEFAULT NULL COMMENT '客户号',
  ACCT_NUM varchar(60) DEFAULT NULL COMMENT '账户号',
  DATA_DATE varchar(20) DEFAULT NULL COMMENT '数据日期',
  KEY INDEX_PBA_ACCT_AMBLG_HIST (PBA_ACCT_BS_SGMT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='210-个人借贷账户信息记录月度表现信息段';

-- ----------------------------
-- Table structure for i_amblg_inf_list
-- ----------------------------
DROP TABLE IF EXISTS i_amblg_inf_list;
CREATE TABLE i_amblg_inf_list (
  ACCT_CODE varchar(60) DEFAULT NULL COMMENT '账户标识码',
  MONTH varchar(7) DEFAULT NULL COMMENT '月份',
  STATUS varchar(1) DEFAULT NULL COMMENT '数据状态：0:-未处理；1-已处理',
  COMPANY varchar(20) DEFAULT NULL COMMENT '法人',
  INS_TIME varchar(20) DEFAULT NULL COMMENT '插入时间',
  KEY INDEX_I_AMBLG_INF_LIST (COMPANY,STATUS) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='个人借贷账户月度表现段批量导入信息';

-- ----------------------------
-- Table structure for i_as_trst_dspn
-- ----------------------------
DROP TABLE IF EXISTS i_as_trst_dspn;
CREATE TABLE i_as_trst_dspn (
  PBJ_AS_TRST_DSPN_SGMT_ID char(32) NOT NULL COMMENT '主键',
  CHAN_TRAN_TYPE varchar(2) DEFAULT NULL COMMENT '交易类型',
  TRAN_DATE varchar(10) DEFAULT NULL COMMENT '交易日期',
  TRAN_AMT varchar(15) DEFAULT NULL COMMENT '交易金额',
  DUE_TRAN_MON varchar(15) DEFAULT NULL COMMENT '到期日期变更月数',
  DET_INFO varchar(200) DEFAULT NULL COMMENT '交易明细信息',
  PBA_ACCT_BS_SGMT_ID char(32) NOT NULL COMMENT '数据外键',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  RPT_FLAG varchar(1) DEFAULT NULL COMMENT '1:t+1;2:t+2',
  CUST_NUM varchar(60) DEFAULT NULL COMMENT '客户号',
  ACCT_NUM varchar(60) DEFAULT NULL COMMENT '账户号',
  DATA_DATE varchar(20) DEFAULT NULL COMMENT '数据日期',
  KEY INDEX_PBA_ACCT_AS (PBA_ACCT_BS_SGMT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='210-个人借贷账户信息记录特殊交易说明段';

-- ----------------------------
-- Table structure for i_as_trst_dspn_hist
-- ----------------------------
DROP TABLE IF EXISTS i_as_trst_dspn_hist;
CREATE TABLE i_as_trst_dspn_hist (
  PBJ_AS_TRST_DSPN_SGMT_ID char(32) NOT NULL COMMENT '主键',
  CHAN_TRAN_TYPE varchar(2) DEFAULT NULL COMMENT '交易类型',
  TRAN_DATE varchar(10) DEFAULT NULL COMMENT '交易日期',
  TRAN_AMT varchar(15) DEFAULT NULL COMMENT '交易金额',
  DUE_TRAN_MON varchar(15) DEFAULT NULL COMMENT '到期日期变更月数',
  DET_INFO varchar(200) DEFAULT NULL COMMENT '交易明细信息',
  PBA_ACCT_BS_SGMT_ID char(32) NOT NULL COMMENT '数据外键',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  RPT_FLAG varchar(1) DEFAULT NULL COMMENT '1:t+1;2:t+2',
  CUST_NUM varchar(60) DEFAULT NULL COMMENT '客户号',
  ACCT_NUM varchar(60) DEFAULT NULL COMMENT '账户号',
  DATA_DATE varchar(20) DEFAULT NULL COMMENT '数据日期',
  KEY INDEX_PBA_ACCT_AS_HIST (PBA_ACCT_BS_SGMT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='210-个人借贷账户信息记录特殊交易说明段';

-- ----------------------------
-- Table structure for i_bs
-- ----------------------------
DROP TABLE IF EXISTS i_bs;
CREATE TABLE i_bs (
  PAA_BS_SGMT_ID char(32) NOT NULL COMMENT '主键',
  INF_REC_TYPE varchar(3) DEFAULT NULL COMMENT '信息记录类型',
  NAME varchar(30) DEFAULT NULL COMMENT '姓名',
  ID_TYPE varchar(2) DEFAULT NULL COMMENT '证件类型',
  ID_NUM varchar(20) DEFAULT NULL COMMENT '证件号码',
  INF_SURC_CODE varchar(20) DEFAULT NULL COMMENT '信息来源编码',
  RPT_DATE char(10) DEFAULT NULL COMMENT '信息报告日期',
  RPT_DATE_CODE varchar(2) DEFAULT NULL COMMENT '报告时点说明代码',
  CIMOC varchar(14) DEFAULT NULL COMMENT '客户资料维护机构代码',
  CUSTOMER_TYPE varchar(2) DEFAULT NULL COMMENT '客户资料类型',
  LAST_UPDATE_TIME varchar(10) DEFAULT NULL COMMENT '最后更新时间',
  OPERATOR_USER varchar(50) DEFAULT NULL COMMENT '操作员',
  ORG_NAME varchar(100) DEFAULT NULL COMMENT '数据来源机构名称',
  ORG_CODE varchar(100) DEFAULT NULL COMMENT '数据来源机构编号',
  BUSINESS_STATES varchar(50) DEFAULT NULL COMMENT '数据状态',
  REJECT_REASON varchar(255) DEFAULT NULL COMMENT '驳回原因',
  IS_FILTER char(1) DEFAULT NULL COMMENT '是否过滤标识(默认为N-不过滤)',
  REPORT_MESSAGE_ID varchar(60) DEFAULT NULL COMMENT '报文文件ID',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  REPORT_FILE_COLNUM varchar(7) DEFAULT NULL COMMENT '在报文文件中的行数',
  CUST_NUM varchar(60) DEFAULT NULL COMMENT '客户号',
  DATA_DATE varchar(20) DEFAULT NULL COMMENT '数据日期',
  DATA_SOURCE varchar(100) DEFAULT NULL COMMENT '数据来源',
  UNIQUE KEY INDEX_PAA_BS_SGMT_ID (PAA_BS_SGMT_ID) USING BTREE,
  KEY INDEX_I_BS_BUSINESS_ID (ID_TYPE,ID_NUM) USING BTREE,
  KEY INDEX_I_BS_NORMAL (REPORT_MESSAGE_ID,BUSINESS_STATES) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='110-个人基本信息记录基础段';

-- ----------------------------
-- Table structure for i_bs_hist
-- ----------------------------
DROP TABLE IF EXISTS i_bs_hist;
CREATE TABLE i_bs_hist (
  PAA_BS_SGMT_ID char(32) NOT NULL COMMENT '主键',
  INF_REC_TYPE varchar(3) DEFAULT NULL COMMENT '信息记录类型',
  NAME varchar(30) DEFAULT NULL COMMENT '姓名',
  ID_TYPE varchar(2) DEFAULT NULL COMMENT '证件类型',
  ID_NUM varchar(20) DEFAULT NULL COMMENT '证件号码',
  INF_SURC_CODE varchar(20) DEFAULT NULL COMMENT '信息来源编码',
  RPT_DATE char(10) DEFAULT NULL COMMENT '信息报告日期',
  RPT_DATE_CODE varchar(2) DEFAULT NULL COMMENT '报告时点说明代码',
  CIMOC varchar(14) DEFAULT NULL COMMENT '客户资料维护机构代码',
  CUSTOMER_TYPE varchar(2) DEFAULT NULL COMMENT '客户资料类型',
  LAST_UPDATE_TIME varchar(10) DEFAULT NULL COMMENT '最后更新时间',
  OPERATOR_USER varchar(50) DEFAULT NULL COMMENT '操作员',
  ORG_NAME varchar(100) DEFAULT NULL COMMENT '数据来源机构名称',
  ORG_CODE varchar(100) DEFAULT NULL COMMENT '数据来源机构编号',
  BUSINESS_STATES varchar(50) DEFAULT NULL COMMENT '数据状态',
  REJECT_REASON varchar(255) DEFAULT NULL COMMENT '驳回原因',
  IS_FILTER char(1) DEFAULT NULL COMMENT '是否过滤标识(默认为N-不过滤)',
  REPORT_MESSAGE_ID varchar(60) DEFAULT NULL COMMENT '报文文件ID',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  REPORT_FILE_COLNUM varchar(7) DEFAULT NULL COMMENT '在报文文件中的行数',
  CUST_NUM varchar(60) DEFAULT NULL,
  DATA_DATE varchar(20) DEFAULT NULL,
  DATA_SOURCE varchar(100) DEFAULT NULL,
  KEY INDEX_I_BS_BUSINESS_ID_HIST (ID_NUM,ID_TYPE) USING BTREE,
  KEY INDEX_I_BS_NORMAL_HIST (BUSINESS_STATES,REPORT_MESSAGE_ID) USING BTREE,
  KEY INDEX_PAA_BS_SGMT_ID_HIST (PAA_BS_SGMT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='110-个人基本信息记录基础段';

-- ----------------------------
-- Table structure for i_bs_middle
-- ----------------------------
DROP TABLE IF EXISTS i_bs_middle;
CREATE TABLE i_bs_middle (
  ID_TYPE varchar(36) NOT NULL COMMENT '证件类型',
  ID_NUM varchar(60) NOT NULL COMMENT '证件号码',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='110-个人基本信息记录基础段中间表';

-- ----------------------------
-- Table structure for i_credit_lim
-- ----------------------------
DROP TABLE IF EXISTS i_credit_lim;
CREATE TABLE i_credit_lim (
  PCC_CREDIT_LIM_SGMT_ID char(32) DEFAULT NULL COMMENT '主键',
  CREDIT_LIM_TYPE varchar(2) DEFAULT NULL COMMENT '授信额度类型',
  LIM_LOOP_FLG varchar(1) DEFAULT NULL COMMENT '额度循环标志',
  CREDIT_LIM varchar(15) DEFAULT NULL COMMENT '授信额度',
  CY varchar(3) DEFAULT NULL COMMENT '币种',
  CON_EFF_DATE varchar(10) DEFAULT NULL COMMENT '额度生效日期',
  CON_EXP_DATE varchar(10) DEFAULT NULL COMMENT '额度到期日期',
  CON_STATUS char(1) DEFAULT NULL COMMENT '额度状态',
  CREDIT_REST varchar(15) DEFAULT NULL COMMENT '授信限额',
  CREDIT_REST_CODE varchar(60) DEFAULT NULL COMMENT '授信限额编号',
  PCA_CTRCT_BS_SGMT_ID char(32) DEFAULT NULL COMMENT '数据外键',
  RPT_DATE varchar(10) DEFAULT NULL COMMENT '报送日期',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  RPT_FLAG varchar(1) DEFAULT NULL COMMENT '1:t+1;2:t+2',
  KEY INDEX_I_CREDIT_LIM (PCA_CTRCT_BS_SGMT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='220-个人授信协议信息记录额度信息段';

-- ----------------------------
-- Table structure for i_credit_lim_hist
-- ----------------------------
DROP TABLE IF EXISTS i_credit_lim_hist;
CREATE TABLE i_credit_lim_hist (
  PCC_CREDIT_LIM_SGMT_ID char(32) NOT NULL COMMENT '主键',
  CREDIT_LIM_TYPE varchar(2) DEFAULT NULL COMMENT '授信额度类型',
  LIM_LOOP_FLG varchar(1) DEFAULT NULL COMMENT '额度循环标志',
  CREDIT_LIM varchar(15) DEFAULT NULL COMMENT '授信额度',
  CY varchar(3) DEFAULT NULL COMMENT '币种',
  CON_EFF_DATE varchar(10) DEFAULT NULL COMMENT '额度生效日期',
  CON_EXP_DATE varchar(10) DEFAULT NULL COMMENT '额度到期日期',
  CON_STATUS varchar(1) DEFAULT NULL COMMENT '额度状态',
  CREDIT_REST varchar(15) DEFAULT NULL COMMENT '授信限额',
  CREDIT_REST_CODE varchar(60) DEFAULT NULL COMMENT '授信限额编号',
  PCA_CTRCT_BS_SGMT_ID char(32) NOT NULL COMMENT '数据外键',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  RPT_FLAG varchar(1) DEFAULT NULL COMMENT '1:t+1;2:t+2',
  KEY INDEX_I_CREDIT_LIM_HIST (PCA_CTRCT_BS_SGMT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='220-个人授信协议信息记录额度信息段';

-- ----------------------------
-- Table structure for i_ctrct_bs
-- ----------------------------
DROP TABLE IF EXISTS i_ctrct_bs;
CREATE TABLE i_ctrct_bs (
  PCA_CTRCT_BS_SGMT_ID char(32) DEFAULT NULL COMMENT '主键',
  INF_REC_TYPE varchar(3) DEFAULT NULL COMMENT '信息记录类型',
  CONTRACT_CODE varchar(60) DEFAULT NULL COMMENT '授信协议标识码',
  RPT_DATE varchar(10) DEFAULT NULL COMMENT '信息报告日期',
  RPT_DATE_CODE varchar(2) DEFAULT NULL COMMENT '报告时点说明代码',
  NAME varchar(30) DEFAULT NULL COMMENT '受信人姓名',
  ID_TYPE varchar(2) DEFAULT NULL COMMENT '受信人证件类型',
  ID_NUM varchar(20) DEFAULT NULL COMMENT '受信人证件号码',
  MNGMT_ORG_CODE varchar(14) DEFAULT NULL COMMENT '业务管理机构代码',
  LAST_UPDATE_TIME varchar(10) DEFAULT NULL COMMENT '最后更新时间',
  OPERATOR_USER varchar(50) DEFAULT NULL COMMENT '操作员',
  ORG_NAME varchar(100) DEFAULT NULL COMMENT '数据来源机构名称',
  ORG_CODE varchar(100) DEFAULT NULL COMMENT '数据来源机构编号',
  BUSINESS_STATES varchar(50) DEFAULT NULL COMMENT '数据状态',
  REJECT_REASON varchar(255) DEFAULT NULL COMMENT '驳回原因',
  IS_FILTER char(1) DEFAULT NULL COMMENT '是否过滤标识(默认为N-不过滤)',
  REPORT_MESSAGE_ID varchar(60) DEFAULT NULL COMMENT '报文文件ID',
  MDFC_SGMT_CODE char(1) DEFAULT NULL COMMENT '待更正段段标',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  REPORT_FILE_COLNUM varchar(7) DEFAULT NULL COMMENT '在报文文件中的行数',
  RPT_FLAG varchar(1) DEFAULT NULL COMMENT '1:t+1;2:t+2',
  KEY INDEX_I_CTRCT_BUSINESS (CONTRACT_CODE) USING BTREE,
  KEY INDEX_I_CTRCT_NORMAL (REPORT_MESSAGE_ID,BUSINESS_STATES) USING BTREE,
  KEY INDEX_PCA_CTRCT_BS (PCA_CTRCT_BS_SGMT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='220-个人授信协议信息记录基础段';

-- ----------------------------
-- Table structure for i_ctrct_bs_hist
-- ----------------------------
DROP TABLE IF EXISTS i_ctrct_bs_hist;
CREATE TABLE i_ctrct_bs_hist (
  PCA_CTRCT_BS_SGMT_ID char(32) NOT NULL COMMENT '主键',
  INF_REC_TYPE varchar(3) DEFAULT NULL COMMENT '信息记录类型',
  CONTRACT_CODE varchar(60) DEFAULT NULL COMMENT '授信协议标识码',
  RPT_DATE char(10) DEFAULT NULL COMMENT '信息报告日期',
  RPT_DATE_CODE varchar(2) DEFAULT NULL COMMENT '报告时点说明代码',
  NAME varchar(30) DEFAULT NULL COMMENT '受信人姓名',
  ID_TYPE varchar(2) DEFAULT NULL COMMENT '受信人证件类型',
  ID_NUM varchar(20) DEFAULT NULL COMMENT '受信人证件号码',
  MNGMT_ORG_CODE varchar(14) DEFAULT NULL COMMENT '业务管理机构代码',
  LAST_UPDATE_TIME varchar(10) DEFAULT NULL COMMENT '最后更新时间',
  OPERATOR_USER varchar(50) DEFAULT NULL COMMENT '操作员',
  ORG_NAME varchar(100) DEFAULT NULL COMMENT '数据来源机构名称',
  ORG_CODE varchar(100) DEFAULT NULL COMMENT '数据来源机构编号',
  BUSINESS_STATES varchar(50) DEFAULT NULL COMMENT '数据状态',
  REJECT_REASON varchar(255) DEFAULT NULL COMMENT '驳回原因',
  IS_FILTER char(1) DEFAULT NULL COMMENT '是否过滤标识(默认为N-不过滤)',
  REPORT_MESSAGE_ID varchar(60) DEFAULT NULL COMMENT '报文文件ID',
  MDFC_SGMT_CODE char(1) DEFAULT NULL COMMENT '待更正段段标',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  REPORT_FILE_COLNUM varchar(7) DEFAULT NULL COMMENT '在报文文件中的行数',
  RPT_FLAG varchar(1) DEFAULT NULL COMMENT '1:t+1;2:t+2',
  KEY INDEX_I_CTRCT_BUSINESS_HIST (CONTRACT_CODE) USING BTREE,
  KEY INDEX_I_CTRCT_NORMAL_HIST (REPORT_MESSAGE_ID,BUSINESS_STATES) USING BTREE,
  KEY INDEX_PCA_CTRCT_BS_HIST (PCA_CTRCT_BS_SGMT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='220-个人授信协议信息记录基础段';

-- ----------------------------
-- Table structure for i_ctrct_bs_middle
-- ----------------------------
DROP TABLE IF EXISTS i_ctrct_bs_middle;
CREATE TABLE i_ctrct_bs_middle (
  CONTRACT_CODE varchar(60) NOT NULL COMMENT '授信协议标识码',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='220-个人授信协议信息记录基础段中间表';

-- ----------------------------
-- Table structure for i_ctrct_cert_rel
-- ----------------------------
DROP TABLE IF EXISTS i_ctrct_cert_rel;
CREATE TABLE i_ctrct_cert_rel (
  PCB_CTRCT_CERT_REL_SGMT_ID char(32) NOT NULL COMMENT '主键',
  BRER_TYPE varchar(1) DEFAULT NULL COMMENT '共同受信人身份类别',
  CERT_REL_NAME varchar(80) DEFAULT NULL COMMENT '共同受信人名称',
  CERT_REL_ID_TYPE varchar(2) DEFAULT NULL COMMENT '共同受信人身份标识类型',
  CERT_REL_ID_NUM varchar(40) DEFAULT NULL COMMENT '共同受信人身份标识号码',
  PCA_CTRCT_BS_SGMT_ID char(32) NOT NULL COMMENT '数据外键',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  RPT_FLAG varchar(1) DEFAULT NULL COMMENT '1:t+1;2:t+2',
  KEY INDEX_I_CTRCT_CERT_REL (PCA_CTRCT_BS_SGMT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='220-个人授信协议信息记录共同受信人信息段';

-- ----------------------------
-- Table structure for i_ctrct_cert_rel_hist
-- ----------------------------
DROP TABLE IF EXISTS i_ctrct_cert_rel_hist;
CREATE TABLE i_ctrct_cert_rel_hist (
  PCB_CTRCT_CERT_REL_SGMT_ID char(32) NOT NULL COMMENT '主键',
  BRER_TYPE varchar(1) DEFAULT NULL COMMENT '共同受信人身份类别',
  CERT_REL_NAME varchar(80) DEFAULT NULL COMMENT '共同受信人名称',
  CERT_REL_ID_TYPE varchar(2) DEFAULT NULL COMMENT '共同受信人身份标识类型',
  CERT_REL_ID_NUM varchar(40) DEFAULT NULL COMMENT '共同受信人身份标识号码',
  PCA_CTRCT_BS_SGMT_ID char(32) NOT NULL COMMENT '数据外键',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  RPT_FLAG varchar(1) DEFAULT NULL COMMENT '1:t+1;2:t+2',
  KEY INDEX_I_CTRCT_CERT_REL_HIST (PCA_CTRCT_BS_SGMT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='220-个人授信协议信息记录共同受信人信息段';

-- ----------------------------
-- Table structure for i_del_entdel_batch_info
-- ----------------------------
DROP TABLE IF EXISTS i_del_entdel_batch_info;
CREATE TABLE i_del_entdel_batch_info (
  INF_REC_TYPE varchar(3) DEFAULT NULL COMMENT '信息记录类型(114:个人基本信息整笔删除；134:个人证件有效期信息整笔删除；213:个人借贷按段删除；214:个人借贷整笔删除；223:个人授信按段删除；224:个人授信整笔删除；233:个人担保按段删除；234:个人担保整笔删除)',
  NAME varchar(100) DEFAULT NULL COMMENT '姓名',
  ID_TYPE varchar(2) DEFAULT NULL COMMENT '证件类型',
  ID_NUM varchar(30) DEFAULT NULL COMMENT '证件号码',
  INF_SURC_CODE varchar(20) DEFAULT NULL COMMENT '信息来源编码',
  DEL_REC_CODE varchar(60) DEFAULT NULL COMMENT '待删除业务标码',
  DEL_SGMT_CODE varchar(1) DEFAULT NULL COMMENT '待删除段段标',
  DEL_START_DATE varchar(10) DEFAULT NULL COMMENT '待删除起始日期',
  DEL_END_DATE varchar(10) DEFAULT NULL COMMENT '待删除结束日期',
  RPT_DATE varchar(10) DEFAULT NULL COMMENT '信用报告日期',
  STATUS varchar(1) DEFAULT NULL COMMENT '数据状态：0:-未处理；1-已处理',
  COMPANY varchar(20) DEFAULT NULL COMMENT '法人',
  INS_TIME varchar(20) DEFAULT NULL COMMENT '数据插入时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='个人按段/整笔删除批量导入信息';

-- ----------------------------
-- Table structure for i_edu_inf
-- ----------------------------
DROP TABLE IF EXISTS i_edu_inf;
CREATE TABLE i_edu_inf (
  PAD_EDU_INF_SGMT_ID char(32) NOT NULL COMMENT '主键',
  EDU_LEVEL varchar(2) DEFAULT NULL COMMENT '学历',
  ACA_DEGREE varchar(1) DEFAULT NULL COMMENT '学位',
  EDU_INFO_UP_DATE char(10) DEFAULT NULL COMMENT '信息更新日期',
  PAA_BS_SGMT_ID char(32) DEFAULT NULL COMMENT '数据外键',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  CUST_NUM varchar(60) DEFAULT NULL,
  DATA_DATE varchar(20) DEFAULT NULL,
  KEY INDEX_I_EDU_INF (PAA_BS_SGMT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='110-个人基本信息记录教育信息段';

-- ----------------------------
-- Table structure for i_edu_inf_hist
-- ----------------------------
DROP TABLE IF EXISTS i_edu_inf_hist;
CREATE TABLE i_edu_inf_hist (
  PAD_EDU_INF_SGMT_ID char(32) NOT NULL COMMENT '主键',
  EDU_LEVEL varchar(2) DEFAULT NULL COMMENT '学历',
  ACA_DEGREE varchar(1) DEFAULT NULL COMMENT '学位',
  EDU_INFO_UP_DATE char(10) DEFAULT NULL COMMENT '信息更新日期',
  PAA_BS_SGMT_ID char(32) NOT NULL COMMENT '数据外键',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  CUST_NUM varchar(60) DEFAULT NULL,
  DATA_DATE varchar(20) DEFAULT NULL,
  KEY INDEX_I_EDU_INF_HIST (PAA_BS_SGMT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='110-个人基本信息记录教育信息段';

-- ----------------------------
-- Table structure for i_fcs_inf
-- ----------------------------
DROP TABLE IF EXISTS i_fcs_inf;
CREATE TABLE i_fcs_inf (
  PAC_FCS_INF_SGMT_ID char(32) NOT NULL COMMENT '主键',
  SEX varchar(1) DEFAULT NULL COMMENT '性别',
  D_O_B varchar(10) DEFAULT NULL COMMENT '出生日期',
  NATION varchar(3) DEFAULT NULL COMMENT '国籍',
  HOUSE_ADD varchar(100) DEFAULT NULL COMMENT '户籍地址',
  HH_DIST varchar(6) DEFAULT NULL COMMENT '户籍所在地行政区划',
  CELL_PHONE varchar(11) DEFAULT NULL COMMENT '手机号码',
  EMAIL varchar(60) DEFAULT NULL COMMENT '电子邮箱',
  FCS_INFO_UP_DATE char(10) DEFAULT NULL COMMENT '信息更新日期',
  PAA_BS_SGMT_ID char(32) DEFAULT NULL COMMENT '数据外键',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  CUST_NUM varchar(60) DEFAULT NULL,
  DATA_DATE varchar(20) DEFAULT NULL,
  KEY INDEX_PAA_I_FCS_INF (PAA_BS_SGMT_ID) USING BTREE,
  KEY bs_index (PAA_BS_SGMT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='110-个人基本信息记录基本概况信息段';

-- ----------------------------
-- Table structure for i_fcs_inf_20230710
-- ----------------------------
DROP TABLE IF EXISTS i_fcs_inf_20230710;
CREATE TABLE i_fcs_inf_20230710 (
  PAC_FCS_INF_SGMT_ID char(32) CHARACTER SET utf8mb4 NOT NULL COMMENT '主键',
  SEX varchar(1) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '性别',
  D_O_B varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '出生日期',
  NATION varchar(3) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '国籍',
  HOUSE_ADD varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '户籍地址',
  HH_DIST varchar(6) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '户籍所在地行政区划',
  CELL_PHONE varchar(11) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '手机号码',
  EMAIL varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '电子邮箱',
  FCS_INFO_UP_DATE char(10) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '信息更新日期',
  PAA_BS_SGMT_ID char(32) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '数据外键',
  RPT_DATE char(10) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '报送日期',
  EXTEND1 varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  CUST_NUM varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL,
  DATA_DATE varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for i_fcs_inf_hist
-- ----------------------------
DROP TABLE IF EXISTS i_fcs_inf_hist;
CREATE TABLE i_fcs_inf_hist (
  PAC_FCS_INF_SGMT_ID char(32) NOT NULL COMMENT '主键',
  SEX varchar(1) DEFAULT NULL COMMENT '性别',
  D_O_B varchar(10) DEFAULT NULL COMMENT '出生日期',
  NATION varchar(3) DEFAULT NULL COMMENT '国籍',
  HOUSE_ADD varchar(100) DEFAULT NULL COMMENT '户籍地址',
  HH_DIST varchar(6) DEFAULT NULL COMMENT '户籍所在地行政区划',
  CELL_PHONE varchar(11) DEFAULT NULL COMMENT '手机号码',
  EMAIL varchar(60) DEFAULT NULL COMMENT '电子邮箱',
  FCS_INFO_UP_DATE char(10) DEFAULT NULL COMMENT '信息更新日期',
  PAA_BS_SGMT_ID char(32) NOT NULL COMMENT '数据外键',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  CUST_NUM varchar(60) DEFAULT NULL,
  DATA_DATE varchar(20) DEFAULT NULL,
  KEY INDEX_PAA_I_FCS_INF_HIST (PAA_BS_SGMT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='110-个人基本信息记录基本概况信息段';

-- ----------------------------
-- Table structure for i_gr_repymt_inf
-- ----------------------------
DROP TABLE IF EXISTS i_gr_repymt_inf;
CREATE TABLE i_gr_repymt_inf (
  PDE_GR_REPYMT_INF_SGMT_ID char(32) NOT NULL COMMENT '主键',
  ACCT_STATUS varchar(1) DEFAULT NULL COMMENT '账户状态',
  LOAN_AMT varchar(15) DEFAULT NULL COMMENT '在保余额',
  REPAY_PRD varchar(10) DEFAULT NULL COMMENT '余额变化日期',
  FIVE_CATE varchar(1) DEFAULT NULL COMMENT '五级分类',
  FIVE_CATE_ADJ_DATE varchar(10) DEFAULT NULL COMMENT '五级分类认定日期',
  RI_EX varchar(15) DEFAULT NULL COMMENT '风险敞口',
  COMP_ADV_FLAG varchar(1) DEFAULT NULL COMMENT '代偿（垫款）标志',
  CLOSE_DATE varchar(10) DEFAULT NULL COMMENT '账户关闭日期',
  PDA_GUAR_ACCT_BS_SGMT_ID char(32) DEFAULT NULL COMMENT '数据外键',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  CUST_NUM varchar(60) DEFAULT NULL COMMENT '客户号',
  ACCT_NUM varchar(60) DEFAULT NULL COMMENT '账户号',
  DATA_DATE varchar(20) DEFAULT NULL COMMENT '数据日期',
  KEY INDEX_I_GR_REPYMT (PDA_GUAR_ACCT_BS_SGMT_ID) USING BTREE,
  KEY bs_indx (PDA_GUAR_ACCT_BS_SGMT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='230-个人担保账户信息记录在保责任信息段';

-- ----------------------------
-- Table structure for i_gr_repymt_inf_20230710
-- ----------------------------
DROP TABLE IF EXISTS i_gr_repymt_inf_20230710;
CREATE TABLE i_gr_repymt_inf_20230710 (
  PDE_GR_REPYMT_INF_SGMT_ID char(32) CHARACTER SET utf8mb4 NOT NULL COMMENT '主键',
  ACCT_STATUS varchar(1) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '账户状态',
  LOAN_AMT varchar(15) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '在保余额',
  REPAY_PRD varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '余额变化日期',
  FIVE_CATE varchar(1) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '五级分类',
  FIVE_CATE_ADJ_DATE varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '五级分类认定日期',
  RI_EX varchar(15) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '风险敞口',
  COMP_ADV_FLAG varchar(1) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '代偿（垫款）标志',
  CLOSE_DATE varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '账户关闭日期',
  PDA_GUAR_ACCT_BS_SGMT_ID char(32) CHARACTER SET utf8mb4 NOT NULL COMMENT '数据外键',
  RPT_DATE char(10) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '报送日期',
  EXTEND1 varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  CUST_NUM varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '客户号',
  ACCT_NUM varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '账户号',
  DATA_DATE varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '数据日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for i_gr_repymt_inf_hist
-- ----------------------------
DROP TABLE IF EXISTS i_gr_repymt_inf_hist;
CREATE TABLE i_gr_repymt_inf_hist (
  PDE_GR_REPYMT_INF_SGMT_ID char(32) NOT NULL COMMENT '主键',
  ACCT_STATUS varchar(1) DEFAULT NULL COMMENT '账户状态',
  LOAN_AMT varchar(15) DEFAULT NULL COMMENT '在保余额',
  REPAY_PRD varchar(10) DEFAULT NULL COMMENT '余额变化日期',
  FIVE_CATE varchar(1) DEFAULT NULL COMMENT '五级分类',
  FIVE_CATE_ADJ_DATE varchar(10) DEFAULT NULL COMMENT '五级分类认定日期',
  RI_EX varchar(15) DEFAULT NULL COMMENT '风险敞口',
  COMP_ADV_FLAG varchar(1) DEFAULT NULL COMMENT '代偿（垫款）标志',
  CLOSE_DATE varchar(10) DEFAULT NULL COMMENT '账户关闭日期',
  PDA_GUAR_ACCT_BS_SGMT_ID char(32) NOT NULL COMMENT '数据外键',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  CUST_NUM varchar(60) DEFAULT NULL COMMENT '客户号',
  ACCT_NUM varchar(60) DEFAULT NULL COMMENT '账户号',
  DATA_DATE varchar(20) DEFAULT NULL COMMENT '数据日期',
  KEY INDEX_I_GR_REPYMT_HIST (PDA_GUAR_ACCT_BS_SGMT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='230-个人担保账户信息记录在保责任信息段';

-- ----------------------------
-- Table structure for i_guar_acct_bs
-- ----------------------------
DROP TABLE IF EXISTS i_guar_acct_bs;
CREATE TABLE i_guar_acct_bs (
  PDA_GUAR_ACCT_BS_SGMT_ID char(32) NOT NULL COMMENT '主键',
  INF_REC_TYPE varchar(3) DEFAULT NULL COMMENT '信息记录类型',
  ACCT_TYPE varchar(2) DEFAULT NULL COMMENT '账户类型',
  ACCT_CODE varchar(60) DEFAULT NULL COMMENT '账户标识码',
  RPT_DATE char(10) DEFAULT NULL COMMENT '信息报告日期',
  RPT_DATE_CODE varchar(2) DEFAULT NULL COMMENT '报告时点说明代码',
  NAME varchar(30) DEFAULT NULL COMMENT '债务人姓名',
  ID_TYPE varchar(2) DEFAULT NULL COMMENT '债务人证件类型',
  ID_NUM varchar(20) DEFAULT NULL COMMENT '债务人证件号码',
  MNGMT_ORG_CODE varchar(14) DEFAULT NULL COMMENT '业务管理机构代码',
  LAST_UPDATE_TIME varchar(10) DEFAULT NULL COMMENT '最后更新时间',
  OPERATOR_USER varchar(50) DEFAULT NULL COMMENT '操作员',
  ORG_NAME varchar(100) DEFAULT NULL COMMENT '数据来源机构名称',
  ORG_CODE varchar(100) DEFAULT NULL COMMENT '数据来源机构编号',
  BUSINESS_STATES varchar(50) DEFAULT NULL COMMENT '数据状态',
  REJECT_REASON varchar(255) DEFAULT NULL COMMENT '驳回原因',
  IS_FILTER char(1) DEFAULT NULL COMMENT '是否过滤标识(默认为N-不过滤)',
  REPORT_MESSAGE_ID varchar(60) DEFAULT NULL COMMENT '报文文件ID',
  MDFC_SGMT_CODE char(1) DEFAULT NULL COMMENT '待更正段段标',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  REPORT_FILE_COLNUM varchar(7) DEFAULT NULL COMMENT '在报文文件中的行数',
  CUST_NUM varchar(60) DEFAULT NULL COMMENT '客户号',
  ACCT_NUM varchar(60) DEFAULT NULL COMMENT '账户号',
  DATA_DATE varchar(20) DEFAULT NULL COMMENT '数据日期',
  DATA_SOURCE varchar(100) DEFAULT NULL COMMENT '数据来源',
  KEY INDEX_I_GUAR_BUSINESS (ACCT_CODE,ACCT_TYPE) USING BTREE,
  KEY INDEX_I_GUAR_NORMAL (REPORT_MESSAGE_ID,BUSINESS_STATES) USING BTREE,
  KEY INDEX_PDA_GUAR_ACCT_BS (PDA_GUAR_ACCT_BS_SGMT_ID) USING BTREE,
  KEY INDEX_REPORT_MESSAGE (INF_REC_TYPE,RPT_DATE,BUSINESS_STATES,COMPANY) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='230-个人担保账户信息记录基础段';

-- ----------------------------
-- Table structure for i_guar_acct_bs_20230710
-- ----------------------------
DROP TABLE IF EXISTS i_guar_acct_bs_20230710;
CREATE TABLE i_guar_acct_bs_20230710 (
  PDA_GUAR_ACCT_BS_SGMT_ID char(32) CHARACTER SET utf8mb4 NOT NULL COMMENT '主键',
  INF_REC_TYPE varchar(3) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '信息记录类型',
  ACCT_TYPE varchar(2) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '账户类型',
  ACCT_CODE varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '账户标识码',
  RPT_DATE char(10) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '信息报告日期',
  RPT_DATE_CODE varchar(2) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '报告时点说明代码',
  NAME varchar(30) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '债务人姓名',
  ID_TYPE varchar(2) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '债务人证件类型',
  ID_NUM varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '债务人证件号码',
  MNGMT_ORG_CODE varchar(14) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '业务管理机构代码',
  LAST_UPDATE_TIME varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '最后更新时间',
  OPERATOR_USER varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '操作员',
  ORG_NAME varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '数据来源机构名称',
  ORG_CODE varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '数据来源机构编号',
  BUSINESS_STATES varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '数据状态',
  REJECT_REASON varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '驳回原因',
  IS_FILTER char(1) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '是否过滤标识(默认为N-不过滤)',
  REPORT_MESSAGE_ID varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '报文文件ID',
  MDFC_SGMT_CODE char(1) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '待更正段段标',
  EXTEND1 varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  REPORT_FILE_COLNUM varchar(7) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '在报文文件中的行数',
  CUST_NUM varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '客户号',
  ACCT_NUM varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '账户号',
  DATA_DATE varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '数据日期',
  DATA_SOURCE varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '数据来源'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for i_guar_acct_bs_hist
-- ----------------------------
DROP TABLE IF EXISTS i_guar_acct_bs_hist;
CREATE TABLE i_guar_acct_bs_hist (
  PDA_GUAR_ACCT_BS_SGMT_ID char(32) NOT NULL COMMENT '主键',
  INF_REC_TYPE varchar(3) DEFAULT NULL COMMENT '信息记录类型',
  ACCT_TYPE varchar(2) DEFAULT NULL COMMENT '账户类型',
  ACCT_CODE varchar(60) DEFAULT NULL COMMENT '账户标识码',
  RPT_DATE char(10) DEFAULT NULL COMMENT '信息报告日期',
  RPT_DATE_CODE varchar(2) DEFAULT NULL COMMENT '报告时点说明代码',
  NAME varchar(30) DEFAULT NULL COMMENT '债务人姓名',
  ID_TYPE varchar(2) DEFAULT NULL COMMENT '债务人证件类型',
  ID_NUM varchar(20) DEFAULT NULL COMMENT '债务人证件号码',
  MNGMT_ORG_CODE varchar(14) DEFAULT NULL COMMENT '业务管理机构代码',
  LAST_UPDATE_TIME varchar(10) DEFAULT NULL COMMENT '最后更新时间',
  OPERATOR_USER varchar(50) DEFAULT NULL COMMENT '操作员',
  ORG_NAME varchar(100) DEFAULT NULL COMMENT '数据来源机构名称',
  ORG_CODE varchar(100) DEFAULT NULL COMMENT '数据来源机构编号',
  BUSINESS_STATES varchar(50) DEFAULT NULL COMMENT '数据状态',
  REJECT_REASON varchar(255) DEFAULT NULL COMMENT '驳回原因',
  IS_FILTER char(1) DEFAULT NULL COMMENT '是否过滤标识(默认为N-不过滤)',
  REPORT_MESSAGE_ID varchar(60) DEFAULT NULL COMMENT '报文文件ID',
  MDFC_SGMT_CODE char(1) DEFAULT NULL COMMENT '待更正段段标',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  REPORT_FILE_COLNUM varchar(7) DEFAULT NULL COMMENT '在报文文件中的行数',
  CUST_NUM varchar(60) DEFAULT NULL COMMENT '客户号',
  ACCT_NUM varchar(60) DEFAULT NULL COMMENT '账户号',
  DATA_DATE varchar(20) DEFAULT NULL COMMENT '数据日期',
  DATA_SOURCE varchar(100) DEFAULT NULL COMMENT '数据来源',
  KEY INDEX_I_GUAR_BUSINESS_HIST (ACCT_CODE,ACCT_TYPE) USING BTREE,
  KEY INDEX_I_GUAR_NORMAL_HIST (REPORT_MESSAGE_ID,BUSINESS_STATES) USING BTREE,
  KEY INDEX_PDA_GUAR_ACCT_BS_HIST (PDA_GUAR_ACCT_BS_SGMT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='230-个人担保账户信息记录基础段';

-- ----------------------------
-- Table structure for i_guar_acct_bs_middle
-- ----------------------------
DROP TABLE IF EXISTS i_guar_acct_bs_middle;
CREATE TABLE i_guar_acct_bs_middle (
  ACCT_TYPE varchar(36) NOT NULL COMMENT '账户类型',
  ACCT_CODE varchar(60) NOT NULL COMMENT '账户标识码',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='230-个人担保账户信息记录基础段中间表';

-- ----------------------------
-- Table structure for i_guar_acct_inf
-- ----------------------------
DROP TABLE IF EXISTS i_guar_acct_inf;
CREATE TABLE i_guar_acct_inf (
  PDB_GUAR_ACCT_INF_SGMT_ID char(32) NOT NULL COMMENT '主键',
  BUSI_LINES varchar(1) DEFAULT NULL COMMENT '担保业务大类',
  BUSI_DTIL_LINES varchar(2) DEFAULT NULL COMMENT '担保业务种类细分',
  OPEN_DATE varchar(10) DEFAULT NULL COMMENT '开户日期',
  ACCT_CRED_LINE varchar(15) DEFAULT NULL COMMENT '担保金额',
  CY varchar(3) DEFAULT NULL COMMENT '币种',
  DUE_DATE varchar(10) DEFAULT NULL COMMENT '到期日期',
  GUAR_MODE varchar(1) DEFAULT NULL COMMENT '反担保方式',
  OTH_REPY_GUAR_WAY varchar(1) DEFAULT NULL COMMENT '其他还款保证方式',
  SEC_DEP varchar(3) DEFAULT NULL COMMENT '保证金百分比',
  CTRCT_TXT_CD varchar(60) DEFAULT NULL COMMENT '担保合同文本编号',
  PDA_GUAR_ACCT_BS_SGMT_ID char(32) DEFAULT NULL COMMENT '数据外键',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  CUST_NUM varchar(60) DEFAULT NULL COMMENT '客户号',
  ACCT_NUM varchar(60) DEFAULT NULL COMMENT '账户号',
  DATA_DATE varchar(20) DEFAULT NULL COMMENT '数据日期',
  KEY INDEX_I_GUAR_ACCT (PDA_GUAR_ACCT_BS_SGMT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='230-个人担保账户信息记录基本信息段';

-- ----------------------------
-- Table structure for i_guar_acct_inf_20230710
-- ----------------------------
DROP TABLE IF EXISTS i_guar_acct_inf_20230710;
CREATE TABLE i_guar_acct_inf_20230710 (
  PDB_GUAR_ACCT_INF_SGMT_ID char(32) CHARACTER SET utf8mb4 NOT NULL COMMENT '主键',
  BUSI_LINES varchar(1) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '担保业务大类',
  BUSI_DTIL_LINES varchar(2) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '担保业务种类细分',
  OPEN_DATE varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '开户日期',
  ACCT_CRED_LINE varchar(15) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '担保金额',
  CY varchar(3) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '币种',
  DUE_DATE varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '到期日期',
  GUAR_MODE varchar(1) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '反担保方式',
  OTH_REPY_GUAR_WAY varchar(1) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '其他还款保证方式',
  SEC_DEP varchar(3) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '保证金百分比',
  CTRCT_TXT_CD varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '担保合同文本编号',
  PDA_GUAR_ACCT_BS_SGMT_ID char(32) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '数据外键',
  RPT_DATE char(10) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '报送日期',
  EXTEND1 varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  CUST_NUM varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '客户号',
  ACCT_NUM varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '账户号',
  DATA_DATE varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '数据日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for i_guar_acct_inf_hist
-- ----------------------------
DROP TABLE IF EXISTS i_guar_acct_inf_hist;
CREATE TABLE i_guar_acct_inf_hist (
  PDB_GUAR_ACCT_INF_SGMT_ID char(32) NOT NULL COMMENT '主键',
  BUSI_LINES varchar(1) DEFAULT NULL COMMENT '担保业务大类',
  BUSI_DTIL_LINES varchar(2) DEFAULT NULL COMMENT '担保业务种类细分',
  OPEN_DATE varchar(10) DEFAULT NULL COMMENT '开户日期',
  ACCT_CRED_LINE varchar(15) DEFAULT NULL COMMENT '担保金额',
  CY varchar(3) DEFAULT NULL COMMENT '币种',
  DUE_DATE varchar(10) DEFAULT NULL COMMENT '到期日期',
  GUAR_MODE varchar(1) DEFAULT NULL COMMENT '反担保方式',
  OTH_REPY_GUAR_WAY varchar(1) DEFAULT NULL COMMENT '其他还款保证方式',
  SEC_DEP varchar(15) DEFAULT NULL COMMENT '保证金百分比',
  CTRCT_TXT_CD varchar(60) DEFAULT NULL COMMENT '担保合同文本编号',
  PDA_GUAR_ACCT_BS_SGMT_ID char(32) NOT NULL COMMENT '数据外键',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  CUST_NUM varchar(60) DEFAULT NULL COMMENT '客户号',
  ACCT_NUM varchar(60) DEFAULT NULL COMMENT '账户号',
  DATA_DATE varchar(20) DEFAULT NULL COMMENT '数据日期',
  KEY INDEX_I_GUAR_ACCT_HIST (PDA_GUAR_ACCT_BS_SGMT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='230-个人担保账户信息记录基本信息段';

-- ----------------------------
-- Table structure for i_guar_mcc_inf
-- ----------------------------
DROP TABLE IF EXISTS i_guar_mcc_inf;
CREATE TABLE i_guar_mcc_inf (
  PDD_GUAR_MCC_INF_SGMT_ID char(32) NOT NULL COMMENT '主键',
  CCC varchar(60) DEFAULT NULL COMMENT '抵（质）押合同标识码',
  PDA_GUAR_ACCT_BS_SGMT_ID char(32) DEFAULT NULL COMMENT '数据外键',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  CUST_NUM varchar(60) DEFAULT NULL COMMENT '客户号',
  ACCT_NUM varchar(60) DEFAULT NULL COMMENT '账户号',
  DATA_DATE varchar(20) DEFAULT NULL COMMENT '数据日期',
  KEY INDEX_I_GUAR_MCC (PDA_GUAR_ACCT_BS_SGMT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='230-个人担保账户信息记录抵质押物信息段';

-- ----------------------------
-- Table structure for i_guar_mcc_inf_hist
-- ----------------------------
DROP TABLE IF EXISTS i_guar_mcc_inf_hist;
CREATE TABLE i_guar_mcc_inf_hist (
  PDD_GUAR_MCC_INF_SGMT_ID char(32) NOT NULL COMMENT '主键',
  CCC varchar(60) DEFAULT NULL COMMENT '抵（质）押合同标识码',
  PDA_GUAR_ACCT_BS_SGMT_ID char(32) DEFAULT NULL COMMENT '数据外键',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  CUST_NUM varchar(60) DEFAULT NULL COMMENT '客户号',
  ACCT_NUM varchar(60) DEFAULT NULL COMMENT '账户号',
  DATA_DATE varchar(20) DEFAULT NULL COMMENT '数据日期',
  KEY INDEX_I_GUAR_MCC_HIST (PDA_GUAR_ACCT_BS_SGMT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='230-个人担保账户信息记录抵质押物信息段';

-- ----------------------------
-- Table structure for i_guar_rlt_repymt_inf
-- ----------------------------
DROP TABLE IF EXISTS i_guar_rlt_repymt_inf;
CREATE TABLE i_guar_rlt_repymt_inf (
  PDC_RLT_REPYMT_INF_SGMT_ID char(32) NOT NULL COMMENT '主键',
  INFO_ID_TYPE varchar(1) DEFAULT NULL COMMENT '身份类别',
  ARLP_NAME varchar(80) DEFAULT NULL COMMENT '责任人名称',
  ARLP_CERT_TYPE varchar(2) DEFAULT NULL COMMENT '责任人身份标识类型',
  ARLP_CERT_NUM varchar(40) DEFAULT NULL COMMENT '责任人身份标识号码',
  ARLP_TYPE varchar(1) DEFAULT NULL COMMENT '还款责任人类型',
  ARLP_AMT varchar(15) DEFAULT NULL COMMENT '还款责任金额',
  WARTY_SIGN varchar(1) DEFAULT NULL COMMENT '联保标志',
  MAX_GUAR_MCC varchar(60) DEFAULT NULL COMMENT '保证合同编号',
  PDA_GUAR_ACCT_BS_SGMT_ID char(32) NOT NULL COMMENT '数据外键',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  CUST_NUM varchar(60) DEFAULT NULL COMMENT '客户号',
  ACCT_NUM varchar(60) DEFAULT NULL COMMENT '账户号',
  DATA_DATE varchar(20) DEFAULT NULL COMMENT '数据日期',
  KEY INDEX_I_GUAR_RLT (PDA_GUAR_ACCT_BS_SGMT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='230-个人担保账户信息记录相关还款责任人段';

-- ----------------------------
-- Table structure for i_guar_rlt_repymt_inf_hist
-- ----------------------------
DROP TABLE IF EXISTS i_guar_rlt_repymt_inf_hist;
CREATE TABLE i_guar_rlt_repymt_inf_hist (
  PDC_RLT_REPYMT_INF_SGMT_ID char(32) NOT NULL COMMENT '主键',
  INFO_ID_TYPE varchar(1) DEFAULT NULL COMMENT '身份类别',
  ARLP_NAME varchar(80) DEFAULT NULL COMMENT '责任人名称',
  ARLP_CERT_TYPE varchar(2) DEFAULT NULL COMMENT '责任人身份标识类型',
  ARLP_CERT_NUM varchar(40) DEFAULT NULL COMMENT '责任人身份标识号码',
  ARLP_TYPE varchar(1) DEFAULT NULL COMMENT '还款责任人类型',
  ARLP_AMT varchar(15) DEFAULT NULL COMMENT '还款责任金额',
  WARTY_SIGN varchar(1) DEFAULT NULL COMMENT '联保标志',
  MAX_GUAR_MCC varchar(60) DEFAULT NULL COMMENT '保证合同编号',
  PDA_GUAR_ACCT_BS_SGMT_ID char(32) NOT NULL COMMENT '数据外键',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  CUST_NUM varchar(60) DEFAULT NULL COMMENT '客户号',
  ACCT_NUM varchar(60) DEFAULT NULL COMMENT '账户号',
  DATA_DATE varchar(20) DEFAULT NULL COMMENT '数据日期',
  KEY INDEX_I_GUAR_RLT_HIST (PDA_GUAR_ACCT_BS_SGMT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='230-个人担保账户信息记录相关还款责任人段';

-- ----------------------------
-- Table structure for i_id
-- ----------------------------
DROP TABLE IF EXISTS i_id;
CREATE TABLE i_id (
  PAB_ID_SGMT_ID char(32) NOT NULL COMMENT '主键',
  ALIAS varchar(30) DEFAULT NULL COMMENT '姓名',
  OTH_ID_TYPE varchar(2) DEFAULT NULL COMMENT '证件类型',
  OTH_ID_NUM varchar(20) DEFAULT NULL COMMENT '证件号码',
  ID_INFO_UP_DATE char(10) DEFAULT NULL COMMENT '信息更新日期',
  PAA_BS_SGMT_ID char(32) NOT NULL COMMENT '数据外键',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  CUST_NUM varchar(60) DEFAULT NULL,
  DATA_DATE varchar(20) DEFAULT NULL,
  KEY INDEX_PAA_I_ID (PAA_BS_SGMT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='110-个人基本信息记录其他标识段';

-- ----------------------------
-- Table structure for i_id_hist
-- ----------------------------
DROP TABLE IF EXISTS i_id_hist;
CREATE TABLE i_id_hist (
  PAB_ID_SGMT_ID char(32) NOT NULL COMMENT '主键',
  ALIAS varchar(30) DEFAULT NULL COMMENT '姓名',
  OTH_ID_TYPE varchar(2) DEFAULT NULL COMMENT '证件类型',
  OTH_ID_NUM varchar(20) DEFAULT NULL COMMENT '证件号码',
  ID_INFO_UP_DATE char(10) DEFAULT NULL COMMENT '信息更新日期',
  PAA_BS_SGMT_ID char(32) NOT NULL COMMENT '数据外键',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  CUST_NUM varchar(60) DEFAULT NULL,
  DATA_DATE varchar(20) DEFAULT NULL,
  KEY INDEX_PAA_I_ID_HIST (PAA_BS_SGMT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='110-个人基本信息记录其他标识段';

-- ----------------------------
-- Table structure for i_inc_inf
-- ----------------------------
DROP TABLE IF EXISTS i_inc_inf;
CREATE TABLE i_inc_inf (
  PAI_INC_INF_SGMT_ID char(32) NOT NULL COMMENT '主键',
  ANNL_INC decimal(65,30) DEFAULT NULL COMMENT '自报年收入',
  TAX_INCOME decimal(65,30) DEFAULT NULL COMMENT '纳税年收入',
  INC_INFO_UP_DATE char(10) DEFAULT NULL COMMENT '信息更新日期',
  PAA_BS_SGMT_ID char(32) NOT NULL COMMENT '数据外键',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  CUST_NUM varchar(60) DEFAULT NULL,
  DATA_DATE varchar(20) DEFAULT NULL,
  KEY INDEX_PAA_I_INC_INF (PAA_BS_SGMT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='110-个人基本信息记录收入信息段';

-- ----------------------------
-- Table structure for i_inc_inf_hist
-- ----------------------------
DROP TABLE IF EXISTS i_inc_inf_hist;
CREATE TABLE i_inc_inf_hist (
  PAI_INC_INF_SGMT_ID char(32) NOT NULL COMMENT '主键',
  ANNL_INC decimal(65,30) DEFAULT NULL COMMENT '自报年收入',
  TAX_INCOME decimal(65,30) DEFAULT NULL COMMENT '纳税年收入',
  INC_INFO_UP_DATE char(10) DEFAULT NULL COMMENT '信息更新日期',
  PAA_BS_SGMT_ID char(32) NOT NULL COMMENT '数据外键',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  CUST_NUM varchar(60) DEFAULT NULL,
  DATA_DATE varchar(20) DEFAULT NULL,
  KEY INDEX_PAA_I_INC_INF_HIST (PAA_BS_SGMT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='110-个人基本信息记录收入信息段';

-- ----------------------------
-- Table structure for i_insecacctid_cagsinf
-- ----------------------------
DROP TABLE IF EXISTS i_insecacctid_cagsinf;
CREATE TABLE i_insecacctid_cagsinf (
  PDW_INSECACCTID_CAGSINF_ID char(32) NOT NULL COMMENT '主键',
  INF_REC_TYPE varchar(3) DEFAULT NULL COMMENT '信息记录类型',
  ACCT_TYPE varchar(2) DEFAULT NULL COMMENT '账户类型',
  OD_BNES_CODE varchar(60) DEFAULT NULL COMMENT '原业务标识码',
  NW_BNES_CODE varchar(60) DEFAULT NULL COMMENT '新业务标识码',
  LAST_UPDATE_TIME varchar(10) DEFAULT NULL COMMENT '最后更新时间',
  OPERATOR_USER varchar(50) DEFAULT NULL COMMENT '操作员',
  ORG_NAME varchar(100) DEFAULT NULL COMMENT '数据来源机构名称',
  ORG_CODE varchar(100) DEFAULT NULL COMMENT '数据来源机构编号',
  BUSINESS_STATES varchar(50) DEFAULT NULL COMMENT '数据状态',
  REJECT_REASON varchar(255) DEFAULT NULL COMMENT '驳回原因',
  IS_FILTER char(1) DEFAULT NULL COMMENT '是否过滤标识(默认为N-不过滤)',
  REPORT_MESSAGE_ID varchar(60) DEFAULT NULL COMMENT '报文文件ID',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  NAME varchar(30) DEFAULT NULL COMMENT '债务人姓名',
  ID_TYPE varchar(2) DEFAULT NULL COMMENT '债务人证件类型',
  ID_NUM varchar(20) DEFAULT NULL COMMENT '债务人证件号码',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  REPORT_FILE_COLNUM varchar(7) DEFAULT NULL COMMENT '在报文文件中的行数',
  KEY INDEX_I_INSECACCT_NORMAL (BUSINESS_STATES,REPORT_MESSAGE_ID) USING BTREE,
  KEY INDEX_PDW_INSECACCTID (PDW_INSECACCTID_CAGSINF_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='231-个人担保账户标识变更请求记录';

-- ----------------------------
-- Table structure for i_insecacctid_cagsinf_hist
-- ----------------------------
DROP TABLE IF EXISTS i_insecacctid_cagsinf_hist;
CREATE TABLE i_insecacctid_cagsinf_hist (
  PDW_INSECACCTID_CAGSINF_ID char(32) NOT NULL COMMENT '主键',
  INF_REC_TYPE varchar(3) DEFAULT NULL COMMENT '信息记录类型',
  ACCT_TYPE varchar(2) DEFAULT NULL COMMENT '账户类型',
  OD_BNES_CODE varchar(60) DEFAULT NULL COMMENT '原业务标识码',
  NW_BNES_CODE varchar(60) DEFAULT NULL COMMENT '新业务标识码',
  LAST_UPDATE_TIME varchar(10) DEFAULT NULL COMMENT '最后更新时间',
  OPERATOR_USER varchar(50) DEFAULT NULL COMMENT '操作员',
  ORG_NAME varchar(100) DEFAULT NULL COMMENT '数据来源机构名称',
  ORG_CODE varchar(100) DEFAULT NULL COMMENT '数据来源机构编号',
  BUSINESS_STATES varchar(50) DEFAULT NULL COMMENT '数据状态',
  REJECT_REASON varchar(255) DEFAULT NULL COMMENT '驳回原因',
  IS_FILTER char(1) DEFAULT NULL COMMENT '是否过滤标识(默认为N-不过滤)',
  REPORT_MESSAGE_ID varchar(60) DEFAULT NULL COMMENT '报文文件ID',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  NAME varchar(30) DEFAULT NULL COMMENT '债务人姓名',
  ID_TYPE varchar(2) DEFAULT NULL COMMENT '债务人证件类型',
  ID_NUM varchar(20) DEFAULT NULL COMMENT '债务人证件号码',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  REPORT_FILE_COLNUM varchar(7) DEFAULT NULL COMMENT '在报文文件中的行数',
  KEY INDEX_I_INSECACCT_NORMAL_HIST (BUSINESS_STATES,REPORT_MESSAGE_ID) USING BTREE,
  KEY INDEX_PDW_INSECACCTID_HIST (PDW_INSECACCTID_CAGSINF_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='231-个人担保账户标识变更请求记录';

-- ----------------------------
-- Table structure for i_in_acct_del
-- ----------------------------
DROP TABLE IF EXISTS i_in_acct_del;
CREATE TABLE i_in_acct_del (
  PBY_IN_ACCT_DEL_ID char(32) NOT NULL COMMENT '主键',
  INF_REC_TYPE varchar(3) DEFAULT NULL COMMENT '信息记录类型',
  ACCT_TYPE varchar(2) DEFAULT NULL COMMENT '账户类型',
  DEL_REC_CODE varchar(60) DEFAULT NULL COMMENT '待删除业务标识码',
  DEL_SGMT_CODE varchar(1) DEFAULT NULL COMMENT '待删除段段标',
  DEL_START_DATE varchar(10) DEFAULT NULL COMMENT '待删除起始日期',
  DEL_END_DATE varchar(10) DEFAULT NULL COMMENT '待删除结束日期',
  LAST_UPDATE_TIME varchar(10) DEFAULT NULL COMMENT '最后更新时间',
  OPERATOR_USER varchar(50) DEFAULT NULL COMMENT '操作员',
  ORG_NAME varchar(100) DEFAULT NULL COMMENT '数据来源机构名称',
  ORG_CODE varchar(100) DEFAULT NULL COMMENT '数据来源机构编号',
  BUSINESS_STATES varchar(50) DEFAULT NULL COMMENT '数据状态',
  REJECT_REASON varchar(255) DEFAULT NULL COMMENT '驳回原因',
  IS_FILTER char(1) DEFAULT NULL COMMENT '是否过滤标识(默认为N-不过滤)',
  REPORT_MESSAGE_ID varchar(60) DEFAULT NULL COMMENT '报文文件ID',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  NAME varchar(30) DEFAULT NULL COMMENT '借款人姓名',
  ID_TYPE varchar(2) DEFAULT NULL COMMENT '借款人证件类型',
  ID_NUM varchar(20) DEFAULT NULL COMMENT '借款人证件号码',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  REPORT_FILE_COLNUM varchar(7) DEFAULT NULL COMMENT '在报文文件中的行数',
  KEY INDEX_I_ACCTDEL_NORMAL (BUSINESS_STATES,REPORT_MESSAGE_ID) USING BTREE,
  KEY INDEX_PBY_ACCT_DEL (PBY_IN_ACCT_DEL_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='213-个人借贷账户按段删除请求记录';

-- ----------------------------
-- Table structure for i_in_acct_del_hist
-- ----------------------------
DROP TABLE IF EXISTS i_in_acct_del_hist;
CREATE TABLE i_in_acct_del_hist (
  PBY_IN_ACCT_DEL_ID char(32) NOT NULL COMMENT '主键',
  INF_REC_TYPE varchar(3) DEFAULT NULL COMMENT '信息记录类型',
  ACCT_TYPE varchar(2) DEFAULT NULL COMMENT '账户类型',
  DEL_REC_CODE varchar(60) DEFAULT NULL COMMENT '待删除业务标识码',
  DEL_SGMT_CODE varchar(1) DEFAULT NULL COMMENT '待删除段段标',
  DEL_START_DATE varchar(10) DEFAULT NULL COMMENT '待删除起始日期',
  DEL_END_DATE varchar(10) DEFAULT NULL COMMENT '待删除结束日期',
  LAST_UPDATE_TIME varchar(10) DEFAULT NULL COMMENT '最后更新时间',
  OPERATOR_USER varchar(50) DEFAULT NULL COMMENT '操作员',
  ORG_NAME varchar(100) DEFAULT NULL COMMENT '数据来源机构名称',
  ORG_CODE varchar(100) DEFAULT NULL COMMENT '数据来源机构编号',
  BUSINESS_STATES varchar(50) DEFAULT NULL COMMENT '数据状态',
  REJECT_REASON varchar(255) DEFAULT NULL COMMENT '驳回原因',
  IS_FILTER char(1) DEFAULT NULL COMMENT '是否过滤标识(默认为N-不过滤)',
  REPORT_MESSAGE_ID varchar(60) DEFAULT NULL COMMENT '报文文件ID',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  NAME varchar(30) DEFAULT NULL COMMENT '借款人姓名',
  ID_TYPE varchar(2) DEFAULT NULL COMMENT '借款人证件类型',
  ID_NUM varchar(20) DEFAULT NULL COMMENT '借款人证件号码',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  REPORT_FILE_COLNUM varchar(7) DEFAULT NULL COMMENT '在报文文件中的行数',
  KEY INDEX_I_ACCTDEL_NORMAL_HIST (BUSINESS_STATES,REPORT_MESSAGE_ID) USING BTREE,
  KEY INDEX_PBY_ACCT_DEL_HIST (PBY_IN_ACCT_DEL_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='213-个人借贷账户按段删除请求记录';

-- ----------------------------
-- Table structure for i_in_acct_ent_del
-- ----------------------------
DROP TABLE IF EXISTS i_in_acct_ent_del;
CREATE TABLE i_in_acct_ent_del (
  PBZ_IN_ACCT_ENT_DEL_ID char(32) NOT NULL COMMENT '主键',
  INF_REC_TYPE varchar(3) DEFAULT NULL COMMENT '信息记录类型',
  ACCT_TYPE varchar(2) DEFAULT NULL COMMENT '账户类型',
  DEL_REC_CODE varchar(60) DEFAULT NULL COMMENT '待删除业务标识码',
  LAST_UPDATE_TIME varchar(10) DEFAULT NULL COMMENT '最后更新时间',
  OPERATOR_USER varchar(50) DEFAULT NULL COMMENT '操作员',
  ORG_NAME varchar(100) DEFAULT NULL COMMENT '数据来源机构名称',
  ORG_CODE varchar(100) DEFAULT NULL COMMENT '数据来源机构编号',
  BUSINESS_STATES varchar(50) DEFAULT NULL COMMENT '数据状态',
  REJECT_REASON varchar(255) DEFAULT NULL COMMENT '驳回原因',
  IS_FILTER char(1) DEFAULT NULL COMMENT '是否过滤标识(默认为N-不过滤)',
  REPORT_MESSAGE_ID varchar(60) DEFAULT NULL COMMENT '报文文件ID',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  NAME varchar(30) DEFAULT NULL COMMENT '借款人姓名',
  ID_TYPE varchar(2) DEFAULT NULL COMMENT '借款人证件类型',
  ID_NUM varchar(20) DEFAULT NULL COMMENT '借款人证件号码',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  REPORT_FILE_COLNUM varchar(7) DEFAULT NULL COMMENT '在报文文件中的行数',
  KEY INDEX_I_ACCTENTDEL_NORMAL (BUSINESS_STATES,REPORT_MESSAGE_ID) USING BTREE,
  KEY INDEX_PBZ_ACCT_ENTDEL (PBZ_IN_ACCT_ENT_DEL_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='214-个人借贷账户整笔删除请求记录';

-- ----------------------------
-- Table structure for i_in_acct_ent_del_hist
-- ----------------------------
DROP TABLE IF EXISTS i_in_acct_ent_del_hist;
CREATE TABLE i_in_acct_ent_del_hist (
  PBZ_IN_ACCT_ENT_DEL_ID char(32) NOT NULL COMMENT '主键',
  INF_REC_TYPE varchar(3) DEFAULT NULL COMMENT '信息记录类型',
  ACCT_TYPE varchar(2) DEFAULT NULL COMMENT '账户类型',
  DEL_REC_CODE varchar(60) DEFAULT NULL COMMENT '待删除业务标识码',
  LAST_UPDATE_TIME varchar(10) DEFAULT NULL COMMENT '最后更新时间',
  OPERATOR_USER varchar(50) DEFAULT NULL COMMENT '操作员',
  ORG_NAME varchar(100) DEFAULT NULL COMMENT '数据来源机构名称',
  ORG_CODE varchar(100) DEFAULT NULL COMMENT '数据来源机构编号',
  BUSINESS_STATES varchar(50) DEFAULT NULL COMMENT '数据状态',
  REJECT_REASON varchar(255) DEFAULT NULL COMMENT '驳回原因',
  IS_FILTER char(1) DEFAULT NULL COMMENT '是否过滤标识(默认为N-不过滤)',
  REPORT_MESSAGE_ID varchar(60) DEFAULT NULL COMMENT '报文文件ID',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  NAME varchar(30) DEFAULT NULL COMMENT '借款人姓名',
  ID_TYPE varchar(2) DEFAULT NULL COMMENT '借款人证件类型',
  ID_NUM varchar(20) DEFAULT NULL COMMENT '借款人证件号码',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  REPORT_FILE_COLNUM varchar(7) DEFAULT NULL COMMENT '在报文文件中的行数',
  KEY INDEX_I_ACCTENTDEL_NORMAL_HIST (BUSINESS_STATES,REPORT_MESSAGE_ID) USING BTREE,
  KEY INDEX_PBZ_ACCT_ENTDEL_HIST (PBZ_IN_ACCT_ENT_DEL_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='214-个人借贷账户整笔删除请求记录';

-- ----------------------------
-- Table structure for i_in_acct_id_cags_inf
-- ----------------------------
DROP TABLE IF EXISTS i_in_acct_id_cags_inf;
CREATE TABLE i_in_acct_id_cags_inf (
  PBW_IN_ACCT_ID_CAGS_INF_ID char(32) NOT NULL COMMENT '主键',
  INF_REC_TYPE varchar(3) DEFAULT NULL COMMENT '信息记录类型',
  ACCT_TYPE varchar(2) DEFAULT NULL COMMENT '账户类型',
  OD_BNES_CODE varchar(60) DEFAULT NULL COMMENT '原业务标识码',
  NW_BNES_CODE varchar(60) DEFAULT NULL COMMENT '新业务标识码',
  LAST_UPDATE_TIME varchar(10) DEFAULT NULL COMMENT '最后更新时间',
  OPERATOR_USER varchar(50) DEFAULT NULL COMMENT '操作员',
  ORG_NAME varchar(100) DEFAULT NULL COMMENT '数据来源机构名称',
  ORG_CODE varchar(100) DEFAULT NULL COMMENT '数据来源机构编号',
  BUSINESS_STATES varchar(50) DEFAULT NULL COMMENT '数据状态',
  REJECT_REASON varchar(255) DEFAULT NULL COMMENT '驳回原因',
  IS_FILTER char(1) DEFAULT NULL COMMENT '是否过滤标识(默认为N-不过滤)',
  REPORT_MESSAGE_ID varchar(60) DEFAULT NULL COMMENT '报文文件ID',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  NAME varchar(30) DEFAULT NULL COMMENT '借款人姓名',
  ID_TYPE varchar(2) DEFAULT NULL COMMENT '借款人证件类型',
  ID_NUM varchar(20) DEFAULT NULL COMMENT '借款人证件号码',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  REPORT_FILE_COLNUM varchar(7) DEFAULT NULL COMMENT '在报文文件中的行数',
  KEY INDEX_I_ACCTCAGS_NORMAL (BUSINESS_STATES,REPORT_MESSAGE_ID) USING BTREE,
  KEY INDEX_PBW_ACCT_CAGS (PBW_IN_ACCT_ID_CAGS_INF_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='211-个人借贷账户标识变更请求记录';

-- ----------------------------
-- Table structure for i_in_acct_id_cags_inf_hist
-- ----------------------------
DROP TABLE IF EXISTS i_in_acct_id_cags_inf_hist;
CREATE TABLE i_in_acct_id_cags_inf_hist (
  PBW_IN_ACCT_ID_CAGS_INF_ID char(32) NOT NULL COMMENT '主键',
  INF_REC_TYPE varchar(3) DEFAULT NULL COMMENT '信息记录类型',
  ACCT_TYPE varchar(2) DEFAULT NULL COMMENT '账户类型',
  OD_BNES_CODE varchar(60) DEFAULT NULL COMMENT '原业务标识码',
  NW_BNES_CODE varchar(60) DEFAULT NULL COMMENT '新业务标识码',
  LAST_UPDATE_TIME varchar(10) DEFAULT NULL COMMENT '最后更新时间',
  OPERATOR_USER varchar(50) DEFAULT NULL COMMENT '操作员',
  ORG_NAME varchar(100) DEFAULT NULL COMMENT '数据来源机构名称',
  ORG_CODE varchar(100) DEFAULT NULL COMMENT '数据来源机构编号',
  BUSINESS_STATES varchar(50) DEFAULT NULL COMMENT '数据状态',
  REJECT_REASON varchar(255) DEFAULT NULL COMMENT '驳回原因',
  IS_FILTER char(1) DEFAULT NULL COMMENT '是否过滤标识(默认为N-不过滤)',
  REPORT_MESSAGE_ID varchar(60) DEFAULT NULL COMMENT '报文文件ID',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  NAME varchar(30) DEFAULT NULL COMMENT '借款人姓名',
  ID_TYPE varchar(2) DEFAULT NULL COMMENT '借款人证件类型',
  ID_NUM varchar(20) DEFAULT NULL COMMENT '借款人证件号码',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  REPORT_FILE_COLNUM varchar(7) DEFAULT NULL COMMENT '在报文文件中的行数',
  KEY INDEX_I_ACCTCAGS_NORMAL_HIST (BUSINESS_STATES,REPORT_MESSAGE_ID) USING BTREE,
  KEY INDEX_PBW_ACCT_CAGS_HIST (PBW_IN_ACCT_ID_CAGS_INF_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='211-个人借贷账户标识变更请求记录';

-- ----------------------------
-- Table structure for i_in_bs_inf_dlt
-- ----------------------------
DROP TABLE IF EXISTS i_in_bs_inf_dlt;
CREATE TABLE i_in_bs_inf_dlt (
  PAY_IN_BS_INF_DLT_ID char(32) NOT NULL COMMENT '主键',
  INF_REC_TYPE varchar(3) DEFAULT NULL COMMENT '信息记录类型',
  NAME varchar(30) DEFAULT NULL COMMENT '姓名',
  ID_TYPE varchar(2) DEFAULT NULL COMMENT '证件类型',
  ID_NUM varchar(20) DEFAULT NULL COMMENT '证件号码',
  INF_SURC_CODE varchar(20) DEFAULT NULL COMMENT '信息来源编码',
  LAST_UPDATE_TIME varchar(10) DEFAULT NULL COMMENT '最后更新时间',
  OPERATOR_USER varchar(50) DEFAULT NULL COMMENT '操作员',
  ORG_NAME varchar(100) DEFAULT NULL COMMENT '数据来源机构名称',
  ORG_CODE varchar(100) DEFAULT NULL COMMENT '数据来源机构编号',
  BUSINESS_STATES varchar(50) DEFAULT NULL COMMENT '数据状态',
  REJECT_REASON varchar(255) DEFAULT NULL COMMENT '驳回原因',
  IS_FILTER char(1) DEFAULT NULL COMMENT '是否过滤标识(默认为N-不过滤)',
  REPORT_MESSAGE_ID varchar(60) DEFAULT NULL COMMENT '报文文件ID',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  REPORT_FILE_COLNUM varchar(7) DEFAULT NULL COMMENT '在报文文件中的行数',
  KEY INDEX_I_BS_DLT_NORMAL (BUSINESS_STATES,REPORT_MESSAGE_ID) USING BTREE,
  KEY INDEX_PAY_DLT_ID (PAY_IN_BS_INF_DLT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='114-个人基本信息整笔删除请求记录';

-- ----------------------------
-- Table structure for i_in_bs_inf_dlt_hist
-- ----------------------------
DROP TABLE IF EXISTS i_in_bs_inf_dlt_hist;
CREATE TABLE i_in_bs_inf_dlt_hist (
  PAY_IN_BS_INF_DLT_ID char(32) NOT NULL COMMENT '主键',
  INF_REC_TYPE varchar(3) DEFAULT NULL COMMENT '信息记录类型',
  NAME varchar(30) DEFAULT NULL COMMENT '姓名',
  ID_TYPE varchar(2) DEFAULT NULL COMMENT '证件类型',
  ID_NUM varchar(20) DEFAULT NULL COMMENT '证件号码',
  INF_SURC_CODE varchar(20) DEFAULT NULL COMMENT '信息来源编码',
  LAST_UPDATE_TIME varchar(10) DEFAULT NULL COMMENT '最后更新时间',
  OPERATOR_USER varchar(50) DEFAULT NULL COMMENT '操作员',
  ORG_NAME varchar(100) DEFAULT NULL COMMENT '数据来源机构名称',
  ORG_CODE varchar(100) DEFAULT NULL COMMENT '数据来源机构编号',
  BUSINESS_STATES varchar(50) DEFAULT NULL COMMENT '数据状态',
  REJECT_REASON varchar(255) DEFAULT NULL COMMENT '驳回原因',
  IS_FILTER char(1) DEFAULT NULL COMMENT '是否过滤标识(默认为N-不过滤)',
  REPORT_MESSAGE_ID varchar(60) DEFAULT NULL COMMENT '报文文件ID',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  REPORT_FILE_COLNUM varchar(7) DEFAULT NULL COMMENT '在报文文件中的行数',
  KEY INDEX_I_BS_DLT_NORMAL_HIST (BUSINESS_STATES,REPORT_MESSAGE_ID) USING BTREE,
  KEY INDEX_PAY_DLT_ID_HIST (PAY_IN_BS_INF_DLT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='114-个人基本信息整笔删除请求记录';

-- ----------------------------
-- Table structure for i_in_cags_inf
-- ----------------------------
DROP TABLE IF EXISTS i_in_cags_inf;
CREATE TABLE i_in_cags_inf (
  PDW_INSECACCTID_CAGSINF_ID char(32) NOT NULL COMMENT '主键',
  INF_REC_TYPE varchar(3) DEFAULT NULL COMMENT '信息记录类型',
  ACCT_TYPE varchar(2) DEFAULT NULL COMMENT '账户类型',
  OD_BNES_CODE varchar(60) DEFAULT NULL COMMENT '原业务标识码',
  NW_BNES_CODE varchar(60) DEFAULT NULL COMMENT '新业务标识码',
  LAST_UPDATE_TIME varchar(10) DEFAULT NULL COMMENT '最后更新时间',
  OPERATOR_USER varchar(50) DEFAULT NULL COMMENT '操作员',
  ORG_NAME varchar(100) DEFAULT NULL COMMENT '数据来源机构名称',
  ORG_CODE varchar(100) DEFAULT NULL COMMENT '数据来源机构编号',
  BUSINESS_STATES varchar(50) DEFAULT NULL COMMENT '数据状态',
  REJECT_REASON varchar(255) DEFAULT NULL COMMENT '驳回原因',
  IS_FILTER char(1) DEFAULT NULL COMMENT '是否过滤标识(默认为N-不过滤)',
  REPORT_MESSAGE_ID varchar(60) DEFAULT NULL COMMENT '报文文件ID',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  NAME varchar(30) DEFAULT NULL COMMENT '姓名(当INF_REC_TYPE 为211是该字段为借贷人姓名，221为授信人姓名，231为担保人姓名)',
  ID_TYPE varchar(2) DEFAULT NULL COMMENT '证件类型(当INF_REC_TYPE 为211是该字段为借贷人证件类型，221为授信人证件类型，231为担保人证件类型)',
  ID_NUM varchar(20) DEFAULT NULL COMMENT '证件号码(当INF_REC_TYPE 为211是该字段为借贷人证件号码，221为授信人证件号码，231为担保人证件号码)',
  COMPANY varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='标识变更请求记录表';

-- ----------------------------
-- Table structure for i_in_cags_inf_hist
-- ----------------------------
DROP TABLE IF EXISTS i_in_cags_inf_hist;
CREATE TABLE i_in_cags_inf_hist (
  PDW_INSECACCTID_CAGSINF_ID char(32) NOT NULL COMMENT '主键',
  INF_REC_TYPE varchar(3) DEFAULT NULL COMMENT '信息记录类型',
  ACCT_TYPE varchar(2) DEFAULT NULL COMMENT '账户类型',
  OD_BNES_CODE varchar(60) DEFAULT NULL COMMENT '原业务标识码',
  NW_BNES_CODE varchar(60) DEFAULT NULL COMMENT '新业务标识码',
  LAST_UPDATE_TIME varchar(10) DEFAULT NULL COMMENT '最后更新时间',
  OPERATOR_USER varchar(50) DEFAULT NULL COMMENT '操作员',
  ORG_NAME varchar(100) DEFAULT NULL COMMENT '数据来源机构名称',
  ORG_CODE varchar(100) DEFAULT NULL COMMENT '数据来源机构编号',
  BUSINESS_STATES varchar(50) DEFAULT NULL COMMENT '数据状态',
  REJECT_REASON varchar(255) DEFAULT NULL COMMENT '驳回原因',
  IS_FILTER char(1) DEFAULT NULL COMMENT '是否过滤标识(默认为N-不过滤)',
  REPORT_MESSAGE_ID varchar(60) DEFAULT NULL COMMENT '报文文件ID',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  NAME varchar(30) DEFAULT NULL COMMENT '姓名(当INF_REC_TYPE 为211是该字段为借贷人姓名，221为授信人姓名，231为担保人姓名)',
  ID_TYPE varchar(2) DEFAULT NULL COMMENT '证件类型(当INF_REC_TYPE 为211是该字段为借贷人证件类型，221为授信人证件类型，231为担保人证件类型)',
  ID_NUM varchar(20) DEFAULT NULL COMMENT '证件号码(当INF_REC_TYPE 为211是该字段为借贷人证件号码，221为授信人证件号码，231为担保人证件号码)',
  COMPANY varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='标识变更请求记录表';

-- ----------------------------
-- Table structure for i_in_ctf_itg_inf
-- ----------------------------
DROP TABLE IF EXISTS i_in_ctf_itg_inf;
CREATE TABLE i_in_ctf_itg_inf (
  PAL_IN_CTF_ITG_INF_ID char(32) NOT NULL COMMENT '主键',
  INF_REC_TYPE varchar(3) DEFAULT NULL COMMENT '信息记录类型',
  NAME varchar(30) DEFAULT NULL COMMENT '姓名',
  ID_TYPE varchar(2) DEFAULT NULL COMMENT '证件类型',
  ID_NUM varchar(20) DEFAULT NULL COMMENT '证件号码',
  OTH_NAME varchar(30) DEFAULT NULL COMMENT '其他姓名',
  OTH_ID_TYPE varchar(2) DEFAULT NULL COMMENT '其他证件类型',
  OTH_ID_NUM varchar(20) DEFAULT NULL COMMENT '其他证件号码',
  OTH_ASS_FLG varchar(1) DEFAULT NULL COMMENT '证件关联关系有效标志',
  INF_SURC_CODE varchar(20) DEFAULT NULL COMMENT '信息来源编码',
  RPT_DATE char(10) DEFAULT NULL COMMENT '信息报告日期',
  LAST_UPDATE_TIME varchar(10) DEFAULT NULL COMMENT '最后更新时间',
  OPERATOR_USER varchar(50) DEFAULT NULL COMMENT '操作员',
  ORG_NAME varchar(100) DEFAULT NULL COMMENT '数据来源机构名称',
  ORG_CODE varchar(100) DEFAULT NULL COMMENT '数据来源机构编号',
  BUSINESS_STATES varchar(50) DEFAULT NULL COMMENT '数据状态',
  REJECT_REASON varchar(255) DEFAULT NULL COMMENT '驳回原因',
  IS_FILTER char(1) DEFAULT NULL COMMENT '是否过滤标识(默认为N-不过滤)',
  REPORT_MESSAGE_ID varchar(60) DEFAULT NULL COMMENT '报文文件ID',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  REPORT_FILE_COLNUM varchar(7) DEFAULT NULL COMMENT '在报文文件中的行数',
  KEY INDEX_I_CTFITG_BUSINESS (ID_NUM,ID_TYPE) USING BTREE,
  KEY INDEX_I_CTFITG_NORMAL (REPORT_MESSAGE_ID,BUSINESS_STATES) USING BTREE,
  KEY INDEX_PAL_CTF_ITG (PAL_IN_CTF_ITG_INF_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='140-个人证件整合信息记录';

-- ----------------------------
-- Table structure for i_in_ctf_itg_inf_hist
-- ----------------------------
DROP TABLE IF EXISTS i_in_ctf_itg_inf_hist;
CREATE TABLE i_in_ctf_itg_inf_hist (
  PAL_IN_CTF_ITG_INF_ID char(32) NOT NULL COMMENT '主键',
  INF_REC_TYPE varchar(3) DEFAULT NULL COMMENT '信息记录类型',
  NAME varchar(30) DEFAULT NULL COMMENT '姓名',
  ID_TYPE varchar(2) DEFAULT NULL COMMENT '证件类型',
  ID_NUM varchar(20) DEFAULT NULL COMMENT '证件号码',
  OTH_NAME varchar(30) DEFAULT NULL COMMENT '其他姓名',
  OTH_ID_TYPE varchar(2) DEFAULT NULL COMMENT '其他证件类型',
  OTH_ID_NUM varchar(20) DEFAULT NULL COMMENT '其他证件号码',
  OTH_ASS_FLG varchar(1) DEFAULT NULL COMMENT '证件关联关系有效标志',
  INF_SURC_CODE varchar(20) DEFAULT NULL COMMENT '信息来源编码',
  RPT_DATE char(10) DEFAULT NULL COMMENT '信息报告日期',
  LAST_UPDATE_TIME varchar(10) DEFAULT NULL COMMENT '最后更新时间',
  OPERATOR_USER varchar(50) DEFAULT NULL COMMENT '操作员',
  ORG_NAME varchar(100) DEFAULT NULL COMMENT '数据来源机构名称',
  ORG_CODE varchar(100) DEFAULT NULL COMMENT '数据来源机构编号',
  BUSINESS_STATES varchar(50) DEFAULT NULL COMMENT '数据状态',
  REJECT_REASON varchar(255) DEFAULT NULL COMMENT '驳回原因',
  IS_FILTER char(1) DEFAULT NULL COMMENT '是否过滤标识(默认为N-不过滤)',
  REPORT_MESSAGE_ID varchar(60) DEFAULT NULL COMMENT '报文文件ID',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  REPORT_FILE_COLNUM varchar(7) DEFAULT NULL COMMENT '在报文文件中的行数',
  KEY INDEX_I_CTFITG_BUSINESS_HIST (ID_NUM,ID_TYPE) USING BTREE,
  KEY INDEX_I_CTFITG_NORMAL_HIST (REPORT_MESSAGE_ID,BUSINESS_STATES) USING BTREE,
  KEY INDEX_PAL_CTF_ITG_HIST (PAL_IN_CTF_ITG_INF_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='140-个人证件整合信息记录';

-- ----------------------------
-- Table structure for i_in_ctf_itg_inf_middle
-- ----------------------------
DROP TABLE IF EXISTS i_in_ctf_itg_inf_middle;
CREATE TABLE i_in_ctf_itg_inf_middle (
  ID_TYPE varchar(36) NOT NULL COMMENT '证件类型',
  ID_NUM varchar(60) NOT NULL COMMENT '证件号码',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='140-个人证件整合信息记录中间表';

-- ----------------------------
-- Table structure for i_in_ctrctid_cags_inf
-- ----------------------------
DROP TABLE IF EXISTS i_in_ctrctid_cags_inf;
CREATE TABLE i_in_ctrctid_cags_inf (
  PCW_IN_CTRCTID_CAGS_INF_ID char(32) NOT NULL COMMENT '主键',
  INF_REC_TYPE varchar(3) DEFAULT NULL COMMENT '信息记录类型',
  OD_BNES_CODE varchar(60) DEFAULT NULL COMMENT '原业务标识码',
  NW_BNES_CODE varchar(60) DEFAULT NULL COMMENT '新业务标识码',
  LAST_UPDATE_TIME varchar(10) DEFAULT NULL COMMENT '最后更新时间',
  OPERATOR_USER varchar(50) DEFAULT NULL COMMENT '操作员',
  ORG_NAME varchar(100) DEFAULT NULL COMMENT '数据来源机构名称',
  ORG_CODE varchar(100) DEFAULT NULL COMMENT '数据来源机构编号',
  BUSINESS_STATES varchar(50) DEFAULT NULL COMMENT '数据状态',
  REJECT_REASON varchar(255) DEFAULT NULL COMMENT '驳回原因',
  IS_FILTER char(1) DEFAULT NULL COMMENT '是否过滤标识(默认为N-不过滤)',
  REPORT_MESSAGE_ID varchar(60) DEFAULT NULL COMMENT '报文文件ID',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  NAME varchar(30) DEFAULT NULL COMMENT '受信人姓名',
  ID_TYPE varchar(2) DEFAULT NULL COMMENT '受信人证件类型',
  ID_NUM varchar(20) DEFAULT NULL COMMENT '受信人证件号码',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  REPORT_FILE_COLNUM varchar(7) DEFAULT NULL COMMENT '在报文文件中的行数',
  KEY INDEX_I_CTRCTID_NORMAL (BUSINESS_STATES,REPORT_MESSAGE_ID) USING BTREE,
  KEY INDEX_PCW_CTRCTID_CAGS (PCW_IN_CTRCTID_CAGS_INF_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='221-个人授信协议标识变更请求记录';

-- ----------------------------
-- Table structure for i_in_ctrctid_cags_inf_hist
-- ----------------------------
DROP TABLE IF EXISTS i_in_ctrctid_cags_inf_hist;
CREATE TABLE i_in_ctrctid_cags_inf_hist (
  PCW_IN_CTRCTID_CAGS_INF_ID char(32) NOT NULL COMMENT '主键',
  INF_REC_TYPE varchar(3) DEFAULT NULL COMMENT '信息记录类型',
  OD_BNES_CODE varchar(60) DEFAULT NULL COMMENT '原业务标识码',
  NW_BNES_CODE varchar(60) DEFAULT NULL COMMENT '新业务标识码',
  LAST_UPDATE_TIME varchar(10) DEFAULT NULL COMMENT '最后更新时间',
  OPERATOR_USER varchar(50) DEFAULT NULL COMMENT '操作员',
  ORG_NAME varchar(100) DEFAULT NULL COMMENT '数据来源机构名称',
  ORG_CODE varchar(100) DEFAULT NULL COMMENT '数据来源机构编号',
  BUSINESS_STATES varchar(50) DEFAULT NULL COMMENT '数据状态',
  REJECT_REASON varchar(255) DEFAULT NULL COMMENT '驳回原因',
  IS_FILTER char(1) DEFAULT NULL COMMENT '是否过滤标识(默认为N-不过滤)',
  REPORT_MESSAGE_ID varchar(60) DEFAULT NULL COMMENT '报文文件ID',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  NAME varchar(30) DEFAULT NULL COMMENT '受信人姓名',
  ID_TYPE varchar(2) DEFAULT NULL COMMENT '受信人证件类型',
  ID_NUM varchar(20) DEFAULT NULL COMMENT '受信人证件号码',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  REPORT_FILE_COLNUM varchar(7) DEFAULT NULL COMMENT '在报文文件中的行数',
  KEY INDEX_I_CTRCTID_NORMAL_HIST (BUSINESS_STATES,REPORT_MESSAGE_ID) USING BTREE,
  KEY INDEX_PCW_CTRCTID_CAGS_HIST (PCW_IN_CTRCTID_CAGS_INF_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='221-个人授信协议标识变更请求记录';

-- ----------------------------
-- Table structure for i_in_ctrct_del
-- ----------------------------
DROP TABLE IF EXISTS i_in_ctrct_del;
CREATE TABLE i_in_ctrct_del (
  PCY_IN_CTRCT_DEL_ID char(32) NOT NULL COMMENT '主键',
  INF_REC_TYPE varchar(3) DEFAULT NULL COMMENT '信息记录类型',
  DEL_REC_CODE varchar(60) DEFAULT NULL COMMENT '待删除业务标识码',
  DEL_SGMT_CODE varchar(1) DEFAULT NULL COMMENT '待删除段段标',
  DEL_START_DATE varchar(10) DEFAULT NULL COMMENT '待删除起始日期',
  DEL_END_DATE varchar(10) DEFAULT NULL COMMENT '待删除结束日期',
  LAST_UPDATE_TIME varchar(10) DEFAULT NULL COMMENT '最后更新时间',
  OPERATOR_USER varchar(50) DEFAULT NULL COMMENT '操作员',
  ORG_NAME varchar(100) DEFAULT NULL COMMENT '数据来源机构名称',
  ORG_CODE varchar(100) DEFAULT NULL COMMENT '数据来源机构编号',
  BUSINESS_STATES varchar(50) DEFAULT NULL COMMENT '数据状态',
  REJECT_REASON varchar(255) DEFAULT NULL COMMENT '驳回原因',
  IS_FILTER char(1) DEFAULT NULL COMMENT '是否过滤标识(默认为N-不过滤)',
  REPORT_MESSAGE_ID varchar(60) DEFAULT NULL COMMENT '报文文件ID',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  NAME varchar(30) DEFAULT NULL COMMENT '受信人姓名',
  ID_TYPE varchar(2) DEFAULT NULL COMMENT '受信人证件类型',
  ID_NUM varchar(20) DEFAULT NULL COMMENT '受信人证件号码',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  REPORT_FILE_COLNUM varchar(7) DEFAULT NULL COMMENT '在报文文件中的行数',
  KEY INDEX_I_CTRCTDEL_NORMAL (BUSINESS_STATES,REPORT_MESSAGE_ID) USING BTREE,
  KEY INDEX_PCY_CTRCT_DEL (PCY_IN_CTRCT_DEL_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='223-个人授信协议按段删除请求记录';

-- ----------------------------
-- Table structure for i_in_ctrct_del_hist
-- ----------------------------
DROP TABLE IF EXISTS i_in_ctrct_del_hist;
CREATE TABLE i_in_ctrct_del_hist (
  PCY_IN_CTRCT_DEL_ID char(32) NOT NULL COMMENT '主键',
  INF_REC_TYPE varchar(3) DEFAULT NULL COMMENT '信息记录类型',
  DEL_REC_CODE varchar(60) DEFAULT NULL COMMENT '待删除业务标识码',
  DEL_SGMT_CODE varchar(1) DEFAULT NULL COMMENT '待删除段段标',
  DEL_START_DATE varchar(10) DEFAULT NULL COMMENT '待删除起始日期',
  DEL_END_DATE varchar(10) DEFAULT NULL COMMENT '待删除结束日期',
  LAST_UPDATE_TIME varchar(10) DEFAULT NULL COMMENT '最后更新时间',
  OPERATOR_USER varchar(50) DEFAULT NULL COMMENT '操作员',
  ORG_NAME varchar(100) DEFAULT NULL COMMENT '数据来源机构名称',
  ORG_CODE varchar(100) DEFAULT NULL COMMENT '数据来源机构编号',
  BUSINESS_STATES varchar(50) DEFAULT NULL COMMENT '数据状态',
  REJECT_REASON varchar(255) DEFAULT NULL COMMENT '驳回原因',
  IS_FILTER char(1) DEFAULT NULL COMMENT '是否过滤标识(默认为N-不过滤)',
  REPORT_MESSAGE_ID varchar(60) DEFAULT NULL COMMENT '报文文件ID',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  NAME varchar(30) DEFAULT NULL COMMENT '受信人姓名',
  ID_TYPE varchar(2) DEFAULT NULL COMMENT '受信人证件类型',
  ID_NUM varchar(20) DEFAULT NULL COMMENT '受信人证件号码',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  REPORT_FILE_COLNUM varchar(7) DEFAULT NULL COMMENT '在报文文件中的行数',
  KEY INDEX_I_CTRCTDEL_NORMAL_HIST (BUSINESS_STATES,REPORT_MESSAGE_ID) USING BTREE,
  KEY INDEX_PCY_CTRCT_DEL_HIST (PCY_IN_CTRCT_DEL_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='223-个人授信协议按段删除请求记录';

-- ----------------------------
-- Table structure for i_in_ctrct_ent_del
-- ----------------------------
DROP TABLE IF EXISTS i_in_ctrct_ent_del;
CREATE TABLE i_in_ctrct_ent_del (
  PCZ_IN_CTRCT_ENT_DEL_ID char(32) NOT NULL COMMENT '主键',
  INF_REC_TYPE varchar(3) DEFAULT NULL COMMENT '信息记录类型',
  DEL_REC_CODE varchar(60) DEFAULT NULL COMMENT '待删除业务标识码',
  LAST_UPDATE_TIME varchar(10) DEFAULT NULL COMMENT '最后更新时间',
  OPERATOR_USER varchar(50) DEFAULT NULL COMMENT '操作员',
  ORG_NAME varchar(100) DEFAULT NULL COMMENT '数据来源机构名称',
  ORG_CODE varchar(100) DEFAULT NULL COMMENT '数据来源机构编号',
  BUSINESS_STATES varchar(50) DEFAULT NULL COMMENT '数据状态',
  REJECT_REASON varchar(255) DEFAULT NULL COMMENT '驳回原因',
  IS_FILTER char(1) DEFAULT NULL COMMENT '是否过滤标识(默认为N-不过滤)',
  REPORT_MESSAGE_ID varchar(60) DEFAULT NULL COMMENT '报文文件ID',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  NAME varchar(30) DEFAULT NULL,
  ID_TYPE varchar(2) DEFAULT NULL,
  ID_NUM varchar(20) DEFAULT NULL,
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  REPORT_FILE_COLNUM varchar(7) DEFAULT NULL COMMENT '在报文文件中的行数',
  KEY INDEX_I_CTRENTDEL_NORMAL (BUSINESS_STATES,REPORT_MESSAGE_ID) USING BTREE,
  KEY INDEX_PCZ_CTRCT_ENTDEL (PCZ_IN_CTRCT_ENT_DEL_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='224-个人授信协议整笔删除请求记录';

-- ----------------------------
-- Table structure for i_in_ctrct_ent_del_hist
-- ----------------------------
DROP TABLE IF EXISTS i_in_ctrct_ent_del_hist;
CREATE TABLE i_in_ctrct_ent_del_hist (
  PCZ_IN_CTRCT_ENT_DEL_ID char(32) NOT NULL COMMENT '主键',
  INF_REC_TYPE varchar(3) DEFAULT NULL COMMENT '信息记录类型',
  DEL_REC_CODE varchar(60) DEFAULT NULL COMMENT '待删除业务标识码',
  LAST_UPDATE_TIME varchar(10) DEFAULT NULL COMMENT '最后更新时间',
  OPERATOR_USER varchar(50) DEFAULT NULL COMMENT '操作员',
  ORG_NAME varchar(100) DEFAULT NULL COMMENT '数据来源机构名称',
  ORG_CODE varchar(100) DEFAULT NULL COMMENT '数据来源机构编号',
  BUSINESS_STATES varchar(50) DEFAULT NULL COMMENT '数据状态',
  REJECT_REASON varchar(255) DEFAULT NULL COMMENT '驳回原因',
  IS_FILTER char(1) DEFAULT NULL COMMENT '是否过滤标识(默认为N-不过滤)',
  REPORT_MESSAGE_ID varchar(60) DEFAULT NULL COMMENT '报文文件ID',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  NAME varchar(30) DEFAULT NULL,
  ID_TYPE varchar(2) DEFAULT NULL,
  ID_NUM varchar(20) DEFAULT NULL,
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  REPORT_FILE_COLNUM varchar(7) DEFAULT NULL COMMENT '在报文文件中的行数',
  KEY INDEX_I_CTRENTDEL_NORMAL_HIST (BUSINESS_STATES,REPORT_MESSAGE_ID) USING BTREE,
  KEY INDEX_PCZ_CTRCT_ENTDEL_HIST (PCZ_IN_CTRCT_ENT_DEL_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='224-个人授信协议整笔删除请求记录';

-- ----------------------------
-- Table structure for i_in_del
-- ----------------------------
DROP TABLE IF EXISTS i_in_del;
CREATE TABLE i_in_del (
  PBY_IN_ACCT_DEL_ID char(32) NOT NULL COMMENT '主键',
  INF_REC_TYPE varchar(3) DEFAULT NULL COMMENT '信息记录类型',
  ACCT_TYPE varchar(2) DEFAULT NULL COMMENT '账户类型',
  DEL_REC_CODE varchar(60) DEFAULT NULL COMMENT '待删除业务标码',
  DEL_SGMT_CODE varchar(1) DEFAULT NULL COMMENT '待删除段段标',
  DEL_START_DATE varchar(10) DEFAULT NULL COMMENT '待删除起始日期',
  DEL_END_DATE varchar(10) DEFAULT NULL COMMENT '待删除结束日期',
  LAST_UPDATE_TIME varchar(10) DEFAULT NULL COMMENT '最后更新时间',
  OPERATOR_USER varchar(50) DEFAULT NULL COMMENT '操作员',
  ORG_NAME varchar(100) DEFAULT NULL COMMENT '数据来源机构名称',
  ORG_CODE varchar(100) DEFAULT NULL COMMENT '数据来源机构编号',
  BUSINESS_STATES varchar(50) DEFAULT NULL COMMENT '数据状态',
  REJECT_REASON varchar(255) DEFAULT NULL COMMENT '驳回原因',
  IS_FILTER char(1) DEFAULT NULL COMMENT '是否过滤标识(默认为N-不过滤)',
  REPORT_MESSAGE_ID varchar(60) DEFAULT NULL COMMENT '报文文件ID',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  NAME varchar(30) DEFAULT NULL COMMENT '姓名(当INF_REC_TYPE 为211是该字段为借贷人姓名，221为授信人姓名，231为担保人姓名)',
  ID_TYPE varchar(2) DEFAULT NULL COMMENT '证件类型(当INF_REC_TYPE 为211是该字段为借贷人证件类型，221为授信人证件类型，231为担保人证件类型)',
  ID_NUM varchar(20) DEFAULT NULL COMMENT '证件号码(当INF_REC_TYPE 为211是该字段为借贷人证件号码，221为授信人证件号码，231为担保人证件号码)',
  COMPANY varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='按段删除请求记录表';

-- ----------------------------
-- Table structure for i_in_del_hist
-- ----------------------------
DROP TABLE IF EXISTS i_in_del_hist;
CREATE TABLE i_in_del_hist (
  PBY_IN_ACCT_DEL_ID char(32) NOT NULL COMMENT '主键',
  INF_REC_TYPE varchar(3) DEFAULT NULL COMMENT '信息记录类型',
  ACCT_TYPE varchar(2) DEFAULT NULL COMMENT '账户类型',
  DEL_REC_CODE varchar(60) DEFAULT NULL COMMENT '待删除业务标码',
  DEL_SGMT_CODE varchar(1) DEFAULT NULL COMMENT '待删除段段标',
  DEL_START_DATE varchar(10) DEFAULT NULL COMMENT '待删除起始日期',
  DEL_END_DATE varchar(10) DEFAULT NULL COMMENT '待删除结束日期',
  LAST_UPDATE_TIME varchar(10) DEFAULT NULL COMMENT '最后更新时间',
  OPERATOR_USER varchar(50) DEFAULT NULL COMMENT '操作员',
  ORG_NAME varchar(100) DEFAULT NULL COMMENT '数据来源机构名称',
  ORG_CODE varchar(100) DEFAULT NULL COMMENT '数据来源机构编号',
  BUSINESS_STATES varchar(50) DEFAULT NULL COMMENT '数据状态',
  REJECT_REASON varchar(255) DEFAULT NULL COMMENT '驳回原因',
  IS_FILTER char(1) DEFAULT NULL COMMENT '是否过滤标识(默认为N-不过滤)',
  REPORT_MESSAGE_ID varchar(60) DEFAULT NULL COMMENT '报文文件ID',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  NAME varchar(30) DEFAULT NULL COMMENT '姓名(当INF_REC_TYPE 为211是该字段为借贷人姓名，221为授信人姓名，231为担保人姓名)',
  ID_TYPE varchar(2) DEFAULT NULL COMMENT '证件类型(当INF_REC_TYPE 为211是该字段为借贷人证件类型，221为授信人证件类型，231为担保人证件类型)',
  ID_NUM varchar(20) DEFAULT NULL COMMENT '证件号码(当INF_REC_TYPE 为211是该字段为借贷人证件号码，221为授信人证件号码，231为担保人证件号码)',
  COMPANY varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='按段删除请求记录表';

-- ----------------------------
-- Table structure for i_in_fal_mmbs_inf
-- ----------------------------
DROP TABLE IF EXISTS i_in_fal_mmbs_inf;
CREATE TABLE i_in_fal_mmbs_inf (
  PAJ_IN_FAL_MMBS_INF_ID char(32) NOT NULL COMMENT '主键',
  INF_REC_TYPE varchar(3) DEFAULT NULL COMMENT '信息记录类型',
  NAME varchar(30) DEFAULT NULL COMMENT 'A姓名',
  ID_TYPE varchar(2) DEFAULT NULL COMMENT 'A证件类型',
  ID_NUM varchar(20) DEFAULT NULL COMMENT 'A证件号码',
  FAM_MEM_NAME varchar(30) DEFAULT NULL COMMENT 'B姓名',
  FAM_MEM_CERT_TYPE varchar(2) DEFAULT NULL COMMENT 'B证件类型',
  FAM_MEM_CERT_NUM varchar(20) DEFAULT NULL COMMENT 'B证件号码',
  FAM_REL varchar(1) DEFAULT NULL COMMENT '家族关系',
  FAM_RELA_ASS_FLAG varchar(1) DEFAULT NULL COMMENT '家族关系有效标志',
  INF_SURC_CODE varchar(20) DEFAULT NULL COMMENT '信息来源编码',
  RPT_DATE char(10) DEFAULT NULL COMMENT '信息报告日期',
  LAST_UPDATE_TIME varchar(10) DEFAULT NULL COMMENT '最后更新时间',
  OPERATOR_USER varchar(50) DEFAULT NULL COMMENT '操作员',
  ORG_NAME varchar(100) DEFAULT NULL COMMENT '数据来源机构名称',
  ORG_CODE varchar(100) DEFAULT NULL COMMENT '数据来源机构编号',
  BUSINESS_STATES varchar(50) DEFAULT NULL COMMENT '数据状态',
  REJECT_REASON varchar(255) DEFAULT NULL COMMENT '驳回原因',
  IS_FILTER char(1) DEFAULT NULL COMMENT '是否过滤标识(默认为N-不过滤)',
  REPORT_MESSAGE_ID varchar(60) DEFAULT NULL COMMENT '报文文件ID',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  REPORT_FILE_COLNUM varchar(7) DEFAULT NULL COMMENT '在报文文件中的行数',
  UNIQUE KEY INDEX_PAJ_FAL_MMBS (PAJ_IN_FAL_MMBS_INF_ID) USING BTREE,
  KEY INDEX_I_FAL_BUSINESS_ID (ID_NUM,ID_TYPE) USING BTREE,
  KEY INDEX_I_FAL_NORMAL (BUSINESS_STATES,REPORT_MESSAGE_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='120-家族关系信息记录';

-- ----------------------------
-- Table structure for i_in_fal_mmbs_inf_hist
-- ----------------------------
DROP TABLE IF EXISTS i_in_fal_mmbs_inf_hist;
CREATE TABLE i_in_fal_mmbs_inf_hist (
  PAJ_IN_FAL_MMBS_INF_ID char(32) NOT NULL COMMENT '主键',
  INF_REC_TYPE varchar(3) DEFAULT NULL COMMENT '信息记录类型',
  NAME varchar(30) DEFAULT NULL COMMENT 'A姓名',
  ID_TYPE varchar(2) DEFAULT NULL COMMENT 'A证件类型',
  ID_NUM varchar(20) DEFAULT NULL COMMENT 'A证件号码',
  FAM_MEM_NAME varchar(30) DEFAULT NULL COMMENT 'B姓名',
  FAM_MEM_CERT_TYPE varchar(2) DEFAULT NULL COMMENT 'B证件类型',
  FAM_MEM_CERT_NUM varchar(20) DEFAULT NULL COMMENT 'B证件号码',
  FAM_REL varchar(1) DEFAULT NULL COMMENT '家族关系',
  FAM_RELA_ASS_FLAG varchar(1) DEFAULT NULL COMMENT '家族关系有效标志',
  INF_SURC_CODE varchar(20) DEFAULT NULL COMMENT '信息来源编码',
  RPT_DATE char(10) DEFAULT NULL COMMENT '信息报告日期',
  LAST_UPDATE_TIME varchar(10) DEFAULT NULL COMMENT '最后更新时间',
  OPERATOR_USER varchar(50) DEFAULT NULL COMMENT '操作员',
  ORG_NAME varchar(100) DEFAULT NULL COMMENT '数据来源机构名称',
  ORG_CODE varchar(100) DEFAULT NULL COMMENT '数据来源机构编号',
  BUSINESS_STATES varchar(50) DEFAULT NULL COMMENT '数据状态',
  REJECT_REASON varchar(255) DEFAULT NULL COMMENT '驳回原因',
  IS_FILTER char(1) DEFAULT NULL COMMENT '是否过滤标识(默认为N-不过滤)',
  REPORT_MESSAGE_ID varchar(60) DEFAULT NULL COMMENT '报文文件ID',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  REPORT_FILE_COLNUM varchar(7) DEFAULT NULL COMMENT '在报文文件中的行数',
  KEY INDEX_I_FAL_BUSINESS_ID_HIST (ID_NUM,ID_TYPE) USING BTREE,
  KEY INDEX_I_FAL_NORMAL_HIST (REPORT_MESSAGE_ID,BUSINESS_STATES) USING BTREE,
  KEY INDEX_PAJ_FAL_MMBS_HIST (PAJ_IN_FAL_MMBS_INF_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='120-家族关系信息记录';

-- ----------------------------
-- Table structure for i_in_fal_mmbs_inf_middle
-- ----------------------------
DROP TABLE IF EXISTS i_in_fal_mmbs_inf_middle;
CREATE TABLE i_in_fal_mmbs_inf_middle (
  ID_TYPE varchar(36) NOT NULL COMMENT '证件类型',
  ID_NUM varchar(60) NOT NULL COMMENT '证件号码',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='120-家族关系信息记录中间表';

-- ----------------------------
-- Table structure for i_in_id_efct_inf
-- ----------------------------
DROP TABLE IF EXISTS i_in_id_efct_inf;
CREATE TABLE i_in_id_efct_inf (
  PAK_IN_ID_EFCT_INF_ID char(32) NOT NULL COMMENT '主键',
  INF_REC_TYPE varchar(3) DEFAULT NULL COMMENT '信息记录类型',
  NAME varchar(30) DEFAULT NULL COMMENT '姓名',
  ID_TYPE varchar(2) DEFAULT NULL COMMENT '证件类型',
  ID_NUM varchar(20) DEFAULT NULL COMMENT '证件号码',
  INF_SURC_CODE varchar(20) DEFAULT NULL COMMENT '信息来源编码',
  ID_EFCT_DATE varchar(10) DEFAULT NULL COMMENT '证件有效期起始日期',
  ID_DUE_DATE varchar(10) DEFAULT NULL COMMENT '证件有效期终止日期',
  ID_ORG_NAME varchar(80) DEFAULT NULL COMMENT '证件签发机关名称',
  ID_DIST varchar(6) DEFAULT NULL COMMENT '证件签发机关所在地行政区划',
  CIMOC varchar(14) DEFAULT NULL COMMENT '客户资料维护机构代码',
  RPT_DATE char(10) DEFAULT NULL COMMENT '信息报告日期',
  LAST_UPDATE_TIME varchar(10) DEFAULT NULL COMMENT '最后更新时间',
  OPERATOR_USER varchar(50) DEFAULT NULL COMMENT '操作员',
  ORG_NAME varchar(100) DEFAULT NULL COMMENT '数据来源机构名称',
  ORG_CODE varchar(100) DEFAULT NULL COMMENT '数据来源机构编号',
  BUSINESS_STATES varchar(50) DEFAULT NULL COMMENT '数据状态',
  REJECT_REASON varchar(255) DEFAULT NULL COMMENT '驳回原因',
  IS_FILTER char(1) DEFAULT NULL COMMENT '是否过滤标识(默认为N-不过滤)',
  REPORT_MESSAGE_ID varchar(60) DEFAULT NULL COMMENT '报文文件ID',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  REPORT_FILE_COLNUM varchar(7) DEFAULT NULL COMMENT '在报文文件中的行数',
  KEY INDEX_I_IDEFCT_BUSINESS (ID_NUM,ID_TYPE) USING BTREE,
  KEY INDEX_I_IDEFCT_NORMAL (REPORT_MESSAGE_ID,BUSINESS_STATES) USING BTREE,
  KEY INDEX_PAK_ID_EFCT (PAK_IN_ID_EFCT_INF_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='130-个人证件有效期信息记录';

-- ----------------------------
-- Table structure for i_in_id_efct_inf_dlt
-- ----------------------------
DROP TABLE IF EXISTS i_in_id_efct_inf_dlt;
CREATE TABLE i_in_id_efct_inf_dlt (
  PAZ_IN_ID_EFCT_INF_DLT_ID char(32) NOT NULL COMMENT '主键',
  INF_REC_TYPE varchar(3) DEFAULT NULL COMMENT '信息记录类型',
  NAME varchar(30) DEFAULT NULL COMMENT '姓名',
  ID_TYPE varchar(2) DEFAULT NULL COMMENT '证件类型',
  ID_NUM varchar(20) DEFAULT NULL COMMENT '证件号码',
  INF_SURC_CODE varchar(20) DEFAULT NULL COMMENT '信息来源编码',
  LAST_UPDATE_TIME varchar(10) DEFAULT NULL COMMENT '最后更新时间',
  OPERATOR_USER varchar(50) DEFAULT NULL COMMENT '操作员',
  ORG_NAME varchar(100) DEFAULT NULL COMMENT '数据来源机构名称',
  ORG_CODE varchar(100) DEFAULT NULL COMMENT '数据来源机构编号',
  BUSINESS_STATES varchar(50) DEFAULT NULL COMMENT '数据状态',
  REJECT_REASON varchar(255) DEFAULT NULL COMMENT '驳回原因',
  IS_FILTER char(1) DEFAULT NULL COMMENT '是否过滤标识(默认为N-不过滤)',
  REPORT_MESSAGE_ID varchar(60) DEFAULT NULL COMMENT '报文文件ID',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  REPORT_FILE_COLNUM varchar(7) DEFAULT NULL COMMENT '在报文文件中的行数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='134-个人证件有效期信息整笔删除请求记录';

-- ----------------------------
-- Table structure for i_in_id_efct_inf_dlt_hist
-- ----------------------------
DROP TABLE IF EXISTS i_in_id_efct_inf_dlt_hist;
CREATE TABLE i_in_id_efct_inf_dlt_hist (
  PAZ_IN_ID_EFCT_INF_DLT_ID char(32) NOT NULL COMMENT '主键',
  INF_REC_TYPE varchar(3) DEFAULT NULL COMMENT '信息记录类型',
  NAME varchar(30) DEFAULT NULL COMMENT '姓名',
  ID_TYPE varchar(2) DEFAULT NULL COMMENT '证件类型',
  ID_NUM varchar(20) DEFAULT NULL COMMENT '证件号码',
  INF_SURC_CODE varchar(20) DEFAULT NULL COMMENT '信息来源编码',
  LAST_UPDATE_TIME varchar(10) DEFAULT NULL COMMENT '最后更新时间',
  OPERATOR_USER varchar(50) DEFAULT NULL COMMENT '操作员',
  ORG_NAME varchar(100) DEFAULT NULL COMMENT '数据来源机构名称',
  ORG_CODE varchar(100) DEFAULT NULL COMMENT '数据来源机构编号',
  BUSINESS_STATES varchar(50) DEFAULT NULL COMMENT '数据状态',
  REJECT_REASON varchar(255) DEFAULT NULL COMMENT '驳回原因',
  IS_FILTER char(1) DEFAULT NULL COMMENT '是否过滤标识(默认为N-不过滤)',
  REPORT_MESSAGE_ID varchar(60) DEFAULT NULL COMMENT '报文文件ID',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  REPORT_FILE_COLNUM varchar(7) DEFAULT NULL COMMENT '在报文文件中的行数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='134-个人证件有效期信息整笔删除请求记录';

-- ----------------------------
-- Table structure for i_in_id_efct_inf_hist
-- ----------------------------
DROP TABLE IF EXISTS i_in_id_efct_inf_hist;
CREATE TABLE i_in_id_efct_inf_hist (
  PAK_IN_ID_EFCT_INF_ID char(32) NOT NULL COMMENT '主键',
  INF_REC_TYPE varchar(3) DEFAULT NULL COMMENT '信息记录类型',
  NAME varchar(30) DEFAULT NULL COMMENT '姓名',
  ID_TYPE varchar(2) DEFAULT NULL COMMENT '证件类型',
  ID_NUM varchar(20) DEFAULT NULL COMMENT '证件号码',
  INF_SURC_CODE varchar(20) DEFAULT NULL COMMENT '信息来源编码',
  ID_EFCT_DATE varchar(10) DEFAULT NULL COMMENT '证件有效期起始日期',
  ID_DUE_DATE varchar(10) DEFAULT NULL COMMENT '证件有效期终止日期',
  ID_ORG_NAME varchar(80) DEFAULT NULL COMMENT '证件签发机关名称',
  ID_DIST varchar(6) DEFAULT NULL COMMENT '证件签发机关所在地行政区划',
  CIMOC varchar(14) DEFAULT NULL COMMENT '客户资料维护机构代码',
  RPT_DATE char(10) DEFAULT NULL COMMENT '信息报告日期',
  LAST_UPDATE_TIME varchar(10) DEFAULT NULL COMMENT '最后更新时间',
  OPERATOR_USER varchar(50) DEFAULT NULL COMMENT '操作员',
  ORG_NAME varchar(100) DEFAULT NULL COMMENT '数据来源机构名称',
  ORG_CODE varchar(100) DEFAULT NULL COMMENT '数据来源机构编号',
  BUSINESS_STATES varchar(50) DEFAULT NULL COMMENT '数据状态',
  REJECT_REASON varchar(255) DEFAULT NULL COMMENT '驳回原因',
  IS_FILTER char(1) DEFAULT NULL COMMENT '是否过滤标识(默认为N-不过滤)',
  REPORT_MESSAGE_ID varchar(60) DEFAULT NULL COMMENT '报文文件ID',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  REPORT_FILE_COLNUM varchar(7) DEFAULT NULL COMMENT '在报文文件中的行数',
  KEY INDEX_I_IDEFCT_BUSINESS_HIST (ID_NUM,ID_TYPE) USING BTREE,
  KEY INDEX_I_IDEFCT_NORMAL_HIST (REPORT_MESSAGE_ID,BUSINESS_STATES) USING BTREE,
  KEY INDEX_PAK_ID_EFCT_HIST (PAK_IN_ID_EFCT_INF_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='130-个人证件有效期信息记录';

-- ----------------------------
-- Table structure for i_in_id_efct_inf_middle
-- ----------------------------
DROP TABLE IF EXISTS i_in_id_efct_inf_middle;
CREATE TABLE i_in_id_efct_inf_middle (
  ID_TYPE varchar(36) NOT NULL COMMENT '证件类型',
  ID_NUM varchar(60) NOT NULL COMMENT '证件号码',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='130-个人证件有效期信息记录中间表';

-- ----------------------------
-- Table structure for i_in_mdfc
-- ----------------------------
DROP TABLE IF EXISTS i_in_mdfc;
CREATE TABLE i_in_mdfc (
  PBY_IN_MDFC_ID char(32) NOT NULL COMMENT '主键',
  INF_REC_TYPE varchar(3) DEFAULT NULL COMMENT '信息记录类型',
  ACCT_TYPE varchar(2) DEFAULT NULL COMMENT '账户类型',
  UPDATE_REC_CODE varchar(60) DEFAULT NULL COMMENT '待更正业务标识码',
  UPDATE_SGMT_CODE varchar(1) DEFAULT NULL COMMENT '待更正段段标',
  UPDATE_START_DATE varchar(10) DEFAULT NULL COMMENT '待更正起始日期',
  UPDATE_END_DATE varchar(10) DEFAULT NULL COMMENT '待更正结束日期',
  LAST_UPDATE_TIME varchar(10) DEFAULT NULL COMMENT '最后更新时间',
  OPERATOR_USER varchar(50) DEFAULT NULL COMMENT '操作员',
  ORG_NAME varchar(100) DEFAULT NULL COMMENT '数据来源机构名称',
  ORG_CODE varchar(100) DEFAULT NULL COMMENT '数据来源机构编号',
  BUSINESS_STATES varchar(50) DEFAULT NULL COMMENT '数据状态',
  REJECT_REASON varchar(255) DEFAULT NULL COMMENT '驳回原因',
  IS_FILTER char(1) DEFAULT NULL COMMENT '是否过滤标识(默认为N-不过滤)',
  REPORT_MESSAGE_ID varchar(60) DEFAULT NULL COMMENT '报文文件ID',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  NAME varchar(30) DEFAULT NULL COMMENT '姓名(当INF_REC_TYPE 为211是该字段为借贷人姓名，221为授信人姓名，231为担保人姓名)',
  ID_TYPE varchar(2) DEFAULT NULL COMMENT '证件类型(当INF_REC_TYPE 为211是该字段为借贷人证件类型，221为授信人证件类型，231为担保人证件类型)',
  ID_NUM varchar(20) DEFAULT NULL COMMENT '证件号码(当INF_REC_TYPE 为211是该字段为借贷人证件号码，221为授信人证件号码，231为担保人证件号码)',
  COMPANY varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='按段更正请求记录表';

-- ----------------------------
-- Table structure for i_in_mdfc_hist
-- ----------------------------
DROP TABLE IF EXISTS i_in_mdfc_hist;
CREATE TABLE i_in_mdfc_hist (
  PBY_IN_MDFC_ID char(32) NOT NULL COMMENT '主键',
  INF_REC_TYPE varchar(3) DEFAULT NULL COMMENT '信息记录类型',
  ACCT_TYPE varchar(2) DEFAULT NULL COMMENT '账户类型',
  UPDATE_REC_CODE varchar(60) DEFAULT NULL COMMENT '待更正业务标识码',
  UPDATE_SGMT_CODE varchar(1) DEFAULT NULL COMMENT '待更正段段标',
  UPDATE_START_DATE varchar(10) DEFAULT NULL COMMENT '待更正起始日期',
  UPDATE_END_DATE varchar(10) DEFAULT NULL COMMENT '待更正结束日期',
  LAST_UPDATE_TIME varchar(10) DEFAULT NULL COMMENT '最后更新时间',
  OPERATOR_USER varchar(50) DEFAULT NULL COMMENT '操作员',
  ORG_NAME varchar(100) DEFAULT NULL COMMENT '数据来源机构名称',
  ORG_CODE varchar(100) DEFAULT NULL COMMENT '数据来源机构编号',
  BUSINESS_STATES varchar(50) DEFAULT NULL COMMENT '数据状态',
  REJECT_REASON varchar(255) DEFAULT NULL COMMENT '驳回原因',
  IS_FILTER char(1) DEFAULT NULL COMMENT '是否过滤标识(默认为N-不过滤)',
  REPORT_MESSAGE_ID varchar(60) DEFAULT NULL COMMENT '报文文件ID',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  NAME varchar(30) DEFAULT NULL COMMENT '姓名(当INF_REC_TYPE 为211是该字段为借贷人姓名，221为授信人姓名，231为担保人姓名)',
  ID_TYPE varchar(2) DEFAULT NULL COMMENT '证件类型(当INF_REC_TYPE 为211是该字段为借贷人证件类型，221为授信人证件类型，231为担保人证件类型)',
  ID_NUM varchar(20) DEFAULT NULL COMMENT '证件号码(当INF_REC_TYPE 为211是该字段为借贷人证件号码，221为授信人证件号码，231为担保人证件号码)',
  COMPANY varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='按段更正请求记录表';

-- ----------------------------
-- Table structure for i_in_sec_acct_del
-- ----------------------------
DROP TABLE IF EXISTS i_in_sec_acct_del;
CREATE TABLE i_in_sec_acct_del (
  PDY_IN_SEC_ACCT_DEL_ID char(32) NOT NULL COMMENT '主键',
  INF_REC_TYPE varchar(3) DEFAULT NULL COMMENT '信息记录类型',
  ACCT_TYPE varchar(2) DEFAULT NULL COMMENT '账户类型',
  DEL_REC_CODE varchar(60) DEFAULT NULL COMMENT '待删除业务标码',
  DEL_SGMT_CODE varchar(1) DEFAULT NULL COMMENT '待删除段段标',
  DEL_START_DATE varchar(10) DEFAULT NULL COMMENT '待删除起始日期',
  DEL_END_DATE varchar(10) DEFAULT NULL COMMENT '待删除结束日期',
  LAST_UPDATE_TIME varchar(10) DEFAULT NULL COMMENT '最后更新时间',
  OPERATOR_USER varchar(50) DEFAULT NULL COMMENT '操作员',
  ORG_NAME varchar(100) DEFAULT NULL COMMENT '数据来源机构名称',
  ORG_CODE varchar(100) DEFAULT NULL COMMENT '数据来源机构编号',
  BUSINESS_STATES varchar(50) DEFAULT NULL COMMENT '数据状态',
  REJECT_REASON varchar(255) DEFAULT NULL COMMENT '驳回原因',
  IS_FILTER char(1) DEFAULT NULL COMMENT '是否过滤标识(默认为N-不过滤)',
  REPORT_MESSAGE_ID varchar(60) DEFAULT NULL COMMENT '报文文件ID',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  NAME varchar(30) DEFAULT NULL COMMENT '债务人姓名',
  ID_TYPE varchar(2) DEFAULT NULL COMMENT '债务人证件类型',
  ID_NUM varchar(20) DEFAULT NULL COMMENT '债务人证件号码',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  REPORT_FILE_COLNUM varchar(7) DEFAULT NULL COMMENT '在报文文件中的行数',
  KEY INDEX_I_SECATDEL_NORMAL (BUSINESS_STATES,REPORT_MESSAGE_ID) USING BTREE,
  KEY INDEX_PDY_SEC_ACCT_DEL (PDY_IN_SEC_ACCT_DEL_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='233-个人担保账户按段删除请求记录';

-- ----------------------------
-- Table structure for i_in_sec_acct_del_hist
-- ----------------------------
DROP TABLE IF EXISTS i_in_sec_acct_del_hist;
CREATE TABLE i_in_sec_acct_del_hist (
  PDY_IN_SEC_ACCT_DEL_ID char(32) NOT NULL COMMENT '主键',
  INF_REC_TYPE varchar(3) DEFAULT NULL COMMENT '信息记录类型',
  ACCT_TYPE varchar(2) DEFAULT NULL COMMENT '账户类型',
  DEL_REC_CODE varchar(60) DEFAULT NULL COMMENT '待删除业务标码',
  DEL_SGMT_CODE varchar(1) DEFAULT NULL COMMENT '待删除段段标',
  DEL_START_DATE varchar(10) DEFAULT NULL COMMENT '待删除起始日期',
  DEL_END_DATE varchar(10) DEFAULT NULL COMMENT '待删除结束日期',
  LAST_UPDATE_TIME varchar(10) DEFAULT NULL COMMENT '最后更新时间',
  OPERATOR_USER varchar(50) DEFAULT NULL COMMENT '操作员',
  ORG_NAME varchar(100) DEFAULT NULL COMMENT '数据来源机构名称',
  ORG_CODE varchar(100) DEFAULT NULL COMMENT '数据来源机构编号',
  BUSINESS_STATES varchar(50) DEFAULT NULL COMMENT '数据状态',
  REJECT_REASON varchar(255) DEFAULT NULL COMMENT '驳回原因',
  IS_FILTER char(1) DEFAULT NULL COMMENT '是否过滤标识(默认为N-不过滤)',
  REPORT_MESSAGE_ID varchar(60) DEFAULT NULL COMMENT '报文文件ID',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  NAME varchar(30) DEFAULT NULL COMMENT '债务人姓名',
  ID_TYPE varchar(2) DEFAULT NULL COMMENT '债务人证件类型',
  ID_NUM varchar(20) DEFAULT NULL COMMENT '债务人证件号码',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  REPORT_FILE_COLNUM varchar(7) DEFAULT NULL COMMENT '在报文文件中的行数',
  KEY INDEX_I_SECATDEL_NORMAL_HIST (BUSINESS_STATES,REPORT_MESSAGE_ID) USING BTREE,
  KEY INDEX_PDY_SEC_ACCT_DEL_HIST (PDY_IN_SEC_ACCT_DEL_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='233-个人担保账户按段删除请求记录';

-- ----------------------------
-- Table structure for i_in_sec_acct_ent_del
-- ----------------------------
DROP TABLE IF EXISTS i_in_sec_acct_ent_del;
CREATE TABLE i_in_sec_acct_ent_del (
  PDZ_IN_SEC_ACCT_ENT_DEL_ID char(32) NOT NULL COMMENT '主键',
  INF_REC_TYPE varchar(3) DEFAULT NULL COMMENT '信息记录类型',
  ACCT_TYPE varchar(2) DEFAULT NULL COMMENT '账户类型',
  DEL_REC_CODE varchar(60) DEFAULT NULL COMMENT '待删除业务标识码',
  LAST_UPDATE_TIME varchar(10) DEFAULT NULL COMMENT '最后更新时间',
  OPERATOR_USER varchar(50) DEFAULT NULL COMMENT '操作员',
  ORG_NAME varchar(100) DEFAULT NULL COMMENT '数据来源机构名称',
  ORG_CODE varchar(100) DEFAULT NULL COMMENT '数据来源机构编号',
  BUSINESS_STATES varchar(50) DEFAULT NULL COMMENT '数据状态',
  REJECT_REASON varchar(255) DEFAULT NULL COMMENT '驳回原因',
  IS_FILTER char(1) DEFAULT NULL COMMENT '是否过滤标识(默认为N-不过滤)',
  REPORT_MESSAGE_ID varchar(60) DEFAULT NULL COMMENT '报文文件ID',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  NAME varchar(30) DEFAULT NULL COMMENT '债务人姓名',
  ID_TYPE varchar(2) DEFAULT NULL COMMENT '债务人证件类型',
  ID_NUM varchar(20) DEFAULT NULL COMMENT '债务人证件号码',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  REPORT_FILE_COLNUM varchar(7) DEFAULT NULL COMMENT '在报文文件中的行数',
  KEY INDEX_I_SECENTDEL_NORMAL (BUSINESS_STATES,REPORT_MESSAGE_ID) USING BTREE,
  KEY INDEX_PDZ_SEC_ENT_DEL (PDZ_IN_SEC_ACCT_ENT_DEL_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='234-个人担保账户整笔删除请求记录';

-- ----------------------------
-- Table structure for i_in_sec_acct_ent_del_hist
-- ----------------------------
DROP TABLE IF EXISTS i_in_sec_acct_ent_del_hist;
CREATE TABLE i_in_sec_acct_ent_del_hist (
  PDZ_IN_SEC_ACCT_ENT_DEL_ID char(32) NOT NULL COMMENT '主键',
  INF_REC_TYPE varchar(3) DEFAULT NULL COMMENT '信息记录类型',
  ACCT_TYPE varchar(2) DEFAULT NULL COMMENT '账户类型',
  DEL_REC_CODE varchar(60) DEFAULT NULL COMMENT '待删除业务标识码',
  LAST_UPDATE_TIME varchar(10) DEFAULT NULL COMMENT '最后更新时间',
  OPERATOR_USER varchar(50) DEFAULT NULL COMMENT '操作员',
  ORG_NAME varchar(100) DEFAULT NULL COMMENT '数据来源机构名称',
  ORG_CODE varchar(100) DEFAULT NULL COMMENT '数据来源机构编号',
  BUSINESS_STATES varchar(50) DEFAULT NULL COMMENT '数据状态',
  REJECT_REASON varchar(255) DEFAULT NULL COMMENT '驳回原因',
  IS_FILTER char(1) DEFAULT NULL COMMENT '是否过滤标识(默认为N-不过滤)',
  REPORT_MESSAGE_ID varchar(60) DEFAULT NULL COMMENT '报文文件ID',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  NAME varchar(30) DEFAULT NULL COMMENT '债务人姓名',
  ID_TYPE varchar(2) DEFAULT NULL COMMENT '债务人证件类型',
  ID_NUM varchar(20) DEFAULT NULL COMMENT '债务人证件号码',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  REPORT_FILE_COLNUM varchar(7) DEFAULT NULL COMMENT '在报文文件中的行数',
  KEY INDEX_I_SECENTDEL_NORMAL_HIST (BUSINESS_STATES,REPORT_MESSAGE_ID) USING BTREE,
  KEY INDEX_PDZ_SEC_ENT_DEL_HIST (PDZ_IN_SEC_ACCT_ENT_DEL_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='234-个人担保账户整笔删除请求记录';

-- ----------------------------
-- Table structure for i_in_spc_evt_dsc_inf
-- ----------------------------
DROP TABLE IF EXISTS i_in_spc_evt_dsc_inf;
CREATE TABLE i_in_spc_evt_dsc_inf (
  PBK_IN_SPC_EVT_DSC_INF_ID char(32) NOT NULL COMMENT '主键',
  INF_REC_TYPE varchar(3) DEFAULT NULL COMMENT '信息记录类型',
  ACCT_TYPE varchar(2) DEFAULT NULL COMMENT '账户类型',
  ACCT_CODE varchar(60) DEFAULT NULL COMMENT '账户标识码',
  OPETN_TYPE varchar(2) DEFAULT NULL COMMENT '事件类型',
  MONTH varchar(7) DEFAULT NULL COMMENT '发生月份',
  FLAG varchar(1) DEFAULT NULL COMMENT '生效标志',
  RPT_DATE char(10) DEFAULT NULL COMMENT '信息报告日期',
  LAST_UPDATE_TIME varchar(10) DEFAULT NULL COMMENT '最后更新时间',
  OPERATOR_USER varchar(50) DEFAULT NULL COMMENT '操作员',
  ORG_NAME varchar(100) DEFAULT NULL COMMENT '数据来源机构名称',
  ORG_CODE varchar(100) DEFAULT NULL COMMENT '数据来源机构编号',
  BUSINESS_STATES varchar(50) DEFAULT NULL COMMENT '数据状态',
  REJECT_REASON varchar(255) DEFAULT NULL COMMENT '驳回原因',
  IS_FILTER char(1) DEFAULT NULL COMMENT '是否过滤标识(默认为N-不过滤)',
  REPORT_MESSAGE_ID varchar(60) DEFAULT NULL COMMENT '报文文件ID',
  NAME varchar(30) DEFAULT NULL COMMENT '借款人姓名',
  ID_TYPE varchar(2) DEFAULT NULL COMMENT '借款人证件类型',
  ID_NUM varchar(20) DEFAULT NULL COMMENT '借款人证件号码',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  REPORT_FILE_COLNUM varchar(7) DEFAULT NULL COMMENT '在报文文件中的行数',
  UNIQUE KEY INDEX_PBK_SPC_EVT (PBK_IN_SPC_EVT_DSC_INF_ID) USING BTREE,
  KEY INDEX_I_SPCEVT_NORMAL (BUSINESS_STATES,REPORT_MESSAGE_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='215-个人借贷账户特殊事件说明记录';

-- ----------------------------
-- Table structure for i_in_spc_evt_dsc_inf_hist
-- ----------------------------
DROP TABLE IF EXISTS i_in_spc_evt_dsc_inf_hist;
CREATE TABLE i_in_spc_evt_dsc_inf_hist (
  PBK_IN_SPC_EVT_DSC_INF_ID char(32) NOT NULL COMMENT '主键',
  INF_REC_TYPE varchar(3) DEFAULT NULL COMMENT '信息记录类型',
  ACCT_TYPE varchar(2) DEFAULT NULL COMMENT '账户类型',
  ACCT_CODE varchar(60) DEFAULT NULL COMMENT '账户标识码',
  OPETN_TYPE varchar(2) DEFAULT NULL COMMENT '事件类型',
  MONTH varchar(7) DEFAULT NULL COMMENT '发生月份',
  FLAG varchar(1) DEFAULT NULL COMMENT '生效标志',
  RPT_DATE char(10) DEFAULT NULL COMMENT '信息报告日期',
  LAST_UPDATE_TIME varchar(10) DEFAULT NULL COMMENT '最后更新时间',
  OPERATOR_USER varchar(50) DEFAULT NULL COMMENT '操作员',
  ORG_NAME varchar(100) DEFAULT NULL COMMENT '数据来源机构名称',
  ORG_CODE varchar(100) DEFAULT NULL COMMENT '数据来源机构编号',
  BUSINESS_STATES varchar(50) DEFAULT NULL COMMENT '数据状态',
  REJECT_REASON varchar(255) DEFAULT NULL COMMENT '驳回原因',
  IS_FILTER char(1) DEFAULT NULL COMMENT '是否过滤标识(默认为N-不过滤)',
  REPORT_MESSAGE_ID varchar(60) DEFAULT NULL COMMENT '报文文件ID',
  NAME varchar(30) DEFAULT NULL COMMENT '借款人姓名',
  ID_TYPE varchar(2) DEFAULT NULL COMMENT '借款人证件类型',
  ID_NUM varchar(20) DEFAULT NULL COMMENT '借款人证件号码',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  REPORT_FILE_COLNUM varchar(7) DEFAULT NULL COMMENT '在报文文件中的行数',
  KEY INDEX_I_SPCEVT_NORMAL_HIST (BUSINESS_STATES,REPORT_MESSAGE_ID) USING BTREE,
  KEY INDEX_PBK_SPC_EVT_HIST (PBK_IN_SPC_EVT_DSC_INF_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='215-个人借贷账户特殊事件说明记录';

-- ----------------------------
-- Table structure for i_in_spc_evt_dsc_inf_middle
-- ----------------------------
DROP TABLE IF EXISTS i_in_spc_evt_dsc_inf_middle;
CREATE TABLE i_in_spc_evt_dsc_inf_middle (
  ACCT_TYPE varchar(36) NOT NULL COMMENT '账户类型',
  ACCT_CODE varchar(60) NOT NULL COMMENT '账户标识码',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='215-个人借贷账户特殊事件说明记录中间表';

-- ----------------------------
-- Table structure for i_loan_rlt_repymt_inf
-- ----------------------------
DROP TABLE IF EXISTS i_loan_rlt_repymt_inf;
CREATE TABLE i_loan_rlt_repymt_inf (
  PBC_RLT_REPYMT_INF_SGMT_ID char(32) NOT NULL COMMENT '主键',
  INFO_ID_TYPE varchar(1) DEFAULT NULL COMMENT '身份类别',
  ARLP_NAME varchar(80) DEFAULT NULL COMMENT '责任人名称',
  ARLP_CERT_TYPE varchar(2) DEFAULT NULL COMMENT '责任人身份标识类型',
  ARLP_CERT_NUM varchar(40) DEFAULT NULL COMMENT '责任人身份标识号码',
  ARLP_TYPE varchar(1) DEFAULT NULL COMMENT '还款责任人类型',
  ARLP_AMT varchar(15) DEFAULT NULL COMMENT '还款责任金额',
  WARTY_SIGN varchar(1) DEFAULT NULL COMMENT '联保标志',
  MAX_GUAR_MCC varchar(60) DEFAULT NULL COMMENT '保证合同编号',
  PBA_ACCT_BS_SGMT_ID char(32) NOT NULL COMMENT '数据外键',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  RPT_FLAG varchar(1) DEFAULT NULL COMMENT '1:t+1;2:t+2',
  CUST_NUM varchar(60) DEFAULT NULL COMMENT '客户号',
  ACCT_NUM varchar(60) DEFAULT NULL COMMENT '账户号',
  DATA_DATE varchar(20) DEFAULT NULL COMMENT '数据日期',
  KEY INDEX_PBA_ACCT_RLT (PBA_ACCT_BS_SGMT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='210-个人借贷账户信息记录相关还款责任人段';

-- ----------------------------
-- Table structure for i_loan_rlt_repymt_inf_hist
-- ----------------------------
DROP TABLE IF EXISTS i_loan_rlt_repymt_inf_hist;
CREATE TABLE i_loan_rlt_repymt_inf_hist (
  PBC_RLT_REPYMT_INF_SGMT_ID char(32) NOT NULL COMMENT '主键',
  INFO_ID_TYPE varchar(1) DEFAULT NULL COMMENT '身份类别',
  ARLP_NAME varchar(80) DEFAULT NULL COMMENT '责任人名称',
  ARLP_CERT_TYPE varchar(2) DEFAULT NULL COMMENT '责任人身份标识类型',
  ARLP_CERT_NUM varchar(40) DEFAULT NULL COMMENT '责任人身份标识号码',
  ARLP_TYPE varchar(1) DEFAULT NULL COMMENT '还款责任人类型',
  ARLP_AMT varchar(15) DEFAULT NULL COMMENT '还款责任金额',
  WARTY_SIGN varchar(1) DEFAULT NULL COMMENT '联保标志',
  MAX_GUAR_MCC varchar(60) DEFAULT NULL COMMENT '保证合同编号',
  PBA_ACCT_BS_SGMT_ID char(32) NOT NULL COMMENT '数据外键',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  RPT_FLAG varchar(1) DEFAULT NULL COMMENT '1:t+1;2:t+2',
  CUST_NUM varchar(60) DEFAULT NULL COMMENT '客户号',
  ACCT_NUM varchar(60) DEFAULT NULL COMMENT '账户号',
  DATA_DATE varchar(20) DEFAULT NULL COMMENT '数据日期',
  KEY INDEX_PBA_ACCT_RLT_HIST (PBA_ACCT_BS_SGMT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='210-个人借贷账户信息记录相关还款责任人段';

-- ----------------------------
-- Table structure for i_mcc_inf
-- ----------------------------
DROP TABLE IF EXISTS i_mcc_inf;
CREATE TABLE i_mcc_inf (
  PBD_MCC_INF_SGMT_ID char(32) DEFAULT NULL COMMENT '主键',
  CCC varchar(60) DEFAULT NULL COMMENT '抵（质）押合同标识码',
  PBA_ACCT_BS_SGMT_ID char(32) DEFAULT NULL COMMENT '数据外键',
  RPT_DATE varchar(10) DEFAULT NULL COMMENT '报送日期',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  RPT_FLAG varchar(1) DEFAULT NULL COMMENT '1:t+1;2:t+2',
  CUST_NUM varchar(60) DEFAULT NULL COMMENT '客户号',
  ACCT_NUM varchar(60) DEFAULT NULL COMMENT '账户号',
  DATA_DATE varchar(20) DEFAULT NULL COMMENT '数据日期',
  KEY INDEX_PBA_ACCT_MCC (PBA_ACCT_BS_SGMT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='210-个人借贷账户信息记录抵质押物信息段';

-- ----------------------------
-- Table structure for i_mcc_inf_hist
-- ----------------------------
DROP TABLE IF EXISTS i_mcc_inf_hist;
CREATE TABLE i_mcc_inf_hist (
  PBD_MCC_INF_SGMT_ID char(32) NOT NULL COMMENT '主键',
  CCC varchar(60) DEFAULT NULL COMMENT '抵（质）押合同标识码',
  PBA_ACCT_BS_SGMT_ID char(32) NOT NULL COMMENT '数据外键',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  RPT_FLAG varchar(1) DEFAULT NULL COMMENT '1:t+1;2:t+2',
  CUST_NUM varchar(60) DEFAULT NULL COMMENT '客户号',
  ACCT_NUM varchar(60) DEFAULT NULL COMMENT '账户号',
  DATA_DATE varchar(20) DEFAULT NULL COMMENT '数据日期',
  KEY INDEX_PBA_ACCT_MCC_HIST (PBA_ACCT_BS_SGMT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='210-个人借贷账户信息记录抵质押物信息段';

-- ----------------------------
-- Table structure for i_mlg_inf
-- ----------------------------
DROP TABLE IF EXISTS i_mlg_inf;
CREATE TABLE i_mlg_inf (
  PAG_MLG_INF_SGMT_ID char(32) NOT NULL COMMENT '主键',
  MAIL_ADDR varchar(100) DEFAULT NULL COMMENT '通讯地址',
  MAIL_PC varchar(6) DEFAULT NULL COMMENT '通讯地邮编',
  MAIL_DIST varchar(6) DEFAULT NULL COMMENT '通讯地行政区划',
  MLG_INFO_UP_DATE char(10) DEFAULT NULL COMMENT '信息更新日期',
  PAA_BS_SGMT_ID char(32) DEFAULT NULL COMMENT '数据外键',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  CUST_NUM varchar(60) DEFAULT NULL,
  DATA_DATE varchar(20) DEFAULT NULL,
  KEY INDEX_PAA_I_MLG_INF (PAA_BS_SGMT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='110-个人基本信息记录通讯地址段';

-- ----------------------------
-- Table structure for i_mlg_inf_20230710
-- ----------------------------
DROP TABLE IF EXISTS i_mlg_inf_20230710;
CREATE TABLE i_mlg_inf_20230710 (
  PAG_MLG_INF_SGMT_ID char(32) CHARACTER SET utf8mb4 NOT NULL COMMENT '主键',
  MAIL_ADDR varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '通讯地址',
  MAIL_PC varchar(6) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '通讯地邮编',
  MAIL_DIST varchar(6) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '通讯地行政区划',
  MLG_INFO_UP_DATE char(10) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '信息更新日期',
  PAA_BS_SGMT_ID char(32) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '数据外键',
  RPT_DATE char(10) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '报送日期',
  EXTEND1 varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  CUST_NUM varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL,
  DATA_DATE varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for i_mlg_inf_hist
-- ----------------------------
DROP TABLE IF EXISTS i_mlg_inf_hist;
CREATE TABLE i_mlg_inf_hist (
  PAG_MLG_INF_SGMT_ID char(32) NOT NULL COMMENT '主键',
  MAIL_ADDR varchar(100) DEFAULT NULL COMMENT '通讯地址',
  MAIL_PC varchar(6) DEFAULT NULL COMMENT '通讯地邮编',
  MAIL_DIST varchar(6) DEFAULT NULL COMMENT '通讯地行政区划',
  MLG_INFO_UP_DATE char(10) DEFAULT NULL COMMENT '信息更新日期',
  PAA_BS_SGMT_ID char(32) NOT NULL COMMENT '数据外键',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  CUST_NUM varchar(60) DEFAULT NULL,
  DATA_DATE varchar(20) DEFAULT NULL,
  KEY INDEX_PAA_I_MLG_INF_HIST (PAA_BS_SGMT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='110-个人基本信息记录通讯地址段';

-- ----------------------------
-- Table structure for i_octpn_inf
-- ----------------------------
DROP TABLE IF EXISTS i_octpn_inf;
CREATE TABLE i_octpn_inf (
  PAE_OCTPN_INF_SGMT_ID char(32) NOT NULL COMMENT '主键',
  EMP_STATUS varchar(2) DEFAULT NULL COMMENT '就业状况',
  CPN_NAME varchar(80) DEFAULT NULL COMMENT '单位名称',
  CPN_TYPE varchar(2) DEFAULT NULL COMMENT '单位性质',
  INDUSTRY varchar(1) DEFAULT NULL COMMENT '单位所属行业',
  CPN_ADDR varchar(100) DEFAULT NULL COMMENT '单位详细地址',
  CPN_PC varchar(6) DEFAULT NULL COMMENT '单位所在地邮编',
  CPN_DIST varchar(6) DEFAULT NULL COMMENT '单位所在地行政区划',
  CPN_T_E_L varchar(25) DEFAULT NULL COMMENT '单位电话',
  OCCUPATION varchar(1) DEFAULT NULL COMMENT '职业',
  TITLE varchar(1) DEFAULT NULL COMMENT '职务',
  TECH_TITLE varchar(1) DEFAULT NULL COMMENT '职称',
  WORK_START_DATE char(4) DEFAULT NULL COMMENT '本单位工作起始年份',
  OCTPN_INFO_UP_DATE char(10) DEFAULT NULL COMMENT '信息更新日期',
  PAA_BS_SGMT_ID char(32) DEFAULT NULL COMMENT '数据外键',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  CUST_NUM varchar(60) DEFAULT NULL,
  DATA_DATE varchar(20) DEFAULT NULL,
  KEY INDEX_PAA_I_OCTPN_INF (PAA_BS_SGMT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='110-个人基本信息记录职业信息段';

-- ----------------------------
-- Table structure for i_octpn_inf_hist
-- ----------------------------
DROP TABLE IF EXISTS i_octpn_inf_hist;
CREATE TABLE i_octpn_inf_hist (
  PAE_OCTPN_INF_SGMT_ID char(32) NOT NULL COMMENT '主键',
  EMP_STATUS varchar(2) DEFAULT NULL COMMENT '就业状况',
  CPN_NAME varchar(80) DEFAULT NULL COMMENT '单位名称',
  CPN_TYPE varchar(2) DEFAULT NULL COMMENT '单位性质',
  INDUSTRY varchar(1) DEFAULT NULL COMMENT '单位所属行业',
  CPN_ADDR varchar(100) DEFAULT NULL COMMENT '单位详细地址',
  CPN_PC varchar(6) DEFAULT NULL COMMENT '单位所在地邮编',
  CPN_DIST varchar(6) DEFAULT NULL COMMENT '单位所在地行政区划',
  CPN_T_E_L varchar(25) DEFAULT NULL COMMENT '单位电话',
  OCCUPATION varchar(1) DEFAULT NULL COMMENT '职业',
  TITLE varchar(1) DEFAULT NULL COMMENT '职务',
  TECH_TITLE varchar(1) DEFAULT NULL COMMENT '职称',
  WORK_START_DATE char(4) DEFAULT NULL COMMENT '本单位工作起始年份',
  OCTPN_INFO_UP_DATE char(10) DEFAULT NULL COMMENT '信息更新日期',
  PAA_BS_SGMT_ID char(32) NOT NULL COMMENT '数据外键',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  CUST_NUM varchar(60) DEFAULT NULL,
  DATA_DATE varchar(20) DEFAULT NULL,
  KEY INDEX_PAA_I_OCTPN_INF_HIST (PAA_BS_SGMT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='110-个人基本信息记录职业信息段';

-- ----------------------------
-- Table structure for i_oc_inf
-- ----------------------------
DROP TABLE IF EXISTS i_oc_inf;
CREATE TABLE i_oc_inf (
  PBF_OC_INF_SGMT_ID char(32) NOT NULL COMMENT '主键',
  INIT_CRED_NAME varchar(80) DEFAULT NULL COMMENT '初始债权人名称',
  INIT_CRED_ORG_NM varchar(18) DEFAULT NULL COMMENT '初始债权人机构代码',
  ORIG_DBT_CATE varchar(1) DEFAULT NULL COMMENT '原债务种类',
  INIT_RPY_STS varchar(1) DEFAULT NULL COMMENT '债权转移时的还款状态',
  PBA_ACCT_BS_SGMT_ID char(32) DEFAULT NULL COMMENT '数据外键',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  CUST_NUM varchar(60) DEFAULT NULL COMMENT '客户号',
  ACCT_NUM varchar(60) DEFAULT NULL COMMENT '账户号',
  DATA_DATE varchar(20) DEFAULT NULL COMMENT '数据日期',
  KEY INDEX_PBA_ACCT_OC (PBA_ACCT_BS_SGMT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='210-个人借贷账户信息记录初始债权说明段';

-- ----------------------------
-- Table structure for i_oc_inf_hist
-- ----------------------------
DROP TABLE IF EXISTS i_oc_inf_hist;
CREATE TABLE i_oc_inf_hist (
  PBF_OC_INF_SGMT_ID char(32) NOT NULL COMMENT '主键',
  INIT_CRED_NAME varchar(80) DEFAULT NULL COMMENT '初始债权人名称',
  INIT_CRED_ORG_NM varchar(18) DEFAULT NULL COMMENT '初始债权人机构代码',
  ORIG_DBT_CATE varchar(1) DEFAULT NULL COMMENT '原债务种类',
  INIT_RPY_STS varchar(1) DEFAULT NULL COMMENT '债权转移时的还款状态',
  PBA_ACCT_BS_SGMT_ID char(32) NOT NULL COMMENT '数据外键',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  CUST_NUM varchar(60) DEFAULT NULL COMMENT '客户号',
  ACCT_NUM varchar(60) DEFAULT NULL COMMENT '账户号',
  DATA_DATE varchar(20) DEFAULT NULL COMMENT '数据日期',
  KEY INDEX_PBA_ACCT_OC_HIST (PBA_ACCT_BS_SGMT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='210-个人借贷账户信息记录初始债权说明段';

-- ----------------------------
-- Table structure for i_panel_bar_data
-- ----------------------------
DROP TABLE IF EXISTS i_panel_bar_data;
CREATE TABLE i_panel_bar_data (
  EXTRACTION_DATE varchar(10) NOT NULL COMMENT '提取日期',
  I_BS_TOTAL varchar(8) NOT NULL COMMENT '个人基本信息总条数',
  I_BS_REPORTED varchar(8) NOT NULL COMMENT '个人基本信息已上报',
  I_EFCT_TOTAL varchar(8) NOT NULL COMMENT '个人证件有效期总条数',
  I_EFCT_REPORTED varchar(8) NOT NULL COMMENT '个人证件有效期已上报',
  I_FAL_MMBS_TOTAL varchar(8) NOT NULL COMMENT '家族关系信息总条数',
  I_FAL_MMBS_REPORTED varchar(8) NOT NULL COMMENT '家族关系信息已上报',
  I_CTRCT_BS_TOTAL varchar(8) NOT NULL COMMENT '个人授信协议信息总条数',
  I_CTRCT_BS_REPORTED varchar(8) NOT NULL COMMENT '个人授信协议信息已上报',
  I_GUAR_ACCT_TOTAL varchar(8) NOT NULL COMMENT '个人担保账户信息总条数',
  I_GUAR_ACCT_REPORTED varchar(8) NOT NULL COMMENT '个人担保账户信息已上报',
  I_JDACCT_TOTAL varchar(8) NOT NULL COMMENT '个人借贷账户信息总条数',
  I_JDACCT_REPORTED varchar(8) NOT NULL COMMENT '个人借贷账户信息已上报',
  EXTEND1 varchar(10) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(10) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(10) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  PRIMARY KEY (EXTRACTION_DATE)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='首页数据展示-柱状图数据';

-- ----------------------------
-- Table structure for i_panel_data
-- ----------------------------
DROP TABLE IF EXISTS i_panel_data;
CREATE TABLE i_panel_data (
  EXTRACTION_DATE varchar(10) NOT NULL COMMENT '提取日期',
  TOTAL_COUNT varchar(8) NOT NULL COMMENT '总记录数',
  CHECK_ERROR_COUNT varchar(8) NOT NULL COMMENT '校验出错记录数',
  AWAIT_GENERATE_COUNT varchar(8) NOT NULL COMMENT '待生成报文记录数',
  AWAIT_REPORT_COUNT varchar(8) NOT NULL COMMENT '待报送记录数',
  AWAIT_FEEDBACK_COUNT varchar(8) NOT NULL COMMENT '待反馈记录数',
  FEEDBACK_ERROE_PENDING varchar(8) NOT NULL COMMENT '反馈错误待处理数',
  REPORTED varchar(8) DEFAULT NULL COMMENT '已上报',
  REPORTED_SUCCESS varchar(8) DEFAULT NULL COMMENT '上报成功',
  EXTEND3 varchar(10) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  PRIMARY KEY (EXTRACTION_DATE)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='报送数据统计';

-- ----------------------------
-- Table structure for i_rednc_inf
-- ----------------------------
DROP TABLE IF EXISTS i_rednc_inf;
CREATE TABLE i_rednc_inf (
  PAF_REDNC_INF_SGMT_ID char(32) NOT NULL COMMENT '主键',
  RESI_STATUS varchar(2) DEFAULT NULL COMMENT '居住状况',
  RESI_ADDR varchar(100) DEFAULT NULL COMMENT '居住地详细地址',
  RESI_PC varchar(6) DEFAULT NULL COMMENT '居住地邮编',
  RESI_DIST varchar(6) DEFAULT NULL COMMENT '居住地行政区划',
  HOME_TEL varchar(25) DEFAULT NULL COMMENT '住宅电话',
  RESI_INFO_UP_DATE char(10) DEFAULT NULL COMMENT '信息更新日期',
  PAA_BS_SGMT_ID char(32) DEFAULT NULL COMMENT '数据外键',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  CUST_NUM varchar(60) DEFAULT NULL,
  DATA_DATE varchar(20) DEFAULT NULL,
  KEY INDEX_PAA_I_REDNC_INF (PAA_BS_SGMT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='110-个人基本信息记录居住地址段';

-- ----------------------------
-- Table structure for i_rednc_inf_hist
-- ----------------------------
DROP TABLE IF EXISTS i_rednc_inf_hist;
CREATE TABLE i_rednc_inf_hist (
  PAF_REDNC_INF_SGMT_ID char(32) NOT NULL COMMENT '主键',
  RESI_STATUS varchar(2) DEFAULT NULL COMMENT '居住状况',
  RESI_ADDR varchar(100) DEFAULT NULL COMMENT '居住地详细地址',
  RESI_PC varchar(6) DEFAULT NULL COMMENT '居住地邮编',
  RESI_DIST varchar(6) DEFAULT NULL COMMENT '居住地行政区划',
  HOME_TEL varchar(25) DEFAULT NULL COMMENT '住宅电话',
  RESI_INFO_UP_DATE char(10) DEFAULT NULL COMMENT '信息更新日期',
  PAA_BS_SGMT_ID char(32) NOT NULL COMMENT '数据外键',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  CUST_NUM varchar(60) DEFAULT NULL,
  DATA_DATE varchar(20) DEFAULT NULL,
  KEY INDEX_PAA_I_REDNC_INF_HIST (PAA_BS_SGMT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='110-个人基本信息记录居住地址段';

-- ----------------------------
-- Table structure for i_spec_prd
-- ----------------------------
DROP TABLE IF EXISTS i_spec_prd;
CREATE TABLE i_spec_prd (
  PBH_SPEC_PRD_SGMT_ID char(32) NOT NULL COMMENT '主键',
  SPEC_LINE decimal(65,30) DEFAULT NULL COMMENT '大额专项分期额度',
  SPEC_EFCT_DATE varchar(10) DEFAULT NULL COMMENT '分期额度生效日期',
  SPEC_END_DATE varchar(10) DEFAULT NULL COMMENT '分期额度到期日期',
  USED_INST_AMT decimal(65,30) DEFAULT NULL COMMENT '已用分期金额',
  PBA_ACCT_BS_SGMT_ID char(32) NOT NULL COMMENT '数据外键',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  CUST_NUM varchar(60) DEFAULT NULL COMMENT '客户号',
  ACCT_NUM varchar(60) DEFAULT NULL COMMENT '账户号',
  DATA_DATE varchar(20) DEFAULT NULL COMMENT '数据日期',
  KEY INDEX_PBA_ACCT_SPEC (PBA_ACCT_BS_SGMT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='210-个人借贷账户信息记录大额专项分期信息段';

-- ----------------------------
-- Table structure for i_spec_prd_hist
-- ----------------------------
DROP TABLE IF EXISTS i_spec_prd_hist;
CREATE TABLE i_spec_prd_hist (
  PBH_SPEC_PRD_SGMT_ID char(32) NOT NULL COMMENT '主键',
  SPEC_LINE varchar(15) DEFAULT NULL COMMENT '大额专项分期额度',
  SPEC_EFCT_DATE varchar(10) DEFAULT NULL COMMENT '分期额度生效日期',
  SPEC_END_DATE varchar(10) DEFAULT NULL COMMENT '分期额度到期日期',
  USED_INST_AMT varchar(15) DEFAULT NULL COMMENT '已用分期金额',
  PBA_ACCT_BS_SGMT_ID char(32) NOT NULL COMMENT '数据外键',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  CUST_NUM varchar(60) DEFAULT NULL COMMENT '客户号',
  ACCT_NUM varchar(60) DEFAULT NULL COMMENT '账户号',
  DATA_DATE varchar(20) DEFAULT NULL COMMENT '数据日期',
  KEY INDEX_PBA_ACCT_SPEC_HIST (PBA_ACCT_BS_SGMT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='210-个人借贷账户信息记录大额专项分期信息段';

-- ----------------------------
-- Table structure for i_sps_inf
-- ----------------------------
DROP TABLE IF EXISTS i_sps_inf;
CREATE TABLE i_sps_inf (
  PAH_SPS_INF_SGMT_ID char(32) NOT NULL COMMENT '主键',
  MARI_STATUS varchar(2) DEFAULT NULL COMMENT '婚姻状况',
  SPO_NAME varchar(30) DEFAULT NULL COMMENT '配偶姓名',
  SPO_ID_TYPE varchar(2) DEFAULT NULL COMMENT '配偶证件类型',
  SPO_ID_NUM varchar(20) DEFAULT NULL COMMENT '配偶证件号码',
  SPO_TEL varchar(25) DEFAULT NULL COMMENT '配偶联系电话',
  SPS_CMPY_NM varchar(80) DEFAULT NULL COMMENT '配偶工作单位',
  SPS_INFO_UP_DATE char(10) DEFAULT NULL COMMENT '信息更新日期',
  PAA_BS_SGMT_ID char(32) DEFAULT NULL COMMENT '数据外键',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  CUST_NUM varchar(60) DEFAULT NULL,
  DATA_DATE varchar(20) DEFAULT NULL,
  KEY INDEX_PAA_I_SPS_INF (PAA_BS_SGMT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='110-个人基本信息记录婚姻信息段';

-- ----------------------------
-- Table structure for i_sps_inf_hist
-- ----------------------------
DROP TABLE IF EXISTS i_sps_inf_hist;
CREATE TABLE i_sps_inf_hist (
  PAH_SPS_INF_SGMT_ID char(32) NOT NULL COMMENT '主键',
  MARI_STATUS varchar(2) DEFAULT NULL COMMENT '婚姻状况',
  SPO_NAME varchar(30) DEFAULT NULL COMMENT '配偶姓名',
  SPO_ID_TYPE varchar(2) DEFAULT NULL COMMENT '配偶证件类型',
  SPO_ID_NUM varchar(20) DEFAULT NULL COMMENT '配偶证件号码',
  SPO_TEL varchar(25) DEFAULT NULL COMMENT '配偶联系电话',
  SPS_CMPY_NM varchar(80) DEFAULT NULL COMMENT '配偶工作单位',
  SPS_INFO_UP_DATE char(10) DEFAULT NULL COMMENT '信息更新日期',
  PAA_BS_SGMT_ID char(32) NOT NULL COMMENT '数据外键',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  CUST_NUM varchar(60) DEFAULT NULL,
  DATA_DATE varchar(20) DEFAULT NULL,
  KEY INDEX_PAA_I_SPS_INF_HIST (PAA_BS_SGMT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='110-个人基本信息记录婚姻信息段';

-- ----------------------------
-- Table structure for lable_table
-- ----------------------------
DROP TABLE IF EXISTS lable_table;
CREATE TABLE lable_table (
  LABLE varchar(200) DEFAULT NULL COMMENT '校验规则编码',
  NAME text COMMENT '规则编码对应的中文描述',
  TYPE varchar(120) DEFAULT NULL COMMENT '规则类型：“F”代表文件校验，“R”代表信息记录校验，“S”代表信息段校验，“I”代表数据项校验。'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='校验规则表';

-- ----------------------------
-- Table structure for moc_ent_del
-- ----------------------------
DROP TABLE IF EXISTS moc_ent_del;
CREATE TABLE moc_ent_del (
  EFZ_MOC_ENT_DEL_ID char(32) NOT NULL COMMENT '514-抵（质）押合同信息整笔删除请求主键',
  INF_REC_TYPE char(3) DEFAULT NULL COMMENT '信息记录类型',
  DEL_REC_CODE varchar(60) DEFAULT NULL COMMENT '待删除业务标识码',
  LAST_UPDATE_TIME varchar(10) DEFAULT NULL COMMENT '最后更新时间',
  OPERATOR_USER varchar(50) DEFAULT NULL COMMENT '操作员',
  ORG_NAME varchar(100) DEFAULT NULL COMMENT '数据来源机构名称',
  ORG_CODE varchar(100) DEFAULT NULL COMMENT '数据来源机构编号',
  BUSINESS_STATES varchar(50) DEFAULT NULL COMMENT '数据状态',
  REJECT_REASON varchar(255) DEFAULT NULL COMMENT '驳回原因',
  IS_FILTER char(1) DEFAULT NULL COMMENT '是否过滤标识(默认为N-不过滤)',
  REPORT_MESSAGE_ID varchar(60) DEFAULT NULL COMMENT '报文文件ID',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  INFO_ID_TYPE char(1) DEFAULT NULL COMMENT '债务人身份类别',
  NAME varchar(80) DEFAULT NULL COMMENT '债务人名称',
  CERT_TYPE varchar(2) DEFAULT NULL COMMENT '债务人身份标识类型',
  CERT_NUM varchar(60) DEFAULT NULL COMMENT '债务人身份标识号码',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  REPORT_FILE_COLNUM varchar(7) DEFAULT NULL COMMENT '在报文文件中的行数',
  KEY INDEX_EFZ_MOC_ENT_DEL (EFZ_MOC_ENT_DEL_ID) USING BTREE,
  KEY INDEX_MOCENTDEL_NORMAL (BUSINESS_STATES,REPORT_MESSAGE_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='514-抵（质）押合同信息整笔删除请求';

-- ----------------------------
-- Table structure for moc_ent_del_hist
-- ----------------------------
DROP TABLE IF EXISTS moc_ent_del_hist;
CREATE TABLE moc_ent_del_hist (
  EFZ_MOC_ENT_DEL_ID char(32) NOT NULL COMMENT '514-抵（质）押合同信息整笔删除请求主键',
  INF_REC_TYPE char(3) DEFAULT NULL COMMENT '信息记录类型',
  DEL_REC_CODE varchar(60) DEFAULT NULL COMMENT '待删除业务标识码',
  LAST_UPDATE_TIME varchar(10) DEFAULT NULL COMMENT '最后更新时间',
  OPERATOR_USER varchar(50) DEFAULT NULL COMMENT '操作员',
  ORG_NAME varchar(100) DEFAULT NULL COMMENT '数据来源机构名称',
  ORG_CODE varchar(100) DEFAULT NULL COMMENT '数据来源机构编号',
  BUSINESS_STATES varchar(50) DEFAULT NULL COMMENT '数据状态',
  REJECT_REASON varchar(255) DEFAULT NULL COMMENT '驳回原因',
  IS_FILTER char(1) DEFAULT NULL COMMENT '是否过滤标识(默认为N-不过滤)',
  REPORT_MESSAGE_ID varchar(60) DEFAULT NULL COMMENT '报文文件ID',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  INFO_ID_TYPE char(1) DEFAULT NULL COMMENT '债务人身份类别',
  NAME varchar(80) DEFAULT NULL COMMENT '债务人名称',
  CERT_TYPE varchar(2) DEFAULT NULL COMMENT '债务人身份标识类型',
  CERT_NUM varchar(60) DEFAULT NULL COMMENT '债务人身份标识号码',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  REPORT_FILE_COLNUM varchar(7) DEFAULT NULL COMMENT '在报文文件中的行数',
  KEY INDEX_EFZ_MOC_ENT_DEL_HIST (EFZ_MOC_ENT_DEL_ID) USING BTREE,
  KEY INDEX_MOCENTDEL_NORMAL_HIST (BUSINESS_STATES,REPORT_MESSAGE_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='514-抵（质）押合同信息整笔删除请求';

-- ----------------------------
-- Table structure for moc_id_cags_inf
-- ----------------------------
DROP TABLE IF EXISTS moc_id_cags_inf;
CREATE TABLE moc_id_cags_inf (
  EFW_MOC_ID_CAGS_INF_ID char(32) NOT NULL COMMENT '511-抵（质）押合同信息标识变更类请求主键',
  INF_REC_TYPE char(3) DEFAULT NULL COMMENT '信息记录类型',
  OD_BNES_CODE varchar(60) DEFAULT NULL COMMENT '原业务标识码',
  NW_BNES_CODE varchar(60) DEFAULT NULL COMMENT '新业务标识码',
  LAST_UPDATE_TIME varchar(10) DEFAULT NULL COMMENT '最后更新时间',
  OPERATOR_USER varchar(50) DEFAULT NULL COMMENT '操作员',
  ORG_NAME varchar(100) DEFAULT NULL COMMENT '数据来源机构名称',
  ORG_CODE varchar(100) DEFAULT NULL COMMENT '数据来源机构编号',
  BUSINESS_STATES varchar(50) DEFAULT NULL COMMENT '数据状态',
  REJECT_REASON varchar(255) DEFAULT NULL COMMENT '驳回原因',
  IS_FILTER char(1) DEFAULT NULL COMMENT '是否过滤标识(默认为N-不过滤)',
  REPORT_MESSAGE_ID varchar(60) DEFAULT NULL COMMENT '报文文件ID',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  INFO_ID_TYPE char(1) DEFAULT NULL COMMENT '债务人身份类别',
  NAME varchar(80) DEFAULT NULL COMMENT '债务人名称',
  CERT_TYPE varchar(2) DEFAULT NULL COMMENT '债务人身份标识类型',
  CERT_NUM varchar(60) DEFAULT NULL COMMENT '债务人身份标识号码',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  REPORT_FILE_COLNUM varchar(7) DEFAULT NULL COMMENT '在报文文件中的行数',
  KEY INDEX_EFW_MOC_CAGS_INF (EFW_MOC_ID_CAGS_INF_ID) USING BTREE,
  KEY INDEX_MOCCAGS_NORMAL (BUSINESS_STATES,REPORT_MESSAGE_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='511-抵（质）押合同信息标识变更类请求';

-- ----------------------------
-- Table structure for moc_id_cags_inf_hist
-- ----------------------------
DROP TABLE IF EXISTS moc_id_cags_inf_hist;
CREATE TABLE moc_id_cags_inf_hist (
  EFW_MOC_ID_CAGS_INF_ID char(32) NOT NULL COMMENT '511-抵（质）押合同信息标识变更类请求主键',
  INF_REC_TYPE char(3) DEFAULT NULL COMMENT '信息记录类型',
  OD_BNES_CODE varchar(60) DEFAULT NULL COMMENT '原业务标识码',
  NW_BNES_CODE varchar(60) DEFAULT NULL COMMENT '新业务标识码',
  LAST_UPDATE_TIME varchar(10) DEFAULT NULL COMMENT '最后更新时间',
  OPERATOR_USER varchar(50) DEFAULT NULL COMMENT '操作员',
  ORG_NAME varchar(100) DEFAULT NULL COMMENT '数据来源机构名称',
  ORG_CODE varchar(100) DEFAULT NULL COMMENT '数据来源机构编号',
  BUSINESS_STATES varchar(50) DEFAULT NULL COMMENT '数据状态',
  REJECT_REASON varchar(255) DEFAULT NULL COMMENT '驳回原因',
  IS_FILTER char(1) DEFAULT NULL COMMENT '是否过滤标识(默认为N-不过滤)',
  REPORT_MESSAGE_ID varchar(60) DEFAULT NULL COMMENT '报文文件ID',
  RPT_DATE char(10) DEFAULT NULL COMMENT '报送日期',
  INFO_ID_TYPE char(1) DEFAULT NULL COMMENT '债务人身份类别',
  NAME varchar(80) DEFAULT NULL COMMENT '债务人名称',
  CERT_TYPE varchar(2) DEFAULT NULL COMMENT '债务人身份标识类型',
  CERT_NUM varchar(60) DEFAULT NULL COMMENT '债务人身份标识号码',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  REPORT_FILE_COLNUM varchar(7) DEFAULT NULL COMMENT '在报文文件中的行数',
  KEY INDEX_EFW_MOC_CAGS_INF_HIST (EFW_MOC_ID_CAGS_INF_ID) USING BTREE,
  KEY INDEX_MOCCAGS_NORMAL_HIST (BUSINESS_STATES,REPORT_MESSAGE_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='511-抵（质）押合同信息标识变更类请求';

-- ----------------------------
-- Table structure for motga_cltal_bs_inf
-- ----------------------------
DROP TABLE IF EXISTS motga_cltal_bs_inf;
CREATE TABLE motga_cltal_bs_inf (
  EFB_MOTGA_CLTAL_BS_INF_SGMT_ID char(32) DEFAULT NULL COMMENT '510-抵（质）押合同信息基本信息段主键',
  GUAR_TYPE char(1) DEFAULT NULL COMMENT '合同类型',
  CC_AMT varchar(15) DEFAULT NULL COMMENT '抵（质）押合同金额',
  CY char(3) DEFAULT NULL COMMENT '币种',
  CC_VAL_DATE varchar(10) DEFAULT NULL COMMENT '抵（质）押合同生效日期',
  CC_EXP_DATE varchar(10) DEFAULT NULL COMMENT '抵（质）押合同到期日期',
  MAX_GUAR char(1) DEFAULT NULL COMMENT '最高额担保标志',
  CC_STATUS char(1) DEFAULT NULL COMMENT '抵（质）押合同状态',
  EFA_MOTGA_CLTAL_CTRCT_BS_ID char(32) DEFAULT NULL COMMENT '数据外键',
  RPT_DATE varchar(10) DEFAULT NULL COMMENT '报送日期',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  KEY INDEX_MOTGACLTAL_BS (EFA_MOTGA_CLTAL_CTRCT_BS_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='510-抵（质）押合同信息基本信息段';

-- ----------------------------
-- Table structure for motga_cltal_bs_inf_hist
-- ----------------------------
DROP TABLE IF EXISTS motga_cltal_bs_inf_hist;
CREATE TABLE motga_cltal_bs_inf_hist (
  EFB_MOTGA_CLTAL_BS_INF_SGMT_ID char(32) NOT NULL,
  GUAR_TYPE char(1) DEFAULT NULL,
  CC_AMT varchar(15) DEFAULT NULL,
  CY char(3) DEFAULT NULL,
  CC_VAL_DATE varchar(10) DEFAULT NULL,
  CC_EXP_DATE varchar(10) DEFAULT NULL,
  MAX_GUAR char(1) DEFAULT NULL,
  CC_STATUS char(1) DEFAULT NULL,
  EFA_MOTGA_CLTAL_CTRCT_BS_ID char(32) NOT NULL,
  RPT_DATE char(10) DEFAULT NULL,
  EXTEND1 varchar(100) DEFAULT NULL,
  EXTEND2 varchar(100) DEFAULT NULL,
  EXTEND3 varchar(100) DEFAULT NULL,
  COMPANY varchar(20) DEFAULT NULL,
  KEY INDEX_MOTGACLTAL_BS_HIST (EFA_MOTGA_CLTAL_CTRCT_BS_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for motga_cltal_ctrct_bs
-- ----------------------------
DROP TABLE IF EXISTS motga_cltal_ctrct_bs;
CREATE TABLE motga_cltal_ctrct_bs (
  EFA_MOTGA_CLTAL_CTRCT_BS_ID char(32) DEFAULT NULL COMMENT '510-抵（质）押合同信息基础段主键',
  INF_REC_TYPE char(3) DEFAULT NULL COMMENT '信息记录类型',
  CC_CODE varchar(60) DEFAULT NULL COMMENT '抵（质）押合同标识码',
  RPT_DATE varchar(10) DEFAULT NULL COMMENT '信息报告日期',
  RPT_DATE_CODE char(2) DEFAULT NULL COMMENT '报告时点说明代码',
  INFO_ID_TYPE char(1) DEFAULT NULL COMMENT '债务人身份类别',
  NAME varchar(80) DEFAULT NULL COMMENT '债务人名称',
  CERT_TYPE varchar(2) DEFAULT NULL COMMENT '债务人身份标识类型',
  CERT_NUM varchar(60) DEFAULT NULL COMMENT '债务人身份标识号码',
  MNGMT_ORG_CODE char(14) DEFAULT NULL COMMENT '业务管理机构代码',
  LAST_UPDATE_TIME varchar(10) DEFAULT NULL COMMENT '最后更新时间',
  OPERATOR_USER varchar(50) DEFAULT NULL COMMENT '操作员',
  ORG_NAME varchar(100) DEFAULT NULL COMMENT '数据来源机构名称',
  ORG_CODE varchar(100) DEFAULT NULL COMMENT '数据来源机构编号',
  BUSINESS_STATES varchar(50) DEFAULT NULL COMMENT '数据状态',
  REJECT_REASON varchar(255) DEFAULT NULL COMMENT '驳回原因',
  IS_FILTER char(1) DEFAULT NULL COMMENT '是否过滤标识(默认为N-不过滤)',
  REPORT_MESSAGE_ID varchar(60) DEFAULT NULL COMMENT '报文文件ID',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  REPORT_FILE_COLNUM varchar(7) DEFAULT NULL COMMENT '在报文文件中的行数',
  KEY INDEX_EFA_MOTGA_CTRCT (EFA_MOTGA_CLTAL_CTRCT_BS_ID) USING BTREE,
  KEY INDEX_MOTGA_BUSINESS (CC_CODE) USING BTREE,
  KEY INDEX_MOTGA_NORMAL (BUSINESS_STATES,REPORT_MESSAGE_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='510-抵（质）押合同信息基础段';

-- ----------------------------
-- Table structure for motga_cltal_ctrct_bs_hist
-- ----------------------------
DROP TABLE IF EXISTS motga_cltal_ctrct_bs_hist;
CREATE TABLE motga_cltal_ctrct_bs_hist (
  EFA_MOTGA_CLTAL_CTRCT_BS_ID char(32) NOT NULL,
  INF_REC_TYPE char(3) DEFAULT NULL,
  CC_CODE varchar(60) DEFAULT NULL,
  RPT_DATE char(10) DEFAULT NULL,
  RPT_DATE_CODE char(2) DEFAULT NULL,
  INFO_ID_TYPE char(1) DEFAULT NULL,
  NAME varchar(80) DEFAULT NULL,
  CERT_TYPE varchar(2) DEFAULT NULL,
  CERT_NUM varchar(60) DEFAULT NULL,
  MNGMT_ORG_CODE char(14) DEFAULT NULL,
  LAST_UPDATE_TIME varchar(10) DEFAULT NULL,
  OPERATOR_USER varchar(50) DEFAULT NULL,
  ORG_NAME varchar(100) DEFAULT NULL,
  ORG_CODE varchar(100) DEFAULT NULL,
  BUSINESS_STATES varchar(50) DEFAULT NULL,
  REJECT_REASON varchar(255) DEFAULT NULL,
  IS_FILTER char(1) DEFAULT NULL,
  REPORT_MESSAGE_ID varchar(60) DEFAULT NULL,
  EXTEND1 varchar(100) DEFAULT NULL,
  EXTEND2 varchar(100) DEFAULT NULL,
  EXTEND3 varchar(100) DEFAULT NULL,
  COMPANY varchar(20) DEFAULT NULL,
  REPORT_FILE_COLNUM varchar(7) DEFAULT NULL COMMENT '在报文文件中的行数',
  KEY INDEX_EFA_MOTGA_CTRCT_HIST (EFA_MOTGA_CLTAL_CTRCT_BS_ID) USING BTREE,
  KEY INDEX_MOTGA_BUSINESS_HIST (CC_CODE) USING BTREE,
  KEY INDEX_MOTGA_NORMAL_HIST (BUSINESS_STATES,REPORT_MESSAGE_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for motga_cltal_ctrct_bs_middle
-- ----------------------------
DROP TABLE IF EXISTS motga_cltal_ctrct_bs_middle;
CREATE TABLE motga_cltal_ctrct_bs_middle (
  CC_CODE varchar(60) NOT NULL COMMENT '抵（质）押合同标识码',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='510-抵（质）押合同信息基础段中间表';

-- ----------------------------
-- Table structure for motga_cltal_inf
-- ----------------------------
DROP TABLE IF EXISTS motga_cltal_inf;
CREATE TABLE motga_cltal_inf (
  EFE_CLTAL_INF_SGMT_ID char(32) DEFAULT NULL COMMENT '510-抵（质）押合同信息质押物信息主键',
  IMP_TYPE char(2) DEFAULT NULL COMMENT '质物种类',
  IMP_VAL varchar(15) DEFAULT NULL COMMENT '质物价值',
  IMP_CY char(3) DEFAULT NULL COMMENT '币种',
  IPPC char(1) DEFAULT NULL COMMENT '出质人类型',
  PAWN_NAME varchar(80) DEFAULT NULL COMMENT '出质人名称',
  PAWN_CERT_TYPE varchar(2) DEFAULT NULL COMMENT '出质人身份标识类型',
  PAWN_CERT_NUM varchar(40) DEFAULT NULL COMMENT '出质人身份标识号码',
  EFA_MOTGA_CLTAL_CTRCT_BS_ID char(32) DEFAULT NULL COMMENT '数据外键',
  RPT_DATE varchar(10) DEFAULT NULL COMMENT '报送日期',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  KEY INDEX_MOTGACLTAL (EFA_MOTGA_CLTAL_CTRCT_BS_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='510-抵（质）押合同信息质押物信息';

-- ----------------------------
-- Table structure for motga_cltal_inf_hist
-- ----------------------------
DROP TABLE IF EXISTS motga_cltal_inf_hist;
CREATE TABLE motga_cltal_inf_hist (
  EFE_CLTAL_INF_SGMT_ID char(32) NOT NULL,
  IMP_TYPE char(2) DEFAULT NULL,
  IMP_VAL varchar(15) DEFAULT NULL,
  IMP_CY char(3) DEFAULT NULL,
  IPPC char(1) DEFAULT NULL,
  PAWN_NAME varchar(80) DEFAULT NULL,
  PAWN_CERT_TYPE varchar(2) DEFAULT NULL,
  PAWN_CERT_NUM varchar(40) DEFAULT NULL,
  EFA_MOTGA_CLTAL_CTRCT_BS_ID char(32) NOT NULL,
  RPT_DATE char(10) DEFAULT NULL,
  EXTEND1 varchar(100) DEFAULT NULL,
  EXTEND2 varchar(100) DEFAULT NULL,
  EXTEND3 varchar(100) DEFAULT NULL,
  COMPANY varchar(20) DEFAULT NULL,
  KEY INDEX_MOTGACLTAL_HIST (EFA_MOTGA_CLTAL_CTRCT_BS_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for motga_com_rec_inf
-- ----------------------------
DROP TABLE IF EXISTS motga_com_rec_inf;
CREATE TABLE motga_com_rec_inf (
  EFC_COM_REC_INF_SGMT_ID char(32) DEFAULT NULL COMMENT '510-抵（质）押合同信息其他债务人信息主键',
  INFO_ID_TYPE char(1) DEFAULT NULL COMMENT '身份类别',
  GUAR_NAME varchar(80) DEFAULT NULL COMMENT '其他债务人名称',
  GUAR_CERT_TYPE varchar(2) DEFAULT NULL COMMENT '其他债务人身份标识类型',
  GUAR_CERT_NUM varchar(40) DEFAULT NULL COMMENT '其他债务人身份标识号码',
  EFA_MOTGA_CLTAL_CTRCT_BS_ID char(32) DEFAULT NULL COMMENT '数据外键',
  RPT_DATE varchar(10) DEFAULT NULL COMMENT '报送日期',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  KEY INDEX_MOTGACOM_REC (EFA_MOTGA_CLTAL_CTRCT_BS_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='510-抵（质）押合同信息其他债务人信息';

-- ----------------------------
-- Table structure for motga_com_rec_inf_hist
-- ----------------------------
DROP TABLE IF EXISTS motga_com_rec_inf_hist;
CREATE TABLE motga_com_rec_inf_hist (
  EFC_COM_REC_INF_SGMT_ID char(32) NOT NULL,
  INFO_ID_TYPE char(1) DEFAULT NULL,
  GUAR_NAME varchar(80) DEFAULT NULL,
  GUAR_CERT_TYPE varchar(2) DEFAULT NULL,
  GUAR_CERT_NUM varchar(40) DEFAULT NULL,
  EFA_MOTGA_CLTAL_CTRCT_BS_ID char(32) NOT NULL,
  RPT_DATE char(10) DEFAULT NULL,
  EXTEND1 varchar(100) DEFAULT NULL,
  EXTEND2 varchar(100) DEFAULT NULL,
  EXTEND3 varchar(100) DEFAULT NULL,
  COMPANY varchar(20) DEFAULT NULL,
  KEY INDEX_MOTGACOM_REC_HIST (EFA_MOTGA_CLTAL_CTRCT_BS_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for motga_propt_inf
-- ----------------------------
DROP TABLE IF EXISTS motga_propt_inf;
CREATE TABLE motga_propt_inf (
  EFD_MOTGA_PROPT_INF_SGMT_ID char(32) DEFAULT NULL COMMENT '510-抵（质）押合同信息抵押物信息主键',
  PLE_TYPE char(2) DEFAULT NULL COMMENT '抵押物种类',
  MOTGA_PROPT_ID_TYPE char(1) DEFAULT NULL COMMENT '抵押物识别号类型',
  PLE_CERT_ID varchar(40) DEFAULT NULL COMMENT '抵押物唯一识别号',
  PLE_DISTR char(6) DEFAULT NULL COMMENT '抵押物位置所在地行政区划',
  PLE_VALUE varchar(15) DEFAULT NULL COMMENT '抵押物评估价值',
  PLE_CY char(3) DEFAULT NULL COMMENT '币种',
  VAL_ORG_TYPE char(1) DEFAULT NULL COMMENT '评估机构类型',
  VAL_DATE varchar(10) DEFAULT NULL COMMENT '抵押物评估日期',
  PLEDGOR_TYPE char(1) DEFAULT NULL COMMENT '抵押人身份类别',
  PLEDGOR_NAME varchar(80) DEFAULT NULL COMMENT '抵押人名称',
  PLEOR_CERT_TYPE varchar(2) DEFAULT NULL COMMENT '抵押人身份标识类型',
  PLEOR_CERT_NUM varchar(40) DEFAULT NULL COMMENT '抵押人身份标识号码',
  PLE_DESC varchar(200) DEFAULT NULL COMMENT '抵押物说明',
  EFA_MOTGA_CLTAL_CTRCT_BS_ID char(32) DEFAULT NULL COMMENT '数据外键',
  RPT_DATE varchar(10) DEFAULT NULL COMMENT '报送日期',
  EXTEND1 varchar(100) DEFAULT NULL COMMENT '预留字段1',
  EXTEND2 varchar(100) DEFAULT NULL COMMENT '预留字段2',
  EXTEND3 varchar(100) DEFAULT NULL COMMENT '预留字段3',
  COMPANY varchar(20) DEFAULT NULL,
  KEY INDEX_MOTGAPROPT (EFA_MOTGA_CLTAL_CTRCT_BS_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='510-抵（质）押合同信息抵押物信息';

-- ----------------------------
-- Table structure for motga_propt_inf_hist
-- ----------------------------
DROP TABLE IF EXISTS motga_propt_inf_hist;
CREATE TABLE motga_propt_inf_hist (
  EFD_MOTGA_PROPT_INF_SGMT_ID char(32) NOT NULL,
  PLE_TYPE char(2) DEFAULT NULL,
  MOTGA_PROPT_ID_TYPE char(1) DEFAULT NULL,
  PLE_CERT_ID varchar(40) DEFAULT NULL,
  PLE_DISTR char(6) DEFAULT NULL,
  PLE_VALUE varchar(15) DEFAULT NULL,
  PLE_CY char(3) DEFAULT NULL,
  VAL_ORG_TYPE char(1) DEFAULT NULL,
  VAL_DATE varchar(10) DEFAULT NULL,
  PLEDGOR_TYPE char(1) DEFAULT NULL,
  PLEDGOR_NAME varchar(80) DEFAULT NULL,
  PLEOR_CERT_TYPE varchar(2) DEFAULT NULL,
  PLEOR_CERT_NUM varchar(40) DEFAULT NULL,
  PLE_DESC varchar(200) DEFAULT NULL,
  EFA_MOTGA_CLTAL_CTRCT_BS_ID char(32) NOT NULL,
  RPT_DATE char(10) DEFAULT NULL,
  EXTEND1 varchar(100) DEFAULT NULL,
  EXTEND2 varchar(100) DEFAULT NULL,
  EXTEND3 varchar(100) DEFAULT NULL,
  COMPANY varchar(20) DEFAULT NULL,
  KEY INDEX_MOTGAPROPT_HIST (EFA_MOTGA_CLTAL_CTRCT_BS_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for objection_ingo_regist
-- ----------------------------
DROP TABLE IF EXISTS objection_ingo_regist;
CREATE TABLE objection_ingo_regist (
  OBJECTION_ID varchar(32) NOT NULL COMMENT '主键',
  CUST_NAME varchar(30) DEFAULT NULL COMMENT '客户姓名',
  ID_TYPE varchar(2) DEFAULT NULL COMMENT '证件类型',
  ID_NUM varchar(20) DEFAULT NULL COMMENT '证件号码',
  OBJECTION_TYPE varchar(1) DEFAULT NULL COMMENT '异议信息类型',
  OBJECTION_SEGMENT varchar(3) DEFAULT NULL COMMENT '异议信息段',
  IS_LABEL varchar(1) DEFAULT NULL COMMENT '是否标注',
  OBJECTION_REGIST_REMARK longtext COMMENT '异议登记备注',
  REGIST_DATE varchar(20) DEFAULT NULL COMMENT '登记日期',
  LAST_UPDATE_DATE varchar(20) DEFAULT NULL COMMENT '最后更新时间',
  MATERIAL_CHECK_REMARK longtext COMMENT '资料核查备注',
  REVIEW_REMARK longtext COMMENT '审核备注',
  APPROVE_REMARK longtext COMMENT '审批备注',
  OBJECTION_REGIST_CLOSED_TIME varchar(20) DEFAULT NULL COMMENT '异议登记结束时间',
  MATERIAL_CHECK_CLOSED_TIME varchar(20) DEFAULT NULL COMMENT '资料核查结束时间',
  REVIEW_CLOSED_TIME varchar(20) DEFAULT NULL COMMENT '审核结束时间',
  APPROVE_CLOSED_TIME varchar(20) DEFAULT NULL COMMENT '审批结束时间',
  OBJECTION_STATUS varchar(2) DEFAULT NULL COMMENT '异议状态 10-异议登记 20-资料核查 30-审核 40-审批 50-数据更正 60-处理完成 70-拒绝异议',
  COMPANY varchar(20) DEFAULT NULL,
  UNIQUE KEY OBJECTION_INGO_REGIST_PK (OBJECTION_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='个人征信异议登记表';

-- ----------------------------
-- Table structure for operation_log
-- ----------------------------
DROP TABLE IF EXISTS operation_log;
CREATE TABLE operation_log (
  ID varchar(36) NOT NULL COMMENT '主键ID',
  OPERATION_NAME varchar(100) DEFAULT NULL COMMENT '操作人',
  IP varchar(50) DEFAULT NULL COMMENT '操作IP地址',
  CREATE_TIME varchar(20) DEFAULT NULL COMMENT '操作时间',
  ACTION text COMMENT '动作',
  DESCRIPTION text COMMENT '描述信息',
  RESULT varchar(50) DEFAULT NULL COMMENT '操作成功|操作失败',
  SYS_ORG_CODE varchar(200) DEFAULT NULL COMMENT '机构编号',
  SYS_ORG_NAME varchar(200) DEFAULT NULL COMMENT '机构名称',
  LEGAL_PERSON_ID varchar(36) DEFAULT NULL COMMENT '法人ID',
  LEGAL_PERSON_NAME varchar(100) DEFAULT NULL COMMENT '法人名称',
  BROWSER varchar(255) DEFAULT NULL COMMENT '浏览器信息'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='操作日志表';

-- ----------------------------
-- Table structure for pc_dissentinfo
-- ----------------------------
DROP TABLE IF EXISTS pc_dissentinfo;
CREATE TABLE pc_dissentinfo (
  DISSENTTYPE varchar(2) NOT NULL COMMENT '异议类别',
  OBJCHECKID varchar(60) NOT NULL COMMENT '异议事项号 ',
  OBJCHECKNUM varchar(30) NOT NULL COMMENT '异议事项流水号 ',
  CHECKBEGINDATE datetime DEFAULT NULL COMMENT '核查开始日期 ',
  CUSTNAME varchar(80) NOT NULL COMMENT '客户名称',
  IDTYPE varchar(2) NOT NULL COMMENT '证件类型',
  IDCODE varchar(40) NOT NULL COMMENT '证件号码',
  PHONENUM varchar(11) NOT NULL COMMENT '有效联系电话 ',
  OBJITEMINF varchar(20) NOT NULL COMMENT '异议事项信息,存放BASE64内容文件的文件名',
  OBJITEMDESC varchar(200) NOT NULL COMMENT '异议说明 ',
  DATAPROVIDERORGCODE varchar(14) NOT NULL COMMENT '数据提供机构代码',
  DATAOCCURORGCODE varchar(14) NOT NULL COMMENT '数据发生机构代码',
  BUSINESSCODE varchar(60) NOT NULL COMMENT '业务标识号 ',
  BUSINESSTYPE varchar(4) NOT NULL COMMENT '业务种类 ',
  LOANTRADEID varchar(46) NOT NULL COMMENT '报送贷款业务号，截取BusinessCode字段的后46位',
  CHECKFINALDATE datetime DEFAULT NULL COMMENT '核查到期日期 ',
  DATAOCCURDATE datetime DEFAULT NULL COMMENT '数据发生日期 ',
  DATAOCCURAMOUNT decimal(65,30) DEFAULT NULL COMMENT '数据发生金额 ',
  ENCLOSUREFLAG varchar(1) DEFAULT NULL COMMENT '是否存在附件 ',
  ENCLOSURENO varchar(20) DEFAULT NULL COMMENT '异议附件编号',
  CHECKRESULT varchar(1) DEFAULT NULL COMMENT '核查结果,1--数据有误,2--数据无误,3--数据遗漏,4--数据删除,5--数据删除（欺诈）',
  CHECKRESULTDESC longtext COMMENT '异议核查结果描述',
  CORRECTRESULT varchar(1) DEFAULT NULL COMMENT '异议更正结果,1--已更正,2--无需更正',
  ENCLOSUREINFNO varchar(20) DEFAULT NULL COMMENT '异议更正附件编号',
  CORRECTDESC longtext COMMENT '异议更正结果描述',
  STATUS varchar(1) NOT NULL COMMENT '状态,0--未处理,1--已核查,2--已更正',
  SENDFLAG varchar(1) NOT NULL COMMENT '上报标志,0--未上报,1--已上报',
  CHECKER varchar(20) DEFAULT NULL COMMENT '核查操作人OA',
  CHECKTIME datetime DEFAULT NULL COMMENT '核查操作时间',
  CORRECTOR varchar(20) DEFAULT NULL COMMENT '更正操作人OA',
  CORRECTTIME datetime DEFAULT NULL COMMENT '更正操作时间',
  RECVTIME datetime NOT NULL COMMENT '接收时间',
  CORRECTACCEPTFLAG varchar(1) DEFAULT NULL COMMENT '是否接受更正结果,Y-是,N-否;',
  CORRECTOPINION longtext COMMENT '更正处理意见',
  CLIENT_TYPE varchar(100) DEFAULT NULL COMMENT '客户类型',
  COMPANY varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='业务表_异议管理信息表';

-- ----------------------------
-- Table structure for report_message
-- ----------------------------
DROP TABLE IF EXISTS report_message;
CREATE TABLE report_message (
  REPORT_MESSAGE_ID varchar(60) NOT NULL COMMENT '报文文件ID',
  REPORT_MESSAGE_FILE_NAME varchar(34) DEFAULT NULL COMMENT '报送报文文件名',
  REPORT_MESSAGE_TYPE varchar(10) DEFAULT NULL COMMENT '报送报文类型',
  REPORT_MESSAGE_STATUS varchar(50) DEFAULT NULL COMMENT '报文状态:10-待预处理;20-已弃用;30-报送成功;40-反馈全出错;41-反馈全成功;50-反馈部分出错;60-预处理成功;70-预处理全失败;80-预处理部分失败',
  TXT_REPORT_MESSAGE_FILE_PATH text COMMENT 'TXT报文存储路径',
  ZIP_REPORT_MESSAGE_FILE_PATH text COMMENT 'ZIP报文存储路径',
  ENC_REPORT_MESSAGE_FILE_PATH text COMMENT 'ENC报文存储路径',
  ABNORM_REPORTMESSAGE_FILEPATH text COMMENT '异常报文存储路径',
  RECORD_NUM decimal(15,0) DEFAULT NULL COMMENT '报文记录数',
  CREATE_TIME varchar(10) DEFAULT NULL COMMENT '创建时间',
  CREATE_SUCCESS_TIME varchar(10) DEFAULT NULL COMMENT '创建完成时间',
  REPORT_TIME varchar(10) DEFAULT NULL COMMENT '报送时间',
  OPERATOR_USER varchar(50) DEFAULT NULL COMMENT '操作人员',
  ORG_CODE varchar(100) DEFAULT NULL COMMENT '所属机构',
  DESCRIPTION text COMMENT '描述信息',
  FEEDBACK_MESSAGE_FILE_NAME char(34) DEFAULT NULL COMMENT '反馈报文文件名',
  FEEDBACK_MESSAGE_CREATE_TIME varchar(10) DEFAULT NULL COMMENT '反馈报文生成时间',
  FEEDBACK_MESSAGE_REC_TIME varchar(10) DEFAULT NULL COMMENT '反馈报文接收时间',
  FEEDBACK_MESSAGE_IDENTIFY char(1) DEFAULT NULL COMMENT '反馈报文标识',
  FEEDBACK_MESSAGE_FILE_PATH text COMMENT '反馈报文路径',
  FK_SUCCESS_NUMBER decimal(15,0) DEFAULT NULL COMMENT '入库成功数量',
  FK_FAIL_NUMBER decimal(15,0) DEFAULT NULL COMMENT '入库失败数量',
  COMPANY varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='报文记录表';

-- ----------------------------
-- Table structure for serial_number_table
-- ----------------------------
DROP TABLE IF EXISTS serial_number_table;
CREATE TABLE serial_number_table (
  ID varchar(20) NOT NULL,
  SERIAL_NUMBER varchar(3) NOT NULL,
  COMPANY varchar(20) DEFAULT NULL,
  INF_REC_TYPE varchar(3) DEFAULT NULL COMMENT '信息记录类型',
  EXTRACT_DATE varchar(8) DEFAULT NULL COMMENT '抽取日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for system_code_type
-- ----------------------------
DROP TABLE IF EXISTS system_code_type;
CREATE TABLE system_code_type (
  SYSTEM_CODE_TYPE_ID varchar(32) NOT NULL COMMENT '主键',
  SYSTEM_CODE_TYPE varchar(50) DEFAULT NULL COMMENT '系统代码类型',
  SYSTEM_CODE_TYPE_NAME varchar(200) DEFAULT NULL COMMENT '系统代码类型名称',
  COMPANY varchar(20) DEFAULT NULL,
  PRIMARY KEY (SYSTEM_CODE_TYPE_ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统常量类型表';

-- ----------------------------
-- Table structure for system_code_value
-- ----------------------------
DROP TABLE IF EXISTS system_code_value;
CREATE TABLE system_code_value (
  SYSTEM_CODE_VALUE_ID char(32) DEFAULT NULL COMMENT '主键',
  SYSTEM_CODE_TYPE_ID char(32) DEFAULT NULL COMMENT '外键',
  SYSTEM_CODE varchar(50) DEFAULT NULL COMMENT '系统代码',
  SYSTEM_CODE_NAME varchar(200) DEFAULT NULL COMMENT '系统代码名称',
  SEQ decimal(15,0) DEFAULT NULL COMMENT '系统代码序号',
  UPER_ID char(32) DEFAULT NULL COMMENT '上级分类主键',
  COMPANY varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统代码码值表';

-- ----------------------------
-- Table structure for system_config
-- ----------------------------
DROP TABLE IF EXISTS system_config;
CREATE TABLE system_config (
  SYSTEM_CONFIG_ID varchar(36) NOT NULL COMMENT '系统配置id',
  SYSTEM_CONFIG_NAME varchar(100) NOT NULL COMMENT '系统配置key',
  SYSTEM_CONFIG_VALUE varchar(100) NOT NULL COMMENT '系统配置value',
  DESCRIPTION varchar(255) DEFAULT NULL COMMENT '描述信息',
  UPDATE_TIME varchar(10) DEFAULT NULL COMMENT '更新日期',
  UPDATE_USER_NAME varchar(100) DEFAULT NULL COMMENT '更新人名称',
  COMPANY varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for system_state_type
-- ----------------------------
DROP TABLE IF EXISTS system_state_type;
CREATE TABLE system_state_type (
  SYSTEM_STATE_TYPE_ID char(32) NOT NULL COMMENT '主键',
  SYSTEM_STATE_TYPE varchar(50) DEFAULT NULL COMMENT '系统状态类型',
  SYSTEM_STATE_TYPE_NAME varchar(200) DEFAULT NULL COMMENT '系统状态类型名称',
  COMPANY varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统状态类型表';

-- ----------------------------
-- Table structure for system_state_value
-- ----------------------------
DROP TABLE IF EXISTS system_state_value;
CREATE TABLE system_state_value (
  SYSTEM_STATE_VALUE_ID char(32) NOT NULL COMMENT '主键',
  SYSTEM_STATE_TYPE_ID char(32) DEFAULT NULL COMMENT '外键',
  SYSTEM_STATE_VALUE varchar(50) DEFAULT NULL COMMENT '系统状态码值',
  SYSTEM_STATE_NAME varchar(200) DEFAULT NULL COMMENT '系统状态码值名称',
  SEQ decimal(65,30) DEFAULT NULL COMMENT '系统状态码值序号',
  COMPANY varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统状态码值表';

-- ----------------------------
-- Table structure for sys_dictionaries
-- ----------------------------
DROP TABLE IF EXISTS sys_dictionaries;
CREATE TABLE sys_dictionaries (
  DICTIONARIES_ID varchar(32) DEFAULT NULL COMMENT '字典编码',
  DICT_NAME varchar(100) DEFAULT NULL COMMENT '名称',
  NAME_EN varchar(100) DEFAULT NULL COMMENT '英文',
  DICT_CODE varchar(32) DEFAULT NULL COMMENT '编码',
  ORDER_BY decimal(65,30) DEFAULT NULL COMMENT '排序',
  PARENT_ID varchar(32) DEFAULT NULL COMMENT '上级ID',
  BZ varchar(100) DEFAULT NULL COMMENT '备注',
  TBSNAME varchar(50) DEFAULT NULL COMMENT '排查表',
  FILTER varchar(50) DEFAULT NULL COMMENT '过滤'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for sys_org_type
-- ----------------------------
DROP TABLE IF EXISTS sys_org_type;
CREATE TABLE sys_org_type (
  ORG_TYPE_ID varchar(36) NOT NULL COMMENT '类型ID',
  ORG_TYPE_NAME varchar(100) NOT NULL COMMENT '类型名称',
  ORG_TYPE_CODE varchar(100) NOT NULL COMMENT '类型编码'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='组织机构类型';

-- ----------------------------
-- Table structure for table_example
-- ----------------------------
DROP TABLE IF EXISTS table_example;
CREATE TABLE table_example (
  USERID varchar(100) DEFAULT NULL,
  USERNAME varchar(100) DEFAULT NULL,
  SEX varchar(100) DEFAULT NULL,
  EMAIL varchar(100) DEFAULT NULL,
  ADDRESS varchar(100) DEFAULT NULL,
  BIRTHDAY varchar(100) DEFAULT NULL,
  COMPANY varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='测试';

-- ----------------------------
-- Table structure for table_temp
-- ----------------------------
DROP TABLE IF EXISTS table_temp;
CREATE TABLE table_temp (
  id varchar(32) DEFAULT NULL,
  name varchar(60) DEFAULT NULL,
  id_num varchar(20) DEFAULT NULL,
  data_date varchar(30) DEFAULT NULL,
  business_states varchar(3) DEFAULT NULL,
  company varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for task_locks
-- ----------------------------
DROP TABLE IF EXISTS task_locks;
CREATE TABLE task_locks (
  TASK_ID varchar(36) NOT NULL,
  CREATE_TIME varchar(10) DEFAULT NULL COMMENT '锁创建时间',
  EXPIRE_TIME varchar(10) DEFAULT NULL COMMENT '锁过期时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for task_log
-- ----------------------------
DROP TABLE IF EXISTS task_log;
CREATE TABLE task_log (
  ID varchar(36) NOT NULL COMMENT '主键',
  TASK_ID varchar(36) NOT NULL COMMENT '任务编号',
  TASK_NAME varchar(255) NOT NULL COMMENT '任务名称',
  START_TIME varchar(10) DEFAULT NULL COMMENT '开始时间',
  END_TIME varchar(10) DEFAULT NULL COMMENT '结束时间',
  EXCUTE_RESULT varchar(10) DEFAULT NULL COMMENT '执行结果',
  RUN_MODE varchar(10) DEFAULT NULL COMMENT '运行方式',
  RUN_LOG_PATH text COMMENT '日志文件路径',
  EXTERNAL_CODE varchar(50) DEFAULT NULL COMMENT '外部编号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='任务记录表';

-- ----------------------------
-- Table structure for task_management
-- ----------------------------
DROP TABLE IF EXISTS task_management;
CREATE TABLE task_management (
  ID varchar(36) NOT NULL,
  TASK_ID varchar(36) DEFAULT NULL COMMENT '任务编号',
  TASK_NAME varchar(255) DEFAULT NULL COMMENT '任务名称',
  TASK_EXCUTE_PLAN varchar(255) DEFAULT NULL COMMENT '任务执行计划',
  EXCUTE_TARGET varchar(255) DEFAULT NULL COMMENT '执行目标',
  TASK_STATUS varchar(10) DEFAULT NULL,
  TASK_TYPE varchar(50) DEFAULT NULL,
  EXTERNAL_CODE varchar(50) DEFAULT NULL COMMENT '外部编号',
  TIMEOUT_SECOND decimal(65,30) DEFAULT NULL COMMENT '超时时间(秒)',
  REPOSITORY_ID varchar(36) DEFAULT NULL COMMENT '资源库ID',
  EXCUTE_RESULT varchar(10) DEFAULT NULL COMMENT '执行结果 0成功1失败2运行中'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='任务管理表';

-- ----------------------------
-- Table structure for task_param
-- ----------------------------
DROP TABLE IF EXISTS task_param;
CREATE TABLE task_param (
  ID varchar(36) NOT NULL COMMENT '主键',
  TASK_ID varchar(36) NOT NULL COMMENT '任务编号',
  PARAM_NAME varchar(255) NOT NULL COMMENT '参数名称',
  PARAM_VALUE varchar(255) DEFAULT NULL COMMENT '参数值'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='任务参数表';

-- ----------------------------
-- Table structure for test_code
-- ----------------------------
DROP TABLE IF EXISTS test_code;
CREATE TABLE test_code (
  CODE varchar(10) DEFAULT NULL,
  DATE varchar(10) DEFAULT NULL,
  DCODE varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for test_id
-- ----------------------------
DROP TABLE IF EXISTS test_id;
CREATE TABLE test_id (
  ID varchar(10) NOT NULL,
  NAME varchar(200) NOT NULL,
  PRIMARY KEY (ID,NAME)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for test_log
-- ----------------------------
DROP TABLE IF EXISTS test_log;
CREATE TABLE test_log (
  STIME varchar(20) DEFAULT NULL,
  STEP varchar(10) DEFAULT NULL,
  MESSAGE text,
  PRO_NAME varchar(200) DEFAULT NULL,
  RESULT varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for user_pwd_history
-- ----------------------------
DROP TABLE IF EXISTS user_pwd_history;
CREATE TABLE user_pwd_history (
  USER_PWD_HISTORY_ID varchar(36) NOT NULL,
  USER_ID varchar(36) NOT NULL,
  PWD varchar(100) NOT NULL COMMENT '密码',
  CREATE_TIME varchar(10) DEFAULT NULL COMMENT '每次修改都需要插入，修改时间',
  COMPANY varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户密码历史表';

-- ----------------------------
-- Table structure for validate_db_type
-- ----------------------------
DROP TABLE IF EXISTS validate_db_type;
CREATE TABLE validate_db_type (
  DB_NAME varchar(50) NOT NULL COMMENT '数据库名称',
  IS_CURRENT char(1) DEFAULT NULL COMMENT 'Y当前系统正在使用N表示不是',
  COMPANY varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='数据库类型表';

-- ----------------------------
-- Table structure for validate_error_message
-- ----------------------------
DROP TABLE IF EXISTS validate_error_message;
CREATE TABLE validate_error_message (
  ID varchar(50) NOT NULL COMMENT '主键',
  TABLE_PK varchar(255) DEFAULT NULL,
  TABLE_NAME varchar(255) DEFAULT NULL COMMENT '表名称',
  TABLE_FIELD varchar(255) DEFAULT NULL COMMENT '表字段',
  ERROR_MSG text COMMENT '错误信息',
  CUR_DATE varchar(50) DEFAULT NULL COMMENT '日期',
  VALIDATE_RULES_ID varchar(36) DEFAULT NULL COMMENT '校验规则id',
  V_COMMENT varchar(255) DEFAULT NULL COMMENT '描述',
  BUSINESS_PK varchar(255) DEFAULT NULL COMMENT '业务联合主键',
  TABLE_NAME_CN varchar(100) DEFAULT NULL COMMENT '业务表中文名',
  SUBJECT varchar(100) DEFAULT NULL COMMENT '主题',
  IS_FORCE varchar(10) DEFAULT NULL COMMENT '是否强制性校验',
  IS_MULTI_TABLE varchar(10) DEFAULT NULL COMMENT '是否是多表',
  MASTER_TABLE_ID varchar(32) DEFAULT NULL,
  COMPANY varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='错误信息表';

-- ----------------------------
-- Table structure for validate_field
-- ----------------------------
DROP TABLE IF EXISTS validate_field;
CREATE TABLE validate_field (
  FIELD_ID varchar(36) NOT NULL COMMENT '主键id',
  TABLE_ID varchar(36) DEFAULT NULL COMMENT '表主键id',
  FIELD_NAME_EN varchar(255) DEFAULT NULL COMMENT '字段英文名',
  FIELD_NAME_CN varchar(255) DEFAULT NULL COMMENT '字段中文名',
  COMPANY varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='检验字段表';

-- ----------------------------
-- Table structure for validate_mapping
-- ----------------------------
DROP TABLE IF EXISTS validate_mapping;
CREATE TABLE validate_mapping (
  ID varchar(36) NOT NULL COMMENT '主键id',
  VALIDATE_RULES_ID varchar(36) DEFAULT NULL COMMENT '校验规则id',
  VALIDATE_PARAMETER_NAME varchar(100) DEFAULT NULL COMMENT '校验参数名称',
  TEMPLATE_MAPPING_NAME varchar(100) DEFAULT NULL COMMENT '检验映射名称',
  VALIDATE_MAPPING_COMMENT varchar(255) DEFAULT NULL COMMENT '描述',
  VALIDATE_MAPPING_TYPE varchar(50) DEFAULT NULL COMMENT '类型',
  SEQ decimal(65,30) DEFAULT NULL COMMENT '排序',
  COMPANY varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='校验映射表';

-- ----------------------------
-- Table structure for validate_parameter
-- ----------------------------
DROP TABLE IF EXISTS validate_parameter;
CREATE TABLE validate_parameter (
  PARAMETER_NAME varchar(50) NOT NULL COMMENT '参数名称',
  PARAMETER_TYPE varchar(10) DEFAULT NULL COMMENT '参数类型',
  PARAMETER_VALUE varchar(255) DEFAULT NULL COMMENT '参数的值',
  PARAMETER_COMMENT varchar(255) DEFAULT NULL COMMENT '参数描述',
  SERVICE_NAME varchar(50) DEFAULT NULL COMMENT 'service类名',
  COMPANY varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='检验参数表';

-- ----------------------------
-- Table structure for validate_rules
-- ----------------------------
DROP TABLE IF EXISTS validate_rules;
CREATE TABLE validate_rules (
  ID varchar(36) NOT NULL COMMENT '唯一ID',
  RULE_NAME varchar(20) DEFAULT NULL COMMENT '规则名称',
  RULE_TYPE varchar(10) DEFAULT NULL COMMENT '规则类型（sql数据库规则，viewPage前台规则）',
  TABLE_NAME varchar(50) DEFAULT NULL COMMENT '表名',
  TABLE_FIELD varchar(255) DEFAULT NULL COMMENT '字段',
  TEMPLATE_NAME varchar(50) DEFAULT NULL COMMENT '模板名称',
  RULE_COMMENT varchar(255) DEFAULT NULL COMMENT '描述备注',
  SUBJECT varchar(30) DEFAULT NULL COMMENT '主题',
  IS_FORCE varchar(5) DEFAULT NULL COMMENT '是否强制校验(Y/必须通过，N可以忽略)',
  IS_MULTI_TABLE varchar(2) DEFAULT NULL COMMENT '是否多表校验(Y/是，N不是)',
  TABLE_PK varchar(50) NOT NULL COMMENT '表主键',
  ACTION varchar(100) DEFAULT NULL COMMENT '动作标识一般为新增修改',
  SEQ decimal(65,30) DEFAULT NULL COMMENT '排序',
  COMPANY varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='校验规则表';

-- ----------------------------
-- Table structure for validate_rules_management
-- ----------------------------
DROP TABLE IF EXISTS validate_rules_management;
CREATE TABLE validate_rules_management (
  ERRNO varchar(8) NOT NULL COMMENT '规则编号',
  BUSINESSTYPE varchar(2) NOT NULL COMMENT '规则所属模块 0-个人  1-企业',
  ERRDESCRIBE text COMMENT '规则描述',
  VALIDTYPE varchar(10) DEFAULT NULL COMMENT '校验方式（sql数据库规则，viewPage前台规则）',
  VALIDEXPRESSION text COMMENT '校验表达式sql',
  ISINUSE varchar(2) DEFAULT NULL COMMENT '是否启用',
  CHECKTANLENAME varchar(50) DEFAULT NULL COMMENT '校验表名（英文）',
  CHECKCOLNAME varchar(50) DEFAULT NULL COMMENT '校验字段列',
  CHTABLENAME varchar(100) DEFAULT NULL COMMENT '校验表名（中文）',
  INTERNALKEY varchar(100) DEFAULT NULL COMMENT '校验对应字段',
  COMPANY varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='校验规则表';

-- ----------------------------
-- Table structure for validate_table
-- ----------------------------
DROP TABLE IF EXISTS validate_table;
CREATE TABLE validate_table (
  TABLE_ID varchar(36) NOT NULL COMMENT '主键id',
  TABLE_NAME_EN varchar(255) DEFAULT NULL COMMENT '表中英文名',
  TABLE_NAME_CN varchar(255) DEFAULT NULL COMMENT '表中文名',
  MASTER_TABLE_EN varchar(255) DEFAULT NULL COMMENT '对应的主表名称',
  MASTER_TABLE_PK varchar(255) DEFAULT NULL COMMENT '主键的主键字段',
  TBALE_PK varchar(100) DEFAULT NULL COMMENT '表主键信息',
  COMPANY varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='校验表';

-- ----------------------------
-- Table structure for validate_template
-- ----------------------------
DROP TABLE IF EXISTS validate_template;
CREATE TABLE validate_template (
  TEMPLATE_NAME varchar(50) NOT NULL COMMENT '模板名称',
  TEMPLATE_TYPE varchar(255) DEFAULT NULL COMMENT '模板类型',
  TEMPLATE_COMMENT varchar(255) DEFAULT NULL COMMENT '模板描述',
  ERROR_MSG text COMMENT '错误信息提示',
  DATABASE_TYPE varchar(50) DEFAULT NULL COMMENT '数据库类型 (null表示通用,mysql,oracle,sqlserver,oracle,db2)',
  TEMPLATE_TPL text COMMENT '模板内容',
  SERVICE_NAME text COMMENT 'service名称',
  COMPANY varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='校验模板表';

-- ----------------------------
-- Table structure for validate_template_20210628
-- ----------------------------
DROP TABLE IF EXISTS validate_template_20210628;
CREATE TABLE validate_template_20210628 (
  TEMPLATE_NAME varchar(50) NOT NULL COMMENT '模板名称',
  TEMPLATE_TYPE varchar(255) DEFAULT NULL COMMENT '模板类型',
  TEMPLATE_COMMENT varchar(255) DEFAULT NULL COMMENT '模板描述',
  ERROR_MSG text COMMENT '错误信息提示',
  DATABASE_TYPE varchar(50) DEFAULT NULL COMMENT '数据库类型 (null表示通用,mysql,oracle,sqlserver,oracle,db2)',
  TEMPLATE_TPL text COMMENT '模板内容',
  SERVICE_NAME text COMMENT 'service名称',
  COMPANY varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xmltags_cols_mapping
-- ----------------------------
DROP TABLE IF EXISTS xmltags_cols_mapping;
CREATE TABLE xmltags_cols_mapping (
  INF_REC_TYPE varchar(3) DEFAULT NULL COMMENT '信息记录类型',
  TABLE_COL varchar(100) DEFAULT NULL COMMENT '应用表字段',
  XML_TAG varchar(100) DEFAULT NULL COMMENT '报文标签',
  TABLE_NAME varchar(100) DEFAULT NULL COMMENT '应用表字段对应的表',
  IS_MASTER varchar(1) DEFAULT NULL COMMENT '是否主表',
  TABLE_PK varchar(100) DEFAULT NULL COMMENT '表对应的主键字段'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='报文标签表字段映射表';

-- ----------------------------
-- Table structure for ydwjq
-- ----------------------------
DROP TABLE IF EXISTS ydwjq;
CREATE TABLE ydwjq (
  acct_code varchar(60) DEFAULT NULL,
  KEY ACCT_INDEX (acct_code) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for zxbs_middle_table_data_log
-- ----------------------------
DROP TABLE IF EXISTS zxbs_middle_table_data_log;
CREATE TABLE zxbs_middle_table_data_log (
  V_DATE datetime DEFAULT NULL COMMENT '执行日期',
  PROC_NAME varchar(60) DEFAULT NULL COMMENT '存储过程名称',
  STEP varchar(10) DEFAULT NULL COMMENT '执行步骤',
  TABLE_NAME varchar(100) DEFAULT NULL COMMENT '当前表',
  HIST_TABLE_NAME varchar(100) DEFAULT NULL COMMENT '历史表',
  TARGET_TABLE_NAME varchar(100) DEFAULT NULL COMMENT '目标表',
  INF_REC_TYPE_DES text COMMENT '信息记录类型或描述',
  TARGET_TABLE_CNT varchar(15) DEFAULT NULL COMMENT '目标表数据量',
  STATUS varchar(20) DEFAULT NULL COMMENT '状态',
  ERROR_MESSAGE text COMMENT '错误信息'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='征信报送中间表（综合查询使用）数据抽取记录日志';



DROP TRIGGER IF EXISTS I_ACCT_BS_trigger;
DELIMITER ;;
CREATE TRIGGER I_ACCT_BS_trigger BEFORE INSERT ON i_acct_bs FOR EACH ROW begin 
 if new.PBA_ACCT_BS_SGMT_ID is null then 
 set new.PBA_ACCT_BS_SGMT_ID = replace(UUID(),'-','');
 end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS I_ACCT_BS_INF_trigger;
DELIMITER ;;
CREATE TRIGGER I_ACCT_BS_INF_trigger BEFORE INSERT ON i_acct_bs_inf FOR EACH ROW begin 
 if new.PBB_ACCT_BS_INF_SGMT_ID is null then 
 set new.PBB_ACCT_BS_INF_SGMT_ID = replace(UUID(),'-','');
 end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS I_ACCT_CRED_trigger;
DELIMITER ;;
CREATE TRIGGER I_ACCT_CRED_trigger BEFORE INSERT ON i_acct_cred FOR EACH ROW begin 
 if new.PBE_ACCT_CRED_SGMT_ID is null then 
 set new.PBE_ACCT_CRED_SGMT_ID = replace(UUID(),'-','');
 end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS I_ACCT_DBT_INF_trigger;
DELIMITER ;;
CREATE TRIGGER I_ACCT_DBT_INF_trigger BEFORE INSERT ON i_acct_dbt_inf FOR EACH ROW begin 
 if new.PBI_ACCT_DBT_INF_SGMT_ID is null then 
 set new.PBI_ACCT_DBT_INF_SGMT_ID = replace(UUID(),'-','');
 end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS I_AMBLG_INF_trigger;
DELIMITER ;;
CREATE TRIGGER I_AMBLG_INF_trigger BEFORE INSERT ON i_amblg_inf FOR EACH ROW begin 
 if new.PBG_AMBLG_INF_SGMT_ID is null then 
 set new.PBG_AMBLG_INF_SGMT_ID = replace(UUID(),'-','');
 end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS I_AS_TRST_DSPN_trigger;
DELIMITER ;;
CREATE TRIGGER I_AS_TRST_DSPN_trigger BEFORE INSERT ON i_as_trst_dspn FOR EACH ROW begin 
 if new.PBJ_AS_TRST_DSPN_SGMT_ID is null then 
 set new.PBJ_AS_TRST_DSPN_SGMT_ID = replace(UUID(),'-','');
 end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS I_BS_trigger;
DELIMITER ;;
CREATE TRIGGER I_BS_trigger BEFORE INSERT ON i_bs FOR EACH ROW begin 
 if new.PAA_BS_SGMT_ID is null then 
 set new.PAA_BS_SGMT_ID = replace(UUID(),'-','');
 end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS I_CREDIT_LIM_trigger;
DELIMITER ;;
CREATE TRIGGER I_CREDIT_LIM_trigger BEFORE INSERT ON i_credit_lim FOR EACH ROW begin 
 if new.PCC_CREDIT_LIM_SGMT_ID is null then 
 set new.PCC_CREDIT_LIM_SGMT_ID = replace(UUID(),'-','');
 end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS I_CTRCT_BS_trigger;
DELIMITER ;;
CREATE TRIGGER I_CTRCT_BS_trigger BEFORE INSERT ON i_ctrct_bs FOR EACH ROW begin 
 if new.PCA_CTRCT_BS_SGMT_ID is null then 
 set new.PCA_CTRCT_BS_SGMT_ID = replace(UUID(),'-','');
 end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS I_CTRCT_CERT_REL_trigger;
DELIMITER ;;
CREATE TRIGGER I_CTRCT_CERT_REL_trigger BEFORE INSERT ON i_ctrct_cert_rel FOR EACH ROW begin 
 if new.PCB_CTRCT_CERT_REL_SGMT_ID is null then 
 set new.PCB_CTRCT_CERT_REL_SGMT_ID = replace(UUID(),'-','');
 end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS I_EDU_INF_trigger;
DELIMITER ;;
CREATE TRIGGER I_EDU_INF_trigger BEFORE INSERT ON i_edu_inf FOR EACH ROW begin 
 if new.PAD_EDU_INF_SGMT_ID is null then 
 set new.PAD_EDU_INF_SGMT_ID = replace(UUID(),'-','');
 end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS I_FCS_INF_trigger;
DELIMITER ;;
CREATE TRIGGER I_FCS_INF_trigger BEFORE INSERT ON i_fcs_inf FOR EACH ROW begin 
 if new.PAC_FCS_INF_SGMT_ID is null then 
 set new.PAC_FCS_INF_SGMT_ID = replace(UUID(),'-','');
 end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS I_GR_REPYMT_INF_trigger;
DELIMITER ;;
CREATE TRIGGER I_GR_REPYMT_INF_trigger BEFORE INSERT ON i_gr_repymt_inf FOR EACH ROW begin 
 if new.PDE_GR_REPYMT_INF_SGMT_ID is null then 
 set new.PDE_GR_REPYMT_INF_SGMT_ID = replace(UUID(),'-','');
 end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS I_GUAR_ACCT_BS_trigger;
DELIMITER ;;
CREATE TRIGGER I_GUAR_ACCT_BS_trigger BEFORE INSERT ON i_guar_acct_bs FOR EACH ROW begin 
 if new.PDA_GUAR_ACCT_BS_SGMT_ID is null then 
 set new.PDA_GUAR_ACCT_BS_SGMT_ID = replace(UUID(),'-','');
 end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS I_GUAR_ACCT_INF_trigger;
DELIMITER ;;
CREATE TRIGGER I_GUAR_ACCT_INF_trigger BEFORE INSERT ON i_guar_acct_inf FOR EACH ROW begin 
 if new.PDB_GUAR_ACCT_INF_SGMT_ID is null then 
 set new.PDB_GUAR_ACCT_INF_SGMT_ID = replace(UUID(),'-','');
 end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS I_GUAR_MCC_INF_trigger;
DELIMITER ;;
CREATE TRIGGER I_GUAR_MCC_INF_trigger BEFORE INSERT ON i_guar_mcc_inf FOR EACH ROW begin 
 if new.PDD_GUAR_MCC_INF_SGMT_ID is null then 
 set new.PDD_GUAR_MCC_INF_SGMT_ID = replace(UUID(),'-','');
 end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS I_GUAR_RLT_REPYMT_INF_trigger;
DELIMITER ;;
CREATE TRIGGER I_GUAR_RLT_REPYMT_INF_trigger BEFORE INSERT ON i_guar_rlt_repymt_inf FOR EACH ROW begin 
 if new.PDC_RLT_REPYMT_INF_SGMT_ID is null then 
 set new.PDC_RLT_REPYMT_INF_SGMT_ID = replace(UUID(),'-','');
 end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS I_ID_trigger;
DELIMITER ;;
CREATE TRIGGER I_ID_trigger BEFORE INSERT ON i_id FOR EACH ROW begin 
 if new.PAB_ID_SGMT_ID is null then 
 set new.PAB_ID_SGMT_ID = replace(UUID(),'-','');
 end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS I_INC_INF_trigger;
DELIMITER ;;
CREATE TRIGGER I_INC_INF_trigger BEFORE INSERT ON i_inc_inf FOR EACH ROW begin 
 if new.PAI_INC_INF_SGMT_ID is null then 
 set new.PAI_INC_INF_SGMT_ID = replace(UUID(),'-','');
 end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS I_INSECACCTID_CAGSINF_trigger;
DELIMITER ;;
CREATE TRIGGER I_INSECACCTID_CAGSINF_trigger BEFORE INSERT ON i_insecacctid_cagsinf FOR EACH ROW begin 
 if new.PDW_INSECACCTID_CAGSINF_ID is null then 
 set new.PDW_INSECACCTID_CAGSINF_ID = replace(UUID(),'-','');
 end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS I_IN_ACCT_DEL_trigger;
DELIMITER ;;
CREATE TRIGGER I_IN_ACCT_DEL_trigger BEFORE INSERT ON i_in_acct_del FOR EACH ROW begin 
 if new.PBY_IN_ACCT_DEL_ID is null then 
 set new.PBY_IN_ACCT_DEL_ID = replace(UUID(),'-','');
 end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS I_IN_ACCT_ENT_DEL_trigger;
DELIMITER ;;
CREATE TRIGGER I_IN_ACCT_ENT_DEL_trigger BEFORE INSERT ON i_in_acct_ent_del FOR EACH ROW begin 
 if new.PBZ_IN_ACCT_ENT_DEL_ID is null then 
 set new.PBZ_IN_ACCT_ENT_DEL_ID = replace(UUID(),'-','');
 end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS I_IN_ACCT_ID_CAGS_INF_trigger;
DELIMITER ;;
CREATE TRIGGER I_IN_ACCT_ID_CAGS_INF_trigger BEFORE INSERT ON i_in_acct_id_cags_inf FOR EACH ROW begin 
 if new.PBW_IN_ACCT_ID_CAGS_INF_ID is null then 
 set new.PBW_IN_ACCT_ID_CAGS_INF_ID = replace(UUID(),'-','');
 end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS I_IN_BS_INF_DLT_trigger;
DELIMITER ;;
CREATE TRIGGER I_IN_BS_INF_DLT_trigger BEFORE INSERT ON i_in_bs_inf_dlt FOR EACH ROW begin 
 if new.PAY_IN_BS_INF_DLT_ID is null then 
 set new.PAY_IN_BS_INF_DLT_ID = replace(UUID(),'-','');
 end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS I_IN_CTF_ITG_INF_trigger;
DELIMITER ;;
CREATE TRIGGER I_IN_CTF_ITG_INF_trigger BEFORE INSERT ON i_in_ctf_itg_inf FOR EACH ROW begin 
 if new.PAL_IN_CTF_ITG_INF_ID is null then 
 set new.PAL_IN_CTF_ITG_INF_ID = replace(UUID(),'-','');
 end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS I_IN_CTRCTID_CAGS_INF_trigger;
DELIMITER ;;
CREATE TRIGGER I_IN_CTRCTID_CAGS_INF_trigger BEFORE INSERT ON i_in_ctrctid_cags_inf FOR EACH ROW begin 
 if new.PCW_IN_CTRCTID_CAGS_INF_ID is null then 
 set new.PCW_IN_CTRCTID_CAGS_INF_ID = replace(UUID(),'-','');
 end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS I_IN_CTRCT_DEL_trigger;
DELIMITER ;;
CREATE TRIGGER I_IN_CTRCT_DEL_trigger BEFORE INSERT ON i_in_ctrct_del FOR EACH ROW begin 
 if new.PCY_IN_CTRCT_DEL_ID is null then 
 set new.PCY_IN_CTRCT_DEL_ID = replace(UUID(),'-','');
 end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS I_IN_CTRCT_ENT_DEL_trigger;
DELIMITER ;;
CREATE TRIGGER I_IN_CTRCT_ENT_DEL_trigger BEFORE INSERT ON i_in_ctrct_ent_del FOR EACH ROW begin 
 if new.PCZ_IN_CTRCT_ENT_DEL_ID is null then 
 set new.PCZ_IN_CTRCT_ENT_DEL_ID = replace(UUID(),'-','');
 end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS I_IN_FAL_MMBS_INF_trigger;
DELIMITER ;;
CREATE TRIGGER I_IN_FAL_MMBS_INF_trigger BEFORE INSERT ON i_in_fal_mmbs_inf FOR EACH ROW begin 
 if new.PAJ_IN_FAL_MMBS_INF_ID is null then 
 set new.PAJ_IN_FAL_MMBS_INF_ID = replace(UUID(),'-','');
 end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS I_IN_ID_EFCT_INF_trigger;
DELIMITER ;;
CREATE TRIGGER I_IN_ID_EFCT_INF_trigger BEFORE INSERT ON i_in_id_efct_inf FOR EACH ROW begin 
 if new.PAK_IN_ID_EFCT_INF_ID is null then 
 set new.PAK_IN_ID_EFCT_INF_ID = replace(UUID(),'-','');
 end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS I_IN_ID_EFCT_INF_DLT_trigger;
DELIMITER ;;
CREATE TRIGGER I_IN_ID_EFCT_INF_DLT_trigger BEFORE INSERT ON i_in_id_efct_inf_dlt FOR EACH ROW begin 
 if new.PAZ_IN_ID_EFCT_INF_DLT_ID is null then 
 set new.PAZ_IN_ID_EFCT_INF_DLT_ID = replace(UUID(),'-','');
 end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS I_IN_SEC_ACCT_DEL_trigger;
DELIMITER ;;
CREATE TRIGGER I_IN_SEC_ACCT_DEL_trigger BEFORE INSERT ON i_in_sec_acct_del FOR EACH ROW begin 
 if new.PDY_IN_SEC_ACCT_DEL_ID is null then 
 set new.PDY_IN_SEC_ACCT_DEL_ID = replace(UUID(),'-','');
 end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS I_IN_SEC_ACCT_ENT_DEL_trigger;
DELIMITER ;;
CREATE TRIGGER I_IN_SEC_ACCT_ENT_DEL_trigger BEFORE INSERT ON i_in_sec_acct_ent_del FOR EACH ROW begin 
 if new.PDZ_IN_SEC_ACCT_ENT_DEL_ID is null then 
 set new.PDZ_IN_SEC_ACCT_ENT_DEL_ID = replace(UUID(),'-','');
 end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS I_IN_SPC_EVT_DSC_INF_trigger;
DELIMITER ;;
CREATE TRIGGER I_IN_SPC_EVT_DSC_INF_trigger BEFORE INSERT ON i_in_spc_evt_dsc_inf FOR EACH ROW begin 
 if new.PBK_IN_SPC_EVT_DSC_INF_ID is null then 
 set new.PBK_IN_SPC_EVT_DSC_INF_ID = replace(UUID(),'-','');
 end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS I_LOAN_RLT_REPYMT_INF_trigger;
DELIMITER ;;
CREATE TRIGGER I_LOAN_RLT_REPYMT_INF_trigger BEFORE INSERT ON i_loan_rlt_repymt_inf FOR EACH ROW begin 
 if new.PBC_RLT_REPYMT_INF_SGMT_ID is null then 
 set new.PBC_RLT_REPYMT_INF_SGMT_ID = replace(UUID(),'-','');
 end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS I_MCC_INF_trigger;
DELIMITER ;;
CREATE TRIGGER I_MCC_INF_trigger BEFORE INSERT ON i_mcc_inf FOR EACH ROW begin 
 if new.PBD_MCC_INF_SGMT_ID is null then 
 set new.PBD_MCC_INF_SGMT_ID = replace(UUID(),'-','');
 end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS I_MLG_INF_trigger;
DELIMITER ;;
CREATE TRIGGER I_MLG_INF_trigger BEFORE INSERT ON i_mlg_inf FOR EACH ROW begin 
 if new.PAG_MLG_INF_SGMT_ID is null then 
 set new.PAG_MLG_INF_SGMT_ID = replace(UUID(),'-','');
 end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS I_OCTPN_INF_trigger;
DELIMITER ;;
CREATE TRIGGER I_OCTPN_INF_trigger BEFORE INSERT ON i_octpn_inf FOR EACH ROW begin 
 if new.PAE_OCTPN_INF_SGMT_ID is null then 
 set new.PAE_OCTPN_INF_SGMT_ID = replace(UUID(),'-','');
 end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS I_OC_INF_trigger;
DELIMITER ;;
CREATE TRIGGER I_OC_INF_trigger BEFORE INSERT ON i_oc_inf FOR EACH ROW begin 
 if new.PBF_OC_INF_SGMT_ID is null then 
 set new.PBF_OC_INF_SGMT_ID = replace(UUID(),'-','');
 end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS I_PANEL_BAR_DATA_triggers;
DELIMITER ;;
CREATE TRIGGER I_PANEL_BAR_DATA_triggers BEFORE INSERT ON i_panel_bar_data FOR EACH ROW begin 
set new.EXTRACTION_DATE = date_format(NOW(),'%Y-%m-%d');
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS i_panel_data_TRIGGER;
DELIMITER ;;
CREATE TRIGGER i_panel_data_TRIGGER BEFORE INSERT ON i_panel_data FOR EACH ROW begin 
set new.EXTRACTION_DATE = date_format(NOW(),'%Y-%m-%d');
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS I_REDNC_INF_trigger;
DELIMITER ;;
CREATE TRIGGER I_REDNC_INF_trigger BEFORE INSERT ON i_rednc_inf FOR EACH ROW begin 
 if new.PAF_REDNC_INF_SGMT_ID is null then 
 set new.PAF_REDNC_INF_SGMT_ID = replace(UUID(),'-','');
 end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS I_SPEC_PRD_trigger;
DELIMITER ;;
CREATE TRIGGER I_SPEC_PRD_trigger BEFORE INSERT ON i_spec_prd FOR EACH ROW begin 
 if new.PBH_SPEC_PRD_SGMT_ID is null then 
 set new.PBH_SPEC_PRD_SGMT_ID = replace(UUID(),'-','');
 end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS I_SPS_INF_trigger;
DELIMITER ;;
CREATE TRIGGER I_SPS_INF_trigger BEFORE INSERT ON i_sps_inf FOR EACH ROW begin 
 if new.PAH_SPS_INF_SGMT_ID is null then 
 set new.PAH_SPS_INF_SGMT_ID = replace(UUID(),'-','');
 end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS MOTGA_CLTAL_BS_INF_trigger;
DELIMITER ;;
CREATE TRIGGER MOTGA_CLTAL_BS_INF_trigger BEFORE INSERT ON motga_cltal_bs_inf FOR EACH ROW begin 
 if new.EFB_MOTGA_CLTAL_BS_INF_SGMT_ID is null then 
 set new.EFB_MOTGA_CLTAL_BS_INF_SGMT_ID = replace(UUID(),'-','');
 end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS MOTGA_CLTAL_CTRCT_BS_trigger;
DELIMITER ;;
CREATE TRIGGER MOTGA_CLTAL_CTRCT_BS_trigger BEFORE INSERT ON motga_cltal_ctrct_bs FOR EACH ROW begin 
 if new.EFA_MOTGA_CLTAL_CTRCT_BS_ID is null then 
 set new.EFA_MOTGA_CLTAL_CTRCT_BS_ID = replace(UUID(),'-','');
 end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS MOTGA_CLTAL_INF_trigger;
DELIMITER ;;
CREATE TRIGGER MOTGA_CLTAL_INF_trigger BEFORE INSERT ON motga_cltal_inf FOR EACH ROW begin 
 if new.EFE_CLTAL_INF_SGMT_ID is null then 
 set new.EFE_CLTAL_INF_SGMT_ID = replace(UUID(),'-','');
 end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS MOTGA_COM_REC_INF_trigger;
DELIMITER ;;
CREATE TRIGGER MOTGA_COM_REC_INF_trigger BEFORE INSERT ON motga_com_rec_inf FOR EACH ROW begin 
 if new.EFC_COM_REC_INF_SGMT_ID is null then 
 set new.EFC_COM_REC_INF_SGMT_ID = replace(UUID(),'-','');
 end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS MOTGA_PROPT_INF_trigger;
DELIMITER ;;
CREATE TRIGGER MOTGA_PROPT_INF_trigger BEFORE INSERT ON motga_propt_inf FOR EACH ROW begin 
 if new.EFD_MOTGA_PROPT_INF_SGMT_ID is null then 
 set new.EFD_MOTGA_PROPT_INF_SGMT_ID = replace(UUID(),'-','');
 end if;
end
;;
DELIMITER ;
