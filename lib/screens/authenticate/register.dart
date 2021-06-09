import 'package:flutter/material.dart';
import 'package:easy_go/services/auth.dart';

class Register extends StatefulWidget {
  // const Register({Key key}) : super(key: key);

  final Function toggleView;

  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService userCredential = AuthService();
  final formKey = GlobalKey<FormState>();
  //Text field state
  String fullName = '';
  String email = '';
  String phone = '';
  String password = '';
  String error = '';
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
                    'Create a Account',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25, fontFamily: 'Bold'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        //full name
                        TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Full Name',
                            labelStyle: TextStyle(
                              fontSize: 14,
                            ),
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 10,
                            ),
                          ),
                          style:
                              TextStyle(fontSize: 14, fontFamily: 'semi bold'),
                          validator: (val) =>
                              val.isEmpty ? 'Enter full name' : null,
                          onChanged: (val) {
                            setState(() => fullName = val);
                          },
                        ),

                        SizedBox(
                          height: 10,
                        ),
                        //Email
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(
                              fontSize: 14,
                            ),
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 10,
                            ),
                          ),
                          style:
                              TextStyle(fontSize: 14, fontFamily: 'semi bold'),
                          validator: (val) =>
                              val.isEmpty ? 'Enter an Email' : null,
                          onChanged: (val) {
                            setState(() => email = val);
                          },
                        ),

                        SizedBox(
                          height: 10,
                        ),

                        //phone
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            labelText: 'Phone Number',
                            labelStyle: TextStyle(
                              fontSize: 14,
                            ),
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 10,
                            ),
                          ),
                          style:
                              TextStyle(fontSize: 14, fontFamily: 'semi bold'),
                          validator: (val) => val.length < 10
                              ? 'Enter a valid phone number'
                              : null,
                          onChanged: (val) {
                            setState(() => phone = val);
                          },
                        ),

                        SizedBox(
                          height: 10,
                        ),

                        //Password
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              fontSize: 14,
                            ),
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 10,
                            ),
                          ),
                          style:
                              TextStyle(fontSize: 14, fontFamily: 'semi bold'),
                          validator: (val) => val.length < 8
                              ? 'Password must be 8 letter or more'
                              : null,
                          onChanged: (val) {
                            setState(() => password = val);
                          },
                        ),
                        SizedBox(
                          height: 40,
                        ),

                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(108, 99, 255, 1),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 15),
                              shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(50)),
                            ),
                            child: Text(
                              'Register',
                              style: TextStyle(
                                  fontFamily: 'Bold',
                                  fontSize: 18,
                                  color: Colors.white),
                            ),
                            onPressed: () async {
                              if (formKey.currentState.validate()) {
                                dynamic result = await userCredential
                                    .registerWithEmailAndPassword(
                                        email, password);
                                if (result == null) {
                                  setState(() =>
                                      error = 'please supply a valid Email');
                                }
                              }
                            }),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          error,
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 14.0,
                              fontFamily: 'Bold'),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        widget.toggleView();
                      },
                      child: Text(
                        'Already have an account? Log in',
                        style: TextStyle(
                            color: Colors.black54, fontFamily: 'semi bold'),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
