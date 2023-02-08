import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'dart:developer' as dev;

import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Widgets/utils/dialog_ulit.dart';
import '../models/user_expenses_model.dart';
import '../models/user_model.dart';

class AuthServices {
  FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  signUpWithEmail(String email, String password, BuildContext context) async {
    try {
      dev.log(email.toString());
      dev.log(password.toString());
      var credential = await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        userSetup(email, value.user!.uid);
        DialogUtils.showAlertAndSendLoginScreen(
            context, "Usuario creado correctamente");
      });
    } catch (e) {
      DialogUtils.showAlertAndSendLoginScreen(
          context, "Error al crear el usuario");
      dev.log(e.toString());
    }
  }

  loginWithEmail(String email, String password, BuildContext context) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        DialogUtils.showAlertAndSendHomeScreen(
            context, "Ha ingresado exitosamente");
      });
    } catch (e) {
      DialogUtils.showAlertAndSendLoginScreen(
          context, "La contraseña o el correo estan incorrectos");
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
//Crud para la creacion de usuario
  Future<void> userSetup(String email, String uid) async {
    Usuario usr = Usuario(correo: email, id: "", name: "", phone: "");
    UsuarioGastos usrgst = UsuarioGastos(
        cleaningAmount: 0,
        foodAmount: 0,
        studyAmount: 0,
        totalAmount: 0,
        transportAmount: 0,
        variousAmount: 0);
    FirebaseFirestore.instance.collection('usuarios').doc(uid).set({
      'user_email': usr.correo,
      'user_id': uid,
      'user_name': usr.name,
      'user_phone': usr.phone,
    });
    FirebaseFirestore.instance
        .collection("usuarios")
        .doc(uid)
        .collection("expenses")
        .doc("exp$uid")
        .set({
      "user_cleaningAmount": usrgst.cleaningAmount,
      "user_foodAmount": usrgst.foodAmount,
      "user_studyAmount": usrgst.studyAmount,
      "user_totalAmount": usrgst.totalAmount,
      "user_transportAmount": usrgst.transportAmount,
      "user_variousAmount": usrgst.variousAmount
    });
    return;
  }
}
