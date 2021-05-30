import 'package:flutter/material.dart';

class HomeTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 0.1 * MediaQuery.of(context).size.height,
      color: Colors.white,
      padding: EdgeInsets.only(left: 10, top: 10),
      child: Text(
        'EasyGO',
        style: TextStyle(
          color: Color.fromRGBO(108, 99, 255, 1.0),
          fontSize: 35,
          fontWeight: FontWeight.w700,
          fontFamily: 'montserrat bold',
        ),
      ),
    );
  }
}
