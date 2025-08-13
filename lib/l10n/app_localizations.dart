import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('zh')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Todo List'**
  String get appTitle;

  /// Greet a user by name
  ///
  /// In en, this message translates to:
  /// **'Hello {name}'**
  String greeting(String name);

  /// No description provided for @tasksCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No tasks} =1{1 task} other{{count} tasks}}'**
  String tasksCount(num count);

  /// No description provided for @dueDate.
  ///
  /// In en, this message translates to:
  /// **'Due on {date}'**
  String dueDate(Object date);

  /// No description provided for @label_full_name.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get label_full_name;

  /// No description provided for @label_email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get label_email;

  /// No description provided for @text_log_out.
  ///
  /// In en, this message translates to:
  /// **'LOG OUT'**
  String get text_log_out;

  /// No description provided for @text_sign_in.
  ///
  /// In en, this message translates to:
  /// **'SIGN IN'**
  String get text_sign_in;

  /// No description provided for @text_sign_up.
  ///
  /// In en, this message translates to:
  /// **'SIGN UP'**
  String get text_sign_up;

  /// No description provided for @hint_email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get hint_email;

  /// No description provided for @hint_password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get hint_password;

  /// No description provided for @hint_confirm_password.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get hint_confirm_password;

  /// No description provided for @tips_have_an_account.
  ///
  /// In en, this message translates to:
  /// **'Have an account?'**
  String get tips_have_an_account;

  /// No description provided for @add_task_title.
  ///
  /// In en, this message translates to:
  /// **'Add Task'**
  String get add_task_title;

  /// No description provided for @hint_task_title.
  ///
  /// In en, this message translates to:
  /// **'Enter title'**
  String get hint_task_title;

  /// No description provided for @hint_task_description.
  ///
  /// In en, this message translates to:
  /// **'Enter description'**
  String get hint_task_description;

  /// No description provided for @hint_task_deadline.
  ///
  /// In en, this message translates to:
  /// **'Choose deadline date'**
  String get hint_task_deadline;

  /// No description provided for @button_add_task.
  ///
  /// In en, this message translates to:
  /// **'Add TODO'**
  String get button_add_task;

  /// No description provided for @text_task_detail.
  ///
  /// In en, this message translates to:
  /// **'Task Detail'**
  String get text_task_detail;

  /// No description provided for @placeholder_empty_text.
  ///
  /// In en, this message translates to:
  /// **'Empty...'**
  String get placeholder_empty_text;

  /// No description provided for @placeholder_error_text.
  ///
  /// In en, this message translates to:
  /// **'Error...'**
  String get placeholder_error_text;

  /// Tips enter field can not be null
  ///
  /// In en, this message translates to:
  /// **'{field} can not be null'**
  String error_massage_not_be_null(String field);

  /// No description provided for @error_password_not_match.
  ///
  /// In en, this message translates to:
  /// **'password not match'**
  String get error_password_not_match;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'zh': return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
