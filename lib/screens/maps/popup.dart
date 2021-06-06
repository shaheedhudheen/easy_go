import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';

Widget Popup() {
  return Center(
    child: Container(
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
    ),
  );
  // return new AlertDialog(
  //   title: const Text('Name'),
  //   content: new Column(
  //     mainAxisSize: MainAxisSize.min,
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: <Widget>[
  //       Text("photo\naddress\nopen\nrating\nrating numbers"),
  //     ],
  //   ),
  //   actions: <Widget>[
  //     new FlatButton(
  //       onPressed: () {
  //         Get.back();
  //       },
  //       textColor: Colors.red,
  //       child: const Text('Close'),
  //     ),
  //   ],
  // );
}
