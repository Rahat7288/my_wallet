abstract class BaseApiService {
  Future<dynamic> get(String url,
      {Map<String, dynamic>? queryParams, Map<String, String>? headers});
  Future<dynamic> post(String url,
      {dynamic body, Map<String, String>? headers});
  Future<dynamic> put(String url, {dynamic body, Map<String, String>? headers});
  Future<dynamic> delete(String url, {Map<String, String>? headers});
}
