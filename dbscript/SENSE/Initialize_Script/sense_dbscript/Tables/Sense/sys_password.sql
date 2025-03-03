DROP TABLE SYS_PASSWORD CASCADE CONSTRAINTS;

CREATE TABLE SYS_PASSWORD
(
  INITIAL_PASSWORD        NVARCHAR2(50),
  MAX_ERROR_LOGON         NUMBER(11),
  EFFECT_DAYS             NUMBER(11),
  MIN_LENGTH              NUMBER(11),
  MAX_LENGTH              NUMBER(11),
  REPEAT_NUM              NUMBER(11),
  MODIFIED_RESTRICT_TIME  NUMBER(11),
  ENCRYPT_TYPE            NVARCHAR2(20),
  PASSWORD_RULE           NVARCHAR2(50),
  PASSWORD_RULE_DESC      NVARCHAR2(100)
);

COMMENT ON TABLE SYS_PASSWORD IS '密码参数表';

COMMENT ON COLUMN SYS_PASSWORD.INITIAL_PASSWORD IS '初始密码明码';

COMMENT ON COLUMN SYS_PASSWORD.MAX_ERROR_LOGON IS '每天输错密码次数';

COMMENT ON COLUMN SYS_PASSWORD.EFFECT_DAYS IS '密码过期天数';

COMMENT ON COLUMN SYS_PASSWORD.MIN_LENGTH IS '密码最小长度';

COMMENT ON COLUMN SYS_PASSWORD.MAX_LENGTH IS '密码最大长度';

COMMENT ON COLUMN SYS_PASSWORD.REPEAT_NUM IS '密码不能重复次数';

COMMENT ON COLUMN SYS_PASSWORD.MODIFIED_RESTRICT_TIME IS '重复修改限制时间';

COMMENT ON COLUMN SYS_PASSWORD.ENCRYPT_TYPE IS '密码加密规则，默认采用MD5';

COMMENT ON COLUMN SYS_PASSWORD.PASSWORD_RULE IS '密码校验规则，采用正则表达式的形式存储，便于校验';

COMMENT ON COLUMN SYS_PASSWORD.PASSWORD_RULE_DESC IS '密码校验规则描述';
