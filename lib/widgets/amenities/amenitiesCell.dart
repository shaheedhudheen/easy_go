import 'package:flutter/material.dart';

class AmenitiesCell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.grey[300],
        border: Border.all(
          color: Colors.grey,
        ),
      ),
    );
  }
}
