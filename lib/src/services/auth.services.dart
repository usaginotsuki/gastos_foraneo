import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'dart:developer' as dev;

import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Widgets/utils/dialog_ulit.dart';
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

  Future<void> userSetup(String displayName) async {
   //firebase auth instance to get uuid of user
   FirebaseAuth auth = FirebaseAuth.instance.currentUser! as FirebaseAuth;
    Usuario usr = Usuario(correo: "",id: "",name: "",phone: ""); 
   //now below I am getting an instance of firebaseiestore then getting the user collection
   //now I am creating the document if not already exist and setting the data.
   FirebaseFirestore.instance.collection('Users').doc(auth.currentUser!.uid).set({
    'a': usr.correo,
    'a': auth.currentUser!.uid,
    'a': usr.name,
    'a': usr.phone,
   }
    
   );

   return;
}
}
