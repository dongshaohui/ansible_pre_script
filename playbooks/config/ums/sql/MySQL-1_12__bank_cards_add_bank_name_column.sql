ALTER TABLE UMS_BANK_CARDS ADD BANK_NAME VARCHAR(50) NOT NULL;
UPDATE UMS_BANK_CARDS SET BANK_NAME="NO_BANK_NAME" WHERE BANK_NAME = "";