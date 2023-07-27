import 'account_model.dart';

final class SavingAccountModel extends AccountModel {
  SavingAccountModel({
    required super.accountNumber,
    required super.agencyNumber,
    required super.balance,
    required super.historic,
  });

  ({double fee, double yield2, double balance}) renderSimulate(int month) {
    const renderPercent = 0.02;
    double newBalance = balance;

    for (var i = 0; i < month; i++) {
      final render = newBalance * renderPercent;
      newBalance += render;
    }

    final totalYield = newBalance - balance;

    return (fee: renderPercent * 100, yield2: totalYield, balance: newBalance);
  }
}
