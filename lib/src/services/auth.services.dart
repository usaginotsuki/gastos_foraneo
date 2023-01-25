import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer';

import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  FirebaseAuth auth = FirebaseAuth.instance;

  signUpWithEmail(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      log(e.toString());
    }
  }

  loginWithEmail(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      log(e.toString());
    }
  }

  loginWithGoogle() async {
    try {
      await GoogleSignIn().signIn();
    } catch (e) {
      log(e.toString());
    }
  }
}
