INSERT INTO POLICY_CODES (TYPE, ACTIVE, CATALOG, OPERATION, CODE) VALUES ('P2P_LOAN', 1, 'JIASHI_V1', 'VALIDATE', 'ensure(_$request.config.investProfitFeeRate).is_rate().message("投资收益手续费比例必须大于等于0，小于等于1");
ensure(_$request.config.overduePenaltyRate).is_rate().message("逾期罚息比例必须大于等于0，小于等于1");

ensure(_$request.config.investProfitFeeBeneficiaryParty).equals("p2p-investor-profit").message("投资人收益手续费账户用户名错误");
ensure(_$request.config.investProfitFeeBeneficiaryParty).user_exist().message("投资人收益手续费账户不存在");

ensure(_$request.config.passDays).bigger_than(0).message("募集期天数需要大于0");

if (_$request.config.valueDays) {
    ensure(_$request.config.valueDays).bigger_than(0).message("起息日不能早于交割日期");
}

ensure(_$request.agreements.size()).equals(2).message("需要提供两个附加协议");
if (_$request.agreements.size() == 2) {
    ensure(_$request.agreements[0].type).equals("P2P_COMMISSION").message("第一个附加协议必须为P2P平台手续费");
    ensure(_$request.agreements[1].type).equals("RISK").message("第二个附加协议必须为风险备用金");
}
');