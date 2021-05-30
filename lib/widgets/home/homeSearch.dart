import 'package:flutter/material.dart';

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                child: Text(
                  'From',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'montserrat bold',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: TextField(
                  keyboardType: TextInputType.text,
                  onChanged: (String textValue) {
                    print('Output: ' + textValue);
                  },
                  onTap: () {
                    print('tap  happened');
                  },
                  enabled: true,
                  maxLines: 1,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    contentPadding: EdgeInsets.all(20),
                    hintText: 'eg.Kochi',
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.normal,
                      fontFamily: 'montserrat',
                    ),
                  ),
                ),
              ),
              SizedBox(
                child: Text(
                  'To',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'montserrat bold',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: TextField(
                  keyboardType: TextInputType.text,
                  onChanged: (String textValue) {
                    print('Output: ' + textValue);
                  },
                  onTap: () {
                    print('tap  happened');
                  },
                  enabled: true,
                  maxLines: 1,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    contentPadding: EdgeInsets.all(20),
                    hintText: 'eg.Thrissur',
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.normal,
                      fontFamily: 'montserrat',
                    ),
                  ),
                ),
              ),
              RaisedButton(
                elevation: 10,
                onPressed: () {
                  print('button pressed');
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
                    fontFamily: 'montserrat bold',
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
                  IconButton(
                    iconSize: 30,
                    onPressed: () {
                      print('icon pressed');
                    },
                    icon: Icon(
                      Icons.person,
                    ),
                    color: Colors.white,
                  ),
                  IconButton(
                    iconSize: 30,
                    onPressed: () {
                      print('icon pressed');
                    },
                    icon: Icon(
                      Icons.bubble_chart,
                    ),
                    color: Colors.white,
                  ),
                  IconButton(
                    iconSize: 30,
                    onPressed: () {
                      print('icon pressed');
                    },
                    icon: Icon(
                      Icons.add,
                    ),
                    color: Colors.white,
                  ),
                  IconButton(
                    iconSize: 30,
                    onPressed: () {
                      print('icon pressed');
                    },
                    icon: Icon(
                      Icons.turned_in,
                    ),
                    color: Colors.white,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
