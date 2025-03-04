DELETE FROM SYS_MENU;

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (1, '系统管理', null, '#', 0, '1', 'menu-icon fa fa-adjust black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (2, '在线管理', null, 'onlinemanager/list.do?menuId=2', 1, '1', 'menu-icon fa fa-laptop green', 'MENUTYPE3', 1, 'onLineGroup', null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (3, '字典维护', null, 'dictmtance/list.do?menuId=3', 1, '2', 'menu-icon fa fa-book black', 'MENUTYPE3', 1, 'dictFunGroup', null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (4, '数据字典', null, 'dictionaries/listAllDict.do?menuId=4', 1, '3', 'menu-icon fa fa-book purple', 'MENUTYPE3', 1, 'dictFunGroup', null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (5, '机构管理', null, 'org/listAllDepartment.do?menuId=5', 1, '4', 'menu-icon fa fa-key orange', 'MENUTYPE3', 1, 'orgFunGroup', null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (6, '角色管理', null, 'role/roleList.do?menuId=6', 1, '5', 'menu-icon fa fa-key orange', 'MENUTYPE3', 1, 'roleFunGroup', null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (7, '用户管理', null, 'user/listUsers.do?menuId=7', 1, '6', 'menu-icon fa fa-heart-o black', 'MENUTYPE3', 1, 'userFunGroup', null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (8, '菜单管理', null, 'menu/listAllMenu.do?menuId=8', 1, '7', 'menu-icon fa fa-folder-o black', 'MENUTYPE3', 1, 'menuFunGroup', null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (9, '菜单功能组', null, 'menuGroup/list.do?menuId=9', 1, '8', 'menu-icon fa fa-folder-open-o brown', 'MENUTYPE3', 1, 'menuGGroupFun', null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (10, '密码规则配置', null, 'pwdRuleConfig/list.do?menuId=10', 1, '9', 'menu-icon fa fa-lock black', 'MENUTYPE3', 1, 'pwdFunGroup', null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (11, '法人菜单', null, '#', 0, '1', 'menu-icon fa fa-book black', 'MENUTYPE3', 1, null, null, null, 'super', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (12, '法人维护', null, '#', 0, '2', 'menu-icon fa fa-book black', 'MENUTYPE3', 1, null, null, null, 'super', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (13, '法人维护', null, 'company/listCompany.do?menuId=13', 12, '1', 'menu-icon fa fa-users blue', 'MENUTYPE3', 1, null, null, null, 'super', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (14, '法人菜单', null, 'menu/listAllMenu.do?menuId=8', 11, '1', 'menu-icon fa fa-key orange', 'MENUTYPE3', 1, 'menuFunGroup', null, null, 'super', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (15, '系统工具', null, '#', 0, '2', 'menu-icon fa fa-cog black', 'MENUTYPE3', 0, null, null, null, 'PB', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (16, '代码生成器', null, '#', 15, '1', 'menu-icon fa fa-cogs brown', 'MENUTYPE3', 0, null, null, null, 'PB', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (17, '正向生成', null, 'createCode/list.do?menuId=17', 12, '1', 'menu-icon fa fa-exclamation-circle black', 'MENUTYPE3', 1, 'sysToolGroup', null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (18, '反向生成', null, 'recreateCode/list.do?menuId=18', 12, '2', 'menu-icon fa fa-cogs blue', 'MENUTYPE3', 1, 'sysToolGroup', null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (19, '打印测试', null, 'tool/printTest.do?menuId=19', 15, '2', 'menu-icon fa fa-hdd-o grey', 'MENUTYPE3', 0, 'sysToolGroup', null, null, 'PB', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (20, '图片管理', null, 'pictures/list.do?menuId=20', 15, '3', 'menu-icon fa fa-folder-open-o green', 'MENUTYPE3', 0, 'pictureFunGroup', null, null, 'PB', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (21, '日志查询', null, '#', 0, '3', 'menu-icon fa fa-bar-chart-o black', 'MENUTYPE3', 0, null, null, null, 'PB', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (22, '操作日志查询', null, 'operation/list.do?menuId=22', 21, '1', 'menu-icon fa fa-folder-open-o green', 'MENUTYPE3', 0, 'operationFunGroup', null, null, 'PB', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (23, '企业征信报送', null, '#', 0, '6', 'menu-icon fa fa-folder-open-o black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (24, '个人征信报送', null, '#', 0, '7', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (25, '企业报送数据补录', null, '#', 23, '1', 'menu-icon fa fa-envelope-o green', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (26, '企业基本信息记录', 'EnterpriseBasicInfo', 'eccustbasis/list.do', 25, '1', 'menu-icon fa fa-pencil-square-o black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (27, '企业间关联关系信息', 'EnterprisesRelationship', 'enIcdnRltpInf/list.do', 25, '2', 'menu-icon fa fa-pencil-square-o black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (28, '企业借贷信息', 'CorporateLendingInfo', 'entLoanAcctInfo/dataPage.do', 25, '3', 'menu-icon fa fa-pencil-square-o black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (29, '企业担保信息', 'CorporateGuaranteeInfo', 'enSecAcctInf/dataPage.do', 25, '4', 'menu-icon fa fa-pencil-square-o black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (30, '企业授信协议信息记录', null, 'enCtrctInfo/dataPage.do', 25, '5', 'menu-icon fa fa-pencil-square-o black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (31, '企业资产负债信息', null, 'entBalanceInfo/dataPage.do', 25, '6', 'menu-icon fa fa-leaf black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (32, '企业现金流量信息', null, 'cashFlows/dataPage.do', 25, '7', 'menu-icon fa fa-pencil-square-o black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (33, '企业利润及利润分配表', null, 'entIncomeInfo/dataPage.do', 25, '8', 'menu-icon fa fa-pencil-square-o black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (34, '事业单位资产负债表', null, 'entInstitutionInfo/dataPage.do', 25, '9', 'menu-icon fa fa-pencil-square-o black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (35, '事业单位收入支出表', null, 'ecdtreportinstie/list.do?menuId=35', 25, '10', 'menu-icon fa fa-pencil-square-o black', 'MENUTYPE2', 0, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (36, '企业报送数据审核', null, '#', 23, '2', 'menu-icon fa fa-gavel green', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (37, '企业报文管理', null, '#', 23, '3', 'menu-icon fa fa-folder-o green', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (38, '报文生成', null, 'entNormalMessage/entNormalMessagePage.do?menuId=38', 37, '1', 'menu-icon fa fa-download black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (40, '反馈回执管理', null, '#', 23, '4', 'menu-icon fa fa-external-link green', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (41, '反馈回执详情', null, 'feedbackMessage/dataPage.do', 40, '1', 'menu-icon fa fa-leaf black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (43, '企业特殊报文管理', null, '#', 37, '3', 'menu-icon fa fa-folder green', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (44, '企业标识变更', null, 'entAccountChange/dataPage.do', 43, '1', 'menu-icon fa fa-cog black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (45, '企业按段更正', null, '#', 43, '2', 'menu-icon fa fa-cog black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (46, '企业按段/整段删除', null, 'entDelAccount/dataPage.do', 43, '3', 'menu-icon fa fa-cog black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (52, '借贷账户按段更正', null, 'entUpDaccountData/entLoanChangeList.do', 45, '1', 'menu-icon fa fa-cogs black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (53, '担保账户按段更正', null, 'entUpDaccountData/entGuaranteeChange.do', 45, '2', 'menu-icon fa fa-cogs black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (54, '授信协议按段更正', null, 'entUpDaccountData/entProtocolChange.do', 45, '3', 'menu-icon fa fa-cogs black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (64, '企业数据综合查询', null, '#', 23, '5', 'menu-icon fa fa-desktop green', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (65, '个人报送数据补录', null, '#', 24, '1', 'menu-icon fa fa-envelope-o green', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (66, '个人数据报送审核', null, '#', 24, '2', 'menu-icon fa fa-gavel green', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (67, '个人报文管理', null, '#', 24, '3', 'menu-icon fa fa-folder-o green', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (68, '反馈回执处理', null, '#', 24, '4', 'menu-icon fa fa-external-link green', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (69, '个人特殊报文数据', null, '#', 67, '3', 'menu-icon fa fa-folder-o green', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (70, '个人综合数据查询', null, '#', 24, '5', 'menu-icon fa fa-desktop green', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (71, '个人基本信息记录', null, 'indvBasicsInfo/indvBasicsInfoPage.do', 65, '1', 'menu-icon fa fa-credit-card black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (72, '个人证件有效期', null, 'inIDEfctInf/dataPage.do', 65, '5', 'menu-icon fa fa-credit-card black', 'MENUTYPE2', 1, 'menuGGroupFun', null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (73, '家族关系信息记录', null, 'inFalMmbsInf/dataPage.do', 65, '6', 'menu-icon fa fa-credit-card black', 'MENUTYPE2', 1, 'menuGGroupFun', null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (74, '个人授信协议信息记录', null, 'inCtrctInf/dataPage.do', 65, '4', 'menu-icon fa fa-credit-card black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (75, '个人担保账户信息记录', null, 'indvGuarAcctInfo/dataPage.do', 65, '3', 'menu-icon fa fa-credit-card black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (76, '个人借贷账户信息记录', null, 'indvLoanAcctInfo/dataPage.do', 65, '2', 'menu-icon fa fa-credit-card black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (77, '借贷特殊事件说明', null, 'inSpcEvtDscInf/dataPage.do', 65, '7', 'menu-icon fa fa-credit-card black', 'MENUTYPE2', 1, 'menuGGroupFun', null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (78, '正常报文生成', null, 'indvNormalMessage/indvNormalMessagePage.do', 67, '1', 'menu-icon fa fa-download black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (80, '个人特殊报文生成', null, 'indvAbnormalMessage/indvAbnormalMessagePage.do', 67, '4', 'menu-icon fa fa-download black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (81, '反馈回执详情', null, 'feedbackMessage/dataPage.do', 68, '1', 'menu-icon fa fa-credit-card black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (82, '个人标识变更', null, 'accountchange/dataPage.do', 69, '1', 'menu-icon fa fa-certificate black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (83, '个人按段更正', null, '#', 69, '2', 'menu-icon fa fa-certificate black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (84, '个人按段/整笔删除', null, 'delaccount/dataPage.do', 69, '3', 'menu-icon fa fa-certificate black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (86, '征信参数管理', null, '#', 0, '4', 'menu-icon fa fa-leaf black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (87, '企业特殊报文生成', null, 'entAbnormalMessage/entAbnormalMessagePage.do', 37, '4', 'menu-icon fa fa-credit-card black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (88, '校验规则配置', null, 'checkRule/dataPage.do', 86, '1', 'menu-icon fa fa-cogs green', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (89, '例子', null, 'example/dataPage.do', 86, '4', 'menu-icon fa fa-leaf black', 'MENUTYPE2', 1, null, null, null, 'PB', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (90, '校验结果查看', null, 'checkResult/dataPage.do?flag=indv', 86, '3', 'menu-icon fa fa-leaf black', 'MENUTYPE2', 1, null, null, null, 'PB', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (91, '个人借贷按段更正 ', null, 'indvProtocol/indvLoanChange.do', 83, '1', 'menu-icon fa fa-leaf black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (92, '个人担保按段更正', null, 'indvProtocol/indvGuaranteeChange.do', 83, '2', 'menu-icon fa fa-leaf black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (93, '个人授信按段更正', null, 'indvProtocol/indvProtocolChange.do', 83, '3', 'menu-icon fa fa-leaf black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (94, '公共模块', null, '#', 0, '5', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (95, '抵（质）押合同补录', null, 'motgaInfo/dataPage', 209, '1', 'menu-icon fa fa-pencil-square-o black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (96, '抵质押信息报文生成', null, 'motgaNormalMessage/motgaNormalMessagePage.do', 211, '1', 'menu-icon fa fa-envelope black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (97, '抵质押特殊报文生成', null, 'motgaAbnormalMessage/motgaAbnormalMessagePage.do', 211, '2', 'menu-icon fa fa-envelope black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (98, '个人基本信息', null, 'indvBasicsInfoSeo/listPage.do', 70, '1', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (99, '个人证件有效期信息', null, 'inIDEfctInfSeo/listPage.do', 70, '5', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (100, '家族关系信息', null, 'inFalMmbsInfSeo/listPage.do', 70, '6', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (101, '个人授信协议信息', null, 'inCtrctInfSeo/listPage.do', 70, '4', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (102, '个人借贷账户信息', null, 'indvLoanAcctInfoSeo/listPage.do', 70, '2', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (103, '抵（质）押合同信息', null, '#', 94, '1', 'menu-icon fa fa-certificate black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (104, '企业基本信息', null, 'enBasInfSeo/listPage', 64, '1', 'menu-icon fa fa-leaf black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (105, '事业单位收入支出表', null, 'ecdtreportinstieSeo/list.do', 64, '10', 'menu-icon fa fa-leaf black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (106, '企业间关联关系', null, 'enIcdnRltpInfSeo/listPage.do', 64, '2', 'menu-icon fa fa-leaf black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (107, '企业现金流量', null, 'cashFlowsSeo/listPage.do', 64, '7', 'menu-icon fa fa-leaf black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (108, ' 企业利润及利润分配', null, 'entIncomeInfoSeo/listPage.do', 64, '8', 'menu-icon fa fa-leaf black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (109, '事业单位资产负债表', null, 'entInstitutionInfoSeo/listPage.do', 64, '9', 'menu-icon fa fa-leaf black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (111, '企业资产负债信息', null, 'entBalanceInfoSeo/listPage.do', 64, '6', 'menu-icon fa fa-leaf black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (112, '个人借贷特殊事件', null, 'inSpcEvtDscInfSeo/listPage.do', 70, '7', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (113, '企业借贷信息记录', null, 'entLoanAcctInfoSeo/listPage.do', 64, '3', 'menu-icon fa fa-leaf black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (114, '企业担保信息', null, 'enSecAcctInfSeo/listPage.do', 64, '4', 'menu-icon fa fa-leaf black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (115, '抵（质）押合同信息', null, 'motgaInfoSeo/listPage', 210, '1', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (116, '个人担保账户信息', null, 'indvGuarAcctInfoSeo/listPage.do', 70, '3', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (117, '企业授信协议', null, 'enCtrctInfoSeo/listPage.do', 64, '5', 'menu-icon fa fa-leaf black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (118, '个人基本审核', null, 'auditing/listPage.do', 66, '1', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (119, '个人借贷审核', null, 'auditing/auditLoanAcct.do', 66, '2', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (120, '个人授信审核', null, 'auditing/auditInCtrctInfo.do', 66, '4', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (122, '企业基本审核', null, 'auditing/auditEnBasInf.do', 36, '1', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (123, '企业借贷审核', null, 'auditing/auditEntLoanAcct.do', 36, '3', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (124, '企业担保审核', null, 'auditing/auditEnSecAcct.do', 36, '4', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (125, '企业现金流量审核', null, 'auditing/auditCashFlows.do', 36, '7', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (126, '企业授信审核', null, 'auditing/auditEnCtrctInfo.do', 36, '5', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (127, '抵质押数据审核', null, 'auditing/motgaCltalBsPage.do', 103, '6', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (128, '企业资产负债审核', null, 'auditing/auditEntBalanceInfo.do', 36, '6', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (129, '企业资利润及利润分配审核', null, 'auditing/auditEntIncomeInfo.do', 36, '8', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (130, '事业单位资产负债审核', null, 'auditing/auditEntInstitutionInfo.do', 36, '9', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (131, '事业单位收入支出审核', null, 'auditing/auditEntIncomeStatemeBs.do', 36, '10', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (132, '借贷特殊事件说明审核', null, 'auditing/inSpcEvtDscPage.do', 66, '7', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (133, '个人证件有效期审核', null, 'auditing/inIDEfctPage.do', 66, '5', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (134, '家族关系有效审核', null, 'auditing/inFalMmbsPage.do', 66, '6', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (135, '企业关联关系审核', null, 'auditing/enIcdnRltpPage.do', 36, '2', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (136, '个人担保审核', null, 'auditing/guarAcctInfo.do', 66, '3', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (200, '模拟两端核对', null, 'bothcheck/checkList.do', 207, '1', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (201, '模拟两端核对报文生成', null, 'bothcheck/packList.do', 207, '2', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (202, '异议处理结果登记', null, 'objFeedBack/list.do', 208, '1', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (203, '异议信息统计', null, 'objStatistics/list.do', 208, '2', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (204, '校验结果查询', ' ', '#', 94, '3', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (205, '反馈回执详情', ' ', 'feedbackMessage/dataPage.do', 103, '9', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (206, '校验结果查询', ' ', 'dataCheckInfo/dataCheckInfo.do', 204, '1', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (207, '模拟两端核对', null, '#', 94, '4', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (208, '异议信息处理', null, '#', 94, '5', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (209, '抵质押数据补录', null, '#', 103, '1', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (210, '抵质押数据综合查询', null, '#', 103, '2', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (211, '抵质押报文管理', null, '#', 103, '3', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (212, '标识变更综合查询', ' ', 'accountchangeSeo/listPage.do', 223, '8', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (213, '借贷按段更正查询', ' ', 'indvLoanAcctInfoSeo/listPageForUpdate.do', 225, '9', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (214, '担保按段更正查询', ' ', 'indvGuarAcctInfoSeo/listPageForUpdate.do', 225, '10', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (215, '授信按段更正查询', ' ', 'inCtrctInfSeo/listPageForUpdate.do', 225, '11', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (216, '按段/整笔删除查询', ' ', 'delaccountSeo/listPage.do', 223, '12', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (218, '征信报送白名单', null, 'baiming/listPage.do', 94, '6', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'PB', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (219, '企业借贷按段更正', ' ', 'entLoanAcctInfoSeo/listPageForUpdate.do', 224, '10', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (220, '企业授信按段更正', ' ', 'enCtrctInfoSeo/listPageForUpdate.do', 224, '10', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (221, '企业担保按段更正', ' ', 'enSecAcctInfSeo/listPageForUpdate.do', 224, '10', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (222, '企业特殊综合查询', ' ', '#', 23, '6', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (223, '个人更正数据综合查询', ' ', '#', 24, '6', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (224, '企业按段更正信息', ' ', '#', 222, '10', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (225, '按段更正综合查询', ' ', '#', 223, '10', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (226, '企业财报信息', null, 'entFinStaSeo/listPage.do', 222, '3', 'menu-icon fa fa-leaf black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (227, '企业按段/整笔删除', null, 'entDelAccountSeo/listPage.do', 222, '3', 'menu-icon fa fa-leaf black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (228, '企业标识变更信息', null, 'entAccountChangeSeo/listPage.do', 222, '3', 'menu-icon fa fa-leaf black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (229, '抵质押特殊综合查询', null, '#', 103, '6', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (230, '抵质押删除', null, 'moDelSeo/listPage.do', 229, '1', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (231, '抵质押标识变更', null, 'moChangeSeo/listPage.do', 229, '2', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (232, '回执规则配置', null, 'Rule/dataPage.do', 86, '2', 'menu-icon fa fa-leaf black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (233, '抵质押信息特殊补录', null, '#', 211, '3', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (234, '抵（质）押合同信息标识变更', null, 'moChange/dataPage.do', 233, '1', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (235, '抵（质）押合同信息删除', null, 'moDel/dataPage.do', 233, '2', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (240, '逾期短信通知详情', null, 'indvTextMsgInform/dataPage.do', 67, '5', 'menu-icon fa fa-download black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (242, '企业正常报文下载', null, 'indvMessageDownLoad/entDataPage.do', 37, '2', 'menu-icon fa fa-leaf black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (243, '正常报文下载', null, 'indvMessageDownLoad/indvDataPage.do', 67, '2', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (244, '抵质押特殊报文下载', null, 'indvMessageDownLoad/moSpDataPage.do', 211, '4', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (245, '抵质押正常报文下载', null, 'indvMessageDownLoad/moDataPage.do', 211, '5', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (246, '特殊报文下载', null, 'indvMessageDownLoad/indvSpDataPage.do', 67, '6', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (247, '企业特殊报文下载', null, 'indvMessageDownLoad/entSpDataPage.do', 37, '5', 'menu-icon fa fa-leaf black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (249, '个人征信异议处理', ' ', '#', 24, '8', 'menu-icon fa fa-leaf green', 'MENUTYPE3', 1, 'menuGGroupFun', null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (262, '征信中心客户处理', ' ', '#', 249, '1', 'menu-icon fa fa-leaf green', 'MENUTYPE3', 1, 'menuGGroupFun', null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (263, '非征信中心客户处理', ' ', '#', 249, '2', 'menu-icon fa fa-leaf green', 'MENUTYPE3', 1, 'menuGGroupFun', null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (264, '异议登记', ' ', 'IndvObjection/dataPageIndvObjectionRegiste.do', 263, '1', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, 'menuGGroupFun', null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (265, '资料核查', ' ', 'IndvObjection/dataPageIndvObjectionCheck.do', 263, '2', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, 'menuGGroupFun', null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (266, '异议审核', ' ', 'IndvObjection/dataPageIndvObjectionReview.do', 263, '3', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, 'menuGGroupFun', null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (267, '异议审批', ' ', 'IndvObjection/dataPageIndvObjectionApprove.do', 263, '4', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, 'menuGGroupFun', null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (268, '异议更正', ' ', 'IndvObjection/dataPageIndvObjectionCorrect.do', 263, '5', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, 'menuGGroupFun', null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (278, '个人综合异议处理', ' ', 'indvObjWebService/dataPageCreditCenterObjection.do', 262, '1', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, 'menuGGroupFun', null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (279, '企业征信异议处理', null, '#', 23, '7', 'menu-icon fa fa-leaf black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (280, '征信中心客户处理', null, '#', 279, '1', 'menu-icon fa fa-leaf black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (281, '企业综合异议处理', null, 'entObjWebService/dataPageCreditCenterObjection.do', 280, '1', 'menu-icon fa fa-leaf black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');


COMMIT;
