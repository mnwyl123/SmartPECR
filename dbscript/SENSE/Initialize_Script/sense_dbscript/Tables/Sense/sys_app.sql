DROP TABLE SYS_APP CASCADE CONSTRAINTS;

CREATE TABLE SYS_APP
(
  SYS_IND       NVARCHAR2(32),
  NAME          NVARCHAR2(50),
  STATUS        NVARCHAR2(2),
  URL           NVARCHAR2(100),
  PICTURE_PATH  NVARCHAR2(100),
  S_DESC        NVARCHAR2(1000),
  S_CLASSES     NVARCHAR2(5),
  IMITATE_URL   NVARCHAR2(100)
);

COMMENT ON TABLE SYS_APP IS '接入系统定义';

COMMENT ON COLUMN SYS_APP.SYS_IND IS '系统编码';

COMMENT ON COLUMN SYS_APP.NAME IS '系统名称';

COMMENT ON COLUMN SYS_APP.STATUS IS '状态';

COMMENT ON COLUMN SYS_APP.URL IS '系统应用入口地址';

COMMENT ON COLUMN SYS_APP.PICTURE_PATH IS '图片地址';

COMMENT ON COLUMN SYS_APP.S_DESC IS '系统描述';

COMMENT ON COLUMN SYS_APP.S_CLASSES IS '系统分类';

COMMENT ON COLUMN SYS_APP.IMITATE_URL IS '模拟登陆地址';
