import 'package:flutter/material.dart';
import 'package:internationalization_response/app/l10n/gen/app_localizations.dart';

extension AppLocalizationContext on BuildContext {
  AppLocalizations get intl => AppLocalizations.of(this);
}
