import 'package:flutter/material.dart';
import 'package:easy_go/widgets/amenities/amenitiesTitle.dart';
import 'package:easy_go/widgets/amenities/amenitiesCell.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';

class Amenities extends StatelessWidget {
  final Widget divider = SizedBox(
    height: 20,
  );

  final String amenitiesName;
  final String name;
  final String address;
  final num rating;
  final num totalRating;

  Amenities({
    this.amenitiesName,
    this.name,
    this.address,
    this.rating = 0,
    this.totalRating = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: [
            divider,
            Center(
              child: AmenitiesTitle(
                titleName: amenitiesName,
              ),
            ),
            divider,
            AmenitiesCell(
              address: address,
              name: name,
              rating: rating,
              totalRating: totalRating,
            ),
            divider,
            // AmenitiesCell(),
            // divider,
            // AmenitiesCell(),
            // divider,
            // AmenitiesCell(),
            // divider,
            // AmenitiesCell(),
            // divider,
            // AmenitiesCell(),
            // divider,
            // AmenitiesCell(),
            // divider,
            // AmenitiesCell(),
            // divider,
            // AmenitiesCell(),
            // divider,
            // AmenitiesCell(),
            FlatButton(
              onPressed: () {
                Get.back();
              },
              textColor: Colors.red,
              child: const Text('Close'),
            ),
          ],
        ),
      ),
    );
  }
}
