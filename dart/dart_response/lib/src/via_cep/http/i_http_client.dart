abstract interface class IHttpClient {
  Future<Map<String, dynamic>> get(String url);
}
