ALTER TABLE SYS_USER_ROLE
 DROP PRIMARY KEY CASCADE;

DROP TABLE SYS_USER_ROLE CASCADE CONSTRAINTS;

CREATE TABLE SYS_USER_ROLE
(
  USER_ID  NVARCHAR2(32)                        NOT NULL,
  ROLE_ID  NVARCHAR2(32)                        NOT NULL
);

COMMENT ON TABLE SYS_USER_ROLE IS '用户对于角色表';


ALTER TABLE SYS_USER_ROLE ADD (
  PRIMARY KEY
  (USER_ID, ROLE_ID));
