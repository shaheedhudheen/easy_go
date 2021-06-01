import 'package:flutter/material.dart';

Widget homeSearchText({
  String displayText,
}) {
  return SizedBox(
    child: Text(
      displayText,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w700,
        fontFamily: 'Bold',
      ),
    ),
  );
}
