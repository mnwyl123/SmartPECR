DELETE FROM SYS_PASSWORD;
Insert into SYS_PASSWORD
   (INITIAL_PASSWORD, 
    MAX_ERROR_LOGON, 
    EFFECT_DAYS, 
    MIN_LENGTH, 
    MAX_LENGTH, 
    REPEAT_NUM, 
    MODIFIED_RESTRICT_TIME, 
    ENCRYPT_TYPE, 
    PASSWORD_RULE
   )
 Values
   ('111111', 
    3, 
    1, 
    6, 
    15, 
    3, 
    3, 
    'MD5', 
    'number');
COMMIT;
