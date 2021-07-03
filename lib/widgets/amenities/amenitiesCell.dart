import 'package:flutter/material.dart';

class AmenitiesCell extends StatelessWidget {
  final String name;
  final String address;
  final num rating;
  final num totalRating;
  // final String photoid;

  AmenitiesCell({
    this.address = 'no data',
    this.name = 'no data',
    this.rating = 0,
    this.totalRating = 0,
    // this.photoid = 'no data'
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        border: Border.all(
          color: Color.fromRGBO(108, 99, 255, 1.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            name,
            style: TextStyle(
              color: Color.fromRGBO(47, 46, 65, 1),
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Bold',
            ),
          ),

          // Container(
          //   height: 100,
          //   width: MediaQuery.of(context).size.width,
          //   child: Text('no photo available'),
          //   color: Colors.red,
          // ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'Address: ' + address,
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.normal,
                fontFamily: 'semi bold',
              ),
            ),
          ),
          Text(
            'Rating:' +
                rating.toString() +
                '  (' +
                totalRating.toString() +
                ')',
            style: TextStyle(
              color: Colors.black,
              fontSize: 11,
              fontWeight: FontWeight.normal,
              fontFamily: 'semi bold',
            ),
          ),
        ],
      ),
    );
  }
}
