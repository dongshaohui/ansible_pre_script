ALTER TABLE ADD_CONTRACTS DROP FOREIGN KEY add_contracts_ibfk_2;
ALTER TABLE ADD_CONTRACTS DROP COLUMN INV_ID;
ALTER TABLE ADD_CONTRACTS ADD COLUMN INV_CURRENCY VARCHAR(3);
ALTER TABLE ADD_CONTRACTS ADD COLUMN INV_AMOUNT NUMERIC(65, 2);