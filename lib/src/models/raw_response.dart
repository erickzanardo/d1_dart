import 'package:d1_dart/d1_dart.dart';

/// {@template raw_response}
/// Response from D1 API
/// {@endtemplate}
class D1RawResponse {
  /// {@macro raw_response}
  const D1RawResponse({
    required this.errors,
    required this.messages,
    required this.result,
    required this.success,
  });

  /// Creates a [D1RawResponse] from JSON data.
  factory D1RawResponse.fromJson(Map<String, dynamic> json) {
    return D1RawResponse(
      errors: (json['errors'] as List<dynamic>)
          .map((e) => D1ResponseInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      messages: (json['messages'] as List<dynamic>)
          .map((e) => D1ResponseInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      result: (json['result'] as List<dynamic>)
          .map(
            (e) => D1RawQueryResult.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      success: json['success'] as bool,
    );
  }

  /// Errors
  final List<D1ResponseInfo> errors;

  /// Messages
  final List<D1ResponseInfo> messages;

  /// All the results from the query
  final List<D1RawQueryResult> result;

  /// Whether the request was successful
  final bool success;
}
