import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.8 * MediaQuery.of(context).size.width,
      height: 0.1 * MediaQuery.of(context).size.height,
      color: Colors.white,
      //padding: EdgeInsets.only(left: 10, top: 10),
      child: Center(
        child: Text(
          'EasyGO',
          style: TextStyle(
            color: Color.fromRGBO(108, 99, 255, 1.0),
            fontSize: 45,
            fontWeight: FontWeight.w900,
            fontFamily: 'Bold',
          ),
        ),
      ),
    );
  }
}
