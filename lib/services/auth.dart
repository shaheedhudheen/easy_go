import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  //sign in anonymously

  Future signInAnon() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInAnonymously();
      User user = userCredential.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  
  //sign in with email and password

  //register account

  //sign out

}
