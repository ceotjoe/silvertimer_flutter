import 'package:flutter/widgets.dart';
import 'package:silvertimer_flutter/l10n/generated/app_localizations.dart';

extension L10nExtension on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
