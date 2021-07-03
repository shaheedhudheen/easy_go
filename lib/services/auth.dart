import 'package:easy_go/models/user.dart';
import 'package:easy_go/screens/authenticate/register.dart';
import 'package:easy_go/screens/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  //create user obj based on firebaseUser(User)
  Account userFromUser(User user) {
    return user != null ? Account(uid: user.uid) : null;
  }

  //auth change user stream

  Stream<Account> get user {
    return auth
        .authStateChanges()
        // .map((User user) => userFromUser(user));
        .map(userFromUser);
  }

  //sign in anonymously
  Future signInAnon() async {
    try {
      UserCredential credential =
          await FirebaseAuth.instance.signInAnonymously();
      User user = credential.user;
      return userFromUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = userCredential.user;

      return userFromUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register account
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = userCredential.user;

      return userFromUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  //sign out

  Future signOut() async {
    try {
      return await auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
