import 'package:flutter/material.dart';

class AmenitiesCell extends StatelessWidget {
  final String name;
  final String address;
  // final int rating;
  // final int totalRating;

  AmenitiesCell({
    this.address,
    this.name,
    // this.rating,
    // this.totalRating,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.grey[300],
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      child: Column(
        children: [
          Text(
            name,
            style: TextStyle(
              fontSize: 30,
              color: Colors.black,
            ),
          ),
          Container(
            height: 80,
            width: 80,
            child: Text('no photo available'),
          ),
          Text(
            'Address: ' + address,
          ),
          // Text('Rating:' +
          //     rating.toString() +
          //     '(' +
          //     totalRating.toString() +
          //     ')'),
        ],
      ),
    );
  }
}
