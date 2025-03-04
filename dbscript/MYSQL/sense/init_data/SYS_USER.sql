DELETE FROM SYS_USER;
Insert into SYS_USER
   (USER_ID, 
    USERNAME, 
    PASSWORD, 
    NAME, 
    LAST_LOGIN, 
    IP, 
    EMAIL, 
    TELLER_NUMBER, 
    PHONE, 
    DEPT_CODE, 
    LOCK_STATUS, 
    COMPANY
   )
 Values
   ('0', 
    'super', 
    '6b07cab3419456bd7af577b0f649efde', 
    '超级用户', 
    '2020-05-18 09:17:41', 
    '0:0:0:0:0:0:0:1', 
    '323@w.com', 
    '12', 
    '18788888888', 
    '212', 
    '0', 
    'super');
COMMIT;
