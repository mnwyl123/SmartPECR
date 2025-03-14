DELETE FROM SYS_DICTIONARIES;
Insert into SYS_DICTIONARIES
   (DICTIONARIES_ID, 
    NAME, 
    NAME_EN, 
    DICT_CODE, 
    ORDER_BY, 
    PARENT_ID
   )
 Values
   ('0791fbd6d65b44a9b458a5dd227cfc4d', 
    '护照', 
    'passport', 
    '2', 
    2, 
    '3fa59275066842ad8daf54bb8959d24a');
Insert into SYS_DICTIONARIES
   (DICTIONARIES_ID, 
    NAME, 
    NAME_EN, 
    DICT_CODE, 
    ORDER_BY, 
    PARENT_ID
   )
 Values
   ('133ec4e639934f6f99a3d89b1d2d9fa6', 
    '基础部', 
    'baseOrg', 
    '001', 
    1, 
    'f271619c4e3c453cb795a720e28861aa');
Insert into SYS_DICTIONARIES
   (DICTIONARIES_ID, 
    NAME, 
    NAME_EN, 
    DICT_CODE, 
    ORDER_BY, 
    PARENT_ID
   )
 Values
   ('13f6ace97df34acbbed387cf7126c948', 
    'JNDI', 
    'JNDI', 
    'JNDI', 
    1, 
    '6b7d4036fb3747f28e28a3e24081f5c6');
Insert into SYS_DICTIONARIES
   (DICTIONARIES_ID, 
    NAME, 
    NAME_EN, 
    DICT_CODE, 
    ORDER_BY, 
    PARENT_ID
   )
 Values
   ('2127df094acb4bd7b0fc1517cd3b6419', 
    '港澳居民来往内地通行证', 
    'hongkongandmacaopass', 
    '5', 
    3, 
    '3fa59275066842ad8daf54bb8959d24a');
Insert into SYS_DICTIONARIES
   (DICTIONARIES_ID, 
    NAME, 
    NAME_EN, 
    DICT_CODE, 
    ORDER_BY, 
    PARENT_ID
   )
 Values
   ('2c76fe1a628c4f0c95ef6fdd59716fce', 
    '居民身份证及其他以公民身份证号码为标识的证件', 
    'IDCard', 
    '10', 
    11, 
    '3fa59275066842ad8daf54bb8959d24a');
Insert into SYS_DICTIONARIES
   (DICTIONARIES_ID, 
    NAME, 
    NAME_EN, 
    DICT_CODE, 
    ORDER_BY, 
    PARENT_ID, 
    BZ
   )
 Values
   ('313f4cadd5cd4eebac4c87fc7003a2b4', 
    '报表菜单', 
    'reportMenu', 
    'MENUTYPE1', 
    3, 
    '45e0a34f25ca4f72b0d8b643fa2ace03', 
    '菜单类型');
Insert into SYS_DICTIONARIES
   (DICTIONARIES_ID, 
    NAME, 
    NAME_EN, 
    DICT_CODE, 
    ORDER_BY, 
    PARENT_ID, 
    BZ
   )
 Values
   ('3f3a4e0c8a91444cb3c6149613552951', 
    '业务菜单', 
    'businessMenu', 
    'MENUTYPE2', 
    2, 
    '45e0a34f25ca4f72b0d8b643fa2ace03', 
    '菜单类型');
Insert into SYS_DICTIONARIES
   (DICTIONARIES_ID, 
    NAME, 
    NAME_EN, 
    DICT_CODE, 
    ORDER_BY, 
    PARENT_ID
   )
 Values
   ('3f7dd28c892e48129904b68de0a6d969', 
    '警官证', 
    'PoliceOfficersCard', 
    '9', 
    6, 
    '3fa59275066842ad8daf54bb8959d24a');
Insert into SYS_DICTIONARIES
   (DICTIONARIES_ID, 
    NAME, 
    NAME_EN, 
    DICT_CODE, 
    ORDER_BY, 
    PARENT_ID, 
    TBSNAME
   )
 Values
   ('3fa59275066842ad8daf54bb8959d24a', 
    '证件类型', 
    'IDType', 
    'IDType', 
    6, 
    '0', 
    'SYS_DICTIONARIES');
Insert into SYS_DICTIONARIES
   (DICTIONARIES_ID, 
    NAME, 
    NAME_EN, 
    DICT_CODE, 
    ORDER_BY, 
    PARENT_ID, 
    BZ
   )
 Values
   ('45e0a34f25ca4f72b0d8b643fa2ace03', 
    '菜单类型', 
    'menuType', 
    '001', 
    1, 
    '0', 
    '菜单类型');
