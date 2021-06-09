import 'package:flutter/material.dart';

class Construction extends StatelessWidget {
  Widget divider1() {
    return SizedBox(height: 10);
  }

  Widget divider2() {
    return SizedBox(height: 20);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(47, 46, 65, 1),
      body: SafeArea(
        child: Column(
          children: [
            divider2(),
            divider2(),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Oops!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Bold',
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Page under construction',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Bold',
                  ),
                ),
              ),
            ),
            divider1(),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Image(
                  fit: BoxFit.contain,
                  image: AssetImage('assets/images/construction2.png'),
                ),
              ),
            ),
            divider2(),
            divider1(),
            Align(
              alignment: Alignment.center,
              child: Text(
                'We are working on it',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'semi bold',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
