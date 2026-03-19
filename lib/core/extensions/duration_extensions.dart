// Copyright (C) 2026 Jörg Holzapfel
// SPDX-License-Identifier: GPL-3.0-or-later

extension DurationFormatting on Duration {
  /// Formats a [Duration] as HH:MM:SS (zero-padded).
  String toHhMmSs() {
    final hours = inHours;
    final minutes = inMinutes.remainder(60);
    final seconds = inSeconds.remainder(60);
    return '${_pad(hours)}:${_pad(minutes)}:${_pad(seconds)}';
  }

  /// Formats a [Duration] as a human-readable string, e.g. "1 h 23 min 45 sec".
  String toReadable() {
    final hours = inHours;
    final minutes = inMinutes.remainder(60);
    final seconds = inSeconds.remainder(60);

    if (hours > 0) {
      return '${hours}h ${_pad(minutes)}min ${_pad(seconds)}sec';
    } else if (minutes > 0) {
      return '${minutes}min ${_pad(seconds)}sec';
    } else {
      return '${seconds}sec';
    }
  }

  String _pad(int value) => value.toString().padLeft(2, '0');
}
