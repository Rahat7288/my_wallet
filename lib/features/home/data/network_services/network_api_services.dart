import 'dart:convert';

import 'package:http/http.dart' as http;

import '../base_network_service.dart';

class HttpService implements BaseNetworkService {
  final http.Client client;

  HttpService({http.Client? client}) : client = client ?? http.Client();

  ///handle GET request using http package
  ///required (urls, queryParams, headers)
  ///return type: dynamic
  ///
  @override
  Future<dynamic> get(String url,
      {Map<String, dynamic>? queryParams,
      Map<String, String>? headers,
      context}) async {
    final uri = Uri.parse(url).replace(queryParameters: queryParams);
    final response = await client.get(uri, headers: headers);
    return _handleResponse(response);
  }

  ///handle POST request using http package
  ///required (urls, queryParams, headers, body)
  ///return type: dynamic
  ///
  @override
  Future<dynamic> post(String url,
      {dynamic body, Map<String, String>? headers, context}) async {
    final response = await client.post(Uri.parse(url),
        headers: headers, body: jsonEncode(body));
    return _handleResponse(response);
  }

  ///handle PUT request using http package
  ///required (urls, headers, body)
  ///return type: dynamic
  ///
  @override
  Future<dynamic> put(String url,
      {dynamic body, Map<String, String>? headers, context}) async {
    final response = await client.put(Uri.parse(url),
        headers: headers, body: jsonEncode(body));
    return _handleResponse(response);
  }

  @override
  Future<dynamic> delete(String url,
      {Map<String, String>? headers, context}) async {
    final response = await client.delete(Uri.parse(url), headers: headers);
    return _handleResponse(response);
  }

  dynamic _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    } else {
      throw Exception('HTTP Error: ${response.statusCode}');
    }
  }
}
