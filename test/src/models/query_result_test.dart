import 'package:d1_dart/d1_dart.dart';
import 'package:test/test.dart';

void main() {
  group('D1QueryResult', () {
    test('can be instantiated', () {
      final result = D1QueryResult(
        results: [],
        success: true,
      );
      expect(result, isA<D1QueryResult>());
      // Add more expectations for default values if available
    });

    test('deserializes from JSON', () {
      final json = {
        'success': true,
        'results': [1, 2, 3],
      };
      final result = D1QueryResult.fromJson(json);
      expect(result.success, true);
      expect(result.results, [1, 2, 3]);
    });
  });
}