Insert into SYS_DICTIONARIES
   (DICTIONARIES_ID, 
    NAME, 
    NAME_EN, 
    DICT_CODE, 
    ORDER_BY, 
    PARENT_ID, 
    BZ
   )
 Values
   ('52c708ca2b40411cac65a77d599184c3', 
    '系统菜单', 
    'systemMenu', 
    'MENUTYPE3', 
    1, 
    '45e0a34f25ca4f72b0d8b643fa2ace03', 
    '菜单类型');
Insert into SYS_DICTIONARIES
   (DICTIONARIES_ID, 
    NAME, 
    NAME_EN, 
    DICT_CODE, 
    ORDER_BY, 
    PARENT_ID
   )
 Values
   ('6b7d4036fb3747f28e28a3e24081f5c6', 
    '连接方式', 
    'ConWay', 
    '111', 
    3, 
    '0');
Insert into SYS_DICTIONARIES
   (DICTIONARIES_ID, 
    NAME, 
    NAME_EN, 
    DICT_CODE, 
    ORDER_BY, 
    PARENT_ID
   )
 Values
   ('711d040e44bf4f95b76e2009c3349709', 
    '外国人居留证', 
    'alienResidencePermit', 
    '8', 
    5, 
    '3fa59275066842ad8daf54bb8959d24a');
Insert into SYS_DICTIONARIES
   (DICTIONARIES_ID, 
    NAME, 
    NAME_EN, 
    DICT_CODE, 
    ORDER_BY, 
    PARENT_ID, 
    BZ
   )
 Values
   ('729f3ad1db984226b6a921e3df2dadcb', 
    '数据库类型', 
    'DbType', 
    '002', 
    2, 
    '0', 
    '数据库类型');
Insert into SYS_DICTIONARIES
   (DICTIONARIES_ID, 
    NAME, 
    NAME_EN, 
    DICT_CODE, 
    ORDER_BY, 
    PARENT_ID
   )
 Values
   ('77e496d3ffb94ce0b5c965b391426887', 
    '科技部', 
    'tecOrg', 
    '002', 
    2, 
    'f271619c4e3c453cb795a720e28861aa');
Insert into SYS_DICTIONARIES
   (DICTIONARIES_ID, 
    NAME, 
    NAME_EN, 
    DICT_CODE, 
    ORDER_BY, 
    PARENT_ID, 
    BZ
   )
 Values
   ('790ccc8862e243a48986eba6f8263899', 
    'Mysql', 
    'mysql', 
    'mysql', 
    1, 
    '729f3ad1db984226b6a921e3df2dadcb', 
    '数据库类型');
Insert into SYS_DICTIONARIES
   (DICTIONARIES_ID, 
    NAME, 
    NAME_EN, 
    DICT_CODE, 
    ORDER_BY, 
    PARENT_ID, 
    BZ
   )
 Values
   ('7c0b914f3f104f2c9c9e14b527057dd9', 
    '菜单渠道', 
    'menuChannel', 
    '1', 
    4, 
    '0', 
    '菜单渠道，请勿删除');
Insert into SYS_DICTIONARIES
   (DICTIONARIES_ID, 
    NAME, 
    NAME_EN, 
    DICT_CODE, 
    ORDER_BY, 
    PARENT_ID
   )
 Values
   ('8c270e8ac8f44177b47839ca849b90c6', 
    '台湾身份证', 
    'taiwanIDCard', 
    'C', 
    9, 
    '3fa59275066842ad8daf54bb8959d24a');
Insert into SYS_DICTIONARIES
   (DICTIONARIES_ID, 
    NAME, 
    NAME_EN, 
    DICT_CODE, 
    ORDER_BY, 
    PARENT_ID
   )
 Values
   ('8d0329e54f3d4fef802905dccb4521ed', 
    '户口簿', 
    'HouseholdRegistrationBook', 
    '1', 
    1, 
    '3fa59275066842ad8daf54bb8959d24a');
Insert into SYS_DICTIONARIES
   (DICTIONARIES_ID, 
    NAME, 
    NAME_EN, 
    DICT_CODE, 
    ORDER_BY, 
    PARENT_ID
   )
 Values
   ('8de6a1695c4b479d8e658b6fcb331a3f', 
    'MOBILE菜单', 
    'MOBILE_MENU', 
    'MOBILE', 
    2, 
    '7c0b914f3f104f2c9c9e14b527057dd9');
