import 'package:easy_go/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  //Text field state
  String email = '';
  String password = '';
  String error = '';
  final AuthService userCredential = AuthService();
  final formKey = GlobalKey<FormState>();
  AuthService get auth => AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
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
                    style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Bold',
                        color: Colors.black87),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          validator: (val) =>
                              val.isEmpty ? 'Enter an Email' : null,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            // enabledBorder: OutlineInputBorder(
                            //     borderRadius: BorderRadius.circular(30)),
                            // focusedBorder: OutlineInputBorder(
                            //     borderRadius: BorderRadius.circular(30)),
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                            ),
                          ),
                          style:
                              TextStyle(fontSize: 20, fontFamily: 'semi bold'),
                          onChanged: (val) {
                            setState(() => email = val);
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          obscureText: true,
                          validator: (val) => val.length < 8
                              ? 'Password must be 8 letter or more'
                              : null,
                          decoration: InputDecoration(
                            hintText: 'Password',

                            // enabledBorder: OutlineInputBorder(
                            //     borderRadius: BorderRadius.circular(30)),
                            // focusedBorder: OutlineInputBorder(
                            //     borderRadius: BorderRadius.circular(30)),
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'semi bold',
                          ),
                          onChanged: (val) {
                            setState(() => password = val);
                          },
                        ),
                        SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(108, 99, 255, 1),
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(50)),
                    ),
                    child: Text(
                      'Log In',
                      style: TextStyle(
                          fontFamily: 'Bold',
                          fontSize: 18,
                          color: Colors.white),
                    ),
                    onPressed: () async {
                      if (formKey.currentState.validate()) {
                        dynamic result = await userCredential
                            .signInWithEmailAndPassword(email, password);
                        if (result == null) {
                          setState(() => error =
                              'Could not Sign In with Those Credential');
                        }
                      }
                    },
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    error,
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 14.0,
                        fontFamily: 'semi bold'),
                  ),
                  TextButton(
                    child: Text(
                      "Don't have an account, sign up here",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'semi bold',
                          color: Colors.black87),
                    ),
                    onPressed: () {
                      widget.toggleView();
                    },
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextButton(
                    onPressed: () async {
                      dynamic result = await userCredential.signInAnon();
                      if (result == null) {
                        print('Error Signing In');
                      } else {
                        print('signed in');
                        print(result.uid);
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
      ),
    );
  }
}
