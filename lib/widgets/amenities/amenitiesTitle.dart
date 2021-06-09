import 'package:flutter/material.dart';

class AmenitiesTitle extends StatelessWidget {
  final String titleName;

  AmenitiesTitle({
    this.titleName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.5 * MediaQuery.of(context).size.width,
      height: 0.1 * MediaQuery.of(context).size.height,
      color: Color.fromRGBO(47, 46, 65, 1),
      //padding: EdgeInsets.only(left: 10, top: 10),
      child: Center(
        child: Text(
          titleName,
          style: TextStyle(
            color: Color.fromRGBO(108, 99, 255, 1.0),
            fontSize: 40,
            fontWeight: FontWeight.w700,
            fontFamily: 'Bold',
          ),
        ),
      ),
    );
  }
}
