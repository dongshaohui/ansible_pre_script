CREATE TABLE CP_WITHDRAW_RECORD (
  ID              BIGINT          PRIMARY KEY AUTO_INCREMENT,
  ORDER_ID        VARCHAR(34)     NOT NULL,
  WITHDRAW_ID     VARCHAR(32)     NOT NULL,
  CREATED_AT      DATETIME        NOT NULL,
  BANK_NAME       VARCHAR(50)     NOT NULL,
  BANK_NO         VARCHAR(32)     NOT NULL,
  CP_SEQID        VARCHAR(6)      NOT NULL DEFAULT '',
  AMOUNT          NUMERIC(15, 2)  NOT NULL,
  USER_NAME       VARCHAR(100)    NOT NULL,
  USER_ID         VARCHAR(64)     NOT NULL,
  SENT_STATUS     VARCHAR(16)     NOT NULL,
  SENT_MESSAGE    VARCHAR(128)    NOT NULL DEFAULT '',
  SENT_AT         DATETIME,
  QUERY_MESSAGE   VARCHAR(128)    NOT NULL DEFAULT '',
  QUERY_AT        DATETIME,
  SYNC_STATUS     VARCHAR(16)     NOT NULL

)ENGINE=InnoDB DEFAULT CHARSET=utf8;