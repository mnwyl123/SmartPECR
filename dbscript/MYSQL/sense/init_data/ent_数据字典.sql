
 DROP TABLE IF EXISTS COMPLIANCE_COMMITMENT;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE COMPLIANCE_COMMITMENT
(
  USER_ID      NVARCHAR(36)                    NOT NULL COMMENT '�û�ID',
  USER_CODE    NVARCHAR(100) COMMENT '�û����',
  USER_NAME    NVARCHAR(100) COMMENT '����',
  ORG_CODE     NVARCHAR(100) COMMENT '������',
  ORG_NAME     NVARCHAR(100) COMMENT '��������',
  CREATE_TIME  NVARCHAR(10) COMMENT '����ʱ��'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE COMPLIANCE_COMMITMENT COMMENT '�Ϲ��ŵ��';

 DROP TABLE IF EXISTS COMPLIANCE_COMMITMENT_CONTENT;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE COMPLIANCE_COMMITMENT_CONTENT
(
  CONTENT_ID  NVARCHAR(36)                     NOT NULL,
  CONTENT     NVARCHAR(2000) COMMENT '����'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;

 DROP TABLE IF EXISTS COM_SM_BRANCH;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE COM_SM_BRANCH
(
  BRANCH_NO      NVARCHAR(4)                   NOT NULL COMMENT '��ҵ���к�',
  REPORT_BRANCH  NVARCHAR(4)                   NOT NULL COMMENT '���к�',
  FINANCE_ENT    NVARCHAR(11)                  NOT NULL COMMENT '��ҵ���ڻ�������',
  FINANCE_PER    NVARCHAR(16) COMMENT '���˽��ڻ�������',
  MEMO           NVARCHAR(100) COMMENT '��ע',
  FLAG           NVARCHAR(1)                   NOT NULL COMMENT '����Ϊ1������Ϊ0',
  DEL_FLAG       NVARCHAR(1) COMMENT 'ɾ����ʶ'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;

 DROP TABLE IF EXISTS CQ_SM_BRANCH;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE CQ_SM_BRANCH
(
  CDB_BRANCH_NO     NVARCHAR(4)                NOT NULL,
  FINANCE_CODE_ENT  VARCHAR(11)           NOT NULL,
  FINANCE_CODE_PER  VARCHAR(16),
  MEMO              NVARCHAR(100),
  FLAG              NVARCHAR(1)                NOT NULL,
  DEL_FLAG          NVARCHAR(1)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;

 DROP TABLE IF EXISTS CREDIT_RPT_EXCP_CODE;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE CREDIT_RPT_EXCP_CODE
(
  CREDIT_RPT_EXCP_CODE  NVARCHAR(32)           NOT NULL COMMENT '���ű����쳣��־����',
  EXCP_CODE             NVARCHAR(32)           NOT NULL COMMENT '�쳣����',
  EXCP_NUM              NVARCHAR(10)           NOT NULL COMMENT '�쳣���',
  EXCP_INFO             NVARCHAR(2000)         NOT NULL COMMENT '�쳣��Ϣ',
  CREATE_TIME           NVARCHAR(10)           NOT NULL COMMENT '��־����ʱ��',
  CREAT_USER            NVARCHAR(20)           NOT NULL COMMENT '������Ա'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE CREDIT_RPT_EXCP_CODE COMMENT '���ű����쳣�����';

 DROP TABLE IF EXISTS CREDIT_RPT_EXCP_LOG;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE CREDIT_RPT_EXCP_LOG
(
  CREDIT_RPT_EXCP_LOG_ID  NVARCHAR(32)         NOT NULL COMMENT '���ű����쳣��־����',
  DATA_DATE               NVARCHAR(10)         NOT NULL COMMENT '��־��Ӧ������ʱ��',
  LOG_KIND                NVARCHAR(10)         NOT NULL COMMENT '��־��Ϣ����',
  LOG_KIND_SUBTYPE        NVARCHAR(10)         NOT NULL COMMENT '��־��Ϣ����ϸ��',
  LOG_NUM                 NVARCHAR(10)         NOT NULL COMMENT '��־���',
  LOG_INFO                NVARCHAR(2000)       NOT NULL COMMENT '��־��Ϣ',
  CREATE_TIME             NVARCHAR(10)         NOT NULL COMMENT '��־����ʱ��',
  LAST_UPDATE_TIME        NVARCHAR(10)         NOT NULL COMMENT '������ʱ��'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE CREDIT_RPT_EXCP_LOG COMMENT '���ű����쳣��־��';

 DROP TABLE IF EXISTS EXTERNAL_DB_SSO;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE EXTERNAL_DB_SSO
(
  SYS_TOKEN   NVARCHAR(36)                     NOT NULL COMMENT 'TOKEN',
  LOGIN_NAME  NVARCHAR(36) COMMENT '�û�����',
  USER_ID     NVARCHAR(36) COMMENT '�û�ID'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE EXTERNAL_DB_SSO COMMENT 'ͨ�����ݿ�ӳ���û���Ϣ���������ϵͳ����SSOʹ�øñ���¼�ɹ����ɾ��';

 DROP TABLE IF EXISTS E_ACCT_BS;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_ACCT_BS
(
  EDA_ACCT_BS_SGMT_ID  NCHAR(32)                NOT NULL COMMENT '410-��ҵ����˻����׻���������',
  INF_REC_TYPE         NCHAR(3) COMMENT '��Ϣ��¼����',
  ACCT_TYPE            NCHAR(2) COMMENT '�˻�����',
  ACCT_CODE            NVARCHAR(60) COMMENT '�˻���ʶ��',
  RPT_DATE             NVARCHAR(10) COMMENT '��Ϣ��������',
  RPT_DATE_CODE        NCHAR(2) COMMENT '����ʱ��˵������',
  NAME                 NVARCHAR(80) COMMENT '���������',
  ID_TYPE              NVARCHAR(2) COMMENT '�������ݱ�ʶ����',
  ID_NUM               NVARCHAR(40) COMMENT '�������ݱ�ʶ����',
  MNGMT_ORG_CODE       NCHAR(14) COMMENT 'ҵ������������',
  LAST_UPDATE_TIME     NVARCHAR(10) COMMENT '������ʱ��',
  OPERATOR_USER        NVARCHAR(50) COMMENT '����Ա',
  ORG_NAME             NVARCHAR(100) COMMENT '������Դ��������',
  ORG_CODE             NVARCHAR(100) COMMENT '������Դ�������',
  BUSINESS_STATES      NVARCHAR(50) COMMENT '����״̬',
  REJECT_REASON        NVARCHAR(255) COMMENT '����ԭ��',
  IS_FILTER            NCHAR(1) COMMENT '�Ƿ���˱�ʶ(Ĭ��ΪN-������)',
  REPORT_MESSAGE_ID    NVARCHAR(60) COMMENT '�����ļ�ID',
  MDFC_SGMT_CODE       NCHAR(1) COMMENT '�������ζα�',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1              NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2              NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3              NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_ACCT_BS COMMENT '410-��ҵ����˻����׻�����';

 DROP TABLE IF EXISTS E_ACCT_BS_HIST;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_ACCT_BS_HIST
(
  EDA_ACCT_BS_SGMT_ID  NCHAR(32)                NOT NULL COMMENT '410-��ҵ����˻����׻���������',
  INF_REC_TYPE         NCHAR(3) COMMENT '��Ϣ��¼����',
  ACCT_TYPE            NCHAR(2) COMMENT '�˻�����',
  ACCT_CODE            NVARCHAR(60) COMMENT '�˻���ʶ��',
  RPT_DATE             NVARCHAR(10) COMMENT '��Ϣ��������',
  RPT_DATE_CODE        NCHAR(2) COMMENT '����ʱ��˵������',
  NAME                 NVARCHAR(80) COMMENT '���������',
  ID_TYPE              NVARCHAR(2) COMMENT '�������ݱ�ʶ����',
  ID_NUM               NVARCHAR(40) COMMENT '�������ݱ�ʶ����',
  MNGMT_ORG_CODE       NCHAR(14) COMMENT 'ҵ������������',
  LAST_UPDATE_TIME     NVARCHAR(10) COMMENT '������ʱ��',
  OPERATOR_USER        NVARCHAR(50) COMMENT '����Ա',
  ORG_NAME             NVARCHAR(100) COMMENT '������Դ��������',
  ORG_CODE             NVARCHAR(100) COMMENT '������Դ�������',
  BUSINESS_STATES      NVARCHAR(50) COMMENT '����״̬',
  REJECT_REASON        NVARCHAR(255) COMMENT '����ԭ��',
  IS_FILTER            NCHAR(1) COMMENT '�Ƿ���˱�ʶ(Ĭ��ΪN-������)',
  REPORT_MESSAGE_ID    NVARCHAR(60) COMMENT '�����ļ�ID',
  MDFC_SGMT_CODE       NCHAR(1) COMMENT '�������ζα�',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1              NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2              NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3              NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_ACCT_BS_HIST COMMENT '410-��ҵ����˻����׻�����';

 DROP TABLE IF EXISTS E_ACCT_BS_INF;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_ACCT_BS_INF
(
  EDB_ACCT_BS_INF_SGMT_ID  NCHAR(32)            NOT NULL COMMENT '410-��ҵ����˻����׻�����Ϣ������',
  BUSI_LINES               NCHAR(2) COMMENT '���ҵ�����',
  BUSI_DTL_LINES           NCHAR(2) COMMENT '���ҵ������ϸ��',
  OPEN_DATE                NVARCHAR(10) COMMENT '��������',
  CY                       NCHAR(3) COMMENT '����',
  ACCT_CRED_LINE           DECIMAL(17,2) COMMENT '���ö��',
  LOAN_AMT                 DECIMAL(17,2) COMMENT '�����',
  FLAG                     NCHAR(1) COMMENT '�ִηſ��־',
  DUE_DATE                 NVARCHAR(10) COMMENT '��������',
  REPAY_MODE               NCHAR(2) COMMENT '���ʽ',
  REPAY_FREQCY             NCHAR(2) COMMENT '����Ƶ��',
  APPLY_BUSI_DIST          NCHAR(6) COMMENT 'ҵ�������������������',
  GUAR_MODE                NCHAR(1) COMMENT '������ʽ',
  OTH_REPY_GUAR_WAY        NCHAR(1) COMMENT '�������֤��ʽ',
  LOAN_TIME_LIM_CAT        NCHAR(2) COMMENT '������޷���',
  LOA_FRM                  NCHAR(1) COMMENT '�������ʽ',
  ACT_INVEST               NCHAR(5) COMMENT '����ʵ��Ͷ��',
  FUND_SOU                 NVARCHAR(2) COMMENT 'ҵ��Ӫ����',
  ASSET_TRAND_FLAG         NCHAR(1) COMMENT '�ʲ�ת�ñ�־',
  EDA_ACCT_BS_SGMT_ID      NCHAR(32)            NOT NULL COMMENT '�������',
  RPT_DATE                 NVARCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                  NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                  NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                  NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_ACCT_BS_INF COMMENT '410-��ҵ����˻����׻�����Ϣ��';

 DROP TABLE IF EXISTS E_ACCT_BS_INF_HIST;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_ACCT_BS_INF_HIST
(
  EDB_ACCT_BS_INF_SGMT_ID  NCHAR(32)            NOT NULL COMMENT '410-��ҵ����˻����׻�����Ϣ������',
  BUSI_LINES               NCHAR(2) COMMENT '���ҵ�����',
  BUSI_DTL_LINES           NCHAR(2) COMMENT '���ҵ������ϸ��',
  OPEN_DATE                NVARCHAR(10) COMMENT '��������',
  CY                       NCHAR(3) COMMENT '����',
  ACCT_CRED_LINE           DECIMAL(17,2) COMMENT '���ö��',
  LOAN_AMT                 DECIMAL(17,2) COMMENT '�����',
  FLAG                     NCHAR(1) COMMENT '�ִηſ��־',
  DUE_DATE                 NVARCHAR(10) COMMENT '��������',
  REPAY_MODE               NCHAR(2) COMMENT '���ʽ',
  REPAY_FREQCY             NCHAR(2) COMMENT '����Ƶ��',
  APPLY_BUSI_DIST          NCHAR(6) COMMENT 'ҵ�������������������',
  GUAR_MODE                NCHAR(1) COMMENT '������ʽ',
  OTH_REPY_GUAR_WAY        NCHAR(1) COMMENT '�������֤��ʽ',
  LOAN_TIME_LIM_CAT        NCHAR(2) COMMENT '������޷���',
  LOA_FRM                  NCHAR(1) COMMENT '�������ʽ',
  ACT_INVEST               NCHAR(5) COMMENT '����ʵ��Ͷ��',
  FUND_SOU                 NVARCHAR(2) COMMENT 'ҵ��Ӫ����',
  ASSET_TRAND_FLAG         NCHAR(1) COMMENT '�ʲ�ת�ñ�־',
  EDA_ACCT_BS_SGMT_ID      NCHAR(32)            NOT NULL COMMENT '�������',
  RPT_DATE                 NVARCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                  NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                  NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                  NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_ACCT_BS_INF_HIST COMMENT '410-��ҵ����˻����׻�����Ϣ��';

 DROP TABLE IF EXISTS E_ACCT_BS_MIDDLE;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_ACCT_BS_MIDDLE
(
  ACCT_TYPE  NVARCHAR(36)                      NOT NULL COMMENT '�˻�����',
  ACCT_CODE  NVARCHAR(60)                      NOT NULL COMMENT '�˻���ʶ��',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1    NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2    NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3    NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_ACCT_BS_MIDDLE COMMENT '410-��ҵ����˻����׻������м��';

 DROP TABLE IF EXISTS E_ACCT_CRED;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_ACCT_CRED
(
  EDE_ACCT_CRED_SGMT_ID  NCHAR(32)              NOT NULL COMMENT '410-��ҵ����˻��������Ŷ����Ϣ������',
  MCC                    NVARCHAR(60) COMMENT '����Э���ʶ��',
  EDA_ACCT_BS_SGMT_ID    NCHAR(32)              NOT NULL COMMENT '�������',
  RPT_DATE               NCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_ACCT_CRED COMMENT '410-��ҵ����˻��������Ŷ����Ϣ��';

 DROP TABLE IF EXISTS E_ACCT_CRED_HIST;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_ACCT_CRED_HIST
(
  EDE_ACCT_CRED_SGMT_ID  NCHAR(32)              NOT NULL COMMENT '410-��ҵ����˻��������Ŷ����Ϣ������',
  MCC                    NVARCHAR(60) COMMENT '����Э���ʶ��',
  EDA_ACCT_BS_SGMT_ID    NCHAR(32)              NOT NULL COMMENT '�������',
  RPT_DATE               NCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_ACCT_CRED_HIST COMMENT '410-��ҵ����˻��������Ŷ����Ϣ��';

 DROP TABLE IF EXISTS E_ACCT_INF_DEL;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_ACCT_INF_DEL
(
  EDY_EN_ACCT_INF_DEL_ID  NCHAR(32)             NOT NULL COMMENT '413-��ҵ����˻�����ɾ���������¼����',
  INF_REC_TYPE            NCHAR(3) COMMENT '��Ϣ��¼����',
  ACCT_TYPE               NCHAR(2) COMMENT '�˻�����',
  DEL_REC_CODE            NVARCHAR(60) COMMENT '��ɾ��ҵ���ʶ��',
  DEL_SGMT_CODE           NCHAR(1) COMMENT '��ɾ���ζα�',
  DEL_START_DATE          NVARCHAR(10) COMMENT '��ɾ����ʼ����',
  DEL_END_DATE            NVARCHAR(10) COMMENT '��ɾ����������',
  LAST_UPDATE_TIME        NVARCHAR(10) COMMENT '������ʱ��',
  OPERATOR_USER           NVARCHAR(50) COMMENT '����Ա',
  ORG_NAME                NVARCHAR(100) COMMENT '������Դ��������',
  ORG_CODE                NVARCHAR(100) COMMENT '������Դ�������',
  BUSINESS_STATES         NVARCHAR(50) COMMENT '����״̬',
  REJECT_REASON           NVARCHAR(255) COMMENT '����ԭ��',
  IS_FILTER               NCHAR(1) COMMENT '�Ƿ���˱�ʶ(Ĭ��ΪN-������)',
  REPORT_MESSAGE_ID       NVARCHAR(60) COMMENT '�����ļ�ID',
  RPT_DATE                NCHAR(10) COMMENT '��������',
  NAME                    NVARCHAR(80) COMMENT '���������',
  ID_TYPE                 NVARCHAR(2) COMMENT '�������ݱ�ʶ����',
  ID_NUM                  NVARCHAR(40) COMMENT '�������ݱ�ʶ����',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                 NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                 NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                 NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_ACCT_INF_DEL COMMENT '413-��ҵ����˻�����ɾ���������¼';

 DROP TABLE IF EXISTS E_ACCT_INF_DEL_HIST;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_ACCT_INF_DEL_HIST
(
  EDY_EN_ACCT_INF_DEL_ID  NCHAR(32)             NOT NULL COMMENT '413-��ҵ����˻�����ɾ���������¼����',
  INF_REC_TYPE            NCHAR(3) COMMENT '��Ϣ��¼����',
  ACCT_TYPE               NCHAR(2) COMMENT '�˻�����',
  DEL_REC_CODE            NVARCHAR(60) COMMENT '��ɾ��ҵ���ʶ��',
  DEL_SGMT_CODE           NCHAR(1) COMMENT '��ɾ���ζα�',
  DEL_START_DATE          NVARCHAR(10) COMMENT '��ɾ����ʼ����',
  DEL_END_DATE            NVARCHAR(10) COMMENT '��ɾ����������',
  LAST_UPDATE_TIME        NVARCHAR(10) COMMENT '������ʱ��',
  OPERATOR_USER           NVARCHAR(50) COMMENT '����Ա',
  ORG_NAME                NVARCHAR(100) COMMENT '������Դ��������',
  ORG_CODE                NVARCHAR(100) COMMENT '������Դ�������',
  BUSINESS_STATES         NVARCHAR(50) COMMENT '����״̬',
  REJECT_REASON           NVARCHAR(255) COMMENT '����ԭ��',
  IS_FILTER               NCHAR(1) COMMENT '�Ƿ���˱�ʶ(Ĭ��ΪN-������)',
  REPORT_MESSAGE_ID       NVARCHAR(60) COMMENT '�����ļ�ID',
  RPT_DATE                NCHAR(10) COMMENT '��������',
  NAME                    NVARCHAR(80) COMMENT '���������',
  ID_TYPE                 NVARCHAR(2) COMMENT '�������ݱ�ʶ����',
  ID_NUM                  NVARCHAR(40) COMMENT '�������ݱ�ʶ����',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                 NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                 NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                 NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_ACCT_INF_DEL_HIST COMMENT '413-��ҵ����˻�����ɾ���������¼';

 DROP TABLE IF EXISTS E_ACCT_INF_ENT_DEL;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_ACCT_INF_ENT_DEL
(
  EDZ_EN_ACCT_INF_ENT_DEL_ID  NCHAR(32)         NOT NULL COMMENT '414-��ҵ����˻�����ɾ�������¼����',
  INF_REC_TYPE                NCHAR(3) COMMENT '��Ϣ��¼����',
  ACCT_TYPE                   NCHAR(2) COMMENT '�˻�����',
  DEL_REC_CODE                NVARCHAR(60) COMMENT '��ɾ��ҵ���ʶ��',
  LAST_UPDATE_TIME            NVARCHAR(10) COMMENT '������ʱ��',
  OPERATOR_USER               NVARCHAR(50) COMMENT '����Ա',
  ORG_NAME                    NVARCHAR(100) COMMENT '������Դ��������',
  ORG_CODE                    NVARCHAR(100) COMMENT '������Դ�������',
  BUSINESS_STATES             NVARCHAR(50) COMMENT '����״̬',
  REJECT_REASON               NVARCHAR(255) COMMENT '����ԭ��',
  IS_FILTER                   NCHAR(1) COMMENT '�Ƿ���˱�ʶ(Ĭ��ΪN-������)',
  REPORT_MESSAGE_ID           NVARCHAR(60) COMMENT '�����ļ�ID',
  RPT_DATE                    NCHAR(10) COMMENT '��������',
  NAME                        NVARCHAR(80) COMMENT '���������',
  ID_TYPE                     NVARCHAR(2) COMMENT '�������ݱ�ʶ����',
  ID_NUM                      NVARCHAR(40) COMMENT '�������ݱ�ʶ����',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                     NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                     NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                     NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_ACCT_INF_ENT_DEL COMMENT '414-��ҵ����˻�����ɾ�������¼';

 DROP TABLE IF EXISTS E_ACCT_INF_ENT_DEL_HIST;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_ACCT_INF_ENT_DEL_HIST
(
  EDZ_EN_ACCT_INF_ENT_DEL_ID  NCHAR(32)         NOT NULL COMMENT '414-��ҵ����˻�����ɾ�������¼����',
  INF_REC_TYPE                NCHAR(3) COMMENT '��Ϣ��¼����',
  ACCT_TYPE                   NCHAR(2) COMMENT '�˻�����',
  DEL_REC_CODE                NVARCHAR(60) COMMENT '��ɾ��ҵ���ʶ��',
  LAST_UPDATE_TIME            NVARCHAR(10) COMMENT '������ʱ��',
  OPERATOR_USER               NVARCHAR(50) COMMENT '����Ա',
  ORG_NAME                    NVARCHAR(100) COMMENT '������Դ��������',
  ORG_CODE                    NVARCHAR(100) COMMENT '������Դ�������',
  BUSINESS_STATES             NVARCHAR(50) COMMENT '����״̬',
  REJECT_REASON               NVARCHAR(255) COMMENT '����ԭ��',
  IS_FILTER                   NCHAR(1) COMMENT '�Ƿ���˱�ʶ(Ĭ��ΪN-������)',
  REPORT_MESSAGE_ID           NVARCHAR(60) COMMENT '�����ļ�ID',
  RPT_DATE                    NCHAR(10) COMMENT '��������',
  NAME                        NVARCHAR(80) COMMENT '���������',
  ID_TYPE                     NVARCHAR(2) COMMENT '�������ݱ�ʶ����',
  ID_NUM                      NVARCHAR(40) COMMENT '�������ݱ�ʶ����',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                     NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                     NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                     NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_ACCT_INF_ENT_DEL_HIST COMMENT '414-��ҵ����˻�����ɾ�������¼';

 DROP TABLE IF EXISTS E_ACCT_INF_ID_CAGS_INF;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_ACCT_INF_ID_CAGS_INF
(
  EDW_EN_ACCT_INF_ID_CAGS_INF_ID  NCHAR(32)     NOT NULL COMMENT '411-��ҵ����˻���ʶ����������¼����',
  INF_REC_TYPE                    NCHAR(3) COMMENT '��Ϣ��¼����',
  ACCT_TYPE                       NCHAR(2) COMMENT '�˻�����',
  OD_BNES_CODE                    NVARCHAR(60) COMMENT 'ԭҵ���ʶ��',
  NW_BNES_CODE                    NVARCHAR(60) COMMENT '��ҵ���ʶ��',
  LAST_UPDATE_TIME                NVARCHAR(10) COMMENT '������ʱ��',
  OPERATOR_USER                   NVARCHAR(50) COMMENT '����Ա',
  ORG_NAME                        NVARCHAR(100) COMMENT '������Դ��������',
  ORG_CODE                        NVARCHAR(100) COMMENT '������Դ�������',
  BUSINESS_STATES                 NVARCHAR(50) COMMENT '����״̬',
  REJECT_REASON                   NVARCHAR(255) COMMENT '����ԭ��',
  IS_FILTER                       NCHAR(1) COMMENT '�Ƿ���˱�ʶ(Ĭ��ΪN-������)',
  REPORT_MESSAGE_ID               NVARCHAR(60) COMMENT '�����ļ�ID',
  RPT_DATE                        NCHAR(10) COMMENT '��������',
  NAME                            NVARCHAR(80) COMMENT '���������',
  ID_TYPE                         NVARCHAR(2) COMMENT '�������ݱ�ʶ����',
  ID_NUM                          NVARCHAR(40) COMMENT '�������ݱ�ʶ����',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_ACCT_INF_ID_CAGS_INF COMMENT '411-��ҵ����˻���ʶ����������¼';

 DROP TABLE IF EXISTS E_ACCT_INF_ID_CAGS_INF_HIST;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_ACCT_INF_ID_CAGS_INF_HIST
(
  EDW_EN_ACCT_INF_ID_CAGS_INF_ID  NCHAR(32)     NOT NULL COMMENT '411-��ҵ����˻���ʶ����������¼����',
  INF_REC_TYPE                    NCHAR(3) COMMENT '��Ϣ��¼����',
  ACCT_TYPE                       NCHAR(2) COMMENT '�˻�����',
  OD_BNES_CODE                    NVARCHAR(60) COMMENT 'ԭҵ���ʶ��',
  NW_BNES_CODE                    NVARCHAR(60) COMMENT '��ҵ���ʶ��',
  LAST_UPDATE_TIME                NVARCHAR(10) COMMENT '������ʱ��',
  OPERATOR_USER                   NVARCHAR(50) COMMENT '����Ա',
  ORG_NAME                        NVARCHAR(100) COMMENT '������Դ��������',
  ORG_CODE                        NVARCHAR(100) COMMENT '������Դ�������',
  BUSINESS_STATES                 NVARCHAR(50) COMMENT '����״̬',
  REJECT_REASON                   NVARCHAR(255) COMMENT '����ԭ��',
  IS_FILTER                       NCHAR(1) COMMENT '�Ƿ���˱�ʶ(Ĭ��ΪN-������)',
  REPORT_MESSAGE_ID               NVARCHAR(60) COMMENT '�����ļ�ID',
  RPT_DATE                        NCHAR(10) COMMENT '��������',
  NAME                            NVARCHAR(80) COMMENT '���������',
  ID_TYPE                         NVARCHAR(2) COMMENT '�������ݱ�ʶ����',
  ID_NUM                          NVARCHAR(40) COMMENT '�������ݱ�ʶ����',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_ACCT_INF_ID_CAGS_INF_HIST COMMENT '411-��ҵ����˻���ʶ����������¼';

 DROP TABLE IF EXISTS E_ACCT_SPEC_TRST;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_ACCT_SPEC_TRST
(
  EDH_ACCT_SPEC_TRST_DSPN_SG_ID  NCHAR(32)      NOT NULL COMMENT '410-��ҵ����˻������ض�����˵��������',
  CHAN_TRAN_TYPE                 NCHAR(2) COMMENT '��������',
  TRAN_DATE                      NVARCHAR(10) COMMENT '��������',
  TRAN_AMT                       DECIMAL(17,2) COMMENT '���׽��',
  DUE_TRAN_MON                   DECIMAL(17,2) COMMENT '�������ڱ������',
  DET_INFO                       NVARCHAR(200) COMMENT '������ϸ��Ϣ',
  EDA_ACCT_BS_SGMT_ID            NCHAR(32)      NOT NULL COMMENT '�������',
  RPT_DATE                       NVARCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                        NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                        NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                        NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_ACCT_SPEC_TRST COMMENT '410-��ҵ����˻������ض�����˵����';

 DROP TABLE IF EXISTS E_ACCT_SPEC_TRST_HIST;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_ACCT_SPEC_TRST_HIST
(
  EDH_ACCT_SPEC_TRST_DSPN_SG_ID  NCHAR(32)      NOT NULL COMMENT '410-��ҵ����˻������ض�����˵��������',
  CHAN_TRAN_TYPE                 NCHAR(2) COMMENT '��������',
  TRAN_DATE                      NVARCHAR(10) COMMENT '��������',
  TRAN_AMT                       DECIMAL(17,2) COMMENT '���׽��',
  DUE_TRAN_MON                   DECIMAL(17,2) COMMENT '�������ڱ������',
  DET_INFO                       NVARCHAR(200) COMMENT '������ϸ��Ϣ',
  EDA_ACCT_BS_SGMT_ID            NCHAR(32)      NOT NULL COMMENT '�������',
  RPT_DATE                       NVARCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                        NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                        NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                        NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_ACCT_SPEC_TRST_HIST COMMENT '410-��ҵ����˻������ض�����˵����';

 DROP TABLE IF EXISTS E_ACTU_COTRL_INF;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_ACTU_COTRL_INF
(
  EAF_ACTU_COTRL_INF_SGMT_ID  NCHAR(32)         NOT NULL COMMENT '310-��ҵ������Ϣʵ�ʿ����˶�����',
  ACTU_COTRL_CERT_TYPE        NCHAR(1) COMMENT 'ʵ�ʿ�����������',
  ACTU_COTRL_NAME             NVARCHAR(80) COMMENT 'ʵ�ʿ���������',
  ACTU_COTRL_ID_TYPE          NVARCHAR(2) COMMENT 'ʵ�ʿ�������ݱ�ʶ����',
  ACTU_COTRL_ID_NUM           NVARCHAR(40) COMMENT 'ʵ�ʿ�������ݱ�ʶ����',
  ACTU_COTRL_INFO_UPDATE      NCHAR(10) COMMENT '��Ϣ��������',
  EAA_BS_SGMT_ID              NCHAR(32)         NOT NULL COMMENT '�������',
  RPT_DATE                    NCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                     NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                     NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                     NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_ACTU_COTRL_INF COMMENT '310-��ҵ������Ϣʵ�ʿ�����';

 DROP TABLE IF EXISTS E_ACTU_COTRL_INF_HIST;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_ACTU_COTRL_INF_HIST
(
  EAF_ACTU_COTRL_INF_SGMT_ID  NCHAR(32)         NOT NULL COMMENT '310-��ҵ������Ϣʵ�ʿ����˶�����',
  ACTU_COTRL_CERT_TYPE        NCHAR(1) COMMENT 'ʵ�ʿ�����������',
  ACTU_COTRL_NAME             NVARCHAR(80) COMMENT 'ʵ�ʿ���������',
  ACTU_COTRL_ID_TYPE          NVARCHAR(2) COMMENT 'ʵ�ʿ�������ݱ�ʶ����',
  ACTU_COTRL_ID_NUM           NVARCHAR(40) COMMENT 'ʵ�ʿ�������ݱ�ʶ����',
  ACTU_COTRL_INFO_UPDATE      NCHAR(10) COMMENT '��Ϣ��������',
  EAA_BS_SGMT_ID              NCHAR(32)         NOT NULL COMMENT '�������',
  RPT_DATE                    NCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                     NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                     NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                     NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_ACTU_COTRL_INF_HIST COMMENT '310-��ҵ������Ϣʵ�ʿ�����';

 DROP TABLE IF EXISTS E_ACT_LBLTY_INF;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_ACT_LBLTY_INF
(
  EDG_ACT_LBLTY_INF_SGMT_ID  NCHAR(32)          NOT NULL COMMENT '410-��ҵ����˻����׻��������Ϣ������',
  ACCT_STATUS                NCHAR(2) COMMENT '�˻�״̬',
  ACCT_BAL                   DECIMAL(17,2) COMMENT '���',
  BAL_CHG_DATE               NVARCHAR(10) COMMENT '���仯����',
  FIVE_CATE                  NCHAR(1) COMMENT '�弶����',
  FIVE_CATE_ADJ_DATE         NVARCHAR(10) COMMENT '�弶�����϶�����',
  PYMT_PRD                   DECIMAL(17,2) COMMENT 'ʣ�໹������',
  TOT_OVERD                  DECIMAL(17,2) COMMENT '��ǰ�����ܶ�',
  OVERD_PRINC                DECIMAL(17,2) COMMENT '��ǰ���ڱ���',
  OVERD_DY                   DECIMAL(17,2) COMMENT '��ǰ��������',
  LAT_RPY_DATE               NVARCHAR(10) COMMENT '���һ��ʵ�ʻ�������',
  LAT_RPY_AMT                DECIMAL(17,2) COMMENT '���һ��ʵ�ʻ�����',
  LAT_RPY_PRINC_AMT          DECIMAL(17,2) COMMENT '���һ��ʵ�ʹ黹����',
  RPMT_TYPE                  NCHAR(2) COMMENT '������ʽ',
  LAT_AGRR_RPY_DATE          NVARCHAR(10) COMMENT '���һ��Լ��������',
  LAT_AGRR_RPY_AMT           DECIMAL(17,2) COMMENT '���һ��Ӧ������',
  NXT_AGRR_RPY_DATE          NVARCHAR(10) COMMENT '��һ��Լ����������',
  CLOSE_DATE                 NVARCHAR(10) COMMENT '�˻��ر�����',
  EDA_ACCT_BS_SGMT_ID        NCHAR(32)          NOT NULL COMMENT '�������',
  RPT_DATE                   NVARCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                    NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                    NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                    NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_ACT_LBLTY_INF COMMENT '410-��ҵ����˻����׻��������Ϣ��';

 DROP TABLE IF EXISTS E_ACT_LBLTY_INF_HIST;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_ACT_LBLTY_INF_HIST
(
  EDG_ACT_LBLTY_INF_SGMT_ID  NCHAR(32)          NOT NULL COMMENT '410-��ҵ����˻����׻��������Ϣ������',
  ACCT_STATUS                NCHAR(2) COMMENT '�˻�״̬',
  ACCT_BAL                   DECIMAL(17,2) COMMENT '���',
  BAL_CHG_DATE               NVARCHAR(10) COMMENT '���仯����',
  FIVE_CATE                  NCHAR(1) COMMENT '�弶����',
  FIVE_CATE_ADJ_DATE         NVARCHAR(10) COMMENT '�弶�����϶�����',
  PYMT_PRD                   DECIMAL(17,2) COMMENT 'ʣ�໹������',
  TOT_OVERD                  DECIMAL(17,2) COMMENT '��ǰ�����ܶ�',
  OVERD_PRINC                DECIMAL(17,2) COMMENT '��ǰ���ڱ���',
  OVERD_DY                   DECIMAL(17,2) COMMENT '��ǰ��������',
  LAT_RPY_DATE               NVARCHAR(10) COMMENT '���һ��ʵ�ʻ�������',
  LAT_RPY_AMT                DECIMAL(17,2) COMMENT '���һ��ʵ�ʻ�����',
  LAT_RPY_PRINC_AMT          DECIMAL(17,2) COMMENT '���һ��ʵ�ʹ黹����',
  RPMT_TYPE                  NCHAR(2) COMMENT '������ʽ',
  LAT_AGRR_RPY_DATE          NVARCHAR(10) COMMENT '���һ��Լ��������',
  LAT_AGRR_RPY_AMT           DECIMAL(17,2) COMMENT '���һ��Ӧ������',
  NXT_AGRR_RPY_DATE          NVARCHAR(10) COMMENT '��һ��Լ����������',
  CLOSE_DATE                 NVARCHAR(10) COMMENT '�˻��ر�����',
  EDA_ACCT_BS_SGMT_ID        NCHAR(32)          NOT NULL COMMENT '�������',
  RPT_DATE                   NVARCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                    NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                    NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                    NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_ACT_LBLTY_INF_HIST COMMENT '410-��ҵ����˻����׻��������Ϣ��';

 DROP TABLE IF EXISTS E_BALANCE_SHEET02;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_BALANCE_SHEET02
(
  EHB_BALANCE_SHEET2002_SGMT_ID   NCHAR(32)     NOT NULL COMMENT '610-��ҵ�ʲ���ծ��02�ʲ���ծ�������',
  CURRENCY_FUNDS                  DECIMAL(17,2) COMMENT '�����ʽ�',
  SHORT_TERM_INVESTMENTS          DECIMAL(17,2) COMMENT '����Ͷ��',
  NOTES_RECEIVABLE                DECIMAL(17,2) COMMENT 'Ӧ��Ʊ��',
  DIVIDENDS_RECEIVABLE            DECIMAL(17,2) COMMENT 'Ӧ�չ���',
  INTEREST_RECEIVABLE             DECIMAL(17,2) COMMENT 'Ӧ����Ϣ',
  ACCOUNTS_RECEIVABLE             DECIMAL(17,2) COMMENT 'Ӧ���˿�',
  OTHER_RECEIVABLES               DECIMAL(17,2) COMMENT '����Ӧ�տ�',
  PREPAYMENTS                     DECIMAL(17,2) COMMENT 'Ԥ���˿�',
  FUTURE_GUARANTEE                DECIMAL(17,2) COMMENT '�ڻ���֤��',
  ALLOWANCE_RECEIVABLE            DECIMAL(17,2) COMMENT 'Ӧ�ղ�����',
  EXPORT_DRAWBACK_RECEIVABLE      DECIMAL(17,2) COMMENT 'Ӧ�ճ�����˰',
  INVENTORIES                     DECIMAL(17,2) COMMENT '���',
  RAW_MATERIALS                   DECIMAL(17,2) COMMENT '���ԭ����',
  FINISHED_PRODUCTS               DECIMAL(17,2) COMMENT '�������Ʒ ',
  DEFERRED_EXPENSES               DECIMAL(17,2) COMMENT '��̯����',
  UNSETTLED_GLON_CURRENT_ASSETS   DECIMAL(17,2) COMMENT '�����������ʲ�����ʧ',
  LONG_TERM_DEBENTURE_INVESTMENT  DECIMAL(17,2) COMMENT 'һ���ڵ��ڵĳ���ծȨͶ��',
  OTHER_CURRENT_ASSETS            DECIMAL(17,2) COMMENT '���������ʲ�',
  TOTAL_CURRENT_ASSETS            DECIMAL(17,2) COMMENT '�����ʲ��ϼ�',
  LONG_TERM_INVESTMENT            DECIMAL(17,2) COMMENT '����Ͷ��',
  LONG_TERM_EQUITY_INVESTMENT     DECIMAL(17,2) COMMENT '���ڹ�ȨͶ��',
  LONG_TERM_SECURITIES_INVESTMEN  DECIMAL(17,2) COMMENT '����ծȨͶ��',
  INCORPORATING_PRICE_DIFFERENCE  DECIMAL(17,2) COMMENT '�ϲ��۲�',
  TOTAL_LONG_TERM_INVESTMENT      DECIMAL(17,2) COMMENT '����Ͷ�ʺϼ�',
  ORIGINAL_COST_OF_FIXED_ASSET    DECIMAL(17,2) COMMENT '�̶��ʲ�ԭ��',
  FIXED_ASSET_ACCUMULATED_DEPREC  DECIMAL(17,2) COMMENT '�ۼ��۾�',
  FIXED_ASSETS_NET_VALUE          DECIMAL(17,2) COMMENT '�̶��ʲ���ֵ',
  PROVISION_FORIMPAIRMENT_OF_FIX  DECIMAL(17,2) COMMENT '�̶��ʲ�ֵ��ֵ׼��',
  NET_VALUE_OF_FIXED_ASSETS       DECIMAL(17,2) COMMENT '�̶��ʲ�����',
  FIXED_ASSETS_PENDING_FOR_DISPO  DECIMAL(17,2) COMMENT '�̶��ʲ�����',
  CONSTRUCTION_MATERIALS          DECIMAL(17,2) COMMENT '��������',
  CONSTRUCTIONIN_PROGRESS         DECIMAL(17,2) COMMENT '�ڽ�����',
  UNSETTLED_GL_ON_FIXED_ASSETS    DECIMAL(17,2) COMMENT '������̶��ʲ�����ʧ',
  TOTAL_FIXED_ASSETS              DECIMAL(17,2) COMMENT '�̶��ʲ��ϼ�',
  INTANGIBLE_ASSETS               DECIMAL(17,2) COMMENT '�����ʲ�',
  LAND_USE_RIGHTS                 DECIMAL(17,2) COMMENT '�������ʲ���Ŀ�£�����ʹ��Ȩ',
  DEFERRED_ASSETS                 DECIMAL(17,2) COMMENT '�����ʲ�',
  INCLUDING_FIXED_ASSETS_REPAIR   DECIMAL(17,2) COMMENT '�������ʲ���Ŀ�£��̶��ʲ�����',
  IMPROVEMENT_EXPENDITURE_OF_FIX  DECIMAL(17,2) COMMENT '�������ʲ���Ŀ�£��̶��ʲ�����֧��',
  OTHER_LONG_TERM_ASSETS          DECIMAL(17,2) COMMENT '���������ʲ�',
  AMONG_IT_SPECIALLY_APPROVED_RE  DECIMAL(17,2) COMMENT '�����������ʲ���Ŀ�£���׼��������',
  TOTALINTANGIBLE_ASSETS_AND_OTH  DECIMAL(17,2) COMMENT '���μ������ʲ��ϼ�',
  DEFERRED_ASSETS_DEBITS          DECIMAL(17,2) COMMENT '����˰�����',
  TOTAL_ASSETS                    DECIMAL(17,2) COMMENT '�ʲ��ܼ�',
  SHORT_TERM_BORROWINGS           DECIMAL(17,2) COMMENT '���ڽ��',
  NOTES_PAYABLE                   DECIMAL(17,2) COMMENT 'Ӧ��Ʊ��',
  ACCOUNTS_PAYABLE                DECIMAL(17,2) COMMENT 'Ӧ���˿�',
  RECEIPTSIN_ADVANCE              DECIMAL(17,2) COMMENT 'Ԥ���˿�',
  WAGES_OR_SALARIES_PAYABLES      DECIMAL(17,2) COMMENT 'Ӧ������',
  EMPLOYEE_BENEFITS               DECIMAL(17,2) COMMENT 'Ӧ��������',
  INCOME_PAYABLE                  DECIMAL(17,2) COMMENT 'Ӧ������',
  TAXES_PAYABLE                   DECIMAL(17,2) COMMENT 'Ӧ��˰��',
  OTHER_PAYABLE_TO_GOVERNMENT     DECIMAL(17,2) COMMENT '����Ӧ����',
  OTHER_PAYABLE                   DECIMAL(17,2) COMMENT '����Ӧ����',
  PROVISION_FOR_EXPENSES          DECIMAL(17,2) COMMENT 'Ԥ�����',
  PROVISIONS                      DECIMAL(17,2) COMMENT 'Ԥ�Ƹ�ծ',
  LONG_TERM_LIABILITIES_DUE_WITH  DECIMAL(17,2) COMMENT 'һ���ڵ��ڵĳ��ڸ�ծ',
  OTHER_CURRENT_LIABILITIES       DECIMAL(17,2) COMMENT '����������ծ',
  TOTAL_CURRENT_LIABILITIES       DECIMAL(17,2) COMMENT '������ծ�ϼ�',
  LONG_TERM_BORROWINGS            DECIMAL(17,2) COMMENT '���ڽ��',
  BONDS_PAYABLE                   DECIMAL(17,2) COMMENT 'Ӧ��ծȯ',
  LONG_TERM_PAYABLES              DECIMAL(17,2) COMMENT '����Ӧ����',
  GRANTS_PAYABLE                  DECIMAL(17,2) COMMENT 'ר��Ӧ����',
  OTHER_LONG_TERM_LIABILITIES     DECIMAL(17,2) COMMENT '�������ڸ�ծ',
  SPECIAL_RESERVE_FUND            DECIMAL(17,2) COMMENT '���������ڸ�ծ��Ŀ�£���׼��������',
  TOTAL_LONG_TERM_LIABILITIES     DECIMAL(17,2) COMMENT '���ڸ�ծ�ϼ�',
  DEFERRED_TAXATION_CREDIT        DECIMAL(17,2) COMMENT '����˰�����',
  TOTALLIABILITIES                DECIMAL(17,2) COMMENT '��ծ�ϼ�',
  MINORITY_INTEREST               DECIMAL(17,2) COMMENT '�����ɶ�Ȩ��',
  PAIDIN_CAPITAL                  DECIMAL(17,2) COMMENT 'ʵ���ʱ�',
  NATIONAL_CAPITAL                DECIMAL(17,2) COMMENT '�����ʱ�',
  COLLECTIVE_CAPITAL              DECIMAL(17,2) COMMENT '�����ʱ�',
  LEGAL_PERSONS_CAPITAL           DECIMAL(17,2) COMMENT '�����ʱ�',
  STATE_OWNED_LEGAL_PERSONS_CAPI  DECIMAL(17,2) COMMENT '�������ʱ���Ŀ�£����з����ʱ�',
  COLLECTIVE_LEGAL_PERSONS_CAPIT  DECIMAL(17,2) COMMENT '�������ʱ���Ŀ�£����巨���ʱ�',
  PERSONAL_CAPITAL                DECIMAL(17,2) COMMENT '�����ʱ�',
  FOREIGN_BUSINESSMENS_CAPITAL    DECIMAL(17,2) COMMENT '�����ʱ�',
  CAPITALR_RSERVE                 DECIMAL(17,2) COMMENT '�ʱ�����',
  SURPLUS_RESERVE                 DECIMAL(17,2) COMMENT 'ӯ�๫��',
  STATUTORY_SURPLUS_RESERVE       DECIMAL(17,2) COMMENT '��ӯ�๫����Ŀ�£�����ӯ�๫��',
  PUBLIC_WELFARE_FUND             DECIMAL(17,2) COMMENT '��ӯ�๫����Ŀ�£������',
  SUPPLERMENTARY_CURRENT_CAPITAL  DECIMAL(17,2) COMMENT '��ӯ�๫����Ŀ�£����������ʱ�',
  UNAFFIRMEDINVESTMENT_LOSS       DECIMAL(17,2) COMMENT 'δȷ�ϵ�Ͷ����ʧ',
  UNAPPROPRIATED_PROFIT           DECIMAL(17,2) COMMENT 'δ��������',
  DIFFERENCE_ON_TRANSLATION_OF_F  DECIMAL(17,2) COMMENT '��ұ���������',
  TOTAL_EQUITY                    DECIMAL(17,2) COMMENT '������Ȩ��ϼ�',
  TOTAL_EQUITY_AND_LIABILITIES    DECIMAL(17,2) COMMENT '��ծ��������Ȩ���ܼ�',
  EHA_BALANCE_SHEET_BS_SGMT_ID    NCHAR(32)     NOT NULL COMMENT '�������',
  RPT_DATE                        NCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_BALANCE_SHEET02 COMMENT '610-��ҵ�ʲ���ծ��02�ʲ���ծ���';

 DROP TABLE IF EXISTS E_BALANCE_SHEET02_HIST;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_BALANCE_SHEET02_HIST
(
  EHB_BALANCE_SHEET2002_SGMT_ID   NCHAR(32)     NOT NULL COMMENT '610-��ҵ�ʲ���ծ��02�ʲ���ծ�������',
  CURRENCY_FUNDS                  DECIMAL(17,2) COMMENT '�����ʽ�',
  SHORT_TERM_INVESTMENTS          DECIMAL(17,2) COMMENT '����Ͷ��',
  NOTES_RECEIVABLE                DECIMAL(17,2) COMMENT 'Ӧ��Ʊ��',
  DIVIDENDS_RECEIVABLE            DECIMAL(17,2) COMMENT 'Ӧ�չ���',
  INTEREST_RECEIVABLE             DECIMAL(17,2) COMMENT 'Ӧ����Ϣ',
  ACCOUNTS_RECEIVABLE             DECIMAL(17,2) COMMENT 'Ӧ���˿�',
  OTHER_RECEIVABLES               DECIMAL(17,2) COMMENT '����Ӧ�տ�',
  PREPAYMENTS                     DECIMAL(17,2) COMMENT 'Ԥ���˿�',
  FUTURE_GUARANTEE                DECIMAL(17,2) COMMENT '�ڻ���֤��',
  ALLOWANCE_RECEIVABLE            DECIMAL(17,2) COMMENT 'Ӧ�ղ�����',
  EXPORT_DRAWBACK_RECEIVABLE      DECIMAL(17,2) COMMENT 'Ӧ�ճ�����˰',
  INVENTORIES                     DECIMAL(17,2) COMMENT '���',
  RAW_MATERIALS                   DECIMAL(17,2) COMMENT '���ԭ����',
  FINISHED_PRODUCTS               DECIMAL(17,2) COMMENT '�������Ʒ ',
  DEFERRED_EXPENSES               DECIMAL(17,2) COMMENT '��̯����',
  UNSETTLED_GLON_CURRENT_ASSETS   DECIMAL(17,2) COMMENT '�����������ʲ�����ʧ',
  LONG_TERM_DEBENTURE_INVESTMENT  DECIMAL(17,2) COMMENT 'һ���ڵ��ڵĳ���ծȨͶ��',
  OTHER_CURRENT_ASSETS            DECIMAL(17,2) COMMENT '���������ʲ�',
  TOTAL_CURRENT_ASSETS            DECIMAL(17,2) COMMENT '�����ʲ��ϼ�',
  LONG_TERM_INVESTMENT            DECIMAL(17,2) COMMENT '����Ͷ��',
  LONG_TERM_EQUITY_INVESTMENT     DECIMAL(17,2) COMMENT '���ڹ�ȨͶ��',
  LONG_TERM_SECURITIES_INVESTMEN  DECIMAL(17,2) COMMENT '����ծȨͶ��',
  INCORPORATING_PRICE_DIFFERENCE  DECIMAL(17,2) COMMENT '�ϲ��۲�',
  TOTAL_LONG_TERM_INVESTMENT      DECIMAL(17,2) COMMENT '����Ͷ�ʺϼ�',
  ORIGINAL_COST_OF_FIXED_ASSET    DECIMAL(17,2) COMMENT '�̶��ʲ�ԭ��',
  FIXED_ASSET_ACCUMULATED_DEPREC  DECIMAL(17,2) COMMENT '�ۼ��۾�',
  FIXED_ASSETS_NET_VALUE          DECIMAL(17,2) COMMENT '�̶��ʲ���ֵ',
  PROVISION_FORIMPAIRMENT_OF_FIX  DECIMAL(17,2) COMMENT '�̶��ʲ�ֵ��ֵ׼��',
  NET_VALUE_OF_FIXED_ASSETS       DECIMAL(17,2) COMMENT '�̶��ʲ�����',
  FIXED_ASSETS_PENDING_FOR_DISPO  DECIMAL(17,2) COMMENT '�̶��ʲ�����',
  CONSTRUCTION_MATERIALS          DECIMAL(17,2) COMMENT '��������',
  CONSTRUCTIONIN_PROGRESS         DECIMAL(17,2) COMMENT '�ڽ�����',
  UNSETTLED_GL_ON_FIXED_ASSETS    DECIMAL(17,2) COMMENT '������̶��ʲ�����ʧ',
  TOTAL_FIXED_ASSETS              DECIMAL(17,2) COMMENT '�̶��ʲ��ϼ�',
  INTANGIBLE_ASSETS               DECIMAL(17,2) COMMENT '�����ʲ�',
  LAND_USE_RIGHTS                 DECIMAL(17,2) COMMENT '�������ʲ���Ŀ�£�����ʹ��Ȩ',
  DEFERRED_ASSETS                 DECIMAL(17,2) COMMENT '�����ʲ�',
  INCLUDING_FIXED_ASSETS_REPAIR   DECIMAL(17,2) COMMENT '�������ʲ���Ŀ�£��̶��ʲ�����',
  IMPROVEMENT_EXPENDITURE_OF_FIX  DECIMAL(17,2) COMMENT '�������ʲ���Ŀ�£��̶��ʲ�����֧��',
  OTHER_LONG_TERM_ASSETS          DECIMAL(17,2) COMMENT '���������ʲ�',
  AMONG_IT_SPECIALLY_APPROVED_RE  DECIMAL(17,2) COMMENT '�����������ʲ���Ŀ�£���׼��������',
  TOTALINTANGIBLE_ASSETS_AND_OTH  DECIMAL(17,2) COMMENT '���μ������ʲ��ϼ�',
  DEFERRED_ASSETS_DEBITS          DECIMAL(17,2) COMMENT '����˰�����',
  TOTAL_ASSETS                    DECIMAL(17,2) COMMENT '�ʲ��ܼ�',
  SHORT_TERM_BORROWINGS           DECIMAL(17,2) COMMENT '���ڽ��',
  NOTES_PAYABLE                   DECIMAL(17,2) COMMENT 'Ӧ��Ʊ��',
  ACCOUNTS_PAYABLE                DECIMAL(17,2) COMMENT 'Ӧ���˿�',
  RECEIPTSIN_ADVANCE              DECIMAL(17,2) COMMENT 'Ԥ���˿�',
  WAGES_OR_SALARIES_PAYABLES      DECIMAL(17,2) COMMENT 'Ӧ������',
  EMPLOYEE_BENEFITS               DECIMAL(17,2) COMMENT 'Ӧ��������',
  INCOME_PAYABLE                  DECIMAL(17,2) COMMENT 'Ӧ������',
  TAXES_PAYABLE                   DECIMAL(17,2) COMMENT 'Ӧ��˰��',
  OTHER_PAYABLE_TO_GOVERNMENT     DECIMAL(17,2) COMMENT '����Ӧ����',
  OTHER_PAYABLE                   DECIMAL(17,2) COMMENT '����Ӧ����',
  PROVISION_FOR_EXPENSES          DECIMAL(17,2) COMMENT 'Ԥ�����',
  PROVISIONS                      DECIMAL(17,2) COMMENT 'Ԥ�Ƹ�ծ',
  LONG_TERM_LIABILITIES_DUE_WITH  DECIMAL(17,2) COMMENT 'һ���ڵ��ڵĳ��ڸ�ծ',
  OTHER_CURRENT_LIABILITIES       DECIMAL(17,2) COMMENT '����������ծ',
  TOTAL_CURRENT_LIABILITIES       DECIMAL(17,2) COMMENT '������ծ�ϼ�',
  LONG_TERM_BORROWINGS            DECIMAL(17,2) COMMENT '���ڽ��',
  BONDS_PAYABLE                   DECIMAL(17,2) COMMENT 'Ӧ��ծȯ',
  LONG_TERM_PAYABLES              DECIMAL(17,2) COMMENT '����Ӧ����',
  GRANTS_PAYABLE                  DECIMAL(17,2) COMMENT 'ר��Ӧ����',
  OTHER_LONG_TERM_LIABILITIES     DECIMAL(17,2) COMMENT '�������ڸ�ծ',
  SPECIAL_RESERVE_FUND            DECIMAL(17,2) COMMENT '���������ڸ�ծ��Ŀ�£���׼��������',
  TOTAL_LONG_TERM_LIABILITIES     DECIMAL(17,2) COMMENT '���ڸ�ծ�ϼ�',
  DEFERRED_TAXATION_CREDIT        DECIMAL(17,2) COMMENT '����˰�����',
  TOTALLIABILITIES                DECIMAL(17,2) COMMENT '��ծ�ϼ�',
  MINORITY_INTEREST               DECIMAL(17,2) COMMENT '�����ɶ�Ȩ��',
  PAIDIN_CAPITAL                  DECIMAL(17,2) COMMENT 'ʵ���ʱ�',
  NATIONAL_CAPITAL                DECIMAL(17,2) COMMENT '�����ʱ�',
  COLLECTIVE_CAPITAL              DECIMAL(17,2) COMMENT '�����ʱ�',
  LEGAL_PERSONS_CAPITAL           DECIMAL(17,2) COMMENT '�����ʱ�',
  STATE_OWNED_LEGAL_PERSONS_CAPI  DECIMAL(17,2) COMMENT '�������ʱ���Ŀ�£����з����ʱ�',
  COLLECTIVE_LEGAL_PERSONS_CAPIT  DECIMAL(17,2) COMMENT '�������ʱ���Ŀ�£����巨���ʱ�',
  PERSONAL_CAPITAL                DECIMAL(17,2) COMMENT '�����ʱ�',
  FOREIGN_BUSINESSMENS_CAPITAL    DECIMAL(17,2) COMMENT '�����ʱ�',
  CAPITALR_RSERVE                 DECIMAL(17,2) COMMENT '�ʱ�����',
  SURPLUS_RESERVE                 DECIMAL(17,2) COMMENT 'ӯ�๫��',
  STATUTORY_SURPLUS_RESERVE       DECIMAL(17,2) COMMENT '��ӯ�๫����Ŀ�£�����ӯ�๫��',
  PUBLIC_WELFARE_FUND             DECIMAL(17,2) COMMENT '��ӯ�๫����Ŀ�£������',
  SUPPLERMENTARY_CURRENT_CAPITAL  DECIMAL(17,2) COMMENT '��ӯ�๫����Ŀ�£����������ʱ�',
  UNAFFIRMEDINVESTMENT_LOSS       DECIMAL(17,2) COMMENT 'δȷ�ϵ�Ͷ����ʧ',
  UNAPPROPRIATED_PROFIT           DECIMAL(17,2) COMMENT 'δ��������',
  DIFFERENCE_ON_TRANSLATION_OF_F  DECIMAL(17,2) COMMENT '��ұ���������',
  TOTAL_EQUITY                    DECIMAL(17,2) COMMENT '������Ȩ��ϼ�',
  TOTAL_EQUITY_AND_LIABILITIES    DECIMAL(17,2) COMMENT '��ծ��������Ȩ���ܼ�',
  EHA_BALANCE_SHEET_BS_SGMT_ID    NCHAR(32)     NOT NULL COMMENT '�������',
  RPT_DATE                        NCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_BALANCE_SHEET02_HIST COMMENT '610-��ҵ�ʲ���ծ��02�ʲ���ծ���';

 DROP TABLE IF EXISTS E_BALANCE_SHEET07;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_BALANCE_SHEET07
(
  EHC_BALANCE_SHEET2007_SGMT_ID   NCHAR(32)     NOT NULL COMMENT '610-��ҵ�ʲ���ծ��07�ʲ���ծ�������',
  CURRENCY_FUNDS                  DECIMAL(17,2) COMMENT '�����ʽ�',
  FINANCIAL_ASSETS_HELD_FOR_TRAD  DECIMAL(17,2) COMMENT '�����Խ����ʲ�',
  NOTES_RECEIVABLE                DECIMAL(17,2) COMMENT 'Ӧ��Ʊ��',
  ACCOUNTS_RECEIVABLE             DECIMAL(17,2) COMMENT 'Ӧ���˿�',
  PREPAYMENTS                     DECIMAL(17,2) COMMENT 'Ԥ���˿�',
  INTEREST_RECEIVABLE             DECIMAL(17,2) COMMENT 'Ӧ����Ϣ',
  DIVIDENDS_RECEIVABLE            DECIMAL(17,2) COMMENT 'Ӧ�չ���',
  OTHER_RECEIVABLES               DECIMAL(17,2) COMMENT '����Ӧ�տ�',
  INVENTORIES                     DECIMAL(17,2) COMMENT '���',
  CURRENT_PORTION_OF_NON_CURRENT  DECIMAL(17,2) COMMENT 'һ���ڵ��ڵķ������ʲ�',
  OTHER_CURRENT_ASSETS            DECIMAL(17,2) COMMENT '���������ʲ�',
  TOTAL_CURRENT_ASSETS            DECIMAL(17,2) COMMENT '�����ʲ��ϼ�',
  FINANCIAL_ASSETS_AVAILABLE_FOR  DECIMAL(17,2) COMMENT '�ɹ����۵Ľ����ʲ�',
  HELD_TO_MATURITY_INVESTMENTS    DECIMAL(17,2) COMMENT '����������Ͷ��',
  LONG_TERM_EQUITY_INVESTMENT     DECIMAL(17,2) COMMENT '���ڹ�ȨͶ��',
  LONG_TERM_RECEIVABLES           DECIMAL(17,2) COMMENT '����Ӧ�տ�',
  INVESTMENT_PROPERTIES           DECIMAL(17,2) COMMENT 'Ͷ���Է��ز�',
  FIXED_ASSETS                    DECIMAL(17,2) COMMENT '�̶��ʲ�',
  CONSTRUCTION_IN_PROGRESS        DECIMAL(17,2) COMMENT '�ڽ�����',
  CONSTRUCTION_MATERIALS          DECIMAL(17,2) COMMENT '��������',
  FIXED_ASSETS_PENDING_FOR_DISPO  DECIMAL(17,2) COMMENT '�̶��ʲ�����',
  NON_CURRENT_BIOLOGICAL_ASSETS   DECIMAL(17,2) COMMENT '�����������ʲ�',
  OIL_AND_GAS_ASSETS              DECIMAL(17,2) COMMENT '�����ʲ�',
  INTANGIBLE_ASSETS               DECIMAL(17,2) COMMENT '�����ʲ�',
  DEVELOPMENT_DISBURSEMENTS       DECIMAL(17,2) COMMENT '����֧��',
  GOOD_WILL                       DECIMAL(17,2) COMMENT '����',
  LONG_TERM_DEFERRED_EXPENSES     DECIMAL(17,2) COMMENT '���ڴ�̯����',
  DEFERRED_TAX_ASSETS             DECIMAL(17,2) COMMENT '��������˰�ʲ�',
  OTHER_NON_CURRENT_ASSETS        DECIMAL(17,2) COMMENT '�����������ʲ�',
  TOTAL_NON_CURRENT_ASSETS        DECIMAL(17,2) COMMENT '�������ʲ��ϼ�',
  TOTAL_ASSETS                    DECIMAL(17,2) COMMENT '�ʲ��ܼ�',
  SHORT_TERM_BORROWINGS           DECIMAL(17,2) COMMENT '���ڽ��',
  FINANCIAL_LIABILITIES_HELD_FOR  DECIMAL(17,2) COMMENT '�����Խ��ڸ�ծ',
  NOTES_PAYABLE                   DECIMAL(17,2) COMMENT 'Ӧ��Ʊ��',
  ACCOUNTS_PAYABLE                DECIMAL(17,2) COMMENT 'Ӧ���˿�',
  RECEIPTSIN_ADVANCE              DECIMAL(17,2) COMMENT 'Ԥ���˿�',
  INTEREST_PAYABLE                DECIMAL(17,2) COMMENT 'Ӧ����Ϣ',
  EMPLOYEE_BENEFITS_PAYABLE       DECIMAL(17,2) COMMENT 'Ӧ��ְ��н��',
  TAXS_PAYABLE                    DECIMAL(17,2) COMMENT 'Ӧ��˰��',
  DIVIDENDS_PAYABLE               DECIMAL(17,2) COMMENT 'Ӧ������',
  OTHER_PAYABLES                  DECIMAL(17,2) COMMENT '����Ӧ����',
  CURRENT_PORTION_OF_LONG_TERM_L  DECIMAL(17,2) COMMENT 'һ���ڵ��ڵķ�������ծ',
  OTHER_CURRENT_LIABILITIES       DECIMAL(17,2) COMMENT '����������ծ',
  TOTAL_CURRENT_LIABILITIES       DECIMAL(17,2) COMMENT '������ծ�ϼ�',
  LONG_TERM_BORROWINGS            DECIMAL(17,2) COMMENT '���ڽ��',
  BONDS_PAYABLES                  DECIMAL(17,2) COMMENT 'Ӧ��ծȯ',
  LONG_TERM_PAYABLES              DECIMAL(17,2) COMMENT '����Ӧ����',
  GRANTS_PAYABLE                  DECIMAL(17,2) COMMENT 'ר��Ӧ����',
  PROVISIONS                      DECIMAL(17,2) COMMENT 'Ԥ�Ƹ�ծ',
  DEFERRED_TAX_LIABILITIES        DECIMAL(17,2) COMMENT '��������˰��ծ',
  OTHER_NON_CURRENT_LIABILITIES   DECIMAL(17,2) COMMENT '������������ծ',
  TOTAL_NON_CURRENT_LIABILITIES   DECIMAL(17,2) COMMENT '��������ծ�ϼ�',
  TOTAL_LIABILITIES               DECIMAL(17,2) COMMENT '��ծ�ϼ�',
  PAIDIN_CAPITAL_OR_SHARE_CAPITA  DECIMAL(17,2) COMMENT 'ʵ���ʱ�����ɱ���',
  CAPITALR_RSERVE                 DECIMAL(17,2) COMMENT '�ʱ�����',
  LESS_TREASURY_STOCKS            DECIMAL(17,2) COMMENT '��������',
  SURPLUS_RESERVE                 DECIMAL(17,2) COMMENT 'ӯ�๫��',
  UNAPPROPRIATED_PROFIT           DECIMAL(17,2) COMMENT 'δ��������',
  TOTAL_EQUITY                    DECIMAL(17,2) COMMENT '������Ȩ��ϼ�',
  TOTAL_EQUITY_AND_LIABILITIES    DECIMAL(17,2) COMMENT '��ծ��������Ȩ��ϼ�',
  EHA_BALANCE_SHEET_BS_SGMT_ID    NCHAR(32)     NOT NULL COMMENT '�������',
  RPT_DATE                        NCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_BALANCE_SHEET07 COMMENT '610-��ҵ�ʲ���ծ��07�ʲ���ծ���';

 DROP TABLE IF EXISTS E_BALANCE_SHEET07_HIST;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_BALANCE_SHEET07_HIST
(
  EHC_BALANCE_SHEET2007_SGMT_ID   NCHAR(32)     NOT NULL COMMENT '610-��ҵ�ʲ���ծ��07�ʲ���ծ�������',
  CURRENCY_FUNDS                  DECIMAL(17,2) COMMENT '�����ʽ�',
  FINANCIAL_ASSETS_HELD_FOR_TRAD  DECIMAL(17,2) COMMENT '�����Խ����ʲ�',
  NOTES_RECEIVABLE                DECIMAL(17,2) COMMENT 'Ӧ��Ʊ��',
  ACCOUNTS_RECEIVABLE             DECIMAL(17,2) COMMENT 'Ӧ���˿�',
  PREPAYMENTS                     DECIMAL(17,2) COMMENT 'Ԥ���˿�',
  INTEREST_RECEIVABLE             DECIMAL(17,2) COMMENT 'Ӧ����Ϣ',
  DIVIDENDS_RECEIVABLE            DECIMAL(17,2) COMMENT 'Ӧ�չ���',
  OTHER_RECEIVABLES               DECIMAL(17,2) COMMENT '����Ӧ�տ�',
  INVENTORIES                     DECIMAL(17,2) COMMENT '���',
  CURRENT_PORTION_OF_NON_CURRENT  DECIMAL(17,2) COMMENT 'һ���ڵ��ڵķ������ʲ�',
  OTHER_CURRENT_ASSETS            DECIMAL(17,2) COMMENT '���������ʲ�',
  TOTAL_CURRENT_ASSETS            DECIMAL(17,2) COMMENT '�����ʲ��ϼ�',
  FINANCIAL_ASSETS_AVAILABLE_FOR  DECIMAL(17,2) COMMENT '�ɹ����۵Ľ����ʲ�',
  HELD_TO_MATURITY_INVESTMENTS    DECIMAL(17,2) COMMENT '����������Ͷ��',
  LONG_TERM_EQUITY_INVESTMENT     DECIMAL(17,2) COMMENT '���ڹ�ȨͶ��',
  LONG_TERM_RECEIVABLES           DECIMAL(17,2) COMMENT '����Ӧ�տ�',
  INVESTMENT_PROPERTIES           DECIMAL(17,2) COMMENT 'Ͷ���Է��ز�',
  FIXED_ASSETS                    DECIMAL(17,2) COMMENT '�̶��ʲ�',
  CONSTRUCTION_IN_PROGRESS        DECIMAL(17,2) COMMENT '�ڽ�����',
  CONSTRUCTION_MATERIALS          DECIMAL(17,2) COMMENT '��������',
  FIXED_ASSETS_PENDING_FOR_DISPO  DECIMAL(17,2) COMMENT '�̶��ʲ�����',
  NON_CURRENT_BIOLOGICAL_ASSETS   DECIMAL(17,2) COMMENT '�����������ʲ�',
  OIL_AND_GAS_ASSETS              DECIMAL(17,2) COMMENT '�����ʲ�',
  INTANGIBLE_ASSETS               DECIMAL(17,2) COMMENT '�����ʲ�',
  DEVELOPMENT_DISBURSEMENTS       DECIMAL(17,2) COMMENT '����֧��',
  GOOD_WILL                       DECIMAL(17,2) COMMENT '����',
  LONG_TERM_DEFERRED_EXPENSES     DECIMAL(17,2) COMMENT '���ڴ�̯����',
  DEFERRED_TAX_ASSETS             DECIMAL(17,2) COMMENT '��������˰�ʲ�',
  OTHER_NON_CURRENT_ASSETS        DECIMAL(17,2) COMMENT '�����������ʲ�',
  TOTAL_NON_CURRENT_ASSETS        DECIMAL(17,2) COMMENT '�������ʲ��ϼ�',
  TOTAL_ASSETS                    DECIMAL(17,2) COMMENT '�ʲ��ܼ�',
  SHORT_TERM_BORROWINGS           DECIMAL(17,2) COMMENT '���ڽ��',
  FINANCIAL_LIABILITIES_HELD_FOR  DECIMAL(17,2) COMMENT '�����Խ��ڸ�ծ',
  NOTES_PAYABLE                   DECIMAL(17,2) COMMENT 'Ӧ��Ʊ��',
  ACCOUNTS_PAYABLE                DECIMAL(17,2) COMMENT 'Ӧ���˿�',
  RECEIPTSIN_ADVANCE              DECIMAL(17,2) COMMENT 'Ԥ���˿�',
  INTEREST_PAYABLE                DECIMAL(17,2) COMMENT 'Ӧ����Ϣ',
  EMPLOYEE_BENEFITS_PAYABLE       DECIMAL(17,2) COMMENT 'Ӧ��ְ��н��',
  TAXS_PAYABLE                    DECIMAL(17,2) COMMENT 'Ӧ��˰��',
  DIVIDENDS_PAYABLE               DECIMAL(17,2) COMMENT 'Ӧ������',
  OTHER_PAYABLES                  DECIMAL(17,2) COMMENT '����Ӧ����',
  CURRENT_PORTION_OF_LONG_TERM_L  DECIMAL(17,2) COMMENT 'һ���ڵ��ڵķ�������ծ',
  OTHER_CURRENT_LIABILITIES       DECIMAL(17,2) COMMENT '����������ծ',
  TOTAL_CURRENT_LIABILITIES       DECIMAL(17,2) COMMENT '������ծ�ϼ�',
  LONG_TERM_BORROWINGS            DECIMAL(17,2) COMMENT '���ڽ��',
  BONDS_PAYABLES                  DECIMAL(17,2) COMMENT 'Ӧ��ծȯ',
  LONG_TERM_PAYABLES              DECIMAL(17,2) COMMENT '����Ӧ����',
  GRANTS_PAYABLE                  DECIMAL(17,2) COMMENT 'ר��Ӧ����',
  PROVISIONS                      DECIMAL(17,2) COMMENT 'Ԥ�Ƹ�ծ',
  DEFERRED_TAX_LIABILITIES        DECIMAL(17,2) COMMENT '��������˰��ծ',
  OTHER_NON_CURRENT_LIABILITIES   DECIMAL(17,2) COMMENT '������������ծ',
  TOTAL_NON_CURRENT_LIABILITIES   DECIMAL(17,2) COMMENT '��������ծ�ϼ�',
  TOTAL_LIABILITIES               DECIMAL(17,2) COMMENT '��ծ�ϼ�',
  PAIDIN_CAPITAL_OR_SHARE_CAPITA  DECIMAL(17,2) COMMENT 'ʵ���ʱ�����ɱ���',
  CAPITALR_RSERVE                 DECIMAL(17,2) COMMENT '�ʱ�����',
  LESS_TREASURY_STOCKS            DECIMAL(17,2) COMMENT '��������',
  SURPLUS_RESERVE                 DECIMAL(17,2) COMMENT 'ӯ�๫��',
  UNAPPROPRIATED_PROFIT           DECIMAL(17,2) COMMENT 'δ��������',
  TOTAL_EQUITY                    DECIMAL(17,2) COMMENT '������Ȩ��ϼ�',
  TOTAL_EQUITY_AND_LIABILITIES    DECIMAL(17,2) COMMENT '��ծ��������Ȩ��ϼ�',
  EHA_BALANCE_SHEET_BS_SGMT_ID    NCHAR(32)     NOT NULL COMMENT '�������',
  RPT_DATE                        NCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_BALANCE_SHEET07_HIST COMMENT '610-��ҵ�ʲ���ծ��07�ʲ���ծ���';

 DROP TABLE IF EXISTS E_BALANCE_SHEET_BS;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_BALANCE_SHEET_BS
(
  EHA_BALANCE_SHEET_BS_SGMT_ID  NCHAR(32)       NOT NULL COMMENT '610-��ҵ�ʲ���ծ�����������',
  INF_REC_TYPE                  NCHAR(3) COMMENT '��Ϣ��¼����',
  ENT_NAME                      NVARCHAR(80) COMMENT '��ҵ����',
  ENT_CERT_TYPE                 NVARCHAR(2) COMMENT '��ҵ��ݱ�ʶ����',
  ENT_CERT_NUM                  NVARCHAR(40) COMMENT '��ҵ��ݱ�ʶ����',
  RPT_DATE                      NCHAR(10) COMMENT '��Ϣ��������',
  SHEET_YEAR                    NCHAR(4) COMMENT '�������',
  SHEET_TYPE                    NCHAR(2) COMMENT '��������',
  SHEET_TYPE_DIVIDE             NCHAR(1) COMMENT '��������ϸ��',
  AUDIT_FIRM_NAME               NVARCHAR(80) COMMENT '�������������',
  AUDITOR_NAME                  NVARCHAR(30) COMMENT '�����Ա����',
  AUDIT_TIME                    NVARCHAR(10) COMMENT '���ʱ��',
  CIMOC                         NCHAR(14) COMMENT '�ͻ�����ά����������',
  RPT_DATE_CODE                 NCHAR(2) COMMENT '����ʱ��˵������',
  LAST_UPDATE_TIME              NVARCHAR(10) COMMENT '������ʱ��',
  OPERATOR_USER                 NVARCHAR(50) COMMENT '����Ա',
  ORG_NAME                      NVARCHAR(100) COMMENT '������Դ��������',
  ORG_CODE                      NVARCHAR(100) COMMENT '������Դ�������',
  BUSINESS_STATES               NVARCHAR(50) COMMENT '����״̬',
  REJECT_REASON                 NVARCHAR(255) COMMENT '����ԭ��',
  IS_FILTER                     NCHAR(1) COMMENT '�Ƿ���˱�ʶ(Ĭ��ΪN-������)',
  REPORT_MESSAGE_ID             NVARCHAR(60) COMMENT '�����ļ�ID',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                       NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                       NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                       NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_BALANCE_SHEET_BS COMMENT '610-��ҵ�ʲ���ծ�������';

 DROP TABLE IF EXISTS E_BALANCE_SHEET_BS_HIST;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_BALANCE_SHEET_BS_HIST
(
  EHA_BALANCE_SHEET_BS_SGMT_ID  NCHAR(32)       NOT NULL COMMENT '610-��ҵ�ʲ���ծ�����������',
  INF_REC_TYPE                  NCHAR(3) COMMENT '��Ϣ��¼����',
  ENT_NAME                      NVARCHAR(80) COMMENT '��ҵ����',
  ENT_CERT_TYPE                 NVARCHAR(2) COMMENT '��ҵ��ݱ�ʶ����',
  ENT_CERT_NUM                  NVARCHAR(40) COMMENT '��ҵ��ݱ�ʶ����',
  RPT_DATE                      NCHAR(10) COMMENT '��Ϣ��������',
  SHEET_YEAR                    NCHAR(4) COMMENT '�������',
  SHEET_TYPE                    NCHAR(2) COMMENT '��������',
  SHEET_TYPE_DIVIDE             NCHAR(1) COMMENT '��������ϸ��',
  AUDIT_FIRM_NAME               NVARCHAR(80) COMMENT '�������������',
  AUDITOR_NAME                  NVARCHAR(30) COMMENT '�����Ա����',
  AUDIT_TIME                    NVARCHAR(10) COMMENT '���ʱ��',
  CIMOC                         NCHAR(14) COMMENT '�ͻ�����ά����������',
  RPT_DATE_CODE                 NCHAR(2) COMMENT '����ʱ��˵������',
  LAST_UPDATE_TIME              NVARCHAR(10) COMMENT '������ʱ��',
  OPERATOR_USER                 NVARCHAR(50) COMMENT '����Ա',
  ORG_NAME                      NVARCHAR(100) COMMENT '������Դ��������',
  ORG_CODE                      NVARCHAR(100) COMMENT '������Դ�������',
  BUSINESS_STATES               NVARCHAR(50) COMMENT '����״̬',
  REJECT_REASON                 NVARCHAR(255) COMMENT '����ԭ��',
  IS_FILTER                     NCHAR(1) COMMENT '�Ƿ���˱�ʶ(Ĭ��ΪN-������)',
  REPORT_MESSAGE_ID             NVARCHAR(60) COMMENT '�����ļ�ID',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                       NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                       NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                       NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_BALANCE_SHEET_BS_HIST COMMENT '610-��ҵ�ʲ���ծ�������';

 DROP TABLE IF EXISTS E_BALANCE_SHEET_BS_MIDDLE;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_BALANCE_SHEET_BS_MIDDLE
(
  ENT_CERT_TYPE  NVARCHAR(36)                  NOT NULL COMMENT '��ҵ��ݱ�ʶ����',
  ENT_CERT_NUM   NVARCHAR(60)                  NOT NULL COMMENT '��ҵ��ݱ�ʶ����',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1        NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2        NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3        NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_BALANCE_SHEET_BS_MIDDLE COMMENT '610-��ҵ�ʲ���ծ��������м��';

 DROP TABLE IF EXISTS E_BALANCE_SHEET_DLT;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_BALANCE_SHEET_DLT
(
  EMZ_BALANCE_SHEET_DLT_ID  NCHAR(32)           NOT NULL COMMENT '��ҵ�Ʊ�������Ϣ-����ɾ������������',
  INF_REC_TYPE              NCHAR(3) COMMENT '��Ϣ��¼����',
  ENT_NAME                  NVARCHAR(80) COMMENT '��ҵ����',
  ENT_CERT_TYPE             NCHAR(2) COMMENT '��ҵ��ݱ�ʶ����',
  ENT_CERT_NUM              NVARCHAR(40) COMMENT '��ҵ��ݱ�ʶ����',
  SHEET_YEAR                NCHAR(4) COMMENT '�������',
  SHEET_TYPE                NCHAR(2) COMMENT '��������',
  SHEET_TYPE_DIVIDE         NCHAR(1) COMMENT '��������ϸ��',
  LAST_UPDATE_TIME          NVARCHAR(10) COMMENT '������ʱ��',
  OPERATOR_USER             NVARCHAR(50) COMMENT '����Ա',
  ORG_NAME                  NVARCHAR(100) COMMENT '������Դ��������',
  ORG_CODE                  NVARCHAR(100) COMMENT '������Դ�������',
  BUSINESS_STATES           NVARCHAR(50) COMMENT '����״̬',
  REJECT_REASON             NVARCHAR(255) COMMENT '����ԭ��',
  IS_FILTER                 NCHAR(1) COMMENT '�Ƿ���˱�ʶ(Ĭ��ΪN-������)',
  REPORT_MESSAGE_ID         NVARCHAR(60) COMMENT '�����ļ�ID',
  RPT_DATE                  NCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                   NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                   NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                   NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_BALANCE_SHEET_DLT COMMENT '��ҵ�Ʊ�������Ϣ-����ɾ��������';

 DROP TABLE IF EXISTS E_BALANCE_SHEET_DLT_HIST;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_BALANCE_SHEET_DLT_HIST
(
  EMZ_BALANCE_SHEET_DLT_ID  NCHAR(32)           NOT NULL COMMENT '��ҵ�Ʊ�������Ϣ-����ɾ������������',
  INF_REC_TYPE              NCHAR(3) COMMENT '��Ϣ��¼����',
  ENT_NAME                  NVARCHAR(80) COMMENT '��ҵ����',
  ENT_CERT_TYPE             NCHAR(2) COMMENT '��ҵ��ݱ�ʶ����',
  ENT_CERT_NUM              NVARCHAR(40) COMMENT '��ҵ��ݱ�ʶ����',
  SHEET_YEAR                NCHAR(4) COMMENT '�������',
  SHEET_TYPE                NCHAR(2) COMMENT '��������',
  SHEET_TYPE_DIVIDE         NCHAR(1) COMMENT '��������ϸ��',
  LAST_UPDATE_TIME          NVARCHAR(10) COMMENT '������ʱ��',
  OPERATOR_USER             NVARCHAR(50) COMMENT '����Ա',
  ORG_NAME                  NVARCHAR(100) COMMENT '������Դ��������',
  ORG_CODE                  NVARCHAR(100) COMMENT '������Դ�������',
  BUSINESS_STATES           NVARCHAR(50) COMMENT '����״̬',
  REJECT_REASON             NVARCHAR(255) COMMENT '����ԭ��',
  IS_FILTER                 NCHAR(1) COMMENT '�Ƿ���˱�ʶ(Ĭ��ΪN-������)',
  REPORT_MESSAGE_ID         NVARCHAR(60) COMMENT '�����ļ�ID',
  RPT_DATE                  NCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                   NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                   NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                   NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_BALANCE_SHEET_DLT_HIST COMMENT '��ҵ�Ʊ�������Ϣ-����ɾ��������';

 DROP TABLE IF EXISTS E_BS;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_BS
(
  EAA_BS_SGMT_ID     NCHAR(32)                  NOT NULL COMMENT '310-��ҵ������Ϣ����������',
  INF_REC_TYPE       NCHAR(3) COMMENT '��Ϣ��¼����',
  ENT_NAME           NVARCHAR(80) COMMENT '��ҵ����',
  ENT_CERT_TYPE      NCHAR(2) COMMENT '��ҵ��ݱ�ʶ����',
  ENT_CERT_NUM       NVARCHAR(40) COMMENT '��ҵ��ݱ�ʶ����',
  RPT_DATE           NCHAR(10) COMMENT '��Ϣ��������',
  RPT_DATE_CODE      NCHAR(2) COMMENT '����ʱ��˵������',
  INF_SURC_CODE      NVARCHAR(20) COMMENT '��Ϣ��Դ����',
  CIMOC              NCHAR(14) COMMENT '�ͻ�����ά����������',
  CUSTOMER_TYPE      NCHAR(1) COMMENT '�ͻ���������',
  ETP_STS            NCHAR(1) COMMENT '����״̬',
  ORG_TYPE           NVARCHAR(2) COMMENT '��֯��������',
  LAST_UPDATE_TIME   NVARCHAR(10) COMMENT '������ʱ��',
  OPERATOR_USER      NVARCHAR(50) COMMENT '����Ա',
  ORG_NAME           NVARCHAR(100) COMMENT '������Դ��������',
  ORG_CODE           NVARCHAR(100) COMMENT '������Դ�������',
  BUSINESS_STATES    NVARCHAR(50) COMMENT '����״̬',
  REJECT_REASON      NVARCHAR(255) COMMENT '����ԭ��',
  IS_FILTER          NCHAR(1) COMMENT '�Ƿ���˱�ʶ(Ĭ��ΪN-������)',
  REPORT_MESSAGE_ID  NVARCHAR(60) COMMENT '�����ļ�ID',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1            NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2            NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3            NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_BS COMMENT '310-��ҵ������Ϣ������';

 DROP TABLE IF EXISTS E_BS_HIST;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_BS_HIST
(
  EAA_BS_SGMT_ID     NCHAR(32)                  NOT NULL COMMENT '310-��ҵ������Ϣ����������',
  INF_REC_TYPE       NCHAR(3) COMMENT '��Ϣ��¼����',
  ENT_NAME           NVARCHAR(80) COMMENT '��ҵ����',
  ENT_CERT_TYPE      NCHAR(2) COMMENT '��ҵ��ݱ�ʶ����',
  ENT_CERT_NUM       NVARCHAR(40) COMMENT '��ҵ��ݱ�ʶ����',
  RPT_DATE           NCHAR(10) COMMENT '��Ϣ��������',
  RPT_DATE_CODE      NCHAR(2) COMMENT '����ʱ��˵������',
  INF_SURC_CODE      NVARCHAR(20) COMMENT '��Ϣ��Դ����',
  CIMOC              NCHAR(14) COMMENT '�ͻ�����ά����������',
  CUSTOMER_TYPE      NCHAR(1) COMMENT '�ͻ���������',
  ETP_STS            NCHAR(1) COMMENT '����״̬',
  ORG_TYPE           NVARCHAR(2) COMMENT '��֯��������',
  LAST_UPDATE_TIME   NVARCHAR(10) COMMENT '������ʱ��',
  OPERATOR_USER      NVARCHAR(50) COMMENT '����Ա',
  ORG_NAME           NVARCHAR(100) COMMENT '������Դ��������',
  ORG_CODE           NVARCHAR(100) COMMENT '������Դ�������',
  BUSINESS_STATES    NVARCHAR(50) COMMENT '����״̬',
  REJECT_REASON      NVARCHAR(255) COMMENT '����ԭ��',
  IS_FILTER          NCHAR(1) COMMENT '�Ƿ���˱�ʶ(Ĭ��ΪN-������)',
  REPORT_MESSAGE_ID  NVARCHAR(60) COMMENT '�����ļ�ID',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1            NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2            NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3            NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_BS_HIST COMMENT '310-��ҵ������Ϣ������';

 DROP TABLE IF EXISTS E_BS_INF_DLT;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_BS_INF_DLT
(
  EAZ_EN_BS_INF_DLT_ID  NCHAR(32)               NOT NULL COMMENT '314-��ҵ������Ϣɾ����������',
  INF_REC_TYPE          NCHAR(3) COMMENT '��Ϣ��¼����',
  INF_SURC_CODE         NVARCHAR(20) COMMENT '��Ϣ��Դ����',
  ENT_NAME              NVARCHAR(80) COMMENT '��ҵ����',
  ENT_CERT_TYPE         NVARCHAR(2) COMMENT '��ҵ��ݱ�ʶ����',
  ENT_CERT_NUM          NVARCHAR(40) COMMENT '��ҵ��ݱ�ʶ����',
  LAST_UPDATE_TIME      NVARCHAR(10) COMMENT '������ʱ��',
  OPERATOR_USER         NVARCHAR(50) COMMENT '����Ա',
  ORG_NAME              NVARCHAR(100) COMMENT '������Դ��������',
  ORG_CODE              NVARCHAR(100) COMMENT '������Դ�������',
  BUSINESS_STATES       NVARCHAR(50) COMMENT '����״̬',
  REJECT_REASON         NVARCHAR(255) COMMENT '����ԭ��',
  IS_FILTER             NCHAR(1) COMMENT '�Ƿ���˱�ʶ(Ĭ��ΪN-������)',
  REPORT_MESSAGE_ID     NVARCHAR(60) COMMENT '�����ļ�ID',
  RPT_DATE              NCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1               NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2               NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3               NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_BS_INF_DLT COMMENT '314-��ҵ������Ϣɾ������';

 DROP TABLE IF EXISTS E_BS_INF_DLT_HIST;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_BS_INF_DLT_HIST
(
  EAZ_EN_BS_INF_DLT_ID  NCHAR(32)               NOT NULL COMMENT '314-��ҵ������Ϣɾ����������',
  INF_REC_TYPE          NCHAR(3) COMMENT '��Ϣ��¼����',
  INF_SURC_CODE         NVARCHAR(20) COMMENT '��Ϣ��Դ����',
  ENT_NAME              NVARCHAR(80) COMMENT '��ҵ����',
  ENT_CERT_TYPE         NVARCHAR(2) COMMENT '��ҵ��ݱ�ʶ����',
  ENT_CERT_NUM          NVARCHAR(40) COMMENT '��ҵ��ݱ�ʶ����',
  LAST_UPDATE_TIME      NVARCHAR(10) COMMENT '������ʱ��',
  OPERATOR_USER         NVARCHAR(50) COMMENT '����Ա',
  ORG_NAME              NVARCHAR(100) COMMENT '������Դ��������',
  ORG_CODE              NVARCHAR(100) COMMENT '������Դ�������',
  BUSINESS_STATES       NVARCHAR(50) COMMENT '����״̬',
  REJECT_REASON         NVARCHAR(255) COMMENT '����ԭ��',
  IS_FILTER             NCHAR(1) COMMENT '�Ƿ���˱�ʶ(Ĭ��ΪN-������)',
  REPORT_MESSAGE_ID     NVARCHAR(60) COMMENT '�����ļ�ID',
  RPT_DATE              NCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1               NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2               NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3               NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_BS_INF_DLT_HIST COMMENT '314-��ҵ������Ϣɾ������';

 DROP TABLE IF EXISTS E_BS_MIDDLE;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_BS_MIDDLE
(
  ENT_CERT_TYPE  NVARCHAR(36)                  NOT NULL COMMENT '��ҵ��ݱ�ʶ����',
  ENT_CERT_NUM   NVARCHAR(60)                  NOT NULL COMMENT '��ҵ��ݱ�ʶ����',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1        NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2        NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3        NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_BS_MIDDLE COMMENT '310-��ҵ������Ϣ�������м��';

 DROP TABLE IF EXISTS E_CASH_FLOWS2002;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_CASH_FLOWS2002
(
  EJB_CASH_FLOWS2002_SGMT_ID      NCHAR(32)     NOT NULL COMMENT '630-��ҵ�ֽ�������02�ֽ������������',
  CASH_RECEIVED_FROM_SALES_OF_GO  DECIMAL(17,2) COMMENT '������Ʒ���ṩ�����յ����ֽ�',
  TAX_REFUNDS                     DECIMAL(17,2) COMMENT '�յ���˰�ѷ���',
  OTHER_CASH_RECEIVED_RELATING_T  DECIMAL(17,2) COMMENT '�յ��������뾭Ӫ��йص��ֽ�',
  TOTAL_CASH_INFLOWS_FROM_OPERAT  DECIMAL(17,2) COMMENT '��Ӫ��ֽ�����С��',
  CASH_PAID_FOR_GOODS_AND_SERVIC  DECIMAL(17,2) COMMENT '������Ʒ����������֧�����ֽ�',
  CASH_PAID_TO_AND_ON_BEHALF_OF_  DECIMAL(17,2) COMMENT '֧����ְ���Լ�Ϊְ��֧�����ֽ�',
  PAYMENTS_OF_ALL_TYPES_OF_TAXES  DECIMAL(17,2) COMMENT '֧���ĸ���˰��',
  OTHER_CASH_PAYMENTS_FROM_OPERA  DECIMAL(17,2) COMMENT '֧���������뾭Ӫ��йص��ֽ�',
  TOTAL_CASH_OUTFLOWS_FROM_OPERA  DECIMAL(17,2) COMMENT '��Ӫ��ֽ�����С��',
  NET_CASH_FLOWS_FROM_OPERATING   DECIMAL(17,2) COMMENT '��Ӫ��������ֽ���������',
  CASH_RECEIVED_FROM_RETURN_OF_I  DECIMAL(17,2) COMMENT '�ջ�Ͷ�����յ����ֽ�',
  CASH_RECEIVED_FROM_ONVESTMENTS  DECIMAL(17,2) COMMENT 'ȡ��Ͷ���������յ����ֽ�',
  NET_CASH_RECEIVED_FROM_DISPOSA  DECIMAL(17,2) COMMENT '���ù̶��ʲ������ʲ������������ʲ����ջص��ֽ𾻶�',
  CASH_RECEIVED_RELATING_TO_OTHE  DECIMAL(17,2) COMMENT '�յ���������Ͷ�ʻ�йص��ֽ�',
  TOTAL_CASH_INFLOWS_FROM_INVEST  DECIMAL(17,2) COMMENT 'Ͷ�ʻ�ֽ�����С��',
  CASH_PAID_TO_ACQUIRE_FIXED_ASS  DECIMAL(17,2) COMMENT '�����̶��ʲ������ʲ������������ʲ���֧�����ֽ�',
  CASH_PAYMENTS_FOR_INVESTMENTS   DECIMAL(17,2) COMMENT 'Ͷ����֧�����ֽ�',
  CASH_PAYMENTS_RELATED_TO_OTH_T  DECIMAL(17,2) COMMENT '֧����������Ͷ�ʻ�йص��ֽ�',
  TOTAL_CASH_OUTFLOWS_FROM_INVES  DECIMAL(17,2) COMMENT 'Ͷ�ʻ�ֽ�����С��',
  NET_CASH_FLOWS_FROM_INVESTING_  DECIMAL(17,2) COMMENT 'Ͷ�ʻ�������ֽ���������',
  CASH_RECEIVED_FROM_INVESTORS    DECIMAL(17,2) COMMENT '����Ͷ�����յ����ֽ�',
  CASH_FROM_BORROWINGS            DECIMAL(17,2) COMMENT '������յ����ֽ�',
  OTHER_CASH_RECEIVED_RELATING_C  DECIMAL(17,2) COMMENT '�յ�����������ʻ�йص��ֽ�',
  TOTAL_CASH_INFLOWS_FROM_FINANC  DECIMAL(17,2) COMMENT '���ʻ�ֽ�����С��',
  CASH_REPAYMENTS_FOR_DEBTS       DECIMAL(17,2) COMMENT '����ծ����֧�����ֽ�',
  CASH_PAYMENTS_FOR_DISTRIBUTION  DECIMAL(17,2) COMMENT '�������������򳥸���Ϣ��֧�����ֽ�',
  CASH_PAYMENTS_RELATED_TO_OTH_C  DECIMAL(17,2) COMMENT '֧������������ʻ�йص��ֽ�',
  TOTAL_CASH_OUTFLOWS_FROM_FINAN  DECIMAL(17,2) COMMENT '���ʻ�ֽ�����С��',
  NET_CASH_FLOWS_FROM_FINANCING_  DECIMAL(17,2) COMMENT '�Ｏ��������ֽ���������',
  EFFECT_OF_EXCHANG_RATE_CHANGES  DECIMAL(17,2) COMMENT '���ʱ䶯���ֽ��Ӱ��',
  NET_INCREASEIN_CASH_AND_CASH_E  DECIMAL(17,2) COMMENT '�ֽ��ֽ�ȼ��ﾻ���Ӷ�',
  NET_PROFIT                      DECIMAL(17,2) COMMENT '������',
  PROVISION_FOR_ASSETS            DECIMAL(17,2) COMMENT '������ʲ���ֵ׼��',
  DEPRECIATION_OF_FIXED_ASSETS    DECIMAL(17,2) COMMENT '�̶��ʲ����',
  AMORTISATION_OF_INTANGIBLE_ASS  DECIMAL(17,2) COMMENT '�����ʲ�̯��',
  LONG_TERM_DEFERRED_EXPENSES_AM  DECIMAL(17,2) COMMENT '���ڴ�̯����̯��',
  DECREASE_OF_DEFFERED_EXPENSES   DECIMAL(17,2) COMMENT '��̯���ü���',
  ADDITION_OF_ACCUED_EXPENSE      DECIMAL(17,2) COMMENT 'Ԥ���������',
  LOSSES_ON_DISPOSAL_OF_FIXED_AS  DECIMAL(17,2) COMMENT '���ù̶��ʲ������ʲ������������ʲ�����ʧ',
  LOSSES_ON_SCRAPPING_OF_FIXED_A  DECIMAL(17,2) COMMENT '�̶��ʲ�������ʧ',
  FINANCE_EXPENSE                 DECIMAL(17,2) COMMENT '�������',
  LOSSES_ARSING_FROM_INVESTMENT   DECIMAL(17,2) COMMENT 'Ͷ����ʧ',
  DEFERRED_TAX_CREDIT             DECIMAL(17,2) COMMENT '����˰�����',
  DECREASE_IN_INVENTORIES         DECIMAL(17,2) COMMENT '����ļ���',
  DECREASEIN_OPERATING_RECEIVABL  DECIMAL(17,2) COMMENT '��Ӫ��Ӧ����Ŀ�ļ���',
  INCREASEIN_OPERATING_RECEIVABL  DECIMAL(17,2) COMMENT '��Ӫ��Ӧ����Ŀ������',
  OTHERS                          DECIMAL(17,2) COMMENT '�����������Ϊ��Ӫ��ֽ�������Ŀ�£�����',
  NET_CASH_FLOWS_FROM_OPERATING2  DECIMAL(17,2) COMMENT '��Ӫ��������ֽ���������2',
  DEBTS_TRANSFER_TO_CAPITAL       DECIMAL(17,2) COMMENT 'ծ��תΪ�ʱ�',
  ONE_YEAR_DUE_CONVERTIBLE_BONDS  DECIMAL(17,2) COMMENT 'һ���ڵ��ڵĿ�ת����˾ծȯ',
  FINANCING_RENT_TO_THE_FIXED_AS  DECIMAL(17,2) COMMENT '��������̶��ʲ�',
  NON_CASH_OTHERS                 DECIMAL(17,2) COMMENT '�����漰�ֽ���֧��Ͷ�ʺͳ��ʻ��Ŀ�£�����',
  CASH_AT_THE_END_OF_PERIOD       DECIMAL(17,2) COMMENT '�ֽ����ĩ���',
  CASH_AT_THE_BEGINNING_OF_THE_P  DECIMAL(17,2) COMMENT '�ֽ���ڳ����',
  CASH_EQUIVALENTS_AT_THE_END_OF  DECIMAL(17,2) COMMENT '�ֽ�ȼ������ĩ���',
  CASH_RQUIVALENTS_AT_THE_BEGINN  DECIMAL(17,2) COMMENT '�ֽ�ȼ�����ڳ����',
  NET_INCREASE_IN_CASH_AND_CASH_  DECIMAL(17,2) COMMENT '�ֽ��ֽ�ȼ��ﾻ���Ӷ�2',
  EJA_CASH_FLOWS_BS_SGMT_ID       NCHAR(32)     NOT NULL COMMENT '�������',
  RPT_DATE                        NCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_CASH_FLOWS2002 COMMENT '630-��ҵ�ֽ�������02�ֽ��������';

 DROP TABLE IF EXISTS E_CASH_FLOWS2002_HIST;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_CASH_FLOWS2002_HIST
(
  EJB_CASH_FLOWS2002_SGMT_ID      NCHAR(32)     NOT NULL COMMENT '630-��ҵ�ֽ�������02�ֽ������������',
  CASH_RECEIVED_FROM_SALES_OF_GO  DECIMAL(17,2) COMMENT '������Ʒ���ṩ�����յ����ֽ�',
  TAX_REFUNDS                     DECIMAL(17,2) COMMENT '�յ���˰�ѷ���',
  OTHER_CASH_RECEIVED_RELATING_T  DECIMAL(17,2) COMMENT '�յ��������뾭Ӫ��йص��ֽ�',
  TOTAL_CASH_INFLOWS_FROM_OPERAT  DECIMAL(17,2) COMMENT '��Ӫ��ֽ�����С��',
  CASH_PAID_FOR_GOODS_AND_SERVIC  DECIMAL(17,2) COMMENT '������Ʒ����������֧�����ֽ�',
  CASH_PAID_TO_AND_ON_BEHALF_OF_  DECIMAL(17,2) COMMENT '֧����ְ���Լ�Ϊְ��֧�����ֽ�',
  PAYMENTS_OF_ALL_TYPES_OF_TAXES  DECIMAL(17,2) COMMENT '֧���ĸ���˰��',
  OTHER_CASH_PAYMENTS_FROM_OPERA  DECIMAL(17,2) COMMENT '֧���������뾭Ӫ��йص��ֽ�',
  TOTAL_CASH_OUTFLOWS_FROM_OPERA  DECIMAL(17,2) COMMENT '��Ӫ��ֽ�����С��',
  NET_CASH_FLOWS_FROM_OPERATING   DECIMAL(17,2) COMMENT '��Ӫ��������ֽ���������',
  CASH_RECEIVED_FROM_RETURN_OF_I  DECIMAL(17,2) COMMENT '�ջ�Ͷ�����յ����ֽ�',
  CASH_RECEIVED_FROM_ONVESTMENTS  DECIMAL(17,2) COMMENT 'ȡ��Ͷ���������յ����ֽ�',
  NET_CASH_RECEIVED_FROM_DISPOSA  DECIMAL(17,2) COMMENT '���ù̶��ʲ������ʲ������������ʲ����ջص��ֽ𾻶�',
  CASH_RECEIVED_RELATING_TO_OTHE  DECIMAL(17,2) COMMENT '�յ���������Ͷ�ʻ�йص��ֽ�',
  TOTAL_CASH_INFLOWS_FROM_INVEST  DECIMAL(17,2) COMMENT 'Ͷ�ʻ�ֽ�����С��',
  CASH_PAID_TO_ACQUIRE_FIXED_ASS  DECIMAL(17,2) COMMENT '�����̶��ʲ������ʲ������������ʲ���֧�����ֽ�',
  CASH_PAYMENTS_FOR_INVESTMENTS   DECIMAL(17,2) COMMENT 'Ͷ����֧�����ֽ�',
  CASH_PAYMENTS_RELATED_TO_OTH_T  DECIMAL(17,2) COMMENT '֧����������Ͷ�ʻ�йص��ֽ�',
  TOTAL_CASH_OUTFLOWS_FROM_INVES  DECIMAL(17,2) COMMENT 'Ͷ�ʻ�ֽ�����С��',
  NET_CASH_FLOWS_FROM_INVESTING_  DECIMAL(17,2) COMMENT 'Ͷ�ʻ�������ֽ���������',
  CASH_RECEIVED_FROM_INVESTORS    DECIMAL(17,2) COMMENT '����Ͷ�����յ����ֽ�',
  CASH_FROM_BORROWINGS            DECIMAL(17,2) COMMENT '������յ����ֽ�',
  OTHER_CASH_RECEIVED_RELATING_C  DECIMAL(17,2) COMMENT '�յ�����������ʻ�йص��ֽ�',
  TOTAL_CASH_INFLOWS_FROM_FINANC  DECIMAL(17,2) COMMENT '���ʻ�ֽ�����С��',
  CASH_REPAYMENTS_FOR_DEBTS       DECIMAL(17,2) COMMENT '����ծ����֧�����ֽ�',
  CASH_PAYMENTS_FOR_DISTRIBUTION  DECIMAL(17,2) COMMENT '�������������򳥸���Ϣ��֧�����ֽ�',
  CASH_PAYMENTS_RELATED_TO_OTH_C  DECIMAL(17,2) COMMENT '֧������������ʻ�йص��ֽ�',
  TOTAL_CASH_OUTFLOWS_FROM_FINAN  DECIMAL(17,2) COMMENT '���ʻ�ֽ�����С��',
  NET_CASH_FLOWS_FROM_FINANCING_  DECIMAL(17,2) COMMENT '�Ｏ��������ֽ���������',
  EFFECT_OF_EXCHANG_RATE_CHANGES  DECIMAL(17,2) COMMENT '���ʱ䶯���ֽ��Ӱ��',
  NET_INCREASEIN_CASH_AND_CASH_E  DECIMAL(17,2) COMMENT '�ֽ��ֽ�ȼ��ﾻ���Ӷ�',
  NET_PROFIT                      DECIMAL(17,2) COMMENT '������',
  PROVISION_FOR_ASSETS            DECIMAL(17,2) COMMENT '������ʲ���ֵ׼��',
  DEPRECIATION_OF_FIXED_ASSETS    DECIMAL(17,2) COMMENT '�̶��ʲ����',
  AMORTISATION_OF_INTANGIBLE_ASS  DECIMAL(17,2) COMMENT '�����ʲ�̯��',
  LONG_TERM_DEFERRED_EXPENSES_AM  DECIMAL(17,2) COMMENT '���ڴ�̯����̯��',
  DECREASE_OF_DEFFERED_EXPENSES   DECIMAL(17,2) COMMENT '��̯���ü���',
  ADDITION_OF_ACCUED_EXPENSE      DECIMAL(17,2) COMMENT 'Ԥ���������',
  LOSSES_ON_DISPOSAL_OF_FIXED_AS  DECIMAL(17,2) COMMENT '���ù̶��ʲ������ʲ������������ʲ�����ʧ',
  LOSSES_ON_SCRAPPING_OF_FIXED_A  DECIMAL(17,2) COMMENT '�̶��ʲ�������ʧ',
  FINANCE_EXPENSE                 DECIMAL(17,2) COMMENT '�������',
  LOSSES_ARSING_FROM_INVESTMENT   DECIMAL(17,2) COMMENT 'Ͷ����ʧ',
  DEFERRED_TAX_CREDIT             DECIMAL(17,2) COMMENT '����˰�����',
  DECREASE_IN_INVENTORIES         DECIMAL(17,2) COMMENT '����ļ���',
  DECREASEIN_OPERATING_RECEIVABL  DECIMAL(17,2) COMMENT '��Ӫ��Ӧ����Ŀ�ļ���',
  INCREASEIN_OPERATING_RECEIVABL  DECIMAL(17,2) COMMENT '��Ӫ��Ӧ����Ŀ������',
  OTHERS                          DECIMAL(17,2) COMMENT '�����������Ϊ��Ӫ��ֽ�������Ŀ�£�����',
  NET_CASH_FLOWS_FROM_OPERATING2  DECIMAL(17,2) COMMENT '��Ӫ��������ֽ���������2',
  DEBTS_TRANSFER_TO_CAPITAL       DECIMAL(17,2) COMMENT 'ծ��תΪ�ʱ�',
  ONE_YEAR_DUE_CONVERTIBLE_BONDS  DECIMAL(17,2) COMMENT 'һ���ڵ��ڵĿ�ת����˾ծȯ',
  FINANCING_RENT_TO_THE_FIXED_AS  DECIMAL(17,2) COMMENT '��������̶��ʲ�',
  NON_CASH_OTHERS                 DECIMAL(17,2) COMMENT '�����漰�ֽ���֧��Ͷ�ʺͳ��ʻ��Ŀ�£�����',
  CASH_AT_THE_END_OF_PERIOD       DECIMAL(17,2) COMMENT '�ֽ����ĩ���',
  CASH_AT_THE_BEGINNING_OF_THE_P  DECIMAL(17,2) COMMENT '�ֽ���ڳ����',
  CASH_EQUIVALENTS_AT_THE_END_OF  DECIMAL(17,2) COMMENT '�ֽ�ȼ������ĩ���',
  CASH_RQUIVALENTS_AT_THE_BEGINN  DECIMAL(17,2) COMMENT '�ֽ�ȼ�����ڳ����',
  NET_INCREASE_IN_CASH_AND_CASH_  DECIMAL(17,2) COMMENT '�ֽ��ֽ�ȼ��ﾻ���Ӷ�2',
  EJA_CASH_FLOWS_BS_SGMT_ID       NCHAR(32)     NOT NULL COMMENT '�������',
  RPT_DATE                        NCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_CASH_FLOWS2002_HIST COMMENT '630-��ҵ�ֽ�������02�ֽ��������';

 DROP TABLE IF EXISTS E_CASH_FLOWS2007;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_CASH_FLOWS2007
(
  EJC_CASH_FLOWS2007_SGMT_ID      NCHAR(32)     NOT NULL COMMENT '630-��ҵ�ֽ�������07�ֽ������������',
  CASH_RECEIVED_FROM_SALES_OF_GO  DECIMAL(17,2) COMMENT '������Ʒ���ṩ�����յ����ֽ�',
  TAX_REFUNDS                     DECIMAL(17,2) COMMENT '�յ���˰�ѷ���',
  OTHER_CASH_RECEIVED_RELATING_J  DECIMAL(17,2) COMMENT '�յ������뾭Ӫ��йص��ֽ�',
  TOTAL_CASH_INFLOWS_FROM_OPERAT  DECIMAL(17,2) COMMENT '��Ӫ��ֽ�����С��',
  CASH_PAID_FOR_GOODS_AND_SERVIC  DECIMAL(17,2) COMMENT '������Ʒ����������֧�����ֽ�',
  CASH_PAID_TO_AND_ON_BEHA_LF_OF  DECIMAL(17,2) COMMENT '֧����ְ���Լ�Ϊְ��֧�����ֽ�',
  PAYMENTS_OF_ALL_TYPES_OF_TAXES  DECIMAL(17,2) COMMENT '֧���ĸ���˰��',
  OTHER_CASH_PAYMENTS_FROM_OPERA  DECIMAL(17,2) COMMENT '֧�������뾭Ӫ��йص��ֽ�',
  TOTAL_CASH_OUTFLOWS_FROM_OPERA  DECIMAL(17,2) COMMENT '��Ӫ��ֽ�����С��',
  NET_CASH_FLOWS_FROM_OPERATING   DECIMAL(17,2) COMMENT '��Ӫ��������ֽ���������',
  CASH_RECEIVED_FROM_RETURN_OF_I  DECIMAL(17,2) COMMENT '�ջ�Ͷ�����յ����ֽ�',
  CASH_RECEIVED_FROM_ONVESTMENTS  DECIMAL(17,2) COMMENT 'ȡ��Ͷ���������յ����ֽ�',
  NET_CASH_RECEIVED_FROM_DISPOSA  DECIMAL(17,2) COMMENT '���ù̶��ʲ������ʲ������������ʲ����ջص��ֽ𾻶�',
  NET_CASH_INFLOWS_OF_DISPOSAL_O  DECIMAL(17,2) COMMENT '�����ӹ�˾������Ӫҵ��λ�յ����ֽ𾻶�',
  CASH_RECEIVED_RELATING_TO_OTHE  DECIMAL(17,2) COMMENT '�յ�������Ͷ�ʻ�йص��ֽ�',
  TOTAL_CASH_INFLOWS_FROM_INVEST  DECIMAL(17,2) COMMENT 'Ͷ�ʻ�ֽ�����С��',
  CASH_PAID_TO_ACQUIRE_FIXED_ASS  DECIMAL(17,2) COMMENT '�����̶��ʲ������ʲ������������ʲ���֧�����ֽ�',
  CASH_PAYMENTS_FOR_INVESTMENTS   DECIMAL(17,2) COMMENT 'Ͷ����֧�����ֽ�',
  NET_CASH_OUTFLOWS_OF_PROCUREME  DECIMAL(17,2) COMMENT 'ȡ���ӹ�˾������Ӫҵ��λ֧�����ֽ𾻶�',
  CASH_PAYMENTS_RELATED_TO_OTH_T  DECIMAL(17,2) COMMENT '֧��������Ͷ�ʻ�йص��ֽ�',
  SUB_TOTAL_OF_CASH_OUTFLOWS      DECIMAL(17,2) COMMENT 'Ͷ�ʻ�ֽ�����С��',
  NET_CASH_FLOWS_FROM_INVESTING_  DECIMAL(17,2) COMMENT 'Ͷ�ʻ�������ֽ���������',
  CASH_RECEIVED_FROM_INVESTORS    DECIMAL(17,2) COMMENT '����Ͷ���յ����ֽ�',
  CASH_FROM_BORROWINGS            DECIMAL(17,2) COMMENT 'ȡ�ý���յ����ֽ�',
  OTHER_CASH_RECEIVED_RELATING_C  DECIMAL(17,2) COMMENT '�յ���������ʻ�йص��ֽ�',
  TOTAL_CASH_INFLOWS_FROM_FINANC  DECIMAL(17,2) COMMENT '���ʻ�ֽ�����С��',
  CASH_REPAYMENTS_FOR_DEBTS       DECIMAL(17,2) COMMENT '����ծ����֧�����ֽ�',
  CASH_PAYMENTS_FOR_DISTRIBUTION  DECIMAL(17,2) COMMENT '�������������򳥸���Ϣ��֧�����ֽ�',
  CASH_PAYMENTS_RELATED_TO_OTH_C  DECIMAL(17,2) COMMENT '֧����������ʻ�йص��ֽ�',
  TOTAL_CASH_OUTFLOWS_FROM_FINAN  DECIMAL(17,2) COMMENT '���ʻ�ֽ�����С��',
  NET_CASH_FLOWS_FROM_FINANCING_  DECIMAL(17,2) COMMENT '�Ｏ��������ֽ���������',
  EFFECT_OF_EXCHANG_RATE_CHANGES  DECIMAL(17,2) COMMENT '���ʱ䶯���ֽ��ֽ�ȼ����Ӱ��',
  NETINCREASEIN_CASH_AND_CASH_EQ  DECIMAL(17,2) COMMENT '�ֽ��ֽ�ȼ��ﾻ���Ӷ�',
  INITIAL_CASH_AND_CASH_EQUIVALE  DECIMAL(17,2) COMMENT '�ڳ��ֽ��ֽ�ȼ������',
  THE_FINAL_CASH_AND_CASH_EQUIVA  DECIMAL(17,2) COMMENT '��ĩ�ֽ��ֽ�ȼ������',
  NET_PROFIT                      DECIMAL(17,2) COMMENT '������',
  PROVISION_FOR_ASSET_IMPAIRMENT  DECIMAL(17,2) COMMENT '�ʲ���ֵ׼��',
  DEPRECIATION_OF_FIXED_ASSETS    DECIMAL(17,2) COMMENT '�̶��ʲ��۾ɡ������ʲ��ۺġ������������ʲ��۾�',
  AMORTISATION_OF_INTANGIBLE_ASS  DECIMAL(17,2) COMMENT '�����ʲ�̯��',
  AMORTISATION_OF_LONG_TERM_DEFF  DECIMAL(17,2) COMMENT '���ڴ�̯����̯��',
  DECREASE_OF_DEFFERED_EXPENSES   DECIMAL(17,2) COMMENT '��̯���ü���',
  ADDITION_OF_ACCUED_EXPENSE      DECIMAL(17,2) COMMENT 'Ԥ���������',
  LOSSES_ON_DISPOSAL_OF_FIXED_AS  DECIMAL(17,2) COMMENT '���ù̶��ʲ������ʲ������������ʲ�����ʧ',
  LOSSES_ON_SCRAPPING_OF_FIXED_A  DECIMAL(17,2) COMMENT '�̶��ʲ�������ʧ',
  PROFIT_OR_LOSS_FROM_CHANGES_IN  DECIMAL(17,2) COMMENT '���ʼ�ֵ�䶯��ʧ',
  FINANCE_EXPENSE                 DECIMAL(17,2) COMMENT '�������',
  LOSSES_ARSING_FROM_INVESTMENT   DECIMAL(17,2) COMMENT 'Ͷ����ʧ',
  DEFERRED_INCOME_TAX_ASSETS      DECIMAL(17,2) COMMENT '��������˰�ʲ�����',
  DEFERRED_INCOME_TAX_LIABILITIE  DECIMAL(17,2) COMMENT '��������˰��ծ����',
  DECREASEIN_INVENTORIES          DECIMAL(17,2) COMMENT '����ļ���',
  DECREASEIN_OPERATING_RECEIVABL  DECIMAL(17,2) COMMENT '��Ӫ��Ӧ����Ŀ�ļ���',
  INCREASE_IN_OPERATING_RECEIVAB  DECIMAL(17,2) COMMENT '��Ӫ��Ӧ����Ŀ������',
  OTHERS                          DECIMAL(17,2) COMMENT '�����������Ϊ��Ӫ��ֽ�������Ŀ�£�����',
  NET_CASH_FLOWS_FROM_OPERATING2  DECIMAL(17,2) COMMENT '��Ӫ��������ֽ���������2',
  DEBTS_TRANSFER_TO_CAPITAL       DECIMAL(17,2) COMMENT 'ծ��תΪ�ʱ�',
  ONE_YEAR_DUE_CONVERTIBLE_BONDS  DECIMAL(17,2) COMMENT 'һ���ڵ��ڵĿ�ת����˾ծȯ',
  FINANCING_RENT_TO_THE_FIXED_AS  DECIMAL(17,2) COMMENT '��������̶��ʲ�',
  NON_CASH_OTHERS                 DECIMAL(17,2) COMMENT '�����漰�ֽ���֧��Ͷ�ʺͳ��ʻ��Ŀ�£�����',
  CASH_AT_THE_END_OF_PERIOD       DECIMAL(17,2) COMMENT '�ֽ����ĩ���',
  CASH_AT_THE_BEGINNING_OF_THE_P  DECIMAL(17,2) COMMENT '�ֽ���ڳ����',
  CASH_EQUIVALENTS_AT_THE_END_OF  DECIMAL(17,2) COMMENT '�ֽ�ȼ������ĩ���',
  CASH_EQUIVALENTS_AT_THE_BEGINN  DECIMAL(17,2) COMMENT '�ֽ�ȼ�����ڳ����',
  NETINCREASEIN_CASH_AND_CASH_E2  DECIMAL(17,2) COMMENT '�ֽ��ֽ�ȼ��ﾻ���Ӷ�2',
  EJA_CASH_FLOWS_BS_SGMT_ID       NCHAR(32)     NOT NULL COMMENT '�������',
  RPT_DATE                        NCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_CASH_FLOWS2007 COMMENT '630-��ҵ�ֽ�������07�ֽ��������';

 DROP TABLE IF EXISTS E_CASH_FLOWS2007_HIST;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_CASH_FLOWS2007_HIST
(
  EJC_CASH_FLOWS2007_SGMT_ID      NCHAR(32)     NOT NULL COMMENT '630-��ҵ�ֽ�������07�ֽ������������',
  CASH_RECEIVED_FROM_SALES_OF_GO  DECIMAL(17,2) COMMENT '������Ʒ���ṩ�����յ����ֽ�',
  TAX_REFUNDS                     DECIMAL(17,2) COMMENT '�յ���˰�ѷ���',
  OTHER_CASH_RECEIVED_RELATING_J  DECIMAL(17,2) COMMENT '�յ������뾭Ӫ��йص��ֽ�',
  TOTAL_CASH_INFLOWS_FROM_OPERAT  DECIMAL(17,2) COMMENT '��Ӫ��ֽ�����С��',
  CASH_PAID_FOR_GOODS_AND_SERVIC  DECIMAL(17,2) COMMENT '������Ʒ����������֧�����ֽ�',
  CASH_PAID_TO_AND_ON_BEHA_LF_OF  DECIMAL(17,2) COMMENT '֧����ְ���Լ�Ϊְ��֧�����ֽ�',
  PAYMENTS_OF_ALL_TYPES_OF_TAXES  DECIMAL(17,2) COMMENT '֧���ĸ���˰��',
  OTHER_CASH_PAYMENTS_FROM_OPERA  DECIMAL(17,2) COMMENT '֧�������뾭Ӫ��йص��ֽ�',
  TOTAL_CASH_OUTFLOWS_FROM_OPERA  DECIMAL(17,2) COMMENT '��Ӫ��ֽ�����С��',
  NET_CASH_FLOWS_FROM_OPERATING   DECIMAL(17,2) COMMENT '��Ӫ��������ֽ���������',
  CASH_RECEIVED_FROM_RETURN_OF_I  DECIMAL(17,2) COMMENT '�ջ�Ͷ�����յ����ֽ�',
  CASH_RECEIVED_FROM_ONVESTMENTS  DECIMAL(17,2) COMMENT 'ȡ��Ͷ���������յ����ֽ�',
  NET_CASH_RECEIVED_FROM_DISPOSA  DECIMAL(17,2) COMMENT '���ù̶��ʲ������ʲ������������ʲ����ջص��ֽ𾻶�',
  NET_CASH_INFLOWS_OF_DISPOSAL_O  DECIMAL(17,2) COMMENT '�����ӹ�˾������Ӫҵ��λ�յ����ֽ𾻶�',
  CASH_RECEIVED_RELATING_TO_OTHE  DECIMAL(17,2) COMMENT '�յ�������Ͷ�ʻ�йص��ֽ�',
  TOTAL_CASH_INFLOWS_FROM_INVEST  DECIMAL(17,2) COMMENT 'Ͷ�ʻ�ֽ�����С��',
  CASH_PAID_TO_ACQUIRE_FIXED_ASS  DECIMAL(17,2) COMMENT '�����̶��ʲ������ʲ������������ʲ���֧�����ֽ�',
  CASH_PAYMENTS_FOR_INVESTMENTS   DECIMAL(17,2) COMMENT 'Ͷ����֧�����ֽ�',
  NET_CASH_OUTFLOWS_OF_PROCUREME  DECIMAL(17,2) COMMENT 'ȡ���ӹ�˾������Ӫҵ��λ֧�����ֽ𾻶�',
  CASH_PAYMENTS_RELATED_TO_OTH_T  DECIMAL(17,2) COMMENT '֧��������Ͷ�ʻ�йص��ֽ�',
  SUB_TOTAL_OF_CASH_OUTFLOWS      DECIMAL(17,2) COMMENT 'Ͷ�ʻ�ֽ�����С��',
  NET_CASH_FLOWS_FROM_INVESTING_  DECIMAL(17,2) COMMENT 'Ͷ�ʻ�������ֽ���������',
  CASH_RECEIVED_FROM_INVESTORS    DECIMAL(17,2) COMMENT '����Ͷ���յ����ֽ�',
  CASH_FROM_BORROWINGS            DECIMAL(17,2) COMMENT 'ȡ�ý���յ����ֽ�',
  OTHER_CASH_RECEIVED_RELATING_C  DECIMAL(17,2) COMMENT '�յ���������ʻ�йص��ֽ�',
  TOTAL_CASH_INFLOWS_FROM_FINANC  DECIMAL(17,2) COMMENT '���ʻ�ֽ�����С��',
  CASH_REPAYMENTS_FOR_DEBTS       DECIMAL(17,2) COMMENT '����ծ����֧�����ֽ�',
  CASH_PAYMENTS_FOR_DISTRIBUTION  DECIMAL(17,2) COMMENT '�������������򳥸���Ϣ��֧�����ֽ�',
  CASH_PAYMENTS_RELATED_TO_OTH_C  DECIMAL(17,2) COMMENT '֧����������ʻ�йص��ֽ�',
  TOTAL_CASH_OUTFLOWS_FROM_FINAN  DECIMAL(17,2) COMMENT '���ʻ�ֽ�����С��',
  NET_CASH_FLOWS_FROM_FINANCING_  DECIMAL(17,2) COMMENT '�Ｏ��������ֽ���������',
  EFFECT_OF_EXCHANG_RATE_CHANGES  DECIMAL(17,2) COMMENT '���ʱ䶯���ֽ��ֽ�ȼ����Ӱ��',
  NETINCREASEIN_CASH_AND_CASH_EQ  DECIMAL(17,2) COMMENT '�ֽ��ֽ�ȼ��ﾻ���Ӷ�',
  INITIAL_CASH_AND_CASH_EQUIVALE  DECIMAL(17,2) COMMENT '�ڳ��ֽ��ֽ�ȼ������',
  THE_FINAL_CASH_AND_CASH_EQUIVA  DECIMAL(17,2) COMMENT '��ĩ�ֽ��ֽ�ȼ������',
  NET_PROFIT                      DECIMAL(17,2) COMMENT '������',
  PROVISION_FOR_ASSET_IMPAIRMENT  DECIMAL(17,2) COMMENT '�ʲ���ֵ׼��',
  DEPRECIATION_OF_FIXED_ASSETS    DECIMAL(17,2) COMMENT '�̶��ʲ��۾ɡ������ʲ��ۺġ������������ʲ��۾�',
  AMORTISATION_OF_INTANGIBLE_ASS  DECIMAL(17,2) COMMENT '�����ʲ�̯��',
  AMORTISATION_OF_LONG_TERM_DEFF  DECIMAL(17,2) COMMENT '���ڴ�̯����̯��',
  DECREASE_OF_DEFFERED_EXPENSES   DECIMAL(17,2) COMMENT '��̯���ü���',
  ADDITION_OF_ACCUED_EXPENSE      DECIMAL(17,2) COMMENT 'Ԥ���������',
  LOSSES_ON_DISPOSAL_OF_FIXED_AS  DECIMAL(17,2) COMMENT '���ù̶��ʲ������ʲ������������ʲ�����ʧ',
  LOSSES_ON_SCRAPPING_OF_FIXED_A  DECIMAL(17,2) COMMENT '�̶��ʲ�������ʧ',
  PROFIT_OR_LOSS_FROM_CHANGES_IN  DECIMAL(17,2) COMMENT '���ʼ�ֵ�䶯��ʧ',
  FINANCE_EXPENSE                 DECIMAL(17,2) COMMENT '�������',
  LOSSES_ARSING_FROM_INVESTMENT   DECIMAL(17,2) COMMENT 'Ͷ����ʧ',
  DEFERRED_INCOME_TAX_ASSETS      DECIMAL(17,2) COMMENT '��������˰�ʲ�����',
  DEFERRED_INCOME_TAX_LIABILITIE  DECIMAL(17,2) COMMENT '��������˰��ծ����',
  DECREASEIN_INVENTORIES          DECIMAL(17,2) COMMENT '����ļ���',
  DECREASEIN_OPERATING_RECEIVABL  DECIMAL(17,2) COMMENT '��Ӫ��Ӧ����Ŀ�ļ���',
  INCREASE_IN_OPERATING_RECEIVAB  DECIMAL(17,2) COMMENT '��Ӫ��Ӧ����Ŀ������',
  OTHERS                          DECIMAL(17,2) COMMENT '�����������Ϊ��Ӫ��ֽ�������Ŀ�£�����',
  NET_CASH_FLOWS_FROM_OPERATING2  DECIMAL(17,2) COMMENT '��Ӫ��������ֽ���������2',
  DEBTS_TRANSFER_TO_CAPITAL       DECIMAL(17,2) COMMENT 'ծ��תΪ�ʱ�',
  ONE_YEAR_DUE_CONVERTIBLE_BONDS  DECIMAL(17,2) COMMENT 'һ���ڵ��ڵĿ�ת����˾ծȯ',
  FINANCING_RENT_TO_THE_FIXED_AS  DECIMAL(17,2) COMMENT '��������̶��ʲ�',
  NON_CASH_OTHERS                 DECIMAL(17,2) COMMENT '�����漰�ֽ���֧��Ͷ�ʺͳ��ʻ��Ŀ�£�����',
  CASH_AT_THE_END_OF_PERIOD       DECIMAL(17,2) COMMENT '�ֽ����ĩ���',
  CASH_AT_THE_BEGINNING_OF_THE_P  DECIMAL(17,2) COMMENT '�ֽ���ڳ����',
  CASH_EQUIVALENTS_AT_THE_END_OF  DECIMAL(17,2) COMMENT '�ֽ�ȼ������ĩ���',
  CASH_EQUIVALENTS_AT_THE_BEGINN  DECIMAL(17,2) COMMENT '�ֽ�ȼ�����ڳ����',
  NETINCREASEIN_CASH_AND_CASH_E2  DECIMAL(17,2) COMMENT '�ֽ��ֽ�ȼ��ﾻ���Ӷ�2',
  EJA_CASH_FLOWS_BS_SGMT_ID       NCHAR(32)     NOT NULL COMMENT '�������',
  RPT_DATE                        NCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_CASH_FLOWS2007_HIST COMMENT '630-��ҵ�ֽ�������07�ֽ��������';

 DROP TABLE IF EXISTS E_CASH_FLOWS_BS;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_CASH_FLOWS_BS
(
  EJA_CASH_FLOWS_BS_SGMT_ID  NCHAR(32)          NOT NULL COMMENT '630-��ҵ�ֽ����������������',
  INF_REC_TYPE               NCHAR(3) COMMENT '��Ϣ��¼����',
  ENT_NAME                   NVARCHAR(80) COMMENT '��ҵ����',
  ENT_CERT_TYPE              NCHAR(2) COMMENT '��ҵ��ݱ�ʶ����',
  ENT_CERT_NUM               NVARCHAR(40) COMMENT '��ҵ��ݱ�ʶ����',
  RPT_DATE                   NCHAR(10) COMMENT '��Ϣ��������',
  SHEET_YEAR                 NCHAR(4) COMMENT '�������',
  SHEET_TYPE                 NCHAR(2) COMMENT '��������',
  SHEET_TYPE_DIVIDE          NCHAR(1) COMMENT '��������ϸ��',
  AUDIT_FIRM_NAME            NVARCHAR(80) COMMENT '�������������',
  AUDITOR_NAME               NVARCHAR(30) COMMENT '�����Ա����',
  AUDIT_TIME                 NVARCHAR(10) COMMENT '���ʱ��',
  CIMOC                      NCHAR(14) COMMENT '�ͻ�����ά����������',
  RPT_DATE_CODE              NCHAR(2) COMMENT '����ʱ��˵������',
  LAST_UPDATE_TIME           NVARCHAR(10) COMMENT '������ʱ��',
  OPERATOR_USER              NVARCHAR(50) COMMENT '����Ա',
  ORG_NAME                   NVARCHAR(100) COMMENT '������Դ��������',
  ORG_CODE                   NVARCHAR(100) COMMENT '������Դ�������',
  BUSINESS_STATES            NVARCHAR(50) COMMENT '����״̬',
  REJECT_REASON              NVARCHAR(255) COMMENT '����ԭ��',
  IS_FILTER                  NCHAR(1) COMMENT '�Ƿ���˱�ʶ(Ĭ��ΪN-������)',
  REPORT_MESSAGE_ID          NVARCHAR(60) COMMENT '�����ļ�ID',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                    NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                    NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                    NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_CASH_FLOWS_BS COMMENT '630-��ҵ�ֽ������������';

 DROP TABLE IF EXISTS E_CASH_FLOWS_BS_HIST;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_CASH_FLOWS_BS_HIST
(
  EJA_CASH_FLOWS_BS_SGMT_ID  NCHAR(32)          NOT NULL COMMENT '630-��ҵ�ֽ����������������',
  INF_REC_TYPE               NCHAR(3) COMMENT '��Ϣ��¼����',
  ENT_NAME                   NVARCHAR(80) COMMENT '��ҵ����',
  ENT_CERT_TYPE              NCHAR(2) COMMENT '��ҵ��ݱ�ʶ����',
  ENT_CERT_NUM               NVARCHAR(40) COMMENT '��ҵ��ݱ�ʶ����',
  RPT_DATE                   NCHAR(10) COMMENT '��Ϣ��������',
  SHEET_YEAR                 NCHAR(4) COMMENT '�������',
  SHEET_TYPE                 NCHAR(2) COMMENT '��������',
  SHEET_TYPE_DIVIDE          NCHAR(1) COMMENT '��������ϸ��',
  AUDIT_FIRM_NAME            NVARCHAR(80) COMMENT '�������������',
  AUDITOR_NAME               NVARCHAR(30) COMMENT '�����Ա����',
  AUDIT_TIME                 NVARCHAR(10) COMMENT '���ʱ��',
  CIMOC                      NCHAR(14) COMMENT '�ͻ�����ά����������',
  RPT_DATE_CODE              NCHAR(2) COMMENT '����ʱ��˵������',
  LAST_UPDATE_TIME           NVARCHAR(10) COMMENT '������ʱ��',
  OPERATOR_USER              NVARCHAR(50) COMMENT '����Ա',
  ORG_NAME                   NVARCHAR(100) COMMENT '������Դ��������',
  ORG_CODE                   NVARCHAR(100) COMMENT '������Դ�������',
  BUSINESS_STATES            NVARCHAR(50) COMMENT '����״̬',
  REJECT_REASON              NVARCHAR(255) COMMENT '����ԭ��',
  IS_FILTER                  NCHAR(1) COMMENT '�Ƿ���˱�ʶ(Ĭ��ΪN-������)',
  REPORT_MESSAGE_ID          NVARCHAR(60) COMMENT '�����ļ�ID',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                    NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                    NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                    NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_CASH_FLOWS_BS_HIST COMMENT '630-��ҵ�ֽ������������';

 DROP TABLE IF EXISTS E_CASH_FLOWS_BS_MIDDLE;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_CASH_FLOWS_BS_MIDDLE
(
  ENT_CERT_TYPE  NVARCHAR(36)                  NOT NULL COMMENT '��ҵ��ݱ�ʶ����',
  ENT_CERT_NUM   NVARCHAR(60)                  NOT NULL COMMENT '��ҵ��ݱ�ʶ����',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1        NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2        NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3        NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_CASH_FLOWS_BS_MIDDLE COMMENT '630-��ҵ�ֽ�������������м��';

 DROP TABLE IF EXISTS E_COTA_INF;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_COTA_INF
(
  EAH_COTA_INF_SGMT_ID   NCHAR(32)              NOT NULL COMMENT '310-��ҵ������Ϣ��ϵ��ʽ������',
  CON_ADD_DISTRICT_CODE  NCHAR(6) COMMENT '��ϵ��ַ������������',
  CON_ADD                NVARCHAR(100) COMMENT '��ϵ��ַ',
  CON_PHONE              NVARCHAR(25) COMMENT '��ϵ�绰',
  FIN_CON_PHONE          NVARCHAR(25) COMMENT '��������ϵ�绰',
  COTA_INFO_UP_DATE      NCHAR(10) COMMENT '��ϵ��ʽ��Ϣ��������',
  EAA_BS_SGMT_ID         NCHAR(32)              NOT NULL COMMENT '�������',
  RPT_DATE               NCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_COTA_INF COMMENT '310-��ҵ������Ϣ��ϵ��ʽ��';

 DROP TABLE IF EXISTS E_COTA_INF_HIST;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_COTA_INF_HIST
(
  EAH_COTA_INF_SGMT_ID   NCHAR(32)              NOT NULL COMMENT '310-��ҵ������Ϣ��ϵ��ʽ������',
  CON_ADD_DISTRICT_CODE  NCHAR(6) COMMENT '��ϵ��ַ������������',
  CON_ADD                NVARCHAR(100) COMMENT '��ϵ��ַ',
  CON_PHONE              NVARCHAR(25) COMMENT '��ϵ�绰',
  FIN_CON_PHONE          NVARCHAR(25) COMMENT '��������ϵ�绰',
  COTA_INFO_UP_DATE      NCHAR(10) COMMENT '��ϵ��ʽ��Ϣ��������',
  EAA_BS_SGMT_ID         NCHAR(32)              NOT NULL COMMENT '�������',
  RPT_DATE               NCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_COTA_INF_HIST COMMENT '310-��ҵ������Ϣ��ϵ��ʽ��';

 DROP TABLE IF EXISTS E_CREDIT_LIM;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_CREDIT_LIM
(
  EGC_CREDIT_LIM_SGMT_ID  NCHAR(32)             NOT NULL COMMENT '420-��ҵ����Э����Ϣ�����Ϣ������',
  CREDIT_LIM_TYPE         NCHAR(2) COMMENT '���Ŷ������',
  LIM_LOOP_FLG            NCHAR(1) COMMENT '���ѭ����־',
  CREDIT_LIM              DECIMAL(17,2) COMMENT '���Ŷ��',
  CY                      NCHAR(3) COMMENT '����',
  CON_EFF_DATE            NVARCHAR(10) COMMENT '�����Ч����',
  CON_EXP_DATE            NVARCHAR(10) COMMENT '��ȵ�������',
  CON_STATUS              NCHAR(1) COMMENT ' ���״̬',
  CREDIT_REST             DECIMAL(17,2) COMMENT '�����޶�',
  CREDIT_REST_CODE        NVARCHAR(60) COMMENT '�����޶���',
  EGA_CTRCT_BS_SGMT_ID    NCHAR(32)             NOT NULL COMMENT '�������',
  RPT_DATE                NCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                 NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                 NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                 NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_CREDIT_LIM COMMENT '420-��ҵ����Э����Ϣ�����Ϣ��';

 DROP TABLE IF EXISTS E_CREDIT_LIM_HIST;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_CREDIT_LIM_HIST
(
  EGC_CREDIT_LIM_SGMT_ID  NCHAR(32)             NOT NULL COMMENT '420-��ҵ����Э����Ϣ�����Ϣ������',
  CREDIT_LIM_TYPE         NCHAR(2) COMMENT '���Ŷ������',
  LIM_LOOP_FLG            NCHAR(1) COMMENT '���ѭ����־',
  CREDIT_LIM              DECIMAL(17,2) COMMENT '���Ŷ��',
  CY                      NCHAR(3) COMMENT '����',
  CON_EFF_DATE            NVARCHAR(10) COMMENT '�����Ч����',
  CON_EXP_DATE            NVARCHAR(10) COMMENT '��ȵ�������',
  CON_STATUS              NCHAR(1) COMMENT ' ���״̬',
  CREDIT_REST             DECIMAL(17,2) COMMENT '�����޶�',
  CREDIT_REST_CODE        NVARCHAR(60) COMMENT '�����޶���',
  EGA_CTRCT_BS_SGMT_ID    NCHAR(32)             NOT NULL COMMENT '�������',
  RPT_DATE                NCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                 NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                 NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                 NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_CREDIT_LIM_HIST COMMENT '420-��ҵ����Э����Ϣ�����Ϣ��';

 DROP TABLE IF EXISTS E_CR_ACCT_ID_CAGS_INF;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_CR_ACCT_ID_CAGS_INF
(
  EGW_EN_ACCT_INF_ID_CAGS_INF_ID  NCHAR(32)     NOT NULL COMMENT '421-��ҵ����Э����Ϣ��ʶ�������������',
  INF_REC_TYPE                    NCHAR(3) COMMENT '��Ϣ��¼����',
  OD_BNES_CODE                    NVARCHAR(60) COMMENT 'ԭҵ���ʶ��',
  NW_BNES_CODE                    NVARCHAR(60) COMMENT '��ҵ���ʶ��',
  LAST_UPDATE_TIME                NVARCHAR(10) COMMENT '������ʱ��',
  OPERATOR_USER                   NVARCHAR(50) COMMENT '����Ա',
  ORG_NAME                        NVARCHAR(100) COMMENT '������Դ��������',
  ORG_CODE                        NVARCHAR(100) COMMENT '������Դ�������',
  BUSINESS_STATES                 NVARCHAR(50) COMMENT '����״̬',
  REJECT_REASON                   NVARCHAR(255) COMMENT '����ԭ��',
  IS_FILTER                       NCHAR(1) COMMENT '�Ƿ���˱�ʶ(Ĭ��ΪN-������)',
  REPORT_MESSAGE_ID               NVARCHAR(60) COMMENT '�����ļ�ID',
  RPT_DATE                        NCHAR(10) COMMENT '��������',
  NAME                            NVARCHAR(80) COMMENT '����������',
  ID_TYPE                         NVARCHAR(2) COMMENT '��������ݱ�ʶ��������',
  ID_NUM                          NVARCHAR(40) COMMENT '��������ݱ�ʶ����',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_CR_ACCT_ID_CAGS_INF COMMENT '421-��ҵ����Э����Ϣ��ʶ���������';

 DROP TABLE IF EXISTS E_CR_ACCT_ID_CAGS_INF_HIST;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_CR_ACCT_ID_CAGS_INF_HIST
(
  EGW_EN_ACCT_INF_ID_CAGS_INF_ID  NCHAR(32)     NOT NULL COMMENT '421-��ҵ����Э����Ϣ��ʶ�������������',
  INF_REC_TYPE                    NCHAR(3) COMMENT '��Ϣ��¼����',
  OD_BNES_CODE                    NVARCHAR(60) COMMENT 'ԭҵ���ʶ��',
  NW_BNES_CODE                    NVARCHAR(60) COMMENT '��ҵ���ʶ��',
  LAST_UPDATE_TIME                NVARCHAR(10) COMMENT '������ʱ��',
  OPERATOR_USER                   NVARCHAR(50) COMMENT '����Ա',
  ORG_NAME                        NVARCHAR(100) COMMENT '������Դ��������',
  ORG_CODE                        NVARCHAR(100) COMMENT '������Դ�������',
  BUSINESS_STATES                 NVARCHAR(50) COMMENT '����״̬',
  REJECT_REASON                   NVARCHAR(255) COMMENT '����ԭ��',
  IS_FILTER                       NCHAR(1) COMMENT '�Ƿ���˱�ʶ(Ĭ��ΪN-������)',
  REPORT_MESSAGE_ID               NVARCHAR(60) COMMENT '�����ļ�ID',
  RPT_DATE                        NCHAR(10) COMMENT '��������',
  NAME                            NVARCHAR(80) COMMENT '����������',
  ID_TYPE                         NVARCHAR(2) COMMENT '��������ݱ�ʶ��������',
  ID_NUM                          NVARCHAR(40) COMMENT '��������ݱ�ʶ����',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_CR_ACCT_ID_CAGS_INF_HIST COMMENT '421-��ҵ����Э����Ϣ��ʶ���������';

 DROP TABLE IF EXISTS E_CTFITG_INF;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_CTFITG_INF
(
  EBA_EN_CTFITG_INF_ID  NCHAR(32)               NOT NULL COMMENT '340-��ҵ��ݱ�ʶ������Ϣ����',
  INF_REC_TYPE          NCHAR(3) COMMENT '��Ϣ��¼����',
  ENT_NAME              NVARCHAR(80) COMMENT '��ҵ����',
  ENT_CERT_TYPE         NVARCHAR(2) COMMENT '��ҵ��ݱ�ʶ����',
  ENT_CERT_NUM          NVARCHAR(40) COMMENT '��ҵ��ݱ�ʶ����',
  OTH_ENT_CERT_TYPE     NVARCHAR(2) COMMENT '��ҵ������ݱ�ʶ����',
  OTH_ENT_CERT_NUM      NVARCHAR(40) COMMENT '��ҵ������ݱ�ʶ����',
  CERT_ASS_FLG          NCHAR(1) COMMENT '��ݱ�ʶ������־',
  LAST_UPDATE_TIME      NVARCHAR(10) COMMENT '������ʱ��',
  OPERATOR_USER         NVARCHAR(50) COMMENT '����Ա',
  ORG_NAME              NVARCHAR(100) COMMENT '������Դ��������',
  ORG_CODE              NVARCHAR(100) COMMENT '������Դ�������',
  BUSINESS_STATES       NVARCHAR(50) COMMENT '����״̬',
  REJECT_REASON         NVARCHAR(255) COMMENT '����ԭ��',
  IS_FILTER             NCHAR(1) COMMENT '�Ƿ���˱�ʶ(Ĭ��ΪN-������)',
  REPORT_MESSAGE_ID     NVARCHAR(60) COMMENT '�����ļ�ID',
  RPT_DATE              NCHAR(10) COMMENT '��Ϣ��������',
  EAA_BS_SGMT_ID        NCHAR(32)               NOT NULL COMMENT '�������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1               NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2               NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3               NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_CTFITG_INF COMMENT '340-��ҵ��ݱ�ʶ������Ϣ';

 DROP TABLE IF EXISTS E_CTFITG_INF_HIST;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_CTFITG_INF_HIST
(
  EBA_EN_CTFITG_INF_ID  NCHAR(32)               NOT NULL COMMENT '340-��ҵ��ݱ�ʶ������Ϣ����',
  INF_REC_TYPE          NCHAR(3) COMMENT '��Ϣ��¼����',
  ENT_NAME              NVARCHAR(80) COMMENT '��ҵ����',
  ENT_CERT_TYPE         NVARCHAR(2) COMMENT '��ҵ��ݱ�ʶ����',
  ENT_CERT_NUM          NVARCHAR(40) COMMENT '��ҵ��ݱ�ʶ����',
  OTH_ENT_CERT_TYPE     NVARCHAR(2) COMMENT '��ҵ������ݱ�ʶ����',
  OTH_ENT_CERT_NUM      NVARCHAR(40) COMMENT '��ҵ������ݱ�ʶ����',
  CERT_ASS_FLG          NCHAR(1) COMMENT '��ݱ�ʶ������־',
  LAST_UPDATE_TIME      NVARCHAR(10) COMMENT '������ʱ��',
  OPERATOR_USER         NVARCHAR(50) COMMENT '����Ա',
  ORG_NAME              NVARCHAR(100) COMMENT '������Դ��������',
  ORG_CODE              NVARCHAR(100) COMMENT '������Դ�������',
  BUSINESS_STATES       NVARCHAR(50) COMMENT '����״̬',
  REJECT_REASON         NVARCHAR(255) COMMENT '����ԭ��',
  IS_FILTER             NCHAR(1) COMMENT '�Ƿ���˱�ʶ(Ĭ��ΪN-������)',
  REPORT_MESSAGE_ID     NVARCHAR(60) COMMENT '�����ļ�ID',
  RPT_DATE              NCHAR(10) COMMENT '��Ϣ��������',
  EAA_BS_SGMT_ID        NCHAR(32)               NOT NULL COMMENT '�������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1               NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2               NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3               NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_CTFITG_INF_HIST COMMENT '340-��ҵ��ݱ�ʶ������Ϣ';

 DROP TABLE IF EXISTS E_CTFITG_INF_MIDDLE;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_CTFITG_INF_MIDDLE
(
  ENT_CERT_TYPE  NVARCHAR(36)                  NOT NULL COMMENT '��ҵ��ݱ�ʶ����',
  ENT_CERT_NUM   NVARCHAR(60)                  NOT NULL COMMENT '��ҵ��ݱ�ʶ����',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1        NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2        NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3        NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_CTFITG_INF_MIDDLE COMMENT '340-��ҵ��ݱ�ʶ������Ϣ�м��';

 DROP TABLE IF EXISTS E_CTRCT_BS;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_CTRCT_BS
(
  EGA_CTRCT_BS_SGMT_ID  NCHAR(32)               NOT NULL COMMENT '420-��ҵ����Э����Ϣ����������',
  INF_REC_TYPE          NCHAR(3) COMMENT '��Ϣ��¼����',
  CONTRACT_CODE         NVARCHAR(60) COMMENT '����Э���ʶ��',
  RPT_DATE              NCHAR(10) COMMENT '��Ϣ��������',
  RPT_DATE_CODE         NCHAR(2) COMMENT '����ʱ��˵������',
  NAME                  NVARCHAR(80) COMMENT '����������',
  ID_TYPE               NVARCHAR(2) COMMENT '��������ݱ�ʶ��������',
  ID_NUM                NVARCHAR(40) COMMENT '��������ݱ�ʶ����',
  MNGMT_ORG_CODE        NCHAR(14) COMMENT 'ҵ������������',
  LAST_UPDATE_TIME      NVARCHAR(10) COMMENT '������ʱ��',
  OPERATOR_USER         NVARCHAR(50) COMMENT '����Ա',
  ORG_NAME              NVARCHAR(100) COMMENT '������Դ��������',
  ORG_CODE              NVARCHAR(100) COMMENT '������Դ�������',
  BUSINESS_STATES       NVARCHAR(50) COMMENT '����״̬',
  REJECT_REASON         NVARCHAR(255) COMMENT '����ԭ��',
  IS_FILTER             NCHAR(1) COMMENT '�Ƿ���˱�ʶ(Ĭ��ΪN-������)',
  MDFC_SGMT_CODE        NCHAR(1) COMMENT '�������ζα�',
  REPORT_MESSAGE_ID     NVARCHAR(60) COMMENT '�����ļ�ID',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1               NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2               NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3               NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_CTRCT_BS COMMENT '420-��ҵ����Э����Ϣ������';

 DROP TABLE IF EXISTS E_CTRCT_BS_HIST;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_CTRCT_BS_HIST
(
  EGA_CTRCT_BS_SGMT_ID  NCHAR(32)               NOT NULL COMMENT '420-��ҵ����Э����Ϣ����������',
  INF_REC_TYPE          NCHAR(3) COMMENT '��Ϣ��¼����',
  CONTRACT_CODE         NVARCHAR(60) COMMENT '����Э���ʶ��',
  RPT_DATE              NCHAR(10) COMMENT '��Ϣ��������',
  RPT_DATE_CODE         NCHAR(2) COMMENT '����ʱ��˵������',
  NAME                  NVARCHAR(80) COMMENT '����������',
  ID_TYPE               NVARCHAR(2) COMMENT '��������ݱ�ʶ��������',
  ID_NUM                NVARCHAR(40) COMMENT '��������ݱ�ʶ����',
  MNGMT_ORG_CODE        NCHAR(14) COMMENT 'ҵ������������',
  LAST_UPDATE_TIME      NVARCHAR(10) COMMENT '������ʱ��',
  OPERATOR_USER         NVARCHAR(50) COMMENT '����Ա',
  ORG_NAME              NVARCHAR(100) COMMENT '������Դ��������',
  ORG_CODE              NVARCHAR(100) COMMENT '������Դ�������',
  BUSINESS_STATES       NVARCHAR(50) COMMENT '����״̬',
  REJECT_REASON         NVARCHAR(255) COMMENT '����ԭ��',
  IS_FILTER             NCHAR(1) COMMENT '�Ƿ���˱�ʶ(Ĭ��ΪN-������)',
  MDFC_SGMT_CODE        NCHAR(1) COMMENT '�������ζα�',
  REPORT_MESSAGE_ID     NVARCHAR(60) COMMENT '�����ļ�ID',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1               NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2               NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3               NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_CTRCT_BS_HIST COMMENT '420-��ҵ����Э����Ϣ������';

 DROP TABLE IF EXISTS E_CTRCT_BS_MIDDLE;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_CTRCT_BS_MIDDLE
(
  CONTRACT_CODE  NVARCHAR(60)                  NOT NULL COMMENT '����Э���ʶ��',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1        NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2        NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3        NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_CTRCT_BS_MIDDLE COMMENT '420-��ҵ����Э����Ϣ�������м��';

 DROP TABLE IF EXISTS E_CTRCT_CERT_REL;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_CTRCT_CERT_REL
(
  EGB_CTRCT_CERT_REL_SGMT_ID  NCHAR(32)         NOT NULL COMMENT '420-��ҵ����Э����Ϣ��ͬ����������',
  BRER_TYPE                   NCHAR(1) COMMENT '��ͬ������������',
  CERT_REL_NAME               NVARCHAR(80) COMMENT '��ͬ����������',
  CERT_REL_IDTYPE             NVARCHAR(2) COMMENT '��ͬ��������ݱ�ʶ����',
  CERT_REL_ID_NUM             NVARCHAR(40) COMMENT '��ͬ��������ݱ�ʶ����',
  EGA_CTRCT_BS_SGMT_ID        NCHAR(32)         NOT NULL COMMENT '�������',
  RPT_DATE                    NCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                     NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                     NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                     NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_CTRCT_CERT_REL COMMENT '420-��ҵ����Э����Ϣ��ͬ������';

 DROP TABLE IF EXISTS E_CTRCT_CERT_REL_HIST;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_CTRCT_CERT_REL_HIST
(
  EGB_CTRCT_CERT_REL_SGMT_ID  NCHAR(32)         NOT NULL COMMENT '420-��ҵ����Э����Ϣ��ͬ����������',
  BRER_TYPE                   NCHAR(1) COMMENT '��ͬ������������',
  CERT_REL_NAME               NVARCHAR(80) COMMENT '��ͬ����������',
  CERT_REL_IDTYPE             NVARCHAR(2) COMMENT '��ͬ��������ݱ�ʶ����',
  CERT_REL_ID_NUM             NVARCHAR(40) COMMENT '��ͬ��������ݱ�ʶ����',
  EGA_CTRCT_BS_SGMT_ID        NCHAR(32)         NOT NULL COMMENT '�������',
  RPT_DATE                    NCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                     NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                     NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                     NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_CTRCT_CERT_REL_HIST COMMENT '420-��ҵ����Э����Ϣ��ͬ������';

 DROP TABLE IF EXISTS E_CTRCT_INF_DEL;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_CTRCT_INF_DEL
(
  EGY_EN_CTRCT_INF_DEL_ID  NCHAR(32)            NOT NULL COMMENT '423-��ҵ����Э����Ϣ����ɾ������������',
  INF_REC_TYPE             NCHAR(3) COMMENT '��Ϣ��¼����',
  DEL_REC_CODE             NVARCHAR(60) COMMENT '��ɾ��ҵ���ʶ��',
  DEL_SGMT_CODE            NCHAR(1) COMMENT '��ɾ���ζα�',
  DEL_START_DATE           NVARCHAR(10) COMMENT '��ɾ����ʼ����',
  DEL_END_DATE             NVARCHAR(10) COMMENT '��ɾ����������',
  LAST_UPDATE_TIME         NVARCHAR(10) COMMENT '������ʱ��',
  OPERATOR_USER            NVARCHAR(50) COMMENT '����Ա',
  ORG_NAME                 NVARCHAR(100) COMMENT '������Դ��������',
  ORG_CODE                 NVARCHAR(100) COMMENT '������Դ�������',
  BUSINESS_STATES          NVARCHAR(50) COMMENT '����״̬',
  REJECT_REASON            NVARCHAR(255) COMMENT '����ԭ��',
  IS_FILTER                NCHAR(1) COMMENT '�Ƿ���˱�ʶ(Ĭ��ΪN-������)',
  REPORT_MESSAGE_ID        NVARCHAR(60) COMMENT '�����ļ�ID',
  RPT_DATE                 NCHAR(10) COMMENT '��������',
  NAME                     NVARCHAR(80) COMMENT '����������',
  ID_TYPE                  NVARCHAR(2) COMMENT '��������ݱ�ʶ��������',
  ID_NUM                   NVARCHAR(40) COMMENT '��������ݱ�ʶ����',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                  NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                  NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                  NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_CTRCT_INF_DEL COMMENT '423-��ҵ����Э����Ϣ����ɾ��������';

 DROP TABLE IF EXISTS E_CTRCT_INF_DEL_HIST;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_CTRCT_INF_DEL_HIST
(
  EGY_EN_CTRCT_INF_DEL_ID  NCHAR(32)            NOT NULL COMMENT '423-��ҵ����Э����Ϣ����ɾ������������',
  INF_REC_TYPE             NCHAR(3) COMMENT '��Ϣ��¼����',
  DEL_REC_CODE             NVARCHAR(60) COMMENT '��ɾ��ҵ���ʶ��',
  DEL_SGMT_CODE            NCHAR(1) COMMENT '��ɾ���ζα�',
  DEL_START_DATE           NVARCHAR(10) COMMENT '��ɾ����ʼ����',
  DEL_END_DATE             NVARCHAR(10) COMMENT '��ɾ����������',
  LAST_UPDATE_TIME         NVARCHAR(10) COMMENT '������ʱ��',
  OPERATOR_USER            NVARCHAR(50) COMMENT '����Ա',
  ORG_NAME                 NVARCHAR(100) COMMENT '������Դ��������',
  ORG_CODE                 NVARCHAR(100) COMMENT '������Դ�������',
  BUSINESS_STATES          NVARCHAR(50) COMMENT '����״̬',
  REJECT_REASON            NVARCHAR(255) COMMENT '����ԭ��',
  IS_FILTER                NCHAR(1) COMMENT '�Ƿ���˱�ʶ(Ĭ��ΪN-������)',
  REPORT_MESSAGE_ID        NVARCHAR(60) COMMENT '�����ļ�ID',
  RPT_DATE                 NCHAR(10) COMMENT '��������',
  NAME                     NVARCHAR(80) COMMENT '����������',
  ID_TYPE                  NVARCHAR(2) COMMENT '��������ݱ�ʶ��������',
  ID_NUM                   NVARCHAR(40) COMMENT '��������ݱ�ʶ����',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                  NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                  NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                  NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_CTRCT_INF_DEL_HIST COMMENT '423-��ҵ����Э����Ϣ����ɾ��������';

 DROP TABLE IF EXISTS E_CTRCT_INF_ENT_DEL;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_CTRCT_INF_ENT_DEL
(
  EGZ_EN_CTRCT_INF_ENT_DEL_ID  NCHAR(32)        NOT NULL COMMENT '424-��ҵ����Э����Ϣ����ɾ����������',
  INF_REC_TYPE                 NCHAR(3) COMMENT '��Ϣ��¼����',
  DEL_REC_CODE                 NVARCHAR(60) COMMENT '��ɾ��ҵ���ʶ��',
  LAST_UPDATE_TIME             NVARCHAR(10) COMMENT '������ʱ��',
  OPERATOR_USER                NVARCHAR(50) COMMENT '����Ա',
  ORG_NAME                     NVARCHAR(100) COMMENT '������Դ��������',
  ORG_CODE                     NVARCHAR(100) COMMENT '������Դ�������',
  BUSINESS_STATES              NVARCHAR(50) COMMENT '����״̬',
  REJECT_REASON                NVARCHAR(255) COMMENT '����ԭ��',
  IS_FILTER                    NCHAR(1) COMMENT '�Ƿ���˱�ʶ(Ĭ��ΪN-������)',
  REPORT_MESSAGE_ID            NVARCHAR(60) COMMENT '�����ļ�ID',
  RPT_DATE                     NCHAR(10) COMMENT '��������',
  NAME                         NVARCHAR(80) COMMENT '����������',
  ID_TYPE                      NVARCHAR(2) COMMENT '��������ݱ�ʶ��������',
  ID_NUM                       NVARCHAR(40) COMMENT '��������ݱ�ʶ����',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                      NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                      NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                      NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_CTRCT_INF_ENT_DEL COMMENT '424-��ҵ����Э����Ϣ����ɾ������';

 DROP TABLE IF EXISTS E_CTRCT_INF_ENT_DEL_HIST;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_CTRCT_INF_ENT_DEL_HIST
(
  EGZ_EN_CTRCT_INF_ENT_DEL_ID  NCHAR(32)        NOT NULL COMMENT '424-��ҵ����Э����Ϣ����ɾ����������',
  INF_REC_TYPE                 NCHAR(3) COMMENT '��Ϣ��¼����',
  DEL_REC_CODE                 NVARCHAR(60) COMMENT '��ɾ��ҵ���ʶ��',
  LAST_UPDATE_TIME             NVARCHAR(10) COMMENT '������ʱ��',
  OPERATOR_USER                NVARCHAR(50) COMMENT '����Ա',
  ORG_NAME                     NVARCHAR(100) COMMENT '������Դ��������',
  ORG_CODE                     NVARCHAR(100) COMMENT '������Դ�������',
  BUSINESS_STATES              NVARCHAR(50) COMMENT '����״̬',
  REJECT_REASON                NVARCHAR(255) COMMENT '����ԭ��',
  IS_FILTER                    NCHAR(1) COMMENT '�Ƿ���˱�ʶ(Ĭ��ΪN-������)',
  REPORT_MESSAGE_ID            NVARCHAR(60) COMMENT '�����ļ�ID',
  RPT_DATE                     NCHAR(10) COMMENT '��������',
  NAME                         NVARCHAR(80) COMMENT '����������',
  ID_TYPE                      NVARCHAR(2) COMMENT '��������ݱ�ʶ��������',
  ID_NUM                       NVARCHAR(40) COMMENT '��������ݱ�ʶ����',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                      NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                      NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                      NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_CTRCT_INF_ENT_DEL_HIST COMMENT '424-��ҵ����Э����Ϣ����ɾ������';

 DROP TABLE IF EXISTS E_FCS_INF;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_FCS_INF
(
  EAC_FCS_INF_SGMT_ID  NCHAR(32)                NOT NULL COMMENT '310-��ҵ������Ϣ�����ſ���Ϣ������',
  NATIONALITY          NCHAR(3) COMMENT '�������',
  REG_ADD              NVARCHAR(80) COMMENT '�Ǽǵ�ַ',
  ADM_DIV_OF_REG       NCHAR(6) COMMENT '�Ǽǵ�������������',
  ESTABLISH_DATE       NVARCHAR(10) COMMENT '��������',
  BIZ_END_DATE         NVARCHAR(10) COMMENT 'Ӫҵ���֤������',
  BIZ_RANGE            NVARCHAR(2000) COMMENT 'ҵ��Χ',
  ECO_INDUS_CATE       NCHAR(5) COMMENT '��ҵ�������',
  ECO_TYPE             NCHAR(3) COMMENT '�������ʹ���',
  ENT_SCALE            NCHAR(1) COMMENT '��ҵ��ģ',
  FCS_INFO_UP_DATE     NCHAR(10) COMMENT '�����ſ���Ϣ��������',
  EAA_BS_SGMT_ID       NCHAR(32)                NOT NULL COMMENT '�������',
  RPT_DATE             NCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1              NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2              NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3              NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_FCS_INF COMMENT '310-��ҵ������Ϣ�����ſ���Ϣ��';

 DROP TABLE IF EXISTS E_FCS_INF_HIST;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_FCS_INF_HIST
(
  EAC_FCS_INF_SGMT_ID  NCHAR(32)                NOT NULL COMMENT '310-��ҵ������Ϣ�����ſ���Ϣ������',
  NATIONALITY          NCHAR(3) COMMENT '�������',
  REG_ADD              NVARCHAR(80) COMMENT '�Ǽǵ�ַ',
  ADM_DIV_OF_REG       NCHAR(6) COMMENT '�Ǽǵ�������������',
  ESTABLISH_DATE       NVARCHAR(10) COMMENT '��������',
  BIZ_END_DATE         NVARCHAR(10) COMMENT 'Ӫҵ���֤������',
  BIZ_RANGE            NVARCHAR(2000) COMMENT 'ҵ��Χ',
  ECO_INDUS_CATE       NCHAR(5) COMMENT '��ҵ�������',
  ECO_TYPE             NCHAR(3) COMMENT '�������ʹ���',
  ENT_SCALE            NCHAR(1) COMMENT '��ҵ��ģ',
  FCS_INFO_UP_DATE     NCHAR(10) COMMENT '�����ſ���Ϣ��������',
  EAA_BS_SGMT_ID       NCHAR(32)                NOT NULL COMMENT '�������',
  RPT_DATE             NCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1              NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2              NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3              NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_FCS_INF_HIST COMMENT '310-��ҵ������Ϣ�����ſ���Ϣ��';

 DROP TABLE IF EXISTS E_GUAR_ACCT_BS;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_GUAR_ACCT_BS
(
  EEA_GUAR_ACCT_BS_SGMT_ID  NCHAR(32)           NOT NULL COMMENT '440-��ҵ�����˻���Ϣ����������',
  INF_REC_TYPE              NCHAR(3) COMMENT '��Ϣ��¼����',
  ACCT_TYPE                 NCHAR(2) COMMENT '�˻�����',
  ACCT_CODE                 NVARCHAR(60) COMMENT '�˻���ʶ��',
  RPT_DATE                  NCHAR(10) COMMENT '��Ϣ��������',
  RPT_DATE_CODE             NCHAR(2) COMMENT '����ʱ��˵������',
  NAME                      NVARCHAR(80) COMMENT 'ծ��������',
  ID_TYPE                   NVARCHAR(2) COMMENT 'ծ������ݱ�ʶ����',
  ID_NUM                    NVARCHAR(40) COMMENT 'ծ������ݱ�ʶ����',
  MNGMT_ORG_CODE            NCHAR(14) COMMENT 'ҵ������������',
  LAST_UPDATE_TIME          NVARCHAR(10) COMMENT '������ʱ��',
  OPERATOR_USER             NVARCHAR(50) COMMENT '����Ա',
  ORG_NAME                  NVARCHAR(100) COMMENT '������Դ��������',
  ORG_CODE                  NVARCHAR(100) COMMENT '������Դ�������',
  BUSINESS_STATES           NVARCHAR(50) COMMENT '����״̬',
  REJECT_REASON             NVARCHAR(255) COMMENT '����ԭ��',
  IS_FILTER                 NCHAR(1) COMMENT '�Ƿ���˱�ʶ(Ĭ��ΪN-������)',
  REPORT_MESSAGE_ID         NVARCHAR(60) COMMENT '�����ļ�ID',
  MDFC_SGMT_CODE            NCHAR(1) COMMENT '�������ζα�',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                   NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                   NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                   NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_GUAR_ACCT_BS COMMENT '440-��ҵ�����˻���Ϣ������';

 DROP TABLE IF EXISTS E_GUAR_ACCT_BS_HIST;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_GUAR_ACCT_BS_HIST
(
  EEA_GUAR_ACCT_BS_SGMT_ID  NCHAR(32)           NOT NULL COMMENT '440-��ҵ�����˻���Ϣ����������',
  INF_REC_TYPE              NCHAR(3) COMMENT '��Ϣ��¼����',
  ACCT_TYPE                 NCHAR(2) COMMENT '�˻�����',
  ACCT_CODE                 NVARCHAR(60) COMMENT '�˻���ʶ��',
  RPT_DATE                  NCHAR(10) COMMENT '��Ϣ��������',
  RPT_DATE_CODE             NCHAR(2) COMMENT '����ʱ��˵������',
  NAME                      NVARCHAR(80) COMMENT 'ծ��������',
  ID_TYPE                   NVARCHAR(2) COMMENT 'ծ������ݱ�ʶ����',
  ID_NUM                    NVARCHAR(40) COMMENT 'ծ������ݱ�ʶ����',
  MNGMT_ORG_CODE            NCHAR(14) COMMENT 'ҵ������������',
  LAST_UPDATE_TIME          NVARCHAR(10) COMMENT '������ʱ��',
  OPERATOR_USER             NVARCHAR(50) COMMENT '����Ա',
  ORG_NAME                  NVARCHAR(100) COMMENT '������Դ��������',
  ORG_CODE                  NVARCHAR(100) COMMENT '������Դ�������',
  BUSINESS_STATES           NVARCHAR(50) COMMENT '����״̬',
  REJECT_REASON             NVARCHAR(255) COMMENT '����ԭ��',
  IS_FILTER                 NCHAR(1) COMMENT '�Ƿ���˱�ʶ(Ĭ��ΪN-������)',
  REPORT_MESSAGE_ID         NVARCHAR(60) COMMENT '�����ļ�ID',
  MDFC_SGMT_CODE            NCHAR(1) COMMENT '�������ζα�',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                   NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                   NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                   NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_GUAR_ACCT_BS_HIST COMMENT '440-��ҵ�����˻���Ϣ������';

 DROP TABLE IF EXISTS E_GUAR_ACCT_BS_INF;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_GUAR_ACCT_BS_INF
(
  EEB_GUAR_ACCT_BS_INF_SGMT_ID  NCHAR(32)       NOT NULL COMMENT '440-��ҵ�����˻���Ϣ������Ϣ������',
  BUSI_LINES                    NCHAR(1) COMMENT '����ҵ�����',
  BUSI_DTIL_LINES               NCHAR(2) COMMENT '����ҵ������ϸ��',
  OPEN_DATE                     NVARCHAR(10) COMMENT '��������',
  GUAR_AMT                      DECIMAL(17,2) COMMENT '�������',
  CY                            NCHAR(3) COMMENT '����',
  DUE_DATE                      NVARCHAR(10) COMMENT '��������',
  GUAR_MODE                     NVARCHAR(2) COMMENT '��������ʽ',
  OTH_REPY_GUARWAY              NCHAR(1) COMMENT '�������֤��ʽ',
  SEC_DEP                       DECIMAL(17,2) COMMENT '��֤��ٷֱ�',
  CTRCT_TXT_CODE                NVARCHAR(60) COMMENT '������ͬ�ı����',
  EEA_GUAR_ACCT_BS_SGMT_ID      NCHAR(32)       NOT NULL COMMENT '�������',
  RPT_DATE                      NCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                       NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                       NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                       NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_GUAR_ACCT_BS_INF COMMENT '440-��ҵ�����˻���Ϣ������Ϣ��';

 DROP TABLE IF EXISTS E_GUAR_ACCT_BS_INF_HIST;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_GUAR_ACCT_BS_INF_HIST
(
  EEB_GUAR_ACCT_BS_INF_SGMT_ID  NCHAR(32)       NOT NULL COMMENT '440-��ҵ�����˻���Ϣ������Ϣ������',
  BUSI_LINES                    NCHAR(1) COMMENT '����ҵ�����',
  BUSI_DTIL_LINES               NCHAR(2) COMMENT '����ҵ������ϸ��',
  OPEN_DATE                     NVARCHAR(10) COMMENT '��������',
  GUAR_AMT                      DECIMAL(17,2) COMMENT '�������',
  CY                            NCHAR(3) COMMENT '����',
  DUE_DATE                      NVARCHAR(10) COMMENT '��������',
  GUAR_MODE                     NVARCHAR(2) COMMENT '��������ʽ',
  OTH_REPY_GUARWAY              NCHAR(1) COMMENT '�������֤��ʽ',
  SEC_DEP                       DECIMAL(17,2) COMMENT '��֤��ٷֱ�',
  CTRCT_TXT_CODE                NVARCHAR(60) COMMENT '������ͬ�ı����',
  EEA_GUAR_ACCT_BS_SGMT_ID      NCHAR(32)       NOT NULL COMMENT '�������',
  RPT_DATE                      NCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                       NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                       NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                       NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_GUAR_ACCT_BS_INF_HIST COMMENT '440-��ҵ�����˻���Ϣ������Ϣ��';

 DROP TABLE IF EXISTS E_GUAR_ACCT_BS_MIDDLE;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_GUAR_ACCT_BS_MIDDLE
(
  ACCT_TYPE  NVARCHAR(36)                      NOT NULL COMMENT '�˻�����',
  ACCT_CODE  NVARCHAR(60)                      NOT NULL COMMENT '�˻���ʶ��',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1    NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2    NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3    NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_GUAR_ACCT_BS_MIDDLE COMMENT '440-��ҵ�����˻���Ϣ�������м��';

 DROP TABLE IF EXISTS E_GUAR_ACCT_CRED;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_GUAR_ACCT_CRED
(
  EEE_GUAR_ACCT_CRED_SGMT_ID  NCHAR(32)         NOT NULL COMMENT '440-��ҵ�����˻���Ϣ���Ŷ����Ϣ������',
  MCC                         NVARCHAR(60) COMMENT '����Э���ʶ��',
  EEA_GUAR_ACCT_BS_SGMT_ID    NCHAR(32)         NOT NULL COMMENT '�������',
  RPT_DATE                    NCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                     NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                     NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                     NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_GUAR_ACCT_CRED COMMENT '440-��ҵ�����˻���Ϣ���Ŷ����Ϣ��';

 DROP TABLE IF EXISTS E_GUAR_ACCT_CRED_HIST;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_GUAR_ACCT_CRED_HIST
(
  EEE_GUAR_ACCT_CRED_SGMT_ID  NCHAR(32)         NOT NULL COMMENT '440-��ҵ�����˻���Ϣ���Ŷ����Ϣ������',
  MCC                         NVARCHAR(60) COMMENT '����Э���ʶ��',
  EEA_GUAR_ACCT_BS_SGMT_ID    NCHAR(32)         NOT NULL COMMENT '�������',
  RPT_DATE                    NCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                     NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                     NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                     NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_GUAR_ACCT_CRED_HIST COMMENT '440-��ҵ�����˻���Ϣ���Ŷ����Ϣ��';

 DROP TABLE IF EXISTS E_GUAR_INSURANCE_INF;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_GUAR_INSURANCE_INF
(
  EEF_GUAR_RLT_REPYMT_INF_SG_ID  NCHAR(32)      NOT NULL COMMENT '440-��ҵ�����˻���Ϣ�ڱ�������Ϣ������',
  ACCT_STATUS                    NCHAR(1) COMMENT '�˻�״̬',
  LOAN_AMT                       DECIMAL(17,2) COMMENT '�ڱ����',
  REPAY_PRD                      NVARCHAR(10) COMMENT '���仯����',
  FIVE_CATE                      NCHAR(1) COMMENT '�弶����',
  FIVE_CATE_ADJ_DATE             NVARCHAR(10) COMMENT '�弶�����϶�����',
  RI_EX                          DECIMAL(17,2) COMMENT '���ճ���',
  COMP_ADV_FLAG                  NCHAR(1) COMMENT '����������־',
  CLOSE_DATE                     NVARCHAR(10) COMMENT '�˻��ر�����',
  EEA_GUAR_ACCT_BS_SGMT_ID       NCHAR(32)      NOT NULL COMMENT '�������',
  RPT_DATE                       NCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                        NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                        NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                        NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_GUAR_INSURANCE_INF COMMENT '440-��ҵ�����˻���Ϣ�ڱ�������Ϣ��';

 DROP TABLE IF EXISTS E_GUAR_INSURANCE_INF_HIST;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_GUAR_INSURANCE_INF_HIST
(
  EEF_GUAR_RLT_REPYMT_INF_SG_ID  NCHAR(32)      NOT NULL COMMENT '440-��ҵ�����˻���Ϣ�ڱ�������Ϣ������',
  ACCT_STATUS                    NCHAR(1) COMMENT '�˻�״̬',
  LOAN_AMT                       DECIMAL(17,2) COMMENT '�ڱ����',
  REPAY_PRD                      NVARCHAR(10) COMMENT '���仯����',
  FIVE_CATE                      NCHAR(1) COMMENT '�弶����',
  FIVE_CATE_ADJ_DATE             NVARCHAR(10) COMMENT '�弶�����϶�����',
  RI_EX                          DECIMAL(17,2) COMMENT '���ճ���',
  COMP_ADV_FLAG                  NCHAR(1) COMMENT '����������־',
  CLOSE_DATE                     NVARCHAR(10) COMMENT '�˻��ر�����',
  EEA_GUAR_ACCT_BS_SGMT_ID       NCHAR(32)      NOT NULL COMMENT '�������',
  RPT_DATE                       NCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                        NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                        NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                        NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_GUAR_INSURANCE_INF_HIST COMMENT '440-��ҵ�����˻���Ϣ�ڱ�������Ϣ��';

 DROP TABLE IF EXISTS E_GUAR_MOTGA_CLTAL_INF;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_GUAR_MOTGA_CLTAL_INF
(
  EED_GUAR_MOTGA_CLTAL_INF_ID  NCHAR(32)        NOT NULL COMMENT '440-��ҵ�����˻���Ϣ����Ѻ����Ϣ������',
  CCC                          NVARCHAR(60) COMMENT '�֣��ʣ�Ѻ��ͬ��ʶ��',
  EEA_GUAR_ACCT_BS_SGMT_ID     NCHAR(32)        NOT NULL COMMENT '�������',
  RPT_DATE                     NCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                      NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                      NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                      NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_GUAR_MOTGA_CLTAL_INF COMMENT '440-��ҵ�����˻���Ϣ����Ѻ����Ϣ��';

 DROP TABLE IF EXISTS E_GUAR_MOTGA_CLTAL_INF_HIST;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_GUAR_MOTGA_CLTAL_INF_HIST
(
  EED_GUAR_MOTGA_CLTAL_INF_ID  NCHAR(32)        NOT NULL COMMENT '440-��ҵ�����˻���Ϣ����Ѻ����Ϣ������',
  CCC                          NVARCHAR(60) COMMENT '�֣��ʣ�Ѻ��ͬ��ʶ��',
  EEA_GUAR_ACCT_BS_SGMT_ID     NCHAR(32)        NOT NULL COMMENT '�������',
  RPT_DATE                     NCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                      NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                      NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                      NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_GUAR_MOTGA_CLTAL_INF_HIST COMMENT '440-��ҵ�����˻���Ϣ����Ѻ����Ϣ��';

 DROP TABLE IF EXISTS E_ICDN_RLTP_INF;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_ICDN_RLTP_INF
(
  ECA_EN_ICDN_RLTP_INF_ID  NCHAR(32)            NOT NULL COMMENT '350-��ҵ�������ϵ��Ϣ����',
  INF_REC_TYPE             NCHAR(3) COMMENT '��Ϣ��¼����',
  ENT_NAME                 NVARCHAR(80) COMMENT 'A��ҵ����',
  ENT_CERT_TYPE            NVARCHAR(2) COMMENT 'A��ҵ��ݱ�ʶ����',
  ENT_CERT_NUM             NVARCHAR(40) COMMENT 'A��ҵ��ݱ�ʶ��',
  ASSO_ENT_NAME            NVARCHAR(80) COMMENT 'B��ҵ����',
  ASSO_ENT_CERT_TYPE       NVARCHAR(2) COMMENT 'B��ҵ��ݱ�ʶ����',
  ASSO_ENT_CERT_NUM        NVARCHAR(40) COMMENT 'B��ҵ��ݱ�ʶ��',
  ASSO_TYPE                NCHAR(2) COMMENT '������ϵ����',
  ASSO_SIGN                NCHAR(1) COMMENT '������־',
  LAST_UPDATE_TIME         NVARCHAR(10) COMMENT '������ʱ��',
  OPERATOR_USER            NVARCHAR(50) COMMENT '����Ա',
  ORG_NAME                 NVARCHAR(100) COMMENT '������Դ��������',
  ORG_CODE                 NVARCHAR(100) COMMENT '������Դ�������',
  BUSINESS_STATES          NVARCHAR(50) COMMENT '����״̬',
  REJECT_REASON            NVARCHAR(255) COMMENT '����ԭ��',
  IS_FILTER                NCHAR(1) COMMENT '�Ƿ���˱�ʶ(Ĭ��ΪN-������)',
  REPORT_MESSAGE_ID        NVARCHAR(60) COMMENT '�����ļ�ID',
  RPT_DATE                 NCHAR(10) COMMENT '��Ϣ��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                  NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                  NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                  NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_ICDN_RLTP_INF COMMENT '350-��ҵ�������ϵ��Ϣ';

 DROP TABLE IF EXISTS E_ICDN_RLTP_INF_HIST;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_ICDN_RLTP_INF_HIST
(
  ECA_EN_ICDN_RLTP_INF_ID  NCHAR(32)            NOT NULL COMMENT '350-��ҵ�������ϵ��Ϣ����',
  INF_REC_TYPE             NCHAR(3) COMMENT '��Ϣ��¼����',
  ENT_NAME                 NVARCHAR(80) COMMENT 'A��ҵ����',
  ENT_CERT_TYPE            NVARCHAR(2) COMMENT 'A��ҵ��ݱ�ʶ����',
  ENT_CERT_NUM             NVARCHAR(40) COMMENT 'A��ҵ��ݱ�ʶ��',
  ASSO_ENT_NAME            NVARCHAR(80) COMMENT 'B��ҵ����',
  ASSO_ENT_CERT_TYPE       NVARCHAR(2) COMMENT 'B��ҵ��ݱ�ʶ����',
  ASSO_ENT_CERT_NUM        NVARCHAR(40) COMMENT 'B��ҵ��ݱ�ʶ��',
  ASSO_TYPE                NCHAR(2) COMMENT '������ϵ����',
  ASSO_SIGN                NCHAR(1) COMMENT '������־',
  LAST_UPDATE_TIME         NVARCHAR(10) COMMENT '������ʱ��',
  OPERATOR_USER            NVARCHAR(50) COMMENT '����Ա',
  ORG_NAME                 NVARCHAR(100) COMMENT '������Դ��������',
  ORG_CODE                 NVARCHAR(100) COMMENT '������Դ�������',
  BUSINESS_STATES          NVARCHAR(50) COMMENT '����״̬',
  REJECT_REASON            NVARCHAR(255) COMMENT '����ԭ��',
  IS_FILTER                NCHAR(1) COMMENT '�Ƿ���˱�ʶ(Ĭ��ΪN-������)',
  REPORT_MESSAGE_ID        NVARCHAR(60) COMMENT '�����ļ�ID',
  RPT_DATE                 NCHAR(10) COMMENT '��Ϣ��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                  NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                  NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                  NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_ICDN_RLTP_INF_HIST COMMENT '350-��ҵ�������ϵ��Ϣ';

 DROP TABLE IF EXISTS E_ICDN_RLTP_INF_MIDDLE;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_ICDN_RLTP_INF_MIDDLE
(
  ENT_CERT_TYPE  NVARCHAR(36)                  NOT NULL COMMENT '��ҵ��ݱ�ʶ����',
  ENT_CERT_NUM   NVARCHAR(60)                  NOT NULL COMMENT '��ҵ��ݱ�ʶ����',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1        NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2        NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3        NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_ICDN_RLTP_INF_MIDDLE COMMENT '350-��ҵ�������ϵ��Ϣ�м��';

 DROP TABLE IF EXISTS E_ID;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_ID
(
  EAB_ID_SGMT_ID     NCHAR(32)                  NOT NULL COMMENT '310-��ҵ������Ϣ������ʶ��Ϣ������',
  OTH_ENT_CERT_TYPE  NVARCHAR(2) COMMENT '��ҵ��ݱ�ʶ����',
  OTH_ENT_CERT_NUM   NVARCHAR(40) COMMENT '��ҵ��ݱ�ʶ����',
  ID_INFO_UP_DATE    NCHAR(10) COMMENT '��Ϣ��������',
  EAA_BS_SGMT_ID     NCHAR(32)                  NOT NULL COMMENT '�������',
  RPT_DATE           NCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1            NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2            NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3            NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_ID COMMENT '310-��ҵ������Ϣ������ʶ��Ϣ��';

 DROP TABLE IF EXISTS E_ID_HIST;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_ID_HIST
(
  EAB_ID_SGMT_ID     NCHAR(32)                  NOT NULL COMMENT '310-��ҵ������Ϣ������ʶ��Ϣ������',
  OTH_ENT_CERT_TYPE  NVARCHAR(2) COMMENT '��ҵ��ݱ�ʶ����',
  OTH_ENT_CERT_NUM   NVARCHAR(40) COMMENT '��ҵ��ݱ�ʶ����',
  ID_INFO_UP_DATE    NCHAR(10) COMMENT '��Ϣ��������',
  EAA_BS_SGMT_ID     NCHAR(32)                  NOT NULL COMMENT '�������',
  RPT_DATE           NCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1            NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2            NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3            NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_ID_HIST COMMENT '310-��ҵ������Ϣ������ʶ��Ϣ��';

 DROP TABLE IF EXISTS E_INCOME_EXPENSE;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_INCOME_EXPENSE
(
  ELB_INCOME_AND_EXPENSE_STAT_ID  NCHAR(32)     NOT NULL COMMENT '650-��ҵ��λ����֧������ҵ��λ����֧���������',
  CURRENT_FINANCIAL_SUBSIDY_CARR  DECIMAL(17,2) COMMENT '���ڲ���������ת����',
  FINANCIAL_SUBSIDY_REVENUE       DECIMAL(17,2) COMMENT '������������',
  UNDERTAKINGS_EXPENDITURE_FINAN  DECIMAL(17,2) COMMENT '��ҵ֧������������֧����',
  CURRENT_UNDERTAKINGS_CARRIED_O  DECIMAL(17,2) COMMENT '������ҵ��ת����',
  UNDERTAKINGS_CLASS_REVENUE      DECIMAL(17,2) COMMENT '��ҵ������',
  UNDERTAKINGS_REVENUE            DECIMAL(17,2) COMMENT '��ҵ����',
  SUPERIOR_SUBSIDY_REVENUE        DECIMAL(17,2) COMMENT '�ϼ���������',
  REVENUE_TURNED_OVER_BY_SUBSIDI  DECIMAL(17,2) COMMENT '������λ�Ͻ�����',
  OTHER_REVENUE                   DECIMAL(17,2) COMMENT '��������',
  DONATION_INCOME                 DECIMAL(17,2) COMMENT '�����������Ŀ�£���������',
  UNDERTAKINGS_CLASS_EXPENDITURE  DECIMAL(17,2) COMMENT '��ҵ��֧��',
  UNDERTAKINGS_EXPENDITURE_NON_F  DECIMAL(17,2) COMMENT '��ҵ֧�����ǲ�������֧����',
  PAYMENT_TO_THE_HIGHER_AUTHORIT  DECIMAL(17,2) COMMENT '�Ͻ��ϼ�֧��',
  GRANT_TO_THE_AUXILIARY_ORGANIZ  DECIMAL(17,2) COMMENT '�Ը�����λ����֧��',
  OTHER_EXPENDITURE               DECIMAL(17,2) COMMENT '����֧��',
  CURRENT_OPERATING_BALANCE       DECIMAL(17,2) COMMENT '���ھ�Ӫ����',
  OPERATING_REVENUE               DECIMAL(17,2) COMMENT '��Ӫ����',
  OPERATING_EXPENDITURE           DECIMAL(17,2) COMMENT '��Ӫ֧��',
  OPERATING_BALANCE_MADE_UP_FOR_  DECIMAL(17,2) COMMENT '�ֲ���ǰ��ȿ����ľ�Ӫ����',
  NON_FINANCIAL_SUBSIDY_CARRIED_  DECIMAL(17,2) COMMENT '����ǲ���������ת����',
  NON_FINANCIAL_AID_CARRIED_OVER  DECIMAL(17,2) COMMENT '�ǲ���������ת',
  NON_FINANCIAL_AID_BALANCE_THIS  DECIMAL(17,2) COMMENT '����ǲ�����������',
  ENTERPRISEINCOME_TAX_PAYABLE    DECIMAL(17,2) COMMENT 'Ӧ����ҵ����˰',
  SPECIAL_FUNDS_TO_EXTRACT        DECIMAL(17,2) COMMENT '��ȡר�û���',
  PUBLIC_FUND_TURNED_INTO         DECIMAL(17,2) COMMENT 'ת����ҵ����',
  ELA_INCOME_AND_EXPENSE_STAT_ID  NCHAR(32)     NOT NULL COMMENT '�������',
  RPT_DATE                        NCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_INCOME_EXPENSE COMMENT '650-��ҵ��λ����֧������ҵ��λ����֧�����';

 DROP TABLE IF EXISTS E_INCOME_EXPENSE_BS;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_INCOME_EXPENSE_BS
(
  ELA_INCOME_AND_EXPENSE_STAT_ID  NCHAR(32)     NOT NULL COMMENT '650-��ҵ��λ����֧�������������',
  INF_REC_TYPE                    NCHAR(3) COMMENT '��Ϣ��¼����',
  ENT_NAME                        NVARCHAR(80) COMMENT '��ҵ����',
  ENT_CERT_TYPE                   NCHAR(2) COMMENT '��ҵ��ݱ�ʶ����',
  ENT_CERT_NUM                    NVARCHAR(40) COMMENT '��ҵ��ݱ�ʶ����',
  RPT_DATE                        NCHAR(10) COMMENT '��Ϣ��������',
  SHEET_YEAR                      NCHAR(4) COMMENT '�������',
  SHEET_TYPE                      NCHAR(2) COMMENT '��������',
  SHEET_TYPE_DIVIDE               NCHAR(1) COMMENT '��������ϸ��',
  AUDIT_FIRM_NAME                 NVARCHAR(80) COMMENT '�������������',
  AUDITOR_NAME                    NVARCHAR(30) COMMENT '�����Ա����',
  AUDIT_TIME                      NVARCHAR(10) COMMENT '���ʱ��',
  CIMOC                           NCHAR(14) COMMENT '�ͻ�����ά����������',
  RPT_DATE_CODE                   NCHAR(2) COMMENT '����ʱ��˵������',
  LAST_UPDATE_TIME                NVARCHAR(10) COMMENT '������ʱ��',
  OPERATOR_USER                   NVARCHAR(50) COMMENT '����Ա',
  ORG_NAME                        NVARCHAR(100) COMMENT '������Դ��������',
  ORG_CODE                        NVARCHAR(100) COMMENT '������Դ�������',
  BUSINESS_STATES                 NVARCHAR(50) COMMENT '����״̬',
  REJECT_REASON                   NVARCHAR(255) COMMENT '����ԭ��',
  IS_FILTER                       NCHAR(1) COMMENT '�Ƿ���˱�ʶ(Ĭ��ΪN-������)',
  REPORT_MESSAGE_ID               NVARCHAR(60) COMMENT '�����ļ�ID',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_INCOME_EXPENSE_BS COMMENT '650-��ҵ��λ����֧���������';

 DROP TABLE IF EXISTS E_INCOME_EXPENSE_BS_HIST;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_INCOME_EXPENSE_BS_HIST
(
  ELA_INCOME_AND_EXPENSE_STAT_ID  NCHAR(32)     NOT NULL COMMENT '650-��ҵ��λ����֧�������������',
  INF_REC_TYPE                    NCHAR(3) COMMENT '��Ϣ��¼����',
  ENT_NAME                        NVARCHAR(80) COMMENT '��ҵ����',
  ENT_CERT_TYPE                   NCHAR(2) COMMENT '��ҵ��ݱ�ʶ����',
  ENT_CERT_NUM                    NVARCHAR(40) COMMENT '��ҵ��ݱ�ʶ����',
  RPT_DATE                        NCHAR(10) COMMENT '��Ϣ��������',
  SHEET_YEAR                      NCHAR(4) COMMENT '�������',
  SHEET_TYPE                      NCHAR(2) COMMENT '��������',
  SHEET_TYPE_DIVIDE               NCHAR(1) COMMENT '��������ϸ��',
  AUDIT_FIRM_NAME                 NVARCHAR(80) COMMENT '�������������',
  AUDITOR_NAME                    NVARCHAR(30) COMMENT '�����Ա����',
  AUDIT_TIME                      NVARCHAR(10) COMMENT '���ʱ��',
  CIMOC                           NCHAR(14) COMMENT '�ͻ�����ά����������',
  RPT_DATE_CODE                   NCHAR(2) COMMENT '����ʱ��˵������',
  LAST_UPDATE_TIME                NVARCHAR(10) COMMENT '������ʱ��',
  OPERATOR_USER                   NVARCHAR(50) COMMENT '����Ա',
  ORG_NAME                        NVARCHAR(100) COMMENT '������Դ��������',
  ORG_CODE                        NVARCHAR(100) COMMENT '������Դ�������',
  BUSINESS_STATES                 NVARCHAR(50) COMMENT '����״̬',
  REJECT_REASON                   NVARCHAR(255) COMMENT '����ԭ��',
  IS_FILTER                       NCHAR(1) COMMENT '�Ƿ���˱�ʶ(Ĭ��ΪN-������)',
  REPORT_MESSAGE_ID               NVARCHAR(60) COMMENT '�����ļ�ID',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_INCOME_EXPENSE_BS_HIST COMMENT '650-��ҵ��λ����֧���������';

 DROP TABLE IF EXISTS E_INCOME_EXPENSE_BS_MIDDLE;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_INCOME_EXPENSE_BS_MIDDLE
(
  ENT_CERT_TYPE  NVARCHAR(36)                  NOT NULL COMMENT '��ҵ��ݱ�ʶ����',
  ENT_CERT_NUM   NVARCHAR(60)                  NOT NULL COMMENT '��ҵ��ݱ�ʶ����',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1        NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2        NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3        NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_INCOME_EXPENSE_BS_MIDDLE COMMENT '650-��ҵ��λ����֧���������м��';

 DROP TABLE IF EXISTS E_INCOME_EXPENSE_HIST;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_INCOME_EXPENSE_HIST
(
  ELB_INCOME_AND_EXPENSE_STAT_ID  NCHAR(32)     NOT NULL COMMENT '650-��ҵ��λ����֧������ҵ��λ����֧���������',
  CURRENT_FINANCIAL_SUBSIDY_CARR  DECIMAL(17,2) COMMENT '���ڲ���������ת����',
  FINANCIAL_SUBSIDY_REVENUE       DECIMAL(17,2) COMMENT '������������',
  UNDERTAKINGS_EXPENDITURE_FINAN  DECIMAL(17,2) COMMENT '��ҵ֧������������֧����',
  CURRENT_UNDERTAKINGS_CARRIED_O  DECIMAL(17,2) COMMENT '������ҵ��ת����',
  UNDERTAKINGS_CLASS_REVENUE      DECIMAL(17,2) COMMENT '��ҵ������',
  UNDERTAKINGS_REVENUE            DECIMAL(17,2) COMMENT '��ҵ����',
  SUPERIOR_SUBSIDY_REVENUE        DECIMAL(17,2) COMMENT '�ϼ���������',
  REVENUE_TURNED_OVER_BY_SUBSIDI  DECIMAL(17,2) COMMENT '������λ�Ͻ�����',
  OTHER_REVENUE                   DECIMAL(17,2) COMMENT '��������',
  DONATION_INCOME                 DECIMAL(17,2) COMMENT '�����������Ŀ�£���������',
  UNDERTAKINGS_CLASS_EXPENDITURE  DECIMAL(17,2) COMMENT '��ҵ��֧��',
  UNDERTAKINGS_EXPENDITURE_NON_F  DECIMAL(17,2) COMMENT '��ҵ֧�����ǲ�������֧����',
  PAYMENT_TO_THE_HIGHER_AUTHORIT  DECIMAL(17,2) COMMENT '�Ͻ��ϼ�֧��',
  GRANT_TO_THE_AUXILIARY_ORGANIZ  DECIMAL(17,2) COMMENT '�Ը�����λ����֧��',
  OTHER_EXPENDITURE               DECIMAL(17,2) COMMENT '����֧��',
  CURRENT_OPERATING_BALANCE       DECIMAL(17,2) COMMENT '���ھ�Ӫ����',
  OPERATING_REVENUE               DECIMAL(17,2) COMMENT '��Ӫ����',
  OPERATING_EXPENDITURE           DECIMAL(17,2) COMMENT '��Ӫ֧��',
  OPERATING_BALANCE_MADE_UP_FOR_  DECIMAL(17,2) COMMENT '�ֲ���ǰ��ȿ����ľ�Ӫ����',
  NON_FINANCIAL_SUBSIDY_CARRIED_  DECIMAL(17,2) COMMENT '����ǲ���������ת����',
  NON_FINANCIAL_AID_CARRIED_OVER  DECIMAL(17,2) COMMENT '�ǲ���������ת',
  NON_FINANCIAL_AID_BALANCE_THIS  DECIMAL(17,2) COMMENT '����ǲ�����������',
  ENTERPRISEINCOME_TAX_PAYABLE    DECIMAL(17,2) COMMENT 'Ӧ����ҵ����˰',
  SPECIAL_FUNDS_TO_EXTRACT        DECIMAL(17,2) COMMENT '��ȡר�û���',
  PUBLIC_FUND_TURNED_INTO         DECIMAL(17,2) COMMENT 'ת����ҵ����',
  ELA_INCOME_AND_EXPENSE_STAT_ID  NCHAR(32)     NOT NULL COMMENT '�������',
  RPT_DATE                        NCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_INCOME_EXPENSE_HIST COMMENT '650-��ҵ��λ����֧������ҵ��λ����֧�����';

 DROP TABLE IF EXISTS E_INCOME_STATEMENT;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_INCOME_STATEMENT
(
  EIA_INCOME_STATEMENT_PROFIT_ID  NCHAR(32)     NOT NULL COMMENT '620-��ҵ���������������������',
  INF_REC_TYPE                    NCHAR(3) COMMENT '��Ϣ��¼����',
  ENT_NAME                        NVARCHAR(80) COMMENT '��ҵ����',
  ENT_CERT_TYPE                   NCHAR(2) COMMENT '��ҵ��ݱ�ʶ����',
  ENT_CERT_NUM                    NVARCHAR(40) COMMENT '��ҵ��ݱ�ʶ����',
  RPT_DATE                        NCHAR(10) COMMENT '��Ϣ��������',
  SHEET_YEAR                      NCHAR(4) COMMENT '�������',
  SHEET_TYPE                      NCHAR(2) COMMENT '��������',
  SHEET_TYPE_DIVIDE               NCHAR(1) COMMENT '��������ϸ��',
  AUDIT_FIRM_NAME                 NVARCHAR(80) COMMENT '�������������',
  AUDITOR_NAME                    NVARCHAR(30) COMMENT '�����Ա����',
  AUDIT_TIME                      NVARCHAR(10) COMMENT '���ʱ��',
  CIMOC                           NCHAR(14) COMMENT '�ͻ�����ά����������',
  RPT_DATE_CODE                   NCHAR(2) COMMENT '����ʱ��˵������',
  LAST_UPDATE_TIME                NVARCHAR(10) COMMENT '������ʱ��',
  OPERATOR_USER                   NVARCHAR(50) COMMENT '����Ա',
  ORG_NAME                        NVARCHAR(100) COMMENT '������Դ��������',
  ORG_CODE                        NVARCHAR(100) COMMENT '������Դ�������',
  BUSINESS_STATES                 NVARCHAR(50) COMMENT '����״̬',
  REJECT_REASON                   NVARCHAR(255) COMMENT '����ԭ��',
  IS_FILTER                       NCHAR(1) COMMENT '�Ƿ���˱�ʶ(Ĭ��ΪN-������)',
  REPORT_MESSAGE_ID               NVARCHAR(60) COMMENT '�����ļ�ID',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_INCOME_STATEMENT COMMENT '620-��ҵ�����������������';

 DROP TABLE IF EXISTS E_INCOME_STATEMENT_02;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_INCOME_STATEMENT_02
(
  EIB_INCOME_STATEMENT_PROFIT_ID  NCHAR(32)     NOT NULL COMMENT '620-��ҵ������������02�����������������',
  MAIN_REVENUEF_REVENUE           DECIMAL(17,2) COMMENT '��Ӫҵ������',
  SALES_INCOME_OF_EXPORT_GOODS_P  DECIMAL(17,2) COMMENT '����Ӫҵ�������Ŀ�£����ڲ�Ʒ��������',
  SALES_INCOME_OF_IMPORT_GOODS_P  DECIMAL(17,2) COMMENT '����Ӫҵ�������Ŀ�£����ڲ�Ʒ��������',
  DISCOUNT_AND_ALLOWANCE          DECIMAL(17,2) COMMENT '�����ۿ�������',
  NET_AMOUNT_OF_INCOME_FROM_MAIN  DECIMAL(17,2) COMMENT '��Ӫҵ�����뾻��',
  MAIN_OPERATING_COST             DECIMAL(17,2) COMMENT '��Ӫҵ��ɱ�',
  SALES_INCOME_OF_EXPORT_PRODUCT  DECIMAL(17,2) COMMENT '����Ӫҵ��ɱ���Ŀ�£����ڲ�Ʒ���۳ɱ�',
  PRINCIPLE_BUSINESS_TAX_AND_EXT  DECIMAL(17,2) COMMENT '��Ӫҵ��˰�𼰸���',
  OPERATION_EXPENSE               DECIMAL(17,2) COMMENT '��Ӫ����',
  OTHERS_OPERATING_COST           DECIMAL(17,2) COMMENT '������ҵ��ɱ���',
  DEFERRED_INCOME                 DECIMAL(17,2) COMMENT '��������',
  INCOME_FROM_SALES_AGENCY        DECIMAL(17,2) COMMENT '������������',
  OTHER_OPERATING_INCOME          DECIMAL(17,2) COMMENT '���������룩',
  PRINCIPLE_BUSINESS_PROFIT       DECIMAL(17,2) COMMENT '��Ӫҵ������',
  OTHER_BUSINESS_PROFIT           DECIMAL(17,2) COMMENT '����ҵ������',
  SELLING_EXPENSES                DECIMAL(17,2) COMMENT 'Ӫҵ����',
  GENERAL_AND_ADMINISTRATIVE_EXP  DECIMAL(17,2) COMMENT '�������',
  FINANCIAL_EXPENSES              DECIMAL(17,2) COMMENT '�������',
  OTHERS_EXPENSES                 DECIMAL(17,2) COMMENT '���������ã�',
  OPERATING_PROFITS               DECIMAL(17,2) COMMENT 'Ӫҵ����',
  INVESTMENT_INCOME               DECIMAL(17,2) COMMENT 'Ͷ������',
  FUTURES_INCOME                  DECIMAL(17,2) COMMENT '�ڻ�����',
  ALLOWANCE_INCOME                DECIMAL(17,2) COMMENT '��������',
  ALLOWANCE_INCOME_BEFORE_ALLOWA  DECIMAL(17,2) COMMENT '�����������Ŀ�£�����ǰ�������ҵ��������',
  NON_OPERATING_INCOME            DECIMAL(17,2) COMMENT 'Ӫҵ������',
  NET_GAIN_ON_DISPOSAL_OF_FIXED   DECIMAL(17,2) COMMENT '��Ӫҵ�������Ŀ�£����ù̶��ʲ�������',
  INCOME_FROM_NON_CURRENCY_TRADE  DECIMAL(17,2) COMMENT '��Ӫҵ�������Ŀ�£��ǻ����Խ�������',
  INCOME_FROM_SALES_OF_INTANGIBL  DECIMAL(17,2) COMMENT '��Ӫҵ�������Ŀ�£����������ʲ�����',
  INCOME_FROM_PENALTY             DECIMAL(17,2) COMMENT '��Ӫҵ�������Ŀ�£��������',
  OTHERS_INCOME                   DECIMAL(17,2) COMMENT '����������',
  CALCULATING_FROM_THE_CONTENT_S  DECIMAL(17,2) COMMENT '��������Ŀ�£�����ǰ��Ⱥ������ʽ����ֲ�����',
  NON_OPERATING_EXPENSES          DECIMAL(17,2) COMMENT 'Ӫҵ��֧��',
  LOSS_FROM_DISPOSAL_OF_FIXED_AS  DECIMAL(17,2) COMMENT '��Ӫҵ��֧����Ŀ�£����ù̶��ʲ�����ʧ',
  EXCHANGE_OF_NON_MONETARY_ASSET  DECIMAL(17,2) COMMENT '��Ӫҵ��֧����Ŀ�£�ծ��������ʧ',
  LOSS_OF_LAWSUITS                DECIMAL(17,2) COMMENT '��Ӫҵ��֧����Ŀ�£�����֧��',
  PAYMENT_FOR_DONATION            DECIMAL(17,2) COMMENT '��Ӫҵ��֧����Ŀ�£�����֧��',
  OTHER_PAYMENTS                  DECIMAL(17,2) COMMENT '����֧��',
  BALANCE_OF_CONTENT_SALARY       DECIMAL(17,2) COMMENT '������֧������ת�ĺ������ʰ��ɽ���',
  TOTAL_PROFIT                    DECIMAL(17,2) COMMENT '�����ܶ�',
  INCOMETAX                       DECIMAL(17,2) COMMENT '����˰',
  IMPARIMENT_LOSS                 DECIMAL(17,2) COMMENT '�����ɶ�����',
  UNREALIZEDINVESTMENT_LOSSES     DECIMAL(17,2) COMMENT 'δȷ�ϵ�Ͷ����ʧ',
  NET_PROFIT                      DECIMAL(17,2) COMMENT '������',
  PROFIT_DISTRIBUTION_AT_BEGINNI  DECIMAL(17,2) COMMENT '���δ��������',
  COMPENSATION_OF_SURPLUS_RESERV  DECIMAL(17,2) COMMENT 'ӯ�๫������',
  OTHER_ADJUSTMENT_FACTORS        DECIMAL(17,2) COMMENT '������������',
  PROFIT_AVAILABLE_FOR_DISTRIBUT  DECIMAL(17,2) COMMENT '�ɹ����������',
  PROFIT_RESERVED_FOR_A_SINGLEIT  DECIMAL(17,2) COMMENT '�������õ�����',
  SUPPLEMENTARY_CURRENT_CAPITAL   DECIMAL(17,2) COMMENT '���������ʱ�',
  APPROPRIATION_OF_STATUTORY_SUR  DECIMAL(17,2) COMMENT '��ȡ����ӯ�๫��',
  APPROPRIATION_OF_STATUTORY_WEL  DECIMAL(17,2) COMMENT '��ȡ���������',
  APPROPRIATION_OF_STAFFINCENTIV  DECIMAL(17,2) COMMENT '��ȡְ����������������',
  APPROPRIATION_OF_RESERVE_FUND   DECIMAL(17,2) COMMENT '��ȡ��������',
  APPROPRIATION_OF_ENTERPRISE_EX  DECIMAL(17,2) COMMENT '��ȡ��ҵ��չ����',
  PROFITS_CAPITALIZAD_ON_RETURN   DECIMAL(17,2) COMMENT '����黹Ͷ��',
  OTHERS                          DECIMAL(17,2) COMMENT '���ɹ�����������Ŀ�£�����',
  PROFIT_AVAILABLE_FOR_OWNERS_DI  DECIMAL(17,2) COMMENT '�ɹ�Ͷ���߷��������',
  PREFERRED_STOCK_DIVIDENDS_PAYA  DECIMAL(17,2) COMMENT 'Ӧ�����ȹɹ���',
  WITHDRAWAL_OTHER_COMMON_ACCUMU  DECIMAL(17,2) COMMENT '��ȡ����ӯ�๫��',
  PAYABLE_DIVIDENDS_OF_COMMON_ST  DECIMAL(17,2) COMMENT 'Ӧ����ͨ�ɹ���',
  TRANSFER_FROM_ORDINARY_SHARES   DECIMAL(17,2) COMMENT 'ת���ʱ�����ͨ�ɹ���',
  OTHERS_FOR_OWNERS               DECIMAL(17,2) COMMENT '���ɹ�Ͷ���߷���������Ŀ�£�����',
  UNAPPROPRIATED_PROFIT           DECIMAL(17,2) COMMENT 'δ��������',
  LOSS_COMPENSATED_BEFORE_THE_TA  DECIMAL(17,2) COMMENT '��δ���������Ŀ�£�Ӧ���Ժ����˰ǰ�����ֲ��Ŀ���',
  EIA_INCOME_STATEMENT_PROFIT_ID  NCHAR(32)     NOT NULL COMMENT '�������',
  RPT_DATE                        NCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_INCOME_STATEMENT_02 COMMENT '620-��ҵ������������02�������������';

 DROP TABLE IF EXISTS E_INCOME_STATEMENT_02_HIST;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_INCOME_STATEMENT_02_HIST
(
  EIB_INCOME_STATEMENT_PROFIT_ID  NCHAR(32)     NOT NULL COMMENT '620-��ҵ������������02�����������������',
  MAIN_REVENUEF_REVENUE           DECIMAL(17,2) COMMENT '��Ӫҵ������',
  SALES_INCOME_OF_EXPORT_GOODS_P  DECIMAL(17,2) COMMENT '����Ӫҵ�������Ŀ�£����ڲ�Ʒ��������',
  SALES_INCOME_OF_IMPORT_GOODS_P  DECIMAL(17,2) COMMENT '����Ӫҵ�������Ŀ�£����ڲ�Ʒ��������',
  DISCOUNT_AND_ALLOWANCE          DECIMAL(17,2) COMMENT '�����ۿ�������',
  NET_AMOUNT_OF_INCOME_FROM_MAIN  DECIMAL(17,2) COMMENT '��Ӫҵ�����뾻��',
  MAIN_OPERATING_COST             DECIMAL(17,2) COMMENT '��Ӫҵ��ɱ�',
  SALES_INCOME_OF_EXPORT_PRODUCT  DECIMAL(17,2) COMMENT '����Ӫҵ��ɱ���Ŀ�£����ڲ�Ʒ���۳ɱ�',
  PRINCIPLE_BUSINESS_TAX_AND_EXT  DECIMAL(17,2) COMMENT '��Ӫҵ��˰�𼰸���',
  OPERATION_EXPENSE               DECIMAL(17,2) COMMENT '��Ӫ����',
  OTHERS_OPERATING_COST           DECIMAL(17,2) COMMENT '������ҵ��ɱ���',
  DEFERRED_INCOME                 DECIMAL(17,2) COMMENT '��������',
  INCOME_FROM_SALES_AGENCY        DECIMAL(17,2) COMMENT '������������',
  OTHER_OPERATING_INCOME          DECIMAL(17,2) COMMENT '���������룩',
  PRINCIPLE_BUSINESS_PROFIT       DECIMAL(17,2) COMMENT '��Ӫҵ������',
  OTHER_BUSINESS_PROFIT           DECIMAL(17,2) COMMENT '����ҵ������',
  SELLING_EXPENSES                DECIMAL(17,2) COMMENT 'Ӫҵ����',
  GENERAL_AND_ADMINISTRATIVE_EXP  DECIMAL(17,2) COMMENT '�������',
  FINANCIAL_EXPENSES              DECIMAL(17,2) COMMENT '�������',
  OTHERS_EXPENSES                 DECIMAL(17,2) COMMENT '���������ã�',
  OPERATING_PROFITS               DECIMAL(17,2) COMMENT 'Ӫҵ����',
  INVESTMENT_INCOME               DECIMAL(17,2) COMMENT 'Ͷ������',
  FUTURES_INCOME                  DECIMAL(17,2) COMMENT '�ڻ�����',
  ALLOWANCE_INCOME                DECIMAL(17,2) COMMENT '��������',
  ALLOWANCE_INCOME_BEFORE_ALLOWA  DECIMAL(17,2) COMMENT '�����������Ŀ�£�����ǰ�������ҵ��������',
  NON_OPERATING_INCOME            DECIMAL(17,2) COMMENT 'Ӫҵ������',
  NET_GAIN_ON_DISPOSAL_OF_FIXED   DECIMAL(17,2) COMMENT '��Ӫҵ�������Ŀ�£����ù̶��ʲ�������',
  INCOME_FROM_NON_CURRENCY_TRADE  DECIMAL(17,2) COMMENT '��Ӫҵ�������Ŀ�£��ǻ����Խ�������',
  INCOME_FROM_SALES_OF_INTANGIBL  DECIMAL(17,2) COMMENT '��Ӫҵ�������Ŀ�£����������ʲ�����',
  INCOME_FROM_PENALTY             DECIMAL(17,2) COMMENT '��Ӫҵ�������Ŀ�£��������',
  OTHERS_INCOME                   DECIMAL(17,2) COMMENT '����������',
  CALCULATING_FROM_THE_CONTENT_S  DECIMAL(17,2) COMMENT '��������Ŀ�£�����ǰ��Ⱥ������ʽ����ֲ�����',
  NON_OPERATING_EXPENSES          DECIMAL(17,2) COMMENT 'Ӫҵ��֧��',
  LOSS_FROM_DISPOSAL_OF_FIXED_AS  DECIMAL(17,2) COMMENT '��Ӫҵ��֧����Ŀ�£����ù̶��ʲ�����ʧ',
  EXCHANGE_OF_NON_MONETARY_ASSET  DECIMAL(17,2) COMMENT '��Ӫҵ��֧����Ŀ�£�ծ��������ʧ',
  LOSS_OF_LAWSUITS                DECIMAL(17,2) COMMENT '��Ӫҵ��֧����Ŀ�£�����֧��',
  PAYMENT_FOR_DONATION            DECIMAL(17,2) COMMENT '��Ӫҵ��֧����Ŀ�£�����֧��',
  OTHER_PAYMENTS                  DECIMAL(17,2) COMMENT '����֧��',
  BALANCE_OF_CONTENT_SALARY       DECIMAL(17,2) COMMENT '������֧������ת�ĺ������ʰ��ɽ���',
  TOTAL_PROFIT                    DECIMAL(17,2) COMMENT '�����ܶ�',
  INCOMETAX                       DECIMAL(17,2) COMMENT '����˰',
  IMPARIMENT_LOSS                 DECIMAL(17,2) COMMENT '�����ɶ�����',
  UNREALIZEDINVESTMENT_LOSSES     DECIMAL(17,2) COMMENT 'δȷ�ϵ�Ͷ����ʧ',
  NET_PROFIT                      DECIMAL(17,2) COMMENT '������',
  PROFIT_DISTRIBUTION_AT_BEGINNI  DECIMAL(17,2) COMMENT '���δ��������',
  COMPENSATION_OF_SURPLUS_RESERV  DECIMAL(17,2) COMMENT 'ӯ�๫������',
  OTHER_ADJUSTMENT_FACTORS        DECIMAL(17,2) COMMENT '������������',
  PROFIT_AVAILABLE_FOR_DISTRIBUT  DECIMAL(17,2) COMMENT '�ɹ����������',
  PROFIT_RESERVED_FOR_A_SINGLEIT  DECIMAL(17,2) COMMENT '�������õ�����',
  SUPPLEMENTARY_CURRENT_CAPITAL   DECIMAL(17,2) COMMENT '���������ʱ�',
  APPROPRIATION_OF_STATUTORY_SUR  DECIMAL(17,2) COMMENT '��ȡ����ӯ�๫��',
  APPROPRIATION_OF_STATUTORY_WEL  DECIMAL(17,2) COMMENT '��ȡ���������',
  APPROPRIATION_OF_STAFFINCENTIV  DECIMAL(17,2) COMMENT '��ȡְ����������������',
  APPROPRIATION_OF_RESERVE_FUND   DECIMAL(17,2) COMMENT '��ȡ��������',
  APPROPRIATION_OF_ENTERPRISE_EX  DECIMAL(17,2) COMMENT '��ȡ��ҵ��չ����',
  PROFITS_CAPITALIZAD_ON_RETURN   DECIMAL(17,2) COMMENT '����黹Ͷ��',
  OTHERS                          DECIMAL(17,2) COMMENT '���ɹ�����������Ŀ�£�����',
  PROFIT_AVAILABLE_FOR_OWNERS_DI  DECIMAL(17,2) COMMENT '�ɹ�Ͷ���߷��������',
  PREFERRED_STOCK_DIVIDENDS_PAYA  DECIMAL(17,2) COMMENT 'Ӧ�����ȹɹ���',
  WITHDRAWAL_OTHER_COMMON_ACCUMU  DECIMAL(17,2) COMMENT '��ȡ����ӯ�๫��',
  PAYABLE_DIVIDENDS_OF_COMMON_ST  DECIMAL(17,2) COMMENT 'Ӧ����ͨ�ɹ���',
  TRANSFER_FROM_ORDINARY_SHARES   DECIMAL(17,2) COMMENT 'ת���ʱ�����ͨ�ɹ���',
  OTHERS_FOR_OWNERS               DECIMAL(17,2) COMMENT '���ɹ�Ͷ���߷���������Ŀ�£�����',
  UNAPPROPRIATED_PROFIT           DECIMAL(17,2) COMMENT 'δ��������',
  LOSS_COMPENSATED_BEFORE_THE_TA  DECIMAL(17,2) COMMENT '��δ���������Ŀ�£�Ӧ���Ժ����˰ǰ�����ֲ��Ŀ���',
  EIA_INCOME_STATEMENT_PROFIT_ID  NCHAR(32)     NOT NULL COMMENT '�������',
  RPT_DATE                        NCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_INCOME_STATEMENT_02_HIST COMMENT '620-��ҵ������������02�������������';

 DROP TABLE IF EXISTS E_INCOME_STATEMENT_07;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_INCOME_STATEMENT_07
(
  EIC_INCOME_STATEMENT_PROFIT_ID  NCHAR(32)     NOT NULL COMMENT '620-��ҵ������������07�����������������',
  REVENUE_OF_SALES                DECIMAL(17,2) COMMENT 'Ӫҵ����',
  COST_OF_SALES                   DECIMAL(17,2) COMMENT 'Ӫҵ�ɱ�',
  BUSINESS_AND_OTHER_TAXES        DECIMAL(17,2) COMMENT 'Ӫҵ˰�𼰸���',
  SELLING_EXPENSES                DECIMAL(17,2) COMMENT '���۷���',
  GENERAL_AND_ADMINISTRATIVE_EXP  DECIMAL(17,2) COMMENT '�������',
  FINANCIAL_EXPENSE               DECIMAL(17,2) COMMENT '�������',
  IMPAIRMENT_LOSS_OF_ASSETS       DECIMAL(17,2) COMMENT '�ʲ���ֵ��ʧ',
  PROFIT_OR_LOSS_ARISING_FROM_CH  DECIMAL(17,2) COMMENT '���ʼ�ֵ�䶯������',
  INVESTMENT_INCOME               DECIMAL(17,2) COMMENT 'Ͷ�ʾ�����',
  INVESTMENT_INCOME_FROM_AFFILIA  DECIMAL(17,2) COMMENT '����Ӫ��ҵ�ͺ�Ӫ��ҵ��Ͷ������',
  OPERATING_PROFITS               DECIMAL(17,2) COMMENT 'Ӫҵ����',
  NON_OPERATING_INCOME            DECIMAL(17,2) COMMENT 'Ӫҵ������',
  NON_OPERATING_EXPENSES          DECIMAL(17,2) COMMENT 'Ӫҵ��֧��',
  NON_CURRENTASSETS               DECIMAL(17,2) COMMENT '�������ʲ���ʧ�����У��������ʲ�������ʧ��',
  PROFIT_BEFORE_TAX               DECIMAL(17,2) COMMENT '�����ܶ�',
  INCOME_TAX_EXPENSE              DECIMAL(17,2) COMMENT '����˰����',
  NET_PROFIT                      DECIMAL(17,2) COMMENT '������',
  BASICEARNINGS_PER_SHARE         DECIMAL(17,2) COMMENT '����ÿ������',
  DILUTED_EARNINGS_PER_SHARE      DECIMAL(17,2) COMMENT 'ϡ��ÿ������',
  EIA_INCOME_STATEMENT_PROFIT_ID  NCHAR(32)     NOT NULL COMMENT '�������',
  RPT_DATE                        NCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_INCOME_STATEMENT_07 COMMENT '620-��ҵ������������07�������������';

 DROP TABLE IF EXISTS E_INCOME_STATEMENT_07_HIST;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_INCOME_STATEMENT_07_HIST
(
  EIC_INCOME_STATEMENT_PROFIT_ID  NCHAR(32)     NOT NULL COMMENT '620-��ҵ������������07�����������������',
  REVENUE_OF_SALES                DECIMAL(17,2) COMMENT 'Ӫҵ����',
  COST_OF_SALES                   DECIMAL(17,2) COMMENT 'Ӫҵ�ɱ�',
  BUSINESS_AND_OTHER_TAXES        DECIMAL(17,2) COMMENT 'Ӫҵ˰�𼰸���',
  SELLING_EXPENSES                DECIMAL(17,2) COMMENT '���۷���',
  GENERAL_AND_ADMINISTRATIVE_EXP  DECIMAL(17,2) COMMENT '�������',
  FINANCIAL_EXPENSE               DECIMAL(17,2) COMMENT '�������',
  IMPAIRMENT_LOSS_OF_ASSETS       DECIMAL(17,2) COMMENT '�ʲ���ֵ��ʧ',
  PROFIT_OR_LOSS_ARISING_FROM_CH  DECIMAL(17,2) COMMENT '���ʼ�ֵ�䶯������',
  INVESTMENT_INCOME               DECIMAL(17,2) COMMENT 'Ͷ�ʾ�����',
  INVESTMENT_INCOME_FROM_AFFILIA  DECIMAL(17,2) COMMENT '����Ӫ��ҵ�ͺ�Ӫ��ҵ��Ͷ������',
  OPERATING_PROFITS               DECIMAL(17,2) COMMENT 'Ӫҵ����',
  NON_OPERATING_INCOME            DECIMAL(17,2) COMMENT 'Ӫҵ������',
  NON_OPERATING_EXPENSES          DECIMAL(17,2) COMMENT 'Ӫҵ��֧��',
  NON_CURRENTASSETS               DECIMAL(17,2) COMMENT '�������ʲ���ʧ�����У��������ʲ�������ʧ��',
  PROFIT_BEFORE_TAX               DECIMAL(17,2) COMMENT '�����ܶ�',
  INCOME_TAX_EXPENSE              DECIMAL(17,2) COMMENT '����˰����',
  NET_PROFIT                      DECIMAL(17,2) COMMENT '������',
  BASICEARNINGS_PER_SHARE         DECIMAL(17,2) COMMENT '����ÿ������',
  DILUTED_EARNINGS_PER_SHARE      DECIMAL(17,2) COMMENT 'ϡ��ÿ������',
  EIA_INCOME_STATEMENT_PROFIT_ID  NCHAR(32)     NOT NULL COMMENT '�������',
  RPT_DATE                        NCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_INCOME_STATEMENT_07_HIST COMMENT '620-��ҵ������������07�������������';

 DROP TABLE IF EXISTS E_INCOME_STATEMENT_HIST;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_INCOME_STATEMENT_HIST
(
  EIA_INCOME_STATEMENT_PROFIT_ID  NCHAR(32)     NOT NULL COMMENT '620-��ҵ���������������������',
  INF_REC_TYPE                    NCHAR(3) COMMENT '��Ϣ��¼����',
  ENT_NAME                        NVARCHAR(80) COMMENT '��ҵ����',
  ENT_CERT_TYPE                   NCHAR(2) COMMENT '��ҵ��ݱ�ʶ����',
  ENT_CERT_NUM                    NVARCHAR(40) COMMENT '��ҵ��ݱ�ʶ����',
  RPT_DATE                        NCHAR(10) COMMENT '��Ϣ��������',
  SHEET_YEAR                      NCHAR(4) COMMENT '�������',
  SHEET_TYPE                      NCHAR(2) COMMENT '��������',
  SHEET_TYPE_DIVIDE               NCHAR(1) COMMENT '��������ϸ��',
  AUDIT_FIRM_NAME                 NVARCHAR(80) COMMENT '�������������',
  AUDITOR_NAME                    NVARCHAR(30) COMMENT '�����Ա����',
  AUDIT_TIME                      NVARCHAR(10) COMMENT '���ʱ��',
  CIMOC                           NCHAR(14) COMMENT '�ͻ�����ά����������',
  RPT_DATE_CODE                   NCHAR(2) COMMENT '����ʱ��˵������',
  LAST_UPDATE_TIME                NVARCHAR(10) COMMENT '������ʱ��',
  OPERATOR_USER                   NVARCHAR(50) COMMENT '����Ա',
  ORG_NAME                        NVARCHAR(100) COMMENT '������Դ��������',
  ORG_CODE                        NVARCHAR(100) COMMENT '������Դ�������',
  BUSINESS_STATES                 NVARCHAR(50) COMMENT '����״̬',
  REJECT_REASON                   NVARCHAR(255) COMMENT '����ԭ��',
  IS_FILTER                       NCHAR(1) COMMENT '�Ƿ���˱�ʶ(Ĭ��ΪN-������)',
  REPORT_MESSAGE_ID               NVARCHAR(60) COMMENT '�����ļ�ID',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_INCOME_STATEMENT_HIST COMMENT '620-��ҵ�����������������';

 DROP TABLE IF EXISTS E_INCOME_STATEMENT_MIDDLE;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_INCOME_STATEMENT_MIDDLE
(
  ENT_CERT_TYPE  NVARCHAR(36)                  NOT NULL COMMENT '��ҵ��ݱ�ʶ����',
  ENT_CERT_NUM   NVARCHAR(60)                  NOT NULL COMMENT '��ҵ��ݱ�ʶ����',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1        NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2        NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3        NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_INCOME_STATEMENT_MIDDLE COMMENT '620-��ҵ������������������м��';

 DROP TABLE IF EXISTS E_INSTITU_BALANCE;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_INSTITU_BALANCE
(
  EKB_INSTITUTION_BALANCE_SHT_ID  NCHAR(32)     NOT NULL COMMENT '640-��ҵ��λ�ʲ���ծ����ҵ��λ�ʲ���ծ�������',
  CURRENCY_FUNDS                  DECIMAL(17,2) COMMENT '�����ʽ�',
  SHORT_TERM_INVESTMENTS          DECIMAL(17,2) COMMENT '����Ͷ��',
  AMOUNT_OF_FINANCIAL_RETURN      DECIMAL(17,2) COMMENT '����Ӧ�������',
  NOTES_RECEIVABLE                DECIMAL(17,2) COMMENT 'Ӧ��Ʊ��',
  ACCOUNTS_RECEIVABLE             DECIMAL(17,2) COMMENT 'Ӧ���˿�',
  PREPAYMENTS                     DECIMAL(17,2) COMMENT 'Ԥ���˿�',
  OTHER_RECEIVABLES               DECIMAL(17,2) COMMENT '����Ӧ�տ�',
  INVENTORIES                     DECIMAL(17,2) COMMENT '���',
  OTHER_CURRENT_ASSETS            DECIMAL(17,2) COMMENT '���������ʲ�',
  TOTAL_CURRENT_ASSETS            DECIMAL(17,2) COMMENT '�����ʲ��ϼ�',
  LONG_TERM_INVESTMENT            DECIMAL(17,2) COMMENT '����Ͷ��',
  FIXED_ASSETS                    DECIMAL(17,2) COMMENT '�̶��ʲ�',
  ORIGINAL_COST_OF_FIXED_ASSET    DECIMAL(17,2) COMMENT '�̶��ʲ�ԭ��',
  FIXED_ASSET_ACCUMULATED_DEPREC  DECIMAL(17,2) COMMENT '�ۼ��۾�',
  CONSTRUCTION_IN_PROCESS         DECIMAL(17,2) COMMENT '�ڽ�����',
  INTANGIBLE_ASSETS               DECIMAL(17,2) COMMENT '�����ʲ�',
  ORIGINAL_PRICE_OF_INTANGIBLE_A  DECIMAL(17,2) COMMENT '�����ʲ�ԭ��',
  ACCUMULATED_AMORTIZATION        DECIMAL(17,2) COMMENT '�ۼ�̯��',
  ASSETS_TO_BE_PROCESSED_PENDING  DECIMAL(17,2) COMMENT '�������ʲ�����',
  TOTAL_NON_CURRENT_ASSETS        DECIMAL(17,2) COMMENT '�������ʲ��ϼ�',
  TOTAL_ASSETS                    DECIMAL(17,2) COMMENT '�ʲ��ܼ�',
  SHORT_TERM_BORROWINGS           DECIMAL(17,2) COMMENT '���ڽ��',
  TAX_PAYABLE                     DECIMAL(17,2) COMMENT 'Ӧ��˰��',
  TREASURY_PAYABLE                DECIMAL(17,2) COMMENT 'Ӧ�ɹ����',
  PAYABLE_FINANCIAL_SPECIAL_ACCO  DECIMAL(17,2) COMMENT 'Ӧ�ɲ���ר����',
  EMPLOYEE_BENEFITS_PAYABLE       DECIMAL(17,2) COMMENT 'Ӧ��ְ��н��',
  NOTES_PAYABLE                   DECIMAL(17,2) COMMENT 'Ӧ��Ʊ��',
  ACCOUNTS_PAYABLE                DECIMAL(17,2) COMMENT 'Ӧ���˿�',
  RECEIPTS_IN_ADVANCE             DECIMAL(17,2) COMMENT 'Ԥ���˿�',
  OTHER_PAYABLES                  DECIMAL(17,2) COMMENT '����Ӧ����',
  OTHER_CURRENT_LIABILITIES       DECIMAL(17,2) COMMENT '����������ծ',
  TOTAL_CURRENT_LIABILITIES       DECIMAL(17,2) COMMENT '������ծ�ϼ�',
  LONG_TERM_BORROWINGS            DECIMAL(17,2) COMMENT '���ڽ��',
  LONG_TERM_PAYABLES              DECIMAL(17,2) COMMENT '����Ӧ����',
  TOTAL_NON_CURRENT_LIABILITIES   DECIMAL(17,2) COMMENT '��������ծ�ϼ�',
  TOTAL_LIABILITIES               DECIMAL(17,2) COMMENT '��ծ�ϼ�',
  ENTERPRISE_FUND                 DECIMAL(17,2) COMMENT '��ҵ����',
  NON_CURRENT_ASSETS_FUND         DECIMAL(17,2) COMMENT '�������ʲ�����',
  SPECIAL_PURPOSE_FUNDS           DECIMAL(17,2) COMMENT 'ר�û���',
  FINANCIAL_AID_CARRIED_OVER      DECIMAL(17,2) COMMENT '����������ת',
  FINANCIAL_AID_BALANCE           DECIMAL(17,2) COMMENT '������������',
  NON_FINANCIAL_AID_CARRIED_OVER  DECIMAL(17,2) COMMENT '�ǲ���������ת',
  NON_FINANCIAL_AID_BALANCE       DECIMAL(17,2) COMMENT '�ǲ�����������',
  UNDERTAKINGS_BALANCE            DECIMAL(17,2) COMMENT '��ҵ����',
  OPERATING_BALANCE               DECIMAL(17,2) COMMENT '��Ӫ����',
  TOTAL_NET_ASSETS                DECIMAL(17,2) COMMENT '���ʲ��ϼ�',
  TOTAL_LIABILITIES_AND_NET_ASSE  DECIMAL(17,2) COMMENT '��ծ�;��ʲ��ܼ�',
  EKA_INSTITUTION_BALANCE_SHT_ID  NCHAR(32)     NOT NULL COMMENT '�������',
  RPT_DATE                        NCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_INSTITU_BALANCE COMMENT '640-��ҵ��λ�ʲ���ծ����ҵ��λ�ʲ���ծ���';

 DROP TABLE IF EXISTS E_INSTITU_BALANCE_BS;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_INSTITU_BALANCE_BS
(
  EKA_INSTITUTION_BALANCE_SHT_ID  NCHAR(32)     NOT NULL COMMENT '640-��ҵ��λ�ʲ���ծ�����������',
  INF_REC_TYPE                    NCHAR(3) COMMENT '��Ϣ��¼����',
  ENT_NAME                        NVARCHAR(80) COMMENT '��ҵ����',
  ENT_CERT_TYPE                   NCHAR(2) COMMENT '��ҵ��ݱ�ʶ����',
  ENT_CERT_NUM                    NVARCHAR(40) COMMENT '��ҵ��ݱ�ʶ����',
  RPT_DATE                        NCHAR(10) COMMENT '��Ϣ��������',
  SHEET_YEAR                      NCHAR(4) COMMENT '�������',
  SHEET_TYPE                      NCHAR(2) COMMENT '��������',
  SHEET_TYPE_DIVIDE               NCHAR(1) COMMENT '��������ϸ��',
  AUDIT_FIRM_NAME                 NVARCHAR(80) COMMENT '�������������',
  AUDITOR_NAME                    NVARCHAR(30) COMMENT '�����Ա����',
  AUDIT_TIME                      NVARCHAR(10) COMMENT '���ʱ��',
  CIMOC                           NCHAR(14) COMMENT '�ͻ�����ά����������',
  RPT_DATE_CODE                   NCHAR(2) COMMENT '����ʱ��˵������',
  LAST_UPDATE_TIME                NVARCHAR(10) COMMENT '������ʱ��',
  OPERATOR_USER                   NVARCHAR(50) COMMENT '����Ա',
  ORG_NAME                        NVARCHAR(100) COMMENT '������Դ��������',
  ORG_CODE                        NVARCHAR(100) COMMENT '������Դ�������',
  BUSINESS_STATES                 NVARCHAR(50) COMMENT '����״̬',
  REJECT_REASON                   NVARCHAR(255) COMMENT '����ԭ��',
  IS_FILTER                       NCHAR(1) COMMENT '�Ƿ���˱�ʶ(Ĭ��ΪN-������)',
  REPORT_MESSAGE_ID               NVARCHAR(60) COMMENT '�����ļ�ID',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_INSTITU_BALANCE_BS COMMENT '640-��ҵ��λ�ʲ���ծ�������';

 DROP TABLE IF EXISTS E_INSTITU_BALANCE_BS_HIST;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_INSTITU_BALANCE_BS_HIST
(
  EKA_INSTITUTION_BALANCE_SHT_ID  NCHAR(32)     NOT NULL COMMENT '640-��ҵ��λ�ʲ���ծ�����������',
  INF_REC_TYPE                    NCHAR(3) COMMENT '��Ϣ��¼����',
  ENT_NAME                        NVARCHAR(80) COMMENT '��ҵ����',
  ENT_CERT_TYPE                   NCHAR(2) COMMENT '��ҵ��ݱ�ʶ����',
  ENT_CERT_NUM                    NVARCHAR(40) COMMENT '��ҵ��ݱ�ʶ����',
  RPT_DATE                        NCHAR(10) COMMENT '��Ϣ��������',
  SHEET_YEAR                      NCHAR(4) COMMENT '�������',
  SHEET_TYPE                      NCHAR(2) COMMENT '��������',
  SHEET_TYPE_DIVIDE               NCHAR(1) COMMENT '��������ϸ��',
  AUDIT_FIRM_NAME                 NVARCHAR(80) COMMENT '�������������',
  AUDITOR_NAME                    NVARCHAR(30) COMMENT '�����Ա����',
  AUDIT_TIME                      NVARCHAR(10) COMMENT '���ʱ��',
  CIMOC                           NCHAR(14) COMMENT '�ͻ�����ά����������',
  RPT_DATE_CODE                   NCHAR(2) COMMENT '����ʱ��˵������',
  LAST_UPDATE_TIME                NVARCHAR(10) COMMENT '������ʱ��',
  OPERATOR_USER                   NVARCHAR(50) COMMENT '����Ա',
  ORG_NAME                        NVARCHAR(100) COMMENT '������Դ��������',
  ORG_CODE                        NVARCHAR(100) COMMENT '������Դ�������',
  BUSINESS_STATES                 NVARCHAR(50) COMMENT '����״̬',
  REJECT_REASON                   NVARCHAR(255) COMMENT '����ԭ��',
  IS_FILTER                       NCHAR(1) COMMENT '�Ƿ���˱�ʶ(Ĭ��ΪN-������)',
  REPORT_MESSAGE_ID               NVARCHAR(60) COMMENT '�����ļ�ID',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_INSTITU_BALANCE_BS_HIST COMMENT '640-��ҵ��λ�ʲ���ծ�������';

 DROP TABLE IF EXISTS E_INSTITU_BALANCE_BS_MIDDLE;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_INSTITU_BALANCE_BS_MIDDLE
(
  ENT_CERT_TYPE  NVARCHAR(36)                  NOT NULL COMMENT '��ҵ��ݱ�ʶ����',
  ENT_CERT_NUM   NVARCHAR(60)                  NOT NULL COMMENT '��ҵ��ݱ�ʶ����',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1        NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2        NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3        NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_INSTITU_BALANCE_BS_MIDDLE COMMENT '640-��ҵ��λ�ʲ���ծ�������м��';

 DROP TABLE IF EXISTS E_INSTITU_BALANCE_HIST;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_INSTITU_BALANCE_HIST
(
  EKB_INSTITUTION_BALANCE_SHT_ID  NCHAR(32)     NOT NULL COMMENT '640-��ҵ��λ�ʲ���ծ����ҵ��λ�ʲ���ծ�������',
  CURRENCY_FUNDS                  DECIMAL(17,2) COMMENT '�����ʽ�',
  SHORT_TERM_INVESTMENTS          DECIMAL(17,2) COMMENT '����Ͷ��',
  AMOUNT_OF_FINANCIAL_RETURN      DECIMAL(17,2) COMMENT '����Ӧ�������',
  NOTES_RECEIVABLE                DECIMAL(17,2) COMMENT 'Ӧ��Ʊ��',
  ACCOUNTS_RECEIVABLE             DECIMAL(17,2) COMMENT 'Ӧ���˿�',
  PREPAYMENTS                     DECIMAL(17,2) COMMENT 'Ԥ���˿�',
  OTHER_RECEIVABLES               DECIMAL(17,2) COMMENT '����Ӧ�տ�',
  INVENTORIES                     DECIMAL(17,2) COMMENT '���',
  OTHER_CURRENT_ASSETS            DECIMAL(17,2) COMMENT '���������ʲ�',
  TOTAL_CURRENT_ASSETS            DECIMAL(17,2) COMMENT '�����ʲ��ϼ�',
  LONG_TERM_INVESTMENT            DECIMAL(17,2) COMMENT '����Ͷ��',
  FIXED_ASSETS                    DECIMAL(17,2) COMMENT '�̶��ʲ�',
  ORIGINAL_COST_OF_FIXED_ASSET    DECIMAL(17,2) COMMENT '�̶��ʲ�ԭ��',
  FIXED_ASSET_ACCUMULATED_DEPREC  DECIMAL(17,2) COMMENT '�ۼ��۾�',
  CONSTRUCTION_IN_PROCESS         DECIMAL(17,2) COMMENT '�ڽ�����',
  INTANGIBLE_ASSETS               DECIMAL(17,2) COMMENT '�����ʲ�',
  ORIGINAL_PRICE_OF_INTANGIBLE_A  DECIMAL(17,2) COMMENT '�����ʲ�ԭ��',
  ACCUMULATED_AMORTIZATION        DECIMAL(17,2) COMMENT '�ۼ�̯��',
  ASSETS_TO_BE_PROCESSED_PENDING  DECIMAL(17,2) COMMENT '�������ʲ�����',
  TOTAL_NON_CURRENT_ASSETS        DECIMAL(17,2) COMMENT '�������ʲ��ϼ�',
  TOTAL_ASSETS                    DECIMAL(17,2) COMMENT '�ʲ��ܼ�',
  SHORT_TERM_BORROWINGS           DECIMAL(17,2) COMMENT '���ڽ��',
  TAX_PAYABLE                     DECIMAL(17,2) COMMENT 'Ӧ��˰��',
  TREASURY_PAYABLE                DECIMAL(17,2) COMMENT 'Ӧ�ɹ����',
  PAYABLE_FINANCIAL_SPECIAL_ACCO  DECIMAL(17,2) COMMENT 'Ӧ�ɲ���ר����',
  EMPLOYEE_BENEFITS_PAYABLE       DECIMAL(17,2) COMMENT 'Ӧ��ְ��н��',
  NOTES_PAYABLE                   DECIMAL(17,2) COMMENT 'Ӧ��Ʊ��',
  ACCOUNTS_PAYABLE                DECIMAL(17,2) COMMENT 'Ӧ���˿�',
  RECEIPTS_IN_ADVANCE             DECIMAL(17,2) COMMENT 'Ԥ���˿�',
  OTHER_PAYABLES                  DECIMAL(17,2) COMMENT '����Ӧ����',
  OTHER_CURRENT_LIABILITIES       DECIMAL(17,2) COMMENT '����������ծ',
  TOTAL_CURRENT_LIABILITIES       DECIMAL(17,2) COMMENT '������ծ�ϼ�',
  LONG_TERM_BORROWINGS            DECIMAL(17,2) COMMENT '���ڽ��',
  LONG_TERM_PAYABLES              DECIMAL(17,2) COMMENT '����Ӧ����',
  TOTAL_NON_CURRENT_LIABILITIES   DECIMAL(17,2) COMMENT '��������ծ�ϼ�',
  TOTAL_LIABILITIES               DECIMAL(17,2) COMMENT '��ծ�ϼ�',
  ENTERPRISE_FUND                 DECIMAL(17,2) COMMENT '��ҵ����',
  NON_CURRENT_ASSETS_FUND         DECIMAL(17,2) COMMENT '�������ʲ�����',
  SPECIAL_PURPOSE_FUNDS           DECIMAL(17,2) COMMENT 'ר�û���',
  FINANCIAL_AID_CARRIED_OVER      DECIMAL(17,2) COMMENT '����������ת',
  FINANCIAL_AID_BALANCE           DECIMAL(17,2) COMMENT '������������',
  NON_FINANCIAL_AID_CARRIED_OVER  DECIMAL(17,2) COMMENT '�ǲ���������ת',
  NON_FINANCIAL_AID_BALANCE       DECIMAL(17,2) COMMENT '�ǲ�����������',
  UNDERTAKINGS_BALANCE            DECIMAL(17,2) COMMENT '��ҵ����',
  OPERATING_BALANCE               DECIMAL(17,2) COMMENT '��Ӫ����',
  TOTAL_NET_ASSETS                DECIMAL(17,2) COMMENT '���ʲ��ϼ�',
  TOTAL_LIABILITIES_AND_NET_ASSE  DECIMAL(17,2) COMMENT '��ծ�;��ʲ��ܼ�',
  EKA_INSTITUTION_BALANCE_SHT_ID  NCHAR(32)     NOT NULL COMMENT '�������',
  RPT_DATE                        NCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_INSTITU_BALANCE_HIST COMMENT '640-��ҵ��λ�ʲ���ծ����ҵ��λ�ʲ���ծ���';

 DROP TABLE IF EXISTS E_IN_CAGS_INF;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_IN_CAGS_INF
(
  PDW_INSECACCTID_CAGSINF_ID  NCHAR(32)         NOT NULL COMMENT '����',
  INF_REC_TYPE                NVARCHAR(3) COMMENT '��Ϣ��¼����',
  ACCT_TYPE                   NVARCHAR(2) COMMENT '�˻�����',
  OD_BNES_CODE                NVARCHAR(60) COMMENT 'ԭҵ���ʶ��',
  NW_BNES_CODE                NVARCHAR(60) COMMENT '��ҵ���ʶ��',
  LAST_UPDATE_TIME            NVARCHAR(10) COMMENT '������ʱ��',
  OPERATOR_USER               NVARCHAR(50) COMMENT '����Ա',
  ORG_NAME                    NVARCHAR(100) COMMENT '������Դ��������',
  ORG_CODE                    NVARCHAR(100) COMMENT '������Դ�������',
  BUSINESS_STATES             NVARCHAR(50) COMMENT '����״̬',
  REJECT_REASON               NVARCHAR(255) COMMENT '����ԭ��',
  IS_FILTER                   NCHAR(1) COMMENT '�Ƿ���˱�ʶ(Ĭ��ΪN-������)',
  REPORT_MESSAGE_ID           NVARCHAR(60) COMMENT '�����ļ�ID',
  RPT_DATE                    NCHAR(10) COMMENT '��������',  
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  NAME                        NVARCHAR(30) COMMENT '����(��INF_REC_TYPE Ϊ211�Ǹ��ֶ�Ϊ�����������221Ϊ������������231Ϊ����������)',
  ID_TYPE                     NVARCHAR(2) COMMENT '֤������(��INF_REC_TYPE Ϊ211�Ǹ��ֶ�Ϊ�����֤�����ͣ�221Ϊ������֤�����ͣ�231Ϊ������֤������)',
  ID_NUM                      NVARCHAR(20) COMMENT '֤������(��INF_REC_TYPE Ϊ211�Ǹ��ֶ�Ϊ�����֤�����룬221Ϊ������֤�����룬231Ϊ������֤������)'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_IN_CAGS_INF COMMENT '��ҵ��ʶ��������¼��';

 DROP TABLE IF EXISTS E_IN_CAGS_INF_HIST;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_IN_CAGS_INF_HIST
(
  PDW_INSECACCTID_CAGSINF_ID  NCHAR(32)         NOT NULL COMMENT '����',
  INF_REC_TYPE                NVARCHAR(3) COMMENT '��Ϣ��¼����',
  ACCT_TYPE                   NVARCHAR(2) COMMENT '�˻�����',
  OD_BNES_CODE                NVARCHAR(60) COMMENT 'ԭҵ���ʶ��',
  NW_BNES_CODE                NVARCHAR(60) COMMENT '��ҵ���ʶ��',
  LAST_UPDATE_TIME            NVARCHAR(10) COMMENT '������ʱ��',
  OPERATOR_USER               NVARCHAR(50) COMMENT '����Ա',
  ORG_NAME                    NVARCHAR(100) COMMENT '������Դ��������',
  ORG_CODE                    NVARCHAR(100) COMMENT '������Դ�������',
  BUSINESS_STATES             NVARCHAR(50) COMMENT '����״̬',
  REJECT_REASON               NVARCHAR(255) COMMENT '����ԭ��',
  IS_FILTER                   NCHAR(1) COMMENT '�Ƿ���˱�ʶ(Ĭ��ΪN-������)',
  REPORT_MESSAGE_ID           NVARCHAR(60) COMMENT '�����ļ�ID',
  RPT_DATE                    NCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  NAME                        NVARCHAR(30) COMMENT '����(��INF_REC_TYPE Ϊ211�Ǹ��ֶ�Ϊ�����������221Ϊ������������231Ϊ����������)',
  ID_TYPE                     NVARCHAR(2) COMMENT '֤������(��INF_REC_TYPE Ϊ211�Ǹ��ֶ�Ϊ�����֤�����ͣ�221Ϊ������֤�����ͣ�231Ϊ������֤������)',
  ID_NUM                      NVARCHAR(20) COMMENT '֤������(��INF_REC_TYPE Ϊ211�Ǹ��ֶ�Ϊ�����֤�����룬221Ϊ������֤�����룬231Ϊ������֤������)'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_IN_CAGS_INF_HIST COMMENT '��ҵ��ʶ��������¼��';

 DROP TABLE IF EXISTS E_IN_DEL;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_IN_DEL
(
  PBY_IN_ACCT_DEL_ID  NCHAR(32)                 NOT NULL COMMENT '����',
  INF_REC_TYPE        NVARCHAR(3) COMMENT '��Ϣ��¼����',
  ACCT_TYPE           NVARCHAR(2) COMMENT '�˻�����',
  DEL_REC_CODE        NVARCHAR(60) COMMENT '��ɾ��ҵ�����',
  DEL_SGMT_CODE       NVARCHAR(1) COMMENT '��ɾ���ζα�',
  DEL_START_DATE      NVARCHAR(10) COMMENT '��ɾ����ʼ����',
  DEL_END_DATE        NVARCHAR(10) COMMENT '��ɾ����������',
  LAST_UPDATE_TIME    NVARCHAR(10) COMMENT '������ʱ��',
  OPERATOR_USER       NVARCHAR(50) COMMENT '����Ա',
  ORG_NAME            NVARCHAR(100) COMMENT '������Դ��������',
  ORG_CODE            NVARCHAR(100) COMMENT '������Դ�������',
  BUSINESS_STATES     NVARCHAR(50) COMMENT '����״̬',
  REJECT_REASON       NVARCHAR(255) COMMENT '����ԭ��',
  IS_FILTER           NCHAR(1) COMMENT '�Ƿ���˱�ʶ(Ĭ��ΪN-������)',
  REPORT_MESSAGE_ID   NVARCHAR(60) COMMENT '�����ļ�ID',
  RPT_DATE            NCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  NAME                NVARCHAR(30) COMMENT '����(��INF_REC_TYPE Ϊ211�Ǹ��ֶ�Ϊ�����������221Ϊ������������231Ϊ����������)',
  ID_TYPE             NVARCHAR(2) COMMENT '֤������(��INF_REC_TYPE Ϊ211�Ǹ��ֶ�Ϊ�����֤�����ͣ�221Ϊ������֤�����ͣ�231Ϊ������֤������)',
  ID_NUM              NVARCHAR(20) COMMENT '֤������(��INF_REC_TYPE Ϊ211�Ǹ��ֶ�Ϊ�����֤�����룬221Ϊ������֤�����룬231Ϊ������֤������)'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_IN_DEL COMMENT '��ҵ����ɾ�������¼��';

 DROP TABLE IF EXISTS E_IN_DEL_HIST;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_IN_DEL_HIST
(
  PBY_IN_ACCT_DEL_ID  NCHAR(32)                 NOT NULL COMMENT '����',
  INF_REC_TYPE        NVARCHAR(3) COMMENT '��Ϣ��¼����',
  ACCT_TYPE           NVARCHAR(2) COMMENT '�˻�����',
  DEL_REC_CODE        NVARCHAR(60) COMMENT '��ɾ��ҵ�����',
  DEL_SGMT_CODE       NVARCHAR(1) COMMENT '��ɾ���ζα�',
  DEL_START_DATE      NVARCHAR(10) COMMENT '��ɾ����ʼ����',
  DEL_END_DATE        NVARCHAR(10) COMMENT '��ɾ����������',
  LAST_UPDATE_TIME    NVARCHAR(10) COMMENT '������ʱ��',
  OPERATOR_USER       NVARCHAR(50) COMMENT '����Ա',
  ORG_NAME            NVARCHAR(100) COMMENT '������Դ��������',
  ORG_CODE            NVARCHAR(100) COMMENT '������Դ�������',
  BUSINESS_STATES     NVARCHAR(50) COMMENT '����״̬',
  REJECT_REASON       NVARCHAR(255) COMMENT '����ԭ��',
  IS_FILTER           NCHAR(1) COMMENT '�Ƿ���˱�ʶ(Ĭ��ΪN-������)',
  REPORT_MESSAGE_ID   NVARCHAR(60) COMMENT '�����ļ�ID',
  RPT_DATE            NCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  NAME                NVARCHAR(30) COMMENT '����(��INF_REC_TYPE Ϊ211�Ǹ��ֶ�Ϊ�����������221Ϊ������������231Ϊ����������)',
  ID_TYPE             NVARCHAR(2) COMMENT '֤������(��INF_REC_TYPE Ϊ211�Ǹ��ֶ�Ϊ�����֤�����ͣ�221Ϊ������֤�����ͣ�231Ϊ������֤������)',
  ID_NUM              NVARCHAR(20) COMMENT '֤������(��INF_REC_TYPE Ϊ211�Ǹ��ֶ�Ϊ�����֤�����룬221Ϊ������֤�����룬231Ϊ������֤������)'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_IN_DEL_HIST COMMENT '��ҵ����ɾ�������¼��';

 DROP TABLE IF EXISTS E_IN_MDFC;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_IN_MDFC
(
  PBY_IN_MDFC_ID     NCHAR(32)                  NOT NULL COMMENT '����',
  INF_REC_TYPE       NVARCHAR(3) COMMENT '��Ϣ��¼����',
  ACCT_TYPE          NVARCHAR(2) COMMENT '�˻�����',
  UPDATE_REC_CODE    NVARCHAR(60) COMMENT '������ҵ���ʶ��',
  UPDATE_SGMT_CODE   NVARCHAR(1) COMMENT '�������ζα�',
  UPDATE_START_DATE  NVARCHAR(10) COMMENT '��������ʼ����',
  UPDATE_END_DATE    NVARCHAR(10) COMMENT '��������������',
  LAST_UPDATE_TIME   NVARCHAR(10) COMMENT '������ʱ��',
  OPERATOR_USER      NVARCHAR(50) COMMENT '����Ա',
  ORG_NAME           NVARCHAR(100) COMMENT '������Դ��������',
  ORG_CODE           NVARCHAR(100) COMMENT '������Դ�������',
  BUSINESS_STATES    NVARCHAR(50) COMMENT '����״̬',
  REJECT_REASON      NVARCHAR(255) COMMENT '����ԭ��',
  IS_FILTER          NCHAR(1) COMMENT '�Ƿ���˱�ʶ(Ĭ��ΪN-������)',
  REPORT_MESSAGE_ID  NVARCHAR(60) COMMENT '�����ļ�ID',
  RPT_DATE           NCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  NAME               NVARCHAR(30) COMMENT '����(��INF_REC_TYPE Ϊ211�Ǹ��ֶ�Ϊ�����������221Ϊ������������231Ϊ����������)',
  ID_TYPE            NVARCHAR(2) COMMENT '֤������(��INF_REC_TYPE Ϊ211�Ǹ��ֶ�Ϊ�����֤�����ͣ�221Ϊ������֤�����ͣ�231Ϊ������֤������)',
  ID_NUM             NVARCHAR(20) COMMENT '֤������(��INF_REC_TYPE Ϊ211�Ǹ��ֶ�Ϊ�����֤�����룬221Ϊ������֤�����룬231Ϊ������֤������)'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_IN_MDFC COMMENT '��ҵ���θ��������¼��';

 DROP TABLE IF EXISTS E_IN_MDFC_HIST;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_IN_MDFC_HIST
(
  PBY_IN_MDFC_ID     NCHAR(32)                  NOT NULL COMMENT '����',
  INF_REC_TYPE       NVARCHAR(3) COMMENT '��Ϣ��¼����',
  ACCT_TYPE          NVARCHAR(2) COMMENT '�˻�����',
  UPDATE_REC_CODE    NVARCHAR(60) COMMENT '������ҵ���ʶ��',
  UPDATE_SGMT_CODE   NVARCHAR(1) COMMENT '�������ζα�',
  UPDATE_START_DATE  NVARCHAR(10) COMMENT '��������ʼ����',
  UPDATE_END_DATE    NVARCHAR(10) COMMENT '��������������',
  LAST_UPDATE_TIME   NVARCHAR(10) COMMENT '������ʱ��',
  OPERATOR_USER      NVARCHAR(50) COMMENT '����Ա',
  ORG_NAME           NVARCHAR(100) COMMENT '������Դ��������',
  ORG_CODE           NVARCHAR(100) COMMENT '������Դ�������',
  BUSINESS_STATES    NVARCHAR(50) COMMENT '����״̬',
  REJECT_REASON      NVARCHAR(255) COMMENT '����ԭ��',
  IS_FILTER          NCHAR(1) COMMENT '�Ƿ���˱�ʶ(Ĭ��ΪN-������)',
  REPORT_MESSAGE_ID  NVARCHAR(60) COMMENT '�����ļ�ID',
  RPT_DATE           NCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  NAME               NVARCHAR(30) COMMENT '����(��INF_REC_TYPE Ϊ211�Ǹ��ֶ�Ϊ�����������221Ϊ������������231Ϊ����������)',
  ID_TYPE            NVARCHAR(2) COMMENT '֤������(��INF_REC_TYPE Ϊ211�Ǹ��ֶ�Ϊ�����֤�����ͣ�221Ϊ������֤�����ͣ�231Ϊ������֤������)',
  ID_NUM             NVARCHAR(20) COMMENT '֤������(��INF_REC_TYPE Ϊ211�Ǹ��ֶ�Ϊ�����֤�����룬221Ϊ������֤�����룬231Ϊ������֤������)'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_IN_MDFC_HIST COMMENT '��ҵ���θ��������¼��';

 DROP TABLE IF EXISTS E_MN_MMB_INF;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_MN_MMB_INF
(
  EAD_MN_MMB_INF_SGMT_ID  NCHAR(32)             NOT NULL COMMENT '310-��ҵ������Ϣ��Ҫ�����Ա������',
  MMB_ALIAS               NVARCHAR(30) COMMENT '��Ҫ�����Ա����',
  MMB_ID_TYPE             NVARCHAR(2) COMMENT '��Ҫ�����Ա֤������',
  MMB_ID_NUM              NVARCHAR(20) COMMENT '��Ҫ�����Ա֤������',
  MMB_PSTN                NCHAR(1) COMMENT '��Ҫ�����Աְλ',
  MN_MMB_INFO_UPDATE      NCHAR(10) COMMENT '��Ϣ��������',
  EAA_BS_SGMT_ID          NCHAR(32)             NOT NULL COMMENT '�������',
  RPT_DATE                NCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                 NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                 NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                 NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_MN_MMB_INF COMMENT '310-��ҵ������Ϣ��Ҫ�����Ա��';
-- SQLINES DEMO *** ement for index ZXBS.SYS_C00139510.
-- SQLINES DEMO *** eated when the parent object is created.
ALTER TABLE E_MN_MMB_INF ADD
  PRIMARY KEY
  (EAD_MN_MMB_INF_SGMT_ID)
 ;

 DROP TABLE IF EXISTS E_MN_MMB_INF_HIST;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_MN_MMB_INF_HIST
(
  EAD_MN_MMB_INF_SGMT_ID  NCHAR(32)             NOT NULL COMMENT '310-��ҵ������Ϣ��Ҫ�����Ա������',
  MMB_ALIAS               NVARCHAR(30) COMMENT '��Ҫ�����Ա����',
  MMB_ID_TYPE             NVARCHAR(2) COMMENT '��Ҫ�����Ա֤������',
  MMB_ID_NUM              NVARCHAR(20) COMMENT '��Ҫ�����Ա֤������',
  MMB_PSTN                NCHAR(1) COMMENT '��Ҫ�����Աְλ',
  MN_MMB_INFO_UPDATE      NCHAR(10) COMMENT '��Ϣ��������',
  EAA_BS_SGMT_ID          NCHAR(32)             NOT NULL COMMENT '�������',
  RPT_DATE                NCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                 NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                 NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                 NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_MN_MMB_INF_HIST COMMENT '310-��ҵ������Ϣ��Ҫ�����Ա��';

 DROP TABLE IF EXISTS E_MN_SHA_HOD_INF;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_MN_SHA_HOD_INF
(
  EAE_MN_SHA_HOD_INF_SGMT_ID  NCHAR(32)         NOT NULL COMMENT '310-��ҵ������Ϣע���ʱ�����Ҫ�����˶�����',
  REG_CAP_CURRENCY            NCHAR(3) COMMENT 'ע���ʱ�����',
  REG_CAP                     DECIMAL(17,2) COMMENT 'ע���ʱ�',
  SHAR_HOD_TYPE               NCHAR(2) COMMENT '����������',
  SHAR_HOD_CERT_TYPE          NCHAR(1) COMMENT '������������',
  SHAR_HOD_NAME               NVARCHAR(80) COMMENT '����������',
  SHAR_HOD_ID_TYPE            NVARCHAR(2) COMMENT '��������ݱ�ʶ����',
  SHAR_HOD_ID_NUM             NVARCHAR(40) COMMENT '��������ݱ�ʶ����',
  INV_RATIO                   DECIMAL(17,2) COMMENT '���ʱ���',
  MN_SHA_HOD_INFO_UP_DATE     NCHAR(10) COMMENT '��Ϣ��������',
  EAA_BS_SGMT_ID              NCHAR(32)         NOT NULL COMMENT '�������',
  RPT_DATE                    NCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                     NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                     NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                     NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_MN_SHA_HOD_INF COMMENT '310-��ҵ������Ϣע���ʱ�����Ҫ�����˶�';

 DROP TABLE IF EXISTS E_MN_SHA_HOD_INF_HIST;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_MN_SHA_HOD_INF_HIST
(
  EAE_MN_SHA_HOD_INF_SGMT_ID  NCHAR(32)         NOT NULL COMMENT '310-��ҵ������Ϣע���ʱ�����Ҫ�����˶�����',
  REG_CAP_CURRENCY            NCHAR(3) COMMENT 'ע���ʱ�����',
  REG_CAP                     DECIMAL(17,2) COMMENT 'ע���ʱ�',
  SHAR_HOD_TYPE               NCHAR(2) COMMENT '����������',
  SHAR_HOD_CERT_TYPE          NCHAR(1) COMMENT '������������',
  SHAR_HOD_NAME               NVARCHAR(80) COMMENT '����������',
  SHAR_HOD_ID_TYPE            NVARCHAR(2) COMMENT '��������ݱ�ʶ����',
  SHAR_HOD_ID_NUM             NVARCHAR(40) COMMENT '��������ݱ�ʶ����',
  INV_RATIO                   DECIMAL(17,2) COMMENT '���ʱ���',
  MN_SHA_HOD_INFO_UP_DATE     NCHAR(10) COMMENT '��Ϣ��������',
  EAA_BS_SGMT_ID              NCHAR(32)         NOT NULL COMMENT '�������',
  RPT_DATE                    NCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                     NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                     NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                     NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_MN_SHA_HOD_INF_HIST COMMENT '310-��ҵ������Ϣע���ʱ�����Ҫ�����˶�';

 DROP TABLE IF EXISTS E_MOTGA_CLTAL_CTRCT_INF;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_MOTGA_CLTAL_CTRCT_INF
(
  EDD_MOTGA_CLTAL_CTRCT_INF_ID  NCHAR(32)       NOT NULL COMMENT '410-��ҵ����˻����׵���Ѻ����Ϣ������',
  CCC                           NVARCHAR(60) COMMENT '��(��)Ѻ��ͬ��ʶ��',
  EDA_ACCT_BS_SGMT_ID           NCHAR(32)       NOT NULL COMMENT '�������',
  RPT_DATE                      NCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                       NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                       NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                       NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_MOTGA_CLTAL_CTRCT_INF COMMENT '410-��ҵ����˻����׵���Ѻ����Ϣ��';

 DROP TABLE IF EXISTS E_MOTGA_CLTAL_CTRCT_INF_HIST;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_MOTGA_CLTAL_CTRCT_INF_HIST
(
  EDD_MOTGA_CLTAL_CTRCT_INF_ID  NCHAR(32)       NOT NULL COMMENT '410-��ҵ����˻����׵���Ѻ����Ϣ������',
  CCC                           NVARCHAR(60) COMMENT '��(��)Ѻ��ͬ��ʶ��',
  EDA_ACCT_BS_SGMT_ID           NCHAR(32)       NOT NULL COMMENT '�������',
  RPT_DATE                      NCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                       NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                       NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                       NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_MOTGA_CLTAL_CTRCT_INF_HIST COMMENT '410-��ҵ����˻����׵���Ѻ����Ϣ��';

 DROP TABLE IF EXISTS E_ORIG_CREDITOR_INF;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_ORIG_CREDITOR_INF
(
  EDF_ORIG_CREDITOR_INF_SGMT_ID  NCHAR(32)      NOT NULL COMMENT '410-��ҵ����˻����׳�ʼծȨ˵��������',
  INIT_CRED_NAME                 NVARCHAR(80) COMMENT '��ʼծȨ������',
  INIT_CED_ORG_CODE              NCHAR(18) COMMENT '��ʼծȨ�˻�������',
  ORIG_DBT_CATE                  NCHAR(2) COMMENT 'ԭծ������',
  INIT_RPY_STS                   NCHAR(1) COMMENT 'ծȨת��ʱ�Ļ���״̬',
  EDA_ACCT_BS_SGMT_ID            NCHAR(32)      NOT NULL COMMENT '�������',
  RPT_DATE                       NCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                        NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                        NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                        NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_ORIG_CREDITOR_INF COMMENT '410-��ҵ����˻����׳�ʼծȨ˵����';

 DROP TABLE IF EXISTS E_ORIG_CREDITOR_INF_HIST;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_ORIG_CREDITOR_INF_HIST
(
  EDF_ORIG_CREDITOR_INF_SGMT_ID  NCHAR(32)      NOT NULL COMMENT '410-��ҵ����˻����׳�ʼծȨ˵��������',
  INIT_CRED_NAME                 NVARCHAR(80) COMMENT '��ʼծȨ������',
  INIT_CED_ORG_CODE              NCHAR(18) COMMENT '��ʼծȨ�˻�������',
  ORIG_DBT_CATE                  NCHAR(2) COMMENT 'ԭծ������',
  INIT_RPY_STS                   NCHAR(1) COMMENT 'ծȨת��ʱ�Ļ���״̬',
  EDA_ACCT_BS_SGMT_ID            NCHAR(32)      NOT NULL COMMENT '�������',
  RPT_DATE                       NCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                        NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                        NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                        NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_ORIG_CREDITOR_INF_HIST COMMENT '410-��ҵ����˻����׳�ʼծȨ˵����';

 DROP TABLE IF EXISTS E_RLT_REPYMT_INF;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_RLT_REPYMT_INF
(
  EDC_RLT_REPYMT_INF_SGMT_ID  NCHAR(32)         NOT NULL COMMENT '410-��ҵ����˻�������ػ��������˶�����',
  ARLP_ID_TYPE                NCHAR(1) COMMENT '������',
  ARLP_NAME                   NVARCHAR(80) COMMENT '����������',
  ARLP_CERT_TYPE              NVARCHAR(2) COMMENT '��������ݱ�ʶ����',
  ARLP_CERT_NUM               NVARCHAR(40) COMMENT '��������ݱ�ʶ����',
  ARLP_TYPE                   NCHAR(1) COMMENT '��������������',
  ARLP_AMT                    DECIMAL(17,2) COMMENT '�������ν��',
  WARTY_SIGN                  NCHAR(1) COMMENT '������־',
  MAX_GUAR_MCC                NVARCHAR(60) COMMENT '��֤��ͬ���',
  EDA_ACCT_BS_SGMT_ID         NCHAR(32)         NOT NULL COMMENT '�������',
  RPT_DATE                    NCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                     NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                     NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                     NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_RLT_REPYMT_INF COMMENT '410-��ҵ����˻�������ػ��������˶�';

 DROP TABLE IF EXISTS E_RLT_REPYMT_INF_HIST;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_RLT_REPYMT_INF_HIST
(
  EDC_RLT_REPYMT_INF_SGMT_ID  NCHAR(32)         NOT NULL COMMENT '410-��ҵ����˻�������ػ��������˶�����',
  ARLP_ID_TYPE                NCHAR(1) COMMENT '������',
  ARLP_NAME                   NVARCHAR(80) COMMENT '����������',
  ARLP_CERT_TYPE              NVARCHAR(2) COMMENT '��������ݱ�ʶ����',
  ARLP_CERT_NUM               NVARCHAR(40) COMMENT '��������ݱ�ʶ����',
  ARLP_TYPE                   NCHAR(1) COMMENT '��������������',
  ARLP_AMT                    DECIMAL(17,2) COMMENT '�������ν��',
  WARTY_SIGN                  NCHAR(1) COMMENT '������־',
  MAX_GUAR_MCC                NVARCHAR(60) COMMENT '��֤��ͬ���',
  EDA_ACCT_BS_SGMT_ID         NCHAR(32)         NOT NULL COMMENT '�������',
  RPT_DATE                    NCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                     NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                     NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                     NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_RLT_REPYMT_INF_HIST COMMENT '410-��ҵ����˻�������ػ��������˶�';

 DROP TABLE IF EXISTS E_SEC_ACCT_DEL;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_SEC_ACCT_DEL
(
  EEY_EN_SEC_ACCT_DEL_ID  NCHAR(32)             NOT NULL COMMENT '443-��ҵ�����˻���Ϣ����ɾ������������',
  INF_REC_TYPE            NCHAR(3) COMMENT '��Ϣ��¼����',
  ACCT_TYPE               NCHAR(2) COMMENT '�˻�����',
  DEL_REC_CODE            NVARCHAR(60) COMMENT '��ɾ��ҵ���ʶ��',
  DEL_SGMT_CODE           NCHAR(1) COMMENT '��ɾ���ζα�',
  DEL_START_DATE          NVARCHAR(10) COMMENT '��ɾ����ʼ����',
  DEL_END_DATE            NVARCHAR(10) COMMENT '��ɾ����������',
  LAST_UPDATE_TIME        NVARCHAR(10) COMMENT '������ʱ��',
  OPERATOR_USER           NVARCHAR(50) COMMENT '����Ա',
  ORG_NAME                NVARCHAR(100) COMMENT '������Դ��������',
  ORG_CODE                NVARCHAR(100) COMMENT '������Դ�������',
  BUSINESS_STATES         NVARCHAR(50) COMMENT '����״̬',
  REJECT_REASON           NVARCHAR(255) COMMENT '����ԭ��',
  IS_FILTER               NCHAR(1) COMMENT '�Ƿ���˱�ʶ(Ĭ��ΪN-������)',
  REPORT_MESSAGE_ID       NVARCHAR(60) COMMENT '�����ļ�ID',
  RPT_DATE                NCHAR(10) COMMENT '��������',
  NAME                    NVARCHAR(80) COMMENT 'ծ��������',
  ID_TYPE                 NVARCHAR(2) COMMENT 'ծ������ݱ�ʶ����',
  ID_NUM                  NVARCHAR(40) COMMENT 'ծ������ݱ�ʶ����',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                 NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                 NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                 NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_SEC_ACCT_DEL COMMENT '443-��ҵ�����˻���Ϣ����ɾ��������';

 DROP TABLE IF EXISTS E_SEC_ACCT_DEL_HIST;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_SEC_ACCT_DEL_HIST
(
  EEY_EN_SEC_ACCT_DEL_ID  NCHAR(32)             NOT NULL COMMENT '443-��ҵ�����˻���Ϣ����ɾ������������',
  INF_REC_TYPE            NCHAR(3) COMMENT '��Ϣ��¼����',
  ACCT_TYPE               NCHAR(2) COMMENT '�˻�����',
  DEL_REC_CODE            NVARCHAR(60) COMMENT '��ɾ��ҵ���ʶ��',
  DEL_SGMT_CODE           NCHAR(1) COMMENT '��ɾ���ζα�',
  DEL_START_DATE          NVARCHAR(10) COMMENT '��ɾ����ʼ����',
  DEL_END_DATE            NVARCHAR(10) COMMENT '��ɾ����������',
  LAST_UPDATE_TIME        NVARCHAR(10) COMMENT '������ʱ��',
  OPERATOR_USER           NVARCHAR(50) COMMENT '����Ա',
  ORG_NAME                NVARCHAR(100) COMMENT '������Դ��������',
  ORG_CODE                NVARCHAR(100) COMMENT '������Դ�������',
  BUSINESS_STATES         NVARCHAR(50) COMMENT '����״̬',
  REJECT_REASON           NVARCHAR(255) COMMENT '����ԭ��',
  IS_FILTER               NCHAR(1) COMMENT '�Ƿ���˱�ʶ(Ĭ��ΪN-������)',
  REPORT_MESSAGE_ID       NVARCHAR(60) COMMENT '�����ļ�ID',
  RPT_DATE                NCHAR(10) COMMENT '��������',
  NAME                    NVARCHAR(80) COMMENT 'ծ��������',
  ID_TYPE                 NVARCHAR(2) COMMENT 'ծ������ݱ�ʶ����',
  ID_NUM                  NVARCHAR(40) COMMENT 'ծ������ݱ�ʶ����',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                 NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                 NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                 NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_SEC_ACCT_DEL_HIST COMMENT '443-��ҵ�����˻���Ϣ����ɾ��������';

 DROP TABLE IF EXISTS E_SEC_ACCT_ENT_DEL;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_SEC_ACCT_ENT_DEL
(
  EEZ_EN_SEC_ACCT_ENT_DEL_SG_ID  NCHAR(32)      NOT NULL COMMENT '444-��ҵ�����˻���Ϣ����ɾ����������',
  INF_REC_TYPE                   NCHAR(3) COMMENT '��Ϣ��¼����',
  ACCT_TYPE                      NCHAR(2) COMMENT '�˻�����',
  DEL_REC_CODE                   NVARCHAR(60) COMMENT '��ɾ��ҵ���ʶ',
  LAST_UPDATE_TIME               NVARCHAR(10) COMMENT '������ʱ��',
  OPERATOR_USER                  NVARCHAR(50) COMMENT '����Ա',
  ORG_NAME                       NVARCHAR(100) COMMENT '������Դ��������',
  ORG_CODE                       NVARCHAR(100) COMMENT '������Դ�������',
  BUSINESS_STATES                NVARCHAR(50) COMMENT '����״̬',
  REJECT_REASON                  NVARCHAR(255) COMMENT '����ԭ��',
  IS_FILTER                      NCHAR(1) COMMENT '�Ƿ���˱�ʶ(Ĭ��ΪN-������)',
  REPORT_MESSAGE_ID              NVARCHAR(60) COMMENT '�����ļ�ID',
  RPT_DATE                       NCHAR(10) COMMENT '��������',
  NAME                           NVARCHAR(80) COMMENT 'ծ��������',
  ID_TYPE                        NVARCHAR(2) COMMENT 'ծ������ݱ�ʶ����',
  ID_NUM                         NVARCHAR(40) COMMENT 'ծ������ݱ�ʶ����',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                        NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                        NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                        NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_SEC_ACCT_ENT_DEL COMMENT '444-��ҵ�����˻���Ϣ����ɾ������';

 DROP TABLE IF EXISTS E_SEC_ACCT_ENT_DEL_HIST;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_SEC_ACCT_ENT_DEL_HIST
(
  EEZ_EN_SEC_ACCT_ENT_DEL_SG_ID  NCHAR(32)      NOT NULL COMMENT '444-��ҵ�����˻���Ϣ����ɾ����������',
  INF_REC_TYPE                   NCHAR(3) COMMENT '��Ϣ��¼����',
  ACCT_TYPE                      NCHAR(2) COMMENT '�˻�����',
  DEL_REC_CODE                   NVARCHAR(60) COMMENT '��ɾ��ҵ���ʶ',
  LAST_UPDATE_TIME               NVARCHAR(10) COMMENT '������ʱ��',
  OPERATOR_USER                  NVARCHAR(50) COMMENT '����Ա',
  ORG_NAME                       NVARCHAR(100) COMMENT '������Դ��������',
  ORG_CODE                       NVARCHAR(100) COMMENT '������Դ�������',
  BUSINESS_STATES                NVARCHAR(50) COMMENT '����״̬',
  REJECT_REASON                  NVARCHAR(255) COMMENT '����ԭ��',
  IS_FILTER                      NCHAR(1) COMMENT '�Ƿ���˱�ʶ(Ĭ��ΪN-������)',
  REPORT_MESSAGE_ID              NVARCHAR(60) COMMENT '�����ļ�ID',
  RPT_DATE                       NCHAR(10) COMMENT '��������',
  NAME                           NVARCHAR(80) COMMENT 'ծ��������',
  ID_TYPE                        NVARCHAR(2) COMMENT 'ծ������ݱ�ʶ����',
  ID_NUM                         NVARCHAR(40) COMMENT 'ծ������ݱ�ʶ����',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                        NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                        NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                        NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_SEC_ACCT_ENT_DEL_HIST COMMENT '444-��ҵ�����˻���Ϣ����ɾ������';

 DROP TABLE IF EXISTS E_SEC_ACCT_ID_CAGS_INF;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_SEC_ACCT_ID_CAGS_INF
(
  EEW_EN_SEC_ACCT_ID_CAGS_INF_ID  NCHAR(32)     NOT NULL COMMENT '411-��ҵ�����˻���Ϣ��ʶ�������������',
  INF_REC_TYPE                    NCHAR(3) COMMENT '��Ϣ��¼����',
  ACCT_TYPE                       NCHAR(2) COMMENT '�˻�����',
  OD_BNES_CODE                    NVARCHAR(60) COMMENT 'ԭҵ���ʶ��',
  NW_BNES_CODE                    NVARCHAR(60) COMMENT '��ҵ���ʶ��',
  LAST_UPDATE_TIME                NVARCHAR(10) COMMENT '������ʱ��',
  OPERATOR_USER                   NVARCHAR(50) COMMENT '����Ա',
  ORG_NAME                        NVARCHAR(100) COMMENT '������Դ��������',
  ORG_CODE                        NVARCHAR(100) COMMENT '������Դ�������',
  BUSINESS_STATES                 NVARCHAR(50) COMMENT '����״̬',
  REJECT_REASON                   NVARCHAR(255) COMMENT '����ԭ��',
  IS_FILTER                       NCHAR(1) COMMENT '�Ƿ���˱�ʶ(Ĭ��ΪN-������)',
  REPORT_MESSAGE_ID               NVARCHAR(60) COMMENT '�����ļ�ID',
  RPT_DATE                        NCHAR(10) COMMENT '��������',
  NAME                            NVARCHAR(80) COMMENT 'ծ��������',
  ID_TYPE                         NVARCHAR(2) COMMENT '��ҵ����˻���ծ������ݱ�ʶ����ʶ����������¼����',
  ID_NUM                          NVARCHAR(40) COMMENT 'ծ������ݱ�ʶ����',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_SEC_ACCT_ID_CAGS_INF COMMENT '411-��ҵ�����˻���Ϣ��ʶ���������';

 DROP TABLE IF EXISTS E_SEC_ACCT_ID_CAGS_INF_HIST;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_SEC_ACCT_ID_CAGS_INF_HIST
(
  EEW_EN_SEC_ACCT_ID_CAGS_INF_ID  NCHAR(32)     NOT NULL COMMENT '411-��ҵ�����˻���Ϣ��ʶ�������������',
  INF_REC_TYPE                    NCHAR(3) COMMENT '��Ϣ��¼����',
  ACCT_TYPE                       NCHAR(2) COMMENT '�˻�����',
  OD_BNES_CODE                    NVARCHAR(60) COMMENT 'ԭҵ���ʶ��',
  NW_BNES_CODE                    NVARCHAR(60) COMMENT '��ҵ���ʶ��',
  LAST_UPDATE_TIME                NVARCHAR(10) COMMENT '������ʱ��',
  OPERATOR_USER                   NVARCHAR(50) COMMENT '����Ա',
  ORG_NAME                        NVARCHAR(100) COMMENT '������Դ��������',
  ORG_CODE                        NVARCHAR(100) COMMENT '������Դ�������',
  BUSINESS_STATES                 NVARCHAR(50) COMMENT '����״̬',
  REJECT_REASON                   NVARCHAR(255) COMMENT '����ԭ��',
  IS_FILTER                       NCHAR(1) COMMENT '�Ƿ���˱�ʶ(Ĭ��ΪN-������)',
  REPORT_MESSAGE_ID               NVARCHAR(60) COMMENT '�����ļ�ID',
  RPT_DATE                        NCHAR(10) COMMENT '��������',
  NAME                            NVARCHAR(80) COMMENT 'ծ��������',
  ID_TYPE                         NVARCHAR(2) COMMENT '��ҵ����˻���ծ������ݱ�ʶ����ʶ����������¼����',
  ID_NUM                          NVARCHAR(40) COMMENT 'ծ������ݱ�ʶ����',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                         NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_SEC_ACCT_ID_CAGS_INF_HIST COMMENT '411-��ҵ�����˻���Ϣ��ʶ���������';

 DROP TABLE IF EXISTS E_SEC_RLT_REPYMT_INF;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_SEC_RLT_REPYMT_INF
(
  EEC_RLT_REPYMT_INF_SGMT_ID  NCHAR(32)         NOT NULL COMMENT '440-��ҵ�����˻���Ϣ��ػ�������������',
  INFO_ID_TYPE                NCHAR(1) COMMENT '������',
  ARLP_NAME                   NVARCHAR(80) COMMENT '����������',
  ARLP_CERT_TYPE              NVARCHAR(2) COMMENT '��������ݱ�ʶ����',
  ARLP_CERT_NUM               NVARCHAR(40) COMMENT '��������ݱ�ʶ����',
  ARLP_TYPE                   NCHAR(1) COMMENT '��������������',
  ARLP_AMT                    DECIMAL(17,2) COMMENT '�������ν��',
  WARTY_SIGN                  NCHAR(1) COMMENT '������־',
  MAX_GUAR_MCC                NVARCHAR(60) COMMENT '��֤��ͬ���',
  EEA_GUAR_ACCT_BS_SGMT_ID    NCHAR(32)         NOT NULL COMMENT '�������',
  RPT_DATE                    NCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                     NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                     NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                     NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_SEC_RLT_REPYMT_INF COMMENT '440-��ҵ�����˻���Ϣ��ػ���������';

 DROP TABLE IF EXISTS E_SEC_RLT_REPYMT_INF_HIST;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_SEC_RLT_REPYMT_INF_HIST
(
  EEC_RLT_REPYMT_INF_SGMT_ID  NCHAR(32)         NOT NULL COMMENT '440-��ҵ�����˻���Ϣ��ػ�������������',
  INFO_ID_TYPE                NCHAR(1) COMMENT '������',
  ARLP_NAME                   NVARCHAR(80) COMMENT '����������',
  ARLP_CERT_TYPE              NVARCHAR(2) COMMENT '��������ݱ�ʶ����',
  ARLP_CERT_NUM               NVARCHAR(40) COMMENT '��������ݱ�ʶ����',
  ARLP_TYPE                   NCHAR(1) COMMENT '��������������',
  ARLP_AMT                    DECIMAL(17,2) COMMENT '�������ν��',
  WARTY_SIGN                  NCHAR(1) COMMENT '������־',
  MAX_GUAR_MCC                NVARCHAR(60) COMMENT '��֤��ͬ���',
  EEA_GUAR_ACCT_BS_SGMT_ID    NCHAR(32)         NOT NULL COMMENT '�������',
  RPT_DATE                    NCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                     NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                     NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                     NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_SEC_RLT_REPYMT_INF_HIST COMMENT '440-��ҵ�����˻���Ϣ��ػ���������';

 DROP TABLE IF EXISTS E_SPVSG_ATHRTY_INF;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_SPVSG_ATHRTY_INF
(
  EAG_SPVSG_ATHRTY_INF_SGMT_ID  NCHAR(32)       NOT NULL COMMENT '310-��ҵ������Ϣ�ϼ�����������',
  SUP_ORG_TYPE                  NCHAR(1) COMMENT '�ϼ���������',
  SUP_ORG_NAME                  NVARCHAR(80) COMMENT '�ϼ���������',
  SUP_ORG_CERT_TYPE             NVARCHAR(2) COMMENT '�ϼ�������ݱ�ʶ����',
  SUP_ORG_CERT_NUM              NVARCHAR(40) COMMENT '�ϼ�������ݱ�ʶ����',
  SUP_ORG_INFO_UP_DATE          NCHAR(10) COMMENT '�ϼ�������Ϣ��������',
  EAA_BS_SGMT_ID                NCHAR(32)       NOT NULL COMMENT '�������',
  RPT_DATE                      NCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                       NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                       NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                       NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_SPVSG_ATHRTY_INF COMMENT '310-��ҵ������Ϣ�ϼ�������';

 DROP TABLE IF EXISTS E_SPVSG_ATHRTY_INF_HIST;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE E_SPVSG_ATHRTY_INF_HIST
(
  EAG_SPVSG_ATHRTY_INF_SGMT_ID  NCHAR(32)       NOT NULL COMMENT '310-��ҵ������Ϣ�ϼ�����������',
  SUP_ORG_TYPE                  NCHAR(1) COMMENT '�ϼ���������',
  SUP_ORG_NAME                  NVARCHAR(80) COMMENT '�ϼ���������',
  SUP_ORG_CERT_TYPE             NVARCHAR(2) COMMENT '�ϼ�������ݱ�ʶ����',
  SUP_ORG_CERT_NUM              NVARCHAR(40) COMMENT '�ϼ�������ݱ�ʶ����',
  SUP_ORG_INFO_UP_DATE          NCHAR(10) COMMENT '�ϼ�������Ϣ��������',
  EAA_BS_SGMT_ID                NCHAR(32)       NOT NULL COMMENT '�������',
  RPT_DATE                      NCHAR(10) COMMENT '��������',
  COMPANY varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  EXTEND1                       NVARCHAR(100) COMMENT 'Ԥ���ֶ�1',
  EXTEND2                       NVARCHAR(100) COMMENT 'Ԥ���ֶ�2',
  EXTEND3                       NVARCHAR(100) COMMENT 'Ԥ���ֶ�3'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE E_SPVSG_ATHRTY_INF_HIST COMMENT '310-��ҵ������Ϣ�ϼ�������';

 DROP TABLE IF EXISTS KETTLE_REPOSITORY;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE KETTLE_REPOSITORY
(
  REPOSITORY_ID  NVARCHAR(36)                  NOT NULL,
  NAME           NVARCHAR(50)                  NOT NULL COMMENT '��Դ������',
  PATH           NVARCHAR(255)                 NOT NULL COMMENT '·��',
  CREATE_TIME    NVARCHAR(10) COMMENT '����ʱ��',
  EXTERNAL_CODE  NVARCHAR(50) COMMENT '�ⲿ���'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE KETTLE_REPOSITORY COMMENT 'kettle��Դ��';

 DROP TABLE IF EXISTS PECR_TEXT_MSG_INFORM;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE PECR_TEXT_MSG_INFORM
(
  REPORT_MESSAGE_NAME  NVARCHAR(50) COMMENT '�ϱ�������',
  SETT_DATE            NVARCHAR(10) COMMENT '����/Ӧ������',
  ACCT_CODE            NVARCHAR(50) COMMENT '�˻���ʶ��',
  ID_TYPE              NVARCHAR(5) COMMENT '֤������',
  ID_NUM               NVARCHAR(20) COMMENT '֤������',
  NAME                 NVARCHAR(30) COMMENT '�ͻ�����',
  CELL_PHONE           NVARCHAR(20) COMMENT '�ͻ��ֻ�����',
  OVERD_PRD            DECIMAL(17,2) COMMENT '��ǰ��������',
  TOT_OVERD            DECIMAL(17,2) COMMENT '��ǰ�����ܶ�',
  SEND_FEEDBACK_STATE  NVARCHAR(2) COMMENT '���ŷ���״̬,S�������ɹ�;F������ʧ��;U:  ����δ֪;P:  ����������;N: ����ʧ��;X: ������Ӧʧ��',
  INFORM_TIME          NVARCHAR(20) COMMENT '����֪ͨʱ��',
  GLOBAL_SERIAL_NO     NVARCHAR(31) COMMENT 'ȫ����ˮ��',
  SEND_TEXT            NVARCHAR(300) COMMENT '�����ı�'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE PECR_TEXT_MSG_INFORM COMMENT '����֪ͨ��Ϣ��';

 DROP TABLE IF EXISTS QWW;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE QWW
(
  ID  NVARCHAR(20)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;

 DROP TABLE IF EXISTS RM_OPERATION_RECORD;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE RM_OPERATION_RECORD
(
  REPORT_MESSAGE_TYPE  NVARCHAR(10) COMMENT '��Ϣ��¼����',
  REPORT_MESSAGE_ID    NVARCHAR(60) COMMENT '�����ļ�ID',
  CREATE_TIME          NVARCHAR(50) COMMENT '����ʱ��',
  OPERATOR_USER        NVARCHAR(50) COMMENT '�����û�',
  ORG_CODE             NVARCHAR(100) COMMENT '�����û����ڻ���',
  ORG_NAME             NVARCHAR(100) COMMENT '�����û����ڻ�������',
  ACTION               NVARCHAR(100) COMMENT '����(�ύ����ˣ����ء���)',
  DESCRIPTION          NVARCHAR(2000) COMMENT '����'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
ALTER TABLE RM_OPERATION_RECORD COMMENT '������¼��';

 DROP TABLE IF EXISTS SMS_RECORD;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE SMS_RECORD
(
  RECORD_ID    NVARCHAR(36)                    NOT NULL,
  MOBILE       NVARCHAR(15)                    NOT NULL COMMENT '�ֻ���',
  SMS_CONTENT  NVARCHAR(255)                   NOT NULL COMMENT '��������',
  CREATE_DATE  NVARCHAR(10)                    NOT NULL COMMENT '����ʱ��',
  STATUS       NVARCHAR(10)                    NOT NULL COMMENT '״̬(�ɹ�����ʧ��)',
  DESCRIPTION  NVARCHAR(255) COMMENT '������Ϣ��ʧ�ܵ�����',
  SMS_CODE     NVARCHAR(10) COMMENT '������֤��'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
