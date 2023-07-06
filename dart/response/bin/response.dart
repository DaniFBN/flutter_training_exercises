// ignore_for_file: unused_import

import 'package:response/src/bank/bank.dart';
import 'package:response/src/via_cep/via_cep_api.dart';
import 'package:response/src/weighted_average/weighted_average.dart';

void main(List<String> arguments) async {
  weightedAverage();
  await viaCepApi();
  bank();
}
