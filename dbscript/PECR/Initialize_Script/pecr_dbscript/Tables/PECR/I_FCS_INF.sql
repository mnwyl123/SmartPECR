DROP TABLE I_FCS_INF CASCADE CONSTRAINTS;

CREATE TABLE I_FCS_INF
(
  PAC_FCS_INF_SGMT_ID  NCHAR(32)                NOT NULL,
  SEX                  NVARCHAR2(1),
  D_O_B                NVARCHAR2(10),
  NATION               NVARCHAR2(3),
  HOUSE_ADD            NVARCHAR2(100),
  HH_DIST              NVARCHAR2(6),
  CELL_PHONE           NVARCHAR2(11),
  EMAIL                NVARCHAR2(60),
  FCS_INFO_UP_DATE     NCHAR(10),
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

COMMENT ON TABLE I_FCS_INF IS '110-个人基本信息记录基本概况信息段';

COMMENT ON COLUMN I_FCS_INF.PAC_FCS_INF_SGMT_ID IS '主键';

COMMENT ON COLUMN I_FCS_INF.SEX IS '性别';

COMMENT ON COLUMN I_FCS_INF.D_O_B IS '出生日期';

COMMENT ON COLUMN I_FCS_INF.NATION IS '国籍';

COMMENT ON COLUMN I_FCS_INF.HOUSE_ADD IS '户籍地址';

COMMENT ON COLUMN I_FCS_INF.HH_DIST IS '户籍所在地行政区划';

COMMENT ON COLUMN I_FCS_INF.CELL_PHONE IS '手机号码';

COMMENT ON COLUMN I_FCS_INF.EMAIL IS '电子邮箱';

COMMENT ON COLUMN I_FCS_INF.FCS_INFO_UP_DATE IS '信息更新日期';

COMMENT ON COLUMN I_FCS_INF.PAA_BS_SGMT_ID IS '数据外键';

COMMENT ON COLUMN I_FCS_INF.RPT_DATE IS '报送日期';

COMMENT ON COLUMN I_FCS_INF.EXTEND1 IS '预留字段1';

COMMENT ON COLUMN I_FCS_INF.EXTEND2 IS '预留字段2';

COMMENT ON COLUMN I_FCS_INF.EXTEND3 IS '预留字段3';
