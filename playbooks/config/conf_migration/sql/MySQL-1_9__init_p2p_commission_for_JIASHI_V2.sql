INSERT INTO POLICY_CODES (TYPE, ACTIVE, CATALOG, OPERATION, CODE)
VALUES ('P2P_COMMISSION', 1, 'JIASHI_V2', 'SIGN', 'var config = JSON.parse(agreement.getConfig());

var commission = subject.getAmount().multipliedBy(ParserHelper.parseBigDecimal(config.commissionRate), HALF_EVEN);

var loaneeAccount = subject.getOwner().getAccount();
var p2pAccount = agreement.getParty().getAccount();

grantPlanBuilder.instalment(1).receiveAmountFromAccount(p2pAccount, loaneeAccount, [new Item(commission, "P2P_COMMISSION")]);');

INSERT INTO POLICY_CODES (TYPE, ACTIVE, CATALOG, OPERATION, CODE)
VALUES ('P2P_COMMISSION', 1, 'JIASHI_V2', 'PREPAYMENT', '//not needed');
INSERT INTO POLICY_CODES (TYPE, ACTIVE, CATALOG, OPERATION, CODE)
VALUES ('P2P_COMMISSION', 1, 'JIASHI_V2', 'OVERDUE', '//not needed');
INSERT INTO POLICY_CODES (TYPE, ACTIVE, CATALOG, OPERATION, CODE)
VALUES ('P2P_COMMISSION', 1, 'JIASHI_V2', 'VALIDATE', '//not needed');