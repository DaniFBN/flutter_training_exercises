import '../transaction_history_model.dart';
import 'account_model.dart';

class CurrentAccountModel extends AccountModel {
  CurrentAccountModel({
    required super.balance,
    required super.accountNumber,
    required super.agencyNumber,
    required super.historic,
  });

  bool transfer({
    required double value,
    required String userName,
  }) {
    if (value > balance) return false;

    final newBalance = balance - value;
    setBalance(newBalance);
    historic.add(
      TransactionHistoryModel(
        data: 'Transferência de R\$ ${value.toStringAsFixed(2)} para $userName',
        type: TransactionType.transfer,
      ),
    );
    return true;
  }
}
