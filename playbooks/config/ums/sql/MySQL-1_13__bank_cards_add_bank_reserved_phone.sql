ALTER TABLE UMS_BANK_CARDS ADD BANK_RESERVED_PHONE VARCHAR(13)  NOT NULL;
UPDATE UMS_BANK_CARDS SET BANK_RESERVED_PHONE="NO_PHONE" WHERE BANK_RESERVED_PHONE = "";