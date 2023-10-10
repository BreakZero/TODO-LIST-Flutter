import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_list/database/database_manager.dart';
import 'package:todo_list/database/tables.dart';
import 'package:todo_list/main.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignUpState();
  }
}

class _SignUpState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController fullnameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const String assetName = 'assets/logo.svg';
    final logoImage = SvgPicture.asset(assetName, semanticsLabel: "Logo");
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(child: Center(child: logoImage)),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                  hintText: "Email",
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(8)),
            ),
            SizedBox(
              height: 12,
            ),
            TextField(
              controller: fullnameController,
              decoration: InputDecoration(
                  hintText: "Full Name",
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(8)),
            ),
            SizedBox(
              height: 12,
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(8)),
            ),
            SizedBox(
              height: 12,
            ),
            TextField(
              controller: confirmPassController,
              decoration: InputDecoration(
                  hintText: "Confirm Password",
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(8)),
            ),
            SizedBox(
              height: 12,
            ),
            FilledButton(
              onPressed: () {
                var user = UserEntity(
                    uid: 0,
                    fullName: "Dougie",
                    email: "527916588@qq.com",
                    createAt: DateTime.now().microsecondsSinceEpoch);
                insert(user);
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TaskEntryScreen(user: user)),
                    (route) => false);
              },
              style: FilledButton.styleFrom(minimumSize: Size.fromHeight(48)),
              child: const Text('SIGN UP'),
            ),
            SizedBox(
              height: 12,
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "Have an account?",
                  style: TextStyle(color: Colors.black)),
              TextSpan(
                  text: "Sign in",
                  style: TextStyle(color: Colors.blue),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pop(context);
                    })
            ])),
            SizedBox(
              height: 16,
            )
          ],
        ),
      ),
    );
  }

  void insert(UserEntity user) {
    DatabaseManager.get().userDao
        .insertUser(user)
        .onError((error, stackTrace) => print(error.toString()));
  }
}
