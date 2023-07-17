import 'historic_model.dart';

abstract base class AccountModel {
  final String accountNumber;
  final String agencyNumber;
  double _balance;
  final List<HistoricModel> historic;

  AccountModel({
    required this.accountNumber,
    required this.agencyNumber,
    required double balance,
    required this.historic,
  }) : _balance = balance;

  double get balance => _balance;
  set balance(double value) {
    if (value < 0) return;

    _balance = value;
  }

  String get formattedBalance => _balance.toStringAsFixed(2);

  void deposit(double value) {
    _balance += value;

    historic.add(
      HistoricModel(
        executedAt: DateTime.now(),
        operationType: OperationType.deposit,
        data: 'Deposito de R\$ ${value.toStringAsFixed(2)}',
      ),
    );
  }

  bool withdraw(double value) {
    if (value > balance) return false;

    _balance -= value;
    historic.add(
      HistoricModel(
        executedAt: DateTime.now(),
        operationType: OperationType.withdraw,
        data: 'Saque de R\$ ${value.toStringAsFixed(2)}',
      ),
    );
    return true;
  }
}
