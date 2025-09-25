import 'package:d1_dart/d1_dart.dart';

Future<void> main(List<String> args) async {
  final accountId = args[0];
  final cloudflareApiKey = args[1];
  final databaseName = args[2];
  final sql = args[3];

  final d1 = D1Client(
    accountId: accountId,
    cloudflareApiKey: cloudflareApiKey,
    databaseName: databaseName,
  );

  final response = await d1.raw(sql);

  if (response.success) {
    print('Query executed successfully.');
    for (final result in response.result) {
      print('Columns: ${result.columns}');
      for (final row in result.rows) {
        print('Row: $row');
      }
    }
  } else {
    print('Query failed with errors:');
    for (final error in response.errors) {
      print('Error ${error.code}: ${error.message}');
    }
  }
}
