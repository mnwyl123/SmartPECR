DROP TABLE I_CTRCT_BS CASCADE CONSTRAINTS;

CREATE TABLE I_CTRCT_BS
(
  PCA_CTRCT_BS_SGMT_ID  NCHAR(32)               NOT NULL,
  INF_REC_TYPE          NVARCHAR2(3),
  CONTRACT_CODE         NVARCHAR2(60),
  RPT_DATE              NCHAR(10),
  RPT_DATE_CODE         NVARCHAR2(2),
  NAME                  NVARCHAR2(30),
  ID_TYPE               NVARCHAR2(2),
  ID_NUM                NVARCHAR2(20),
  MNGMT_ORG_CODE        NVARCHAR2(14),
  LAST_UPDATE_TIME      NVARCHAR2(10),
  OPERATOR_USER         NVARCHAR2(50),
  ORG_NAME              NVARCHAR2(100),
  ORG_CODE              NVARCHAR2(100),
  BUSINESS_STATES       NVARCHAR2(50),
  REJECT_REASON         NVARCHAR2(255),
  IS_FILTER             NCHAR(1),
  REPORT_MESSAGE_ID     NVARCHAR2(60),
  MDFC_SGMT_CODE        NCHAR(1),
  EXTEND1               NVARCHAR2(100),
  EXTEND2               NVARCHAR2(100),
  EXTEND3               NVARCHAR2(100)
)
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;

COMMENT ON TABLE I_CTRCT_BS IS '220-个人授信协议信息记录基础段';

COMMENT ON COLUMN I_CTRCT_BS.PCA_CTRCT_BS_SGMT_ID IS '主键';

COMMENT ON COLUMN I_CTRCT_BS.INF_REC_TYPE IS '信息记录类型';

COMMENT ON COLUMN I_CTRCT_BS.CONTRACT_CODE IS '授信协议标识码';

COMMENT ON COLUMN I_CTRCT_BS.RPT_DATE IS '信息报告日期';

COMMENT ON COLUMN I_CTRCT_BS.RPT_DATE_CODE IS '报告时点说明代码';

COMMENT ON COLUMN I_CTRCT_BS.NAME IS '受信人姓名';

COMMENT ON COLUMN I_CTRCT_BS.ID_TYPE IS '受信人证件类型';

COMMENT ON COLUMN I_CTRCT_BS.ID_NUM IS '受信人证件号码';

COMMENT ON COLUMN I_CTRCT_BS.MNGMT_ORG_CODE IS '业务管理机构代码';

COMMENT ON COLUMN I_CTRCT_BS.LAST_UPDATE_TIME IS '最后更新时间';

COMMENT ON COLUMN I_CTRCT_BS.OPERATOR_USER IS '操作员';

COMMENT ON COLUMN I_CTRCT_BS.ORG_NAME IS '数据来源机构名称';

COMMENT ON COLUMN I_CTRCT_BS.ORG_CODE IS '数据来源机构编号';

COMMENT ON COLUMN I_CTRCT_BS.BUSINESS_STATES IS '数据状态';

COMMENT ON COLUMN I_CTRCT_BS.REJECT_REASON IS '驳回原因';

COMMENT ON COLUMN I_CTRCT_BS.IS_FILTER IS '是否过滤标识(默认为N-不过滤)';

COMMENT ON COLUMN I_CTRCT_BS.REPORT_MESSAGE_ID IS '报文文件ID';

COMMENT ON COLUMN I_CTRCT_BS.MDFC_SGMT_CODE IS '待更正段段标';

COMMENT ON COLUMN I_CTRCT_BS.EXTEND1 IS '预留字段1';

COMMENT ON COLUMN I_CTRCT_BS.EXTEND2 IS '预留字段2';

COMMENT ON COLUMN I_CTRCT_BS.EXTEND3 IS '预留字段3';
