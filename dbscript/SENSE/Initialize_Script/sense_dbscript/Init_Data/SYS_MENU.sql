DELETE FROM SYS_MENU;

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (1, 'ϵͳ����', null, '#', 0, '1', 'menu-icon fa fa-adjust black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (2, '���߹���', null, 'onlinemanager/list.do?menuId=2', 1, '1', 'menu-icon fa fa-laptop green', 'MENUTYPE3', 1, 'onLineGroup', null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (3, '�ֵ�ά��', null, 'dictmtance/list.do?menuId=3', 1, '2', 'menu-icon fa fa-book black', 'MENUTYPE3', 1, 'dictFunGroup', null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (4, '�����ֵ�', null, 'dictionaries/listAllDict.do?menuId=4', 1, '3', 'menu-icon fa fa-book purple', 'MENUTYPE3', 1, 'dictFunGroup', null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (5, '��������', null, 'org/listAllDepartment.do?menuId=5', 1, '4', 'menu-icon fa fa-key orange', 'MENUTYPE3', 1, 'orgFunGroup', null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (6, '��ɫ����', null, 'role/roleList.do?menuId=6', 1, '5', 'menu-icon fa fa-key orange', 'MENUTYPE3', 1, 'roleFunGroup', null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (7, '�û�����', null, 'user/listUsers.do?menuId=7', 1, '6', 'menu-icon fa fa-heart-o black', 'MENUTYPE3', 1, 'userFunGroup', null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (8, '�˵�����', null, 'menu/listAllMenu.do?menuId=8', 1, '7', 'menu-icon fa fa-folder-o black', 'MENUTYPE3', 1, 'menuFunGroup', null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (9, '�˵�������', null, 'menuGroup/list.do?menuId=9', 1, '8', 'menu-icon fa fa-folder-open-o brown', 'MENUTYPE3', 1, 'menuGGroupFun', null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (10, '�����������', null, 'pwdRuleConfig/list.do?menuId=10', 1, '9', 'menu-icon fa fa-lock black', 'MENUTYPE3', 1, 'pwdFunGroup', null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (11, '���˲˵�', null, '#', 0, '1', 'menu-icon fa fa-book black', 'MENUTYPE3', 1, null, null, null, 'super', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (12, '����ά��', null, '#', 0, '2', 'menu-icon fa fa-book black', 'MENUTYPE3', 1, null, null, null, 'super', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (13, '����ά��', null, 'company/listCompany.do?menuId=13', 12, '1', 'menu-icon fa fa-users blue', 'MENUTYPE3', 1, null, null, null, 'super', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (14, '���˲˵�', null, 'menu/listAllMenu.do?menuId=8', 11, '1', 'menu-icon fa fa-key orange', 'MENUTYPE3', 1, 'menuFunGroup', null, null, 'super', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (15, 'ϵͳ����', null, '#', 0, '2', 'menu-icon fa fa-cog black', 'MENUTYPE3', 0, null, null, null, 'PB', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (16, '����������', null, '#', 15, '1', 'menu-icon fa fa-cogs brown', 'MENUTYPE3', 0, null, null, null, 'PB', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (17, '��������', null, 'createCode/list.do?menuId=17', 12, '1', 'menu-icon fa fa-exclamation-circle black', 'MENUTYPE3', 1, 'sysToolGroup', null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (18, '��������', null, 'recreateCode/list.do?menuId=18', 12, '2', 'menu-icon fa fa-cogs blue', 'MENUTYPE3', 1, 'sysToolGroup', null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (19, '��ӡ����', null, 'tool/printTest.do?menuId=19', 15, '2', 'menu-icon fa fa-hdd-o grey', 'MENUTYPE3', 0, 'sysToolGroup', null, null, 'PB', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (20, 'ͼƬ����', null, 'pictures/list.do?menuId=20', 15, '3', 'menu-icon fa fa-folder-open-o green', 'MENUTYPE3', 0, 'pictureFunGroup', null, null, 'PB', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (21, '��־��ѯ', null, '#', 0, '3', 'menu-icon fa fa-bar-chart-o black', 'MENUTYPE3', 0, null, null, null, 'PB', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (22, '������־��ѯ', null, 'operation/list.do?menuId=22', 21, '1', 'menu-icon fa fa-folder-open-o green', 'MENUTYPE3', 0, 'operationFunGroup', null, null, 'PB', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (23, '��ҵ���ű���', null, '#', 0, '6', 'menu-icon fa fa-folder-open-o black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (24, '�������ű���', null, '#', 0, '7', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (25, '��ҵ�������ݲ�¼', null, '#', 23, '1', 'menu-icon fa fa-envelope-o green', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (26, '��ҵ������Ϣ��¼', 'EnterpriseBasicInfo', 'eccustbasis/list.do', 25, '1', 'menu-icon fa fa-pencil-square-o black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (27, '��ҵ�������ϵ��Ϣ', 'EnterprisesRelationship', 'enIcdnRltpInf/list.do', 25, '2', 'menu-icon fa fa-pencil-square-o black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (28, '��ҵ�����Ϣ', 'CorporateLendingInfo', 'entLoanAcctInfo/dataPage.do', 25, '3', 'menu-icon fa fa-pencil-square-o black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (29, '��ҵ������Ϣ', 'CorporateGuaranteeInfo', 'enSecAcctInf/dataPage.do', 25, '4', 'menu-icon fa fa-pencil-square-o black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (30, '��ҵ����Э����Ϣ��¼', null, 'enCtrctInfo/dataPage.do', 25, '5', 'menu-icon fa fa-pencil-square-o black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (31, '��ҵ�ʲ���ծ��Ϣ', null, 'entBalanceInfo/dataPage.do', 25, '6', 'menu-icon fa fa-leaf black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (32, '��ҵ�ֽ�������Ϣ', null, 'cashFlows/dataPage.do', 25, '7', 'menu-icon fa fa-pencil-square-o black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (33, '��ҵ������������', null, 'entIncomeInfo/dataPage.do', 25, '8', 'menu-icon fa fa-pencil-square-o black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (34, '��ҵ��λ�ʲ���ծ��', null, 'entInstitutionInfo/dataPage.do', 25, '9', 'menu-icon fa fa-pencil-square-o black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (35, '��ҵ��λ����֧����', null, 'ecdtreportinstie/list.do?menuId=35', 25, '10', 'menu-icon fa fa-pencil-square-o black', 'MENUTYPE2', 0, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (36, '��ҵ�����������', null, '#', 23, '2', 'menu-icon fa fa-gavel green', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (37, '��ҵ���Ĺ���', null, '#', 23, '3', 'menu-icon fa fa-folder-o green', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (38, '��������', null, 'entNormalMessage/entNormalMessagePage.do?menuId=38', 37, '1', 'menu-icon fa fa-download black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (40, '������ִ����', null, '#', 23, '4', 'menu-icon fa fa-external-link green', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (41, '������ִ����', null, 'feedbackMessage/dataPage.do', 40, '1', 'menu-icon fa fa-leaf black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (43, '��ҵ���ⱨ�Ĺ���', null, '#', 37, '3', 'menu-icon fa fa-folder green', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (44, '��ҵ��ʶ���', null, 'entAccountChange/dataPage.do', 43, '1', 'menu-icon fa fa-cog black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (45, '��ҵ���θ���', null, '#', 43, '2', 'menu-icon fa fa-cog black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (46, '��ҵ����/����ɾ��', null, 'entDelAccount/dataPage.do', 43, '3', 'menu-icon fa fa-cog black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (52, '����˻����θ���', null, 'entUpDaccountData/entLoanChangeList.do', 45, '1', 'menu-icon fa fa-cogs black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (53, '�����˻����θ���', null, 'entUpDaccountData/entGuaranteeChange.do', 45, '2', 'menu-icon fa fa-cogs black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (54, '����Э�鰴�θ���', null, 'entUpDaccountData/entProtocolChange.do', 45, '3', 'menu-icon fa fa-cogs black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (64, '��ҵ�����ۺϲ�ѯ', null, '#', 23, '5', 'menu-icon fa fa-desktop green', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (65, '���˱������ݲ�¼', null, '#', 24, '1', 'menu-icon fa fa-envelope-o green', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (66, '�������ݱ������', null, '#', 24, '2', 'menu-icon fa fa-gavel green', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (67, '���˱��Ĺ���', null, '#', 24, '3', 'menu-icon fa fa-folder-o green', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (68, '������ִ����', null, '#', 24, '4', 'menu-icon fa fa-external-link green', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (69, '�������ⱨ������', null, '#', 67, '3', 'menu-icon fa fa-folder-o green', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (70, '�����ۺ����ݲ�ѯ', null, '#', 24, '5', 'menu-icon fa fa-desktop green', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (71, '���˻�����Ϣ��¼', null, 'indvBasicsInfo/indvBasicsInfoPage.do', 65, '1', 'menu-icon fa fa-credit-card black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (72, '����֤����Ч��', null, 'inIDEfctInf/dataPage.do', 65, '5', 'menu-icon fa fa-credit-card black', 'MENUTYPE2', 1, 'menuGGroupFun', null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (73, '�����ϵ��Ϣ��¼', null, 'inFalMmbsInf/dataPage.do', 65, '6', 'menu-icon fa fa-credit-card black', 'MENUTYPE2', 1, 'menuGGroupFun', null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (74, '��������Э����Ϣ��¼', null, 'inCtrctInf/dataPage.do', 65, '4', 'menu-icon fa fa-credit-card black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (75, '���˵����˻���Ϣ��¼', null, 'indvGuarAcctInfo/dataPage.do', 65, '3', 'menu-icon fa fa-credit-card black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (76, '���˽���˻���Ϣ��¼', null, 'indvLoanAcctInfo/dataPage.do', 65, '2', 'menu-icon fa fa-credit-card black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (77, '��������¼�˵��', null, 'inSpcEvtDscInf/dataPage.do', 65, '7', 'menu-icon fa fa-credit-card black', 'MENUTYPE2', 1, 'menuGGroupFun', null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (78, '������������', null, 'indvNormalMessage/indvNormalMessagePage.do', 67, '1', 'menu-icon fa fa-download black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (80, '�������ⱨ������', null, 'indvAbnormalMessage/indvAbnormalMessagePage.do', 67, '4', 'menu-icon fa fa-download black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (81, '������ִ����', null, 'feedbackMessage/dataPage.do', 68, '1', 'menu-icon fa fa-credit-card black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (82, '���˱�ʶ���', null, 'accountchange/dataPage.do', 69, '1', 'menu-icon fa fa-certificate black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (83, '���˰��θ���', null, '#', 69, '2', 'menu-icon fa fa-certificate black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (84, '���˰���/����ɾ��', null, 'delaccount/dataPage.do', 69, '3', 'menu-icon fa fa-certificate black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (86, '���Ų�������', null, '#', 0, '4', 'menu-icon fa fa-leaf black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (87, '��ҵ���ⱨ������', null, 'entAbnormalMessage/entAbnormalMessagePage.do', 37, '4', 'menu-icon fa fa-credit-card black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (88, 'У���������', null, 'checkRule/dataPage.do', 86, '1', 'menu-icon fa fa-cogs green', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (89, '����', null, 'example/dataPage.do', 86, '4', 'menu-icon fa fa-leaf black', 'MENUTYPE2', 1, null, null, null, 'PB', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (90, 'У�����鿴', null, 'checkResult/dataPage.do?flag=indv', 86, '3', 'menu-icon fa fa-leaf black', 'MENUTYPE2', 1, null, null, null, 'PB', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (91, '���˽�����θ��� ', null, 'indvProtocol/indvLoanChange.do', 83, '1', 'menu-icon fa fa-leaf black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (92, '���˵������θ���', null, 'indvProtocol/indvGuaranteeChange.do', 83, '2', 'menu-icon fa fa-leaf black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (93, '�������Ű��θ���', null, 'indvProtocol/indvProtocolChange.do', 83, '3', 'menu-icon fa fa-leaf black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (94, '����ģ��', null, '#', 0, '5', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (95, '�֣��ʣ�Ѻ��ͬ��¼', null, 'motgaInfo/dataPage', 209, '1', 'menu-icon fa fa-pencil-square-o black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (96, '����Ѻ��Ϣ��������', null, 'motgaNormalMessage/motgaNormalMessagePage.do', 211, '1', 'menu-icon fa fa-envelope black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (97, '����Ѻ���ⱨ������', null, 'motgaAbnormalMessage/motgaAbnormalMessagePage.do', 211, '2', 'menu-icon fa fa-envelope black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (98, '���˻�����Ϣ', null, 'indvBasicsInfoSeo/listPage.do', 70, '1', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (99, '����֤����Ч����Ϣ', null, 'inIDEfctInfSeo/listPage.do', 70, '5', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (100, '�����ϵ��Ϣ', null, 'inFalMmbsInfSeo/listPage.do', 70, '6', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (101, '��������Э����Ϣ', null, 'inCtrctInfSeo/listPage.do', 70, '4', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (102, '���˽���˻���Ϣ', null, 'indvLoanAcctInfoSeo/listPage.do', 70, '2', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (103, '�֣��ʣ�Ѻ��ͬ��Ϣ', null, '#', 94, '1', 'menu-icon fa fa-certificate black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (104, '��ҵ������Ϣ', null, 'enBasInfSeo/listPage', 64, '1', 'menu-icon fa fa-leaf black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (105, '��ҵ��λ����֧����', null, 'ecdtreportinstieSeo/list.do', 64, '10', 'menu-icon fa fa-leaf black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (106, '��ҵ�������ϵ', null, 'enIcdnRltpInfSeo/listPage.do', 64, '2', 'menu-icon fa fa-leaf black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (107, '��ҵ�ֽ�����', null, 'cashFlowsSeo/listPage.do', 64, '7', 'menu-icon fa fa-leaf black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (108, ' ��ҵ�����������', null, 'entIncomeInfoSeo/listPage.do', 64, '8', 'menu-icon fa fa-leaf black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (109, '��ҵ��λ�ʲ���ծ��', null, 'entInstitutionInfoSeo/listPage.do', 64, '9', 'menu-icon fa fa-leaf black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (111, '��ҵ�ʲ���ծ��Ϣ', null, 'entBalanceInfoSeo/listPage.do', 64, '6', 'menu-icon fa fa-leaf black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (112, '���˽�������¼�', null, 'inSpcEvtDscInfSeo/listPage.do', 70, '7', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (113, '��ҵ�����Ϣ��¼', null, 'entLoanAcctInfoSeo/listPage.do', 64, '3', 'menu-icon fa fa-leaf black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (114, '��ҵ������Ϣ', null, 'enSecAcctInfSeo/listPage.do', 64, '4', 'menu-icon fa fa-leaf black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (115, '�֣��ʣ�Ѻ��ͬ��Ϣ', null, 'motgaInfoSeo/listPage', 210, '1', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (116, '���˵����˻���Ϣ', null, 'indvGuarAcctInfoSeo/listPage.do', 70, '3', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (117, '��ҵ����Э��', null, 'enCtrctInfoSeo/listPage.do', 64, '5', 'menu-icon fa fa-leaf black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (118, '���˻������', null, 'auditing/listPage.do', 66, '1', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (119, '���˽�����', null, 'auditing/auditLoanAcct.do', 66, '2', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (120, '�����������', null, 'auditing/auditInCtrctInfo.do', 66, '4', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (122, '��ҵ�������', null, 'auditing/auditEnBasInf.do', 36, '1', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (123, '��ҵ������', null, 'auditing/auditEntLoanAcct.do', 36, '3', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (124, '��ҵ�������', null, 'auditing/auditEnSecAcct.do', 36, '4', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (125, '��ҵ�ֽ��������', null, 'auditing/auditCashFlows.do', 36, '7', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (126, '��ҵ�������', null, 'auditing/auditEnCtrctInfo.do', 36, '5', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (127, '����Ѻ�������', null, 'auditing/motgaCltalBsPage.do', 103, '6', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (128, '��ҵ�ʲ���ծ���', null, 'auditing/auditEntBalanceInfo.do', 36, '6', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (129, '��ҵ����������������', null, 'auditing/auditEntIncomeInfo.do', 36, '8', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (130, '��ҵ��λ�ʲ���ծ���', null, 'auditing/auditEntInstitutionInfo.do', 36, '9', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (131, '��ҵ��λ����֧�����', null, 'auditing/auditEntIncomeStatemeBs.do', 36, '10', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (132, '��������¼�˵�����', null, 'auditing/inSpcEvtDscPage.do', 66, '7', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (133, '����֤����Ч�����', null, 'auditing/inIDEfctPage.do', 66, '5', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (134, '�����ϵ��Ч���', null, 'auditing/inFalMmbsPage.do', 66, '6', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (135, '��ҵ������ϵ���', null, 'auditing/enIcdnRltpPage.do', 36, '2', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (136, '���˵������', null, 'auditing/guarAcctInfo.do', 66, '3', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (200, 'ģ�����˺˶�', null, 'bothcheck/checkList.do', 207, '1', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (201, 'ģ�����˺˶Ա�������', null, 'bothcheck/packList.do', 207, '2', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (202, '���鴦�����Ǽ�', null, 'objFeedBack/list.do', 208, '1', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (203, '������Ϣͳ��', null, 'objStatistics/list.do', 208, '2', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (204, 'У������ѯ', ' ', '#', 94, '3', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (205, '������ִ����', ' ', 'feedbackMessage/dataPage.do', 103, '9', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (206, 'У������ѯ', ' ', 'dataCheckInfo/dataCheckInfo.do', 204, '1', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (207, 'ģ�����˺˶�', null, '#', 94, '4', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (208, '������Ϣ����', null, '#', 94, '5', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (209, '����Ѻ���ݲ�¼', null, '#', 103, '1', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (210, '����Ѻ�����ۺϲ�ѯ', null, '#', 103, '2', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (211, '����Ѻ���Ĺ���', null, '#', 103, '3', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (212, '��ʶ����ۺϲ�ѯ', ' ', 'accountchangeSeo/listPage.do', 223, '8', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (213, '������θ�����ѯ', ' ', 'indvLoanAcctInfoSeo/listPageForUpdate.do', 225, '9', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (214, '�������θ�����ѯ', ' ', 'indvGuarAcctInfoSeo/listPageForUpdate.do', 225, '10', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (215, '���Ű��θ�����ѯ', ' ', 'inCtrctInfSeo/listPageForUpdate.do', 225, '11', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (216, '����/����ɾ����ѯ', ' ', 'delaccountSeo/listPage.do', 223, '12', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (218, '���ű��Ͱ�����', null, 'baiming/listPage.do', 94, '6', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'PB', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (219, '��ҵ������θ���', ' ', 'entLoanAcctInfoSeo/listPageForUpdate.do', 224, '10', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (220, '��ҵ���Ű��θ���', ' ', 'enCtrctInfoSeo/listPageForUpdate.do', 224, '10', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (221, '��ҵ�������θ���', ' ', 'enSecAcctInfSeo/listPageForUpdate.do', 224, '10', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (222, '��ҵ�����ۺϲ�ѯ', ' ', '#', 23, '6', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (223, '���˸��������ۺϲ�ѯ', ' ', '#', 24, '6', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (224, '��ҵ���θ�����Ϣ', ' ', '#', 222, '10', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (225, '���θ����ۺϲ�ѯ', ' ', '#', 223, '10', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (226, '��ҵ�Ʊ���Ϣ', null, 'entFinStaSeo/listPage.do', 222, '3', 'menu-icon fa fa-leaf black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (227, '��ҵ����/����ɾ��', null, 'entDelAccountSeo/listPage.do', 222, '3', 'menu-icon fa fa-leaf black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (228, '��ҵ��ʶ�����Ϣ', null, 'entAccountChangeSeo/listPage.do', 222, '3', 'menu-icon fa fa-leaf black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (229, '����Ѻ�����ۺϲ�ѯ', null, '#', 103, '6', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (230, '����Ѻɾ��', null, 'moDelSeo/listPage.do', 229, '1', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (231, '����Ѻ��ʶ���', null, 'moChangeSeo/listPage.do', 229, '2', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (232, '��ִ��������', null, 'Rule/dataPage.do', 86, '2', 'menu-icon fa fa-leaf black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (233, '����Ѻ��Ϣ���ⲹ¼', null, '#', 211, '3', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (234, '�֣��ʣ�Ѻ��ͬ��Ϣ��ʶ���', null, 'moChange/dataPage.do', 233, '1', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (235, '�֣��ʣ�Ѻ��ͬ��Ϣɾ��', null, 'moDel/dataPage.do', 233, '2', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (240, '���ڶ���֪ͨ����', null, 'indvTextMsgInform/dataPage.do', 67, '5', 'menu-icon fa fa-download black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (242, '��ҵ������������', null, 'indvMessageDownLoad/entDataPage.do', 37, '2', 'menu-icon fa fa-leaf black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (243, '������������', null, 'indvMessageDownLoad/indvDataPage.do', 67, '2', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (244, '����Ѻ���ⱨ������', null, 'indvMessageDownLoad/moSpDataPage.do', 211, '4', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (245, '����Ѻ������������', null, 'indvMessageDownLoad/moDataPage.do', 211, '5', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (246, '���ⱨ������', null, 'indvMessageDownLoad/indvSpDataPage.do', 67, '6', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (247, '��ҵ���ⱨ������', null, 'indvMessageDownLoad/entSpDataPage.do', 37, '5', 'menu-icon fa fa-leaf black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (249, '�����������鴦��', ' ', '#', 24, '8', 'menu-icon fa fa-leaf green', 'MENUTYPE3', 1, 'menuGGroupFun', null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (262, '�������Ŀͻ�����', ' ', '#', 249, '1', 'menu-icon fa fa-leaf green', 'MENUTYPE3', 1, 'menuGGroupFun', null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (263, '���������Ŀͻ�����', ' ', '#', 249, '2', 'menu-icon fa fa-leaf green', 'MENUTYPE3', 1, 'menuGGroupFun', null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (264, '����Ǽ�', ' ', 'IndvObjection/dataPageIndvObjectionRegiste.do', 263, '1', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, 'menuGGroupFun', null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (265, '���Ϻ˲�', ' ', 'IndvObjection/dataPageIndvObjectionCheck.do', 263, '2', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, 'menuGGroupFun', null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (266, '�������', ' ', 'IndvObjection/dataPageIndvObjectionReview.do', 263, '3', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, 'menuGGroupFun', null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (267, '��������', ' ', 'IndvObjection/dataPageIndvObjectionApprove.do', 263, '4', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, 'menuGGroupFun', null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (268, '�������', ' ', 'IndvObjection/dataPageIndvObjectionCorrect.do', 263, '5', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, 'menuGGroupFun', null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (278, '�����ۺ����鴦��', ' ', 'indvObjWebService/dataPageCreditCenterObjection.do', 262, '1', 'menu-icon fa fa-leaf black', 'MENUTYPE3', 1, 'menuGGroupFun', null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (279, '��ҵ�������鴦��', null, '#', 23, '7', 'menu-icon fa fa-leaf black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (280, '�������Ŀͻ�����', null, '#', 279, '1', 'menu-icon fa fa-leaf black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');

insert into sys_menu (MENU_ID, MENU_NAME, MENU_NAME_EN, MENU_URL, PARENT_ID, ORDER_BY, MENU_ICON, MENU_TYPE, MENU_STATE, MENU_GROUP_ID, TRAN_CODE, SYS_IND, COMPANY, MENU_CHANNEL)
values (281, '��ҵ�ۺ����鴦��', null, 'entObjWebService/dataPageCreditCenterObjection.do', 280, '1', 'menu-icon fa fa-leaf black', 'MENUTYPE2', 1, null, null, null, 'ALL', 'PC');


COMMIT;
