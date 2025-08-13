import 'package:flutter/material.dart';
import 'package:todo_list/l10n/app_localizations.dart';
import 'package:todo_list/l10n/app_localizations_en.dart';

extension L10nX on BuildContext {
  AppLocalizations get l10n {
    final localizations = AppLocalizations.of(this);
    return localizations ?? AppLocalizationsEn();
  }
}