import '../transaction_history_model.dart';

abstract class AccountModel {
  final String accountNumber;
  final String agencyNumber;
  double _balance;
  final List<TransactionHistoryModel> historic;

  double get balance => _balance;
  void setBalance(double value) => _balance = value;

  AccountModel({
    required double balance,
    required this.accountNumber,
    required this.agencyNumber,
    required this.historic,
  }) : _balance = balance;

  void deposit(double value) {
    _balance += value;

    historic.add(
      TransactionHistoryModel(
        data: 'Deposito de R\$ ${value.toStringAsFixed(2)}',
        type: TransactionType.deposit,
      ),
    );
  }

  bool withdraw(double value) {
    if (value > _balance) return false;

    _balance -= value;
    historic.add(
      TransactionHistoryModel(
        data: 'Saque de R\$ ${value.toStringAsFixed(2)}',
        type: TransactionType.withdraw,
      ),
    );
    return true;
  }

  @override
  String toString() {
    return '$runtimeType(accountNumber: $accountNumber, agencyNumber: $agencyNumber, _balance: $_balance, historic: $historic)';
  }
}
