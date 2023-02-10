
import 'package:flutter/material.dart';

import '../../pages/home_page.dart';
import '../../pages/login.page.dart';
import '../Custom/progres_hud.dart';



ProgressHUD2 initializeLoading(String message) {
  return ProgressHUD2(
    backgroundColor: Colors.black12,
    color: Colors.white,
    containerColor: Colors.black87,
    borderRadius: 5.0,
    text: message,
    loading: false,
  );
}

///
/// Function to show a snackbar with a specified message
///
showSnackbarWithMessage(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text(message),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

class DialogUtils {
  static void showAlertAndSendLoginScreen(
    BuildContext context,
    String message,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('FinanceMobile'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
               Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) => const LoginPage(
                   
                  )),
          (route) => false);
            },
            child: const Text('Aceptar'),
          ),
        ],
      ),
    );
  }

   static void showAlertAndSendHomeScreen(
    BuildContext context,
    String message,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('FinanceMobile'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
               Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) => const HomePage(
                   
                  )),
          (route) => false);
            },
            child: const Text('Aceptar'),
          ),
        ],
      ),
    );
  }

  static void showAlertWithCustomActions(
      BuildContext context, String message, List<Widget> actions) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
          title: const Text('FinanceMobile'),
          content: actions.first,
        ),
    );
  }

}