// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Todo List';

  @override
  String greeting(String name) {
    return 'Hello $name';
  }

  @override
  String tasksCount(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tasks',
      one: '1 task',
      zero: 'No tasks',
    );
    return '$_temp0';
  }

  @override
  String dueDate(Object date) {
    return 'Due on $date';
  }

  @override
  String get label_full_name => 'Full Name';

  @override
  String get label_email => 'Email';

  @override
  String get text_log_out => 'LOG OUT';

  @override
  String get text_sign_in => 'SIGN IN';

  @override
  String get text_sign_up => 'SIGN UP';

  @override
  String get hint_email => 'Email';

  @override
  String get hint_password => 'Password';

  @override
  String get hint_confirm_password => 'Confirm Password';

  @override
  String get tips_have_an_account => 'Have an account?';

  @override
  String get add_task_title => 'Add Task';

  @override
  String get hint_task_title => 'Enter title';

  @override
  String get hint_task_description => 'Enter description';

  @override
  String get hint_task_deadline => 'Choose deadline date';

  @override
  String get button_add_task => 'Add TODO';

  @override
  String get text_task_detail => 'Task Detail';

  @override
  String get placeholder_empty_text => 'Empty...';

  @override
  String get placeholder_error_text => 'Error...';

  @override
  String error_massage_not_be_null(String field) {
    return '$field can not be null';
  }

  @override
  String get error_password_not_match => 'password not match';
}
