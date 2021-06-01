import 'package:flutter/material.dart';
import 'package:easy_go/widgets/menu/gridMenuButton.dart';

class GridMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(30),
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      crossAxisCount: 2,
      children: <Widget>[
        GridMenuButton(
          buttonName: 'Hotels',
          imageName: 'hotels.png',
        ),
        GridMenuButton(
          buttonName: 'Places',
          imageName: 'places.png',
        ),
        GridMenuButton(
          buttonName: 'Gas',
          imageName: 'gas.png',
        ),
        GridMenuButton(
          buttonName: 'ATM',
          imageName: 'atm.png',
        ),
        GridMenuButton(
          buttonName: 'Hospitals',
          imageName: 'hospital.png',
        ),
      ],
    );
  }
}
