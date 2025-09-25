/// {@template d1_query_result}
/// Result from a D1 query
/// {@endtemplate}
class D1QueryResult {
  /// {@macro d1_query_result}
  D1QueryResult({
    required this.success,
    required this.results,
  });

  /// Creates a [D1QueryResult] from JSON data.
  factory D1QueryResult.fromJson(Map<String, dynamic> json) {
    return D1QueryResult(
      success: json['success'] as bool,
      results: json['results'] as List<dynamic>,
    );
  }

  /// Whether the query was successful.
  final bool success;

  /// The results of the query.
  final List<dynamic> results;
}
