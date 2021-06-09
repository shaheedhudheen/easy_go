import 'package:flutter/material.dart';

class HomeImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 30),
      height: 0.4 * MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Image.asset(
        'assets/images/homeimage.jpg',
        alignment: Alignment.center,
        fit: BoxFit.contain,
      ),
    );
  }
}
