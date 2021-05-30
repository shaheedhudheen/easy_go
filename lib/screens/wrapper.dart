import 'package:easy_go/screens/authenticate/authenticate.dart';
import 'package:easy_go/screens/authenticate/sign_in.dart';
import 'package:easy_go/screens/home/home.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return either home or authenticate
    return Authenticate();
  }
}
