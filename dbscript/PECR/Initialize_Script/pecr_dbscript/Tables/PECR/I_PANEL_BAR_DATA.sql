ALTER TABLE I_PANEL_BAR_DATA
 DROP PRIMARY KEY CASCADE;

DROP TABLE I_PANEL_BAR_DATA CASCADE CONSTRAINTS;

CREATE TABLE I_PANEL_BAR_DATA
(
  EXTRACTION_DATE       CHAR(10 BYTE)           DEFAULT to_char(sysdate,'yyyy-mm-dd') NOT NULL,
  I_BS_TOTAL            VARCHAR2(8 BYTE)        DEFAULT 0                     NOT NULL,
  I_BS_REPORTED         VARCHAR2(8 BYTE)        DEFAULT 0                     NOT NULL,
  I_EFCT_TOTAL          VARCHAR2(8 BYTE)        DEFAULT 0                     NOT NULL,
  I_EFCT_REPORTED       VARCHAR2(8 BYTE)        DEFAULT 0                     NOT NULL,
  I_FAL_MMBS_TOTAL      VARCHAR2(8 BYTE)        DEFAULT 0                     NOT NULL,
  I_FAL_MMBS_REPORTED   VARCHAR2(8 BYTE)        DEFAULT 0                     NOT NULL,
  I_CTRCT_BS_TOTAL      VARCHAR2(8 BYTE)        DEFAULT 0                     NOT NULL,
  I_CTRCT_BS_REPORTED   VARCHAR2(8 BYTE)        DEFAULT 0                     NOT NULL,
  I_GUAR_ACCT_TOTAL     VARCHAR2(8 BYTE)        DEFAULT 0                     NOT NULL,
  I_GUAR_ACCT_REPORTED  VARCHAR2(8 BYTE)        DEFAULT 0                     NOT NULL,
  I_JDACCT_TOTAL        VARCHAR2(8 BYTE)        DEFAULT 0                     NOT NULL,
  I_JDACCT_REPORTED     VARCHAR2(8 BYTE)        DEFAULT 0                     NOT NULL,
  EXTEND1               VARCHAR2(10 BYTE),
  EXTEND2               VARCHAR2(10 BYTE),
  EXTEND3               VARCHAR2(10 BYTE)
)
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;

COMMENT ON TABLE I_PANEL_BAR_DATA IS '首页数据展示-柱状图数据';

COMMENT ON COLUMN I_PANEL_BAR_DATA.EXTRACTION_DATE IS '提取日期';

COMMENT ON COLUMN I_PANEL_BAR_DATA.I_BS_TOTAL IS '个人基本信息总条数';

COMMENT ON COLUMN I_PANEL_BAR_DATA.I_BS_REPORTED IS '个人基本信息已上报';

COMMENT ON COLUMN I_PANEL_BAR_DATA.I_EFCT_TOTAL IS '个人证件有效期总条数';

COMMENT ON COLUMN I_PANEL_BAR_DATA.I_EFCT_REPORTED IS '个人证件有效期已上报';

COMMENT ON COLUMN I_PANEL_BAR_DATA.I_FAL_MMBS_TOTAL IS '家族关系信息总条数';

COMMENT ON COLUMN I_PANEL_BAR_DATA.I_FAL_MMBS_REPORTED IS '家族关系信息已上报';

COMMENT ON COLUMN I_PANEL_BAR_DATA.I_CTRCT_BS_TOTAL IS '个人授信协议信息总条数';

COMMENT ON COLUMN I_PANEL_BAR_DATA.I_CTRCT_BS_REPORTED IS '个人授信协议信息已上报';

COMMENT ON COLUMN I_PANEL_BAR_DATA.I_GUAR_ACCT_TOTAL IS '个人担保账户信息总条数';

COMMENT ON COLUMN I_PANEL_BAR_DATA.I_GUAR_ACCT_REPORTED IS '个人担保账户信息已上报';

COMMENT ON COLUMN I_PANEL_BAR_DATA.I_JDACCT_TOTAL IS '个人借贷账户信息总条数';

COMMENT ON COLUMN I_PANEL_BAR_DATA.I_JDACCT_REPORTED IS '个人借贷账户信息已上报';

COMMENT ON COLUMN I_PANEL_BAR_DATA.EXTEND1 IS '预留字段1';

COMMENT ON COLUMN I_PANEL_BAR_DATA.EXTEND2 IS '预留字段2';

COMMENT ON COLUMN I_PANEL_BAR_DATA.EXTEND3 IS '预留字段3';



CREATE UNIQUE INDEX I_PANEL_BAR_DATA_PK ON I_PANEL_BAR_DATA
(EXTRACTION_DATE)
NOPARALLEL;


ALTER TABLE I_PANEL_BAR_DATA ADD (
  CONSTRAINT I_PANEL_BAR_DATA_PK
  PRIMARY KEY
  (EXTRACTION_DATE)
  USING INDEX I_PANEL_BAR_DATA_PK
  ENABLE VALIDATE);
