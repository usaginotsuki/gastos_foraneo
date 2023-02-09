//write a login page in flutter

import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:gastos_foraneo/src/services/auth.services.dart';
import 'dart:developer' as dev;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AuthServices auth = AuthServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio de sesión'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(padding: EdgeInsets.only(top: 20.0)),
              Image.asset('assets/presupuesto7.png'),
              const Padding(padding: EdgeInsets.only(top: 16.0)),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.7,
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).dividerColor,
                      borderRadius: BorderRadius.circular(64.0),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          offset: const Offset(13.0, 13.0),
                          color: const Color.fromARGB(255, 56, 89, 122)
                              .withOpacity(0.3),
                          spreadRadius: 3.0,
                          blurRadius: 20.0,
                        ),
                        const BoxShadow(
                          offset: Offset(-12.0, -12.0),
                          color: Colors.white,
                          spreadRadius: 3.0,
                          blurRadius: 20.0,
                        ),
                      ]),
                  child: SignInButton(
                    Buttons.Google,
                    text: 'Iniciar con Google',
                    onPressed: () {
                      dev.log("Iniciar con Google");
                      auth.loginWithGoogle();
                    },
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 20.0)),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.7,
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).dividerColor,
                      borderRadius: BorderRadius.circular(64.0),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          offset: const Offset(13.0, 13.0),
                          color: const Color.fromARGB(255, 56, 89, 122)
                              .withOpacity(0.3),
                          spreadRadius: 3.0,
                          blurRadius: 20.0,
                        ),
                        const BoxShadow(
                          offset: Offset(-12.0, -12.0),
                          color: Colors.white,
                          spreadRadius: 3.0,
                          blurRadius: 20.0,
                        ),
                      ]),
                  child: SignInButton(
                    Buttons.Email,
                    text: 'Crear cuenta con correo',
                    onPressed: () {
                      emailSignUp(context);
                    },
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 20.0)),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.7,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).dividerColor,
                    borderRadius: BorderRadius.circular(64.0),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        offset: const Offset(13.0, 13.0),
                        color: const Color.fromARGB(255, 56, 89, 122)
                            .withOpacity(0.3),
                        spreadRadius: 3.0,
                        blurRadius: 20.0,
                      ),
                      const BoxShadow(
                        offset: Offset(-12.0, -12.0),
                        color: Colors.white,
                        spreadRadius: 3.0,
                        blurRadius: 20.0,
                      ),
                    ],
                  ),
                  child: SignInButton(
                    Buttons.Email,
                    text: 'Iniciar con correo',
                    onPressed: () {
                      emailSignIn(context);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

emailSignUp(context) {
  final formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  AuthServices auth = AuthServices();

  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Registro',
            textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const Text('Ingresa tu correo y contraseña'),
                      TextFormField(
                        controller: email,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.email),
                          labelText: 'Correo electrónico',
                        ),
                        onChanged: (value) {},
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingresa tu correo';
                          }
                          return null;
                        },
                      ),
                      const Padding(padding: EdgeInsets.only(top: 16.0)),
                      TextFormField(
                        controller: password,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.password),
                          labelText: 'Contraseña',
                        ),
                        onChanged: (value) {},
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingresa tu correo';
                          }
                          return null;
                        },
                      ),
                    ],
                  ))
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  dev.log("Validado");
                  auth.signUpWithEmail(
                      email.text.trim(), password.text.trim(), context);
                }
              },
              child: const Text('Ok'),
            ),
          ],
        );
      });
}

emailSignIn(context) {
  final formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  AuthServices auth = AuthServices();
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Login',
            textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const Text('Ingresa tu correo y contraseña'),
                      TextFormField(
                        controller: email,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.email),
                          labelText: 'Correo electrónico',
                        ),
                        onChanged: (value) {},
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingresa tu correo';
                          }
                          return null;
                        },
                      ),
                      const Padding(padding: EdgeInsets.only(top: 16.0)),
                      TextFormField(
                        controller: password,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.password),
                          labelText: 'Contraseña',
                        ),
                        onChanged: (value) {},
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingresa tu correo';
                          }
                          return null;
                        },
                      ),
                    ],
                  ))
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  dev.log("Validado");
                  auth.loginWithEmail(
                      email.text.trim(), password.text.trim(), context);
                }
              },
              child: const Text('Ok'),
            ),
          ],
        );
      });
}

class NeumorphicButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      height: 300.0,
      decoration: BoxDecoration(
        color: Color(0xFFE6EFFD),
        borderRadius: BorderRadius.circular(64.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: Offset(12.0, 12.0),
            color: Color(0xFFA2B4C6).withOpacity(0.3),
            spreadRadius: 3.0,
            blurRadius: 20.0,
          ),
          BoxShadow(
            offset: Offset(-12.0, -12.0),
            color: Colors.white,
            spreadRadius: 3.0,
            blurRadius: 20.0,
          ),
        ],
      ),
      child: Center(
        child: Icon(
          Icons.favorite_border,
          color: Colors.red[400],
          size: 150.0,
        ),
      ),
    );
  }
}
