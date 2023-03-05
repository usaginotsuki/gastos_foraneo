//write a login page in flutter

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:gastos_foraneo/src/services/auth.services.dart';
import '../../Core/Colors/Hex_Color.dart';
import 'dart:developer' as dev;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

bool _obscureText = true;

class _LoginPageState extends State<LoginPage> {
  //personalizacion colores
  Color backgroundColor = const Color(0xFF1F1A30);
  Color enabled = const Color.fromARGB(255, 63, 56, 89);
  Color enabledtxt = Colors.white;
  Color deaible = Colors.grey;

  //
  AuthServices auth = AuthServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height.round() * 1,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: const [0.1, 0.4, 0.7, 0.9],
                colors: [
                  HexColor("#4b4293").withOpacity(0.8),
                  HexColor("#4b4293"),
                  HexColor("#08418e"),
                  HexColor("#08418e")
                ],
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    HexColor("#fff").withOpacity(0.2), BlendMode.dstATop),
                image: const NetworkImage(
                  'https://cdna.artstation.com/p/assets/images/images/034/757/492/large/jorge-hardt-02112021-minimalist-japanese-mobile-hd.jpg?1613135473',
                ),
              )),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(padding: EdgeInsets.only(top: 110.0)),
                Image.asset('assets/presupuesto11.png'),
                const Padding(padding: EdgeInsets.only(top: 40.0)),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.8,
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
                          color: Color.fromARGB(255, 122, 126, 205),
                          spreadRadius: 3.0,
                          blurRadius: 20.0,
                        ),
                      ],
                    ),
                    child: SignInButton(
                      Buttons.Google,
                      elevation: 2.0,
                      text: 'Iniciar con Google',
                      onPressed: () {
                        dev.log("Iniciar con Google");
                        auth.loginWithGoogle();
                      },
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 20.0)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.8,
                        //height: 45,
                        //width: double.infinity,
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
                                  color: Color.fromARGB(255, 122, 126, 205),
                                  spreadRadius: 3.0,
                                  blurRadius: 20.0,
                                ),
                              ],
                            ),
                            child: ElevatedButton.icon(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty
                                        .resolveWith<Color?>(
                                      (Set<MaterialState> states) {
                                        if (states
                                            .contains(MaterialState.pressed)) {
                                          return Theme.of(context)
                                              .colorScheme
                                              .primary
                                              .withOpacity(0.5);
                                        }
                                        return null; // Use the component's default.
                                      },
                                    ),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                            side: BorderSide(
                                              color: const Color.fromARGB(
                                                  255, 56, 89, 122),
                                            )))),
                                //Agregas la funcion
                                onPressed: () {
                                  emailSignUp(context);
                                },
                                icon: const Icon(Icons.person),
                                label: const Text("Crear cuenta con Correo")))),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 5.0)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.8,
                        //height: 45,
                        //width: double.infinity,
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
                                  color: Color.fromARGB(255, 122, 126, 205),
                                  spreadRadius: 3.0,
                                  blurRadius: 20.0,
                                ),
                              ],
                            ),
                            child: ElevatedButton.icon(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty
                                        .resolveWith<Color?>(
                                      (Set<MaterialState> states) {
                                        if (states
                                            .contains(MaterialState.pressed)) {
                                          return Theme.of(context)
                                              .colorScheme
                                              .primary
                                              .withOpacity(0.5);
                                        }
                                        return null; // Use the component's default.
                                      },
                                    ),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                            side: BorderSide(
                                              color: const Color.fromARGB(
                                                  255, 56, 89, 122),
                                            )))),
                                //Agregas la funcion
                                onPressed: () {
                                  emailSignIn();
                                },
                                icon: const Icon(Icons.login),
                                label: const Text("Ingresar con Correo ")))),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  emailSignIn() {
    final formKey = GlobalKey<FormState>();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();

    AuthServices auth = AuthServices();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).dividerColor,
                borderRadius: BorderRadius.circular(64.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    offset: const Offset(13.0, 13.0),
                    color: Color.fromARGB(255, 225, 220, 229).withOpacity(0.3),
                    spreadRadius: 3.0,
                    blurRadius: 20.0,
                  ),
                  const BoxShadow(
                    offset: Offset(-12.0, -12.0),
                    color: Color.fromARGB(255, 237, 238, 245),
                    spreadRadius: 3.0,
                    blurRadius: 20.0,
                  ),
                ],
              ),
              child: Text(
                'Login',
                textAlign: TextAlign.center,
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
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
                          obscureText: _obscureText,
                          decoration: InputDecoration(
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
          title: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).dividerColor,
              borderRadius: BorderRadius.circular(64.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  offset: const Offset(13.0, 13.0),
                  color: Color.fromARGB(255, 225, 220, 229).withOpacity(0.3),
                  spreadRadius: 3.0,
                  blurRadius: 20.0,
                ),
                const BoxShadow(
                  offset: Offset(-12.0, -12.0),
                  color: Color.fromARGB(255, 237, 238, 245),
                  spreadRadius: 3.0,
                  blurRadius: 20.0,
                ),
              ],
            ),
            child: Text(
              'Registro',
              textAlign: TextAlign.center,
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
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
                          } else if(!EmailValidator.validate(value)){
                            return 'Correo invalido';
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
          title: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).dividerColor,
              borderRadius: BorderRadius.circular(64.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  offset: const Offset(13.0, 13.0),
                  color: Color.fromARGB(255, 225, 220, 229).withOpacity(0.3),
                  spreadRadius: 3.0,
                  blurRadius: 20.0,
                ),
                const BoxShadow(
                  offset: Offset(-12.0, -12.0),
                  color: Color.fromARGB(255, 237, 238, 245),
                  spreadRadius: 3.0,
                  blurRadius: 20.0,
                ),
              ],
            ),
            child: Text(
              'Login',
              textAlign: TextAlign.center,
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
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
                        obscureText: _obscureText,
                        onChanged: (value) {},
                        decoration: InputDecoration(
                            icon: Icon(Icons.password),
                            labelText: 'Contraseña',
                          ),
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
