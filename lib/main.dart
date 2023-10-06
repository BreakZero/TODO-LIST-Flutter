import 'package:english_words/english_words.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/sign_in/sign_in.dart';

void main() {
  runApp(const MainApp());
}

class MainState extends ChangeNotifier {
  var current = WordPair.random();

  void next() {
    current = WordPair.random();
    notifyListeners();
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Namer App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
      ),
      home: SignInScreen()
    );
  }
}

class EntryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MainState>();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("A random idea.."),
          Text(appState.current.asLowerCase),
          ElevatedButton(
              onPressed: () {
                appState.next();
              },
              child: Text("Next"))
        ],
      ),
    );
  }
}
