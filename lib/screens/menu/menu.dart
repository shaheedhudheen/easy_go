import 'package:flutter/material.dart';
import 'package:easy_go/widgets/menu/heading.dart';
import 'package:easy_go/widgets/menu/gridmenu.dart';

class Menu extends StatelessWidget {
  final Widget divider = SizedBox(
    height: 20,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            divider,
            Expanded(
              flex: 1,
              child: Heading(),
            ),
            new Expanded(
              flex: 9,
              child: GridMenu(),
            ),
          ],
        ),
      ),
    );
  }
}
