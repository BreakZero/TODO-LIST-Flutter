import 'package:flutter/material.dart';

class LocaleNotifier extends ChangeNotifier {
  Locale? _locale; 
  Locale? get locale => _locale;
  void setLocale(Locale? loc) { _locale = loc; notifyListeners(); }
}
