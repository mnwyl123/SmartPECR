DROP TABLE DATA_PERMISSIONS_TYPE CASCADE CONSTRAINTS;

CREATE TABLE DATA_PERMISSIONS_TYPE
(
  DATA_PERMISSIONS_TYPE_ID  NVARCHAR2(36)       NOT NULL,
  TYPE_NAME                 NVARCHAR2(100)      NOT NULL,
  TABLE_NAME                NVARCHAR2(100),
  TABLE_FIELD               NVARCHAR2(100),
  DESCRIPTION               NVARCHAR2(255),
  IS_ENABLE                 NCHAR(1)            NOT NULL
)
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;

COMMENT ON TABLE DATA_PERMISSIONS_TYPE IS '数据权限类型表';

COMMENT ON COLUMN DATA_PERMISSIONS_TYPE.DATA_PERMISSIONS_TYPE_ID IS '主键ID';

COMMENT ON COLUMN DATA_PERMISSIONS_TYPE.TYPE_NAME IS '类型名称';

COMMENT ON COLUMN DATA_PERMISSIONS_TYPE.TABLE_NAME IS '表名';

COMMENT ON COLUMN DATA_PERMISSIONS_TYPE.TABLE_FIELD IS '字段名';

COMMENT ON COLUMN DATA_PERMISSIONS_TYPE.DESCRIPTION IS '描述信息';

COMMENT ON COLUMN DATA_PERMISSIONS_TYPE.IS_ENABLE IS '启用Y禁用N';
