import 'package:easy_go/screens/authenticate/accountPage.dart';
import 'package:easy_go/screens/construction.dart';
import 'package:easy_go/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:easy_go/services/auth.dart';
import 'package:get/get.dart';

Widget accountIcon() {
  final AuthService auth = AuthService();
  return IconButton(
    iconSize: 30,
    onPressed: () {
      // Get.to(Account());
    },
    // onPressed: () async {
    //   await auth.signOut();
    // },
    icon: Icon(
      Icons.person,
    ),
    color: Colors.white,
  );
}

Widget homeIcon() {
  return IconButton(
    iconSize: 30,
    onPressed: () {
      print('icon pressed');
    },
    icon: Icon(
      Icons.home_rounded,
    ),
    color: Colors.white,
  );
}

Widget searchIcon() {
  return IconButton(
    iconSize: 30,
    onPressed: () {
      print('icon pressed');
      Get.to(Construction());
    },
    icon: Icon(Icons.search),
    color: Colors.white,
  );
}
