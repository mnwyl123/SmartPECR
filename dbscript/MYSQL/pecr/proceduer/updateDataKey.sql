-- ----------------------------
-- Procedure structure for updateDataKey
-- ----------------------------
DROP PROCEDURE IF EXISTS updateDataKey;
DELIMITER ;;
CREATE DEFINER='root'@'%' PROCEDURE updateDataKey(IN P_DATA_DATE varchar(8), OUT P_O_RESULT varchar(10))
BEGIN
	DECLARE V_STEP             VARCHAR(10) DEFAULT '0';
	DECLARE V_PROC_NAME        VARCHAR(100)DEFAULT 'updateDataKey';
	DECLARE V_TABLE_NAME       VARCHAR(30) DEFAULT 'I_BS';
	DECLARE V_TABLE_NAME1      VARCHAR(30) DEFAULT 'I_IN_FAL_MMBS_INF';
	DECLARE V_TABLE_NAME2      VARCHAR(30) DEFAULT 'I_IN_ID_EFCT_INF';
	DECLARE V_DATA_DATE        VARCHAR(8);
	DECLARE V_SUCCESS          VARCHAR(10) DEFAULT 'SUCCESS';
	DECLARE V_FAILED           VARCHAR(10) DEFAULT 'FAILED';
	DECLARE V_START_TIME       VARCHAR(100);
	DECLARE V_END_TIME         VARCHAR(100);
	DECLARE V_RUN_DATE         VARCHAR(10);
	DECLARE V_FREQ             VARCHAR(1) DEFAULT 'D';
	DECLARE V_SQL1             VARCHAR(2000);
	DECLARE V_SQL2             VARCHAR(2000);
	
	 DECLARE EXIT HANDLER FOR SQLEXCEPTION
     BEGIN
       ROLLBACK;
             SET P_O_RESULT = 'FAILED';
           GET DIAGNOSTICS CONDITION 1 V_SQL1 = RETURNED_SQLSTATE, V_SQL2 = MESSAGE_TEXT;
       INSERT INTO etl_error_log(data_date, step, error_msg, proc_name, p_o_result) 
         VALUES (NOW(), V_STEP, CONCAT(V_SQL1, ':', V_SQL2), V_PROC_NAME, P_O_RESULT);
             COMMIT;
     END;
    
    SET AUTOCOMMIT = 0;
    START TRANSACTION;
	
	SET P_O_RESULT = V_SUCCESS;
	SET V_DATA_DATE = P_DATA_DATE;
	SET V_RUN_DATE = DATE_FORMAT(P_DATA_DATE,'%Y-%m-%d');
	SET V_START_TIME = DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i:%s');
	
	-- 修改个人基本信息记录数据外键开始
	SET V_STEP = '1';
	 -- 修改个人基本信息记录基本概况段的数据外键
	UPDATE I_FCS_INF  A
	JOIN (select PAA_BS_SGMT_ID,DATA_DATE,RPT_DATE,CUST_NUM from I_BS) B
	ON (A.CUST_NUM = B.CUST_NUM and A.DATA_DATE = B.DATA_DATE AND A.RPT_DATE = B.RPT_DATE)
	SET A.PAA_BS_SGMT_ID = B.PAA_BS_SGMT_ID
	WHERE A.DATA_DATE <= V_RUN_DATE AND (A.PAA_BS_SGMT_ID IS NULL OR A.PAA_BS_SGMT_ID ='');
	COMMIT;
	
	SET V_STEP = '2';
	-- 修改个人基本信息记录教育信息段的数据外键
	UPDATE I_EDU_INF A
	JOIN (select PAA_BS_SGMT_ID,DATA_DATE,RPT_DATE,CUST_NUM from I_BS) B
	ON (A.CUST_NUM = B.CUST_NUM and A.DATA_DATE = B.DATA_DATE AND A.RPT_DATE = B.RPT_DATE)
	SET A.PAA_BS_SGMT_ID = B.PAA_BS_SGMT_ID
	WHERE A.DATA_DATE <= V_RUN_DATE AND (A.PAA_BS_SGMT_ID IS NULL OR A.PAA_BS_SGMT_ID ='');
	COMMIT;
	
	SET V_STEP = '3';
	-- 修改个人基本信息记录职业信息段的数据外键
	UPDATE I_OCTPN_INF A
	JOIN (select PAA_BS_SGMT_ID,DATA_DATE,RPT_DATE,CUST_NUM from I_BS) B
	ON (A.CUST_NUM = B.CUST_NUM and A.DATA_DATE = B.DATA_DATE AND A.RPT_DATE = B.RPT_DATE)
	SET A.PAA_BS_SGMT_ID = B.PAA_BS_SGMT_ID
	WHERE A.DATA_DATE <= V_RUN_DATE AND (A.PAA_BS_SGMT_ID IS NULL OR A.PAA_BS_SGMT_ID ='');
	COMMIT;
	
	SET V_STEP = '4';
	-- 修改个人基本信息记录其他标识段数据外键
	UPDATE I_ID A
	JOIN (select PAA_BS_SGMT_ID,DATA_DATE,RPT_DATE,CUST_NUM from I_BS) B
	ON (A.CUST_NUM = B.CUST_NUM and A.DATA_DATE = B.DATA_DATE AND A.RPT_DATE = B.RPT_DATE)
	SET A.PAA_BS_SGMT_ID = B.PAA_BS_SGMT_ID
	WHERE A.DATA_DATE <= V_RUN_DATE AND (A.PAA_BS_SGMT_ID IS NULL OR A.PAA_BS_SGMT_ID ='');
	COMMIT;
	
	SET V_STEP = '5';
	-- 修改个人基本信息记录收入信息段数据外键
	UPDATE I_INC_INF A
	JOIN (select PAA_BS_SGMT_ID,DATA_DATE,RPT_DATE,CUST_NUM from I_BS) B
	ON (A.CUST_NUM = B.CUST_NUM and A.DATA_DATE = B.DATA_DATE AND A.RPT_DATE = B.RPT_DATE)
	SET A.PAA_BS_SGMT_ID = B.PAA_BS_SGMT_ID
	WHERE A.DATA_DATE <= V_RUN_DATE AND (A.PAA_BS_SGMT_ID IS NULL OR A.PAA_BS_SGMT_ID ='');
	COMMIT;
	
	SET V_STEP = '6';
	-- 修改个人基本信息记录通讯地址段数据外键
	UPDATE I_MLG_INF A
	JOIN (select PAA_BS_SGMT_ID,DATA_DATE,RPT_DATE,CUST_NUM from I_BS) B
	ON (A.CUST_NUM = B.CUST_NUM and A.DATA_DATE = B.DATA_DATE AND A.RPT_DATE = B.RPT_DATE)
	SET A.PAA_BS_SGMT_ID = B.PAA_BS_SGMT_ID
	WHERE A.DATA_DATE <= V_RUN_DATE AND (A.PAA_BS_SGMT_ID IS NULL OR A.PAA_BS_SGMT_ID ='');
	COMMIT;
	
	SET V_STEP = '7';
	-- 修改个人基本信息记录居住地址段数据外键
	UPDATE I_REDNC_INF A
	JOIN (select PAA_BS_SGMT_ID,DATA_DATE,RPT_DATE,CUST_NUM from I_BS) B
	ON (A.CUST_NUM = B.CUST_NUM and A.DATA_DATE = B.DATA_DATE AND A.RPT_DATE = B.RPT_DATE)
	SET A.PAA_BS_SGMT_ID = B.PAA_BS_SGMT_ID
	WHERE A.DATA_DATE <= V_RUN_DATE AND (A.PAA_BS_SGMT_ID IS NULL OR A.PAA_BS_SGMT_ID ='');
	COMMIT;
	
	SET V_STEP = '8';
	-- 修改个人基本信息记录婚姻信息段数据外键
	UPDATE I_SPS_INF A
	JOIN (select PAA_BS_SGMT_ID,DATA_DATE,RPT_DATE,CUST_NUM from I_BS) B
	ON (A.CUST_NUM = B.CUST_NUM and A.DATA_DATE = B.DATA_DATE AND A.RPT_DATE = B.RPT_DATE)
	SET A.PAA_BS_SGMT_ID = B.PAA_BS_SGMT_ID
	WHERE A.DATA_DATE <= V_RUN_DATE AND (A.PAA_BS_SGMT_ID IS NULL OR A.PAA_BS_SGMT_ID ='');
	COMMIT;
	-- 修改个人基本信息记录外键结束
	
	SET V_STEP = '9';
	-- 修改个人借贷账户信息记录基本信息段数据外键
	UPDATE I_ACCT_BS_INF A
	JOIN (select PBA_ACCT_BS_SGMT_ID,DATA_DATE,CUST_NUM,ACCT_CODE ,RPT_DATE from I_ACCT_BS) B
	ON (A.CUST_NUM = B.CUST_NUM and A.ACCT_NUM = B.ACCT_CODE AND A.DATA_DATE = B.DATA_DATE AND A.RPT_DATE = B.RPT_DATE)
	SET A.PBA_ACCT_BS_SGMT_ID = B.PBA_ACCT_BS_SGMT_ID
	WHERE A.DATA_DATE <= V_RUN_DATE AND (A.PBA_ACCT_BS_SGMT_ID IS NULL OR A.PBA_ACCT_BS_SGMT_ID = '');
	COMMIT;
	
	SET V_STEP = '10';
	-- 修改个人借贷账户信息记录授信额度信息数据外键
	UPDATE I_ACCT_CRED A
	JOIN (select PBA_ACCT_BS_SGMT_ID,DATA_DATE,CUST_NUM,ACCT_CODE,RPT_DATE from I_ACCT_BS) B
	ON (A.CUST_NUM = B.CUST_NUM and A.ACCT_NUM = B.ACCT_CODE AND A.DATA_DATE = B.DATA_DATE AND A.RPT_DATE = B.RPT_DATE)
	SET A.PBA_ACCT_BS_SGMT_ID = B.PBA_ACCT_BS_SGMT_ID
	WHERE A.DATA_DATE <= V_RUN_DATE AND (A.PBA_ACCT_BS_SGMT_ID IS NULL OR A.PBA_ACCT_BS_SGMT_ID = '');
	COMMIT;
	
	SET V_STEP = '11';
	-- 修改个人借贷账户信息记录非月度表现段数据外键
	UPDATE I_ACCT_DBT_INF A
	JOIN (select PBA_ACCT_BS_SGMT_ID,DATA_DATE,CUST_NUM,ACCT_CODE,RPT_DATE from I_ACCT_BS) B
	ON (A.CUST_NUM = B.CUST_NUM and A.ACCT_NUM = B.ACCT_CODE AND A.DATA_DATE = B.DATA_DATE AND A.RPT_DATE = B.RPT_DATE)
	SET A.PBA_ACCT_BS_SGMT_ID = B.PBA_ACCT_BS_SGMT_ID
	WHERE A.DATA_DATE <= V_RUN_DATE AND (A.PBA_ACCT_BS_SGMT_ID IS NULL OR A.PBA_ACCT_BS_SGMT_ID = '');
	COMMIT;
	
	SET V_STEP = '12';
	-- 修改个人借贷账户信息记录月度表现段数据外键
	UPDATE I_AMBLG_INF A
	JOIN (select PBA_ACCT_BS_SGMT_ID,DATA_DATE,CUST_NUM,ACCT_CODE,RPT_DATE from I_ACCT_BS) B
	ON (A.CUST_NUM = B.CUST_NUM and A.ACCT_NUM = B.ACCT_CODE AND A.DATA_DATE = B.DATA_DATE AND A.RPT_DATE = B.RPT_DATE)
	SET A.PBA_ACCT_BS_SGMT_ID = B.PBA_ACCT_BS_SGMT_ID
	WHERE A.DATA_DATE <=  V_RUN_DATE AND (A.PBA_ACCT_BS_SGMT_ID IS NULL OR A.PBA_ACCT_BS_SGMT_ID = '');
	COMMIT;
	
	SET V_STEP = '13';
	-- 修改个人借贷账户信息记录特殊交易说明段数据外键
	UPDATE I_AS_TRST_DSPN A
	JOIN (select PBA_ACCT_BS_SGMT_ID,DATA_DATE,CUST_NUM,ACCT_CODE,RPT_DATE from I_ACCT_BS) B
	ON (A.CUST_NUM = B.CUST_NUM and A.ACCT_NUM = B.ACCT_CODE AND A.DATA_DATE = B.DATA_DATE AND A.RPT_DATE = B.RPT_DATE)
	SET A.PBA_ACCT_BS_SGMT_ID = B.PBA_ACCT_BS_SGMT_ID
	WHERE A.DATA_DATE <=  V_RUN_DATE AND (A.PBA_ACCT_BS_SGMT_ID IS NULL OR A.PBA_ACCT_BS_SGMT_ID = '');
	COMMIT;
	
	SET V_STEP = '14';
	-- 修改个人借贷账户信息记录相关还款责任人段数据外键
	UPDATE I_LOAN_RLT_REPYMT_INF A
	JOIN (select PBA_ACCT_BS_SGMT_ID,DATA_DATE,CUST_NUM,ACCT_CODE,RPT_DATE from I_ACCT_BS) B
	ON (A.CUST_NUM = B.CUST_NUM and A.ACCT_NUM = B.ACCT_CODE AND A.DATA_DATE = B.DATA_DATE AND A.RPT_DATE = B.RPT_DATE)
	SET A.PBA_ACCT_BS_SGMT_ID = B.PBA_ACCT_BS_SGMT_ID
	WHERE A.DATA_DATE <= V_RUN_DATE AND (A.PBA_ACCT_BS_SGMT_ID IS NULL OR A.PBA_ACCT_BS_SGMT_ID = '');
	COMMIT;
	
	SET V_STEP = '15';
	-- 修改个人借贷账户信息记录抵质押物信息段数据外键
	UPDATE I_MCC_INF A
	JOIN (select PBA_ACCT_BS_SGMT_ID,DATA_DATE,CUST_NUM,ACCT_CODE,RPT_DATE from I_ACCT_BS) B
	ON (A.CUST_NUM = B.CUST_NUM and A.ACCT_NUM = B.ACCT_CODE AND A.DATA_DATE = B.DATA_DATE AND A.RPT_DATE = B.RPT_DATE)
	SET A.PBA_ACCT_BS_SGMT_ID = B.PBA_ACCT_BS_SGMT_ID
	WHERE A.DATA_DATE = V_RUN_DATE AND (A.PBA_ACCT_BS_SGMT_ID IS NULL OR A.PBA_ACCT_BS_SGMT_ID = '');
	COMMIT;
	
	SET V_STEP = '16';
	-- 修改个人借贷账户信息记录初始债权段数据外键
	UPDATE I_OC_INF A
	JOIN (select PBA_ACCT_BS_SGMT_ID,DATA_DATE,CUST_NUM,ACCT_CODE,RPT_DATE from I_ACCT_BS) B
	ON (A.CUST_NUM = B.CUST_NUM and A.ACCT_NUM = B.ACCT_CODE AND A.DATA_DATE = B.DATA_DATE AND A.RPT_DATE = B.RPT_DATE)
	SET A.PBA_ACCT_BS_SGMT_ID = B.PBA_ACCT_BS_SGMT_ID
	WHERE A.DATA_DATE <= V_RUN_DATE AND (A.PBA_ACCT_BS_SGMT_ID IS NULL OR A.PBA_ACCT_BS_SGMT_ID = '');
	COMMIT;
	
	SET V_STEP = '17';
	-- 修改个人借贷账户信息记录大额专项分期段数据外键
	UPDATE I_SPEC_PRD A
	JOIN (select PBA_ACCT_BS_SGMT_ID,DATA_DATE,CUST_NUM,ACCT_CODE,RPT_DATE from I_ACCT_BS) B
	ON (A.CUST_NUM = B.CUST_NUM and A.ACCT_NUM= B.ACCT_CODE AND A.DATA_DATE = B.DATA_DATE AND A.RPT_DATE = B.RPT_DATE)
	SET A.PBA_ACCT_BS_SGMT_ID = B.PBA_ACCT_BS_SGMT_ID
	WHERE A.DATA_DATE <= V_RUN_DATE AND (A.PBA_ACCT_BS_SGMT_ID IS NULL OR A.PBA_ACCT_BS_SGMT_ID = '');
	COMMIT;
	
	-- 修改个人授信协议信息段的数据外键
	
	/*SET V_STEP = '18';
	-- 修改个人授信协议信息记录共同受信人段数据外键
	UPDATE I_CTRCT_CERT_REL A
	JOIN (select PCA_CTRCT_BS_SGMT_ID,DATA_DATE,CONTRACT_CODE from I_CTRCT_BS) B
	ON (A.CONTRACT_CODE = B.CONTRACT_CODE AND A.DATA_DATE = B.DATA_DATE)
	SET A.PCA_CTRCT_BS_SGMT_ID = B.PCA_CTRCT_BS_SGMT_ID
	WHERE A.DATA_DATE = V_RUN_DATE AND (A.PCA_CTRCT_BS_SGMT_ID IS NULL OR A.PCA_CTRCT_BS_SGMT_ID = '');
	COMMIT;
	
	SET V_STEP = '19';
	-- 修改个人授信协议信息记录授信额度信息段数据外键
	UPDATE I_CREDIT_LIM A
	JOIN (select PCA_CTRCT_BS_SGMT_ID,DATA_DATE,CLIENT_NUMBER,CONTRACT_CODE from I_CTRCT_BS) B
	ON (A.CLIENT_NUMBER = B.CLIENT_NUMBER and A.CONTRACT_CODE = B.CONTRACT_CODE AND A.DATA_DATE = B.DATA_DATE)
	SET A.PCA_CTRCT_BS_SGMT_ID = B.PCA_CTRCT_BS_SGMT_ID
	WHERE A.DATA_DATE = V_RUN_DATE AND (A.PCA_CTRCT_BS_SGMT_ID IS NULL OR A.PCA_CTRCT_BS_SGMT_ID = '');
	COMMIT;*/
	
	-- 修改个人担保账户信息记录数据外键
	
	SET V_STEP = '20';
	-- 修改个人担保账户信息记录基本信息段数据外键
	UPDATE I_GUAR_ACCT_INF A
	JOIN (select PDA_GUAR_ACCT_BS_SGMT_ID,DATA_DATE,CUST_NUM,ACCT_CODE ,RPT_DATE from I_GUAR_ACCT_BS) B
	ON (A.CUST_NUM = B.CUST_NUM and A.ACCT_NUM = B.ACCT_CODE AND A.DATA_DATE = B.DATA_DATE AND A.RPT_DATE = B.RPT_DATE)
	SET A.PDA_GUAR_ACCT_BS_SGMT_ID = B.PDA_GUAR_ACCT_BS_SGMT_ID
	WHERE A.DATA_DATE <= V_RUN_DATE AND (A.PDA_GUAR_ACCT_BS_SGMT_ID IS NULL OR A.PDA_GUAR_ACCT_BS_SGMT_ID = '');
	COMMIT;
	
	SET V_STEP = '21';
	-- 修改个人担保账户信息记录在保责任信息段数据外键
	UPDATE I_GR_REPYMT_INF A
	JOIN (select PDA_GUAR_ACCT_BS_SGMT_ID,DATA_DATE,CUST_NUM,ACCT_CODE,RPT_DATE from I_GUAR_ACCT_BS) B
	ON (A.CUST_NUM = B.CUST_NUM and A.ACCT_NUM = B.ACCT_CODE AND A.DATA_DATE = B.DATA_DATE AND A.RPT_DATE = B.RPT_DATE)
	SET A.PDA_GUAR_ACCT_BS_SGMT_ID = B.PDA_GUAR_ACCT_BS_SGMT_ID
	WHERE A.DATA_DATE <= V_RUN_DATE AND (A.PDA_GUAR_ACCT_BS_SGMT_ID IS NULL OR A.PDA_GUAR_ACCT_BS_SGMT_ID = '');
	COMMIT;
	
	SET V_STEP = '22';
	-- 修改个人担保账户信息记录抵质押物信息段数据外键
	UPDATE I_GUAR_MCC_INF A
	JOIN (select PDA_GUAR_ACCT_BS_SGMT_ID,DATA_DATE,CUST_NUM,ACCT_CODE,RPT_DATE from I_GUAR_ACCT_BS) B
	ON (A.CUST_NUM = B.CUST_NUM and A.ACCT_NUM = B.ACCT_CODE AND A.DATA_DATE = B.DATA_DATE AND A.RPT_DATE = B.RPT_DATE)
	SET A.PDA_GUAR_ACCT_BS_SGMT_ID = B.PDA_GUAR_ACCT_BS_SGMT_ID
	WHERE A.DATA_DATE <= V_RUN_DATE AND (A.PDA_GUAR_ACCT_BS_SGMT_ID IS NULL OR A.PDA_GUAR_ACCT_BS_SGMT_ID = '');
	COMMIT;
	
	SET V_STEP = '23';
	-- 修改个人担保账户信息记录相关还款责任人段数据外键
	UPDATE I_GUAR_RLT_REPYMT_INF A
	JOIN (select PDA_GUAR_ACCT_BS_SGMT_ID,DATA_DATE,CUST_NUM,ACCT_CODE,RPT_DATE from I_GUAR_ACCT_BS) B
	ON (A.CUST_NUM = B.CUST_NUM and A.ACCT_NUM = B.ACCT_CODE AND A.DATA_DATE = B.DATA_DATE AND A.RPT_DATE = B.RPT_DATE)
	SET A.PDA_GUAR_ACCT_BS_SGMT_ID = B.PDA_GUAR_ACCT_BS_SGMT_ID
	WHERE A.DATA_DATE <= V_RUN_DATE AND (A.PDA_GUAR_ACCT_BS_SGMT_ID IS NULL OR A.PDA_GUAR_ACCT_BS_SGMT_ID = '');
	COMMIT;
	

	/*处理结束，记录日志信息*/
	SET V_STEP = 'N';
	SET  V_END_TIME = DATE_FORMAT(NOW(), '%Y-%m-%d %H:%i:%s');
	INSERT INTO ETL_SUCCESS_LOG(PROC_NAME,START_TIME,END_TIME,P_O_RESULT)
	VALUES(V_PROC_NAME,V_START_TIME,V_END_TIME,P_O_RESULT);
	commit;
END
;;
DELIMITER ;
