/// {@template response_info}
/// Response info from D1 API
///
/// See more at: https://developers.cloudflare.com/api/resources/$shared/models/error_data/#(schema)
///
/// {@endtemplate}
class D1ResponseInfo {
  /// {@macro response_info}
  const D1ResponseInfo({
    required this.code,
    required this.message,
  });

  /// Creates a [D1ResponseInfo] from JSON data.
  factory D1ResponseInfo.fromJson(Map<String, dynamic> json) {
    return D1ResponseInfo(
      code: json['code'] as int,
      message: json['message'] as String,
    );
  }

  /// The info code.
  final int code;
  /// The info message.
  final String message;
}
