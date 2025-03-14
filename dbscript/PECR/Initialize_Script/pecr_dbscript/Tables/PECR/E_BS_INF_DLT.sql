DROP TABLE E_BS_INF_DLT CASCADE CONSTRAINTS;

CREATE TABLE E_BS_INF_DLT
(
  EAZ_EN_BS_INF_DLT_ID  NCHAR(32)               NOT NULL,
  INF_REC_TYPE          NCHAR(3),
  INF_SURC_CODE         NVARCHAR2(20),
  ENT_NAME              NVARCHAR2(80),
  ENT_CERT_TYPE         NVARCHAR2(2),
  ENT_CERT_NUM          NVARCHAR2(40),
  LAST_UPDATE_TIME      NVARCHAR2(10),
  OPERATOR_USER         NVARCHAR2(50),
  ORG_NAME              NVARCHAR2(100),
  ORG_CODE              NVARCHAR2(100),
  BUSINESS_STATES       NVARCHAR2(50),
  REJECT_REASON         NVARCHAR2(255),
  IS_FILTER             NCHAR(1),
  REPORT_MESSAGE_ID     NVARCHAR2(60),
  RPT_DATE              NCHAR(10),
  EXTEND1               NVARCHAR2(100),
  EXTEND2               NVARCHAR2(100),
  EXTEND3               NVARCHAR2(100)
)
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;

COMMENT ON TABLE E_BS_INF_DLT IS '314-企业基本信息删除请求';

COMMENT ON COLUMN E_BS_INF_DLT.EAZ_EN_BS_INF_DLT_ID IS '314-企业基本信息删除请求主键';

COMMENT ON COLUMN E_BS_INF_DLT.INF_REC_TYPE IS '信息记录类型';

COMMENT ON COLUMN E_BS_INF_DLT.INF_SURC_CODE IS '信息来源编码';

COMMENT ON COLUMN E_BS_INF_DLT.ENT_NAME IS '企业名称';

COMMENT ON COLUMN E_BS_INF_DLT.ENT_CERT_TYPE IS '企业身份标识类型';

COMMENT ON COLUMN E_BS_INF_DLT.ENT_CERT_NUM IS '企业身份标识号码';

COMMENT ON COLUMN E_BS_INF_DLT.LAST_UPDATE_TIME IS '最后更新时间';

COMMENT ON COLUMN E_BS_INF_DLT.OPERATOR_USER IS '操作员';

COMMENT ON COLUMN E_BS_INF_DLT.ORG_NAME IS '数据来源机构名称';

COMMENT ON COLUMN E_BS_INF_DLT.ORG_CODE IS '数据来源机构编号';

COMMENT ON COLUMN E_BS_INF_DLT.BUSINESS_STATES IS '数据状态';

COMMENT ON COLUMN E_BS_INF_DLT.REJECT_REASON IS '驳回原因';

COMMENT ON COLUMN E_BS_INF_DLT.IS_FILTER IS '是否过滤标识(默认为N-不过滤)';

COMMENT ON COLUMN E_BS_INF_DLT.REPORT_MESSAGE_ID IS '报文文件ID';

COMMENT ON COLUMN E_BS_INF_DLT.RPT_DATE IS '报送日期';

COMMENT ON COLUMN E_BS_INF_DLT.EXTEND1 IS '预留字段1';

COMMENT ON COLUMN E_BS_INF_DLT.EXTEND2 IS '预留字段2';

COMMENT ON COLUMN E_BS_INF_DLT.EXTEND3 IS '预留字段3';
