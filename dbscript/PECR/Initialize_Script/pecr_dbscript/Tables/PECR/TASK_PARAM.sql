DROP TABLE TASK_PARAM CASCADE CONSTRAINTS;

CREATE TABLE TASK_PARAM
(
  ID           NVARCHAR2(36)                    NOT NULL,
  TASK_ID      NVARCHAR2(36)                    NOT NULL,
  PARAM_NAME   NVARCHAR2(255)                   NOT NULL,
  PARAM_VALUE  NVARCHAR2(255)
)
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;

COMMENT ON TABLE TASK_PARAM IS '任务参数表';

COMMENT ON COLUMN TASK_PARAM.ID IS '主键';

COMMENT ON COLUMN TASK_PARAM.TASK_ID IS '任务编号';

COMMENT ON COLUMN TASK_PARAM.PARAM_NAME IS '参数名称';

COMMENT ON COLUMN TASK_PARAM.PARAM_VALUE IS '参数值';
