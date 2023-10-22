import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_list/database/database_manager.dart';
import 'package:todo_list/database/tables.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var content = FutureBuilder<UserEntity?>(
      future: DatabaseManager.get().userDao.currentUser(),
      builder:  (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError || snapshot.data == null) {
             return Center(
              child: Text("Error..."),
             );
          } else {
            final user = snapshot.data as UserEntity;
            return Padding(
              padding: const EdgeInsets.only(bottom: 32, left: 16, right: 16),
              child: Column(
                children: [
                  Expanded(child: SvgPicture.asset("assets/settings_info.svg")),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Full Name"), Text(user.fullName)],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Email"), Text(user.email)],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Password"), Text("******")],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: null,
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(48)),
                    child: Text("LOG OUT"),
                  )
                ],
              ),
            );
          }
        } else {
          return CircularProgressIndicator();
        }
      },
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "TO DO LIST",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
        ),
      ),
      body: content
    );
  }
}
