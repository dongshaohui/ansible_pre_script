UPDATE BIZ_PARAMS SET ACTIVE = 0 WHERE KEY_CODE = 'deposit.minimum' AND TYPE = 'MONEY';

INSERT INTO BIZ_PARAMS (TYPE, KEY_CODE, CURRENCY, AMOUNT, ACTIVE) VALUES ('MONEY', 'deposit.minimum', 'CNY', 100, 1);
