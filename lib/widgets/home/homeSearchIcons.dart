
import 'package:flutter/material.dart';


Widget accountIcon() {
  return IconButton(
    iconSize: 30,
    onPressed: () {
      print('icon pressed');

    },
    icon: Icon(
      Icons.person,
    ),
    color: Colors.white,
  );
}

Widget bubbleIcon() {
  return IconButton(
    iconSize: 30,
    onPressed: () {
      print('icon pressed');
    },
    icon: Icon(
      Icons.bubble_chart,
    ),
    color: Colors.white,
  );
}

Widget addIcon() {
  return IconButton(
    iconSize: 30,
    onPressed: () {
      print('icon pressed');
    },
    icon: Icon(
      Icons.add,
    ),
    color: Colors.white,
  );
}

Widget saveIcon() {
  return IconButton(
    iconSize: 30,
    onPressed: () {
      print('icon pressed');
    },
    icon: Icon(
      Icons.turned_in,
    ),
    color: Colors.white,
  );
}
