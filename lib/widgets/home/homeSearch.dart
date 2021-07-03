import 'package:easy_go/screens/authenticate/accountPage.dart';
import 'package:easy_go/screens/chatbot/chatscreen.dart';
import 'package:easy_go/screens/construction.dart';
import 'package:easy_go/screens/maps/mapScreen.dart';
import 'package:easy_go/screens/menu/menu.dart';
import 'package:flutter/material.dart';
import 'package:easy_go/widgets/home/homeSearchText.dart';
import 'package:easy_go/widgets/home/homeSearchBar.dart';
import 'package:easy_go/widgets/home/homeSearchIcons.dart';
import 'package:flutter/services.dart';

class HomeSearch extends StatelessWidget {
  Widget divider() {
    return SizedBox(
      height: 30,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 5,
        // bottom: 5,
      ),
      height: 0.48 * MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Color.fromRGBO(47, 46, 65, 1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // homeSearchText(displayText: 'From'),
          // homeSearchBar(exampleText: 'Kochi'),
          // homeSearchText(displayText: 'To'),
          // homeSearchBar(exampleText: 'Thrissur'),
          divider(),
          Text(
            'Your journey begins here...',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
              fontFamily: 'Bold',
            ),
          ),

          divider(),
          RaisedButton(
            elevation: 10,
            onPressed: () {
              HapticFeedback.heavyImpact();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MapScreen()),
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
            padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          ),
          divider(),
          // divider(),
          // divider(),
          // divider(),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              homeIcon(),
              IconButton(
                iconSize: 30,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MapScreen()),
                    // MaterialPageRoute(builder: (context) => Construction()),
                  );
                },
                icon: Icon(Icons.search),
                color: Colors.white,
              ),
              IconButton(
                iconSize: 30,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChatScreen()),
                  );
                },
                icon: Icon(Icons.mark_chat_unread_outlined),
                color: Colors.white,
              ),
              IconButton(
                iconSize: 30,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AccountPage()),
                  );
                },
                icon: Icon(
                  Icons.person,
                ),
                color: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
