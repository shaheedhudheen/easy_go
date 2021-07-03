import 'package:easy_go/screens/maps/mapScreen.dart';
import 'package:flutter/material.dart';
import 'package:easy_go/screens/amenities/amenities.dart';
import 'package:easy_go/screens/maps/newMap.dart';

class GridMenuButton extends StatelessWidget {
  final String buttonName;
  final String imageName;

  GridMenuButton({
    this.buttonName,
    this.imageName,
  });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        print(buttonName + ' pressed');

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MapScreen()),
          // MaterialPageRoute(
          //     builder: (context) => Amenities(amenitiesName: buttonName)),
        );
        //Navigator.pop(context);
      },
      elevation: 5,
      padding: EdgeInsets.all(10),
      color: Color.fromRGBO(47, 46, 65, 1),
      shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(20),
      ),
      splashColor: Color.fromRGBO(108, 99, 255, 1.0),
      child: Stack(
        children: [
          Align(
            child: Image(
              width: 20,
              height: 20,
              image: AssetImage('assets/images/' + imageName),
            ),
            alignment: Alignment.bottomCenter,
          ),
          Align(
            child: Text(
              buttonName,
              style: TextStyle(
                fontFamily: 'Bold',
                fontSize: 23,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
            alignment: Alignment.topCenter,
          ),
        ],
      ),
    );
  }
}
