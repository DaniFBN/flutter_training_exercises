import 'package:uno/uno.dart';

import 'helpers/http_exceptions.dart';
import 'i_http_client.dart';

final class UnoHttpClient implements IHttpClient {
  final Uno uno;

  const UnoHttpClient(this.uno);

  @override
  Future<Map<String, dynamic>> get(String url) async {
    try {
      final response = await uno.get(url);

      final data = response.data;
      if (data is Map && data.containsKey('erro')) {
        throw NotFoundException();
      }

      return response.data;
    } on UnoError catch (e) {
      if (e.response?.status == 400) throw BadRequestException();

      throw AppHttpException();
    }
  }
}
