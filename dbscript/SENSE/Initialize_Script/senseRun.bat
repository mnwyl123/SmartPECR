@echo off
cls 
color 0A 
echo ************************************************************
echo **                                                        **
echo **                      Sm@rtSense                        **
echo **                   ���Ų�ѯ2.0ǰ��ϵͳ                  **
echo **                                                        **
echo **                                                        **
echo ************************************************************
echo ������Sm@rtSenseϵͳ���ݿ��SENSE�û�����
set /p sense_name=
echo ������Sm@rtSenseϵͳ���ݿ���û�(SENSE�û�)���룺
set /p sense_pwd=
echo ������Sm@rtSenseϵͳ���ݿ�ķ�����(����TNS)��
set /p data_sid= 
echo ����������ݿ���ϢΪ��
echo ���ݿ�FIN�û�����%sense_name%
echo ���ݿ�FIN���룺%sense_pwd%
echo ���ݿ�SID��TNS����%data_sid%

pause
echo ��ʼִ�����ݿ�SENSE��ʼ���ű���
SET NLS_LANG=SIMPLIFIED CHINESE_CHINA.ZHS16GBK

sqlplus  %sense_name%/%sense_pwd%@%data_sid%   @.\senseRunAll.sql  >senseRunAll.log
sqlplus  %sense_name%/%sense_pwd%@%data_sid%   @.\senseRunAll.sql  >senseRunAll.log
echo ���ݿ�SENSE��ʼ���ű�ִ����ϣ���鿴��־��¼��

:end 

PAUSE
color
@ECHO ON 
