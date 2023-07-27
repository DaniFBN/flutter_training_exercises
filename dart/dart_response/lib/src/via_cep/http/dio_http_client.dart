import 'package:dio/dio.dart';

import 'helpers/http_exceptions.dart';
import 'i_http_client.dart';

final class DioHttpClient implements IHttpClient {
  const DioHttpClient(this.dio);

  final Dio dio;

  @override
  Future<Map<String, dynamic>> get(String url) async {
    try {
      final response = await dio.get(url);

      final data = response.data;
      if (data is Map && data.containsKey('erro')) {
        throw NotFoundException();
      }

      return response.data;
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) throw BadRequestException();

      throw AppHttpException();
    }
  }
}
