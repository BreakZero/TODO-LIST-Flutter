import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_list/common/extension.dart';
import 'package:todo_list/database/database_manager.dart';
import 'package:todo_list/feature/sign_up/sign_up.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SignInState();
  }
}

class _SignInState extends State<SignInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const String assetName = 'assets/logo.svg';
    final logoImage = SvgPicture.asset(assetName, semanticsLabel: "Logo");
    return Scaffold(
        body: SafeArea(
      child: Padding(
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
            const SizedBox(height: 12),
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
            FilledButton(
              onPressed: () {
                print("${emailController.text}----${passwordController.text}");
                printLocalUser();
              },
              style: FilledButton.styleFrom(minimumSize: Size.fromHeight(48)),
              child: Text(context.l10n.text_sign_in),
            ),
            SizedBox(
              height: 12,
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "Don't have an account? ",
                  style: TextStyle(color: Colors.black)),
              TextSpan(
                  text: context.l10n.text_sign_up,
                  style: TextStyle(color: Colors.blue),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()));
                    })
            ])),
            SizedBox(
              height: 16,
            )
          ],
        ),
      ),
    ));
  }

  void printLocalUser() {
    DatabaseManager.get().userDao.currentUser().then((value) => {
          if (value == null)
            {print("get null user")}
          else
            {print(value.toString())}
        });
  }
}
