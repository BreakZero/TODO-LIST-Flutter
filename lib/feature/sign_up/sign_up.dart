import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_list/common/extension.dart';
import 'package:todo_list/database/database_manager.dart';
import 'package:todo_list/database/tables.dart';

import '../home/home.dart';

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
                  hintText: context.l10n.hint_email,
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(8)),
            ),
            SizedBox(
              height: 12,
            ),
            TextField(
              controller: fullnameController,
              decoration: InputDecoration(
                  hintText: context.l10n.label_full_name,
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(8)),
            ),
            SizedBox(
              height: 12,
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                  hintText: context.l10n.hint_password,
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(8)),
            ),
            SizedBox(
              height: 12,
            ),
            TextField(
              controller: confirmPassController,
              decoration: InputDecoration(
                  hintText: context.l10n.hint_confirm_password,
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(8)),
            ),
            SizedBox(
              height: 12,
            ),
            FilledButton(
              onPressed: () {
                var errorMsg = formValidator();
                if (errorMsg == null) {
                  var user = UserEntity(
                      uid: 0,
                      fullName: fullnameController.text,
                      email: emailController.text,
                      createAt: DateTime.now().microsecondsSinceEpoch);
                  insert(user);
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeScreen()),
                      (route) => false);
                } else {
                  final snackBar = SnackBar(content: Text(errorMsg));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              style: FilledButton.styleFrom(minimumSize: Size.fromHeight(48)),
              child: Text(context.l10n.text_sign_up),
            ),
            SizedBox(
              height: 12,
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: context.l10n.tips_have_an_account,
                  style: TextStyle(color: Colors.black)),
              TextSpan(
                  text: context.l10n.text_sign_in,
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
    DatabaseManager.get()
        .userDao
        .insertUser(user)
        .onError((error, stackTrace) => print(error.toString()));
  }

  String? formValidator() {
    String? errorMsg;
    if (emailController.text.isEmpty) {
      errorMsg = context.l10n.error_massage_not_be_null(context.l10n.label_email);
    } else if (fullnameController.text.isEmpty) {
      errorMsg = context.l10n.error_massage_not_be_null(context.l10n.label_full_name);
    } else if (passwordController.text.isEmpty) {
      errorMsg = context.l10n.error_massage_not_be_null(context.l10n.hint_password);
    } else if (passwordController.text != confirmPassController.text) {
      errorMsg = context.l10n.error_password_not_match;
    }
    return errorMsg;
  }
}
