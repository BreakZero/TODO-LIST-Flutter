import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/app/locale_notifier.dart';

class LanguageSwitchScreen extends StatelessWidget {
  const LanguageSwitchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localeNotifier = Provider.of<LocaleNotifier>(context);
    final currentLocale = localeNotifier.locale?.languageCode ?? 'en';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Language'),
      ),
      body: ListView(
        children: [
          RadioListTile<String>(
            title: const Text('English'),
            value: 'en',
            groupValue: currentLocale,
            onChanged: (value) {
              localeNotifier.setLocale(const Locale('en'));
            },
          ),
          RadioListTile<String>(
            title: const Text('简体中文'),
            value: 'zh',
            groupValue: currentLocale,
            onChanged: (value) {
              localeNotifier.setLocale(const Locale('zh'));
            },
          ),
        ],
      ),
    );
  }
}