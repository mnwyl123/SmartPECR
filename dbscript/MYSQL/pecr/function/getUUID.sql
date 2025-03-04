-- ----------------------------
-- Function structure for getUUID
-- ----------------------------
DROP FUNCTION IF EXISTS getUUID;
DELIMITER ;;
CREATE DEFINER='root'@'%' FUNCTION getUUID() RETURNS varchar(32) CHARSET utf8
begin 
		DECLARE UUID VARCHAR(32);
    SELECT REPLACE(UUID(),'-','') INTO UUID FROM DUAL;
		RETURN UUID;
end
;;
DELIMITER ;