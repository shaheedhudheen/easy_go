import 'package:flutter/material.dart';
import 'package:easy_go/widgets/home/homeTitle.dart';
import 'package:easy_go/widgets/home/homeImage.dart';
import 'package:easy_go/widgets/home/homeSearch.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                HomeTitle(),
                HomeImage(),
                HomeSearch(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
