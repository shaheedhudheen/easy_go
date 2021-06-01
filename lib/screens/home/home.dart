import 'package:easy_go/services/auth.dart';
import 'package:flutter/material.dart';


class Home extends StatelessWidget {

final AuthService auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('EasyGo'),
        backgroundColor: Colors.lightBlueAccent,
        elevation: 0.0,
        actions: <Widget>[
          TextButton.icon(
            icon: Icon(Icons.person),
            label: Text('LogOut'),
            onPressed: () async {
              await auth.signOut();
            },
          ),
        ],
      ),
    );
  }
}