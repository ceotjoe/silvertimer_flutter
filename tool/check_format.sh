#!/usr/bin/env bash
# Fails if any hand-written Dart file is not formatted. Generated files are
# skipped: they are verified by tool/check_generated.sh instead.
set -euo pipefail
cd "$(dirname "$0")/.."

git ls-files '*.dart' \
  | grep -Ev '\.(g|freezed)\.dart$|^lib/l10n/generated/' \
  | xargs dart format --output=none --set-exit-if-changed
