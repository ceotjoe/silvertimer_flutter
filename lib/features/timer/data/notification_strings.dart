// Copyright (C) 2026 Jörg Holzapfel
// SPDX-License-Identifier: GPL-3.0-or-later

/// Resolved, locale-specific strings for OS notifications.
///
/// Created at the point where [BuildContext] is available (TimerScreen),
/// then stored by [TimerController] for the lifetime of the session.
/// This avoids the need for a [BuildContext] deep inside [NotificationService].
class NotificationStrings {
  const NotificationStrings({
    required this.completeTitle,
    required this.completeBody,
    required this.cleanTitle,
    required this.cleanBodyForAlarm,
    required this.channelDescription,
  });

  final String completeTitle;
  final String completeBody;
  final String cleanTitle;

  /// Returns the OS notification body for a given 1-based alarm number.
  final String Function(int alarmNumber) cleanBodyForAlarm;

  /// Android notification channel description (only used on first install;
  /// the OS caches the channel and ignores subsequent changes).
  final String channelDescription;
}
