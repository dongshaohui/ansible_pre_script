ALTER TABLE INVESTMENT_REQUESTS DROP FOREIGN KEY investment_requests_ibfk_3;
ALTER TABLE INVESTMENT_REQUESTS MODIFY FROZEN_HIS_ID bigint(20) DEFAULT NULL;