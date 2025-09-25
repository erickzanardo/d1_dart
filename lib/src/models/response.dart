import 'package:d1_dart/d1_dart.dart';

/// {@template response}
/// Response from D1 API
/// {@endtemplate}
class D1Response {
  /// {@macro response}
  const D1Response({
    required this.errors,
    required this.messages,
    required this.result,
    required this.success,
  });

  /// Creates a [D1Response] from JSON data.
  factory D1Response.fromJson(Map<String, dynamic> json) {
    return D1Response(
      errors: (json['errors'] as List<dynamic>)
          .map((e) => D1ResponseInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      messages: (json['messages'] as List<dynamic>)
          .map((e) => D1ResponseInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      result: (json['result'] as List<dynamic>)
          .map(
            (e) => D1QueryResult.fromJson(e as Map<String, dynamic>),
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
  final List<D1QueryResult> result;

  /// Whether the request was successful
  final bool success;
}
