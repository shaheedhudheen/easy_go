import 'package:flutter/material.dart';

Widget homeSearchBar({
  String exampleText,
}) {
  return Padding(
    padding: EdgeInsets.only(left: 30, right: 30),
    child: TextField(
      autofillHints: <String>[AutofillHints.addressCityAndState],
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
        hintText: 'Select Location',
        hintStyle: TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.normal,
          fontStyle: FontStyle.normal,
          fontFamily: 'Regular',
        ),
      ),
    ),
  );
}
