CREATE TABLE DEPOSIT_RECORDS (
  ID         BIGINT PRIMARY KEY AUTO_INCREMENT,
  UPDATED_AT TIMESTAMP(3) NULL DEFAULT 0,
  CREATED_AT TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  ACCOUNT_ID BIGINT      NOT NULL,
  CURRENCY   VARCHAR(3)  NOT NULL,
  AMOUNT     NUMERIC(65, 2)     NOT NULL,
  STATUS     VARCHAR(16) NOT NULL,
  SUC_HIS_ID BIGINT,
  FOREIGN KEY (ACCOUNT_ID) REFERENCES ACCOUNTS (ID),
  FOREIGN KEY (SUC_HIS_ID) REFERENCES TRANSACTION_HISTORIES (ID)
);

CREATE TABLE WITHDRAW_RECORDS (
  ID          BIGINT PRIMARY KEY AUTO_INCREMENT,
  UPDATED_AT  TIMESTAMP(3) NULL DEFAULT 0,
  CREATED_AT  TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  ACCOUNT_ID  BIGINT      NOT NULL,
  CURRENCY    VARCHAR(3)  NOT NULL,
  AMOUNT      NUMERIC(65, 2)     NOT NULL,
  STATUS      VARCHAR(16) NOT NULL,
  SUC_HIS_ID  BIGINT,
  UNFRO_HIS_ID BIGINT,
  FRO_HIS_ID  BIGINT,
  FOREIGN KEY (ACCOUNT_ID) REFERENCES ACCOUNTS (ID),
  FOREIGN KEY (SUC_HIS_ID) REFERENCES TRANSACTION_HISTORIES (ID),
  FOREIGN KEY (UNFRO_HIS_ID) REFERENCES TRANSACTION_HISTORIES (ID),
  FOREIGN KEY (FRO_HIS_ID) REFERENCES TRANSACTION_HISTORIES (ID)
);