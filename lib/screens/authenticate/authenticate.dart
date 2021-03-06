import 'package:easy_go/screens/authenticate/register.dart';
import 'package:easy_go/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';


class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;

  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {

    if(showSignIn){
      return SignIn(toggleView: toggleView);
    } else {
      return Register(toggleView: toggleView);
    }

  }
}