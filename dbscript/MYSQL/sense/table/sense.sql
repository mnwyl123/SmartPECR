/*
Navicat MySQL Data Transfer

Source Server         : 10.14.0.12
Source Server Version : 50733
Source Host           : 10.14.0.12:3306
Source Database       : sense_hfdb

Target Server Type    : MYSQL
Target Server Version : 50733
File Encoding         : 65001

Date: 2024-02-18 20:24:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_app
-- ----------------------------
DROP TABLE IF EXISTS sys_app;
CREATE TABLE sys_app (
  SYS_IND varchar(32) DEFAULT NULL COMMENT '系统编码',
  NAME varchar(50) DEFAULT NULL COMMENT '系统名称',
  STATUS varchar(2) DEFAULT NULL COMMENT '状态',
  URL varchar(100) DEFAULT NULL COMMENT '系统应用入口地址',
  PICTURE_PATH varchar(100) DEFAULT NULL COMMENT '图片地址',
  S_DESC text COMMENT '系统描述',
  S_CLASSES varchar(5) DEFAULT NULL COMMENT '系统分类',
  IMITATE_URL varchar(100) DEFAULT NULL COMMENT '模拟登陆地址'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='接入系统定义';

-- ----------------------------
-- Records of sys_app
-- ----------------------------

-- ----------------------------
-- Table structure for sys_company
-- ----------------------------
DROP TABLE IF EXISTS sys_company;
CREATE TABLE sys_company (
  COMP_CODE varchar(10) NOT NULL COMMENT '法人代码',
  COMP_SHORT varchar(20) DEFAULT NULL COMMENT '法人简称',
  COMP_NAME varchar(50) DEFAULT NULL COMMENT '法人名称',
  USER_CODE varchar(20) DEFAULT NULL COMMENT '法人管理员',
  LOGO_PATH varchar(100) DEFAULT NULL COMMENT '法人logo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='法人机构表';

-- ----------------------------
-- Records of sys_company
-- ----------------------------
INSERT INTO sys_company VALUES ('hfdb', 'hfdb', '西安鸿飞担保', 'adminhfdb', 'a');

-- ----------------------------
-- Table structure for sys_createcode
-- ----------------------------
DROP TABLE IF EXISTS sys_createcode;
CREATE TABLE sys_createcode (
  CREATECODE_ID varchar(100) NOT NULL,
  PACKAGENAME varchar(50) DEFAULT NULL COMMENT '包名',
  OBJECTNAME varchar(50) DEFAULT NULL COMMENT '类名',
  TABLENAME varchar(50) DEFAULT NULL COMMENT '表名',
  FIELDLIST longtext COMMENT '属性集',
  CREATETIME varchar(100) DEFAULT NULL COMMENT '创建时间',
  TITLE varchar(255) DEFAULT NULL COMMENT '描述',
  MODELNAME varchar(199) DEFAULT NULL COMMENT '模块名'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_createcode
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS sys_dict;
CREATE TABLE sys_dict (
  DIC_CODE varchar(50) NOT NULL COMMENT '字典编码',
  DIC_DES varchar(100) DEFAULT NULL COMMENT '字典名称',
  DIC_TYPE varchar(1) DEFAULT NULL COMMENT '字典类型,0-独立表作为字典;1-字典来源于共同表中定义的特定数据',
  DIC_TBLNAME varchar(30) DEFAULT NULL COMMENT '字典来源表',
  DIC_ID_COLNAME varchar(30) DEFAULT NULL COMMENT '字典对应的过滤条件列',
  DIC_IDVALUE varchar(35) DEFAULT NULL COMMENT '字典列对应的过滤条件列取值',
  DIC_VAL_COLNAME varchar(50) DEFAULT NULL COMMENT '字典列对应的取值列',
  DIC_DES_COLNAME varchar(50) DEFAULT NULL COMMENT '字典列对应的描述列',
  REMARK varchar(100) DEFAULT NULL COMMENT '备注',
  DIC_SORT_COLNAME varchar(30) DEFAULT NULL COMMENT '排序字段',
  DIC_DYNAMIC_SIGN varchar(1) DEFAULT NULL COMMENT '是否动态获取，默认为0。0-非动态获取；1-动态获取；'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO sys_dict VALUES ('menuType', '菜单类型', null, 'SYS_DICTIONARIES', 'PARENT_ID', '45e0a34f25ca4f72b0d8b643fa2ace03', 'DICT_CODE', 'NAME', null, null, null);
INSERT INTO sys_dict VALUES ('DbType', '数据库类型', null, 'SYS_DICTIONARIES', 'PARENT_ID', '729f3ad1db984226b6a921e3df2dadcb', 'DICT_CODE', 'NAME', null, null, null);
INSERT INTO sys_dict VALUES ('ConWay', '连接方式', null, 'SYS_DICTIONARIES', 'PARENT_ID', '6b7d4036fb3747f28e28a3e24081f5c6', 'DICT_CODE', 'NAME', null, null, null);
INSERT INTO sys_dict VALUES ('menuChannel', '菜单渠道', null, 'SYS_DICTIONARIES', 'PARENT_ID', '7c0b914f3f104f2c9c9e14b527057dd9', 'DICT_CODE', 'NAME', null, null, null);
INSERT INTO sys_dict VALUES ('menuGroup', '菜单功能组', null, 'SYS_MENU_FUN_GROUP', null, null, 'FUN_GROUP_ID', 'FUN_GROUP_NAME', null, null, null);
INSERT INTO sys_dict VALUES ('DeptCode', '部门编号', null, 'SYS_DICTIONARIES', 'PARENT_ID', 'f271619c4e3c453cb795a720e28861aa', 'DICT_CODE', 'NAME', null, null, null);
INSERT INTO sys_dict VALUES ('IDType', '证件类型', null, 'SYS_DICTIONARIES', 'PARENT_ID', '3fa59275066842ad8daf54bb8959d24a', 'DICT_CODE', 'NAME', null, null, null);

-- ----------------------------
-- Table structure for sys_dictionaries
-- ----------------------------
DROP TABLE IF EXISTS sys_dictionaries;
CREATE TABLE sys_dictionaries (
  DICTIONARIES_ID varchar(32) NOT NULL,
  NAME varchar(50) DEFAULT NULL COMMENT '名称',
  NAME_EN varchar(50) DEFAULT NULL COMMENT '英文',
  DICT_CODE varchar(10) DEFAULT NULL COMMENT '编码',
  ORDER_BY decimal(11,0) NOT NULL COMMENT '排序',
  PARENT_ID varchar(32) DEFAULT NULL COMMENT '上级ID',
  BZ varchar(100) DEFAULT NULL COMMENT '备注',
  TBSNAME varchar(50) DEFAULT NULL COMMENT '排查表'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典表';

-- ----------------------------
-- Records of sys_dictionaries
-- ----------------------------
INSERT INTO sys_dictionaries VALUES ('0791fbd6d65b44a9b458a5dd227cfc4d', '护照', 'passport', '2', '2', '3fa59275066842ad8daf54bb8959d24a', null, null);
INSERT INTO sys_dictionaries VALUES ('133ec4e639934f6f99a3d89b1d2d9fa6', '基础部', 'baseOrg', '001', '1', 'f271619c4e3c453cb795a720e28861aa', null, null);
INSERT INTO sys_dictionaries VALUES ('13f6ace97df34acbbed387cf7126c948', 'JNDI', 'JNDI', 'JNDI', '1', '6b7d4036fb3747f28e28a3e24081f5c6', null, null);
INSERT INTO sys_dictionaries VALUES ('2127df094acb4bd7b0fc1517cd3b6419', '港澳居民来往内地通行证', 'hongkongandmacaopass', '5', '3', '3fa59275066842ad8daf54bb8959d24a', null, null);
INSERT INTO sys_dictionaries VALUES ('2c76fe1a628c4f0c95ef6fdd59716fce', '居民身份证及其他以公民身份证号码为标识的证件', 'IDCard', '10', '11', '3fa59275066842ad8daf54bb8959d24a', null, null);
INSERT INTO sys_dictionaries VALUES ('313f4cadd5cd4eebac4c87fc7003a2b4', '报表菜单', 'reportMenu', 'MENUTYPE1', '3', '45e0a34f25ca4f72b0d8b643fa2ace03', '菜单类型', null);
INSERT INTO sys_dictionaries VALUES ('3f3a4e0c8a91444cb3c6149613552951', '业务菜单', 'businessMenu', 'MENUTYPE2', '2', '45e0a34f25ca4f72b0d8b643fa2ace03', '菜单类型', null);
INSERT INTO sys_dictionaries VALUES ('3f7dd28c892e48129904b68de0a6d969', '警官证', 'PoliceOfficersCard', '9', '6', '3fa59275066842ad8daf54bb8959d24a', null, null);
INSERT INTO sys_dictionaries VALUES ('3fa59275066842ad8daf54bb8959d24a', '证件类型', 'IDType', 'IDType', '6', '0', null, 'SYS_DICTIONARIES');
INSERT INTO sys_dictionaries VALUES ('45e0a34f25ca4f72b0d8b643fa2ace03', '菜单类型', 'menuType', '001', '1', '0', '菜单类型', null);
INSERT INTO sys_dictionaries VALUES ('52c708ca2b40411cac65a77d599184c3', '系统菜单', 'systemMenu', 'MENUTYPE3', '1', '45e0a34f25ca4f72b0d8b643fa2ace03', '菜单类型', null);
INSERT INTO sys_dictionaries VALUES ('6b7d4036fb3747f28e28a3e24081f5c6', '连接方式', 'ConWay', '111', '3', '0', null, null);
INSERT INTO sys_dictionaries VALUES ('711d040e44bf4f95b76e2009c3349709', '外国人居留证', 'alienResidencePermit', '8', '5', '3fa59275066842ad8daf54bb8959d24a', null, null);
INSERT INTO sys_dictionaries VALUES ('729f3ad1db984226b6a921e3df2dadcb', '数据库类型', 'DbType', '002', '2', '0', '数据库类型', null);
INSERT INTO sys_dictionaries VALUES ('77e496d3ffb94ce0b5c965b391426887', '科技部', 'tecOrg', '002', '2', 'f271619c4e3c453cb795a720e28861aa', null, null);
INSERT INTO sys_dictionaries VALUES ('790ccc8862e243a48986eba6f8263899', 'Mysql', 'mysql', 'mysql', '1', '729f3ad1db984226b6a921e3df2dadcb', '数据库类型', null);
INSERT INTO sys_dictionaries VALUES ('7c0b914f3f104f2c9c9e14b527057dd9', '菜单渠道', 'menuChannel', '1', '4', '0', '菜单渠道，请勿删除', null);
INSERT INTO sys_dictionaries VALUES ('8c270e8ac8f44177b47839ca849b90c6', '台湾身份证', 'taiwanIDCard', 'C', '9', '3fa59275066842ad8daf54bb8959d24a', null, null);
INSERT INTO sys_dictionaries VALUES ('8d0329e54f3d4fef802905dccb4521ed', '户口簿', 'HouseholdRegistrationBook', '1', '1', '3fa59275066842ad8daf54bb8959d24a', null, null);
INSERT INTO sys_dictionaries VALUES ('8de6a1695c4b479d8e658b6fcb331a3f', 'MOBILE菜单', 'MOBILE_MENU', 'MOBILE', '2', '7c0b914f3f104f2c9c9e14b527057dd9', null, null);
INSERT INTO sys_dictionaries VALUES ('8e62c66cd25d436fafbdc0e5ed074555', '台湾同胞来往内地通行证', 'taiwanpass', '6', '4', '3fa59275066842ad8daf54bb8959d24a', null, null);
INSERT INTO sys_dictionaries VALUES ('9bedde2c46f742f5a32bdad334fa290e', 'PC菜单', 'PC_MENU', 'PC', '1', '7c0b914f3f104f2c9c9e14b527057dd9', 'pc菜单', null);
INSERT INTO sys_dictionaries VALUES ('9f52be12bef447c28209461827a2ad92', 'JDBC', 'JDBC', 'JDBC', '1', '6b7d4036fb3747f28e28a3e24081f5c6', null, null);
INSERT INTO sys_dictionaries VALUES ('b0d967fb990445f9b00396490e8b54d4', 'Sqlserver', 'Sqlserver', 'sqlserver', '3', '729f3ad1db984226b6a921e3df2dadcb', '数据库类型', null);
INSERT INTO sys_dictionaries VALUES ('bea14a957cd64991865d0ec9718ee7b4', '军人身份证件', 'MilitaryIDCard', '20', '12', '3fa59275066842ad8daf54bb8959d24a', null, null);
INSERT INTO sys_dictionaries VALUES ('cd9df52c0ef94c8aa867e5884ec5e7d6', '香港身份证', 'HongKongIDCard', 'A', '7', '3fa59275066842ad8daf54bb8959d24a', null, null);
INSERT INTO sys_dictionaries VALUES ('d22cd673541e41f489a3cc35d4681c99', 'Oracle', 'Oracle', 'oracle', '2', '729f3ad1db984226b6a921e3df2dadcb', '数据库类型', null);
INSERT INTO sys_dictionaries VALUES ('dd15667a26784ae9afcf670b17efe61b', '澳门身份证', 'MacaoIDCard', 'B', '8', '3fa59275066842ad8daf54bb8959d24a', null, null);
INSERT INTO sys_dictionaries VALUES ('f271619c4e3c453cb795a720e28861aa', '部门编号', 'DeptCode', 'DeptCode', '5', '0', null, null);
INSERT INTO sys_dictionaries VALUES ('fb0574b1bb6d4197b2305ac23680acd2', '其他证件', 'otherIDCard', 'X', '10', '3fa59275066842ad8daf54bb8959d24a', null, null);

-- ----------------------------
-- Table structure for sys_home_management
-- ----------------------------
DROP TABLE IF EXISTS sys_home_management;
CREATE TABLE sys_home_management (
  MODULE_ID varchar(32) DEFAULT NULL COMMENT '模块Id',
  MODULE_NAME varchar(50) DEFAULT NULL COMMENT '模块名称',
  MODULE_PICTURE varchar(50) DEFAULT NULL COMMENT '模块图片'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='首页管理';

-- ----------------------------
-- Records of sys_home_management
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS sys_menu;
CREATE TABLE sys_menu (
  MENU_ID decimal(11,0) NOT NULL COMMENT '菜单编码',
  MENU_NAME varchar(50) DEFAULT NULL COMMENT '菜单名称',
  MENU_NAME_EN varchar(50) DEFAULT NULL,
  MENU_URL varchar(100) DEFAULT NULL COMMENT '菜单地址',
  PARENT_ID decimal(11,0) DEFAULT NULL COMMENT '上级菜单',
  ORDER_BY varchar(5) DEFAULT NULL COMMENT '菜单排序',
  MENU_ICON varchar(50) DEFAULT NULL COMMENT '菜单图片',
  MENU_TYPE varchar(50) DEFAULT NULL COMMENT '菜单类型',
  MENU_STATE decimal(11,0) DEFAULT NULL COMMENT '菜单状态',
  MENU_GROUP_ID varchar(32) DEFAULT NULL COMMENT '菜单组',
  TRAN_CODE varchar(10) DEFAULT NULL COMMENT '交易码',
  SYS_IND varchar(10) DEFAULT NULL COMMENT '所属系统',
  COMPANY varchar(10) DEFAULT NULL COMMENT '法人机构代码',
  MENU_CHANNEL varchar(10) DEFAULT NULL COMMENT '菜单渠道 PC ,MOBILE等'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO sys_menu VALUES ('65', '个人报送数据补录', null, '#', '24', '1', 'menu-icon fa fa-envelope-o green', 'MENUTYPE3', '1', null, null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('66', '个人数据报送审核', null, '#', '24', '2', 'menu-icon fa fa-gavel green', 'MENUTYPE3', '1', null, null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('67', '报文管理', '', '#', '94', '5', 'menu-icon fa fa-folder-o green', 'MENUTYPE3', '1', '', '', '', 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('69', '个人特殊报文数据', null, '#', '65', '8', 'menu-icon fa fa-folder-o green', 'MENUTYPE3', '1', null, null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('70', '个人数据综合查询', null, '#', '24', '5', 'menu-icon fa fa-desktop green', 'MENUTYPE3', '1', null, null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('71', '个人基本信息记录', null, 'indvBasicsInfo/indvBasicsInfoPage.do', '65', '1', 'menu-icon fa fa-credit-card black', 'MENUTYPE2', '1', 'orgFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('72', '个人证件有效期', null, 'inIDEfctInf/dataPage.do', '65', '5', 'menu-icon fa fa-credit-card black', 'MENUTYPE2', '1', 'orgFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('73', '家族关系信息记录', null, 'inFalMmbsInf/dataPage.do', '65', '6', 'menu-icon fa fa-credit-card black', 'MENUTYPE2', '1', 'orgFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('74', '个人授信协议信息记录', null, 'inCtrctInf/dataPage.do', '65', '4', 'menu-icon fa fa-credit-card black', 'MENUTYPE2', '1', 'orgFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('75', '个人担保账户信息记录', null, 'indvGuarAcctInfo/dataPage.do', '65', '3', 'menu-icon fa fa-credit-card black', 'MENUTYPE2', '1', 'orgFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('76', '个人借贷账户信息记录', null, 'indvLoanAcctInfo/dataPage.do', '65', '2', 'menu-icon fa fa-credit-card black', 'MENUTYPE2', '1', 'orgFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('77', '借贷特殊事件说明', null, 'inSpcEvtDscInf/dataPage.do', '65', '7', 'menu-icon fa fa-credit-card black', 'MENUTYPE2', '1', 'orgFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('78', '个人正常报文生成', null, 'indvNormalMessage/indvNormalMessagePage.do', '67', '1', 'menu-icon fa fa-download black', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('80', '个人特殊报文生成', null, 'indvAbnormalMessage/indvAbnormalMessagePage.do', '67', '2', 'menu-icon fa fa-download black', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('81', '反馈错误处理', null, 'feedbackMessage/dataPage.do', '94', '2', 'menu-icon fa fa-credit-card green', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('82', '个人标识变更', null, 'accountchange/dataPage.do', '69', '1', 'menu-icon fa fa-certificate black', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('83', '个人按段更正', null, '#', '69', '2', 'menu-icon fa fa-certificate black', 'MENUTYPE3', '1', null, null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('84', '个人按段/整笔删除', null, 'delaccount/dataPage.do', '69', '3', 'menu-icon fa fa-certificate black', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('86', '征信参数管理', null, '#', '0', '4', 'menu-icon fa fa-leaf black', 'MENUTYPE2', '1', null, null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('88', '校验规则配置', null, 'checkRule/dataPage.do', '86', '1', 'menu-icon fa fa-cogs green', 'MENUTYPE2', '1', 'orgFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('89', '例子', null, 'example/dataPage.do', '86', '4', 'menu-icon fa fa-leaf black', 'MENUTYPE2', '1', 'orgFunGroup', null, null, 'PB', 'PC');
INSERT INTO sys_menu VALUES ('90', '校验结果查看', null, 'checkResult/dataPage.do?flag=indv', '86', '3', 'menu-icon fa fa-leaf black', 'MENUTYPE2', '1', 'orgFunGroup', null, null, 'PB', 'PC');
INSERT INTO sys_menu VALUES ('91', '个人借贷按段更正 ', null, 'indvProtocol/indvLoanChange.do', '83', '1', 'menu-icon fa fa-leaf black', 'MENUTYPE2', '1', 'orgFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('92', '个人担保按段更正', null, 'indvProtocol/indvGuaranteeChange.do', '83', '2', 'menu-icon fa fa-leaf black', 'MENUTYPE2', '1', 'orgFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('93', '个人授信按段更正', null, 'indvProtocol/indvProtocolChange.do', '83', '3', 'menu-icon fa fa-leaf black', 'MENUTYPE2', '1', 'orgFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('94', '公共模块', null, '#', '0', '5', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', null, null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('95', '抵质押合同信息补录', null, 'motgaInfo/dataPage.do', '209', '1', 'menu-icon fa fa-pencil-square-o black', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('96', '抵质押信息报文生成', null, 'motgaNormalMessage/motgaNormalMessagePage.do', '67', '5', 'menu-icon fa fa-envelope black', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('97', '抵质押特殊报文生成', null, 'motgaAbnormalMessage/motgaAbnormalMessagePage.do', '67', '6', 'menu-icon fa fa-envelope black', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('98', '个人基本信息', null, 'indvBasicsInfoSeo/listPage.do', '70', '1', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('99', '个人证件有效期信息', null, 'inIDEfctInfSeo/listPage.do', '70', '5', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('100', '家族关系信息', null, 'inFalMmbsInfSeo/listPage.do', '70', '6', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('101', '个人授信协议信息', null, 'inCtrctInfSeo/listPage.do', '70', '4', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('102', '个人借贷账户信息', null, 'indvLoanAcctInfoSeo/listPage.do', '70', '2', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('103', '抵（质）押合同信息', null, '#', '94', '1', 'menu-icon fa fa-certificate green', 'MENUTYPE3', '1', null, null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('112', '个人借贷特殊事件', null, 'inSpcEvtDscInfSeo/listPage.do', '70', '7', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('115', '抵（质）押合同信息', null, 'motgaInfoSeo/listPage', '210', '1', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('116', '个人担保账户信息', null, 'indvGuarAcctInfoSeo/listPage.do', '70', '3', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('118', '个人基本审核', null, 'auditing/listPage.do', '66', '1', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('119', '个人借贷审核', null, 'auditing/auditLoanAcct.do', '66', '2', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('120', '个人授信审核', null, 'auditing/auditInCtrctInfo.do', '66', '4', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('127', '抵质押物合同信息审核', null, 'auditing/motgaCltalBsPage.do', '282', '1', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('132', '借贷特殊事件说明审核', null, 'auditing/inSpcEvtDscPage.do', '66', '7', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('133', '个人证件有效期审核', null, 'auditing/inIDEfctPage.do', '66', '5', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('134', '家族关系审核', null, 'auditing/inFalMmbsPage.do', '66', '6', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('136', '个人担保审核', null, 'auditing/guarAcctInfo.do', '66', '3', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('137', '个人标识变更审核', null, 'auditing/accounChangePage.do', '66', '8', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('138', '个人按段/整笔删除审核', null, 'auditing/auditDelAccounChangePage.do', '66', '9', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('139', '个人借贷按段更正审核', '', 'auditing/auditIndvLoanChangePage.do', '66', '90', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', 'orgFunGroup', '', '', 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('140', '个人授信按段更正审核', '', 'auditing/auditIndvProtocolChangePage.do', '66', '92', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', 'orgFunGroup', '', '', 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('141', '个人担保按段更正审核', '', 'auditing/auditIndvGuaranteeChange.do', '66', '91', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', 'orgFunGroup', '', '', 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('142', '抵质押物标识变更审核', null, 'auditing/auditMotgaChange.do', '282', '2', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('143', '抵质押物整笔删除审核', null, 'auditing/auditMotgaDel.do', '282', '3', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('200', '模拟两端核对', null, 'bothcheck/checkList.do', '207', '1', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('201', '模拟两端核对报文生成', null, 'bothcheck/packList.do', '207', '2', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('202', '异议处理结果登记', null, 'objFeedBack/list.do', '208', '1', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('203', '异议信息统计', null, 'objStatistics/list.do', '208', '2', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('206', '校验结果查询', ' ', 'dataCheckInfo/dataCheckInfo.do', '94', '3', 'menu-icon fa fa-external-link green', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('207', '模拟两端核对', null, '#', '94', '5', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', null, null, null, 'PB', 'PC');
INSERT INTO sys_menu VALUES ('208', '异议信息处理', null, '#', '94', '6', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', null, null, null, 'PB', 'PC');
INSERT INTO sys_menu VALUES ('209', '抵质押数据补录', null, '#', '103', '1', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', null, null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('210', '抵质押数据综合查询', null, '#', '103', '4', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', null, null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('211', '抵质押报文管理', null, '#', '103', '3', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', null, null, null, 'PB', 'PC');
INSERT INTO sys_menu VALUES ('212', '标识变更综合查询', ' ', 'accountchangeSeo/listPage.do', '223', '8', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('213', '借贷按段更正查询', ' ', 'indvLoanAcctInfoSeo/listPageForUpdate.do', '225', '9', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('214', '担保按段更正查询', ' ', 'indvGuarAcctInfoSeo/listPageForUpdate.do', '225', '10', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('215', '授信按段更正查询', ' ', 'inCtrctInfSeo/listPageForUpdate.do', '225', '11', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('216', '按段/整笔删除查询', ' ', 'delaccountSeo/listPage.do', '223', '12', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('218', '征信报送白名单', null, 'baiming/listPage.do', '94', '7', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'PB', 'PC');
INSERT INTO sys_menu VALUES ('223', '个人更正数据综合查询', ' ', '#', '24', '6', 'menu-icon fa fa-desktop red', 'MENUTYPE3', '1', null, null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('225', '按段更正综合查询', ' ', '#', '223', '10', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', null, null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('226', '企业财报查询', null, 'entFinStaSeo/listPage.do', '222', '4', 'menu-icon fa fa-leaf black', 'MENUTYPE2', '1', 'orgFunGroup', null, null, 'PB', 'PC');
INSERT INTO sys_menu VALUES ('229', '抵质押特殊综合查询', null, '#', '103', '5', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', null, null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('230', '抵质押整笔删除', null, 'moDelSeo/listPage.do', '229', '2', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('231', '抵质押标识变更', null, 'moChangeSeo/listPage.do', '229', '1', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('232', '回执规则配置', null, 'Rule/dataPage.do', '86', '2', 'menu-icon fa fa-leaf black', 'MENUTYPE2', '1', 'orgFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('233', '抵质押信息特殊补录', null, '#', '211', '5', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', null, null, null, 'PB', 'PC');
INSERT INTO sys_menu VALUES ('234', '抵质押合同信息标识变更', null, 'moChange/dataPage.do', '209', '2', 'menu-icon fa fa-pencil-square-o black', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('235', '抵质押合同信息整笔删除', null, 'moDel/dataPage.do', '209', '3', 'menu-icon fa fa-pencil-square-o black', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('240', '逾期短信通知详情', null, 'indvTextMsgInform/dataPage.do', '67', '9', 'menu-icon fa fa-download black', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'PB', 'PC');
INSERT INTO sys_menu VALUES ('242', '企业正常报文下载', null, 'indvMessageDownLoad/entDataPage.do', '37', '2', 'menu-icon fa fa-leaf black', 'MENUTYPE2', '1', 'orgFunGroup', null, null, 'PB', 'PC');
INSERT INTO sys_menu VALUES ('243', '报文下载', null, 'indvMessageDownLoad/reportMessageDataPage.do', '67', '7', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('244', '抵质押特殊报文下载', null, 'indvMessageDownLoad/moSpDataPage.do', '211', '4', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'PB', 'PC');
INSERT INTO sys_menu VALUES ('245', '抵质押正常报文下载', null, 'indvMessageDownLoad/moDataPage.do', '211', '2', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'PB', 'PC');
INSERT INTO sys_menu VALUES ('246', '个人特殊报文下载', null, 'indvMessageDownLoad/indvSpDataPage.do', '67', '4', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'PB', 'PC');
INSERT INTO sys_menu VALUES ('247', '企业特殊报文下载', null, 'indvMessageDownLoad/entSpDataPage.do', '37', '5', 'menu-icon fa fa-leaf black', 'MENUTYPE2', '1', 'orgFunGroup', null, null, 'PB', 'PC');
INSERT INTO sys_menu VALUES ('249', '个人征信异议处理', ' ', '#', '24', '8', 'menu-icon fa fa-leaf green', 'MENUTYPE3', '1', null, null, null, 'PB', 'PC');
INSERT INTO sys_menu VALUES ('262', '征信中心客户处理', ' ', '#', '249', '1', 'menu-icon fa fa-leaf green', 'MENUTYPE3', '1', null, null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('263', '非征信中心客户处理', ' ', '#', '249', '2', 'menu-icon fa fa-leaf green', 'MENUTYPE3', '1', null, null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('264', '异议登记', ' ', 'IndvObjection/dataPageIndvObjectionRegiste.do', '263', '1', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('265', '资料核查', ' ', 'IndvObjection/dataPageIndvObjectionCheck.do', '263', '2', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('266', '异议审核', ' ', 'IndvObjection/dataPageIndvObjectionReview.do', '263', '3', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('267', '异议审批', ' ', 'IndvObjection/dataPageIndvObjectionApprove.do', '263', '4', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('268', '异议更正', ' ', 'IndvObjection/dataPageIndvObjectionCorrect.do', '263', '5', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('278', '个人综合异议处理', ' ', 'indvObjWebService/dataPageCreditCenterObjection.do', '262', '1', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('279', '企业征信异议处理', null, '#', '23', '7', 'menu-icon fa fa-leaf black', 'MENUTYPE2', '1', null, null, null, 'PB', 'PC');
INSERT INTO sys_menu VALUES ('280', '征信中心客户处理', null, '#', '279', '1', 'menu-icon fa fa-leaf black', 'MENUTYPE2', '1', null, null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('281', '企业综合异议处理', null, 'entObjWebService/dataPageCreditCenterObjection.do', '280', '1', 'menu-icon fa fa-leaf black', 'MENUTYPE2', '1', 'orgFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('282', '抵质押数据审核', null, '#', '103', '2', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', null, null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('1', '系统管理', null, '#', '0', '1', 'menu-icon fa fa-adjust black', 'MENUTYPE3', '1', null, null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('2', '在线管理', null, 'onlinemanager/list.do?menuId=2', '1', '1', 'menu-icon fa fa-laptop green', 'MENUTYPE3', '1', 'onLineGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('3', '字典维护', null, 'dictmtance/list.do?menuId=3', '1', '2', 'menu-icon fa fa-book black', 'MENUTYPE3', '1', 'dictFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('4', '数据字典', null, 'dictionaries/listAllDict.do?menuId=4', '1', '3', 'menu-icon fa fa-book purple', 'MENUTYPE3', '1', 'dictFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('5', '机构管理', null, 'org/listAllDepartment.do?menuId=5', '1', '4', 'menu-icon fa fa-key orange', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('6', '角色管理', null, 'role/roleList.do?menuId=6', '1', '5', 'menu-icon fa fa-key orange', 'MENUTYPE3', '1', 'roleFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('7', '用户管理', null, 'user/listUsers.do?menuId=7', '1', '6', 'menu-icon fa fa-heart-o black', 'MENUTYPE3', '1', 'userFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('8', '菜单管理', null, 'menu/listAllMenu.do?menuId=8', '1', '7', 'menu-icon fa fa-folder-o black', 'MENUTYPE3', '1', 'menuFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('9', '菜单功能组', null, 'menuGroup/list.do?menuId=9', '1', '8', 'menu-icon fa fa-folder-open-o brown', 'MENUTYPE3', '1', 'menuGGroupFun', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('10', '密码规则配置', null, 'pwdRuleConfig/list.do?menuId=10', '1', '9', 'menu-icon fa fa-lock black', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('11', '法人菜单', null, '#', '0', '1', 'menu-icon fa fa-book black', 'MENUTYPE3', '1', null, null, null, 'super', 'PC');
INSERT INTO sys_menu VALUES ('12', '法人维护', null, '#', '0', '2', 'menu-icon fa fa-book black', 'MENUTYPE3', '1', null, null, null, 'super', 'PC');
INSERT INTO sys_menu VALUES ('13', '法人维护', null, 'company/listCompany.do?menuId=13', '12', '1', 'menu-icon fa fa-users blue', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'super', 'PC');
INSERT INTO sys_menu VALUES ('14', '法人菜单', null, 'menu/listAllMenu.do?menuId=8', '11', '1', 'menu-icon fa fa-key orange', 'MENUTYPE3', '1', 'menuFunGroup', null, null, 'super', 'PC');
INSERT INTO sys_menu VALUES ('15', '系统工具', null, '#', '0', '2', 'menu-icon fa fa-cog black', 'MENUTYPE3', '0', null, null, null, 'PB', 'PC');
INSERT INTO sys_menu VALUES ('16', '代码生成器', null, '#', '15', '1', 'menu-icon fa fa-cogs brown', 'MENUTYPE3', '0', null, null, null, 'PB', 'PC');
INSERT INTO sys_menu VALUES ('17', '正向生成', null, 'createCode/list.do?menuId=17', '12', '1', 'menu-icon fa fa-exclamation-circle black', 'MENUTYPE3', '1', 'sysToolGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('18', '反向生成', null, 'recreateCode/list.do?menuId=18', '12', '2', 'menu-icon fa fa-cogs blue', 'MENUTYPE3', '1', 'sysToolGroup', null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('19', '打印测试', null, 'tool/printTest.do?menuId=19', '15', '2', 'menu-icon fa fa-hdd-o grey', 'MENUTYPE3', '0', 'sysToolGroup', null, null, 'PB', 'PC');
INSERT INTO sys_menu VALUES ('20', '图片管理', null, 'pictures/list.do?menuId=20', '15', '3', 'menu-icon fa fa-folder-open-o green', 'MENUTYPE3', '0', 'pictureFunGroup', null, null, 'PB', 'PC');
INSERT INTO sys_menu VALUES ('21', '日志查询', null, '#', '0', '3', 'menu-icon fa fa-bar-chart-o black', 'MENUTYPE3', '0', null, null, null, 'PB', 'PC');
INSERT INTO sys_menu VALUES ('22', '操作日志查询', null, 'operation/list.do?menuId=22', '21', '1', 'menu-icon fa fa-folder-open-o green', 'MENUTYPE3', '0', 'operationFunGroup', null, null, 'PB', 'PC');
INSERT INTO sys_menu VALUES ('24', '个人征信报送', null, '#', '0', '7', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', null, null, null, 'hfdb', 'PC');
INSERT INTO sys_menu VALUES ('37', '企业报文管理', null, '#', '23', '3', 'menu-icon fa fa-folder-o green', 'MENUTYPE2', '1', null, null, null, 'PB', 'PC');
INSERT INTO sys_menu VALUES ('283', '数据加载', '', 'dataLoad/dataPage.do', '94', '4', 'menu-icon fa fa-leaf black', 'MENUTYPE2', '1', 'orgFunGroup', '', '', 'hfdb', 'PC');

-- ----------------------------
-- Table structure for sys_menu_20220623
-- ----------------------------
DROP TABLE IF EXISTS sys_menu_20220623;
CREATE TABLE sys_menu_20220623 (
  MENU_ID decimal(11,0) NOT NULL COMMENT '菜单编码',
  MENU_NAME varchar(50) DEFAULT NULL COMMENT '菜单名称',
  MENU_NAME_EN varchar(50) DEFAULT NULL,
  MENU_URL varchar(100) DEFAULT NULL COMMENT '菜单地址',
  PARENT_ID decimal(11,0) DEFAULT NULL COMMENT '上级菜单',
  ORDER_BY varchar(5) DEFAULT NULL COMMENT '菜单排序',
  MENU_ICON varchar(50) DEFAULT NULL COMMENT '菜单图片',
  MENU_TYPE varchar(50) DEFAULT NULL COMMENT '菜单类型',
  MENU_STATE decimal(11,0) DEFAULT NULL COMMENT '菜单状态',
  MENU_GROUP_ID varchar(32) DEFAULT NULL COMMENT '菜单组',
  TRAN_CODE varchar(10) DEFAULT NULL COMMENT '交易码',
  SYS_IND varchar(10) DEFAULT NULL COMMENT '所属系统',
  COMPANY varchar(10) DEFAULT NULL COMMENT '法人机构代码',
  MENU_CHANNEL varchar(10) DEFAULT NULL COMMENT '菜单渠道 PC ,MOBILE等'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu_20220623
-- ----------------------------
INSERT INTO sys_menu_20220623 VALUES ('13', '法人维护', null, 'company/listCompany.do?menuId=13', '12', '1', 'menu-icon fa fa-users blue', 'MENUTYPE3', '1', null, null, null, 'super', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('14', '法人菜单', null, 'menu/listAllMenu.do?menuId=8', '11', '1', 'menu-icon fa fa-key orange', 'MENUTYPE3', '1', 'menuFunGroup', null, null, 'super', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('15', '系统工具', null, '#', '0', '2', 'menu-icon fa fa-cog black', 'MENUTYPE3', '0', null, null, null, 'PB', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('16', '代码生成器', null, '#', '15', '1', 'menu-icon fa fa-cogs brown', 'MENUTYPE3', '0', null, null, null, 'PB', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('17', '正向生成', null, 'createCode/list.do?menuId=17', '12', '1', 'menu-icon fa fa-exclamation-circle black', 'MENUTYPE3', '1', 'sysToolGroup', null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('18', '反向生成', null, 'recreateCode/list.do?menuId=18', '12', '2', 'menu-icon fa fa-cogs blue', 'MENUTYPE3', '1', 'sysToolGroup', null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('19', '打印测试', null, 'tool/printTest.do?menuId=19', '15', '2', 'menu-icon fa fa-hdd-o grey', 'MENUTYPE3', '0', 'sysToolGroup', null, null, 'PB', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('20', '图片管理', null, 'pictures/list.do?menuId=20', '15', '3', 'menu-icon fa fa-folder-open-o green', 'MENUTYPE3', '0', 'pictureFunGroup', null, null, 'PB', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('21', '日志查询', null, '#', '0', '3', 'menu-icon fa fa-bar-chart-o black', 'MENUTYPE3', '0', null, null, null, 'PB', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('22', '操作日志查询', null, 'operation/list.do?menuId=22', '21', '1', 'menu-icon fa fa-folder-open-o green', 'MENUTYPE3', '0', 'operationFunGroup', null, null, 'PB', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('24', '个人征信报送', null, '#', '0', '7', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', null, null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('38', '报文生成', null, 'entNormalMessage/entNormalMessagePage.do?menuId=38', '37', '1', 'menu-icon fa fa-download black', 'MENUTYPE2', '1', null, null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('40', '反馈回执管理', null, '#', '23', '4', 'menu-icon fa fa-external-link green', 'MENUTYPE2', '1', null, null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('41', '反馈回执详情', null, 'feedbackMessage/dataPage.do', '40', '1', 'menu-icon fa fa-leaf black', 'MENUTYPE2', '1', null, null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('52', '借贷账户按段更正', null, 'entUpDaccountData/entLoanChangeList.do', '45', '1', 'menu-icon fa fa-cogs black', 'MENUTYPE2', '1', null, null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('53', '担保账户按段更正', null, 'entUpDaccountData/entGuaranteeChange.do', '45', '2', 'menu-icon fa fa-cogs black', 'MENUTYPE2', '1', null, null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('54', '授信协议按段更正', null, 'entUpDaccountData/entProtocolChange.do', '45', '3', 'menu-icon fa fa-cogs black', 'MENUTYPE2', '1', null, null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('65', '个人报送数据补录', null, '#', '24', '1', 'menu-icon fa fa-envelope-o green', 'MENUTYPE3', '1', null, null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('67', '个人报文管理', null, '#', '24', '3', 'menu-icon fa fa-folder-o green', 'MENUTYPE3', '1', null, null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('68', '反馈回执处理', null, '#', '24', '4', 'menu-icon fa fa-external-link green', 'MENUTYPE3', '1', null, null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('69', '个人特殊报文数据', null, '#', '67', '3', 'menu-icon fa fa-folder-o green', 'MENUTYPE3', '1', null, null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('70', '个人综合数据查询', null, '#', '24', '5', 'menu-icon fa fa-desktop green', 'MENUTYPE3', '1', null, null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('71', '个人基本信息记录', null, 'indvBasicsInfo/indvBasicsInfoPage.do', '65', '1', 'menu-icon fa fa-credit-card black', 'MENUTYPE2', '1', null, null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('72', '个人证件有效期', null, 'inIDEfctInf/dataPage.do', '65', '2', 'menu-icon fa fa-credit-card black', 'MENUTYPE2', '1', 'menuGGroupFun', null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('73', '家族关系信息记录', null, 'inFalMmbsInf/dataPage.do', '65', '3', 'menu-icon fa fa-credit-card black', 'MENUTYPE2', '1', 'menuGGroupFun', null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('74', '个人授信协议信息记录', null, 'inCtrctInf/dataPage.do', '65', '4', 'menu-icon fa fa-credit-card black', 'MENUTYPE2', '1', null, null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('75', '个人担保账户信息记录', null, 'indvGuarAcctInfo/dataPage.do', '65', '5', 'menu-icon fa fa-credit-card black', 'MENUTYPE2', '1', null, null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('76', '个人借贷账户信息记录', null, 'indvLoanAcctInfo/dataPage.do', '65', '6', 'menu-icon fa fa-credit-card black', 'MENUTYPE2', '1', null, null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('77', '借贷特殊事件说明', null, 'inSpcEvtDscInf/dataPage.do', '65', '7', 'menu-icon fa fa-credit-card black', 'MENUTYPE2', '1', 'menuGGroupFun', null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('78', '正常报文生成', null, 'indvNormalMessage/indvNormalMessagePage.do', '67', '1', 'menu-icon fa fa-download black', 'MENUTYPE3', '1', null, null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('80', '个人特殊报文生成', null, 'indvAbnormalMessage/indvAbnormalMessagePage.do', '67', '4', 'menu-icon fa fa-download black', 'MENUTYPE3', '1', null, null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('82', '个人标识变更', null, 'accountchange/dataPage.do', '69', '1', 'menu-icon fa fa-certificate black', 'MENUTYPE3', '1', null, null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('83', '个人按段更正', null, '#', '69', '2', 'menu-icon fa fa-certificate black', 'MENUTYPE3', '1', null, null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('84', '个人按段/整笔删除', null, 'delaccount/dataPage.do', '69', '3', 'menu-icon fa fa-certificate black', 'MENUTYPE3', '1', null, null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('86', '征信参数管理', null, '#', '0', '4', 'menu-icon fa fa-leaf black', 'MENUTYPE2', '1', null, null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('88', '校验规则配置', null, 'checkRule/dataPage.do', '86', '1', 'menu-icon fa fa-cogs green', 'MENUTYPE2', '1', null, null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('89', '例子', null, 'example/dataPage.do', '86', '4', 'menu-icon fa fa-leaf black', 'MENUTYPE2', '1', null, null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('90', '校验结果查看', null, 'checkResult/dataPage.do?flag=indv', '86', '3', 'menu-icon fa fa-leaf black', 'MENUTYPE2', '1', null, null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('91', '个人借贷按段更正 ', null, 'indvProtocol/indvLoanChange.do', '83', '1', 'menu-icon fa fa-leaf black', 'MENUTYPE2', '1', null, null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('92', '个人担保按段更正', null, 'indvProtocol/indvGuaranteeChange.do', '83', '2', 'menu-icon fa fa-leaf black', 'MENUTYPE2', '1', null, null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('93', '个人授信按段更正', null, 'indvProtocol/indvProtocolChange.do', '83', '3', 'menu-icon fa fa-leaf black', 'MENUTYPE2', '1', null, null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('94', '公共模块', null, '#', '0', '5', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', null, null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('98', '个人基本信息', null, 'indvBasicsInfoSeo/listPage.do', '70', '1', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', null, null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('99', '个人证件有效期信息', null, 'inIDEfctInfSeo/listPage.do', '70', '2', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', null, null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('100', '家族关系信息', null, 'inFalMmbsInfSeo/listPage.do', '70', '3', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', null, null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('101', '个人授信协议信息', null, 'inCtrctInfSeo/listPage.do', '70', '4', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', null, null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('102', '个人借贷账户信息', null, 'indvLoanAcctInfoSeo/listPage.do', '70', '6', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', null, null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('108', ' 企业利润及利润分配', null, 'entIncomeInfoSeo/listPage.do', '64', '5', 'menu-icon fa fa-leaf black', 'MENUTYPE2', '1', null, null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('112', '个人借贷特殊事件', null, 'inSpcEvtDscInfSeo/listPage.do', '70', '7', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', null, null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('116', '个人担保账户信息', null, 'indvGuarAcctInfoSeo/listPage.do', '70', '5', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', null, null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('200', '模拟两端核对', null, 'bothcheck/checkList.do', '207', '1', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', null, null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('201', '模拟两端核对报文生成', null, 'bothcheck/packList.do', '207', '2', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', null, null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('202', '异议处理结果登记', null, 'objFeedBack/list.do', '208', '1', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', null, null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('203', '异议信息统计', null, 'objStatistics/list.do', '208', '2', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', null, null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('204', '校验结果查询', ' ', '#', '94', '3', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', null, null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('205', '反馈回执详情', ' ', 'feedbackMessage/dataPage.do', '103', '9', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', null, null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('206', '校验结果查询', ' ', 'dataCheckInfo/dataCheckInfo.do', '204', '1', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', null, null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('207', '模拟两端核对', null, '#', '94', '4', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', null, null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('208', '异议信息处理', null, '#', '94', '5', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', null, null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('212', '标识变更综合查询', ' ', 'accountchangeSeo/listPage.do', '223', '8', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', null, null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('213', '借贷按段更正查询', ' ', 'indvLoanAcctInfoSeo/listPageForUpdate.do', '225', '9', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', null, null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('232', '回执规则配置', null, 'Rule/dataPage.do', '86', '2', 'menu-icon fa fa-leaf black', 'MENUTYPE2', '1', null, null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('240', '逾期短信通知详情', null, 'indvTextMsgInform/dataPage.do', '67', '5', 'menu-icon fa fa-download black', 'MENUTYPE3', '1', null, null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('243', '正常报文下载', null, 'indvMessageDownLoad/indvDataPage.do', '67', '2', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', null, null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('246', '特殊报文下载', null, 'indvMessageDownLoad/indvSpDataPage.do', '67', '6', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', null, null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('81', '反馈回执详情', null, 'feedbackMessage/dataPage.do', '68', '1', 'menu-icon fa fa-credit-card black', 'MENUTYPE3', '1', null, null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('1', '系统管理', null, '#', '0', '1', 'menu-icon fa fa-adjust black', 'MENUTYPE3', '1', null, null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('2', '在线管理', null, 'onlinemanager/list.do?menuId=2', '1', '1', 'menu-icon fa fa-laptop green', 'MENUTYPE3', '1', 'onLineGroup', null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('3', '字典维护', null, 'dictmtance/list.do?menuId=3', '1', '2', 'menu-icon fa fa-book black', 'MENUTYPE3', '1', 'dictFunGroup', null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('4', '数据字典', null, 'dictionaries/listAllDict.do?menuId=4', '1', '3', 'menu-icon fa fa-book purple', 'MENUTYPE3', '1', 'dictFunGroup', null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('5', '机构管理', null, 'org/listAllDepartment.do?menuId=5', '1', '4', 'menu-icon fa fa-key orange', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('6', '角色管理', null, 'role/roleList.do?menuId=6', '1', '5', 'menu-icon fa fa-key orange', 'MENUTYPE3', '1', 'roleFunGroup', null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('7', '用户管理', null, 'user/listUsers.do?menuId=7', '1', '6', 'menu-icon fa fa-heart-o black', 'MENUTYPE3', '1', 'userFunGroup', null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('8', '菜单管理', null, 'menu/listAllMenu.do?menuId=8', '1', '7', 'menu-icon fa fa-folder-o black', 'MENUTYPE3', '1', 'menuFunGroup', null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('9', '菜单功能组', null, 'menuGroup/list.do?menuId=9', '1', '8', 'menu-icon fa fa-folder-open-o brown', 'MENUTYPE3', '1', 'menuGGroupFun', null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('10', '密码规则配置', null, 'pwdRuleConfig/list.do?menuId=10', '1', '9', 'menu-icon fa fa-lock black', 'MENUTYPE3', '1', 'pwdFunGroup', null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('11', '法人菜单', null, '#', '0', '1', 'menu-icon fa fa-book black', 'MENUTYPE3', '1', null, null, null, 'super', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('12', '法人维护', null, '#', '0', '2', 'menu-icon fa fa-book black', 'MENUTYPE3', '1', null, null, null, 'super', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('214', '担保按段更正查询', ' ', 'indvGuarAcctInfoSeo/listPageForUpdate.do', '225', '10', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', null, null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('215', '授信按段更正查询', ' ', 'inCtrctInfSeo/listPageForUpdate.do', '225', '11', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', null, null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('216', '按段/整笔删除查询', ' ', 'delaccountSeo/listPage.do', '223', '12', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', null, null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('218', '征信报送白名单', null, 'baiming/listPage.do', '94', '6', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', null, null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('223', '个人更正数据综合查询', ' ', '#', '24', '6', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', null, null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('225', '按段更正综合查询', ' ', '#', '223', '10', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', null, null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('66', '个人数据报送审核', null, '#', '24', '2', 'menu-icon fa fa-gavel green', 'MENUTYPE3', '1', null, null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('118', '个人基本审核', null, 'auditing/listPage.do', '66', '1', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('119', '个人借贷审核', null, 'auditing/auditLoanAcct.do', '66', '2', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('120', '个人授信审核', null, 'auditing/auditInCtrctInfo.do', '66', '4', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('133', '个人证件有效期审核', null, 'auditing/inIDEfctPage.do', '66', '5', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('136', '个人担保审核', null, 'auditing/guarAcctInfo.do', '66', '3', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('137', '个人标识变更审核', null, 'auditing/accounChangePage.do', '66', '8', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('138', '个人按段/整笔删除审核', null, 'auditing/auditDelAccounChangePage.do', '66', '9', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('139', '个人借贷按段更正审核', null, 'auditing/auditIndvLoanChangePage.do', '66', '90', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('140', '个人授信按段更正审核', null, 'auditing/auditIndvProtocolChangePage.do', '66', '92', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('141', '个人担保按段更正审核', null, 'auditing/auditIndvGuaranteeChange.do', '66', '91', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'ALL', 'PC');
INSERT INTO sys_menu_20220623 VALUES ('134', '家族关系审核', null, 'auditing/inFalMmbsPage.do', '66', '6', 'menu-icon fa fa-leaf black', 'MENUTYPE3', '1', 'orgFunGroup', null, null, 'ALL', 'PC');

-- ----------------------------
-- Table structure for sys_menu_fun
-- ----------------------------
DROP TABLE IF EXISTS sys_menu_fun;
CREATE TABLE sys_menu_fun (
  FUN_GROUP_ID varchar(32) NOT NULL COMMENT '功能组编码',
  FUN_ID varchar(32) NOT NULL COMMENT '功能编码',
  FUN_NAME varchar(50) DEFAULT NULL COMMENT '功能名称',
  FUN_NAME_EN varchar(50) DEFAULT NULL COMMENT '功能英文名称',
  FUN_DESC varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单功能明细表';

-- ----------------------------
-- Records of sys_menu_fun
-- ----------------------------
INSERT INTO sys_menu_fun VALUES ('dictFunGroup', 'add', '增加', null, null);
INSERT INTO sys_menu_fun VALUES ('dictFunGroup', 'batchDelete', '批量删除', null, null);
INSERT INTO sys_menu_fun VALUES ('dictFunGroup', 'delete', '删除', null, null);
INSERT INTO sys_menu_fun VALUES ('dictFunGroup', 'edit', '修改', null, null);
INSERT INTO sys_menu_fun VALUES ('dictFunGroup', 'query', '查看', null, null);
INSERT INTO sys_menu_fun VALUES ('dictFunGroup', 'refresh', '刷新', null, null);
INSERT INTO sys_menu_fun VALUES ('menuFunGroup', 'add', '增加', null, null);
INSERT INTO sys_menu_fun VALUES ('menuFunGroup', 'delete', '删除', null, null);
INSERT INTO sys_menu_fun VALUES ('menuFunGroup', 'edit', '修改', null, null);
INSERT INTO sys_menu_fun VALUES ('menuFunGroup', 'editIcon', '编辑图片', null, null);
INSERT INTO sys_menu_fun VALUES ('menuFunGroup', 'query', '查看', null, null);
INSERT INTO sys_menu_fun VALUES ('menuGGroupFun', 'add', '增加', null, null);
INSERT INTO sys_menu_fun VALUES ('menuGGroupFun', 'batchDelete', '批量删除', null, null);
INSERT INTO sys_menu_fun VALUES ('menuGGroupFun', 'delete', '删除', null, null);
INSERT INTO sys_menu_fun VALUES ('menuGGroupFun', 'downLoad', '导出', null, null);
INSERT INTO sys_menu_fun VALUES ('menuGGroupFun', 'edit', '修改', null, null);
INSERT INTO sys_menu_fun VALUES ('menuGGroupFun', 'query', '查看', null, null);
INSERT INTO sys_menu_fun VALUES ('onLineGroup', 'batchDelete', '批量下线', null, null);
INSERT INTO sys_menu_fun VALUES ('onLineGroup', 'forceUp', '强制下线', null, '111');
INSERT INTO sys_menu_fun VALUES ('onLineGroup', 'query', '查看', null, null);
INSERT INTO sys_menu_fun VALUES ('operationFunGroup', 'downLoad', '导出', null, null);
INSERT INTO sys_menu_fun VALUES ('operationFunGroup', 'query', '查看', null, null);
INSERT INTO sys_menu_fun VALUES ('orgFunGroup', 'add', '增加', null, null);
INSERT INTO sys_menu_fun VALUES ('orgFunGroup', 'delete', '删除', null, null);
INSERT INTO sys_menu_fun VALUES ('orgFunGroup', 'edit', '修改', null, null);
INSERT INTO sys_menu_fun VALUES ('orgFunGroup', 'query', '查看', null, null);
INSERT INTO sys_menu_fun VALUES ('pictureFunGroup', 'add', '增加', null, 'zcz');
INSERT INTO sys_menu_fun VALUES ('pictureFunGroup', 'batchDelete', '批量删除', null, null);
INSERT INTO sys_menu_fun VALUES ('pictureFunGroup', 'delete', '删除', null, null);
INSERT INTO sys_menu_fun VALUES ('pictureFunGroup', 'edit', '修改', null, null);
INSERT INTO sys_menu_fun VALUES ('pictureFunGroup', 'query', '查看', null, null);
INSERT INTO sys_menu_fun VALUES ('roleFunGroup', 'add', '增加', null, null);
INSERT INTO sys_menu_fun VALUES ('roleFunGroup', 'delete', '删除', null, null);
INSERT INTO sys_menu_fun VALUES ('roleFunGroup', 'edit', '修改', null, null);
INSERT INTO sys_menu_fun VALUES ('roleFunGroup', 'editRights', '编辑权限', null, null);
INSERT INTO sys_menu_fun VALUES ('roleFunGroup', 'query', '查看', null, null);
INSERT INTO sys_menu_fun VALUES ('sysToolGroup', 'add', '增加', null, null);
INSERT INTO sys_menu_fun VALUES ('sysToolGroup', 'batchDelete', '批量删除', null, null);
INSERT INTO sys_menu_fun VALUES ('sysToolGroup', 'delete', '删除', null, null);
INSERT INTO sys_menu_fun VALUES ('sysToolGroup', 'edit', '修改', null, null);
INSERT INTO sys_menu_fun VALUES ('sysToolGroup', 'query', '查看', null, null);
INSERT INTO sys_menu_fun VALUES ('sysToolGroup', 'startButton', '启动生成器', null, null);
INSERT INTO sys_menu_fun VALUES ('userFunGroup', 'add', '增加', null, null);
INSERT INTO sys_menu_fun VALUES ('userFunGroup', 'authorg', '授权机构', null, null);
INSERT INTO sys_menu_fun VALUES ('userFunGroup', 'authrole', '授权角色', null, null);
INSERT INTO sys_menu_fun VALUES ('userFunGroup', 'batchDetele', '批量删除', null, null);
INSERT INTO sys_menu_fun VALUES ('userFunGroup', 'delete', '删除', null, null);
INSERT INTO sys_menu_fun VALUES ('userFunGroup', 'downLoad', '导出', null, null);
INSERT INTO sys_menu_fun VALUES ('userFunGroup', 'edit', '修改', null, null);
INSERT INTO sys_menu_fun VALUES ('userFunGroup', 'query', '查询', null, null);
INSERT INTO sys_menu_fun VALUES ('userFunGroup', 'sendSms', '站内信', null, null);
INSERT INTO sys_menu_fun VALUES ('userFunGroup', 'unLock', '解锁重置密码', 'unLock', '解锁重置密码');
INSERT INTO sys_menu_fun VALUES ('userFunGroup', 'upLoad', '导入', null, null);
INSERT INTO sys_menu_fun VALUES ('schParamFunGroup', 'add', '新增', 'add', null);
INSERT INTO sys_menu_fun VALUES ('schParamFunGroup', 'AllExport', '全量导出', 'AllExport', null);
INSERT INTO sys_menu_fun VALUES ('schParamFunGroup', 'batchDelete', '批量删除', 'batchDelete', null);
INSERT INTO sys_menu_fun VALUES ('schParamFunGroup', 'delete', '删除', 'delete', null);
INSERT INTO sys_menu_fun VALUES ('schParamFunGroup', 'edit', '修改', 'query', null);
INSERT INTO sys_menu_fun VALUES ('schParamFunGroup', 'export', '导出', 'export', null);
INSERT INTO sys_menu_fun VALUES ('schParamFunGroup', 'http', 'http链接测试', 'http', null);
INSERT INTO sys_menu_fun VALUES ('schParamFunGroup', 'import', '导入', 'import', null);
INSERT INTO sys_menu_fun VALUES ('schParamFunGroup', 'query', '查询', 'query', null);
INSERT INTO sys_menu_fun VALUES ('operateWFGroup', 'start', '启动', 'start', null);
INSERT INTO sys_menu_fun VALUES ('operateWFGroup', 'stop', '停止', 'stop', null);
INSERT INTO sys_menu_fun VALUES ('operateWFGroup', 'redo', '重新执行', 'redo', null);
INSERT INTO sys_menu_fun VALUES ('operateWFGroup', 'clear', '清理调度器', 'clear', null);
INSERT INTO sys_menu_fun VALUES ('operateManualGroup', 'start', '开始执行', 'start', null);
INSERT INTO sys_menu_fun VALUES ('operateManualGroup', 'stop', '停止执行', 'stop', null);
INSERT INTO sys_menu_fun VALUES ('operateManualGroup', 'reset', '重置列表', 'reset', null);
INSERT INTO sys_menu_fun VALUES ('operateMonitorGroup', 'redo', '重新执行', 'redo', null);
INSERT INTO sys_menu_fun VALUES ('operateMonitorGroup', 'compel', '强制执行', 'compel', null);
INSERT INTO sys_menu_fun VALUES ('operateMonitorGroup', 'ignore', '忽略条件', 'ignore', null);
INSERT INTO sys_menu_fun VALUES ('operateMonitorGroup', 'flowView', '流程查看', 'flowView', null);
INSERT INTO sys_menu_fun VALUES ('operateMonitorGroup', 'runMsg', '运行信息', 'runMsg', null);
INSERT INTO sys_menu_fun VALUES ('operateMonitorGroup', 'jobInfo', '作业信息', 'jobInfo', null);
INSERT INTO sys_menu_fun VALUES ('operateMonitorGroup', 'jobDetail', '明细作业', 'jobDetail', null);
INSERT INTO sys_menu_fun VALUES ('operateMonitorGroup', 'query', '查询', 'query', null);
INSERT INTO sys_menu_fun VALUES ('operateMonitorGroup', 'refresh', '刷新', 'refresh', null);
INSERT INTO sys_menu_fun VALUES ('operateMonitorGroup', 'reset', '重置', 'reset', null);

-- ----------------------------
-- Table structure for sys_menu_fun_group
-- ----------------------------
DROP TABLE IF EXISTS sys_menu_fun_group;
CREATE TABLE sys_menu_fun_group (
  FUN_GROUP_ID varchar(32) NOT NULL COMMENT '功能组编码',
  FUN_GROUP_NAME varchar(50) DEFAULT NULL,
  FUN_GROUP_NAME_EN varchar(50) DEFAULT NULL,
  FUN_GROUP_DESC varchar(100) DEFAULT NULL COMMENT '功能组描述'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单功能组表';

-- ----------------------------
-- Records of sys_menu_fun_group
-- ----------------------------
INSERT INTO sys_menu_fun_group VALUES ('menuFunGroup', '菜单管理角色组', '55', '333222222');
INSERT INTO sys_menu_fun_group VALUES ('orgFunGroup', '机构管理权限组', null, 'aaa');
INSERT INTO sys_menu_fun_group VALUES ('roleFunGroup', '角色管理权限组', null, null);
INSERT INTO sys_menu_fun_group VALUES ('userFunGroup', '用户管理角色组', null, null);
INSERT INTO sys_menu_fun_group VALUES ('dictFunGroup', '字典管理权限组', null, null);
INSERT INTO sys_menu_fun_group VALUES ('sysToolGroup', '系统工具权限组', null, null);
INSERT INTO sys_menu_fun_group VALUES ('onLineGroup', '在线管理权限组', null, null);
INSERT INTO sys_menu_fun_group VALUES ('pictureFunGroup', '图片管理权限组', 'pictureFunGroup', 'cccc');
INSERT INTO sys_menu_fun_group VALUES ('menuGGroupFun', '菜单功能权限组', 'ss', null);
INSERT INTO sys_menu_fun_group VALUES ('operationFunGroup', '日志管理权限组', null, null);
INSERT INTO sys_menu_fun_group VALUES ('schParamFunGroup', '调度参数权限组', 'schParamFunGroup', null);
INSERT INTO sys_menu_fun_group VALUES ('operateWFGroup', '调度操作作业流权限组', 'operateWFGroup', null);
INSERT INTO sys_menu_fun_group VALUES ('operateManualGroup', '调度操作手动执行权限组', 'operateManualGroup', null);
INSERT INTO sys_menu_fun_group VALUES ('operateMonitorGroup', '调度监控权限组', 'operateMonitorGroup', null);

-- ----------------------------
-- Table structure for sys_module_app
-- ----------------------------
DROP TABLE IF EXISTS sys_module_app;
CREATE TABLE sys_module_app (
  MODULE_ID varchar(32) DEFAULT NULL COMMENT '模块Id',
  SYS_IND varchar(50) DEFAULT NULL COMMENT '系统编码',
  ORDER_BY varchar(50) DEFAULT NULL COMMENT '序号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='模块与系统对应关系';

-- ----------------------------
-- Records of sys_module_app
-- ----------------------------

-- ----------------------------
-- Table structure for sys_operation_log
-- ----------------------------
DROP TABLE IF EXISTS sys_operation_log;
CREATE TABLE sys_operation_log (
  LOG_ID varchar(50) NOT NULL COMMENT '日志流水号',
  USER_ID varchar(100) DEFAULT NULL COMMENT '访问者用户Key',
  USERNAME varchar(20) DEFAULT NULL COMMENT '访问者用户编码',
  NAME varchar(50) DEFAULT NULL COMMENT '访问者用户名称',
  ORG varchar(50) DEFAULT NULL COMMENT '访问者所属机构',
  IP varchar(20) DEFAULT NULL COMMENT '访问者IP地址',
  MAC varchar(50) DEFAULT NULL COMMENT '访问者MAC地址',
  OPERATION_URL varchar(200) DEFAULT NULL COMMENT '访问URL',
  OPERATION_TIME varchar(20) DEFAULT NULL COMMENT '操作时间，年月日 时分秒',
  OPERATION_DESC text COMMENT '具体操作的描述'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='平台操作日志表，记录操作平台各功能的信息';

-- ----------------------------
-- Records of sys_operation_log
-- ----------------------------
INSERT INTO sys_operation_log VALUES ('fc510e3ec2614d96885864adb55f4261', '0', 'super', '0', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2020-10-28 20:18:14', '登录成功');
INSERT INTO sys_operation_log VALUES ('2fcba4ddf878424abb6a2127673a7643', '0', 'super', '0', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2020-10-28 20:40:50', '退出系统');
INSERT INTO sys_operation_log VALUES ('10f89648a17a44c28fc4db1d11aecd96', '0', 'super', '0', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2020-10-28 20:41:36', '登录成功');
INSERT INTO sys_operation_log VALUES ('4b877dbdd14e4e499f2c1ed67de67233', '0', 'super', '0', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2020-10-28 20:42:43', '退出系统');
INSERT INTO sys_operation_log VALUES ('ad9f221eea814668ade9dd1965ba2119', '3ef39f9c843a4da08ffceb3a829d089d', 'adminxayh', null, null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2020-10-28 20:42:54', '登录失败');
INSERT INTO sys_operation_log VALUES ('1d4d4aa0ec04412b96cc746d5ea9bb1b', '3ef39f9c843a4da08ffceb3a829d089d', 'adminxayh', '3ef39f9c843a4da08ffceb3a829d089d', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2020-10-28 20:43:18', '登录成功');
INSERT INTO sys_operation_log VALUES ('15e9197ffd6f41cd846448744aea3bca', 'f4ad5ee56c21447789d9f25b4f45debc', 'adminxayh', 'f4ad5ee56c21447789d9f25b4f45debc', null, '0:0:0:0:0:0:0:1', null, null, '2020-11-12 09:01:49', '登录成功');
INSERT INTO sys_operation_log VALUES ('a97b2881afe84e94af9919216e6970c6', 'f4ad5ee56c21447789d9f25b4f45debc', 'adminxayh', 'f4ad5ee56c21447789d9f25b4f45debc', null, '0:0:0:0:0:0:0:1', null, null, '2020-11-12 09:47:45', '登录成功');
INSERT INTO sys_operation_log VALUES ('71a847dbe2c64cb5bfcbda7cd997ad1a', 'f4ad5ee56c21447789d9f25b4f45debc', 'adminxayh', 'f4ad5ee56c21447789d9f25b4f45debc', null, '0:0:0:0:0:0:0:1', null, null, '2020-11-12 09:54:08', '登录成功');
INSERT INTO sys_operation_log VALUES ('4e557a59e9154e3ab2e575166f59a7df', 'f4ad5ee56c21447789d9f25b4f45debc', 'adminxayh', 'f4ad5ee56c21447789d9f25b4f45debc', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2020-11-12 14:13:30', '登录成功');
INSERT INTO sys_operation_log VALUES ('afa1d99ed08b4366836479f27b9d4685', 'f4ad5ee56c21447789d9f25b4f45debc', 'adminxayh', 'f4ad5ee56c21447789d9f25b4f45debc', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2020-11-12 14:16:53', '登录成功');
INSERT INTO sys_operation_log VALUES ('8b20cef1dc7440f5930fc6307bfa70a0', 'f4ad5ee56c21447789d9f25b4f45debc', 'adminxayh', 'f4ad5ee56c21447789d9f25b4f45debc', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2020-11-13 10:45:26', '登录成功');
INSERT INTO sys_operation_log VALUES ('6502bdf8379e420b9a2b1fbb53c22538', 'f4ad5ee56c21447789d9f25b4f45debc', 'adminxayh', 'f4ad5ee56c21447789d9f25b4f45debc', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2020-12-24 09:19:48', '登录成功');
INSERT INTO sys_operation_log VALUES ('9b5b2c4e46c6490290285b152e9169e1', 'f4ad5ee56c21447789d9f25b4f45debc', 'adminxayh', 'f4ad5ee56c21447789d9f25b4f45debc', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2020-12-24 09:19:48', '登录成功');
INSERT INTO sys_operation_log VALUES ('ecb7573a9818402a944420580924c312', 'f4ad5ee56c21447789d9f25b4f45debc', 'adminxayh', 'f4ad5ee56c21447789d9f25b4f45debc', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2020-12-24 14:56:59', '登录成功');
INSERT INTO sys_operation_log VALUES ('f6a77949b3a24669b354dad9d47d0d2a', 'f4ad5ee56c21447789d9f25b4f45debc', 'adminxayh', 'f4ad5ee56c21447789d9f25b4f45debc', null, '0:0:0:0:0:0:0:1', null, null, '2021-02-08 23:08:13', '登录成功');
INSERT INTO sys_operation_log VALUES ('b1dc5fec482b40c8b23cfd7d40aa67c9', 'f4ad5ee56c21447789d9f25b4f45debc', 'adminxayh', 'f4ad5ee56c21447789d9f25b4f45debc', null, '0:0:0:0:0:0:0:1', '00-E0-4E-71-9E-B7', null, '2021-03-11 16:14:19', '登录成功');
INSERT INTO sys_operation_log VALUES ('b13f56a56b0e4747af5152c772ba17d0', 'f4ad5ee56c21447789d9f25b4f45debc', 'adminxayh', 'f4ad5ee56c21447789d9f25b4f45debc', null, '0:0:0:0:0:0:0:1', '00-E0-4E-71-9E-B7', null, '2021-03-11 18:09:03', '登录成功');
INSERT INTO sys_operation_log VALUES ('779537126e6c42dbb4f5c225b6e1735b', 'f4ad5ee56c21447789d9f25b4f45debc', 'adminxayh', 'f4ad5ee56c21447789d9f25b4f45debc', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-03-26 13:47:31', '登录成功');
INSERT INTO sys_operation_log VALUES ('ed7ef55b3f3249f7bcebdb48bc03e854', 'f4ad5ee56c21447789d9f25b4f45debc', 'adminxayh', 'f4ad5ee56c21447789d9f25b4f45debc', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-04-08 17:00:15', '登录成功');
INSERT INTO sys_operation_log VALUES ('ace6a1b1998c4d299560211fc7364245', '0', 'super', '0', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-04-12 16:22:01', '登录成功');
INSERT INTO sys_operation_log VALUES ('d9fc2fc247da41c1a6f04beed1f217bc', 'f4ad5ee56c21447789d9f25b4f45debc', 'adminxayh', 'f4ad5ee56c21447789d9f25b4f45debc', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-04-15 13:20:57', '登录成功');
INSERT INTO sys_operation_log VALUES ('ab2c7aa3cd734868b0209f90f970633d', 'f4ad5ee56c21447789d9f25b4f45debc', 'adminxayh', 'f4ad5ee56c21447789d9f25b4f45debc', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-04-15 14:17:11', '登录成功');
INSERT INTO sys_operation_log VALUES ('e76ede313103420d8ffd393b7c2ccaf6', 'f4ad5ee56c21447789d9f25b4f45debc', 'adminxayh', 'f4ad5ee56c21447789d9f25b4f45debc', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-04-16 10:48:14', '登录成功');
INSERT INTO sys_operation_log VALUES ('ef50772940e446509a1861770166d90c', 'f4ad5ee56c21447789d9f25b4f45debc', 'adminxayh', 'f4ad5ee56c21447789d9f25b4f45debc', null, '0:0:0:0:0:0:0:1', null, null, '2020-11-12 09:42:55', '登录成功');
INSERT INTO sys_operation_log VALUES ('d239b4bf9c8a435b8fa55e53b3705d1b', 'f4ad5ee56c21447789d9f25b4f45debc', 'adminxayh', 'f4ad5ee56c21447789d9f25b4f45debc', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2020-11-12 09:59:43', '登录成功');
INSERT INTO sys_operation_log VALUES ('3fe9a0f905da4e8f99862ad644d69d9f', 'f4ad5ee56c21447789d9f25b4f45debc', 'adminxayh', 'f4ad5ee56c21447789d9f25b4f45debc', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2020-12-22 20:18:53', '登录成功');
INSERT INTO sys_operation_log VALUES ('16f0b9ef8ab24e77ba1e5cbf4c744104', 'f4ad5ee56c21447789d9f25b4f45debc', 'adminxayh', 'f4ad5ee56c21447789d9f25b4f45debc', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-02-08 09:33:08', '登录成功');
INSERT INTO sys_operation_log VALUES ('a438e1d1c8a74059bc6db2ec06bf933e', 'f4ad5ee56c21447789d9f25b4f45debc', 'adminxayh', 'f4ad5ee56c21447789d9f25b4f45debc', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-03-25 16:34:52', '登录成功');
INSERT INTO sys_operation_log VALUES ('e901527821144b54bbcc0ba4d31d78e2', 'f4ad5ee56c21447789d9f25b4f45debc', 'adminxayh', 'f4ad5ee56c21447789d9f25b4f45debc', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-03-25 16:50:18', '登录成功');
INSERT INTO sys_operation_log VALUES ('890a515f4fc04911bda028c8a1d09996', 'f4ad5ee56c21447789d9f25b4f45debc', 'adminxayh', 'f4ad5ee56c21447789d9f25b4f45debc', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-04-09 13:18:12', '登录成功');
INSERT INTO sys_operation_log VALUES ('64855ff5f98a43efb8d1bb02caf74dd7', 'f4ad5ee56c21447789d9f25b4f45debc', 'adminxayh', 'f4ad5ee56c21447789d9f25b4f45debc', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-04-20 10:47:18', '登录成功');
INSERT INTO sys_operation_log VALUES ('badcc6ed00a8427f82cc7dcd0acc1326', 'f4ad5ee56c21447789d9f25b4f45debc', 'adminxayh', 'f4ad5ee56c21447789d9f25b4f45debc', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-05-20 13:30:45', '登录成功');
INSERT INTO sys_operation_log VALUES ('4f6ebcb65f6942e799a6882207007433', 'f4ad5ee56c21447789d9f25b4f45debc', 'adminxayh', 'f4ad5ee56c21447789d9f25b4f45debc', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2020-10-29 18:28:44', '登录成功');
INSERT INTO sys_operation_log VALUES ('41221feb90334468a06a3feaff00d26b', 'f4ad5ee56c21447789d9f25b4f45debc', 'adminxayh', 'f4ad5ee56c21447789d9f25b4f45debc', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2020-12-22 20:57:43', '登录成功');
INSERT INTO sys_operation_log VALUES ('18691c9191b9452da01d6a22758e1f89', 'f4ad5ee56c21447789d9f25b4f45debc', 'adminxayh', 'f4ad5ee56c21447789d9f25b4f45debc', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2020-12-22 21:01:50', '登录成功');
INSERT INTO sys_operation_log VALUES ('4115f48346844ef2b55e154347425772', 'f4ad5ee56c21447789d9f25b4f45debc', 'adminxayh', 'f4ad5ee56c21447789d9f25b4f45debc', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2020-12-22 21:06:19', '登录成功');
INSERT INTO sys_operation_log VALUES ('7245a583a5204161bfcfa722e87d1b7a', 'f4ad5ee56c21447789d9f25b4f45debc', 'adminxayh', 'f4ad5ee56c21447789d9f25b4f45debc', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2020-12-22 21:12:16', '登录成功');
INSERT INTO sys_operation_log VALUES ('c919f7acda644e79b20138132545fad7', 'f4ad5ee56c21447789d9f25b4f45debc', 'adminxayh', 'f4ad5ee56c21447789d9f25b4f45debc', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2020-12-22 21:23:03', '登录成功');
INSERT INTO sys_operation_log VALUES ('6f302c8e0fed4aa1a62e1581b9dc3844', 'f4ad5ee56c21447789d9f25b4f45debc', 'adminxayh', 'f4ad5ee56c21447789d9f25b4f45debc', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-02-08 09:41:00', '登录成功');
INSERT INTO sys_operation_log VALUES ('0f8d9d7622ed47109b4161e34f6809c7', 'f4ad5ee56c21447789d9f25b4f45debc', 'adminxayh', 'f4ad5ee56c21447789d9f25b4f45debc', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-04-09 13:08:24', '登录成功');
INSERT INTO sys_operation_log VALUES ('60f5d5c95edc48c2b0c6bb3b52f98cdf', 'f4ad5ee56c21447789d9f25b4f45debc', 'adminxayh', 'f4ad5ee56c21447789d9f25b4f45debc', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-04-09 13:37:45', '登录成功');
INSERT INTO sys_operation_log VALUES ('57de5cb1aa304cc8a84055ff7d35639d', 'f4ad5ee56c21447789d9f25b4f45debc', 'adminxayh', 'f4ad5ee56c21447789d9f25b4f45debc', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-04-12 18:46:30', '登录成功');
INSERT INTO sys_operation_log VALUES ('a60a267a88b443b78cab5fca8309ae75', 'f4ad5ee56c21447789d9f25b4f45debc', 'adminxayh', 'f4ad5ee56c21447789d9f25b4f45debc', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-04-20 10:16:50', '登录成功');
INSERT INTO sys_operation_log VALUES ('7021a23f7e90467ba0ba5fc5cdf1f16a', 'f4ad5ee56c21447789d9f25b4f45debc', 'adminxayh', 'f4ad5ee56c21447789d9f25b4f45debc', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-05-11 14:29:51', '登录成功');
INSERT INTO sys_operation_log VALUES ('21ea75c09d4c46ed9bfad54a476f4f17', 'f4ad5ee56c21447789d9f25b4f45debc', 'adminxayh', 'f4ad5ee56c21447789d9f25b4f45debc', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-05-11 14:31:11', '登录成功');
INSERT INTO sys_operation_log VALUES ('33059cdaa92049e38cf788055843751a', 'f4ad5ee56c21447789d9f25b4f45debc', 'adminxayh', 'f4ad5ee56c21447789d9f25b4f45debc', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-04-15 17:00:46', '登录成功');
INSERT INTO sys_operation_log VALUES ('21bf8ef740b3494ca2ae8aa983d150d3', 'f4ad5ee56c21447789d9f25b4f45debc', 'adminxayh', 'f4ad5ee56c21447789d9f25b4f45debc', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-04-16 11:10:41', '登录成功');
INSERT INTO sys_operation_log VALUES ('12df24d8716441af93aa92f35f65d3ac', 'f4ad5ee56c21447789d9f25b4f45debc', 'adminxayh', 'f4ad5ee56c21447789d9f25b4f45debc', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-04-19 16:10:46', '登录成功');
INSERT INTO sys_operation_log VALUES ('41ca567d795b4f5fa0f64d09656c670e', 'f4ad5ee56c21447789d9f25b4f45debc', 'adminxayh', 'f4ad5ee56c21447789d9f25b4f45debc', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-04-26 15:15:10', '登录成功');
INSERT INTO sys_operation_log VALUES ('5a93bdc44b5c4753b89b6a2acc97ec1c', 'f4ad5ee56c21447789d9f25b4f45debc', 'adminxayh', 'f4ad5ee56c21447789d9f25b4f45debc', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-04-26 15:25:23', '登录成功');
INSERT INTO sys_operation_log VALUES ('1c537215f2c542e9ae91c77a0cd34b3a', 'f4ad5ee56c21447789d9f25b4f45debc', 'adminxayh', 'f4ad5ee56c21447789d9f25b4f45debc', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-04-26 15:26:58', '登录成功');
INSERT INTO sys_operation_log VALUES ('8db2a724694440bd9a2afd3303e48d8c', 'f4ad5ee56c21447789d9f25b4f45debc', 'adminxayh', 'f4ad5ee56c21447789d9f25b4f45debc', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-05-13 15:30:32', '登录成功');
INSERT INTO sys_operation_log VALUES ('f59b12eedd5b4d85a6226b83ec0f937e', '0', 'super', '0', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2020-10-28 10:03:49', '登录成功');
INSERT INTO sys_operation_log VALUES ('7f76ddd9f5664440a297582f45d6fde9', 'f4ad5ee56c21447789d9f25b4f45debc', 'adminxayh', 'f4ad5ee56c21447789d9f25b4f45debc', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2020-11-13 10:25:15', '登录成功');
INSERT INTO sys_operation_log VALUES ('191ff027862d491499e734a36f3f5e4e', 'f4ad5ee56c21447789d9f25b4f45debc', 'adminxayh', 'f4ad5ee56c21447789d9f25b4f45debc', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2020-11-13 10:52:14', '登录成功');
INSERT INTO sys_operation_log VALUES ('9c287ff857fb42e5b945abe8f0b73544', 'f4ad5ee56c21447789d9f25b4f45debc', 'adminxayh', 'f4ad5ee56c21447789d9f25b4f45debc', null, '0:0:0:0:0:0:0:1', '00-E0-4E-71-9E-B7', null, '2021-03-12 15:02:22', '登录成功');
INSERT INTO sys_operation_log VALUES ('283fabdfb7a34e24b307247f1cf86baa', 'f4ad5ee56c21447789d9f25b4f45debc', 'adminxayh', 'f4ad5ee56c21447789d9f25b4f45debc', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-04-07 11:29:20', '登录成功');
INSERT INTO sys_operation_log VALUES ('934b2b10444a4654b7c9d3447b8cb80f', 'f4ad5ee56c21447789d9f25b4f45debc', 'adminxayh', 'f4ad5ee56c21447789d9f25b4f45debc', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-05-18 10:57:20', '登录成功');
INSERT INTO sys_operation_log VALUES ('dedc9f70259341d490f6e251c52f98f5', 'f4ad5ee56c21447789d9f25b4f45debc', 'adminxayh', 'f4ad5ee56c21447789d9f25b4f45debc', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-10 10:17:02', '登录成功');
INSERT INTO sys_operation_log VALUES ('90c39d6303be46b5a5ec4943ffc52e4d', null, 'super', null, null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-15 10:44:16', '登录失败,登录密码错误');
INSERT INTO sys_operation_log VALUES ('7d4476e89ae64f56bbf61fb8c4510cb6', null, 'super', null, null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-15 10:44:23', '登录失败,登录密码错误');
INSERT INTO sys_operation_log VALUES ('1796084c8c734fa5be48b381e3ae1e9b', '0', 'super', '0', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-15 10:44:30', '登录成功');
INSERT INTO sys_operation_log VALUES ('b2e21265b75049e3b2df45ebe4dd1bb4', null, 'super', null, null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-15 10:49:53', '登录失败,登录密码错误');
INSERT INTO sys_operation_log VALUES ('e492fcd80b0944648128c18274a57950', '0', 'super', '0', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-15 10:50:09', '登录成功');
INSERT INTO sys_operation_log VALUES ('bb544f84fa424f63a1b76e637a83887d', '0', 'super', '0', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-15 10:55:55', '登录成功');
INSERT INTO sys_operation_log VALUES ('e55d343a0fde481aa3067398cf8ef792', '0', 'super', '0', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-15 11:01:24', '登录成功');
INSERT INTO sys_operation_log VALUES ('05cf33888cea4aa18eb7f2b3c320301e', '0', 'super', '0', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-15 11:10:20', '登录成功');
INSERT INTO sys_operation_log VALUES ('2154a87ec88441518fcd6262412efd24', '0', 'super', '0', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-15 11:12:14', '登录成功');
INSERT INTO sys_operation_log VALUES ('55e060650e5d42e9aa24ae768f9f1238', '0', 'super', '0', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-15 11:18:59', '登录成功');
INSERT INTO sys_operation_log VALUES ('3b76fa5bcd7f4e9e8c1f59bc34e1ae1a', '0', 'super', '0', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-15 11:22:38', '登录成功');
INSERT INTO sys_operation_log VALUES ('e2a94a6f9f1542dd9dbec5d79f025b9e', '0', 'super', '0', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', '', '2021-06-15 11:27:51', '退出系统');
INSERT INTO sys_operation_log VALUES ('1b47da37c76a42e58e6da0172ad5005e', '0046ce6154d74a87b298648873e74a99', 'adminhfdb', null, null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-15 11:28:03', '登录失败');
INSERT INTO sys_operation_log VALUES ('6073b108e6c54816afec47363c2a3b18', '0', 'super', '0', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-15 11:30:59', '登录成功');
INSERT INTO sys_operation_log VALUES ('473e1edcc5564c099aba84c60bb0a4e6', '0', 'super', '0', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-15 11:34:22', '登录成功');
INSERT INTO sys_operation_log VALUES ('54794c3515824965a254026a824e387f', '0', 'super', '0', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', '', '2021-06-15 11:35:10', '退出系统');
INSERT INTO sys_operation_log VALUES ('11c2b0e072f14f359fff9a0062be20a2', null, 'adminhfdb', null, null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-15 11:36:06', '登录失败,登录密码错误');
INSERT INTO sys_operation_log VALUES ('37e682b9329d494ab5ba0a4548ae1c5e', '0', 'super', '0', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-15 11:40:39', '登录成功');
INSERT INTO sys_operation_log VALUES ('c0cb444a99b141eb808bb41c7e089649', '0', 'super', '0', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-15 11:52:32', '登录成功');
INSERT INTO sys_operation_log VALUES ('edc9d297ee1a425b8adbc5e71922edc3', '0', 'super', '0', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-15 13:03:25', '登录成功');
INSERT INTO sys_operation_log VALUES ('8fb6d72f3e7b4e2ab938d2e8d493e28f', '0', 'super', '0', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-15 13:08:19', '登录成功');
INSERT INTO sys_operation_log VALUES ('1ba91270c33043dcb3d73c33d8c24976', 'f4ad5ee56c21447789d9f25b4f45debc', 'adminxayh', 'f4ad5ee56c21447789d9f25b4f45debc', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-15 13:10:12', '登录成功');
INSERT INTO sys_operation_log VALUES ('480ffc944ee34bd4848692dd585eb10d', 'f4ad5ee56c21447789d9f25b4f45debc', 'adminxayh', 'f4ad5ee56c21447789d9f25b4f45debc', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-15 13:10:28', '登录成功');
INSERT INTO sys_operation_log VALUES ('ba8fdd3b4c7f4cf1abd7660ccaa05cda', 'f4ad5ee56c21447789d9f25b4f45debc', 'adminxayh', 'f4ad5ee56c21447789d9f25b4f45debc', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-15 13:15:40', '登录成功');
INSERT INTO sys_operation_log VALUES ('e8480f517c3f47a897db1a46fad31904', '0', 'super', '0', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-15 13:16:42', '登录成功');
INSERT INTO sys_operation_log VALUES ('e22b68c54c954147bc2700a12f30e910', '0', 'super', '0', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', '', '2021-06-15 13:18:11', '退出系统');
INSERT INTO sys_operation_log VALUES ('93483979531c4328b85f626433a16ce1', '8aaeba2c316745619742d5767c88eb0c', 'adminhfdb', null, null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-15 13:18:25', '登录失败');
INSERT INTO sys_operation_log VALUES ('ba76a695bdbe479b9e5d07ad6388a762', null, 'super', null, null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-15 14:33:08', '登录失败,登录密码错误');
INSERT INTO sys_operation_log VALUES ('e9e707e3d12e421583c68f48daafb947', null, 'super', null, null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-15 14:33:54', '登录失败,登录密码错误');
INSERT INTO sys_operation_log VALUES ('24010848b33a4f07b2bbba717f32cd98', '0', 'super', '0', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-15 14:34:13', '登录成功');
INSERT INTO sys_operation_log VALUES ('554e7de64b304c32a900947da27e7d16', '0', 'super', '0', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-15 14:38:49', '登录成功');
INSERT INTO sys_operation_log VALUES ('76fa1e8b599f40bf92dd300e46e25121', '0', 'super', '0', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-15 14:42:15', '登录成功');
INSERT INTO sys_operation_log VALUES ('84f45a20010941158346fde5aeeea81d', '0', 'super', '0', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-15 14:45:12', '登录成功');
INSERT INTO sys_operation_log VALUES ('f8854a3d29fe4223b79a93fa7097f0bc', '0', 'super', '0', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-15 15:01:19', '登录成功');
INSERT INTO sys_operation_log VALUES ('926708896549488388e254023c625c7e', '0', 'super', '0', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', '', '2021-06-15 15:03:03', '退出系统');
INSERT INTO sys_operation_log VALUES ('73114d6924eb4e4fb296dcc2558e0292', '41533de78f184f0682ee431afc066b54', 'adminhfdb', null, null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-15 15:03:51', '登录失败');
INSERT INTO sys_operation_log VALUES ('9f0732ffb8504c59bfb6885ac696d1c1', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-15 15:04:31', '登录成功');
INSERT INTO sys_operation_log VALUES ('9dc5d782ee8246c58f6cf7afea0b554b', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-15 15:10:56', '登录成功');
INSERT INTO sys_operation_log VALUES ('bba453b303a042e282dce273bc569138', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-15 15:31:05', '登录成功');
INSERT INTO sys_operation_log VALUES ('4167170292d5421f8cc9279a8787139e', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-15 16:57:29', '登录成功');
INSERT INTO sys_operation_log VALUES ('c68f2bbc6775445eb8411125a26f9b4b', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-15 17:14:47', '登录成功');
INSERT INTO sys_operation_log VALUES ('fe83ed241c5b48a79da7e722dbd5cf14', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-16 09:04:24', '登录成功');
INSERT INTO sys_operation_log VALUES ('0ab0c51f0f9244898124338ae4c76519', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-16 09:52:13', '登录成功');
INSERT INTO sys_operation_log VALUES ('7962fd9a51b340df95cdb495eaa47012', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-16 10:11:47', '登录成功');
INSERT INTO sys_operation_log VALUES ('a3cbe97ce86042f187e5821491be3cbf', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-16 10:41:36', '登录成功');
INSERT INTO sys_operation_log VALUES ('2284a8ade72949ff8a6cb9ce028b5356', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-16 13:11:47', '登录成功');
INSERT INTO sys_operation_log VALUES ('813ed0ad7a7d4ec8a36448aa9f10efec', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-16 13:17:39', '登录成功');
INSERT INTO sys_operation_log VALUES ('9a6c0c67800b48e2b12f55be7d6a037d', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-16 13:38:43', '登录成功');
INSERT INTO sys_operation_log VALUES ('70dbd4b3c62548b8871db8dad1a92f03', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-16 14:39:50', '登录成功');
INSERT INTO sys_operation_log VALUES ('08b8dc6b2d934da7b0a48c5c4592a425', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-16 15:01:12', '登录成功');
INSERT INTO sys_operation_log VALUES ('30c8ceddb9294fc2b69c4bd16a6d4507', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-16 15:04:34', '登录成功');
INSERT INTO sys_operation_log VALUES ('1e34b1a7b1d342f7a57a141dacfd02eb', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-16 15:23:01', '登录成功');
INSERT INTO sys_operation_log VALUES ('1c78fac4b10e47689581706b434797b7', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-16 15:23:50', '登录成功');
INSERT INTO sys_operation_log VALUES ('48dfb7b2e888483aac477f9dff1b276b', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-16 15:30:06', '登录成功');
INSERT INTO sys_operation_log VALUES ('b50a919102614b33a55ac3cfab3c27db', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-16 15:48:35', '登录成功');
INSERT INTO sys_operation_log VALUES ('939e8192cd3b4ef49bdc7236e049a082', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-16 16:41:23', '登录成功');
INSERT INTO sys_operation_log VALUES ('701893ff170c479ea7c5a4624723c2bd', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-16 16:52:12', '登录成功');
INSERT INTO sys_operation_log VALUES ('220863740c0a409d800552a07e568655', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-16 17:15:09', '登录成功');
INSERT INTO sys_operation_log VALUES ('60433aeaf7884377926a98aa930eb664', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-16 17:15:09', '登录成功');
INSERT INTO sys_operation_log VALUES ('efed6415623c40169e0e089ace999763', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-16 17:50:52', '登录成功');
INSERT INTO sys_operation_log VALUES ('ec4831ed424642fd8abbe1ea1698f8f0', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-17 09:13:03', '登录成功');
INSERT INTO sys_operation_log VALUES ('2bca29d57e684e8f97127ca511f395a1', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-17 09:19:03', '登录成功');
INSERT INTO sys_operation_log VALUES ('194022283b684a4487f62e6ccdc8b8b3', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-17 10:23:41', '登录成功');
INSERT INTO sys_operation_log VALUES ('21e3ae622b0f4b1ca54c567c77268b01', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-17 10:38:43', '登录成功');
INSERT INTO sys_operation_log VALUES ('1a9e9cb1ccb747819527daac09f5ca77', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-17 10:43:19', '登录成功');
INSERT INTO sys_operation_log VALUES ('6215cd4d37bd4da09388a3e7a512a254', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-17 13:31:32', '登录成功');
INSERT INTO sys_operation_log VALUES ('8be135ff5ece4754a01ccb1cc3544135', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-17 13:36:14', '登录成功');
INSERT INTO sys_operation_log VALUES ('04826d97ef0f40a582a37210747c0fa5', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-17 13:59:18', '登录成功');
INSERT INTO sys_operation_log VALUES ('8143689a1fdd48f4aeb161d7b5c1b5ff', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-17 14:02:55', '登录成功');
INSERT INTO sys_operation_log VALUES ('31b9c27398a0472cb92a872a15a9f72d', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-17 14:06:20', '登录成功');
INSERT INTO sys_operation_log VALUES ('3c8efce5cff4465e90fcf7ad68e0aa0c', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-17 14:36:20', '登录成功');
INSERT INTO sys_operation_log VALUES ('0f29c80ef2b04d248c55f0277b33fbe9', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-17 16:32:54', '登录成功');
INSERT INTO sys_operation_log VALUES ('866c0dd3c21b422ba3d7988865e0c395', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-17 16:55:46', '登录成功');
INSERT INTO sys_operation_log VALUES ('f0217d3f1a154035b06b2d23664fa2b5', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-18 13:25:56', '登录成功');
INSERT INTO sys_operation_log VALUES ('810fff098f1944169f7e93f2dddde025', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-18 13:52:44', '登录成功');
INSERT INTO sys_operation_log VALUES ('8e1d5ea6a4d240529651cdc83ab00496', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-18 13:55:40', '登录成功');
INSERT INTO sys_operation_log VALUES ('c160dbb663a44a2d87ed467151340036', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-18 14:07:24', '登录成功');
INSERT INTO sys_operation_log VALUES ('0b6b4c1e41884d15bf594330a3a61a81', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-18 14:50:39', '登录成功');
INSERT INTO sys_operation_log VALUES ('0e035825933748e7bf319263946cbf8f', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-18 15:53:38', '登录成功');
INSERT INTO sys_operation_log VALUES ('9017b10422f34b3c96fa4290df0b389c', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-18 17:36:40', '登录成功');
INSERT INTO sys_operation_log VALUES ('8299318888414603be863b038f566332', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-18 17:47:44', '登录成功');
INSERT INTO sys_operation_log VALUES ('03ba3eee9e5c491ab219d4fefdcca220', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-18 17:49:17', '登录成功');
INSERT INTO sys_operation_log VALUES ('1e66f3edee8e41b3b6aabe98e04c6148', null, 'adminhfdb', null, null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-18 17:57:18', '登录失败,登录密码错误');
INSERT INTO sys_operation_log VALUES ('287802a347674b2cb06a59071a9ed76e', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-18 17:57:24', '登录成功');
INSERT INTO sys_operation_log VALUES ('8e02def9f18e4ca0a3823961ab7c9c08', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-21 09:11:30', '登录成功');
INSERT INTO sys_operation_log VALUES ('61f8e2bc010449188110fcd6ff7cb2fa', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-21 16:07:26', '登录成功');
INSERT INTO sys_operation_log VALUES ('e4e1d5ea7e214b5b9f084725f56e62c0', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-21 16:57:34', '登录成功');
INSERT INTO sys_operation_log VALUES ('6583ba734e6840d5b1beb990496bedfe', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-22 09:01:24', '登录成功');
INSERT INTO sys_operation_log VALUES ('424b0d0001994c15875147de01f014bb', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-22 10:13:54', '登录成功');
INSERT INTO sys_operation_log VALUES ('d8271d272498414bab5db1e0adc99849', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-22 10:23:09', '登录成功');
INSERT INTO sys_operation_log VALUES ('fc446c7e2c7947a9b735c30e2a44b3a0', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-22 10:37:12', '登录成功');
INSERT INTO sys_operation_log VALUES ('78d0bac3546846f7b4aabfbac1d3a8c1', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-22 11:24:48', '登录成功');
INSERT INTO sys_operation_log VALUES ('e02dc32de7814d9087f9d36c4a55aa92', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-22 14:11:39', '登录成功');
INSERT INTO sys_operation_log VALUES ('7f6ea2892f1d45d9afcd2d5875861dc7', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-22 16:06:20', '登录成功');
INSERT INTO sys_operation_log VALUES ('80dfca9dc0ff4ed98954300fb9146154', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-25 09:02:53', '登录成功');
INSERT INTO sys_operation_log VALUES ('72a5bfbce5bf44aab2a40f6b3297957c', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-25 09:21:57', '登录成功');
INSERT INTO sys_operation_log VALUES ('be1285145bf9487c9d8e1f2f71db855b', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-25 09:46:30', '登录成功');
INSERT INTO sys_operation_log VALUES ('92fa6912eea142be9cc90f035f05266c', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-25 09:49:15', '登录成功');
INSERT INTO sys_operation_log VALUES ('90e6f4d907d94fee9bf1f35e3390637b', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-25 13:17:20', '登录成功');
INSERT INTO sys_operation_log VALUES ('a05759f4462047c0894df41202f85399', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-25 13:45:59', '登录成功');
INSERT INTO sys_operation_log VALUES ('1c374edea1364db194ed2d1365212bec', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-25 13:56:01', '登录成功');
INSERT INTO sys_operation_log VALUES ('378276d9c150484596c912ab1ab20580', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-25 14:08:03', '登录成功');
INSERT INTO sys_operation_log VALUES ('41e43122fe2740a09319cf480007ae55', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-25 14:17:33', '登录成功');
INSERT INTO sys_operation_log VALUES ('712247c5a7ea443d96303f24e4243836', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-25 14:20:31', '登录成功');
INSERT INTO sys_operation_log VALUES ('4fc5780ab0b345408e79d4f952f15ac4', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-25 14:23:42', '登录成功');
INSERT INTO sys_operation_log VALUES ('9f21e4fd482f410084bfd41a076dbf92', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-25 14:31:48', '登录成功');
INSERT INTO sys_operation_log VALUES ('0f61823798944faca675ccad922b3d5d', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-25 14:37:38', '登录成功');
INSERT INTO sys_operation_log VALUES ('ca395db86c97412692a802bca881d628', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-25 14:44:49', '登录成功');
INSERT INTO sys_operation_log VALUES ('c86d6afaf1f546d1ab2aa44d67979dfb', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-28 09:05:40', '登录成功');
INSERT INTO sys_operation_log VALUES ('90fabdba584d4274a507083033641868', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-28 09:41:25', '登录成功');
INSERT INTO sys_operation_log VALUES ('b779978720e14ee7a03defeef160dfcb', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-28 09:47:42', '登录成功');
INSERT INTO sys_operation_log VALUES ('3b0db6eb265442698a944f4d12154d92', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-28 10:20:54', '登录成功');
INSERT INTO sys_operation_log VALUES ('ad009f52507d494580edd3309ddf236a', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-28 14:54:21', '登录成功');
INSERT INTO sys_operation_log VALUES ('d8ef57e21628458eb2fa82d778c01eb0', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-28 15:23:28', '登录成功');
INSERT INTO sys_operation_log VALUES ('6fc2da5e39ca4a578c37018c3cc96482', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-28 15:45:32', '登录成功');
INSERT INTO sys_operation_log VALUES ('eb1ba8c0bd6541efb3d89d69fad99c4a', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-28 15:51:21', '登录成功');
INSERT INTO sys_operation_log VALUES ('1bbe6d5052404afd852577c5e296e90c', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-28 16:03:04', '登录成功');
INSERT INTO sys_operation_log VALUES ('a5f4d202c617439b919f9952c8d6b87b', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-28 16:08:01', '登录成功');
INSERT INTO sys_operation_log VALUES ('97964c859bf34c829fd6df920d90f927', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-28 17:30:47', '登录成功');
INSERT INTO sys_operation_log VALUES ('ed03ee3ce01448379b3e53d92b1cd931', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-29 09:00:28', '登录成功');
INSERT INTO sys_operation_log VALUES ('46924f7962624718aa4f0261f8f9b1d6', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-29 09:00:28', '登录成功');
INSERT INTO sys_operation_log VALUES ('7592732695eb49fa9d4ea758a1a1e09b', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-29 14:23:09', '登录成功');
INSERT INTO sys_operation_log VALUES ('b3977d65fc9c443f84395130ef863ad6', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-29 14:30:17', '登录成功');
INSERT INTO sys_operation_log VALUES ('70d4ac3d746541a9a4c5f67c1f0bd859', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-29 14:31:09', '登录成功');
INSERT INTO sys_operation_log VALUES ('a7bb04b09bcb4ebabb9415c8cb60c93e', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-29 14:47:40', '登录成功');
INSERT INTO sys_operation_log VALUES ('3a9dc1047fa04c3aa5a71a7a7610ecee', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-29 15:00:42', '登录成功');
INSERT INTO sys_operation_log VALUES ('963837e5ab8f424dae17dbb498d5b5d6', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-29 15:07:26', '登录成功');
INSERT INTO sys_operation_log VALUES ('543412bc920840d780cd0db18ee95c2e', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-29 15:26:10', '登录成功');
INSERT INTO sys_operation_log VALUES ('1b6b27eccf844965a98d1b73fa346bd9', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-29 17:20:17', '登录成功');
INSERT INTO sys_operation_log VALUES ('72c747ad3c6748ea9ccee46e226c858c', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-29 17:42:31', '登录成功');
INSERT INTO sys_operation_log VALUES ('579ebe2b00da4bfe9d408b8bc32cbdfe', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-29 17:51:32', '登录成功');
INSERT INTO sys_operation_log VALUES ('8d267dfbeae94a1bb141f18a081cffb3', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-30 10:13:39', '登录成功');
INSERT INTO sys_operation_log VALUES ('1425ebc9fc0e4130abb3ff1cfea038e7', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-30 10:35:47', '登录成功');
INSERT INTO sys_operation_log VALUES ('3e5ea6536dda4d7b8e2e936183571338', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-30 10:38:17', '登录成功');
INSERT INTO sys_operation_log VALUES ('c53d1b61532d4673a25f47442abe20c4', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-30 11:03:19', '登录成功');
INSERT INTO sys_operation_log VALUES ('8ecc067cbe3f4c0e89492abb15117d8a', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-30 11:43:16', '登录成功');
INSERT INTO sys_operation_log VALUES ('6681a3cd22944a92a606dfad63480b83', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-30 13:28:38', '登录成功');
INSERT INTO sys_operation_log VALUES ('65f78307723f464586400c9c29033831', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-30 14:39:55', '登录成功');
INSERT INTO sys_operation_log VALUES ('6dce4b7329954f428f3d875c0a3b8ad4', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-06-30 16:10:16', '登录成功');
INSERT INTO sys_operation_log VALUES ('d8f032e53f314f86af2ae97571c2fddc', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-07-01 09:27:27', '登录成功');
INSERT INTO sys_operation_log VALUES ('e4d94c5e119c42ecb114ab014473bb87', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-07-01 10:08:24', '登录成功');
INSERT INTO sys_operation_log VALUES ('24fd87b881d94672b4b8a1bbbf7c0e5a', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-07-01 10:12:35', '登录成功');
INSERT INTO sys_operation_log VALUES ('1c868470b51f4a098567bd4c2815287b', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-07-01 10:24:06', '登录成功');
INSERT INTO sys_operation_log VALUES ('1b23496ae69341f7bcdcb2555cfa1146', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-07-01 10:38:34', '登录成功');
INSERT INTO sys_operation_log VALUES ('f86b27c60b0d4859a89abb33b72d5b99', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-07-01 11:10:35', '登录成功');
INSERT INTO sys_operation_log VALUES ('b9aae78359cc4c1c8f624eb4a1ef6bfd', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-07-01 11:19:20', '登录成功');
INSERT INTO sys_operation_log VALUES ('3c7d2beb0d264387aa858b789f756b8a', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-07-01 11:24:06', '登录成功');
INSERT INTO sys_operation_log VALUES ('7e4b9e8048454d11856ef46b85012b53', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-07-01 11:32:01', '登录成功');
INSERT INTO sys_operation_log VALUES ('9497daf0faa14db7a8f2a8cc8fff0c8f', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-07-01 11:36:12', '登录成功');
INSERT INTO sys_operation_log VALUES ('745671c06bcc4ed8ae0f52130bf6179e', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-07-01 13:40:27', '登录成功');
INSERT INTO sys_operation_log VALUES ('fdde5d5bcfd7469d87064a98d4986861', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-07-01 14:44:24', '登录成功');
INSERT INTO sys_operation_log VALUES ('d138bff429f144c88b7e0f02bc86f1be', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-07-01 15:01:14', '登录成功');
INSERT INTO sys_operation_log VALUES ('0d8ff97ebdc545938431f669167137a1', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-07-01 15:44:54', '登录成功');
INSERT INTO sys_operation_log VALUES ('78ec717d42c84fadb999eb7fd7c69e5b', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-07-01 16:36:19', '登录成功');
INSERT INTO sys_operation_log VALUES ('1de9e26803dc40c9acb1864428e73060', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-07-02 09:03:12', '登录成功');
INSERT INTO sys_operation_log VALUES ('416dfec949174b34bb721bce6c8cb924', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-07-06 09:10:33', '登录成功');
INSERT INTO sys_operation_log VALUES ('ed39e9de431f4049b40e32678d9fa3b3', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-07-07 10:22:24', '登录成功');
INSERT INTO sys_operation_log VALUES ('99d740f5b0a54c599dbb9cd268667354', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-07-08 09:43:55', '登录成功');
INSERT INTO sys_operation_log VALUES ('1d5377d337b44aabb218fbb44ce4d2cb', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-07-08 16:57:31', '登录成功');
INSERT INTO sys_operation_log VALUES ('e692c20467ad428294c6a41d53b98b7c', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.188.0.252', '00-50-56-85-76-C9', null, '2021-07-08 18:07:09', '登录成功');
INSERT INTO sys_operation_log VALUES ('4445d5ededc64ce9833d35ea925b791f', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-07-09 15:23:50', '登录成功');
INSERT INTO sys_operation_log VALUES ('2b45b57c90b24ac68788b6ae29956642', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-07-09 16:09:59', '登录成功');
INSERT INTO sys_operation_log VALUES ('465489d1dec944c9af874e11266ac262', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-07-13 17:17:23', '登录成功');
INSERT INTO sys_operation_log VALUES ('e924ec1cb5714ebca05ef06d640d6b74', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-07-13 17:19:37', '登录成功');
INSERT INTO sys_operation_log VALUES ('024eeec0de9f4db2aff5a12064d4a52f', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-07-13 17:46:15', '登录成功');
INSERT INTO sys_operation_log VALUES ('00f9f5caf1c2457f932e5f72f2692bd0', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-07-13 17:55:44', '登录成功');
INSERT INTO sys_operation_log VALUES ('9776f71d5c8a40e2a8745b207ff0c325', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-07-14 08:37:46', '登录成功');
INSERT INTO sys_operation_log VALUES ('e1b40d9afabf42ed9d9f649f90b240df', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-07-14 09:08:15', '登录成功');
INSERT INTO sys_operation_log VALUES ('896ecb03694f4863baf52e1dc18efafd', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.188.0.252', '00-50-56-85-76-C9', null, '2021-07-14 09:25:43', '登录成功');
INSERT INTO sys_operation_log VALUES ('a300d3a04547489284cfce6b33c22281', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-07-14 10:31:56', '登录成功');
INSERT INTO sys_operation_log VALUES ('730f8f6259ef4e23927a9208412f2731', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-07-14 10:40:54', '登录成功');
INSERT INTO sys_operation_log VALUES ('98b3f4d24f2c448c9b08893610b281e3', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.188.0.252', '00-50-56-85-76-C9', null, '2021-07-14 14:17:11', '登录成功');
INSERT INTO sys_operation_log VALUES ('246566912b5b44b68af18a32e37c69bd', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-07-14 18:00:29', '登录成功');
INSERT INTO sys_operation_log VALUES ('5308a6cba0a643239e49d0201968f9f4', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.188.0.252', '00-50-56-85-76-C9', null, '2021-07-15 09:08:41', '登录成功');
INSERT INTO sys_operation_log VALUES ('3c8ea4c48445480ea37dbd1362be08db', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-08-12 09:08:24', '登录成功');
INSERT INTO sys_operation_log VALUES ('84382f1948834b8fb0f426be04fb8e11', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-09-03 09:02:12', '登录成功');
INSERT INTO sys_operation_log VALUES ('6698ffd7fda64a43a533c63e88b2079f', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-09-03 14:05:28', '登录成功');
INSERT INTO sys_operation_log VALUES ('da1beae7ed9140c982e31dfa011e4409', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-09-06 10:41:58', '登录成功');
INSERT INTO sys_operation_log VALUES ('ef9efa71cefb4491b1f5dfec01e487af', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-09-06 14:41:42', '登录成功');
INSERT INTO sys_operation_log VALUES ('8261822db8b846adbf399a747443b54c', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-09-06 14:46:17', '登录成功');
INSERT INTO sys_operation_log VALUES ('752e224d8d3b4f82a978adf5921b6762', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-09-06 15:23:06', '登录成功');
INSERT INTO sys_operation_log VALUES ('4fb7195d667b427a9dd02b108e20a19d', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2021-09-06 15:24:02', '登录成功');
INSERT INTO sys_operation_log VALUES ('86658931538248a68762348d3aaf19c4', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-02 09:57:53', '登录成功');
INSERT INTO sys_operation_log VALUES ('3e72e6a0632d4523adbcaeebc079d29b', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-06 15:03:56', '登录成功');
INSERT INTO sys_operation_log VALUES ('478cd785a5034a70b15d078af9471b36', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-06 15:04:39', '登录成功');
INSERT INTO sys_operation_log VALUES ('15370e03c93a478e86cf74578a27481e', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-06 15:11:41', '登录成功');
INSERT INTO sys_operation_log VALUES ('5abde74acebc4725aa674cad41419e98', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-06 15:16:16', '登录成功');
INSERT INTO sys_operation_log VALUES ('473f77cf22ab47008af8e5b15dc457b3', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-06 15:20:38', '登录成功');
INSERT INTO sys_operation_log VALUES ('d4c5efa1293c41649664e45c5420a40c', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-06 16:23:18', '登录成功');
INSERT INTO sys_operation_log VALUES ('645891ac630243bda552c56fac364e2b', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-06 16:34:11', '登录成功');
INSERT INTO sys_operation_log VALUES ('1042803c54d1464f847e103f3ae3f707', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-06 16:34:11', '登录成功');
INSERT INTO sys_operation_log VALUES ('d6196341ccff48e595d0149c1762d0c3', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-06 16:37:21', '登录成功');
INSERT INTO sys_operation_log VALUES ('023622bcd35b42febb6de76aa831bf24', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-06 16:45:41', '登录成功');
INSERT INTO sys_operation_log VALUES ('57c01d4ca6d94ee191780d92a01459d4', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-06 16:51:43', '登录成功');
INSERT INTO sys_operation_log VALUES ('6ecafec83eaa48d79f575313d3cd86fa', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-06 16:56:35', '登录成功');
INSERT INTO sys_operation_log VALUES ('9a04618ded79415182c0cc622afce233', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-06 17:04:07', '登录成功');
INSERT INTO sys_operation_log VALUES ('cadfd33d6de64a8db23350d4c97ad1f2', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-06 17:09:26', '登录成功');
INSERT INTO sys_operation_log VALUES ('56ab322d9fd7426796a1c8b65449738b', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-06 17:25:00', '登录成功');
INSERT INTO sys_operation_log VALUES ('f583188e42a54b8b9fe6f175538f2e56', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '127.0.0.1', '00-FF-94-5E-15-50', null, '2022-06-06 17:33:40', '登录成功');
INSERT INTO sys_operation_log VALUES ('f927c65dcf0d43c38e134a8fb298bf23', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-06 17:38:37', '登录成功');
INSERT INTO sys_operation_log VALUES ('1bc2d3b8cf4c4b0b8bded66d45d8c9ac', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-06 17:52:41', '登录成功');
INSERT INTO sys_operation_log VALUES ('14f383e890f64081a7746fb31ae1f856', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-06 17:54:49', '登录成功');
INSERT INTO sys_operation_log VALUES ('d3002d0cb57e4be8b1250815ec0e5c03', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-07 09:20:56', '登录成功');
INSERT INTO sys_operation_log VALUES ('eb4f117eb466437891849fa0de9e030e', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-07 11:11:04', '登录成功');
INSERT INTO sys_operation_log VALUES ('4591a9ef54d243c2823a721ca170c0c4', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-07 11:37:37', '登录成功');
INSERT INTO sys_operation_log VALUES ('cfe05b93765f49ce921f0ee37b85c1f9', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-07 13:23:35', '登录成功');
INSERT INTO sys_operation_log VALUES ('ef3dc5c71754401aac559cd9003e583a', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-07 13:38:58', '登录成功');
INSERT INTO sys_operation_log VALUES ('3043e7300ebc4db680e9da077b615bfd', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-07 13:44:17', '登录成功');
INSERT INTO sys_operation_log VALUES ('bfb8d80de9e74c1b849f3351c8b1f248', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-07 14:00:24', '登录成功');
INSERT INTO sys_operation_log VALUES ('365953096cca4b8fb3bbbc329409d46d', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-07 14:06:20', '登录成功');
INSERT INTO sys_operation_log VALUES ('2004ea619c754ad3ba7eaf080b4581d6', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-07 14:17:44', '登录成功');
INSERT INTO sys_operation_log VALUES ('242214640894415093afc74ef3937c96', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-07 14:23:45', '登录成功');
INSERT INTO sys_operation_log VALUES ('dd54713162414e4593f924ad8b416267', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-07 14:57:33', '登录成功');
INSERT INTO sys_operation_log VALUES ('a7ae46d8299b4d0f97db1eaf9ceab0e6', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-07 15:27:29', '登录成功');
INSERT INTO sys_operation_log VALUES ('7c843b1747134fe9b6e3a327752eb428', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-07 15:55:26', '登录成功');
INSERT INTO sys_operation_log VALUES ('88e29e41b6cb4814b7af951134a61ef1', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-07 16:06:01', '登录成功');
INSERT INTO sys_operation_log VALUES ('380d2f3a65f64b129a47d36cfec0a915', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-07 17:53:44', '登录成功');
INSERT INTO sys_operation_log VALUES ('2383ecd13a8e48d8bcec766e7102a8f6', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-08 09:05:44', '登录成功');
INSERT INTO sys_operation_log VALUES ('d52f262d80eb48228aa98185a40e64f7', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-10 09:17:09', '登录成功');
INSERT INTO sys_operation_log VALUES ('b92d7cdee5e3494689e4931d226fa219', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-10 09:31:23', '登录成功');
INSERT INTO sys_operation_log VALUES ('9e9bb618df5e434cb618241ab80a0c0e', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-10 09:42:12', '登录成功');
INSERT INTO sys_operation_log VALUES ('738250692d414f56be563c84076accd9', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-10 13:47:03', '登录成功');
INSERT INTO sys_operation_log VALUES ('61fe30328fb547dba4c56e61568a2e99', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-10 13:57:46', '登录成功');
INSERT INTO sys_operation_log VALUES ('e31ba1f57be841ec831f40faa58bc1b0', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-10 13:58:37', '登录成功');
INSERT INTO sys_operation_log VALUES ('aee39b997e65496cb57fb4fac951289d', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-10 14:30:12', '登录成功');
INSERT INTO sys_operation_log VALUES ('3f6281bbdfc142638cb534f29a2a2f5e', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-10 14:38:42', '登录成功');
INSERT INTO sys_operation_log VALUES ('e7584c853e064c539a60f72b7708aa7f', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-10 15:06:09', '登录成功');
INSERT INTO sys_operation_log VALUES ('8b3f1831a6bc42bf84cd2747cf529892', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-10 15:20:05', '登录成功');
INSERT INTO sys_operation_log VALUES ('c2e785d2584f4d5fa5422a72eeb4d83f', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-10 15:45:47', '登录成功');
INSERT INTO sys_operation_log VALUES ('6cb4440d03f9414296b54ee65d8a0eeb', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-10 16:06:07', '登录成功');
INSERT INTO sys_operation_log VALUES ('ef5e8ae191614239a473005112c3c618', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-10 16:08:12', '登录成功');
INSERT INTO sys_operation_log VALUES ('5c50c13cd398413fa00180995020611c', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-10 16:21:39', '登录成功');
INSERT INTO sys_operation_log VALUES ('6e71e2b82f6b4204bbbd6468f8b31a6f', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-10 16:24:15', '登录成功');
INSERT INTO sys_operation_log VALUES ('68d1dadc8a6a436f92d6660ba7ea8f00', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-10 16:31:14', '登录成功');
INSERT INTO sys_operation_log VALUES ('e42f1bb512a64df8bf5197deb4fa1079', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-10 16:37:28', '登录成功');
INSERT INTO sys_operation_log VALUES ('f8c69c8432174b3bbb0c7682d988cff2', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-10 17:03:13', '登录成功');
INSERT INTO sys_operation_log VALUES ('4d4c1695ef834404ada36a821ebafae4', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-10 17:22:19', '登录成功');
INSERT INTO sys_operation_log VALUES ('5ceda91e13424c08a29ba93c110b4371', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-10 17:39:33', '登录成功');
INSERT INTO sys_operation_log VALUES ('5052ec39e63746a5a95a3fcd9cb0a507', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-20 10:16:52', '登录成功');
INSERT INTO sys_operation_log VALUES ('df70ec2342bb4936b627af21a8314dea', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-20 11:02:28', '登录成功');
INSERT INTO sys_operation_log VALUES ('a016925efd2e43f68bf3024e8ab862a9', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-20 11:07:05', '登录成功');
INSERT INTO sys_operation_log VALUES ('d23f9e903adb4e21a6564d22f9204ccb', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-20 11:11:28', '登录成功');
INSERT INTO sys_operation_log VALUES ('9a8d65dd345940e390d862eea4a3e0f5', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-20 11:31:40', '登录成功');
INSERT INTO sys_operation_log VALUES ('3c3e6a1d517541f797018cb4a21fcab4', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-20 11:34:24', '登录成功');
INSERT INTO sys_operation_log VALUES ('e1d944b5154b45f9bdf580fde29c1b2d', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-20 14:03:26', '登录成功');
INSERT INTO sys_operation_log VALUES ('3fcbc451dc5e416bbcd5d871207bd8e9', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-20 14:23:04', '登录成功');
INSERT INTO sys_operation_log VALUES ('8619e53ff99b41dbbeb5f4ed0f50671a', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-20 14:41:24', '登录成功');
INSERT INTO sys_operation_log VALUES ('049af1c3645f4d52a99897aa926945b4', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-20 17:44:02', '登录成功');
INSERT INTO sys_operation_log VALUES ('052fa516545f4c0aad1fe4d65c4e9d86', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-20 17:57:17', '登录成功');
INSERT INTO sys_operation_log VALUES ('7eb1b2a097484db1bd3062a3db2f97a3', null, 'adminhfdb', null, null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-22 09:22:54', '登录失败,登录密码错误');
INSERT INTO sys_operation_log VALUES ('9cefe924607c4ea2b198379f489f706a', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-22 09:23:01', '登录成功');
INSERT INTO sys_operation_log VALUES ('dc9d95280bdd4bd1b8078dc605efd1b2', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-22 09:54:28', '登录成功');
INSERT INTO sys_operation_log VALUES ('3653a800d3b943659d794b4c9cf162f1', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-22 10:00:20', '登录成功');
INSERT INTO sys_operation_log VALUES ('09b741ae0fb14adeb517c46e6dfc668c', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '127.0.0.1', '00-FF-94-5E-15-50', null, '2022-06-22 10:01:40', '登录成功');
INSERT INTO sys_operation_log VALUES ('64b3888a21024b99809b041de7ec6d0d', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-22 10:03:44', '登录成功');
INSERT INTO sys_operation_log VALUES ('364dc9bef7284e769803e0b302c7f182', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '127.0.0.1', '00-FF-94-5E-15-50', null, '2022-06-22 10:56:30', '登录成功');
INSERT INTO sys_operation_log VALUES ('3527143075ec4dfa82912c511903000c', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-22 11:20:02', '登录成功');
INSERT INTO sys_operation_log VALUES ('7055a8e51f51419394e6053651e79f86', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-22 13:35:38', '登录成功');
INSERT INTO sys_operation_log VALUES ('1ca589f53c7546caa9cf169b49297e19', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-22 13:49:32', '登录成功');
INSERT INTO sys_operation_log VALUES ('1c9a5218a52b4ffca66adbf3563c0888', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-22 15:20:41', '登录成功');
INSERT INTO sys_operation_log VALUES ('ad463025a49d4883aef225c27352b5e9', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-22 16:23:49', '登录成功');
INSERT INTO sys_operation_log VALUES ('1772b223da0b4130b5e30620a0edc092', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-22 16:41:02', '登录成功');
INSERT INTO sys_operation_log VALUES ('0cce89874fdd4d0f8581b302fa6c98a3', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-22 16:51:48', '登录成功');
INSERT INTO sys_operation_log VALUES ('c70fbdf9c2374ad5a45ad40468edbe3f', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-22 17:12:42', '登录成功');
INSERT INTO sys_operation_log VALUES ('730d642c594c42b492fd4ec41f23a16d', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-22 17:58:31', '登录成功');
INSERT INTO sys_operation_log VALUES ('9263fb1c70e24fb2aa63df072b74eed8', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-23 09:26:03', '登录成功');
INSERT INTO sys_operation_log VALUES ('3d95c0bf904e405eaa4ff6468693714f', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-23 09:44:37', '登录成功');
INSERT INTO sys_operation_log VALUES ('29ac88525f804e4d8f1f76634e5b4d75', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-23 09:58:31', '登录成功');
INSERT INTO sys_operation_log VALUES ('6ef02aa0934f47958f9b1cc71b96ac2b', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-23 13:12:05', '登录成功');
INSERT INTO sys_operation_log VALUES ('09e7743b4c8045988ecb14ab43cd3e08', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-23 13:27:31', '登录成功');
INSERT INTO sys_operation_log VALUES ('0173504b57194e72a8f5c9f8e624bed2', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-23 13:38:50', '登录成功');
INSERT INTO sys_operation_log VALUES ('b0c5bfde13624cb2b2b97011e0f0a727', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-23 15:28:42', '登录成功');
INSERT INTO sys_operation_log VALUES ('910dc14f05214fb18a13dbf4c599bcb3', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-23 15:57:48', '登录成功');
INSERT INTO sys_operation_log VALUES ('77c9f464b55845aaa6b034d150e06724', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-23 16:16:28', '登录成功');
INSERT INTO sys_operation_log VALUES ('45d89a6bdbdc4ac6bcda8bbe909dd565', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-24 09:16:58', '登录成功');
INSERT INTO sys_operation_log VALUES ('a8d4fff7527b4a32b68b13031ffb8375', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-24 09:45:34', '登录成功');
INSERT INTO sys_operation_log VALUES ('e7bf6c3ae99143c982688fe1f5ac8e9b', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-24 09:58:20', '登录成功');
INSERT INTO sys_operation_log VALUES ('f40421dceb2e4057901d6674b1a612a4', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-24 10:17:29', '登录成功');
INSERT INTO sys_operation_log VALUES ('e27f94b8c0b943f787f9cafb68467dab', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-24 10:21:57', '登录成功');
INSERT INTO sys_operation_log VALUES ('06a6d6917099413286f5d6637ec6bf87', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-24 11:03:33', '登录成功');
INSERT INTO sys_operation_log VALUES ('2c34e74dbc5d4eaca3eab2c78ab88e64', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-24 13:09:45', '登录成功');
INSERT INTO sys_operation_log VALUES ('1a291cbee4ff44e4a64534e60435b894', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-24 13:44:03', '登录成功');
INSERT INTO sys_operation_log VALUES ('132cec2b25d740ac9d0697f5023e6bf3', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-24 14:08:42', '登录成功');
INSERT INTO sys_operation_log VALUES ('566eeceefd2b409cb4324ba69824b679', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-24 15:31:30', '登录成功');
INSERT INTO sys_operation_log VALUES ('6ff82c2c2c7745768500481af680b78e', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-24 15:52:23', '登录成功');
INSERT INTO sys_operation_log VALUES ('450b237815fc44a39d3eaceb5f93c98c', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-24 15:52:42', '登录成功');
INSERT INTO sys_operation_log VALUES ('f672a899adc74c1cbb81ac5008f50baa', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-24 16:17:01', '登录成功');
INSERT INTO sys_operation_log VALUES ('5141fa69df5b43358dbaf23b42b843ae', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-24 16:58:51', '登录成功');
INSERT INTO sys_operation_log VALUES ('c71e6503700d45a1a578acf43d863718', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-06-24 17:01:11', '登录成功');
INSERT INTO sys_operation_log VALUES ('2e49fb1681c749319181d2036d1f88e8', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.26', '00-50-56-85-76-C9', null, '2022-06-30 10:32:59', '登录成功');
INSERT INTO sys_operation_log VALUES ('da520357631540b0933190803ecc8238', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.29', '00-50-56-85-76-C9', null, '2022-06-30 18:03:47', '登录成功');
INSERT INTO sys_operation_log VALUES ('e25f9f18320647c89d69cddc1ab5b6fa', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.27', '00-50-56-85-76-C9', null, '2022-06-30 21:39:04', '登录成功');
INSERT INTO sys_operation_log VALUES ('a013cfa491694b00a82d334692cbce15', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.36', '00-50-56-85-76-C9', null, '2022-07-01 09:45:06', '登录成功');
INSERT INTO sys_operation_log VALUES ('b81c0185794f44d9b057aea605b4ac1c', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.36', '00-50-56-85-76-C9', null, '2022-07-01 09:45:28', '退出系统');
INSERT INTO sys_operation_log VALUES ('d6baf955f7c948eb9c499463b539db01', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.36', '00-50-56-85-76-C9', null, '2022-07-01 09:45:34', '登录成功');
INSERT INTO sys_operation_log VALUES ('923d45dc411644369d85ae4050a457c8', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.36', '00-50-56-85-76-C9', null, '2022-07-01 10:23:46', '登录成功');
INSERT INTO sys_operation_log VALUES ('64ec2a3100cf44a198758473133b0ff4', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.38', '00-50-56-85-76-C9', null, '2022-07-01 13:15:21', '登录成功');
INSERT INTO sys_operation_log VALUES ('aeb31565dae3404aa024afb4d5e6c495', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.38', '00-50-56-85-76-C9', null, '2022-07-01 14:14:56', '登录成功');
INSERT INTO sys_operation_log VALUES ('1631f43fe10b4c89bce4500af5031c42', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.38', '00-50-56-85-76-C9', null, '2022-07-01 14:45:12', '登录成功');
INSERT INTO sys_operation_log VALUES ('cc8da6ec42724455904474efb58f30d7', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.38', '00-50-56-85-76-C9', null, '2022-07-01 15:03:49', '登录成功');
INSERT INTO sys_operation_log VALUES ('3f73fd5753e0473f8d6cc70137c242e4', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.38', '00-50-56-85-76-C9', null, '2022-07-01 15:26:57', '登录成功');
INSERT INTO sys_operation_log VALUES ('024d8f5624034271b99053263092f3ec', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.38', '00-50-56-85-76-C9', null, '2022-07-01 15:37:31', '登录成功');
INSERT INTO sys_operation_log VALUES ('56b0d57039c5470c8c45909453992c5c', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.38', '00-50-56-85-76-C9', null, '2022-07-01 15:59:49', '登录成功');
INSERT INTO sys_operation_log VALUES ('7f5c2f3eb6444b0f96a13404272cef7a', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.38', '00-50-56-85-76-C9', null, '2022-07-01 16:36:41', '登录成功');
INSERT INTO sys_operation_log VALUES ('74bb4b138d2049aeb3746359e66c7368', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.38', '00-50-56-85-76-C9', null, '2022-07-01 16:55:23', '登录成功');
INSERT INTO sys_operation_log VALUES ('cd12dd662c3c4550a469b879fdccf5a2', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.38', '00-50-56-85-76-C9', null, '2022-07-01 17:47:55', '登录成功');
INSERT INTO sys_operation_log VALUES ('13b79361b3cd4afea203627161fa9964', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.44', '00-50-56-85-76-C9', null, '2022-07-04 16:48:42', '登录成功');
INSERT INTO sys_operation_log VALUES ('ae3ae5b651444000a193ca8f7b726111', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.44', '00-50-56-85-76-C9', null, '2022-07-04 16:48:42', '登录成功');
INSERT INTO sys_operation_log VALUES ('06eafc72a2294fe18296b9fab00c5ae3', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.1', '00-50-56-85-76-C9', null, '2022-07-05 10:11:36', '登录成功');
INSERT INTO sys_operation_log VALUES ('440e670ce49944baad5cb5f7ea115d5e', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.1', '00-50-56-85-76-C9', null, '2022-07-05 10:44:20', '登录成功');
INSERT INTO sys_operation_log VALUES ('05c811fbc80042a983c7b4b3c85c1fdb', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.1', '00-50-56-85-76-C9', null, '2022-07-05 11:12:50', '登录成功');
INSERT INTO sys_operation_log VALUES ('5be53cc8eab245a99070f3c6c81a7306', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.50', '00-50-56-85-76-C9', null, '2022-07-05 16:46:45', '登录成功');
INSERT INTO sys_operation_log VALUES ('f2ffbaf932444917ad32b37e8eb2b70e', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.50', '00-50-56-85-76-C9', null, '2022-07-05 16:46:47', '登录成功');
INSERT INTO sys_operation_log VALUES ('97b09942034b45a285b652fe432f8054', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.50', '00-50-56-85-76-C9', null, '2022-07-05 17:40:02', '登录成功');
INSERT INTO sys_operation_log VALUES ('a8fafa4bb88f4fd8af760acd8e5f294f', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.7', '00-50-56-85-76-C9', null, '2022-07-06 13:43:31', '登录成功');
INSERT INTO sys_operation_log VALUES ('3c84670b821f42eaba683cd5a778e3ba', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.7', '00-50-56-85-76-C9', null, '2022-07-06 14:58:54', '登录成功');
INSERT INTO sys_operation_log VALUES ('e51deba779d34e6aa530c9cb783fa9db', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.7', '00-50-56-85-76-C9', null, '2022-07-06 15:40:46', '登录成功');
INSERT INTO sys_operation_log VALUES ('9b78a089831f4c69ba2609e346e2d7e8', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.7', '00-50-56-85-76-C9', null, '2022-07-06 16:12:59', '登录成功');
INSERT INTO sys_operation_log VALUES ('90cefb1afcad4e5d8d132cbed446b887', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.10', '00-50-56-85-76-C9', null, '2022-07-08 11:54:50', '登录成功');
INSERT INTO sys_operation_log VALUES ('7f1d9e8041bb48248b0d5c21baa5f230', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.10', '00-50-56-85-76-C9', null, '2022-07-08 12:16:44', '登录成功');
INSERT INTO sys_operation_log VALUES ('83489a2186a6412ca0665d8ad6ceec11', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.10', '00-50-56-85-76-C9', null, '2022-07-08 13:22:48', '登录成功');
INSERT INTO sys_operation_log VALUES ('cf4857961cee43b395b9a0772ef6d08f', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.10', '00-50-56-85-76-C9', null, '2022-07-08 14:29:55', '登录成功');
INSERT INTO sys_operation_log VALUES ('ea1c243e871049fa8bae0161e53eaa1d', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.10', '00-50-56-85-76-C9', null, '2022-07-08 15:33:23', '登录成功');
INSERT INTO sys_operation_log VALUES ('32fa5c99a42941299a5bb23ceea60362', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.10', '00-50-56-85-76-C9', null, '2022-07-08 15:36:27', '登录成功');
INSERT INTO sys_operation_log VALUES ('88c3cf5eedf24e0bbf45cbc8db49570f', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.10', '00-50-56-85-76-C9', null, '2022-07-08 15:37:50', '登录成功');
INSERT INTO sys_operation_log VALUES ('d14154d55e574fcdbd62226d6e9ffc9e', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-07-08 15:39:06', '登录成功');
INSERT INTO sys_operation_log VALUES ('eca0f222cac34c6fac48d90f4e81ca3c', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-07-08 15:56:57', '登录成功');
INSERT INTO sys_operation_log VALUES ('77bf6a6c758844c99666adf3d314ddda', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.10', '00-50-56-85-76-C9', null, '2022-07-08 16:00:01', '登录成功');
INSERT INTO sys_operation_log VALUES ('1fc005414eb44bf3912fa5c3c862d2fd', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.10', '00-50-56-85-76-C9', null, '2022-07-08 16:12:19', '登录成功');
INSERT INTO sys_operation_log VALUES ('73996ae7d4164a31871c2de2f504f616', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-07-08 16:25:53', '登录成功');
INSERT INTO sys_operation_log VALUES ('b30cf7f378934b74aaf70f317f9c98de', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.35', '00-50-56-85-76-C9', null, '2022-07-18 15:05:11', '登录成功');
INSERT INTO sys_operation_log VALUES ('49034fe7dbed47cd808c22f395a0d40a', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.35', '00-50-56-85-76-C9', null, '2022-07-18 16:40:38', '登录成功');
INSERT INTO sys_operation_log VALUES ('90b15dac1356476182c1f1917bb9e0b2', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.37', '00-50-56-85-76-C9', null, '2022-07-19 16:14:46', '登录成功');
INSERT INTO sys_operation_log VALUES ('15ac15164d3843ac837624b9fcddf7e6', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.37', '00-50-56-85-76-C9', null, '2022-07-19 17:03:56', '登录成功');
INSERT INTO sys_operation_log VALUES ('1fd5d7c5aae348f8b2fee1fd93b838a5', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.40', '00-50-56-85-76-C9', null, '2022-07-20 09:18:55', '登录成功');
INSERT INTO sys_operation_log VALUES ('84535d8b39fc450ba1160522a5c801bb', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.42', '00-50-56-85-76-C9', null, '2022-07-20 09:35:27', '登录成功');
INSERT INTO sys_operation_log VALUES ('ca190d299a8b49a79f05a1115a366445', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.42', '00-50-56-85-76-C9', null, '2022-07-20 10:08:15', '登录成功');
INSERT INTO sys_operation_log VALUES ('8a80fb460dbb47bfa94a337e7d27eb25', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.42', '00-50-56-85-76-C9', null, '2022-07-20 10:27:28', '登录成功');
INSERT INTO sys_operation_log VALUES ('a52a0832ff484e49bf379cd9dcf212f7', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.42', '00-50-56-85-76-C9', null, '2022-07-20 13:06:45', '登录成功');
INSERT INTO sys_operation_log VALUES ('da745db531484fcc8f76ba9778ac1681', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.46', '00-50-56-85-76-C9', null, '2022-07-21 10:40:42', '登录成功');
INSERT INTO sys_operation_log VALUES ('99deb60947b74882bb06dbaa63972474', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.46', '00-50-56-85-76-C9', null, '2022-07-21 10:56:24', '登录成功');
INSERT INTO sys_operation_log VALUES ('a31291a17dfb4be0bbe939a573fe3e13', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.46', '00-50-56-85-76-C9', null, '2022-07-21 11:32:33', '登录成功');
INSERT INTO sys_operation_log VALUES ('0c64d1b842c74d61996abb635c5e9bb5', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.3', '00-50-56-85-76-C9', null, '2022-07-25 09:54:23', '登录成功');
INSERT INTO sys_operation_log VALUES ('572ca2a0c11947e99c77077878bd33d4', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-07-25 10:02:39', '登录成功');
INSERT INTO sys_operation_log VALUES ('a1db4509bf784fc488006660abca57d3', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.3', '00-50-56-85-76-C9', null, '2022-07-25 10:18:13', '登录成功');
INSERT INTO sys_operation_log VALUES ('1b61eae567fe4878b4aacb6307e81cdb', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.5', '00-50-56-85-76-C9', null, '2022-07-25 14:26:06', '登录成功');
INSERT INTO sys_operation_log VALUES ('66203eda685c4491831999e3b68c8892', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-07-25 14:36:00', '登录成功');
INSERT INTO sys_operation_log VALUES ('944571b605f745b1a6c5fcdd164eff04', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-07-25 15:33:02', '登录成功');
INSERT INTO sys_operation_log VALUES ('d08d0f0d03d8400a8df6f7174f8f2417', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-07-25 15:49:28', '登录成功');
INSERT INTO sys_operation_log VALUES ('1a87de3ae0094a9f90f9bbe7aadccc90', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.5', '00-50-56-85-76-C9', null, '2022-07-25 16:20:20', '登录成功');
INSERT INTO sys_operation_log VALUES ('13631d571af34609a0d8a968f7f25640', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.9', '00-50-56-85-76-C9', null, '2022-07-26 09:52:59', '登录成功');
INSERT INTO sys_operation_log VALUES ('8ff7ab333d7147fda203fc953d0bd79a', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.15', '00-50-56-85-76-C9', null, '2022-07-27 13:37:21', '登录成功');
INSERT INTO sys_operation_log VALUES ('f6cc895d77c0417ca183ece87773074b', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-07-27 17:30:16', '登录成功');
INSERT INTO sys_operation_log VALUES ('dbd962bf94b54d74aead25bf633c76e5', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-07-28 09:25:15', '登录成功');
INSERT INTO sys_operation_log VALUES ('75992ac12aa043b2add5cf7634343bff', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-07-28 09:29:50', '登录成功');
INSERT INTO sys_operation_log VALUES ('7a09e56263334b34ae4e87608904c855', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-07-28 10:13:05', '登录成功');
INSERT INTO sys_operation_log VALUES ('d539b27a7cf5422aae8c378b87b7bcea', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-07-28 10:14:47', '登录成功');
INSERT INTO sys_operation_log VALUES ('59a31e7697cd42a3a0bc7d2a4cd7a662', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-07-28 10:34:57', '登录成功');
INSERT INTO sys_operation_log VALUES ('21ab8c17729c46b9b19322fb4d32f704', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-07-28 10:40:34', '登录成功');
INSERT INTO sys_operation_log VALUES ('0665e83432584b77ac8defc0dd35a886', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-07-28 15:15:25', '登录成功');
INSERT INTO sys_operation_log VALUES ('9a29c93978b94021aa7529a27c952823', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-07-28 15:37:46', '登录成功');
INSERT INTO sys_operation_log VALUES ('92958edb3f3047f4bb024d6907a7cce2', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', '00-FF-94-5E-15-50', null, '2022-07-28 15:38:03', '登录成功');
INSERT INTO sys_operation_log VALUES ('088de2a58872401886c60e271ee3c0c6', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.50', '00-50-56-85-76-C9', null, '2022-08-04 10:38:13', '登录成功');
INSERT INTO sys_operation_log VALUES ('5dd1030bb1bd4645bebae25c5d6b6657', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.32', '00-50-56-85-76-C9', null, '2022-08-19 10:18:50', '登录成功');
INSERT INTO sys_operation_log VALUES ('bd264e6223e24df5966fa0a0e833247a', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.9', '00-50-56-85-76-C9', null, '2022-09-09 10:31:31', '登录成功');
INSERT INTO sys_operation_log VALUES ('859db288d0664fdaa67e7f1c30a0c27e', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.10', '00-50-56-85-76-C9', null, '2022-09-09 10:58:29', '登录成功');
INSERT INTO sys_operation_log VALUES ('812ce3a2c0a24b95b7274d110aace784', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.16.0.17', '00-50-56-85-76-C9', null, '2022-09-22 13:41:16', '登录成功');
INSERT INTO sys_operation_log VALUES ('0b69407448e24ed5b1ebb06b368dcf8a', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.16.0.17', '00-50-56-85-76-C9', null, '2022-09-22 13:41:16', '登录成功');
INSERT INTO sys_operation_log VALUES ('9eb709b24b9a442ca5b5f5bc8c1cff96', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.16.0.17', '00-50-56-85-76-C9', null, '2022-09-22 13:54:52', '登录成功');
INSERT INTO sys_operation_log VALUES ('195c2cb975e049ffb526d5fb440d6bd4', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.16.0.17', '00-50-56-85-76-C9', null, '2022-09-22 13:54:52', '登录成功');
INSERT INTO sys_operation_log VALUES ('9c5d541b77fa45c58bd38180c92cf4d3', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.32', '00-50-56-85-76-C9', null, '2022-09-22 14:35:25', '登录成功');
INSERT INTO sys_operation_log VALUES ('f494c992a8294e40bdb435b2bc7cb778', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.32', '00-50-56-85-76-C9', null, '2022-09-22 14:35:25', '登录成功');
INSERT INTO sys_operation_log VALUES ('49b37c0faf9f47ddb7d9d797bf2d75da', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.16', '00-50-56-85-76-C9', null, '2022-10-18 17:37:57', '登录成功');
INSERT INTO sys_operation_log VALUES ('c2f2ade3a8a94e5c852a8895d21c2568', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.16.0.18', '00-50-56-85-76-C9', null, '2023-04-07 09:24:56', '登录成功');
INSERT INTO sys_operation_log VALUES ('2920d475614c44e483979f0dcb633d66', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.16.0.18', '00-50-56-85-76-C9', null, '2023-04-07 09:33:21', '登录成功');
INSERT INTO sys_operation_log VALUES ('1ae7848bcfcd4ca2a9e3c81ba7399629', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.16.0.18', '00-50-56-85-76-C9', null, '2023-04-07 09:33:21', '登录成功');
INSERT INTO sys_operation_log VALUES ('a67b68da29474265b17b63e560cad858', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.16.0.18', '00-50-56-85-76-C9', null, '2023-04-07 09:36:50', '登录成功');
INSERT INTO sys_operation_log VALUES ('4e7152c9f3c044b7a08bcdb5a1e4e625', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.16.0.18', '00-50-56-85-76-C9', null, '2023-04-07 09:36:50', '登录成功');
INSERT INTO sys_operation_log VALUES ('f235fde7a0294a7b94edc768276ed4e9', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.9.0.101', '00-50-56-85-76-C9', null, '2023-04-07 11:32:24', '登录成功');
INSERT INTO sys_operation_log VALUES ('349a2f8ae4b640ac95884260fc48ec0b', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.41', '00-50-56-85-76-C9', null, '2023-05-10 11:12:09', '登录成功');
INSERT INTO sys_operation_log VALUES ('d210d84cabf149a3bdaaba55473a08b1', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.26', '00-50-56-85-76-C9', null, '2023-05-10 11:13:20', '登录成功');
INSERT INTO sys_operation_log VALUES ('dfcf23d4168d47dab7a386a0c78047e3', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.26', '00-50-56-85-76-C9', null, '2023-05-10 11:13:20', '登录成功');
INSERT INTO sys_operation_log VALUES ('47fac07c86cc4c04a3e02d9e048d096a', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.41', '00-50-56-85-76-C9', null, '2023-06-07 17:21:40', '登录成功');
INSERT INTO sys_operation_log VALUES ('8fadaea082de4829aca5537c114b10a2', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.41', '00-50-56-85-76-C9', null, '2023-06-07 17:33:33', '登录成功');
INSERT INTO sys_operation_log VALUES ('ef5b5aa5444949c185c35c715841b3d1', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.12', '00-50-56-85-76-C9', null, '2023-06-08 17:21:49', '登录成功');
INSERT INTO sys_operation_log VALUES ('0a516e8b749244d7819ee5d6dee29239', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.35', '00-50-56-85-76-C9', null, '2023-06-12 11:42:55', '登录成功');
INSERT INTO sys_operation_log VALUES ('0d1e8ce56d03453e861062fb6f31a224', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.8', '00-50-56-85-76-C9', null, '2023-06-12 14:19:34', '登录成功');
INSERT INTO sys_operation_log VALUES ('b5d93b4480f0459b9be8ba5f29fab614', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.8', '00-50-56-85-76-C9', null, '2023-06-12 14:34:33', '登录成功');
INSERT INTO sys_operation_log VALUES ('ad2fe771f19549ba80a497b31e7d6b08', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.50', '00-50-56-85-76-C9', null, '2023-06-13 11:24:06', '登录成功');
INSERT INTO sys_operation_log VALUES ('4b792a8cb5314df89eefae613df6d255', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.50', '00-50-56-85-76-C9', null, '2023-06-13 11:42:19', '登录成功');
INSERT INTO sys_operation_log VALUES ('19d3fb8ad9d843c08121deda51d1be98', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2023-06-13 12:15:03', '登录成功');
INSERT INTO sys_operation_log VALUES ('c0f566d68fb34d6db5fdd51a0ac168cc', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2023-06-13 15:07:33', '登录成功');
INSERT INTO sys_operation_log VALUES ('24afb10eb44c4ad09212dd1a8daaf783', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2023-06-13 15:18:10', '登录成功');
INSERT INTO sys_operation_log VALUES ('abbde94bb73b4f35a8f203e35d31fb36', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2023-06-13 15:27:13', '登录成功');
INSERT INTO sys_operation_log VALUES ('4c000ed771324625b35cb40f13eb1fdf', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '0:0:0:0:0:0:0:1', 'A4-B1-C1-3B-A9-DE', null, '2023-06-13 15:55:24', '登录成功');
INSERT INTO sys_operation_log VALUES ('fff8e27f2aa04b34b6b55d290ee985a6', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.16', '00-50-56-85-76-C9', null, '2023-06-13 17:01:53', '登录成功');
INSERT INTO sys_operation_log VALUES ('b347324752ad4d8eb945154bd21deb6c', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.16', '00-50-56-85-76-C9', null, '2023-06-13 17:20:18', '登录成功');
INSERT INTO sys_operation_log VALUES ('882a4d43f22541a4be96fdf70ab1a231', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.10', '00-50-56-85-76-C9', null, '2023-06-14 15:49:02', '登录成功');
INSERT INTO sys_operation_log VALUES ('7e5023b036e1410b95a5836d5dc7de1c', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.27', '00-50-56-85-76-C9', null, '2023-07-10 15:22:25', '登录成功');
INSERT INTO sys_operation_log VALUES ('0eb7466211b64e05b1d90b87ac59ad07', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.1', '00-50-56-85-76-C9', null, '2023-07-10 17:51:42', '登录成功');
INSERT INTO sys_operation_log VALUES ('6ffe6b7765d1446f880072853110f5c6', null, 'adminXDBANK222', null, null, '192.168.18.50', '00-50-56-85-76-C9', null, '2023-07-11 09:33:18', '登录失败,缺少法人信息');
INSERT INTO sys_operation_log VALUES ('86f5c3046ed94952b6b78be2801ed017', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.50', '00-50-56-85-76-C9', null, '2023-07-11 09:35:35', '登录成功');
INSERT INTO sys_operation_log VALUES ('f526ffc215e84059aa103b8126b49d65', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.50', '00-50-56-85-76-C9', null, '2023-07-11 09:35:36', '登录成功');
INSERT INTO sys_operation_log VALUES ('5d77663e966f4782bd42d886db35598e', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.50', '00-50-56-85-76-C9', null, '2023-07-11 09:48:44', '登录成功');
INSERT INTO sys_operation_log VALUES ('645213bcd3274bf79b5b7bf6c68f6f50', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.45', '00-50-56-85-76-C9', null, '2023-07-11 10:08:38', '登录成功');
INSERT INTO sys_operation_log VALUES ('91e6384459e0463ab899092d1b8206e2', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.20.0.101', '00-50-56-85-76-C9', null, '2023-07-11 10:39:32', '登录成功');
INSERT INTO sys_operation_log VALUES ('4c38104890974124811f67dfbe4bf2aa', null, 'adminxayh', null, null, '192.168.18.45', '00-50-56-85-76-C9', null, '2023-07-11 11:01:35', '登录失败,缺少法人信息');
INSERT INTO sys_operation_log VALUES ('639007a5f12a4e8d96b49ace88d79dba', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.45', '00-50-56-85-76-C9', null, '2023-07-11 11:01:41', '登录成功');
INSERT INTO sys_operation_log VALUES ('09b7d184654c48809841c70022d21bf1', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.15', '00-50-56-85-76-C9', null, '2023-07-13 09:53:12', '登录成功');
INSERT INTO sys_operation_log VALUES ('45812031ac5e40569424463d130d49e3', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.25', '00-50-56-85-76-C9', null, '2023-07-25 16:12:29', '登录成功');
INSERT INTO sys_operation_log VALUES ('d151007779534a12bdd0cae478e43046', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.25', '00-50-56-85-76-C9', null, '2023-07-25 17:12:41', '登录成功');
INSERT INTO sys_operation_log VALUES ('e930fdbe35a54383b7613e341b99682d', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.20.0.101', '00-50-56-85-C2-1C', null, '2023-07-26 15:48:11', '登录成功');
INSERT INTO sys_operation_log VALUES ('4c663ed3a3274f7e84a45e61a4d562c2', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.20.0.101', '00-50-56-85-C2-1C', null, '2023-07-26 16:21:06', '登录成功');
INSERT INTO sys_operation_log VALUES ('f7fc5d3b19b74013bb71f413512090e9', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.20.0.101', '00-50-56-85-C2-1C', null, '2023-07-26 16:34:11', '登录成功');
INSERT INTO sys_operation_log VALUES ('689b0b59f96944109537dab75576926f', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.20.0.101', '00-50-56-85-C2-1C', null, '2023-07-26 16:44:36', '登录成功');
INSERT INTO sys_operation_log VALUES ('4f16b872493140b2ba9653d598d2d5a5', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.20.0.101', '00-50-56-85-C2-1C', null, '2023-07-26 16:49:06', '登录成功');
INSERT INTO sys_operation_log VALUES ('7a3a1e49512c45ffb43046aeb6a60e81', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.20.0.101', '00-50-56-85-C2-1C', null, '2023-07-26 17:22:28', '登录成功');
INSERT INTO sys_operation_log VALUES ('760f7cd81ead46a3a6a6fb5abd45cab1', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.15.0.17', '00-50-56-85-C2-1C', null, '2023-07-27 16:57:33', '登录成功');
INSERT INTO sys_operation_log VALUES ('c409be7013f24163b80837428e95c007', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.15.0.17', '00-50-56-85-C2-1C', null, '2023-07-27 16:57:33', '登录成功');
INSERT INTO sys_operation_log VALUES ('00c3626c6b2045d5bb6e1cf75dd3e5c0', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.15.0.17', '00-50-56-85-C2-1C', null, '2023-07-27 18:05:20', '登录成功');
INSERT INTO sys_operation_log VALUES ('e8e8778197c44a16b7a72a155e4540fc', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.15.0.17', '00-50-56-85-C2-1C', null, '2023-07-27 18:05:20', '登录成功');
INSERT INTO sys_operation_log VALUES ('12ea6d7d991847fdb3e83ce2de003943', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.15.0.17', '00-50-56-85-C2-1C', null, '2023-08-22 11:38:02', '登录成功');
INSERT INTO sys_operation_log VALUES ('fa176288fc2e4d3a81c626319775f80f', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.15.0.17', '00-50-56-85-C2-1C', null, '2023-08-22 11:38:02', '登录成功');
INSERT INTO sys_operation_log VALUES ('93c63baec4ab46f8b24f0554040229a0', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.20.0.101', '00-50-56-85-C2-1C', null, '2023-09-13 16:38:32', '登录成功');
INSERT INTO sys_operation_log VALUES ('1dcf7cb8705a4b3e828cc35315b3f3b8', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.20.0.101', '00-50-56-85-C2-1C', null, '2023-09-13 17:08:49', '登录成功');
INSERT INTO sys_operation_log VALUES ('a7b67d800bd64c6c944b9c4f72784755', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.20.0.101', '00-50-56-85-C2-1C', null, '2023-09-15 10:03:31', '登录成功');
INSERT INTO sys_operation_log VALUES ('b700c22c7af94487a7662049074eb9de', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.20.0.101', '00-50-56-85-C2-1C', null, '2023-09-15 10:04:20', '登录成功');
INSERT INTO sys_operation_log VALUES ('73aa58fdda3148b49a51c9031a7418db', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.20.0.101', '00-50-56-85-C2-1C', null, '2023-09-22 10:07:57', '登录成功');
INSERT INTO sys_operation_log VALUES ('e24f950683b14b2d8eb84841e6f90712', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.20.0.101', '00-50-56-85-C2-1C', null, '2023-09-22 14:16:48', '登录成功');
INSERT INTO sys_operation_log VALUES ('cbe9a614677440dfa5d5d180d84609cd', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.20.0.101', '00-50-56-85-C2-1C', null, '2023-09-22 15:54:06', '登录成功');
INSERT INTO sys_operation_log VALUES ('2a1a2d6621604371a50b700c54ea6c78', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.20.0.101', '00-50-56-85-C2-1C', null, '2023-09-22 16:07:58', '登录成功');
INSERT INTO sys_operation_log VALUES ('3824e76352294baf9b0b9376ef65fe07', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.20.0.101', '00-50-56-85-C2-1C', null, '2023-10-06 18:47:28', '登录成功');
INSERT INTO sys_operation_log VALUES ('1d23b6dfd1fc4bf2b2130db2771ca08c', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.20.0.101', '00-50-56-85-C2-1C', null, '2023-10-07 20:58:08', '登录成功');
INSERT INTO sys_operation_log VALUES ('4a6dc33605f047a0bf08c5fc3c2ac2d8', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.41', '00-50-56-85-C2-1C', null, '2023-10-09 13:50:47', '登录成功');
INSERT INTO sys_operation_log VALUES ('0c88a2456aae4d67b7bfe0abf91aca25', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.41', '00-50-56-85-C2-1C', null, '2023-10-09 15:16:04', '登录成功');
INSERT INTO sys_operation_log VALUES ('1413fd68f3824af8b73bbcb35299add1', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.41', '00-50-56-85-C2-1C', null, '2023-10-09 16:01:12', '登录成功');
INSERT INTO sys_operation_log VALUES ('93dd4fbd9162440a89413bca78f52706', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.24', '00-50-56-85-C2-1C', null, '2023-10-09 16:42:39', '登录成功');
INSERT INTO sys_operation_log VALUES ('3265b690da6447e183b8d84223ab96d0', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.38', '00-50-56-85-C2-1C', null, '2023-10-10 09:39:40', '登录成功');
INSERT INTO sys_operation_log VALUES ('ecc1bfd0820144f8865fe019a40ee2c0', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.38', '00-50-56-85-C2-1C', null, '2023-10-10 14:57:55', '登录成功');
INSERT INTO sys_operation_log VALUES ('f08f73c12257453c97e5fe9ba39a0dac', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.31', '00-50-56-85-C2-1C', null, '2023-10-10 16:29:49', '登录成功');
INSERT INTO sys_operation_log VALUES ('f0761dd29a344f8cbf050ee6a7d0502f', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.15', '00-50-56-85-C2-1C', null, '2023-10-18 17:35:01', '登录成功');
INSERT INTO sys_operation_log VALUES ('613e3d3ee4b1453387ab9284c79d7ddc', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.7', '00-50-56-85-C2-1C', null, '2023-10-23 09:44:01', '登录成功');
INSERT INTO sys_operation_log VALUES ('bb6c5ca14de64b6da1489f21f67aadb0', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.11', '00-50-56-85-C2-1C', null, '2023-10-23 10:25:18', '登录成功');
INSERT INTO sys_operation_log VALUES ('87bec5ce102846088ad8e26a3b02c563', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.11', '00-50-56-85-C2-1C', null, '2023-10-23 10:41:45', '登录成功');
INSERT INTO sys_operation_log VALUES ('2f9575cd464742ffb638beb4c1557003', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.11', '00-50-56-85-C2-1C', null, '2023-10-23 11:25:00', '登录成功');
INSERT INTO sys_operation_log VALUES ('dcfd30bd29074306aa7e65d82c222561', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.11', '00-50-56-85-C2-1C', null, '2023-10-23 13:12:02', '登录成功');
INSERT INTO sys_operation_log VALUES ('3e463fab0eec425793712b3f63f2168e', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.29', '00-50-56-85-C2-1C', null, '2023-10-24 09:44:48', '登录成功');
INSERT INTO sys_operation_log VALUES ('e6f8f6aaccbf4d77800d95c824c2e197', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.29', '00-50-56-85-C2-1C', null, '2023-10-24 10:29:57', '登录成功');
INSERT INTO sys_operation_log VALUES ('5f18afeed04b4cb0954e2425d05aaa00', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.44', '00-50-56-85-C2-1C', null, '2023-10-24 11:29:57', '登录成功');
INSERT INTO sys_operation_log VALUES ('74b6b43498f74833a10aa41af862a501', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.44', '00-50-56-85-C2-1C', null, '2023-10-24 13:14:16', '登录成功');
INSERT INTO sys_operation_log VALUES ('3d2120b1c0af44bf86abaf033fd2c625', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.35', '00-50-56-85-C2-1C', null, '2023-10-24 14:42:04', '登录成功');
INSERT INTO sys_operation_log VALUES ('83039752268f4653b9633d883c04cab9', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.35', '00-50-56-85-C2-1C', null, '2023-10-24 14:57:12', '登录成功');
INSERT INTO sys_operation_log VALUES ('3b4f527df89142f7ae92c2d01f9ecdd8', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.35', '00-50-56-85-C2-1C', null, '2023-10-24 15:36:21', '登录成功');
INSERT INTO sys_operation_log VALUES ('eb3c1574aa054c6aa718507376f302c8', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.35', '00-50-56-85-C2-1C', null, '2023-10-24 15:58:21', '登录成功');
INSERT INTO sys_operation_log VALUES ('53fa62b813dd4265861cfec8a67c614f', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.42', '00-50-56-85-C2-1C', null, '2023-10-24 17:32:32', '登录成功');
INSERT INTO sys_operation_log VALUES ('f6dd031e85bc40f1bca2dcc9203fd512', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.48', '00-50-56-85-C2-1C', null, '2023-10-25 16:26:12', '登录成功');
INSERT INTO sys_operation_log VALUES ('1fe1a43864d74c2fbd2aaa1d3d0a489d', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.49', '00-50-56-85-C2-1C', null, '2023-10-30 14:47:49', '登录成功');
INSERT INTO sys_operation_log VALUES ('e6635b1f76744fac8653bb9e7abb400d', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.49', '00-50-56-85-C2-1C', null, '2023-10-30 15:04:53', '登录成功');
INSERT INTO sys_operation_log VALUES ('503bf6af677240219559070bced10fdd', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.49', '00-50-56-85-C2-1C', null, '2023-10-30 15:54:05', '登录成功');
INSERT INTO sys_operation_log VALUES ('714e757b9f51463689aafb49fb7a3d27', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.49', '00-50-56-85-C2-1C', null, '2023-10-30 16:31:00', '登录成功');
INSERT INTO sys_operation_log VALUES ('0571a2e3fa204a6f95d360da48e9e637', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.26', '00-50-56-85-C2-1C', null, '2023-11-07 14:02:33', '登录成功');
INSERT INTO sys_operation_log VALUES ('8c39f9a02ed84a1a92a70ae141b0fb21', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.29', '00-50-56-85-C2-1C', null, '2023-11-08 09:57:05', '登录成功');
INSERT INTO sys_operation_log VALUES ('2ea6ca737c9e4211909d09bbe9c20fc0', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.30', '00-50-56-85-C2-1C', null, '2023-11-08 11:01:37', '登录成功');
INSERT INTO sys_operation_log VALUES ('a557e4faeee34b20b2ab09240d250ea6', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.30', '00-50-56-85-C2-1C', null, '2023-11-08 13:39:58', '登录成功');
INSERT INTO sys_operation_log VALUES ('2c1e6d7f0d65415cba0fdd625391233d', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.30', '00-50-56-85-C2-1C', null, '2023-11-08 14:18:18', '登录成功');
INSERT INTO sys_operation_log VALUES ('19f0b70fe65443198befee7643e4a29c', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.48', '00-50-56-85-C2-1C', null, '2023-11-08 14:49:39', '登录成功');
INSERT INTO sys_operation_log VALUES ('18d0e45c29fc4633930135217a832036', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.32', '00-50-56-85-C2-1C', null, '2023-11-08 15:56:40', '登录成功');
INSERT INTO sys_operation_log VALUES ('3a728d2762bd4066bf543aadc63bf809', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.45', '00-50-56-85-C2-1C', null, '2023-11-08 16:16:03', '登录成功');
INSERT INTO sys_operation_log VALUES ('dd7116f344f6425e844ed561c498970e', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.9.0.201', '00-50-56-85-C2-1C', null, '2023-11-09 10:32:38', '登录成功');
INSERT INTO sys_operation_log VALUES ('59f74c965a8e415f9480d8189fffa535', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.39', '00-50-56-85-C2-1C', null, '2023-11-09 10:46:00', '登录成功');
INSERT INTO sys_operation_log VALUES ('ab19943a138c4644bc0c593aac0f04ad', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.39', '00-50-56-85-C2-1C', null, '2023-11-09 11:20:04', '登录成功');
INSERT INTO sys_operation_log VALUES ('a979c70b20824cc2a4c8542405781831', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.39', '00-50-56-85-C2-1C', null, '2023-11-09 13:08:06', '登录成功');
INSERT INTO sys_operation_log VALUES ('6cdba7d963e2439abd3af37542bd8652', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.39', '00-50-56-85-C2-1C', null, '2023-11-09 13:25:48', '登录成功');
INSERT INTO sys_operation_log VALUES ('0c0d84469cc1495db5b0764a994aef65', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.33', '00-50-56-85-C2-1C', null, '2023-11-09 15:48:02', '登录成功');
INSERT INTO sys_operation_log VALUES ('4e9baae0ba364310ad4cbc5d7dc3884e', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.9.0.201', '00-50-56-85-C2-1C', null, '2023-11-10 10:08:26', '登录成功');
INSERT INTO sys_operation_log VALUES ('664157d2875042049757ef025cca0925', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.17', '00-50-56-85-C2-1C', null, '2023-11-10 16:42:10', '登录成功');
INSERT INTO sys_operation_log VALUES ('972d5de9ea934bfc85bb7fa39f4d409c', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.11', '00-50-56-85-C2-1C', null, '2023-11-13 10:19:37', '登录成功');
INSERT INTO sys_operation_log VALUES ('414a6f378a194f5b8ec0c0a5f39168ca', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.11', '00-50-56-85-C2-1C', null, '2023-11-13 10:33:44', '登录成功');
INSERT INTO sys_operation_log VALUES ('20815fa49626453da47beef6bd8ca4bc', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.11', '00-50-56-85-C2-1C', null, '2023-11-13 11:12:45', '登录成功');
INSERT INTO sys_operation_log VALUES ('808c9bea74504386a6db7d90af37a5b2', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.9.0.201', '00-50-56-85-C2-1C', null, '2023-11-13 11:22:00', '登录成功');
INSERT INTO sys_operation_log VALUES ('01403a648f25477eaa17b79d665b2d92', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.20.0.101', '00-50-56-85-C2-1C', null, '2023-11-15 21:34:31', '登录成功');
INSERT INTO sys_operation_log VALUES ('7dc2ae51a94143298434e96dee69f863', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.20.0.101', '00-50-56-85-C2-1C', null, '2023-11-15 21:34:31', '登录成功');
INSERT INTO sys_operation_log VALUES ('76badfc1555e43c4a642f937ae105ba6', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.20.0.101', '00-50-56-85-C2-1C', null, '2023-11-18 10:30:00', '登录成功');
INSERT INTO sys_operation_log VALUES ('75f36fdf160742009838b01eae8f4773', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.41', '00-50-56-85-C2-1C', null, '2023-11-21 13:15:01', '登录成功');
INSERT INTO sys_operation_log VALUES ('a58a7e1cfc874071bd4f5ab5d115dfb5', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.18', '00-50-56-85-C2-1C', null, '2023-11-21 15:50:34', '登录成功');
INSERT INTO sys_operation_log VALUES ('f03b5517175d4a25ab2e278dbc8cc56e', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.9.0.201', '00-50-56-85-C2-1C', null, '2023-11-21 16:50:26', '登录成功');
INSERT INTO sys_operation_log VALUES ('aa5f8186950f4e06a09a46a2dabd8bbc', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.50', '00-50-56-85-C2-1C', null, '2023-11-23 14:47:22', '登录成功');
INSERT INTO sys_operation_log VALUES ('9b9d1c5de59649fa8acbf84b3fbc645e', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.50', '00-50-56-85-C2-1C', null, '2023-11-23 15:35:24', '登录成功');
INSERT INTO sys_operation_log VALUES ('cfe7adf4fed2463b8d922f0d5eeaee3f', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.7.0.203', '00-50-56-85-C2-1C', null, '2023-11-30 13:14:35', '登录成功');
INSERT INTO sys_operation_log VALUES ('7681e0a293ea432eb5ba77f5490bf692', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.7.0.203', '00-50-56-85-C2-1C', null, '2023-11-30 13:14:35', '登录成功');
INSERT INTO sys_operation_log VALUES ('f6e132b1235c46d49063677869f27aaa', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.7.0.203', '00-50-56-85-C2-1C', null, '2023-11-30 14:46:08', '登录成功');
INSERT INTO sys_operation_log VALUES ('04280f9bc3704cd5b700860f62559a4a', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.7.0.203', '00-50-56-85-C2-1C', null, '2023-11-30 14:46:10', '登录成功');
INSERT INTO sys_operation_log VALUES ('e036ed3c4e944071a4507c13d542ac80', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.7.0.203', '00-50-56-85-C2-1C', null, '2023-11-30 14:46:08', '登录成功');
INSERT INTO sys_operation_log VALUES ('b21e9fdf29a54b3eacb42943d0e9a864', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.7.0.203', '00-50-56-85-C2-1C', null, '2023-11-30 14:46:17', '登录成功');
INSERT INTO sys_operation_log VALUES ('de2ea18b112c49ea8b20d44c4c4abbe8', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.7.0.203', '00-50-56-85-C2-1C', null, '2023-11-30 16:06:24', '登录成功');
INSERT INTO sys_operation_log VALUES ('bc778b7d33dc4372aafb1022d8e00a6c', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.7.0.203', '00-50-56-85-C2-1C', null, '2023-12-01 09:06:06', '登录成功');
INSERT INTO sys_operation_log VALUES ('cd81fce25fd3430e8a56f75922d958bb', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.7.0.203', '00-50-56-85-C2-1C', null, '2023-12-01 09:06:06', '登录成功');
INSERT INTO sys_operation_log VALUES ('a2b4d8680a5f4623b727e4243bf0a6a6', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.7.0.203', '00-50-56-85-C2-1C', null, '2023-12-01 09:18:04', '登录成功');
INSERT INTO sys_operation_log VALUES ('e9537415b31c48908526f02680dfea86', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.7.0.203', '00-50-56-85-C2-1C', null, '2023-12-01 09:18:04', '登录成功');
INSERT INTO sys_operation_log VALUES ('9855314d5e88458eb669248ef0200a2e', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.30', '00-50-56-85-C2-1C', null, '2023-12-01 11:28:22', '登录成功');
INSERT INTO sys_operation_log VALUES ('6412912f38204874b5c0d8d75b5ecc62', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.7.0.203', '00-50-56-85-C2-1C', null, '2023-12-01 13:35:13', '登录成功');
INSERT INTO sys_operation_log VALUES ('91665dab697a4d5184458bc1b860b981', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.7.0.203', '00-50-56-85-C2-1C', null, '2023-12-01 13:35:13', '登录成功');
INSERT INTO sys_operation_log VALUES ('6358cc1dc1b84f7a8a0457961fad77ae', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2023-12-04 11:39:27', '登录成功');
INSERT INTO sys_operation_log VALUES ('a70441f3014d4039b64e5716a90c029e', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2023-12-04 11:39:27', '登录成功');
INSERT INTO sys_operation_log VALUES ('607662ca7cc2432bac7cfc9c5405facd', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2023-12-04 13:03:52', '登录成功');
INSERT INTO sys_operation_log VALUES ('9b7d24b27c56455cadae10939acd47d7', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.4', '00-50-56-85-C2-1C', null, '2023-12-05 10:40:24', '登录成功');
INSERT INTO sys_operation_log VALUES ('6cda3a8971ad4c7da173ba62cda1d020', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2023-12-05 14:04:21', '登录成功');
INSERT INTO sys_operation_log VALUES ('9bd3f0be0baf4f388c09f9e2c125f0d7', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2023-12-05 14:04:36', '退出系统');
INSERT INTO sys_operation_log VALUES ('579879d2b41e42a28a9719c4cf980b1f', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2023-12-05 14:04:40', '登录成功');
INSERT INTO sys_operation_log VALUES ('459cdeee60164352b1888f51199cda0a', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2023-12-06 13:54:47', '登录成功');
INSERT INTO sys_operation_log VALUES ('2e02362a8cac4aba995c98d30a2a385d', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2023-12-06 13:54:48', '登录成功');
INSERT INTO sys_operation_log VALUES ('9bdc0d7f6639446eaa3278a080004707', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2023-12-06 13:54:51', '登录成功');
INSERT INTO sys_operation_log VALUES ('1c8270809c5146b68a987bd96699bda8', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2023-12-06 13:54:51', '登录成功');
INSERT INTO sys_operation_log VALUES ('9ee2661814824429880e641a06673112', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2023-12-07 14:23:01', '登录成功');
INSERT INTO sys_operation_log VALUES ('829257ef194147c7ac85ddceb24bd438', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2023-12-07 15:31:13', '登录成功');
INSERT INTO sys_operation_log VALUES ('4b6c8fffe9b04ea78b62e9eb8aed40cc', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2023-12-07 15:31:13', '登录成功');
INSERT INTO sys_operation_log VALUES ('b75a249fafe54e348ae3492b35ab23f8', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2023-12-08 13:52:45', '登录成功');
INSERT INTO sys_operation_log VALUES ('069cc64773e044c0bd3a1e530692bc3a', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2023-12-08 13:52:45', '登录成功');
INSERT INTO sys_operation_log VALUES ('4f6058bcdebd4e819dca5776ecf9b598', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2023-12-12 09:47:59', '登录成功');
INSERT INTO sys_operation_log VALUES ('bcb32af0e6d644b5a0f1ad2fa9bf11c4', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2023-12-12 09:47:59', '登录成功');
INSERT INTO sys_operation_log VALUES ('c7a35a0fed4f47dc860ad4450a3926e9', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2023-12-12 11:16:36', '登录成功');
INSERT INTO sys_operation_log VALUES ('060c4c0ba36e4c549a5a4f31ba58fd19', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2023-12-12 11:16:36', '登录成功');
INSERT INTO sys_operation_log VALUES ('4b6af4459ec849fcb371b74589049163', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2023-12-13 16:11:17', '登录成功');
INSERT INTO sys_operation_log VALUES ('7b87e320305342d8a92ef827a2071d6c', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2023-12-14 15:06:50', '登录成功');
INSERT INTO sys_operation_log VALUES ('31700449aedd4cd8ba0d6601cb3dcd46', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.3', '00-50-56-85-C2-1C', null, '2023-12-15 09:09:18', '登录成功');
INSERT INTO sys_operation_log VALUES ('5eb46a2803ac49f4b3f5217d3eb77279', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2023-12-15 17:44:32', '登录成功');
INSERT INTO sys_operation_log VALUES ('76d0e5fa4af64017a220034315fbb9e6', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2023-12-15 17:44:32', '登录成功');
INSERT INTO sys_operation_log VALUES ('ce18d2fdc24f43f983148b61189e6f33', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.13', '00-50-56-85-C2-1C', null, '2023-12-18 13:56:13', '登录成功');
INSERT INTO sys_operation_log VALUES ('96a7bd20cb2647da83916fa160a8a134', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.13', '00-50-56-85-C2-1C', null, '2023-12-18 15:48:54', '登录成功');
INSERT INTO sys_operation_log VALUES ('34af450e70fc4d229ecb3f79ba2b25ca', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.21', '00-50-56-85-C2-1C', null, '2023-12-19 14:29:08', '登录成功');
INSERT INTO sys_operation_log VALUES ('fac12c5b2d304efb85d1a5d0f0c5a3b9', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2023-12-19 15:01:23', '登录成功');
INSERT INTO sys_operation_log VALUES ('8a47c57a71de4f29a3d6418c52f05caa', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2023-12-19 15:01:23', '登录成功');
INSERT INTO sys_operation_log VALUES ('ab172194e4ca4c3d87c47a0ad0428381', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.21', '00-50-56-85-C2-1C', null, '2023-12-19 16:17:38', '登录成功');
INSERT INTO sys_operation_log VALUES ('c69fb3ac391f4ba98a1db2e6070e48bc', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.20.0.101', '00-50-56-85-C2-1C', null, '2023-12-19 20:03:28', '登录成功');
INSERT INTO sys_operation_log VALUES ('55f2d26434d846b3bef508c8a54ae761', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2023-12-19 21:21:57', '登录成功');
INSERT INTO sys_operation_log VALUES ('d1eb4e63a8e7477c941874fa931e18d1', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2023-12-19 21:21:57', '登录成功');
INSERT INTO sys_operation_log VALUES ('1761935e6190408f9e9b6c2f3f0e0390', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2023-12-19 21:21:57', '登录成功');
INSERT INTO sys_operation_log VALUES ('684ed6204f17426ca85570d08f41fcbf', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2023-12-19 21:22:00', '登录成功');
INSERT INTO sys_operation_log VALUES ('6266d902338b4ebabbf1a71a183027e4', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.20.0.101', '00-50-56-85-C2-1C', null, '2023-12-19 21:24:53', '登录成功');
INSERT INTO sys_operation_log VALUES ('9ed26b7f696a4ef1a0bebf08f3ae554b', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2023-12-19 21:44:52', '登录成功');
INSERT INTO sys_operation_log VALUES ('5eab73edb66a482b81a0ab85ca4e774c', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2023-12-19 21:45:36', '退出系统');
INSERT INTO sys_operation_log VALUES ('f3bf64c26ce34a459adee3b88c942e30', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2023-12-19 21:48:04', '登录成功');
INSERT INTO sys_operation_log VALUES ('adbeb5d0498b431a8c3858c027e3ed91', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2023-12-19 21:48:57', '退出系统');
INSERT INTO sys_operation_log VALUES ('e34c503b06a1483e8f59c8c5b75719f5', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.42', '00-50-56-85-C2-1C', null, '2023-12-20 10:27:46', '登录成功');
INSERT INTO sys_operation_log VALUES ('bbb81c4b86b24e86abba75f11b326c6f', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2023-12-20 17:40:29', '登录成功');
INSERT INTO sys_operation_log VALUES ('0c1daba683cc46aa84b5f3bd7b954baa', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2023-12-21 16:38:56', '登录成功');
INSERT INTO sys_operation_log VALUES ('62a223fe39c74262b4fbdd711e13df73', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2023-12-21 16:38:56', '登录成功');
INSERT INTO sys_operation_log VALUES ('ff5ef30b012047998fda971080aac59e', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2023-12-22 17:17:53', '登录成功');
INSERT INTO sys_operation_log VALUES ('425998b2c35f467b9e30b2d26ae67e02', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2023-12-22 17:17:53', '登录成功');
INSERT INTO sys_operation_log VALUES ('4f5b207b9b9c452680be31f0e4ad0d3a', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2023-12-25 09:34:27', '登录成功');
INSERT INTO sys_operation_log VALUES ('90eff4ee3468441f8fb54b153dfc760d', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2023-12-25 09:34:27', '登录成功');
INSERT INTO sys_operation_log VALUES ('71d988c35abe42a3b761854becd7cbc4', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2023-12-26 10:15:38', '登录成功');
INSERT INTO sys_operation_log VALUES ('05a45a6534d54224b9ae75ba900cb5b6', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2023-12-26 10:15:38', '登录成功');
INSERT INTO sys_operation_log VALUES ('7ae9e5bccd5d41888320f4f1cb5b6e83', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.15', '00-50-56-85-C2-1C', null, '2023-12-26 17:16:41', '登录成功');
INSERT INTO sys_operation_log VALUES ('d716796e89404f9695fd3d22687b474e', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2023-12-27 13:44:33', '登录成功');
INSERT INTO sys_operation_log VALUES ('d8457816a2a642ae95aac517b3057326', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2023-12-27 13:44:33', '登录成功');
INSERT INTO sys_operation_log VALUES ('be1a9ddb91454740b18bbda4a11bc579', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2023-12-28 12:44:03', '登录成功');
INSERT INTO sys_operation_log VALUES ('875c06e4dfe244f2b786e39a8be3436e', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2023-12-29 12:24:07', '登录成功');
INSERT INTO sys_operation_log VALUES ('929176a7dc414bc1b4ce7a772eed4f45', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2023-12-29 12:42:09', '登录成功');
INSERT INTO sys_operation_log VALUES ('2eafe22788ff4142a45745f6d7345280', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2023-12-29 12:42:09', '登录成功');
INSERT INTO sys_operation_log VALUES ('7d81711024d449f6a710b327a18581e8', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2023-12-29 12:42:09', '登录成功');
INSERT INTO sys_operation_log VALUES ('25417dffd03f4643b020b4cc91c035cb', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2023-12-29 12:42:09', '登录成功');
INSERT INTO sys_operation_log VALUES ('a0c240d2ea76495f9565317b982c377c', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.11', '00-50-56-85-C2-1C', null, '2024-01-02 10:11:44', '登录成功');
INSERT INTO sys_operation_log VALUES ('d22bdfcc3d164e7c88e5d95989ade886', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.13', '00-50-56-85-C2-1C', null, '2024-01-02 14:59:55', '登录成功');
INSERT INTO sys_operation_log VALUES ('73ae2af471024e34a5a4757ae8cade44', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.13', '00-50-56-85-C2-1C', null, '2024-01-02 15:21:26', '登录成功');
INSERT INTO sys_operation_log VALUES ('027b6f982bad425eab024e1ac750493b', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-01-02 15:59:51', '登录成功');
INSERT INTO sys_operation_log VALUES ('a3ba243c4187471ead5c1b2186a0fb97', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-01-02 16:18:29', '登录成功');
INSERT INTO sys_operation_log VALUES ('8f1552c97d504d8894ef5e3cae4ed18c', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-01-02 16:18:29', '登录成功');
INSERT INTO sys_operation_log VALUES ('f27a0457474d473cbdfd3fd10ed710b7', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-01-05 15:41:00', '登录成功');
INSERT INTO sys_operation_log VALUES ('be85801bd1ef456a91540e3c163e2c17', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-01-05 15:41:00', '登录成功');
INSERT INTO sys_operation_log VALUES ('88106bff52624f5082146b2e8e27a4eb', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-01-05 16:00:01', '退出系统');
INSERT INTO sys_operation_log VALUES ('466adff2cf9d427c81ea52aa0efa3a9a', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-01-05 16:00:06', '登录成功');
INSERT INTO sys_operation_log VALUES ('f1acedebec6348cdafb805001589eb66', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-01-05 16:00:06', '登录成功');
INSERT INTO sys_operation_log VALUES ('83f1ee97800b4f339542b29432855603', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-01-08 11:45:54', '登录成功');
INSERT INTO sys_operation_log VALUES ('7bb65f3aa995446aa8a4f7adb798a480', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-01-08 11:45:54', '登录成功');
INSERT INTO sys_operation_log VALUES ('c81bf40d81f64f1fbbf813731a624aa7', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-01-08 17:47:58', '登录成功');
INSERT INTO sys_operation_log VALUES ('7a502cb4bd5746fdaf942e0b8bd44a12', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.10', '00-50-56-85-C2-1C', null, '2024-01-10 13:42:29', '登录成功');
INSERT INTO sys_operation_log VALUES ('5c1dc4e1fb87410fa9e7cc549615b6a6', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.47', '00-50-56-85-C2-1C', null, '2024-01-10 15:05:47', '登录成功');
INSERT INTO sys_operation_log VALUES ('0010a41cba64415889f161d7399260d9', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.34', '00-50-56-85-C2-1C', null, '2024-01-10 15:30:05', '登录成功');
INSERT INTO sys_operation_log VALUES ('0ad1ddb4861147e8b750637fe9e963b5', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.38', '00-50-56-85-C2-1C', null, '2024-01-12 13:10:19', '登录成功');
INSERT INTO sys_operation_log VALUES ('330ffc7db1d047cb8264c534d89aaa58', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.38', '00-50-56-85-C2-1C', null, '2024-01-12 14:04:10', '登录成功');
INSERT INTO sys_operation_log VALUES ('b44b7585af804a728c3afb9e67edb207', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.25', '00-50-56-85-C2-1C', null, '2024-01-15 09:13:50', '登录成功');
INSERT INTO sys_operation_log VALUES ('68e8a485b84e438e8d0cdf17a1e0e183', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.25', '00-50-56-85-C2-1C', null, '2024-01-15 09:45:34', '登录成功');
INSERT INTO sys_operation_log VALUES ('007c02939ae14b6ebed7b3bad76a101c', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.17', '00-50-56-85-C2-1C', null, '2024-01-15 10:40:40', '登录成功');
INSERT INTO sys_operation_log VALUES ('a39a74e44b1e4c21850a720646d72d7e', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.28', '00-50-56-85-C2-1C', null, '2024-01-15 11:25:10', '登录成功');
INSERT INTO sys_operation_log VALUES ('9d48ce64416a47c88b2e26c421bc4769', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.9', '00-50-56-85-C2-1C', null, '2024-01-15 13:13:34', '登录成功');
INSERT INTO sys_operation_log VALUES ('96ca609b9ec3465cb45bb7b0302cc880', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.9', '00-50-56-85-C2-1C', null, '2024-01-15 13:39:54', '登录成功');
INSERT INTO sys_operation_log VALUES ('e1840209f5e54fe8a5d3b6b9af690fa6', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.9', '00-50-56-85-C2-1C', null, '2024-01-15 13:50:11', '登录成功');
INSERT INTO sys_operation_log VALUES ('b7638de4ed4041f68ea8493750f79b81', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-01-15 16:16:18', '登录成功');
INSERT INTO sys_operation_log VALUES ('f32373b806d5410b914ede88d781e9e5', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-01-15 16:59:03', '登录成功');
INSERT INTO sys_operation_log VALUES ('6ae79b0792474c9583e838384ec968ba', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-01-16 13:25:33', '登录成功');
INSERT INTO sys_operation_log VALUES ('9051ac2305f94e6fb0bcb204fd06bf1b', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-01-16 13:25:34', '登录成功');
INSERT INTO sys_operation_log VALUES ('c0a08e115705424d9a900ba24d1fcc79', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-01-17 13:18:49', '登录成功');
INSERT INTO sys_operation_log VALUES ('2c2a1ef0ecaa4316b89354f75a497c1e', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-01-18 13:32:56', '登录成功');
INSERT INTO sys_operation_log VALUES ('956bd5f3617b40e4a7c329f5d662b24e', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-01-18 13:32:56', '登录成功');
INSERT INTO sys_operation_log VALUES ('60a00daa97ff46b99f1c45c0987c6b2f', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-01-19 10:15:10', '登录成功');
INSERT INTO sys_operation_log VALUES ('ba16b777f75c4cb8a6b621b385f11261', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-01-19 10:15:10', '登录成功');
INSERT INTO sys_operation_log VALUES ('4d37aea0363640ceb1c8d5b6b63cc09e', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-01-22 09:18:08', '登录成功');
INSERT INTO sys_operation_log VALUES ('214ef38434164348b31fae7fa6d736bd', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-01-22 09:18:08', '登录成功');
INSERT INTO sys_operation_log VALUES ('1c08e305b3e645f99290ac517e1c1fea', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-01-22 09:26:58', '退出系统');
INSERT INTO sys_operation_log VALUES ('f790e5f1c43c44148154a910eb2fa957', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-01-22 09:27:03', '登录成功');
INSERT INTO sys_operation_log VALUES ('cd3617c0600e46e4854e75758de79941', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-01-22 09:27:03', '登录成功');
INSERT INTO sys_operation_log VALUES ('8f1e7484b2ac4432bbdf404f2c346b7d', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-01-23 12:51:27', '登录成功');
INSERT INTO sys_operation_log VALUES ('b04b2eb6dff045de8b5329d46be62610', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-01-23 12:51:27', '登录成功');
INSERT INTO sys_operation_log VALUES ('d20ebf671e594198b783c8f6fc856991', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-01-24 10:26:50', '登录成功');
INSERT INTO sys_operation_log VALUES ('144d4da214bf417794e779f58c458da1', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-01-24 10:26:50', '登录成功');
INSERT INTO sys_operation_log VALUES ('1b219820954c47398b14992fb3c8820b', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-01-24 10:26:50', '登录成功');
INSERT INTO sys_operation_log VALUES ('9e19bd877eb04aaf8a6175458b453bd5', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-01-25 11:21:15', '登录成功');
INSERT INTO sys_operation_log VALUES ('630de6f73f2742569031f6baf8f2119c', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-01-25 11:21:15', '登录成功');
INSERT INTO sys_operation_log VALUES ('2a142b2757a242fdbd92d8678b835913', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-01-25 11:43:35', '登录成功');
INSERT INTO sys_operation_log VALUES ('ba4c97529caa469fb49fd3906c4e6e7d', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-01-25 11:47:19', '退出系统');
INSERT INTO sys_operation_log VALUES ('2c230e6f4dd445ebaecef7d375cdf183', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-01-25 11:47:23', '登录成功');
INSERT INTO sys_operation_log VALUES ('02cf22fdcbe04798b8604aaa94589c60', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-01-26 10:53:40', '登录成功');
INSERT INTO sys_operation_log VALUES ('4720b5d5b7524181b85d6332ed8dbf30', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-01-26 10:53:40', '登录成功');
INSERT INTO sys_operation_log VALUES ('cfc17f0ebfa44c368a8e2a5c436d6fb3', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-01-26 11:46:24', '登录成功');
INSERT INTO sys_operation_log VALUES ('b16e3eb1e50c4004905b114f39fbfcb0', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-01-26 11:46:24', '登录成功');
INSERT INTO sys_operation_log VALUES ('36a632903d3c42cd84866355f5a6e4bf', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-01-29 12:05:12', '登录成功');
INSERT INTO sys_operation_log VALUES ('40baec9beda640e6bd4eab3eb431c321', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-01-29 12:05:12', '登录成功');
INSERT INTO sys_operation_log VALUES ('7107b014860c4c69b640488c16baea1a', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-01-29 12:23:22', '登录成功');
INSERT INTO sys_operation_log VALUES ('f6469005569f4e6db7fead0c7e1ab8a5', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.9', '00-50-56-85-C2-1C', null, '2024-01-29 14:25:04', '登录成功');
INSERT INTO sys_operation_log VALUES ('2453a5db3f804baf97291542d299e4ce', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-01-30 17:43:21', '登录成功');
INSERT INTO sys_operation_log VALUES ('dfaffb1692904ef6832d52727cf71621', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-01-30 17:43:21', '登录成功');
INSERT INTO sys_operation_log VALUES ('8c16edec4048443a8cf0c4f39db9856c', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-01-31 12:26:10', '登录成功');
INSERT INTO sys_operation_log VALUES ('7f374bb40d4f4c2ea52f3a0819ea5592', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-02-01 09:18:18', '登录成功');
INSERT INTO sys_operation_log VALUES ('79edf963de914dc6809c11e0e57a475f', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-02-01 09:18:19', '登录成功');
INSERT INTO sys_operation_log VALUES ('4526f90b74e84c9cbb340ce00418cc7b', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-02-04 16:12:32', '登录成功');
INSERT INTO sys_operation_log VALUES ('3b55041b46f840d7b0f552a5d3830cd2', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-02-04 16:12:32', '登录成功');
INSERT INTO sys_operation_log VALUES ('a1b38430931d45bfa4a3962a99424723', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-02-04 16:21:46', '退出系统');
INSERT INTO sys_operation_log VALUES ('761e5f9d394b4e77ae5d64649b63624b', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-02-04 16:21:50', '登录成功');
INSERT INTO sys_operation_log VALUES ('3f207453147147d68d265b38dffe7ea4', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-02-04 16:21:50', '登录成功');
INSERT INTO sys_operation_log VALUES ('3d4b87c1a8f24e3588b5a24b973d6d2c', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-02-04 16:35:43', '登录成功');
INSERT INTO sys_operation_log VALUES ('f98b3a6bdea14d859d8f2e27d026a152', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-02-05 14:56:31', '登录成功');
INSERT INTO sys_operation_log VALUES ('09f46f155b884c53b592c227215a5268', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-02-05 14:56:31', '登录成功');
INSERT INTO sys_operation_log VALUES ('bbdb292db3e84abfaf61df7bdfb24299', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-02-05 15:16:18', '登录成功');
INSERT INTO sys_operation_log VALUES ('f56e1bad15334654bc86867c561a4032', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-02-05 15:38:23', '登录成功');
INSERT INTO sys_operation_log VALUES ('952fa5ea74364f3fa1678786765381f7', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-02-05 15:38:23', '登录成功');
INSERT INTO sys_operation_log VALUES ('55f22c61d4f54917a038b2806d03a2e9', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-02-05 16:09:40', '登录成功');
INSERT INTO sys_operation_log VALUES ('3a376759eae7421797877816c31e2bf9', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-02-05 16:09:40', '登录成功');
INSERT INTO sys_operation_log VALUES ('fffa54cd2e5944b6851e684ea251477d', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-02-05 16:28:09', '登录成功');
INSERT INTO sys_operation_log VALUES ('627353f2486d49cdaaa6065e272c94e8', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-02-05 16:28:09', '登录成功');
INSERT INTO sys_operation_log VALUES ('44c3dfc387574a0fa12b9e08535b6c32', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.13', '00-50-56-85-C2-1C', null, '2024-02-05 17:19:06', '登录成功');
INSERT INTO sys_operation_log VALUES ('765c936796cd42ce97ab5511db1413a9', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.13', '00-50-56-85-C2-1C', null, '2024-02-05 17:19:06', '登录成功');
INSERT INTO sys_operation_log VALUES ('3fe3c868bd3f469dae65ed1361a803ba', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-02-05 18:17:15', '登录成功');
INSERT INTO sys_operation_log VALUES ('d5630028acfa4b4d8ded2ab76dd88193', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-02-05 18:24:02', '退出系统');
INSERT INTO sys_operation_log VALUES ('8a6880bb88ee4c68b02f62b7b787e548', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-02-05 18:24:07', '登录成功');
INSERT INTO sys_operation_log VALUES ('503b0af4ee2e47e0a16489ee30ef5245', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-02-05 18:24:07', '登录成功');
INSERT INTO sys_operation_log VALUES ('9c032721ea87424d92449493ffcb9d36', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.29', '00-50-56-85-C2-1C', null, '2024-02-06 10:13:40', '登录成功');
INSERT INTO sys_operation_log VALUES ('c41dd7ecd30842ed851b4c64134ea741', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.44', '00-50-56-85-C2-1C', null, '2024-02-06 10:36:17', '登录成功');
INSERT INTO sys_operation_log VALUES ('c1597177edba461c8dc19717571928cb', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.24', '00-50-56-85-C2-1C', null, '2024-02-06 10:51:00', '登录成功');
INSERT INTO sys_operation_log VALUES ('715c6aab6ee34eea98904219bd63f3c6', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.46', '00-50-56-85-C2-1C', null, '2024-02-06 11:02:57', '登录成功');
INSERT INTO sys_operation_log VALUES ('b6e3b6aae8e64ff2a6d15262e6007991', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.46', '00-50-56-85-C2-1C', null, '2024-02-06 13:00:08', '登录成功');
INSERT INTO sys_operation_log VALUES ('e1f9c978ef844405992257fa454a522f', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.35', '00-50-56-85-C2-1C', null, '2024-02-06 13:37:54', '登录成功');
INSERT INTO sys_operation_log VALUES ('362cda1277784bd49655c09e632561ad', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.35', '00-50-56-85-C2-1C', null, '2024-02-06 14:09:10', '登录成功');
INSERT INTO sys_operation_log VALUES ('c6fd36232dc54fb4860b6516906dadb5', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.35', '00-50-56-85-C2-1C', null, '2024-02-06 14:25:04', '登录成功');
INSERT INTO sys_operation_log VALUES ('68f73a5c9a924ff989d976671dec8828', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.10', '00-50-56-85-C2-1C', null, '2024-02-06 15:51:29', '登录成功');
INSERT INTO sys_operation_log VALUES ('1ce5aad4a409415f8e8139fb24221aa3', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '192.168.18.16', '00-50-56-85-C2-1C', null, '2024-02-07 09:10:26', '登录成功');
INSERT INTO sys_operation_log VALUES ('6e6aab3bb15d47c8816636acdcb0c614', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-02-07 14:06:41', '登录成功');
INSERT INTO sys_operation_log VALUES ('d52a31a4ffce451482416a2a94d587c9', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-02-07 14:06:41', '登录成功');
INSERT INTO sys_operation_log VALUES ('39fc2efb24324a3999bd63943d4c04f0', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-02-07 14:53:59', '登录成功');
INSERT INTO sys_operation_log VALUES ('bcb858cdf850406d8e7ffbdf57e7d3e8', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-02-07 14:53:59', '登录成功');
INSERT INTO sys_operation_log VALUES ('8e62ecc1b3f141d6822631a3dfd9ea75', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-02-07 15:08:49', '退出系统');
INSERT INTO sys_operation_log VALUES ('43cbb073fbbd451ab8ee91c4e4992f87', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-02-07 15:08:54', '登录成功');
INSERT INTO sys_operation_log VALUES ('2927d71c54e049b7aa34ad9e89fd508c', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-02-07 15:08:54', '登录成功');
INSERT INTO sys_operation_log VALUES ('9605a33cb4a3484c998697064a836503', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-02-18 11:58:24', '登录成功');
INSERT INTO sys_operation_log VALUES ('3727ce2108254ac2927a5eb016757092', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-02-18 11:58:24', '登录成功');
INSERT INTO sys_operation_log VALUES ('9c400eea2d4c4d9c9ed66de1fd5d13f9', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-02-18 12:12:37', '登录成功');
INSERT INTO sys_operation_log VALUES ('ff67ee3255d44ee18648bd9f80ae1b70', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-02-18 12:12:37', '登录成功');
INSERT INTO sys_operation_log VALUES ('803061d36d1844c9a4406f3ff2e7c9ee', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-02-18 12:33:35', '登录成功');
INSERT INTO sys_operation_log VALUES ('34eee9406fd240dcb6524b46616141a5', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-02-18 12:38:36', '退出系统');
INSERT INTO sys_operation_log VALUES ('e714b56789a544908bff5f1bdb3d43bb', '41533de78f184f0682ee431afc066b54', 'adminhfdb', '41533de78f184f0682ee431afc066b54', null, '10.22.0.15', '00-50-56-85-C2-1C', null, '2024-02-18 12:38:40', '登录成功');

-- ----------------------------
-- Table structure for sys_org
-- ----------------------------
DROP TABLE IF EXISTS sys_org;
CREATE TABLE sys_org (
  ORG_ID varchar(100) NOT NULL COMMENT '唯一标识',
  NAME varchar(30) DEFAULT NULL COMMENT '名称',
  NAME_EN varchar(50) DEFAULT NULL COMMENT '英文',
  ORG_LEVEL decimal(11,0) DEFAULT NULL COMMENT '机构层级',
  ORG_CODE varchar(50) DEFAULT NULL COMMENT '机构编码',
  PARENT_ID varchar(100) DEFAULT NULL COMMENT '上级ID',
  ORG_DESC varchar(255) DEFAULT NULL COMMENT '备注',
  HEADMAN varchar(30) DEFAULT NULL COMMENT '负责人',
  TEL varchar(50) DEFAULT NULL COMMENT '电话',
  FUNCTIONS varchar(255) DEFAULT NULL COMMENT '部门职能',
  ADDRESS varchar(255) DEFAULT NULL COMMENT '地址',
  STATUS varchar(2) DEFAULT NULL,
  ORG_ORDER decimal(11,0) DEFAULT NULL,
  COMPANY varchar(10) DEFAULT NULL COMMENT '法人',
  ORG_CODE_FOURTEEN varchar(14) DEFAULT NULL COMMENT '对应总行的数据提供机构区段码',
  EACH_ORG_CODE_FOURTEEN varchar(14) DEFAULT NULL COMMENT '各自机构对应的数据提供机构区段码'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='机构表';

-- ----------------------------
-- Records of sys_org
-- ----------------------------
INSERT INTO sys_org VALUES ('6ba979f53eff437e9b414d7875832593', '鸿飞担保', '', '1', '1000', '0', '', '', '', '', '', '0', '1', 'hfdb', 'X6101010000246', 'X6101010000246');

-- ----------------------------
-- Table structure for sys_password
-- ----------------------------
DROP TABLE IF EXISTS sys_password;
CREATE TABLE sys_password (
  INITIAL_PASSWORD varchar(50) DEFAULT NULL COMMENT '初始密码明码',
  MAX_ERROR_LOGON decimal(11,0) DEFAULT NULL COMMENT '每天输错密码次数',
  EFFECT_DAYS decimal(11,0) DEFAULT NULL COMMENT '密码过期天数',
  MIN_LENGTH decimal(11,0) DEFAULT NULL COMMENT '密码最小长度',
  MAX_LENGTH decimal(11,0) DEFAULT NULL COMMENT '密码最大长度',
  REPEAT_NUM decimal(11,0) DEFAULT NULL COMMENT '密码不能重复次数',
  MODIFIED_RESTRICT_TIME decimal(11,0) DEFAULT NULL COMMENT '重复修改限制时间',
  ENCRYPT_TYPE varchar(20) DEFAULT NULL COMMENT '密码加密规则，默认采用MD5',
  PASSWORD_RULE varchar(50) DEFAULT NULL COMMENT '密码校验规则，采用正则表达式的形式存储，便于校验',
  PASSWORD_RULE_DESC varchar(100) DEFAULT NULL COMMENT '密码校验规则描述'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='密码参数表';

-- ----------------------------
-- Records of sys_password
-- ----------------------------
INSERT INTO sys_password VALUES ('111111', '3', '1', '6', '15', '3', '3', 'MD5', 'number', null);

-- ----------------------------
-- Table structure for sys_pictures
-- ----------------------------
DROP TABLE IF EXISTS sys_pictures;
CREATE TABLE sys_pictures (
  PICTURES_ID varchar(100) NOT NULL,
  TITLE varchar(255) DEFAULT NULL COMMENT '标题',
  NAME varchar(255) DEFAULT NULL COMMENT '文件名',
  PATH varchar(255) DEFAULT NULL COMMENT '路径',
  CREATETIME varchar(100) DEFAULT NULL COMMENT '创建时间',
  MASTER_ID varchar(255) DEFAULT NULL COMMENT '属于',
  BZ varchar(255) DEFAULT NULL COMMENT '备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_pictures
-- ----------------------------

-- ----------------------------
-- Table structure for sys_policy
-- ----------------------------
DROP TABLE IF EXISTS sys_policy;
CREATE TABLE sys_policy (
  ROLE_ID varchar(32) NOT NULL COMMENT '角色编码',
  MENU_ID varchar(10) NOT NULL COMMENT '菜单编码',
  FUN_GROUP_ID varchar(32) NOT NULL COMMENT '功能组编码',
  FUN_ID varchar(32) NOT NULL COMMENT '功能编码',
  PRIMARY KEY (ROLE_ID,MENU_ID,FUN_GROUP_ID,FUN_ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色对应菜单及操作权限表';

-- ----------------------------
-- Records of sys_policy
-- ----------------------------
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '100', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '100', 'orgFunGroup', 'add');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '100', 'orgFunGroup', 'delete');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '100', 'orgFunGroup', 'edit');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '100', 'orgFunGroup', 'query');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '101', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '101', 'orgFunGroup', 'add');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '101', 'orgFunGroup', 'delete');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '101', 'orgFunGroup', 'edit');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '101', 'orgFunGroup', 'query');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '102', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '102', 'orgFunGroup', 'add');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '102', 'orgFunGroup', 'delete');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '102', 'orgFunGroup', 'edit');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '102', 'orgFunGroup', 'query');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '103', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '112', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '112', 'orgFunGroup', 'add');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '112', 'orgFunGroup', 'delete');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '112', 'orgFunGroup', 'edit');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '112', 'orgFunGroup', 'query');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '115', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '115', 'orgFunGroup', 'add');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '115', 'orgFunGroup', 'delete');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '115', 'orgFunGroup', 'edit');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '115', 'orgFunGroup', 'query');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '116', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '116', 'orgFunGroup', 'add');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '116', 'orgFunGroup', 'delete');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '116', 'orgFunGroup', 'edit');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '116', 'orgFunGroup', 'query');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '118', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '118', 'orgFunGroup', 'add');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '118', 'orgFunGroup', 'delete');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '118', 'orgFunGroup', 'edit');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '118', 'orgFunGroup', 'query');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '119', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '119', 'orgFunGroup', 'add');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '119', 'orgFunGroup', 'delete');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '119', 'orgFunGroup', 'edit');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '119', 'orgFunGroup', 'query');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '120', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '120', 'orgFunGroup', 'add');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '120', 'orgFunGroup', 'delete');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '120', 'orgFunGroup', 'edit');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '120', 'orgFunGroup', 'query');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '127', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '127', 'orgFunGroup', 'add');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '127', 'orgFunGroup', 'delete');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '127', 'orgFunGroup', 'edit');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '127', 'orgFunGroup', 'query');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '132', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '132', 'orgFunGroup', 'add');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '132', 'orgFunGroup', 'delete');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '132', 'orgFunGroup', 'edit');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '132', 'orgFunGroup', 'query');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '133', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '133', 'orgFunGroup', 'add');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '133', 'orgFunGroup', 'delete');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '133', 'orgFunGroup', 'edit');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '133', 'orgFunGroup', 'query');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '134', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '134', 'orgFunGroup', 'add');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '134', 'orgFunGroup', 'delete');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '134', 'orgFunGroup', 'edit');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '134', 'orgFunGroup', 'query');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '136', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '136', 'orgFunGroup', 'add');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '136', 'orgFunGroup', 'delete');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '136', 'orgFunGroup', 'edit');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '136', 'orgFunGroup', 'query');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '137', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '137', 'orgFunGroup', 'add');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '137', 'orgFunGroup', 'delete');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '137', 'orgFunGroup', 'edit');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '137', 'orgFunGroup', 'query');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '138', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '138', 'orgFunGroup', 'add');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '138', 'orgFunGroup', 'delete');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '138', 'orgFunGroup', 'edit');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '138', 'orgFunGroup', 'query');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '139', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '139', 'orgFunGroup', 'add');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '139', 'orgFunGroup', 'delete');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '139', 'orgFunGroup', 'edit');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '139', 'orgFunGroup', 'query');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '140', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '140', 'orgFunGroup', 'add');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '140', 'orgFunGroup', 'delete');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '140', 'orgFunGroup', 'edit');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '140', 'orgFunGroup', 'query');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '141', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '141', 'orgFunGroup', 'add');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '141', 'orgFunGroup', 'delete');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '141', 'orgFunGroup', 'edit');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '141', 'orgFunGroup', 'query');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '142', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '142', 'orgFunGroup', 'add');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '142', 'orgFunGroup', 'delete');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '142', 'orgFunGroup', 'edit');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '142', 'orgFunGroup', 'query');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '143', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '143', 'orgFunGroup', 'add');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '143', 'orgFunGroup', 'delete');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '143', 'orgFunGroup', 'edit');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '143', 'orgFunGroup', 'query');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '206', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '206', 'orgFunGroup', 'add');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '206', 'orgFunGroup', 'delete');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '206', 'orgFunGroup', 'edit');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '206', 'orgFunGroup', 'query');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '209', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '210', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '212', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '212', 'orgFunGroup', 'add');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '212', 'orgFunGroup', 'delete');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '212', 'orgFunGroup', 'edit');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '212', 'orgFunGroup', 'query');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '213', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '213', 'orgFunGroup', 'add');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '213', 'orgFunGroup', 'delete');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '213', 'orgFunGroup', 'edit');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '213', 'orgFunGroup', 'query');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '214', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '214', 'orgFunGroup', 'add');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '214', 'orgFunGroup', 'delete');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '214', 'orgFunGroup', 'edit');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '214', 'orgFunGroup', 'query');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '215', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '215', 'orgFunGroup', 'add');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '215', 'orgFunGroup', 'delete');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '215', 'orgFunGroup', 'edit');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '215', 'orgFunGroup', 'query');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '216', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '216', 'orgFunGroup', 'add');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '216', 'orgFunGroup', 'delete');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '216', 'orgFunGroup', 'edit');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '216', 'orgFunGroup', 'query');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '223', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '225', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '229', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '230', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '230', 'orgFunGroup', 'add');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '230', 'orgFunGroup', 'delete');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '230', 'orgFunGroup', 'edit');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '230', 'orgFunGroup', 'query');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '231', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '231', 'orgFunGroup', 'add');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '231', 'orgFunGroup', 'delete');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '231', 'orgFunGroup', 'edit');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '231', 'orgFunGroup', 'query');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '232', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '232', 'orgFunGroup', 'add');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '232', 'orgFunGroup', 'delete');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '232', 'orgFunGroup', 'edit');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '232', 'orgFunGroup', 'query');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '234', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '234', 'orgFunGroup', 'add');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '234', 'orgFunGroup', 'delete');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '234', 'orgFunGroup', 'edit');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '234', 'orgFunGroup', 'query');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '235', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '235', 'orgFunGroup', 'add');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '235', 'orgFunGroup', 'delete');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '235', 'orgFunGroup', 'edit');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '235', 'orgFunGroup', 'query');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '24', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '243', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '243', 'orgFunGroup', 'add');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '243', 'orgFunGroup', 'delete');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '243', 'orgFunGroup', 'edit');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '243', 'orgFunGroup', 'query');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '282', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '283', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '283', 'orgFunGroup', 'add');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '283', 'orgFunGroup', 'delete');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '283', 'orgFunGroup', 'edit');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '283', 'orgFunGroup', 'query');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '65', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '66', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '67', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '69', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '70', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '71', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '71', 'orgFunGroup', 'add');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '71', 'orgFunGroup', 'delete');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '71', 'orgFunGroup', 'edit');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '71', 'orgFunGroup', 'query');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '72', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '72', 'orgFunGroup', 'add');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '72', 'orgFunGroup', 'delete');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '72', 'orgFunGroup', 'edit');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '72', 'orgFunGroup', 'query');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '73', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '73', 'orgFunGroup', 'add');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '73', 'orgFunGroup', 'delete');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '73', 'orgFunGroup', 'edit');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '73', 'orgFunGroup', 'query');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '74', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '74', 'orgFunGroup', 'add');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '74', 'orgFunGroup', 'delete');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '74', 'orgFunGroup', 'edit');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '74', 'orgFunGroup', 'query');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '75', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '75', 'orgFunGroup', 'add');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '75', 'orgFunGroup', 'delete');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '75', 'orgFunGroup', 'edit');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '75', 'orgFunGroup', 'query');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '76', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '76', 'orgFunGroup', 'add');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '76', 'orgFunGroup', 'delete');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '76', 'orgFunGroup', 'edit');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '76', 'orgFunGroup', 'query');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '77', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '77', 'orgFunGroup', 'add');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '77', 'orgFunGroup', 'delete');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '77', 'orgFunGroup', 'edit');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '77', 'orgFunGroup', 'query');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '78', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '78', 'orgFunGroup', 'add');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '78', 'orgFunGroup', 'delete');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '78', 'orgFunGroup', 'edit');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '78', 'orgFunGroup', 'query');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '80', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '80', 'orgFunGroup', 'add');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '80', 'orgFunGroup', 'delete');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '80', 'orgFunGroup', 'edit');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '80', 'orgFunGroup', 'query');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '81', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '81', 'orgFunGroup', 'add');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '81', 'orgFunGroup', 'delete');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '81', 'orgFunGroup', 'edit');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '81', 'orgFunGroup', 'query');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '82', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '82', 'orgFunGroup', 'add');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '82', 'orgFunGroup', 'delete');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '82', 'orgFunGroup', 'edit');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '82', 'orgFunGroup', 'query');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '83', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '84', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '84', 'orgFunGroup', 'add');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '84', 'orgFunGroup', 'delete');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '84', 'orgFunGroup', 'edit');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '84', 'orgFunGroup', 'query');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '86', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '88', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '88', 'orgFunGroup', 'add');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '88', 'orgFunGroup', 'delete');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '88', 'orgFunGroup', 'edit');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '88', 'orgFunGroup', 'query');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '91', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '91', 'orgFunGroup', 'add');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '91', 'orgFunGroup', 'delete');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '91', 'orgFunGroup', 'edit');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '91', 'orgFunGroup', 'query');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '92', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '92', 'orgFunGroup', 'add');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '92', 'orgFunGroup', 'delete');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '92', 'orgFunGroup', 'edit');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '92', 'orgFunGroup', 'query');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '93', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '93', 'orgFunGroup', 'add');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '93', 'orgFunGroup', 'delete');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '93', 'orgFunGroup', 'edit');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '93', 'orgFunGroup', 'query');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '94', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '95', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '95', 'orgFunGroup', 'add');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '95', 'orgFunGroup', 'delete');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '95', 'orgFunGroup', 'edit');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '95', 'orgFunGroup', 'query');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '96', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '96', 'orgFunGroup', 'add');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '96', 'orgFunGroup', 'delete');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '96', 'orgFunGroup', 'edit');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '96', 'orgFunGroup', 'query');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '97', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '97', 'orgFunGroup', 'add');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '97', 'orgFunGroup', 'delete');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '97', 'orgFunGroup', 'edit');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '97', 'orgFunGroup', 'query');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '98', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '98', 'orgFunGroup', 'add');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '98', 'orgFunGroup', 'delete');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '98', 'orgFunGroup', 'edit');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '98', 'orgFunGroup', 'query');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '99', '#', '#');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '99', 'orgFunGroup', 'add');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '99', 'orgFunGroup', 'delete');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '99', 'orgFunGroup', 'edit');
INSERT INTO sys_policy VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '99', 'orgFunGroup', 'query');

-- ----------------------------
-- Table structure for sys_position
-- ----------------------------
DROP TABLE IF EXISTS sys_position;
CREATE TABLE sys_position (
  POSITI_ID varchar(32) NOT NULL COMMENT '职位编码',
  POSITI_NAME varchar(50) DEFAULT NULL COMMENT '职位名称',
  POSITI_NAME_EN varchar(50) DEFAULT NULL,
  POSITI_DESC varchar(50) DEFAULT NULL COMMENT '职位名称描述',
  PRIMARY KEY (POSITI_ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户职位 表';

-- ----------------------------
-- Records of sys_position
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS sys_role;
CREATE TABLE sys_role (
  ROLE_ID varchar(32) NOT NULL COMMENT '角色编码',
  ROLE_NAME varchar(50) DEFAULT NULL COMMENT '角色名称',
  ROLE_NAME_EN varchar(50) DEFAULT NULL,
  ROLE_DESC varchar(100) DEFAULT NULL COMMENT '角色描述',
  COMPANY varchar(32) DEFAULT NULL COMMENT '法人代码',
  PRIMARY KEY (ROLE_ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色定义表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO sys_role VALUES ('30ef6f1c5d9a4d57baaf21b063497f55', '上报员', 'sby', '', 'hfdb');

-- ----------------------------
-- Table structure for sys_sms
-- ----------------------------
DROP TABLE IF EXISTS sys_sms;
CREATE TABLE sys_sms (
  SMS_ID varchar(100) NOT NULL,
  CONTENT text COMMENT '内容',
  TYPE varchar(5) DEFAULT NULL COMMENT '类型',
  TO_USERNAME varchar(255) DEFAULT NULL COMMENT '收信人',
  FROM_USERNAME varchar(255) DEFAULT NULL COMMENT '发信人',
  SEND_TIME varchar(100) DEFAULT NULL COMMENT '发信时间',
  STATUS varchar(5) DEFAULT NULL COMMENT '状态',
  SANME_ID varchar(100) DEFAULT NULL,
  PRIMARY KEY (SMS_ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_sms
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS sys_user;
CREATE TABLE sys_user (
  USER_ID varchar(100) NOT NULL COMMENT '用户编码',
  USERNAME varchar(255) DEFAULT NULL COMMENT '登录编码',
  PASSWORD varchar(255) DEFAULT NULL COMMENT '密码',
  NAME varchar(255) DEFAULT NULL COMMENT '用户名称',
  LAST_LOGIN varchar(255) DEFAULT NULL COMMENT '最近登录时间',
  IP varchar(100) DEFAULT NULL COMMENT '最近登录ip',
  SKIN varchar(100) DEFAULT NULL COMMENT '皮肤',
  EMAIL varchar(32) DEFAULT NULL COMMENT 'email',
  TELLER_NUMBER varchar(100) DEFAULT NULL COMMENT '柜员号',
  PHONE varchar(32) DEFAULT NULL COMMENT '电话号码',
  PWD_ALTER_TIME varchar(20) DEFAULT NULL COMMENT '密码修改日期',
  DEPT_CODE varchar(32) DEFAULT NULL COMMENT '部门编码',
  STATE varchar(2) DEFAULT NULL COMMENT '有效状态',
  ERR_TIMES decimal(11,0) DEFAULT NULL COMMENT '出错次数',
  LOCK_STATUS varchar(2) DEFAULT NULL COMMENT '锁定状态 ;0 正常 1 锁定',
  COMPANY varchar(10) DEFAULT NULL COMMENT '法人编码',
  PRIMARY KEY (USER_ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO sys_user VALUES ('0', 'super', '6b07cab3419456bd7af577b0f649efde', '超级用户', '2021-06-15 15:01:19', '0:0:0:0:0:0:0:1', null, '323@w.com', '12', '18788888888', null, '212', null, null, '0', 'super');
INSERT INTO sys_user VALUES ('41533de78f184f0682ee431afc066b54', 'adminhfdb', '6b07cab3419456bd7af577b0f649efde', '西安鸿飞担保', '2024-02-18 12:38:40', '10.22.0.15', 'default', null, null, null, null, null, null, null, '0', 'hfdb');

-- ----------------------------
-- Table structure for sys_user_org
-- ----------------------------
DROP TABLE IF EXISTS sys_user_org;
CREATE TABLE sys_user_org (
  USER_ID varchar(32) NOT NULL,
  ORG_ID varchar(32) NOT NULL,
  PRIMARY KEY (USER_ID,ORG_ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户对应机构表';

-- ----------------------------
-- Records of sys_user_org
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS sys_user_role;
CREATE TABLE sys_user_role (
  USER_ID varchar(32) NOT NULL,
  ROLE_ID varchar(32) NOT NULL,
  PRIMARY KEY (USER_ID,ROLE_ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户对于角色表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------


