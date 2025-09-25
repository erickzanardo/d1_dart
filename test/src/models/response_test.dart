// Not needed for test files
// ignore_for_file: prefer_const_constructors

import 'package:d1_dart/d1_dart.dart';
import 'package:test/test.dart';

void main() {
  group('D1Response', () {
    test('can be instantiated', () {
      final response = D1Response(
        success: true,
        result: [],
        errors: [],
        messages: [],
      );
      expect(response, isA<D1Response>());
      expect(response.success, true);
      expect(response.messages, <D1ResponseInfo>[]);
      expect(response.errors, <D1ResponseInfo>[]);
    });

    test('deserializes from JSON', () {
      final json = {
        'success': true,
        'errors': [
          {'code': 404, 'message': 'Not Found'},
        ],
        'messages': [
          {'code': 200, 'message': 'OK'},
        ],
        'result': [
          {
            'success': true,
            'results': [1, 2, 3],
          },
        ],
      };
      final response = D1Response.fromJson(json);
      expect(response.success, true);
      expect(response.errors.length, 1);
      expect(response.errors.first.code, 404);
      expect(response.errors.first.message, 'Not Found');
      expect(response.messages.length, 1);
      expect(response.messages.first.code, 200);
      expect(response.messages.first.message, 'OK');
      expect(response.result.length, 1);
      expect(response.result.first.success, true);
      expect(response.result.first.results, [1, 2, 3]);
    });
  });
}
