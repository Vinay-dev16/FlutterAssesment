import 'dart:convert';

import 'package:http/http.dart' as http;

import 'api_constants.dart';

class ApiClient {
  final http.Client _client;

  ApiClient({http.Client? client}) : _client = client ?? http.Client();

  Future<Map<String, dynamic>> post(
    String path, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    final uri = Uri.parse('${ApiConstants.baseUrl}$path');

    final response = await _client.post(
      uri,
      headers: {
        'Content-Type': 'application/json',
        ...?headers,
      },
      body: body != null ? jsonEncode(body) : null,
    );

    final decoded = _decodeResponse(response);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return decoded;
    } else {
      final message = decoded['error']?.toString() ??
          'Request failed (${response.statusCode})';
      throw Exception(message);
    }
  }

  Future<Map<String, dynamic>> get(
    String path, {
    Map<String, String>? headers,
    Map<String, String>? queryParameters,
  }) async {
    final uri = Uri.parse('${ApiConstants.baseUrl}$path').replace(
      queryParameters: queryParameters,
    );

    final response = await _client.get(
      uri,
      headers: {
        'Content-Type': 'application/json',
        ...?headers,
      },
    );

    final decoded = _decodeResponse(response);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return decoded;
    } else {
      final message = decoded['error']?.toString() ??
          'Request failed (${response.statusCode})';
      throw Exception(message);
    }
  }

  Map<String, dynamic> _decodeResponse(http.Response response) {
    if (response.body.isEmpty) {
      return <String, dynamic>{};
    }
    final dynamic jsonBody = jsonDecode(response.body);
    if (jsonBody is Map<String, dynamic>) {
      return jsonBody;
    }
    return <String, dynamic>{};
  }
}
