CREATE TABLE INV_CONTRACT_VOUCHERS (
  ID BIGINT  NOT NULL AUTO_INCREMENT PRIMARY KEY,
  INV_CONTRACT_ID BIGINT NOT NULL,
  VOUCHER_ID BIGINT NOT NULL,
  FOREIGN KEY (INV_CONTRACT_ID) REFERENCES ADD_CONTRACTS (ID)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,
  FOREIGN KEY (VOUCHER_ID) REFERENCES VOUCHERS (ID)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
);