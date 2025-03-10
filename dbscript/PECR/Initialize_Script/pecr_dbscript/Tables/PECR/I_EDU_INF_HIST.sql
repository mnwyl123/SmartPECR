DROP TABLE I_EDU_INF_HIST CASCADE CONSTRAINTS;

CREATE TABLE I_EDU_INF_HIST
(
  PAD_EDU_INF_SGMT_ID  NCHAR(32)                NOT NULL,
  EDU_LEVEL            NVARCHAR2(2),
  ACA_DEGREE           NVARCHAR2(1),
  EDU_INFO_UP_DATE     NCHAR(10),
  PAA_BS_SGMT_ID       NCHAR(32)                NOT NULL,
  RPT_DATE             NCHAR(10),
  EXTEND1              NVARCHAR2(100),
  EXTEND2              NVARCHAR2(100),
  EXTEND3              NVARCHAR2(100)
)
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;

COMMENT ON TABLE I_EDU_INF_HIST IS '110-个人基本信息记录教育信息段';

COMMENT ON COLUMN I_EDU_INF_HIST.PAD_EDU_INF_SGMT_ID IS '主键';

COMMENT ON COLUMN I_EDU_INF_HIST.EDU_LEVEL IS '学历';

COMMENT ON COLUMN I_EDU_INF_HIST.ACA_DEGREE IS '学位';

COMMENT ON COLUMN I_EDU_INF_HIST.EDU_INFO_UP_DATE IS '信息更新日期';

COMMENT ON COLUMN I_EDU_INF_HIST.PAA_BS_SGMT_ID IS '数据外键';

COMMENT ON COLUMN I_EDU_INF_HIST.RPT_DATE IS '报送日期';

COMMENT ON COLUMN I_EDU_INF_HIST.EXTEND1 IS '预留字段1';

COMMENT ON COLUMN I_EDU_INF_HIST.EXTEND2 IS '预留字段2';

COMMENT ON COLUMN I_EDU_INF_HIST.EXTEND3 IS '预留字段3';
