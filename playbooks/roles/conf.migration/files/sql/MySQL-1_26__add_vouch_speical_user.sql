INSERT USERS (USERNAME, TYPE, BIND_INFO) VALUES ('vouch', 'VOUCHER', '{}');

INSERT ACCOUNTS (USER_ID, TYPE, BALANCE_AMOUNT, BALANCE_CURRENCY,  FROZEN_AMOUNT, FROZEN_CURRENCY)
  VALUES ((SELECT ID FROM USERS WHERE USERNAME = 'vouch'), 'POOL', 0, 'CNY', 0, 'CNY');