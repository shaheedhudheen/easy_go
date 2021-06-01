
import 'package:easy_go/services/auth.dart';
import 'package:flutter/material.dart';

class HomeTitle extends StatelessWidget {
  final AuthService auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Row(

      children: [
        Container(
          width: 0.5*MediaQuery.of(context).size.width,
          height: 0.1 * MediaQuery.of(context).size.height,
          color: Colors.white,
          padding: EdgeInsets.only(left: 10, top: 10),
          child: Text(
            'EasyGO',
            style: TextStyle(
              color: Color.fromRGBO(47, 46, 65, 1),
              fontSize: 35,
              fontWeight: FontWeight.w700,
              fontFamily: 'Bold',
            ),
          ),
        ),
    TextButton(
    onPressed: () async {
    await auth.signOut();
    },
    child: Text('LogOut'),
    ),
      ],
    );

  }
}
