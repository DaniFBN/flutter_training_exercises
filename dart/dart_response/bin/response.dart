import 'package:dart_response/src/bank/bank.dart';
import 'package:dart_response/src/via_cep/via_cep_api.dart';
import 'package:dart_response/src/weighted_average/weighted_average.dart';

void main(List<String> arguments) async {
  await bank();
  weightedAverage();
  await viaCepApi();
}
