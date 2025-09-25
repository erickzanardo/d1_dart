/// {@template d1_raw_query_result}
/// Result from a D1 raw query
/// {@endtemplate}
class D1RawQueryResult {
  /// {@macro d1_query_result}
  D1RawQueryResult({
    required this.success,
    required this.columns,
    required this.rows,
  });

  /// Creates a [D1RawQueryResult] from JSON data.
  factory D1RawQueryResult.fromJson(Map<String, dynamic> json) {
    final results = json['results'] as Map<String, dynamic>;
    return D1RawQueryResult(
      success: json['success'] as bool,
      columns: (results['columns'] as List<dynamic>).cast<String>(),
      rows: results['rows'] as List<dynamic>,
    );
  }

  /// Whether the query was successful.
  final bool success;

  /// The columns
  final List<String> columns;

  /// The results of the query.
  final List<dynamic> rows;
}
