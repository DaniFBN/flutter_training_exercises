import 'dart:convert';

import 'package:http/http.dart';

import 'helpers/http_exceptions.dart';
import 'i_http_client.dart';

final class HttpHttpClient implements IHttpClient {
  final Client http;

  const HttpHttpClient(this.http);

  @override
  Future<Map<String, dynamic>> get(String url) async {
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {"Content-Type": "application/json; charset=UTF-8"},
      );

      final data = jsonDecode(response.body);
      if (data is Map && data.containsKey('erro')) {
        throw NotFoundException();
      }

      return data;
    } on ClientException {
      throw AppHttpException();
    } on FormatException {
      throw BadRequestException();
    }
  }
}
