#!/usr/bin/env bash
# =============================================================================
# take_screenshots.sh — Generate App Store and Play Store screenshots locally.
#
# Usage:
#   bash scripts/take_screenshots.sh [ios|android|both]
#
# Defaults to "both" when no argument is given.
#
# Output:
#   fastlane/screenshots/en-US/<device>/  — English screenshots
#   fastlane/screenshots/de-DE/<device>/  — German screenshots
#
#   iOS screenshots are framed (device shell + marketing caption).
#   Android screenshots are raw (Play Store does not require framing).
# =============================================================================

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PLATFORM="${1:-both}"
EMULATOR="$HOME/Library/Android/sdk/emulator/emulator"
AVD="Pixel_10_Pro"

cd "$ROOT"

run_ios() {
  echo ""
  echo "━━━  iOS screenshots  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  bundle exec fastlane ios screenshots
}

run_android() {
  echo ""
  echo "━━━  Android screenshots  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

  # Boot the emulator if it is not already running.
  if ! adb devices | grep -q "emulator"; then
    echo "Starting emulator ($AVD)…"
    "$EMULATOR" -avd "$AVD" -no-audio -no-window &
    EMULATOR_PID=$!
    # Wait until the device is fully booted.
    adb wait-for-device shell \
      'while [[ -z $(getprop sys.boot_completed) ]]; do sleep 1; done'
    echo "Emulator ready."
    STOP_EMULATOR=true
  else
    echo "Emulator already running — reusing."
    STOP_EMULATOR=false
  fi

  bundle exec fastlane android screenshots

  if [[ "${STOP_EMULATOR:-false}" == "true" ]]; then
    echo "Shutting down emulator…"
    adb emu kill || true
    wait "$EMULATOR_PID" 2>/dev/null || true
  fi
}

case "$PLATFORM" in
  ios)     run_ios ;;
  android) run_android ;;
  both)    run_ios; run_android ;;
  *)
    echo "Usage: $0 [ios|android|both]" >&2
    exit 1
    ;;
esac

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Screenshots saved to:"
find "$ROOT/fastlane/screenshots" -name "*.png" -o -name "*.jpg" 2>/dev/null \
  | sed "s|$ROOT/||" | sort
