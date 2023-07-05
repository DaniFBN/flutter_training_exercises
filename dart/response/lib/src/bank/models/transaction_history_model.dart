enum TransactionType { withdraw, transfer, deposit }

class TransactionHistoryModel {
  final String data;
  final TransactionType type;

  const TransactionHistoryModel({
    required this.data,
    required this.type,
  });
}