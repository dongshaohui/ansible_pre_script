CREATE TABLE SUBJECTS (
    ID                BIGINT PRIMARY KEY AUTO_INCREMENT,
    USER_ID           BIGINT                    NOT NULL,
    CREATED_AT        TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    TYPE              VARCHAR(32)               NOT NULL,
    CATALOG VARCHAR(65) NOT NULL,
    CURRENCY          VARCHAR(3)                NOT NULL,
    AMOUNT            NUMERIC(65, 2)                   NOT NULL,
    MIN_INV_CURRENCY  VARCHAR(3)                NOT NULL,
    MIN_INV_AMOUNT    NUMERIC(65, 2)                   NOT NULL,
    STEP_INV_CURRENCY VARCHAR(3)                NOT NULL,
    STEP_INV_AMOUNT   NUMERIC(65, 2)                   NOT NULL,
    INSTAL_TYPE       VARCHAR(64)               NOT NULL,
    NUM_INSTAL        INT                       NOT NULL,
    ANNUAL_RATE       NUMERIC(65, 30)                   NOT NULL,
    CUR_INV_CURRENCY  VARCHAR(3)                NOT NULL,
    CUR_INV_AMOUNT    NUMERIC(65, 2)                   NOT NULL,
    STATUS            VARCHAR(16)               NOT NULL,
    TITLE             VARCHAR(64)               NOT NULL,
    LOANEE_INFO       TEXT                      NOT NULL,
    CONFIG TEXT NOT NULL ,
    FOREIGN KEY (USER_ID) REFERENCES USERS (ID)
);

CREATE TABLE SUBJECT_STATUS_HIS (
    ID                BIGINT                 PRIMARY KEY AUTO_INCREMENT,
    SUBJECT_ID        BIGINT                    NOT NULL,
    STATUS            VARCHAR(16)               NOT NULL,
    CREATED_AT        TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3)
);

CREATE TABLE SUBJECT_AGREEMENTS (
    ID                BIGINT                 PRIMARY KEY AUTO_INCREMENT,
    SUBJECT_ID        BIGINT                    NOT NULL,
    PARTY_ID          BIGINT                    NOT NULL,
    TYPE              VARCHAR(32)               NOT NULL,
    CODE              TEXT                      NOT NULL,
    PREPAY_CODE              TEXT                      NOT NULL,
    OVERDUE_CODE              TEXT                      NOT NULL,
    CONFIG            TEXT                      NOT NULL,
    FOREIGN KEY (SUBJECT_ID) REFERENCES SUBJECTS (ID),
    FOREIGN KEY (PARTY_ID) REFERENCES USERS (ID)
);

CREATE TABLE POLICY_CODES (
    ID                BIGINT PRIMARY KEY AUTO_INCREMENT,
    TYPE              VARCHAR(32)               NOT NULL,
    CODE              TEXT                      NOT NULL,
    CATALOG VARCHAR(255) NOT NULL,
    OPERATION         VARCHAR(255)              NOT NULL,
    ACTIVE            NUMERIC(1)                NOT NULL,
    CREATED_AT        TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3)
);

CREATE TABLE INVESTMENT_REQUESTS (
    ID                BIGINT PRIMARY KEY AUTO_INCREMENT,
    INVESTOR_ID       BIGINT        NOT NULL,
    SUBJECT_ID        BIGINT        NOT NULL,
    CREATED_AT        TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    INVEST_CURRENCY   VARCHAR(3)    NOT NULL,
    INVEST_AMOUNT     NUMERIC(65, 2)       NOT NULL,
    FROZEN_HIS_ID     BIGINT        NOT NULL,
    STATUS            VARCHAR(16)   NOT NULL,
    FAIL_HIS_ID        BIGINT,
    FOREIGN KEY (INVESTOR_ID) REFERENCES USERS (ID),
    FOREIGN KEY (SUBJECT_ID) REFERENCES SUBJECTS (ID),
    FOREIGN KEY (FROZEN_HIS_ID) REFERENCES TRANSACTION_HISTORIES (ID)
);

CREATE TABLE INV_REQ_STATUS_HIS (
    ID                BIGINT PRIMARY KEY AUTO_INCREMENT,
    INV_REQ_ID        BIGINT                    NOT NULL,
    STATUS            VARCHAR(16)               NOT NULL,
    CREATED_AT        TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3)
);