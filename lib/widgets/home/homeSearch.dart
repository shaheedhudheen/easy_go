import 'package:flutter/material.dart';
import 'package:easy_go/widgets/home/homeSearchText.dart';
import 'package:easy_go/widgets/home/homeSearchBar.dart';
import 'package:easy_go/widgets/home/homeSearchIcons.dart';
import 'package:easy_go/screens/menu/menu.dart';

class HomeSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 10,
        bottom: 30,
      ),
      height: 0.5 * MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Color.fromRGBO(47, 46, 65, 1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              homeSearchText(displayText: 'From'),
              homeSearchBar(exampleText: 'Kochi'),
              homeSearchText(displayText: 'To'),
              homeSearchBar(exampleText: 'Thrissur'),
              RaisedButton(
                elevation: 10,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Menu()),
                  );
                },
                onLongPress: () {
                  print('long pressed');
                },
                child: Text(
                  'GO',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Bold',
                  ),
                ),
                color: Color.fromRGBO(108, 99, 255, 1.0),
                textColor: Colors.white,
                splashColor: Color.fromRGBO(108, 99, 260, 1.0),
                shape: StadiumBorder(),
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  accountIcon(),
                  bubbleIcon(),
                  addIcon(),
                  saveIcon(),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
