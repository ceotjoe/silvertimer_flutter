// Copyright (C) 2026 Jörg Holzapfel
// SPDX-License-Identifier: GPL-3.0-or-later

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

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

      final dir = Directory(outDir);
      await dir.create(recursive: true);

      // The integration_test package has changed the screenshots payload
      // format across versions — handle all known variants:
      //
      //  v1  Map<String, dynamic>  { name → base64String }
      //  v2  List<dynamic>         [ {screenshotName, bytes: base64String} ]
      //  v3  List<dynamic>         [ {screenshotName, bytes: List<int>}    ]
      final raw = data['screenshots'];
      if (raw == null) return;

      Uint8List decodeBytes(dynamic value) {
        if (value is String) return base64.decode(value);
        if (value is List) return Uint8List.fromList(value.cast<int>());
        throw StateError('Unexpected bytes type: ${value.runtimeType}');
      }

      if (raw is Map<String, dynamic>) {
        for (final entry in raw.entries) {
          final file = File('${dir.path}/${entry.key}.png');
          await file.writeAsBytes(decodeBytes(entry.value));
          stdout.writeln('Saved screenshot → ${file.path}');
        }
      } else if (raw is List<dynamic>) {
        for (final item in raw) {
          final screenshot = item as Map<String, dynamic>;
          final name = screenshot['screenshotName'] as String;
          final file = File('${dir.path}/$name.png');
          await file.writeAsBytes(decodeBytes(screenshot['bytes']));
          stdout.writeln('Saved screenshot → ${file.path}');
        }
      }
    },
  );
}
