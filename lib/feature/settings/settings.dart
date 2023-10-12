import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "TO DO LIST",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 32, left: 16, right: 16),
        child: Column(
          children: [
            Expanded(child: SvgPicture.asset("assets/settings_info.svg")),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Full Name"), Text("Dougie")],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Email"), Text("527916599@qq.com")],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Password"), Text("******")],
            ),
            ElevatedButton(
              onPressed: null,
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(48)),
              child: Text("LOG OUT"),
            )
          ],
        ),
      ),
    );
  }
}
