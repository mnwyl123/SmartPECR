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
echo ������Sm@rtPECRϵͳ���ݿ��PECR�û�����
set /p sense_name=
echo ������Sm@rtPECRϵͳ���ݿ���û�(PECR�û�)���룺
set /p sense_pwd=
echo ������Sm@rtPECRϵͳ���ݿ�ķ�����(����TNS)��
set /p data_sid= 
echo ����������ݿ���ϢΪ��
echo ���ݿ�FIN�û�����%sense_name%
echo ���ݿ�FIN���룺%sense_pwd%
echo ���ݿ�SID��TNS����%data_sid%

pause
echo ��ʼִ�����ݿ�SENSE��ʼ���ű���
SET NLS_LANG=SIMPLIFIED CHINESE_CHINA.ZHS16GBK

sqlplus  %sense_name%/%sense_pwd%@%data_sid%   @.\pecrRunAll.sql  >pecrRunAll.log
sqlplus  %sense_name%/%sense_pwd%@%data_sid%   @.\pecrRunAll.sql  >pecrRunAll.log
echo ���ݿ�PECR��ʼ���ű�ִ����ϣ���鿴��־��¼��

:end 

PAUSE
color
@ECHO ON 
