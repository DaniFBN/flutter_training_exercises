import 'account_model.dart';

class SavingAccountModel extends AccountModel {
  SavingAccountModel({
    required super.balance,
    required super.accountNumber,
    required super.agencyNumber,
    required super.historic,
  });

  double renderSimulator(int months) {
    double newBalance = balance; 
    for (var i = 0; i < months; i++) {
      final monthRender = newBalance * 0.02;
      newBalance += monthRender;
    }

    return newBalance;
  }
}
