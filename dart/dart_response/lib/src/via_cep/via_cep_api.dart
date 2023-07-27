import 'dart:io';

import 'package:dio/dio.dart';

import 'http/dio_http_client.dart';
import 'http/helpers/http_exceptions.dart';
import 'http/i_http_client.dart';
import 'models/address_model.dart';

Future<void> viaCepApi() async {
  late String cep;
  do {
    stdout.write('Digite o CEP: ');
    cep = stdin.readLineSync()!;

    if (cep == '0') continue;

    final handledCep = cep.replaceAll('-', '');
    if (handledCep.length != 8) {
      stdout.writeln('O CEP deve conter 8 dígitos');
      continue;
    }

    final IHttpClient client = DioHttpClient(Dio());

    late Map<String, dynamic> data;
    try {
      data = await client.get('https://viacep.com.br/ws/$handledCep/json/');
    } on NotFoundException {
      stdout.writeln('O CEP($cep) não foi encontrado');
      continue;
    } on BadRequestException {
      stdout.writeln('O CEP($cep) é inválido');
      continue;
    } on AppHttpException {
      stdout.writeln('Erro na API');
      continue;
    }

    final model = AddressModel.fromMap(data);
    print(model);
  } while (cep != '0');
}
