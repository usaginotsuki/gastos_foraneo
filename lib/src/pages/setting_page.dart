import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gastos_foraneo/src/Providers/main_provider.dart';
import 'package:gastos_foraneo/src/models/user_model.dart';
import 'package:provider/provider.dart';
import '../Widgets/utils/dialog_ulit.dart';
import '../Widgets/BottomMenu/bottom_menu_widget.dart';
import '../services/auth.services.dart';
import '../../Core/Colors/Hex_Color.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  AuthServices auth = AuthServices();
  CollectionReference cliente =
      FirebaseFirestore.instance.collection('usuarios');
  String type = "";
  TextEditingController controllerTextName = TextEditingController();
  TextEditingController controllerTextEmail = TextEditingController();
  TextEditingController controllerTextPhone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: StreamBuilder(
            stream: cliente
                .where("user_id", isEqualTo: mainProvider.token)
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }

              return Column(
                  children: snapshot.data!.docs.map((usuarios) {
                var usuario =
                    Usuario.fromJson(usuarios.data() as Map<String, dynamic>);
                return Container(
                  child: Card(
                      child: Column(
                    children: [
                      const Padding(padding: EdgeInsets.only(top: 40.0)),
                      Image.asset('assets/usuario3.png'),
                      const Padding(padding: EdgeInsets.only(top: 20.0)),
                      Container(
                        height:
                            MediaQuery.of(context).size.height.round() * 0.08,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: HexColor("#4b4293"),
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              stops: const [0.1, 0.4, 0.7, 0.9],
                              colors: [
                                HexColor("#4b4293").withOpacity(0.1),
                                HexColor("#4b4293").withOpacity(0.1),
                                HexColor("#08418e").withOpacity(0.1),
                                HexColor("#08418e").withOpacity(0.1)
                              ],
                            )),
                        child: ListTile(
                          leading: Icon(Icons.email),
                          title: Text(
                            usuario.correo,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          trailing: IconButton(
                              onPressed: () {
                                type = "email";
                                _alertDialog(type, controllerTextEmail);
                              },
                              icon: Icon(Icons.edit_outlined)),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 20.0)),
                      Container(
                        height:
                            MediaQuery.of(context).size.height.round() * 0.08,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: HexColor("#4b4293"),
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              stops: const [0.1, 0.4, 0.7, 0.9],
                              colors: [
                                HexColor("#4b4293").withOpacity(0.1),
                                HexColor("#4b4293").withOpacity(0.1),
                                HexColor("#08418e").withOpacity(0.1),
                                HexColor("#08418e").withOpacity(0.1)
                              ],
                            )),
                        child: ListTile(
                          leading: Icon(Icons.person),
                          title: Text(
                            usuario.name,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          trailing: IconButton(
                              onPressed: () {
                                type = "nombre";
                                _alertDialog(type, controllerTextName);
                              },
                              icon: Icon(Icons.edit_outlined)),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 20.0)),
                      Container(
                        height:
                            MediaQuery.of(context).size.height.round() * 0.08,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: HexColor("#4b4293"),
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              stops: const [0.1, 0.4, 0.7, 0.9],
                              colors: [
                                HexColor("#4b4293").withOpacity(0.1),
                                HexColor("#4b4293").withOpacity(0.1),
                                HexColor("#08418e").withOpacity(0.1),
                                HexColor("#08418e").withOpacity(0.1)
                              ],
                            )),
                        child: ListTile(
                          leading: Icon(Icons.phone),
                          title: Text(
                            usuario.phone,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          trailing: IconButton(
                              onPressed: () {
                                type = "celular";
                                _alertDialog(type, controllerTextPhone);
                              },
                              icon: Icon(Icons.edit_outlined)),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 40.0)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            height: 45,
                            width: double.infinity,
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
                                  auth.logoutGoogle(context);
                                },
                                icon: const Icon(Icons.logout),
                                label: const Text("Salir Sesion")),
                          ),
                        ),
                      ),
                    ],
                  )),
                );
              }).toList());
            }),
      ),
      bottomNavigationBar: const BottomMenuWidget(selectedIndex: 0),
    );
  }

  _editParamUsr(String type, String newValue) {
    final mainProvider = Provider.of<MainProvider>(context, listen: false);
    cliente.doc(mainProvider.token).update((type == "email")
        ? {
            'user_email': newValue,
          }
        : (type == "nombre")
            ? {
                'user_name': newValue,
              }
            : (type == "celular")
                ? {
                    'user_phone': "+593 " + newValue,
                  }
                : {});
  }

  _alertDialog(String type, TextEditingController controller) {
    DialogUtils.showAlertWithCustomActions(context, "", [
      TextFormField(
        decoration: InputDecoration(labelText: "Escriba el nuevo $type"),
        controller: controller,
        keyboardType: (type == "email")
            ? TextInputType.emailAddress
            : (type == "nombre")
                ? TextInputType.name
                : (type == "celular")
                    ? TextInputType.phone
                    : TextInputType.none,
        onFieldSubmitted: (newValue) {
          setState(() {
            _editParamUsr(type, newValue);
            Navigator.pop(context, 'OK');
          });
        },
      )
    ]);
  }
}
