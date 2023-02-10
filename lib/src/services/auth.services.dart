import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'dart:developer' as dev;
import 'package:provider/provider.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Providers/main_provider.dart';
import '../Widgets/utils/dialog_ulit.dart';
import '../models/user_expenses_model.dart';
import '../models/user_model.dart';

class AuthServices {
  FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      //'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

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
    final mainProvider = Provider.of<MainProvider>(context, listen: false);
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
                   mainProvider.token = value.user!.uid;
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
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        dev.log(userCredential.toString());
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          // handle the error here
        } else if (e.code == 'invalid-credential') {
          // handle the error here
        }
      } catch (e) {
        // handle the error here
      }
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
        idexp: "exp"+uid,
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
      "user_idexp": "exp"+uid,
      "user_studyAmount": usrgst.studyAmount,
      "user_totalAmount": usrgst.totalAmount,
      "user_transportAmount": usrgst.transportAmount,
      "user_variousAmount": usrgst.variousAmount
    });
    return;
  }

    Future<void> userNonthReport(String email, String uid) async {
    UsuarioGastos usrgst = UsuarioGastos(
        cleaningAmount: 0,
        foodAmount: 0,
        idexp: "exp"+uid,
        studyAmount: 0,
        totalAmount: 0,
        transportAmount: 0,
        variousAmount: 0);
    FirebaseFirestore.instance
        .collection("usuarios")
        .doc(uid)
        .collection("expenses")
        .doc("exp$uid")
        .set({
      "user_cleaningAmount": usrgst.cleaningAmount,
      "user_foodAmount": usrgst.foodAmount,
      "user_idexp": "exp"+uid,
      "user_studyAmount": usrgst.studyAmount,
      "user_totalAmount": usrgst.totalAmount,
      "user_transportAmount": usrgst.transportAmount,
      "user_variousAmount": usrgst.variousAmount
    });
    return;
  }
}
