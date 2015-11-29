DROP FUNCTION IF EXISTS findTransferableSubjectTree;

DELIMITER //
CREATE FUNCTION findTransferableSubjectTree (subjectId BIGINT)
RETURNS TEXT

BEGIN

DECLARE sTemp TEXT;
DECLARE sTempChd TEXT;

SET sTemp = '$';
SET sTempChd = CAST(subjectId AS CHAR);

WHILE sTempChd IS NOT NULL DO
SET sTemp = CONCAT(sTemp, ',' ,sTempChd);
SELECT GROUP_CONCAT(id) INTO sTempChd FROM SUBJECTS WHERE FIND_IN_SET(TRANSFERABLE_PID, sTempChd) > 0;
END WHILE;

RETURN sTemp;

END;
//
DELIMITER;