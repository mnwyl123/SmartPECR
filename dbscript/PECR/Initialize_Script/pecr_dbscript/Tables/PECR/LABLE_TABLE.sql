drop table LABLE_TABLE CASCADE CONSTRAINTS;

create table LABLE_TABLE
(
  lable VARCHAR2(200),
  name  VARCHAR2(2000),
  type  VARCHAR2(120)
);

comment on table LABLE_TABLE is '校验规则表';
  
COMMENT ON COLUMN LABLE_TABLE.lable IS '校验规则编码';

COMMENT ON COLUMN LABLE_TABLE.name IS '规则编码对应的中文描述';

COMMENT ON COLUMN LABLE_TABLE.type IS '规则类型：“F”代表文件校验，“R”代表信息记录校验，“S”代表信息段校验，“I”代表数据项校验。';