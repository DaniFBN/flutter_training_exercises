import 'account_model.dart';
import 'historic_model.dart';

final class CurrentAccountModel extends AccountModel {
  CurrentAccountModel({
    required super.accountNumber,
    required super.agencyNumber,
    required super.balance,
    required super.historic,
  });

  bool transfer(double value, String owner) {
    if (value > balance) return false;

    balance -= value;
    historic.add(
      HistoricModel(
        executedAt: DateTime.now(),
        operationType: OperationType.transfer,
        data: 'Transferência de R\$ ${value.toStringAsFixed(2)} para $owner',
      ),
    );
    return true;
  }
}

