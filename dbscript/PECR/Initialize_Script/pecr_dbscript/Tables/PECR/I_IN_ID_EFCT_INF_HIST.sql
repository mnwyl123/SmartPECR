DROP TABLE I_IN_ID_EFCT_INF_HIST CASCADE CONSTRAINTS;

CREATE TABLE I_IN_ID_EFCT_INF_HIST
(
  PAK_IN_ID_EFCT_INF_ID  NCHAR(32)              NOT NULL,
  INF_REC_TYPE           NVARCHAR2(3),
  NAME                   NVARCHAR2(30),
  ID_TYPE                NVARCHAR2(2),
  ID_NUM                 NVARCHAR2(20),
  INF_SURC_CODE          NVARCHAR2(20),
  ID_EFCT_DATE           NVARCHAR2(10),
  ID_DUE_DATE            NVARCHAR2(10),
  ID_ORG_NAME            NVARCHAR2(80),
  ID_DIST                NVARCHAR2(6),
  CIMOC                  NVARCHAR2(14),
  RPT_DATE               NCHAR(10),
  LAST_UPDATE_TIME       NVARCHAR2(10),
  OPERATOR_USER          NVARCHAR2(50),
  ORG_NAME               NVARCHAR2(100),
  ORG_CODE               NVARCHAR2(100),
  BUSINESS_STATES        NVARCHAR2(50),
  REJECT_REASON          NVARCHAR2(255),
  IS_FILTER              NCHAR(1),
  REPORT_MESSAGE_ID      NVARCHAR2(60),
  EXTEND1                NVARCHAR2(100),
  EXTEND2                NVARCHAR2(100),
  EXTEND3                NVARCHAR2(100)
)
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;

COMMENT ON TABLE I_IN_ID_EFCT_INF_HIST IS '130-个人证件有效期信息记录';

COMMENT ON COLUMN I_IN_ID_EFCT_INF_HIST.PAK_IN_ID_EFCT_INF_ID IS '主键';

COMMENT ON COLUMN I_IN_ID_EFCT_INF_HIST.INF_REC_TYPE IS '信息记录类型';

COMMENT ON COLUMN I_IN_ID_EFCT_INF_HIST.NAME IS '姓名';

COMMENT ON COLUMN I_IN_ID_EFCT_INF_HIST.ID_TYPE IS '证件类型';

COMMENT ON COLUMN I_IN_ID_EFCT_INF_HIST.ID_NUM IS '证件号码';

COMMENT ON COLUMN I_IN_ID_EFCT_INF_HIST.INF_SURC_CODE IS '信息来源编码';

COMMENT ON COLUMN I_IN_ID_EFCT_INF_HIST.ID_EFCT_DATE IS '证件有效期起始日期';

COMMENT ON COLUMN I_IN_ID_EFCT_INF_HIST.ID_DUE_DATE IS '证件有效期终止日期';

COMMENT ON COLUMN I_IN_ID_EFCT_INF_HIST.ID_ORG_NAME IS '证件签发机关名称';

COMMENT ON COLUMN I_IN_ID_EFCT_INF_HIST.ID_DIST IS '证件签发机关所在地行政区划';

COMMENT ON COLUMN I_IN_ID_EFCT_INF_HIST.CIMOC IS '客户资料维护机构代码';

COMMENT ON COLUMN I_IN_ID_EFCT_INF_HIST.RPT_DATE IS '信息报告日期';

COMMENT ON COLUMN I_IN_ID_EFCT_INF_HIST.LAST_UPDATE_TIME IS '最后更新时间';

COMMENT ON COLUMN I_IN_ID_EFCT_INF_HIST.OPERATOR_USER IS '操作员';

COMMENT ON COLUMN I_IN_ID_EFCT_INF_HIST.ORG_NAME IS '数据来源机构名称';

COMMENT ON COLUMN I_IN_ID_EFCT_INF_HIST.ORG_CODE IS '数据来源机构编号';

COMMENT ON COLUMN I_IN_ID_EFCT_INF_HIST.BUSINESS_STATES IS '数据状态';

COMMENT ON COLUMN I_IN_ID_EFCT_INF_HIST.REJECT_REASON IS '驳回原因';

COMMENT ON COLUMN I_IN_ID_EFCT_INF_HIST.IS_FILTER IS '是否过滤标识(默认为N-不过滤)';

COMMENT ON COLUMN I_IN_ID_EFCT_INF_HIST.REPORT_MESSAGE_ID IS '报文文件ID';

COMMENT ON COLUMN I_IN_ID_EFCT_INF_HIST.EXTEND1 IS '预留字段1';

COMMENT ON COLUMN I_IN_ID_EFCT_INF_HIST.EXTEND2 IS '预留字段2';

COMMENT ON COLUMN I_IN_ID_EFCT_INF_HIST.EXTEND3 IS '预留字段3';