Insert into SYS_DICTIONARIES
   (DICTIONARIES_ID, 
    NAME, 
    NAME_EN, 
    DICT_CODE, 
    ORDER_BY, 
    PARENT_ID
   )
 Values
   ('8e62c66cd25d436fafbdc0e5ed074555', 
    '台湾同胞来往内地通行证', 
    'taiwanpass', 
    '6', 
    4, 
    '3fa59275066842ad8daf54bb8959d24a');
Insert into SYS_DICTIONARIES
   (DICTIONARIES_ID, 
    NAME, 
    NAME_EN, 
    DICT_CODE, 
    ORDER_BY, 
    PARENT_ID, 
    BZ
   )
 Values
   ('9bedde2c46f742f5a32bdad334fa290e', 
    'PC菜单', 
    'PC_MENU', 
    'PC', 
    1, 
    '7c0b914f3f104f2c9c9e14b527057dd9', 
    'pc菜单');
Insert into SYS_DICTIONARIES
   (DICTIONARIES_ID, 
    NAME, 
    NAME_EN, 
    DICT_CODE, 
    ORDER_BY, 
    PARENT_ID
   )
 Values
   ('9f52be12bef447c28209461827a2ad92', 
    'JDBC', 
    'JDBC', 
    'JDBC', 
    1, 
    '6b7d4036fb3747f28e28a3e24081f5c6');
Insert into SYS_DICTIONARIES
   (DICTIONARIES_ID, 
    NAME, 
    NAME_EN, 
    DICT_CODE, 
    ORDER_BY, 
    PARENT_ID, 
    BZ
   )
 Values
   ('b0d967fb990445f9b00396490e8b54d4', 
    'Sqlserver', 
    'Sqlserver', 
    'sqlserver', 
    3, 
    '729f3ad1db984226b6a921e3df2dadcb', 
    '数据库类型');
Insert into SYS_DICTIONARIES
   (DICTIONARIES_ID, 
    NAME, 
    NAME_EN, 
    DICT_CODE, 
    ORDER_BY, 
    PARENT_ID
   )
 Values
   ('bea14a957cd64991865d0ec9718ee7b4', 
    '军人身份证件', 
    'MilitaryIDCard', 
    '20', 
    12, 
    '3fa59275066842ad8daf54bb8959d24a');
Insert into SYS_DICTIONARIES
   (DICTIONARIES_ID, 
    NAME, 
    NAME_EN, 
    DICT_CODE, 
    ORDER_BY, 
    PARENT_ID
   )
 Values
   ('cd9df52c0ef94c8aa867e5884ec5e7d6', 
    '香港身份证', 
    'HongKongIDCard', 
    'A', 
    7, 
    '3fa59275066842ad8daf54bb8959d24a');
Insert into SYS_DICTIONARIES
   (DICTIONARIES_ID, 
    NAME, 
    NAME_EN, 
    DICT_CODE, 
    ORDER_BY, 
    PARENT_ID, 
    BZ
   )
 Values
   ('d22cd673541e41f489a3cc35d4681c99', 
    'Oracle', 
    'Oracle', 
    'oracle', 
    2, 
    '729f3ad1db984226b6a921e3df2dadcb', 
    '数据库类型');
Insert into SYS_DICTIONARIES
   (DICTIONARIES_ID, 
    NAME, 
    NAME_EN, 
    DICT_CODE, 
    ORDER_BY, 
    PARENT_ID
   )
 Values
   ('dd15667a26784ae9afcf670b17efe61b', 
    '澳门身份证', 
    'MacaoIDCard', 
    'B', 
    8, 
    '3fa59275066842ad8daf54bb8959d24a');
Insert into SYS_DICTIONARIES
   (DICTIONARIES_ID, 
    NAME, 
    NAME_EN, 
    DICT_CODE, 
    ORDER_BY, 
    PARENT_ID
   )
 Values
   ('f271619c4e3c453cb795a720e28861aa', 
    '部门编号', 
    'DeptCode', 
    'DeptCode', 
    5, 
    '0');
Insert into SYS_DICTIONARIES
   (DICTIONARIES_ID, 
    NAME, 
    NAME_EN, 
    DICT_CODE, 
    ORDER_BY, 
    PARENT_ID
   )
 Values
   ('fb0574b1bb6d4197b2305ac23680acd2', 
    '其他证件', 
    'otherIDCard', 
    'X', 
    10, 
    '3fa59275066842ad8daf54bb8959d24a');
COMMIT;
