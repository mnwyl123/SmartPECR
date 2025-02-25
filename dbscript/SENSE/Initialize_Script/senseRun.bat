@echo off
cls 
color 0A 
echo ************************************************************
echo **                                                        **
echo **                      Sm@rtSense                        **
echo **                   征信查询2.0前置系统                  **
echo **                                                        **
echo **                                                        **
echo ************************************************************
echo 请输入Sm@rtSense系统数据库的SENSE用户名：
set /p sense_name=
echo 请输入Sm@rtSense系统数据库的用户(SENSE用户)密码：
set /p sense_pwd=
echo 请输入Sm@rtSense系统数据库的服务名(本地TNS)：
set /p data_sid= 
echo 您输入的数据库信息为：
echo 数据库FIN用户名：%sense_name%
echo 数据库FIN密码：%sense_pwd%
echo 数据库SID（TNS）：%data_sid%

pause
echo 开始执行数据库SENSE初始化脚本：
SET NLS_LANG=SIMPLIFIED CHINESE_CHINA.ZHS16GBK

sqlplus  %sense_name%/%sense_pwd%@%data_sid%   @.\senseRunAll.sql  >senseRunAll.log
sqlplus  %sense_name%/%sense_pwd%@%data_sid%   @.\senseRunAll.sql  >senseRunAll.log
echo 数据库SENSE初始化脚本执行完毕，请查看日志记录。

:end 

PAUSE
color
@ECHO ON 
