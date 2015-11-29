CREATE TABLE TRANSACTION_HISTORIES (
  ID                   BIGINT PRIMARY KEY      AUTO_INCREMENT,
  ACCOUNT_ID           BIGINT         NOT NULL,
  COUNTER_ID           BIGINT,
  TYPE                 VARCHAR(64)    NOT NULL,
  TRANSACTION_AMOUNT   NUMERIC(65, 2) NOT NULL,
  TRANSACTION_CURRENCY VARCHAR(8)     NOT NULL,
  CREATED_AT           TIMESTAMP(3)   NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  FOREIGN KEY (ACCOUNT_ID) REFERENCES ACCOUNTS (ID),
  FOREIGN KEY (COUNTER_ID) REFERENCES ACCOUNTS (ID)
);