enum OperationType { withdraw, transfer, deposit, simulateRender }

class HistoricModel {
  final DateTime executedAt;
  final OperationType operationType;
  final String data;

  const HistoricModel({
    required this.executedAt,
    required this.operationType,
    required this.data,
  });
}
