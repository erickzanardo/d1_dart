# D1 Dart

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)
[![License: MIT][license_badge]][license_link]

A Dart client around Cloudflare D1 Database Rest API

## Installation 💻

**❗ In order to start using D1 Dart you must have the [Dart SDK][dart_install_link] installed on your machine.**

Install via `dart pub add`:

```sh
dart pub add d1_dart
```

### How to use it 🚀

```dart
final d1 = D1Client(
  accountId: accountId,
  cloudflareApiKey: cloudflareApiKey,
  databaseName: databaseName,
);

final response = await d1.query(sql);

for (final result in response.result) {
  for (final row in result.results) {
    print('Row: $row');
  }
}
```

---

[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[mason_link]: https://github.com/felangel/mason
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
