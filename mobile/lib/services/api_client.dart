import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/utils/api_constants.dart';

class ApiException implements Exception {
  final int statusCode;
  final String message;

  const ApiException(this.statusCode, this.message);

  @override
  String toString() => 'ApiException($statusCode): $message';
}

class ApiClient {
  final http.Client _http;

  ApiClient({http.Client? client}) : _http = client ?? http.Client();

  Future<Map<String, String>> _headers() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) throw const ApiException(401, 'Not authenticated');
    final token = await user.getIdToken();
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  Uri _uri(String path) => Uri.parse('${ApiConstants.baseUrl}$path');

  Future<dynamic> get(String path) async {
    final response = await _http.get(_uri(path), headers: await _headers());
    return _handleResponse(response);
  }

  Future<dynamic> post(String path, {Object? body}) async {
    final response = await _http.post(
      _uri(path),
      headers: await _headers(),
      body: body != null ? jsonEncode(body) : null,
    );
    return _handleResponse(response);
  }

  Future<dynamic> put(String path, {Object? body}) async {
    final response = await _http.put(
      _uri(path),
      headers: await _headers(),
      body: body != null ? jsonEncode(body) : null,
    );
    return _handleResponse(response);
  }

  Future<dynamic> delete(String path) async {
    final response = await _http.delete(_uri(path), headers: await _headers());
    return _handleResponse(response);
  }

  dynamic _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      if (response.body.isEmpty) return null;
      return jsonDecode(response.body);
    }

    if (response.statusCode == 401) {
      FirebaseAuth.instance.signOut();
    }

    String message;
    try {
      final body = jsonDecode(response.body) as Map<String, dynamic>;
      message = (body['message'] ?? body['error'] ?? response.reasonPhrase ?? 'Unknown error') as String;
    } catch (_) {
      message = response.reasonPhrase ?? 'Unknown error';
    }

    throw ApiException(response.statusCode, message);
  }
}