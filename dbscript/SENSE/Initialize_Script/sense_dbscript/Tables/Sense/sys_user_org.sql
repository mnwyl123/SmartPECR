ALTER TABLE SYS_USER_ORG
 DROP PRIMARY KEY CASCADE;

DROP TABLE SYS_USER_ORG CASCADE CONSTRAINTS;

CREATE TABLE SYS_USER_ORG
(
  USER_ID  NVARCHAR2(32)                        NOT NULL,
  ORG_ID   NVARCHAR2(32)                        NOT NULL
);

COMMENT ON TABLE SYS_USER_ORG IS '用户对应机构表';

ALTER TABLE SYS_USER_ORG ADD (
  PRIMARY KEY
  (USER_ID, ORG_ID));
