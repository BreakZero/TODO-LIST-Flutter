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

  @override
  String get text_switch_language => '切换语言';

  @override
  String get label_full_name => '全名';

  @override
  String get label_email => '邮箱';

  @override
  String get text_log_out => '退出登录';

  @override
  String get text_sign_in => '登录';

  @override
  String get text_sign_up => '注册';

  @override
  String get hint_email => '邮箱';

  @override
  String get hint_password => '密码';

  @override
  String get hint_confirm_password => '确认密码';

  @override
  String get tips_have_an_account => '已有账号？';

  @override
  String get add_task_title => '添加任务';

  @override
  String get hint_task_title => '输入标题';

  @override
  String get hint_task_description => '输入描述';

  @override
  String get hint_task_deadline => '选择截止日期';

  @override
  String get button_add_task => '创建任务';

  @override
  String get text_task_detail => '任务详情';

  @override
  String get placeholder_empty_text => '空...';

  @override
  String get placeholder_error_text => '出错...';

  @override
  String error_massage_not_be_null(String field) {
    return '$field 不能为空';
  }

  @override
  String get error_password_not_match => '两次输入的密码不一致';
}
