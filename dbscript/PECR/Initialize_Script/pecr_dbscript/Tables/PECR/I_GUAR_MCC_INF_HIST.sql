DROP TABLE I_GUAR_MCC_INF_HIST CASCADE CONSTRAINTS;

CREATE TABLE I_GUAR_MCC_INF_HIST
(
  PDD_GUAR_MCC_INF_SGMT_ID  NCHAR(32)           NOT NULL,
  CCC                       NVARCHAR2(60),
  PDA_GUAR_ACCT_BS_SGMT_ID  NCHAR(32),
  RPT_DATE                  NCHAR(10),
  EXTEND1                   NVARCHAR2(100),
  EXTEND2                   NVARCHAR2(100),
  EXTEND3                   NVARCHAR2(100)
)
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;

COMMENT ON TABLE I_GUAR_MCC_INF_HIST IS '230-个人担保账户信息记录抵质押物信息段';

COMMENT ON COLUMN I_GUAR_MCC_INF_HIST.PDD_GUAR_MCC_INF_SGMT_ID IS '主键';

COMMENT ON COLUMN I_GUAR_MCC_INF_HIST.CCC IS '抵（质）押合同标识码';

COMMENT ON COLUMN I_GUAR_MCC_INF_HIST.PDA_GUAR_ACCT_BS_SGMT_ID IS '数据外键';

COMMENT ON COLUMN I_GUAR_MCC_INF_HIST.RPT_DATE IS '报送日期';

COMMENT ON COLUMN I_GUAR_MCC_INF_HIST.EXTEND1 IS '预留字段1';

COMMENT ON COLUMN I_GUAR_MCC_INF_HIST.EXTEND2 IS '预留字段2';

COMMENT ON COLUMN I_GUAR_MCC_INF_HIST.EXTEND3 IS '预留字段3';
