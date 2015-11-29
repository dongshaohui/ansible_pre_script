CREATE TABLE UMS_VOUCHER_EVENT (
  ID         BIGINT PRIMARY KEY AUTO_INCREMENT,
  UMS_USER_ID BIGINT NOT NULL,
  MIDAS_USER_ID BIGINT NOT NULL,
  EVENT_TYPE VARCHAR(32) NOT NULL,
  VOUCHER_TYPE_CODE VARCHAR(32) NOT NULL,
  CHANNEL    VARCHAR(32) NOT NULL,
  STATUS VARCHAR(16) NOT NULL,
  CREATED_AT TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  UPDATED_AT  TIMESTAMP(3)
);