DROP TABLE I_IN_CTF_ITG_INF CASCADE CONSTRAINTS;

CREATE TABLE I_IN_CTF_ITG_INF
(
  PAL_IN_CTF_ITG_INF_ID  NCHAR(32)              NOT NULL,
  INF_REC_TYPE           NVARCHAR2(3),
  NAME                   NVARCHAR2(30),
  ID_TYPE                NVARCHAR2(2),
  ID_NUM                 NVARCHAR2(20),
  OTH_NAME               NVARCHAR2(30),
  OTH_ID_TYPE            NVARCHAR2(2),
  OTH_ID_NUM             NVARCHAR2(20),
  OTH_ASS_FLG            NVARCHAR2(1),
  INF_SURC_CODE          NVARCHAR2(20),
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

COMMENT ON TABLE I_IN_CTF_ITG_INF IS '140-个人证件整合信息记录';

COMMENT ON COLUMN I_IN_CTF_ITG_INF.PAL_IN_CTF_ITG_INF_ID IS '主键';

COMMENT ON COLUMN I_IN_CTF_ITG_INF.INF_REC_TYPE IS '信息记录类型';

COMMENT ON COLUMN I_IN_CTF_ITG_INF.NAME IS '姓名';

COMMENT ON COLUMN I_IN_CTF_ITG_INF.ID_TYPE IS '证件类型';

COMMENT ON COLUMN I_IN_CTF_ITG_INF.ID_NUM IS '证件号码';

COMMENT ON COLUMN I_IN_CTF_ITG_INF.OTH_NAME IS '其他姓名';

COMMENT ON COLUMN I_IN_CTF_ITG_INF.OTH_ID_TYPE IS '其他证件类型';

COMMENT ON COLUMN I_IN_CTF_ITG_INF.OTH_ID_NUM IS '其他证件号码';

COMMENT ON COLUMN I_IN_CTF_ITG_INF.OTH_ASS_FLG IS '证件关联关系有效标志';

COMMENT ON COLUMN I_IN_CTF_ITG_INF.INF_SURC_CODE IS '信息来源编码';

COMMENT ON COLUMN I_IN_CTF_ITG_INF.RPT_DATE IS '信息报告日期';

COMMENT ON COLUMN I_IN_CTF_ITG_INF.LAST_UPDATE_TIME IS '最后更新时间';

COMMENT ON COLUMN I_IN_CTF_ITG_INF.OPERATOR_USER IS '操作员';

COMMENT ON COLUMN I_IN_CTF_ITG_INF.ORG_NAME IS '数据来源机构名称';

COMMENT ON COLUMN I_IN_CTF_ITG_INF.ORG_CODE IS '数据来源机构编号';

COMMENT ON COLUMN I_IN_CTF_ITG_INF.BUSINESS_STATES IS '数据状态';

COMMENT ON COLUMN I_IN_CTF_ITG_INF.REJECT_REASON IS '驳回原因';

COMMENT ON COLUMN I_IN_CTF_ITG_INF.IS_FILTER IS '是否过滤标识(默认为N-不过滤)';

COMMENT ON COLUMN I_IN_CTF_ITG_INF.REPORT_MESSAGE_ID IS '报文文件ID';

COMMENT ON COLUMN I_IN_CTF_ITG_INF.EXTEND1 IS '预留字段1';

COMMENT ON COLUMN I_IN_CTF_ITG_INF.EXTEND2 IS '预留字段2';

COMMENT ON COLUMN I_IN_CTF_ITG_INF.EXTEND3 IS '预留字段3';
