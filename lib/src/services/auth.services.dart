import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'dart:developer' as dev;

import 'package:google_sign_in/google_sign_in.dart';

import '../Widgets/utils/dialog_ulit.dart';

class AuthServices {
  FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  signUpWithEmail(String email, String password, BuildContext context) async {
    try {
      dev.log(email.toString());
      dev.log(password.toString());
      var credential = await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => DialogUtils.showAlertAndSendLoginScreen(
              context, "Usuario creado correctamente"));
    } catch (e) {
      DialogUtils.showAlertAndSendLoginScreen(context, "Error al crear el usuario");
      dev.log(e.toString());
    }
  }

  loginWithEmail(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      dev.log(e.toString());
    }
  }

  loginWithGoogle() async {
    GoogleSignInAccount? auth = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth =
        await _googleSignIn.currentUser!.authentication;

    try {
      dev.log(auth.toString());
    } catch (e) {
      dev.log(e.toString());
    }
  }

  logoutGoogle() async {
    await _googleSignIn.signOut();
  }
}
