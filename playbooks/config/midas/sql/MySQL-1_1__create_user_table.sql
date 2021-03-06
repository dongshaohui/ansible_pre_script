CREATE TABLE USERS (
  ID         BIGINT PRIMARY KEY    AUTO_INCREMENT,
  USERNAME   VARCHAR(32)  NOT NULL UNIQUE,
  PHONE      VARCHAR(13)  NOT NULL,
  CREATED_AT TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3)
)
  ENGINE =INNODB;

CREATE TABLE ACCOUNTS (
  ID               BIGINT PRIMARY KEY      AUTO_INCREMENT,
  USER_ID          BIGINT         NOT NULL,
  TYPE             VARCHAR(32)    NOT NULL,
  EXTERNAL_ID      VARCHAR(64),
  AUTHORIZED       NUMERIC(1)     DEFAULT 0,
  BALANCE_AMOUNT   NUMERIC(65, 2) NOT NULL,
  BALANCE_CURRENCY VARCHAR(32)    NOT NULL,
  FROZEN_AMOUNT    NUMERIC(65, 2) NOT NULL,
  FROZEN_CURRENCY  VARCHAR(32)    NOT NULL,
  CREATED_AT       TIMESTAMP(3)   NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  EXTERNAL_REMARK TEXT,
  FOREIGN KEY (USER_ID) REFERENCES USERS (ID)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
)
  ENGINE =INNODB;
