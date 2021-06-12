import 'package:flutter/material.dart';
import 'package:easy_go/widgets/home/homeTitle.dart';
import 'package:easy_go/widgets/home/homeImage.dart';
import 'package:easy_go/widgets/home/homeSearch.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        // child: SingleChildScrollView(
        // child: Container(
        //   height: MediaQuery.of(context).size.height,
        //   width: MediaQuery.of(context).size.width,
        //   color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.topLeft,
                child: HomeTitle(),
              ),
            ),
            Expanded(
              flex: 4,
              child: HomeImage(),
            ),
            Expanded(
              flex: 3,
              child: HomeSearch(),
            ),
          ],
        ),
      ),
      // ),
    );
  }
}
