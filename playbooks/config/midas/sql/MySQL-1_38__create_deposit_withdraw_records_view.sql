CREATE VIEW DEPOSIT_WITHDRAW_RECORDS AS
(SELECT "DEPOSIT" AS "RECORD_TYPE", ID, ACCOUNT_ID, CREATED_AT, CURRENCY, AMOUNT, STATUS, CHANNEL, CALLBACK_JSON
FROM DEPOSIT_RECORDS
WHERE TYPE = "ONLINE" AND CHANNEL = "CHINA_PAY" AND STATUS <> "SUCCESSFUL")
UNION ALL
(SELECT "WITHDRAW" AS "RECORD_TYPE", ID, ACCOUNT_ID, CREATED_AT, CURRENCY, AMOUNT, STATUS, CHANNEL, CALLBACK_JSON
FROM WITHDRAW_RECORDS
WHERE TYPE = "ONLINE" AND CHANNEL = "CHINA_PAY" AND STATUS <> "SUCCESSFUL")
ORDER BY CREATED_AT DESC;