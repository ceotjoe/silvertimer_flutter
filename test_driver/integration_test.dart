import 'dart:convert';
import 'dart:io';

import 'package:integration_test/integration_test_driver_extended.dart';

/// Host-side driver for screenshot tests.
///
/// Run via:
///   flutter drive \
///     --driver=test_driver/integration_test.dart \
///     --target=integration_test/screenshot_test.dart \
///     -d <SIMULATOR_ID>
///
/// Screenshots are written to the directory specified by the
/// SCREENSHOT_OUT_DIR environment variable (defaults to
/// fastlane/screenshots/en-US/screenshots).
Future<void> main() async {
  final outDir = Platform.environment['SCREENSHOT_OUT_DIR'] ??
      'fastlane/screenshots/en-US/screenshots';

  await integrationDriver(
    responseDataCallback: (data) async {
      if (data == null) return;
      final screenshots = data['screenshots'] as Map<String, dynamic>?;
      if (screenshots == null) return;

      final dir = Directory(outDir);
      await dir.create(recursive: true);

      for (final entry in screenshots.entries) {
        final bytes = base64.decode(entry.value as String);
        final file = File('${dir.path}/${entry.key}.png');
        await file.writeAsBytes(bytes);
        stdout.writeln('Saved screenshot → ${file.path}');
      }
    },
  );
}
