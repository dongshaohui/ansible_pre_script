ALTER TABLE TRANSACTION_HISTORIES ADD COLUMN BALANCE_CURRENCY VARCHAR(8);
ALTER TABLE TRANSACTION_HISTORIES ADD COLUMN BALANCE_AMOUNT NUMERIC(65, 2);
ALTER TABLE TRANSACTION_HISTORIES ADD COLUMN FROZEN_CURRENCY VARCHAR(8);
ALTER TABLE TRANSACTION_HISTORIES ADD COLUMN FROZEN_AMOUNT NUMERIC(65, 2);