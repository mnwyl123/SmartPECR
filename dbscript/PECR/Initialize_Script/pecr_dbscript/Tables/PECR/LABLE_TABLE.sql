drop table LABLE_TABLE CASCADE CONSTRAINTS;

create table LABLE_TABLE
(
  lable VARCHAR2(200),
  name  VARCHAR2(2000),
  type  VARCHAR2(120)
);

comment on table LABLE_TABLE is 'У������';
  
COMMENT ON COLUMN LABLE_TABLE.lable IS 'У��������';

COMMENT ON COLUMN LABLE_TABLE.name IS '��������Ӧ����������';

COMMENT ON COLUMN LABLE_TABLE.type IS '�������ͣ���F�������ļ�У�飬��R��������Ϣ��¼У�飬��S��������Ϣ��У�飬��I������������У�顣';