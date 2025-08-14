import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_list/common/extension.dart';
import 'package:todo_list/database/database_manager.dart';
import 'package:todo_list/database/tables.dart';
import '../home/home.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SignUpState();
}

class _SignUpState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final fullnameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPassController = TextEditingController();

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
                  border: const OutlineInputBorder(),
                  contentPadding: const EdgeInsets.all(8),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: fullnameController,
                decoration: InputDecoration(
                  hintText: context.l10n.label_full_name,
                  border: const OutlineInputBorder(),
                  contentPadding: const EdgeInsets.all(8),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: context.l10n.hint_password,
                  border: const OutlineInputBorder(),
                  contentPadding: const EdgeInsets.all(8),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: confirmPassController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: context.l10n.hint_confirm_password,
                  border: const OutlineInputBorder(),
                  contentPadding: const EdgeInsets.all(8),
                ),
              ),
              const SizedBox(height: 12),
              FilledButton(
                onPressed: () {
                  final errorMsg = formValidator();
                  if (errorMsg == null) {
                    final user = UserEntity(
                      uid: 0,
                      fullName: fullnameController.text,
                      email: emailController.text,
                      createAt: DateTime.now().microsecondsSinceEpoch,
                    );
                    insert(user);
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                      (route) => false,
                    );
                  } else {
                    final snackBar = SnackBar(content: Text(errorMsg));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(48)),
                child: Text(context.l10n.text_sign_up),
              ),
              const SizedBox(height: 12),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: context.l10n.tips_have_an_account,
                      style: const TextStyle(color: Colors.black),
                    ),
                    TextSpan(
                      text: context.l10n.text_sign_in,
                      style: const TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pop(context);
                        },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
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
    if (emailController.text.isEmpty) {
      return context.l10n.error_massage_not_be_null(context.l10n.label_email);
    }
    if (fullnameController.text.isEmpty) {
      return context.l10n.error_massage_not_be_null(context.l10n.label_full_name);
    }
    if (passwordController.text.isEmpty) {
      return context.l10n.error_massage_not_be_null(context.l10n.hint_password);
    }
    if (passwordController.text != confirmPassController.text) {
      return context.l10n.error_password_not_match;
    }
    return null;
  }
}