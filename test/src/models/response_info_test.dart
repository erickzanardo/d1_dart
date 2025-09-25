// Ignore for test
// ignore_for_file: prefer_const_constructors

import 'package:d1_dart/d1_dart.dart';
import 'package:test/test.dart';

void main() {
  group('D1ResponseInfo', () {
    test('can be instantiated', () {
      final info = D1ResponseInfo(
        code: 404,
        message: 'Not Found',
      );
      expect(info, isA<D1ResponseInfo>());
      expect(info.code, 404);
      expect(info.message, 'Not Found');
    });

    test('deserializes from JSON', () {
      final json = {'code': 500, 'message': 'Internal Server Error'};
      final info = D1ResponseInfo.fromJson(json);
      expect(info.code, 500);
      expect(info.message, 'Internal Server Error');
    });
  });
}
