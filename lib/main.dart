import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/app/locale_notifier.dart';
import 'package:todo_list/database/database_manager.dart';
import 'package:todo_list/database/tables.dart';
import 'package:todo_list/feature/home/home.dart';
import 'package:todo_list/feature/sign_in/sign_in.dart';
import 'package:todo_list/l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseManager.get().init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LocaleNotifier(),
      child: Consumer<LocaleNotifier>(
        builder: (context, localeNotifier, _) {
          return FutureBuilder<UserEntity?>(
            future: DatabaseManager.get().userDao.currentUser(),
            builder: (context, snapshot) {
              Widget homeWidget;
              if (snapshot.connectionState == ConnectionState.waiting) {
                homeWidget = const Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                );
              } else if (snapshot.hasData && snapshot.data != null) {
                homeWidget = HomeScreen();
              } else {
                homeWidget = SignInScreen();
              }
              return MaterialApp(
                title: 'TODO List',
                debugShowCheckedModeBanner: false,
                locale: localeNotifier.locale,
                supportedLocales: const [Locale('en'), Locale('zh')],
                localizationsDelegates: const [
                  AppLocalizations.delegate, 
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                theme: ThemeData(
                  useMaterial3: true,
                  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
                ),
                home: homeWidget,
              );
            },
          );
        },
      ),
    );
  }
}

@immutable
class TaskEntryScreen extends StatelessWidget {
  final UserEntity user;
  TaskEntryScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return HomeScreen();
  }
}
