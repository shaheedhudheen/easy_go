import 'package:easy_go/screens/authenticate/sign_in.dart';
import 'package:easy_go/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountPage extends StatelessWidget {
  Widget divider1() {
    return SizedBox(height: 10);
  }

  Widget divider2() {
    return SizedBox(height: 20);
  }

  @override
  Widget build(BuildContext context) {
    final AuthService auth = AuthService();
    return Scaffold(
      backgroundColor: Color.fromRGBO(47, 46, 65, 1),
      body: SafeArea(
        child: Column(
          children: [
            divider2(),
            divider2(),
            // Padding(
            //   padding: EdgeInsets.only(left: 20),
            //   child:
            Align(
              alignment: Alignment.center,
              child: Text(
                'Account',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Bold',
                ),
              ),
              // ),
            ),
            divider1(),
            // Padding(
            //   padding: EdgeInsets.only(left: 20),
            //   child:
            Align(
              alignment: Alignment.center,
              child: Text(
                'User details',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Bold',
                ),
              ),
              // ,)
            ),
            divider1(),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Image(
                  height: 200,
                  fit: BoxFit.contain,
                  image: AssetImage('assets/images/account.png'),
                ),
              ),
            ),
            divider2(),
            divider1(),
            // Align(
            //   alignment: Alignment.center,
            //   child: Text(
            //     'We are working on it',
            //     style: TextStyle(
            //       color: Colors.grey,
            //       fontSize: 15,
            //       fontWeight: FontWeight.w700,
            //       fontFamily: 'semi bold',
            //     ),
            //   ),
            // ),
            divider2(),
            FlatButton(
              onPressed: () async {
                await auth.signOut();
                Navigator.of(context).maybePop();
              },
              textColor: Colors.red,
              child: const Text(
                'Sign Out',
                style: TextStyle(
                  fontFamily: 'Bold',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
