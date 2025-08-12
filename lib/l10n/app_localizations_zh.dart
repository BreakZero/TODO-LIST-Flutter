// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => '任务清单';

  @override
  String greeting(String name) {
    return '你好 $name';
  }

  @override
  String tasksCount(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个任务',
      one: '1 个任务',
      zero: '没有任务',
    );
    return '$_temp0';
  }

  @override
  String dueDate(Object date) {
    return '截止日期：$date';
  }
}
