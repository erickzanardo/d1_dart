import 'dart:convert';
import 'package:d1_dart/d1_dart.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockHttpClient extends Mock {
  Future<http.Response> call(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
  });
}

void main() {
  group('D1Client', () {
    late MockHttpClient mockHttpPost;
    late D1Client client;

    setUpAll(() {
      registerFallbackValue(Uri());
    });

    setUp(() {
      mockHttpPost = MockHttpClient();
      client = D1Client(
        cloudflareApiKey: 'key',
        accountId: 'account',
        databaseName: 'db',
        httpPost: mockHttpPost.call,
      );
    });

    test('query returns parsed D1Response', () async {
      final mockJson = {
        'success': true,
        'errors': [
          {'code': 404, 'message': 'Not Found'},
        ],
        'messages': [
          {'code': 200, 'message': 'OK'},
        ],
        'result': [
          {'success': true, 'results': [1, 2, 3]},
        ],
      };
      final mockResponse = http.Response(jsonEncode(mockJson), 200);
      when(() => mockHttpPost(
        any(),
        headers: any(named: 'headers'),
        body: any(named: 'body'),
      )).thenAnswer((_) async => mockResponse);

      final response = await client.query('SELECT * FROM table');
      expect(response.success, true);
      expect(response.errors.first.code, 404);
      expect(response.messages.first.code, 200);
      expect(response.result.first.results, [1, 2, 3]);
    });

    test('query throws on non-200 response', () async {
      final mockResponse = http.Response('error', 500);
      when(() => mockHttpPost(
        any(),
        headers: any(named: 'headers'),
        body: any(named: 'body'),
      )).thenAnswer((_) async => mockResponse);

      expect(
        () => client.query('SELECT * FROM table'),
        throwsA(isA<Exception>()),
      );
    });
  });
}
