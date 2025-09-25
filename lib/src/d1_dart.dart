import 'dart:convert';

import 'package:d1_dart/d1_dart.dart';
import 'package:http/http.dart' as http;

/// {@template d1_dart}
/// A Dart client arounds Cloudflare D1 Database Rest API
/// {@endtemplate}
class D1Client {
  /// {@macro d1_dart}
  const D1Client({
    required String cloudflareApiKey,
    required String accountId,
    required String databaseName,
    String baseUrl = 'https://api.cloudflare.com/client/',
    String apiVersion = 'v4',
    Future<http.Response> Function(
      Uri url, {
      Map<String, String>? headers,
      Object? body,
    })?
    httpPost,
  }) : _baseUrl = baseUrl,
       _apiVersion = apiVersion,
       _cloudflareApiKey = cloudflareApiKey,
       _accountId = accountId,
       _databaseName = databaseName,
       _httpPost = httpPost ?? http.post;

  final String _baseUrl;
  final String _apiVersion;
  final String _cloudflareApiKey;
  final String _accountId;
  final String _databaseName;

  final Future<http.Response> Function(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
  })
  _httpPost;

  /// Executes a SQL query against the D1 database.
  Future<D1Response> query(
    String sql, {
    List<String> params = const [],
  }) async {
    final uri = Uri.parse(
      '$_baseUrl$_apiVersion/accounts/$_accountId/d1/database/$_databaseName/query',
    );
    final headers = {
      'Authorization': 'Bearer $_cloudflareApiKey',
      'Content-Type': 'application/json',
    };
    final body = {
      'sql': sql,
      'params': params,
    };
    final response = await _httpPost(
      uri,
      headers: headers,
      body: jsonEncode(body),
    );
    if (response.statusCode != 200) {
      throw Exception(
        'Failed to query D1 database: ${response.statusCode} '
        '${response.body}',
      );
    }
    final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
    return D1Response.fromJson(jsonResponse);
  }
}
