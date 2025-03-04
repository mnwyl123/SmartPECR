-- ----------------------------
-- View structure for sys_org_view
-- ----------------------------
 DROP VIEW IF EXISTS sys_org_view;
 CREATE ALGORITHM=UNDEFINED DEFINER='root'@'%' SQL SECURITY DEFINER VIEW sys_org_view AS select sense.sys_org.ORG_ID AS ORG_ID,sense.sys_org.NAME AS NAME,sense.sys_org.NAME_EN AS NAME_EN,sense.sys_org.ORG_LEVEL AS ORG_LEVEL,sense.sys_org.ORG_CODE AS ORG_CODE,sense.sys_org.PARENT_ID AS PARENT_ID,sense.sys_org.ORG_DESC AS ORG_DESC,sense.sys_org.HEADMAN AS HEADMAN,sense.sys_org.TEL AS TEL,sense.sys_org.FUNCTIONS AS FUNCTIONS,sense.sys_org.ADDRESS AS ADDRESS,sense.sys_org.STATUS AS STATUS,sense.sys_org.ORG_ORDER AS ORG_ORDER,sense.sys_org.COMPANY AS COMPANY,sense.sys_org.ORG_CODE_FOURTEEN AS ORG_CODE_FOURTEEN,sense.sys_org.EACH_ORG_CODE_FOURTEEN AS EACH_ORG_CODE_FOURTEEN from sense.sys_org ;

