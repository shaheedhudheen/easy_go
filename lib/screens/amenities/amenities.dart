import 'package:flutter/material.dart';
import 'package:easy_go/widgets/amenities/amenitiesTitle.dart';
import 'package:easy_go/widgets/amenities/amenitiesCell.dart';

class Amenities extends StatelessWidget {
  final Widget divider = SizedBox(
    height: 20,
  );

  final String amenitiesName;

  Amenities({this.amenitiesName});

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
            AmenitiesCell(),
            divider,
            AmenitiesCell(),
            divider,
            AmenitiesCell(),
            divider,
            AmenitiesCell(),
            divider,
            AmenitiesCell(),
            divider,
            AmenitiesCell(),
            divider,
            AmenitiesCell(),
            divider,
            AmenitiesCell(),
            divider,
            AmenitiesCell(),
            divider,
            AmenitiesCell(),
          ],
        ),
      ),
    );
  }
}
