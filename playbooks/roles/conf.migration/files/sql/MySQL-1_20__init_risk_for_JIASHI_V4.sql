INSERT INTO POLICY_CODES (TYPE, ACTIVE, CATALOG, OPERATION, CODE) VALUES ('RISK', 1, 'JIASHI_V4', 'SIGN', 'var config = JSON.parse(agreement.getConfig());

var risk = subject.getAmount().multipliedBy(ParserHelper.parseBigDecimal(config.riskRate), HALF_EVEN);

var loaneeAccount = subject.getOwner().getAccount();
var riskAccount = agreement.getParty().getAccount();

grantPlanBuilder.instalment(1).receiveAmountFromAccount(riskAccount, loaneeAccount, [new Item(risk, "RISK_FUND")]);');
INSERT INTO POLICY_CODES (TYPE, ACTIVE, CATALOG, OPERATION, CODE)
VALUES ('RISK', 1, 'JIASHI_V4', 'PREPAYMENT', '//not needed');
INSERT INTO POLICY_CODES (TYPE, ACTIVE, CATALOG, OPERATION, CODE)
VALUES ('RISK', 1, 'JIASHI_V4', 'OVERDUE', '//not needed');
INSERT INTO POLICY_CODES (TYPE, ACTIVE, CATALOG, OPERATION, CODE)
VALUES ('RISK', 1, 'JIASHI_V4', 'VALIDATE', '//not needed');