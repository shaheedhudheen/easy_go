import 'package:easy_go/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  AuthService get auth => AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 70,
                ),
                Image(
                  alignment: Alignment.center,
                  height: 100.0,
                  width: 100.0,
                  image: AssetImage('assets/images/logo.png'),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Sign In',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, fontFamily: 'Bold'),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(108, 99, 255, 1),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(50)),
                  ),
                  child: Text(
                    'Log In',
                    style: TextStyle(
                        fontFamily: 'Bold',
                        fontSize: 18,
                        color: Colors.black87),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Dont have an account, sign up here',
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Bold',
                        color: Colors.black87),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                TextButton(
                  onPressed: () async {
                    dynamic result = await auth.signInAnon();
                    if (result == null) {
                      print('Error Signing In');
                    } else {
                      print('signed in');
                      print(result);
                    }
                  },
                  child: Text(
                    'Sign in as Anonymous',
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Bold',
                        color: Colors.black45),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
