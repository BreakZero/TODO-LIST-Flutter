import 'package:flutter/material.dart';
import 'package:todo_list/database/database_manager.dart';
import 'package:todo_list/database/tables.dart';
import 'package:todo_list/feature/home/home.dart';
import 'package:todo_list/feature/sign_in/sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseManager.get().init();
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return _MainState();
  }
}

class _MainState extends State<MainApp> {

  UserEntity? user;
  @override
  void initState() {
    super.initState();
    DatabaseManager.get().userDao.currentUser().then((value) => {
      print(value.toString()),
      setState(() {
        user = value;
      })
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget homeWidget;
    if (user != null) {
      homeWidget = HomeScreen();
    } else {
      homeWidget = SignInScreen();
    }
    return MaterialApp(
      title: 'Namer App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
      ),
      home: homeWidget
    );
  }
}

@immutable
class TaskEntryScreen extends StatelessWidget {
  final UserEntity user;
  TaskEntryScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(user.fullName),);
  }
}
